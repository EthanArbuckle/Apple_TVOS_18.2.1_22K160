@interface CLPredictedWalkDistanceServiceCompanion
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isWheelchairMode;
- (CLPredictedWalkDistanceServiceCompanion)init;
- (id).cxx_construct;
- (void)beginService;
- (void)completeActivity:(id)a3 withNextEstimateTime:(double)a4;
- (void)endService;
- (void)onP6MWDActivity:(id)a3;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)receivePredictedWalkDistanceBout:(id)a3;
- (void)scheduleEstimate;
- (void)sendAnalyticsWeeklyEstimate:(CLPredictedWalkDistanceEstimate *)a3 strideCalInfo:(StrideCalInfo *)a4 walkingWorkoutPaceStats:(CLRunningStat *)a5 runningWorkoutPaceStats:(CLRunningStat *)a6 userInfo:(CLBodyMetrics *)a7;
- (void)sendToCoreAnalyticsWeeklyEstimate:(const CLPredictedWalkDistanceEstimateAnalytics *)a3;
- (void)setUpAggregationOnTimer;
@end

@implementation CLPredictedWalkDistanceServiceCompanion

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993B88 != -1) {
    dispatch_once(&qword_101993B88, &stru_101826880);
  }
  return (id)qword_101993B80;
}

- (CLPredictedWalkDistanceServiceCompanion)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPredictedWalkDistanceServiceCompanion;
  return -[CLPredictedWalkDistanceServiceCompanion initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceCompanionProtocol,  &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceCompanionClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_101993B98 != -1) {
    dispatch_once(&qword_101993B98, &stru_1018268A0);
  }
  return byte_101993B90;
}

- (void)beginService
{
  if (qword_1019346C0 != -1) {
    dispatch_once(&qword_1019346C0, &stru_1018268E8);
  }
  objc_super v3 = (os_log_s *)qword_1019346C8;
  if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Starting up CLPredictedWalkDistanceServiceCompanion",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    LOWORD(v48) = 0;
    v46 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "Starting up CLPredictedWalkDistanceServiceCompanion",  &v48,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPredictedWalkDistanceServiceCompanion beginService]", "%s\n", v46);
  }

  LOBYTE(v47) = 0;
  sub_1001B4CA0((unsigned __int8 *)&v47, buf);
  p_fBoutDb = &self->fBoutDb;
  sub_10005F550((uint64_t)&self->fBoutDb, (__int128 *)buf);
  unint64_t v5 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v6 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  v8 = operator new(0x30uLL);
  uint64_t v9 = (uint64_t)v8;
  cntrl = self->fBoutDb.__cntrl_;
  *(void *)buf = p_fBoutDb->__ptr_;
  *(void *)&buf[8] = cntrl;
  if (cntrl)
  {
    v11 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  sub_1001B4E14((uint64_t)v8, (uint64_t *)buf);
  v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v14 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fBoutAggregator, v9);
  v16 = (CLPredictedWalkDistanceEstimator *)operator new(0x20uLL);
  sub_100CC6154((uint64_t)v16);
  value = self->fP6MWDEstimator.__ptr_.__value_;
  self->fP6MWDEstimator.__ptr_.__value_ = v16;
  if (value) {
    operator delete(value);
  }
  LOBYTE(v47) = 0;
  sub_1001B4FF4((unsigned __int8 *)&v47, buf);
  sub_10005F550((uint64_t)&self->fGaitMetricsDb, (__int128 *)buf);
  v18 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v19 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  LOBYTE(v47) = 0;
  sub_1001B50E4((unsigned __int8 *)&v47, buf);
  p_fWalkingSpeedCalDb = &self->fWalkingSpeedCalDb;
  sub_10005F550((uint64_t)&self->fWalkingSpeedCalDb, (__int128 *)buf);
  v22 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v23 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  *(_OWORD *)&self->fUserInfo.gender = xmmword_1012E0280;
  *(_OWORD *)&self->fUserInfo.vo2max = unk_1012E0290;
  *(_OWORD *)&self->fUserInfo.hronset = xmmword_1012E02A0;
  *(_OWORD *)&self->fUserInfo.runVo2max = *(__int128 *)((char *)&xmmword_1012E02A0 + 12);
  -[CLPredictedWalkDistanceServiceCompanion setUpAggregationOnTimer](self, "setUpAggregationOnTimer");
  uint64_t v25 = sub_1006E27E8();
  sub_100413284(v25, &v48);
  uint64_t v47 = 0LL;
  self->fP6MWDPredictionInterval = 604800LL;
  sub_1002A7A0C(v48, "P6MWDPredictionInterval", &self->fP6MWDPredictionInterval);
  sub_100E18F18((uint64_t)sub_1001B1758, (uint64_t)self, self, buf);
  v26 = *(Client **)buf;
  *(void *)buf = 0LL;
  v27 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = v26;
  if (v27)
  {
    (*(void (**)(Client *))(*(void *)v27 + 8LL))(v27);
    uint64_t v28 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v28) {
      (*(void (**)(uint64_t))(*(void *)v28 + 8LL))(v28);
    }
  }

  [*((id *)self->fUserInfoClient.__ptr_.__value_ + 2) register:*((void *)self->fUserInfoClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  id v29 = objc_msgSend( objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "vendor"),  "proxyForService:",  @"CMHealthColdStorageService");
  if (v29)
  {
    v30 = p_fBoutDb->__cntrl_;
    if (p_fBoutDb->__ptr_) {
      uint64_t v31 = (uint64_t)p_fBoutDb->__ptr_ + 72;
    }
    else {
      uint64_t v31 = 0LL;
    }
    *(void *)buf = v31;
    *(void *)&buf[8] = v30;
    if (v30)
    {
      v32 = (unint64_t *)((char *)v30 + 8);
      do
        unint64_t v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }

    v34 = p_fWalkingSpeedCalDb->__cntrl_;
    if (p_fWalkingSpeedCalDb->__ptr_) {
      uint64_t v35 = (uint64_t)p_fWalkingSpeedCalDb->__ptr_ + 72;
    }
    else {
      uint64_t v35 = 0LL;
    }
    uint64_t v51 = v35;
    v52 = v34;
    if (v34)
    {
      v36 = (unint64_t *)((char *)v34 + 8);
      do
        unint64_t v37 = __ldxr(v36);
      while (__stxr(v37 + 1, v36));
    }

    uint64_t v38 = 0LL;
    char v39 = 1;
    do
    {
      char v40 = v39;
      id v41 = +[CLActivityRecorderUtils getDbDetails:]( &OBJC_CLASS___CLActivityRecorderUtils,  "getDbDetails:",  *(void *)&buf[16 * v38]);
      objc_msgSend( v29,  "registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:",  objc_msgSend(v41, "objectForKeyedSubscript:", @"url"),  objc_msgSend(v41, "objectForKeyedSubscript:", @"name"),  1,  0,  0);
      char v39 = 0;
      uint64_t v38 = 1LL;
    }

    while ((v40 & 1) != 0);
    for (uint64_t i = 16LL; i != -16; i -= 16LL)
      sub_10000AE14((uint64_t)&buf[i]);
  }

  v43 = v49;
  if (v49)
  {
    p_shared_owners = (unint64_t *)&v49->__shared_owners_;
    do
      unint64_t v45 = __ldaxr(p_shared_owners);
    while (__stlxr(v45 - 1, p_shared_owners));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }

- (void)endService
{
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0LL;
  }

- (void)scheduleEstimate
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = sub_1006E27E8();
  sub_100413284(v4, &v18);
  double v17 = 0.0;
  sub_1002A82BC(v18, "kP6MWDNextEstimateTime", &v17);
  double v5 = v17;
  if (v17 > Current + 604800.0)
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    v6 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "kP6MWDNextEstimateTime";
      __int16 v28 = 2050;
      double v29 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_1018268E8);
      }
      int v20 = 136446466;
      v21 = "kP6MWDNextEstimateTime";
      __int16 v22 = 2050;
      double v23 = v17;
      v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  16LL,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  &v20,  22);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPredictedWalkDistanceServiceCompanion scheduleEstimate]", "%s\n", v14);
    }

    sub_1002A667C(v18, "kP6MWDNextEstimateTime", 0xFFFFFFFFLL);
    double v17 = 0.0;
    double v5 = 0.0;
  }

  double v7 = v5 - Current;
  else {
    int64_t v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_1019346C0 != -1) {
    dispatch_once(&qword_1019346C0, &stru_1018268E8);
  }
  uint64_t v9 = (os_log_s *)qword_1019346C8;
  if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v27 = "com.apple.locationd.P6MWD";
    __int16 v28 = 2050;
    double v29 = v17;
    __int16 v30 = 2050;
    int64_t v31 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Registering XPC Activity with nextEstimateTime=(%{public}.2f) and delay=(%{public}lld)",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    int v20 = 136446722;
    v21 = "com.apple.locationd.P6MWD";
    __int16 v22 = 2050;
    double v23 = v17;
    __int16 v24 = 2050;
    int64_t v25 = v8;
    LODWORD(v15) = 32;
    v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "%{public}s: Registering XPC Activity with nextEstimateTime=(%{public}.2f) and delay=(%{public}lld)",  &v20,  v15);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPredictedWalkDistanceServiceCompanion scheduleEstimate]", "%s\n", v13);
  }

  xpc_activity_unregister("com.apple.locationd.P6MWD");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001B1C4C;
  handler[3] = &unk_1018268C8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLPredictedWalkDistanceServiceCompanion");
  handler[5] = v8;
  xpc_activity_register("com.apple.locationd.P6MWD", XPC_ACTIVITY_CHECK_IN, handler);
  v10 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

- (void)setUpAggregationOnTimer
{
  int v13 = 86400;
  uint64_t v3 = sub_1006E27E8();
  sub_100413284(v3, &v11);
  sub_1002A7CB0(v11, "P6MWDAggregationTimeInterval", &v13);
  uint64_t v4 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  uint64_t v7 = 1000000000LL * v13;
  int64_t v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CLPredictedWalkDistanceServiceCompanion universe]( self,  "universe"),  "silo"),  "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0LL, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001B2660;
  v10[3] = &unk_10181A288;
  v10[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onP6MWDActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    int64_t v8 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    uint64_t v9 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  16LL,  "Invalid xpc activity.");
LABEL_31:
    unint64_t v12 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPredictedWalkDistanceServiceCompanion onP6MWDActivity:]", "%s\n", v9);
    if (v12 != buf) {
      free(v12);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    uint64_t v7 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Preparing to make weekly 6MWD prediction",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_1018268E8);
      }
      LOWORD(v13) = 0;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "Preparing to make weekly 6MWD prediction",  &v13,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPredictedWalkDistanceServiceCompanion onP6MWDActivity:]", "%s\n", v11);
    }

    -[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:]( self,  "getSixMinuteWalkDistancePrediction:",  a3);
    return;
  }

  if (qword_1019346C0 != -1) {
    dispatch_once(&qword_1019346C0, &stru_1018268E8);
  }
  v10 = (os_log_s *)qword_1019346C8;
  if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    uint64_t v9 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  16LL,  "Unexpected activity state: %ld",  &v13);
    goto LABEL_31;
  }

- (void)completeActivity:(id)a3 withNextEstimateTime:(double)a4
{
  double v15 = a4;
  uint64_t v6 = sub_1006E27E8();
  sub_100413284(v6, buf);
  sub_1002AC7B8(*(uint64_t *)buf, "kP6MWDNextEstimateTime", &v15);
  uint64_t v7 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    int64_t v8 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (!xpc_activity_set_state((xpc_activity_t)a3, 5LL))
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    v10 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_FAULT))
    {
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "com.apple.locationd.P6MWD";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = state;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "Failed to mark %{public}s activity as Done. Current state is %{public}ld",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_1018268E8);
      }
      uint64_t v12 = qword_1019346C8;
      xpc_activity_state_t v13 = xpc_activity_get_state((xpc_activity_t)a3);
      int v16 = 136446466;
      double v17 = "com.apple.locationd.P6MWD";
      __int16 v18 = 2050;
      xpc_activity_state_t v19 = v13;
      v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  17LL,  "Failed to mark %{public}s activity as Done. Current state is %{public}ld",  &v16,  22);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPredictedWalkDistanceServiceCompanion completeActivity:withNextEstimateTime:]",  "%s\n",  v14);
      if (v14 != buf) {
        free(v14);
      }
    }
  }

  -[CLPredictedWalkDistanceServiceCompanion scheduleEstimate](self, "scheduleEstimate");
}

- (void)receivePredictedWalkDistanceBout:(id)a3
{
  if (qword_1019346C0 != -1) {
    dispatch_once(&qword_1019346C0, &stru_1018268E8);
  }
  double v5 = (os_log_s *)qword_1019346C8;
  if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received message in CLPredictedWalkDistanceServiceCompanion",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    LOWORD(v34) = 0;
    double v29 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "Received message in CLPredictedWalkDistanceServiceCompanion",  &v34,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]",  "%s\n",  v29);
  }

  LODWORD(v34) = 0;
  *((void *)&v34 + 1) = 0LL;
  *(void *)&__int128 v35 = 0LL;
  DWORD2(v35) = 0;
  *(void *)&__int128 v37 = 0LL;
  __int128 v36 = 0uLL;
  DWORD2(v37) = 0;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  uint64_t v41 = 0LL;
  [a3 getBytes:&v34 length:120];
  if (qword_1019346C0 != -1) {
    dispatch_once(&qword_1019346C0, &stru_1018268E8);
  }
  uint64_t v6 = (os_log_s *)qword_1019346C8;
  if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    uint64_t v50 = *((void *)&v34 + 1);
    __int16 v51 = 2049;
    uint64_t v52 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received bout from watch...,startTime,%{private}f,endTime,%{private}f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    *(_DWORD *)v42 = 134283777;
    *(void *)&v42[4] = *((void *)&v34 + 1);
    *(_WORD *)&v42[12] = 2049;
    *(void *)&v42[14] = v35;
    LODWORD(v32) = 22;
    __int16 v30 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "Received bout from watch...,startTime,%{private}f,endTime,%{private}f",  v42,  v32);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]",  "%s\n",  v30);
  }

  sub_1001B3964(self->fBoutDb.__ptr_, (uint64_t)&v34, 0LL);
  p_fPendingWatchBouts = &self->fPendingWatchBouts;
  if (DWORD2(v38) == 1)
  {
    int64_t v8 = operator new(0x88uLL);
    __int128 v9 = v39;
    v8[5] = v38;
    v8[6] = v9;
    v8[7] = v40;
    *((void *)v8 + 16) = v41;
    __int128 v10 = v35;
    v8[1] = v34;
    v8[2] = v10;
    __int128 v11 = v37;
    v8[3] = v36;
    v8[4] = v11;
    prev = p_fPendingWatchBouts->__end_.__prev_;
    *(void *)int64_t v8 = p_fPendingWatchBouts->__end_.__prev_;
    *((void *)v8 + 1) = p_fPendingWatchBouts;
    prev[1] = v8;
    p_fPendingWatchBouts->__end_.__prev_ = v8;
    unint64_t v13 = self->fPendingWatchBouts.__size_alloc_.__value_ + 1;
    self->fPendingWatchBouts.__size_alloc_.__value_ = v13;
    if (v13) {
      goto LABEL_15;
    }
  }

  else if (self->fPendingWatchBouts.__size_alloc_.__value_)
  {
LABEL_15:
    while (1)
    {
      next = self->fPendingWatchBouts.__end_.__next_;
      __int128 v15 = next[1];
      __int128 v16 = next[2];
      __int128 v17 = next[4];
      __int128 v43 = next[3];
      __int128 v44 = v17;
      __int128 v18 = next[5];
      __int128 v19 = next[7];
      __int128 v46 = next[6];
      __int128 v47 = v19;
      uint64_t v48 = *((void *)next + 16);
      __int128 v45 = v18;
      ptr = self->fGaitMetricsDb.__ptr_;
      v21 = (char *)ptr + 400;
      BOOL v22 = ptr == 0LL;
      double v23 = self->fWalkingSpeedCalDb.__ptr_;
      uint64_t v24 = v22 ? 0LL : (uint64_t)v21;
      uint64_t v25 = v23 ? (uint64_t)v23 + 352 : 0LL;
      *(_OWORD *)v42 = v15;
      *(_OWORD *)&v42[16] = v16;
      v26 = (uint64_t *)self->fPendingWatchBouts.__end_.__next_;
      uint64_t v27 = *v26;
      *(void *)(v27 + 8) = v26[1];
      *(void *)v26[1] = v27;
      --self->fPendingWatchBouts.__size_alloc_.__value_;
      operator delete(v26);
      if (!self->fPendingWatchBouts.__size_alloc_.__value_) {
        return;
      }
    }

    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    __int16 v28 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Gait Metrics unavailable, likely because device is locked.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_1018268E8);
      }
      v33[0] = 0;
      LODWORD(v32) = 2;
      int64_t v31 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  2LL,  "Gait Metrics unavailable, likely because device is locked.",  v33,  v32);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]",  "%s\n",  v31);
    }
  }

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    uint64_t v7 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "CLPredictedWalkDistanceServiceCompanion: Received user info update",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_1018268E8);
      }
      LOWORD(v16[0]) = 0;
      unint64_t v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  2LL,  "CLPredictedWalkDistanceServiceCompanion: Received user info update",  v16,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceCompanion onUserInfoUpdate:data:]",  "%s\n",  v13);
    }

    __int128 v9 = *((_OWORD *)a4 + 1);
    __int128 v8 = *((_OWORD *)a4 + 2);
    __int128 v10 = *(_OWORD *)a4;
    *(_OWORD *)&self->fUserInfo.runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&self->fUserInfo.vo2max = v9;
    *(_OWORD *)&self->fUserInfo.hronset = v8;
    *(_OWORD *)&self->fUserInfo.gender = v10;
  }

  else
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    __int128 v11 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *a3;
      *(_DWORD *)buf = 67109120;
      int v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Warning Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_1018268E8);
      }
      int v14 = *a3;
      v16[0] = 67109120;
      v16[1] = v14;
      __int128 v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "#Warning Unhandled notification type, %d",  v16);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceCompanion onUserInfoUpdate:data:]",  "%s\n",  v15);
    }
  }

- (void)sendAnalyticsWeeklyEstimate:(CLPredictedWalkDistanceEstimate *)a3 strideCalInfo:(StrideCalInfo *)a4 walkingWorkoutPaceStats:(CLRunningStat *)a5 runningWorkoutPaceStats:(CLRunningStat *)a6 userInfo:(CLBodyMetrics *)a7
{
  if (!objc_opt_class(&OBJC_CLASS___MCProfileConnection)
    || (objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),  "isHealthDataSubmissionAllowed") & 1) == 0)
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_1018268E8);
    }
    uint64_t v7 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_1018268E8);
      }
      v9[0] = 0;
      __int128 v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  2LL,  "Not sending analytics, no IHA permission",  v9,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceCompanion sendAnalyticsWeeklyEstimate:strideCalInfo:walkingWorkoutPaceStats:runn ingWorkoutPaceStats:userInfo:]",  "%s\n",  v8);
    }
  }

- (void)sendToCoreAnalyticsWeeklyEstimate:(const CLPredictedWalkDistanceEstimateAnalytics *)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_101993BB8);
  if ((v3 & 1) == 0)
  {
    uint64_t v6 = a3;
    int v7 = __cxa_guard_acquire(&qword_101993BB8);
    a3 = v6;
    if (v7)
    {
      int v16 = 1119092736;
      *(_OWORD *)unint64_t v13 = xmmword_1012E02BC;
      *(_OWORD *)&v13[16] = unk_1012E02CC;
      __int128 v14 = xmmword_1012E02DC;
      __int128 v15 = unk_1012E02EC;
      sub_1001B4118(&qword_101993BA0, v13, 0x11uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_101993BA0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_101993BB8);
      a3 = v6;
    }
  }

  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&qword_101993BD8);
  if ((v4 & 1) == 0)
  {
    __int128 v8 = a3;
    int v9 = __cxa_guard_acquire(&qword_101993BD8);
    a3 = v8;
    if (v9)
    {
      *(_OWORD *)unint64_t v13 = xmmword_1012E0300;
      *(_OWORD *)&v13[12] = *(__int128 *)((char *)&xmmword_1012E0300 + 12);
      sub_1001B4118(&qword_101993BC0, v13, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_101993BC0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_101993BD8);
      a3 = v8;
    }
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&qword_101993BF8);
  if ((v5 & 1) == 0)
  {
    __int128 v10 = a3;
    int v11 = __cxa_guard_acquire(&qword_101993BF8);
    a3 = v10;
    if (v11)
    {
      *(_OWORD *)unint64_t v13 = xmmword_1012E031C;
      *(_OWORD *)&v13[12] = *(__int128 *)((char *)&xmmword_1012E031C + 12);
      sub_1001B4118(&qword_101993BE0, v13, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_101993BE0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_101993BF8);
      a3 = v10;
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001B41C8;
  v12[3] = &unk_101820718;
  v12[4] = a3;
  AnalyticsSendEventLazy(@"com.apple.CoreMotion.6MWD.WeeklyEstimate", v12);
}

- (BOOL)isWheelchairMode
{
  return self->fUserInfo.condition != 0;
}

- (void).cxx_destruct
{
  value = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  sub_10000AE14((uint64_t)&self->fWalkingSpeedCalDb);
  sub_1001B4C40(&self->fPendingWatchBouts.__end_.__prev_);
  sub_10000AE14((uint64_t)&self->fGaitMetricsDb);
  unsigned __int8 v4 = self->fP6MWDEstimator.__ptr_.__value_;
  self->fP6MWDEstimator.__ptr_.__value_ = 0LL;
  if (v4) {
    operator delete(v4);
  }
  sub_1001B4F90((uint64_t *)&self->fBoutAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fBoutDb);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = (char *)self + 64;
  *((void *)self + 9) = (char *)self + 64;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  return self;
}

@end