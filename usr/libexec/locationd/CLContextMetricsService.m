@interface CLContextMetricsService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLContextMetricsService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)getInitialTransitionStates;
- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4;
- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onVisit:(id)a3;
- (void)onWifiNotification:(const int *)a3 data:(const void *)a4;
- (void)queryForTransitionEvents;
@end

@implementation CLContextMetricsService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101994138 != -1) {
    dispatch_once(&qword_101994138, &stru_1018302C8);
  }
  return (id)qword_101994130;
}

- (CLContextMetricsService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLContextMetricsService;
  return -[CLContextMetricsService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLContextMetricsServiceProtocol,  &OBJC_PROTOCOL___CLContextMetricsServiceClientProtocol);
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101830370);
  }
  objc_super v3 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = 68289026LL;
    __int16 v15 = 2082;
    v16 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cms start service}",  (uint8_t *)&v14,  0x12u);
  }

  self->_dq = (OS_dispatch_queue *)objc_msgSend( objc_msgSend(-[CLContextMetricsService universe](self, "universe"), "silo"),  "queue");
  self->_oq = (NSOperationQueue *)objc_msgSend( objc_msgSend(-[CLContextMetricsService universe](self, "universe"), "silo"),  "operationQueue");
  self->_scanMetrics = -[CLContextScanMetrics initWithStartTime:]( objc_alloc(&OBJC_CLASS___CLContextScanMetrics),  "initWithStartTime:",  CFAbsoluteTimeGetCurrent());
  sub_10034FF34((uint64_t)sub_1002E32D0, (uint64_t)self, self, &v14);
  v4 = (Client *)v14;
  uint64_t v14 = 0LL;
  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = v4;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    uint64_t v6 = v14;
    uint64_t v14 = 0LL;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  objc_msgSend( *((id *)self->_wifiClient.__ptr_.__value_ + 2),  "register:forNotification:registrationInfo:",  *((void *)self->_wifiClient.__ptr_.__value_ + 1),  12,  0,  v14);
  [*((id *)self->_wifiClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  sub_1003CC884((uint64_t)sub_1002E32E0, (uint64_t)self, self, &v14);
  v7 = (Client *)v14;
  uint64_t v14 = 0LL;
  v8 = self->_statusClient.__ptr_.__value_;
  self->_statusClient.__ptr_.__value_ = v7;
  if (v8)
  {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    uint64_t v9 = v14;
    uint64_t v14 = 0LL;
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 8LL))(v9);
    }
  }

  objc_msgSend( *((id *)self->_statusClient.__ptr_.__value_ + 2),  "register:forNotification:registrationInfo:",  *((void *)self->_statusClient.__ptr_.__value_ + 1),  16,  0,  v14);
  sub_10036B3B4((uint64_t)sub_1002E32F0, (uint64_t)self, self, &v14);
  v10 = (Client *)v14;
  uint64_t v14 = 0LL;
  v11 = self->_motionClient.__ptr_.__value_;
  self->_motionClient.__ptr_.__value_ = v10;
  if (v11)
  {
    (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
    uint64_t v12 = v14;
    uint64_t v14 = 0LL;
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 8LL))(v12);
    }
  }

  objc_msgSend( *((id *)self->_motionClient.__ptr_.__value_ + 2),  "register:forNotification:registrationInfo:",  *((void *)self->_motionClient.__ptr_.__value_ + 1),  3,  0,  v14);
  self->_motionActivityManager = objc_alloc_init(&OBJC_CLASS___CMMotionActivityManager);
  v13 = (CLRoutineMonitorServiceProtocol *) objc_msgSend( objc_msgSend( -[CLContextMetricsService universe](self, "universe"),  "vendor"),  "proxyForService:",  @"CLRoutineMonitor");
  self->_routineMonitor = v13;
  -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:]( v13,  "registerDelegate:inSilo:",  self,  objc_msgSend(-[CLContextMetricsService universe](self, "universe"), "silo"));
  -[CLRoutineMonitorServiceProtocol setDelegateEntityName:]( self->_routineMonitor,  "setDelegateEntityName:",  "CLContextMetricsService");
  -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:]( self->_routineMonitor,  "startLeechingVisitsForClient:",  self);
  self->_lastActivityQuery = -1.0;
  -[CLContextMetricsService getInitialTransitionStates](self, "getInitialTransitionStates");
}

- (void)endService
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101830370);
  }
  objc_super v3 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289026;
    v10[1] = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cms end service}",  (uint8_t *)v10,  0x12u);
  }

  value = self->_wifiClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:12];
    unint64_t v5 = self->_wifiClient.__ptr_.__value_;
    self->_wifiClient.__ptr_.__value_ = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  uint64_t v6 = self->_statusClient.__ptr_.__value_;
  if (v6)
  {
    [*((id *)v6 + 2) unregister:*((void *)v6 + 1) forNotification:16];
    v7 = self->_statusClient.__ptr_.__value_;
    self->_statusClient.__ptr_.__value_ = 0LL;
    if (v7) {
      (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    }
  }

  v8 = self->_motionClient.__ptr_.__value_;
  if (v8)
  {
    [*((id *)v8 + 2) unregister:*((void *)v8 + 1) forNotification:3];
    uint64_t v9 = self->_motionClient.__ptr_.__value_;
    self->_motionClient.__ptr_.__value_ = 0LL;
    if (v9) {
      (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
    }
  }

  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:]( self->_routineMonitor,  "stopLeechingVisitsForClient:",  self);
}

- (void)onWifiNotification:(const int *)a3 data:(const void *)a4
{
  int v7 = *a3;
  if (*a3 == 12 && *((_DWORD *)a4 + 35) == 2)
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v10 = *((void *)a4 + 14);
    uint64_t v11 = *((void *)a4 + 15);
    if (v10 != v11)
    {
      double v12 = *(double *)(v10 + 56) + -5.0;
      do
      {
        double v13 = *(double *)(v10 + 56);
        if (vabdd_f64(v12, v13) > 4.0)
        {
          -[NSMutableArray addObject:]( v9,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v13)));
          double v12 = *(double *)(v10 + 56);
        }

        v10 += 88LL;
      }

      while (v10 != v11);
    }

    -[CLContextMetricsService queryForTransitionEvents](self, "queryForTransitionEvents");
    -[CLContextScanMetrics scanEvents:atTime:](self->_scanMetrics, "scanEvents:atTime:", v9, CFAbsoluteTimeGetCurrent());
    int v7 = *a3;
  }

  if (v7 == 6)
  {
    scanMetrics = self->_scanMetrics;
    if (*((_BYTE *)a4 + 96)) {
      BOOL v15 = *((_DWORD *)a4 + 12) <= 0;
    }
    else {
      BOOL v15 = 1;
    }
    uint64_t v16 = !v15;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[CLContextScanMetrics associationEvent:atTime:](scanMetrics, "associationEvent:atTime:", v16, Current);
  }

- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 16)
  {
    -[CLContextMetricsService queryForTransitionEvents](self, "queryForTransitionEvents");
    scanMetrics = self->_scanMetrics;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[CLContextScanMetrics hearbeatEventAtTime:](scanMetrics, "hearbeatEventAtTime:", Current);
  }

- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 3)
  {
    scanMetrics = self->_scanMetrics;
    __int128 v11 = *((_OWORD *)a4 + 7);
    v15[6] = *((_OWORD *)a4 + 6);
    v15[7] = v11;
    uint64_t v16 = *((void *)a4 + 16);
    __int128 v12 = *((_OWORD *)a4 + 3);
    v15[2] = *((_OWORD *)a4 + 2);
    v15[3] = v12;
    __int128 v13 = *((_OWORD *)a4 + 5);
    v15[4] = *((_OWORD *)a4 + 4);
    v15[5] = v13;
    __int128 v14 = *((_OWORD *)a4 + 1);
    v15[0] = *(_OWORD *)a4;
    v15[1] = v14;
    -[CLContextScanMetrics motionEvent:](scanMetrics, "motionEvent:", v15);
  }

- (void)onVisit:(id)a3
{
  if ([a3 hasDepartureDate])
  {
    -[CLContextScanMetrics visitEvent:withFamiliarityIndex:]( self->_scanMetrics,  "visitEvent:withFamiliarityIndex:",  a3,  0LL);
  }

  else
  {
    routineMonitor = self->_routineMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1002E37E0;
    v6[3] = &unk_1018302F0;
    v6[4] = self;
    v6[5] = a3;
    -[CLRoutineMonitorServiceProtocol getFamiliarityIndexForVisit:withReply:]( routineMonitor,  "getFamiliarityIndexForVisit:withReply:",  a3,  v6);
  }

- (void)queryForTransitionEvents
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = Current - self->_lastActivityQuery;
  if (v4 >= 3600.0)
  {
    unint64_t v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  Current + -900.0);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101830370);
    }
    int v7 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      int lastActivityQuery = (int)self->_lastActivityQuery;
      *(_DWORD *)buf = 68290307;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 1026;
      int v19 = (int)v4;
      __int16 v20 = 1026;
      int v21 = lastActivityQuery;
      __int16 v22 = 1026;
      int v23 = (int)Current;
      __int16 v24 = 2113;
      v25 = v5;
      __int16 v26 = 2113;
      v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cms mode query, delta:%{public}d, last:%{public}d, now:%{public}d, from :%{private, location:escape_only}@, to:%{private, location:escape_only}@}",  buf,  0x38u);
    }

    -[CMMotionActivityManager queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:]( self->_motionActivityManager,  "queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:",  1LL,  v5,  v6,  self->_oq,  &stru_101830330);
    uint64_t v9 =  -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  v5,  v6);
    id v10 = objc_alloc(&OBJC_CLASS___RTStoredVisitFetchOptions);
    id v11 =  objc_msgSend( v10,  "initWithAscending:confidence:dateInterval:labelVisit:limit:",  1,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh),  v9,  1,  0);
    routineMonitor = self->_routineMonitor;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E3DA8;
    v13[3] = &unk_10181A2B0;
    v13[4] = self;
    -[CLRoutineMonitorServiceProtocol fetchStoredVisitsWithOptions:withReply:]( routineMonitor,  "fetchStoredVisitsWithOptions:withReply:",  v11,  v13);
    self->_int lastActivityQuery = Current + -900.0;
  }

- (void)getInitialTransitionStates
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101830370);
  }
  double v4 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __int128 v12 = "";
    __int16 v13 = 1026;
    int v14 = (int)Current;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cms mode init query, now:%{public}d}",  buf,  0x18u);
  }

  -[CMMotionActivityManager queryActivityStartingFromDate:toDate:toQueue:withHandler:]( self->_motionActivityManager,  "queryActivityStartingFromDate:toDate:toQueue:withHandler:",  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  Current + -900.0),  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  self->_oq,  &stru_101830350);
  id v5 = objc_alloc(&OBJC_CLASS___RTStoredVisitFetchOptions);
  id v6 =  objc_msgSend( v5,  "initWithAscending:confidence:dateInterval:labelVisit:limit:",  0,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh),  0,  1,  &off_1018D3110);
  routineMonitor = self->_routineMonitor;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002E466C;
  v8[3] = &unk_10181A2B0;
  v8[4] = self;
  -[CLRoutineMonitorServiceProtocol fetchStoredVisitsWithOptions:withReply:]( routineMonitor,  "fetchStoredVisitsWithOptions:withReply:",  v6,  v8);
  self->_int lastActivityQuery = Current;
}

- (void).cxx_destruct
{
  value = self->_motionClient.__ptr_.__value_;
  self->_motionClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  double v4 = self->_statusClient.__ptr_.__value_;
  self->_statusClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  id v5 = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  return self;
}

@end