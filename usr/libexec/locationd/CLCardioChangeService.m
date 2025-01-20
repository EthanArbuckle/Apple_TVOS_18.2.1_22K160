@interface CLCardioChangeService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferral:(id)a3;
- (CLCardioChangeService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)executeCardioChangeEstimation:(id)a3;
- (void)executeDailyAggregateFeatureCompute:(id)a3;
- (void)executeRiskModelFeatureCompute;
- (void)logAnalytics:(EstimateResult *)a3;
- (void)markXpcActivityDone:(id)a3;
- (void)onChangeEstimationActivity:(id)a3;
- (void)onDailyAggregateFeatureComputeActivity:(id)a3;
- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)resetCardioChangeEstimationActivity:(id)a3 withDelay:(int64_t)a4;
- (void)resetWeeklyRiskModuleComputeTime;
- (void)scheduleChangeEstimation;
- (void)scheduleDailyAggregateFeatureCompute;
- (void)scheduleWeeklyRiskModelCompute;
- (void)sendAnalytics;
- (void)sendCoreAnalyticsEvent:(RiskModelFeatureInput *)a3;
- (void)setUpAggregationOnTimer;
@end

@implementation CLCardioChangeService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F438 != -1) {
    dispatch_once(&qword_10199F438, &stru_10188C600);
  }
  return (id)qword_10199F430;
}

- (CLCardioChangeService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCardioChangeService;
  return -[CLCardioChangeService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCardioChangeServiceProtocol,  &OBJC_PROTOCOL___CLCardioChangeServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10199F448 != -1) {
    dispatch_once(&qword_10199F448, &stru_10188C620);
  }
  return byte_10199F440;
}

- (void)beginService
{
  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  objc_super v3 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLCardioChangeService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    v47[0] = 0;
    LODWORD(v46) = 2;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "Starting up CLCardioChangeService",  v47,  v46);
    v45 = (uint8_t *)v44;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService beginService]", "%s\n", v44);
    if (v45 != buf) {
      free(v45);
    }
  }

  HIBYTE(v46) = 0;
  sub_100F15598((unsigned __int8 *)&v46 + 7, buf);
  sub_10005F550((uint64_t)&self->fOutputDb, (__int128 *)buf);
  v4 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    unint64_t v5 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  HIBYTE(v46) = 0;
  sub_100F15688((unsigned __int8 *)&v46 + 7, buf);
  sub_10005F550((uint64_t)&self->fAggregateFeatureDb, (__int128 *)buf);
  v7 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v8 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  v10 = operator new(0x30uLL);
  uint64_t v11 = (uint64_t)v10;
  cntrl = self->fOutputDb.__cntrl_;
  *(void *)buf = self->fOutputDb.__ptr_;
  *(void *)&buf[8] = cntrl;
  if (cntrl)
  {
    v13 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }

  sub_1001B4E14((uint64_t)v10, (uint64_t *)buf);
  v15 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v16 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fChangeAggregator, v11);
  v18 = operator new(0x30uLL);
  uint64_t v19 = (uint64_t)v18;
  v20 = self->fAggregateFeatureDb.__cntrl_;
  *(void *)buf = self->fAggregateFeatureDb.__ptr_;
  *(void *)&buf[8] = v20;
  if (v20)
  {
    v21 = (unint64_t *)((char *)v20 + 8);
    do
      unint64_t v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }

  sub_1001B4E14((uint64_t)v18, (uint64_t *)buf);
  v23 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v24 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fDailyAggregateFeatureAggregator, v19);
  HIBYTE(v46) = 0;
  sub_100305760((unsigned __int8 *)&v46 + 7, buf);
  sub_10005F550((uint64_t)&self->fVO2MaxOutputDb, (__int128 *)buf);
  v26 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v27 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }

  HIBYTE(v46) = 0;
  sub_1002779A8((unsigned __int8 *)&v46 + 7, buf);
  sub_10005F550((uint64_t)&self->fHRRecoverySessionDb, (__int128 *)buf);
  v29 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v30 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  sub_100F0F41C( (uint64_t *)&self->fOutputDb,  (uint64_t *)&self->fAggregateFeatureDb,  &self->fVO2MaxOutputDb.__ptr_,  &self->fHRRecoverySessionDb.__ptr_,  buf);
  v32 = *(CLCardioChangeEstimator **)buf;
  *(void *)buf = 0LL;
  value = self->fCardioChangeEstimator.__ptr_.__value_;
  self->fCardioChangeEstimator.__ptr_.__value_ = v32;
  if (value)
  {
    sub_100F15778((uint64_t)&self->fCardioChangeEstimator, (uint64_t)value);
    uint64_t v34 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v34) {
      sub_100F15778((uint64_t)buf, v34);
    }
  }

  v35 = operator new(0x68uLL);
  sub_1001ABEA0((uint64_t)v35);
  sub_100F157BC((uint64_t *)&self->fHKQueryDelegate, (uint64_t)v35);
  -[CLCardioChangeService setUpAggregationOnTimer](self, "setUpAggregationOnTimer");
  sub_100E18F18((uint64_t)sub_100F0F634, (uint64_t)self, self, buf);
  v36 = *(Client **)buf;
  *(void *)buf = 0LL;
  v37 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = v36;
  if (v37)
  {
    (*(void (**)(Client *))(*(void *)v37 + 8LL))(v37);
    uint64_t v38 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v38) {
      (*(void (**)(uint64_t))(*(void *)v38 + 8LL))(v38);
    }
  }

  [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) register:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  self->fStats.biologicalSex = 0;
  __asm { FMOV            V0.2S, #-1.0 }

  *(void *)&self->fStats.age = _D0;
  self->fStats.betaBlockerUse = 0;
  *(void *)&self->fStats.status = 0xFFFFFFFFLL;
  self->fStats.vo2Max = -1;
  *(void *)&self->fStats.minConfidenceRatio = 0LL;
  *(void *)&self->fStats.likelihoodRatio = 0LL;
  self->fStats.numClustersContributed = 0;
  -[CLCardioChangeService scheduleChangeEstimation](self, "scheduleChangeEstimation");
  -[CLCardioChangeService scheduleDailyAggregateFeatureCompute](self, "scheduleDailyAggregateFeatureCompute");
  -[CLCardioChangeService scheduleWeeklyRiskModelCompute](self, "scheduleWeeklyRiskModelCompute");
}

- (void)endService
{
  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  v2 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Shutting down CLCardioChangeService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    v5[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "Shutting down CLCardioChangeService",  v5,  2);
    v4 = (uint8_t *)v3;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService endService]", "%s\n", v3);
    if (v4 != buf) {
      free(v4);
    }
  }

- (void)setUpAggregationOnTimer
{
  int v13 = 86400;
  uint64_t v3 = sub_1006E27E8();
  sub_100413284(v3, &v11);
  sub_1002A7CB0(v11, "CardioChangeAggregationTimeInterval", &v13);
  v4 = v12;
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
  v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CLCardioChangeService universe](self, "universe"),  "silo"),  "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0LL, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100F0FEA8;
  v10[3] = &unk_10181A288;
  v10[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    sub_100FBB314((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (__int128 *)a4);
    self->fStats.biologicalSex = *((_DWORD *)a4 + 1);
    self->fStats.age = *((float *)a4 + 5);
    self->fStats.betaBlockerUse = *((_BYTE *)a4 + 48);
    float v7 = *((float *)a4 + 3);
    if (v7 != 0.0)
    {
      float v8 = *((float *)a4 + 2);
      if (v8 != 0.0) {
        self->fStats.userBMI = v7 / (float)(v8 * v8);
      }
    }
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    unint64_t v9 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_ERROR))
    {
      int v10 = *a3;
      *(_DWORD *)buf = 67109120;
      int v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "CLCardioChangeService: Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      int v11 = *a3;
      v14[0] = 67109120;
      v14[1] = v11;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  16LL,  "CLCardioChangeService: Unhandled notification type, %d",  v14);
      int v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCardioChangeService onNatalimetryNotification:data:]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }
  }

- (void)onChangeEstimationActivity:(id)a3
{
  if (!a3)
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    float v8 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  16LL,  "Invalid xpc activity.");
LABEL_31:
    int v13 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCardioChangeService onChangeEstimationActivity:]", "%s\n", v9);
    if (v13 != buf) {
      free(v13);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    float v7 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Preparing to execute CardioChangeEstimation",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      LOWORD(v14) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "Preparing to execute CardioChangeEstimation",  &v14,  2);
      v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService onChangeEstimationActivity:]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    -[CLCardioChangeService executeCardioChangeEstimation:](self, "executeCardioChangeEstimation:", a3);
    return;
  }

  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  int v10 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unexpected CardioChangeEstimation activity state: %ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  16LL,  "Unexpected CardioChangeEstimation activity state: %ld",  &v14);
    goto LABEL_31;
  }

- (void)scheduleChangeEstimation
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v18 = 0.0;
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A82BC(v4, "CardioChangeNextEstimationTime", &v18);
  double v5 = v18;
  sub_10120AA44(buf, "CardioChangeActivityInterval", &XPC_ACTIVITY_INTERVAL_7_DAYS, 0);
  if (v5 <= Current + (double)*(uint64_t *)&v26[4])
  {
    double v8 = v18;
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    xpc_activity_state_t v6 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v26 = "CardioChangeNextEstimationTime";
      *(_WORD *)&v26[8] = 2050;
      *(double *)&v26[10] = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      int v19 = 136446466;
      v20 = "CardioChangeNextEstimationTime";
      __int16 v21 = 2050;
      double v22 = v18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  16LL,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  &v19,  22);
      v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCardioChangeService scheduleChangeEstimation]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    uint64_t v7 = sub_1002F8DDC();
    sub_1002A667C(v7, "CardioChangeNextEstimationTime", 0xFFFFFFFFLL);
    double v18 = 0.0;
    double v8 = 0.0;
  }

  double v9 = v8 - Current;
  else {
    int64_t v10 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  int v11 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)v26 = "com.apple.locationd.CardioChange.Processing";
    *(_WORD *)&v26[8] = 2050;
    *(double *)&v26[10] = v18;
    __int16 v27 = 2050;
    int64_t v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Registering XPC Activity with nextEstimationTime=(%{public}.2f) and delay=(%{public}lld)",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    int v19 = 136446722;
    v20 = "com.apple.locationd.CardioChange.Processing";
    __int16 v21 = 2050;
    double v22 = v18;
    __int16 v23 = 2050;
    int64_t v24 = v10;
    LODWORD(v16) = 32;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "%{public}s: Registering XPC Activity with nextEstimationTime=(%{public}.2f) and delay=(%{public}lld)",  &v19,  v16);
    int v13 = (uint8_t *)v12;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService scheduleChangeEstimation]", "%s\n", v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  xpc_activity_unregister("com.apple.locationd.CardioChange.Processing");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100F115B0;
  handler[3] = &unk_1018268C8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLCardioChangeService");
  handler[5] = v10;
  xpc_activity_register("com.apple.locationd.CardioChange.Processing", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)executeCardioChangeEstimation:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  double v5 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v15 = Current + -7776000.0;
    __int16 v16 = 2048;
    double v17 = Current;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "executeCardioChangeEstimation - startTime %f, endTime %f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    int v10 = 134218240;
    double v11 = Current + -7776000.0;
    __int16 v12 = 2048;
    double v13 = Current;
    LODWORD(v9) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  2LL,  "executeCardioChangeEstimation - startTime %f, endTime %f",  COERCE_DOUBLE(&v10),  v9);
    double v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService executeCardioChangeEstimation:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  value = self->fHKQueryDelegate.__ptr_.__value_;
  objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "silo");
  nullsub_10(value);
}

- (void)resetCardioChangeEstimationActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  double v11 = v6;
  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  uint64_t v7 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v17 = "CardioChangeNextEstimationTime";
    __int16 v18 = 2050;
    double v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Resetting next activity time to: %{public}.1f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    int v12 = 136446466;
    double v13 = "CardioChangeNextEstimationTime";
    __int16 v14 = 2050;
    double v15 = v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "%{public}s: Resetting next activity time to: %{public}.1f",  &v12,  22);
    int v10 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCardioChangeService resetCardioChangeEstimationActivity:withDelay:]",  "%s\n",  v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  uint64_t v8 = sub_1002F8DDC();
  sub_1002AC7B8(v8, "CardioChangeNextEstimationTime", &v11);
  -[CLCardioChangeService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
  -[CLCardioChangeService scheduleChangeEstimation](self, "scheduleChangeEstimation");
}

- (void)markXpcActivityDone:(id)a3
{
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5LL))
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    uint64_t v4 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "Failed to mark activity as done. Current state is %{public}ld",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      uint64_t v5 = qword_101934768;
      int v8 = 134349056;
      xpc_activity_state_t v9 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v5,  17LL,  "Failed to mark activity as done. Current state is %{public}ld",  &v8,  12);
      uint64_t v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCardioChangeService markXpcActivityDone:]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

- (void)scheduleDailyAggregateFeatureCompute
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  sub_10120AA44(v5, "DailyAggregateFeatureComputeIntervalTime", &XPC_ACTIVITY_INTERVAL_1_DAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100F128B4;
  v4[3] = &unk_101831AF8;
  v4[4] = objc_msgSend( objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLCardioChangeService");
  xpc_activity_register("com.apple.locationd.CardioChange.DailyAggregateFeatureCompute", v3, v4);
  xpc_release(v3);
}

- (void)scheduleWeeklyRiskModelCompute
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v9 = 0.0;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A82BC(v3, "WeeklyRiskModelEstimationTime", &v9);
  if (v9 == 0.0)
  {
    double v9 = floor(Current / 86400.0) * 86400.0 + 604800.0;
    uint64_t v4 = sub_1002F8DDC();
    sub_1002AC7B8(v4, "WeeklyRiskModelEstimationTime", &v9);
    uint64_t v5 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v5 + 944LL))(v5);
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    double v6 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Weekly Risk Model Estimation time already set, %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      int v10 = 134217984;
      double v11 = v9;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  2LL,  "Weekly Risk Model Estimation time already set, %f",  COERCE_DOUBLE(&v10));
      int v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService scheduleWeeklyRiskModelCompute]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

- (void)resetWeeklyRiskModuleComputeTime
{
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A667C(v2, "WeeklyRiskModelEstimationTime", 0xFFFFFFFFLL);
}

- (void)onDailyAggregateFeatureComputeActivity:(id)a3
{
  if (!a3)
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    int v8 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v16 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Invalid xpc activity, expecting (%s).",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  16LL,  "Invalid xpc activity, expecting (%s).",  &v14);
LABEL_32:
    double v13 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLCardioChangeService onDailyAggregateFeatureComputeActivity:]",  "%s\n",  v9);
    if (v13 != buf) {
      free(v13);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (double v6 = (const char *)state, state == 2))
  {
    if (!-[CLCardioChangeService checkDeferral:](self, "checkDeferral:", a3))
    {
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      uint64_t v7 = (os_log_s *)qword_101934768;
      if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Preparing to execute DailyAggregateFeatureCompute",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        LOWORD(v14) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "Preparing to execute DailyAggregateFeatureCompute",  &v14,  2);
        int v12 = (uint8_t *)v11;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCardioChangeService onDailyAggregateFeatureComputeActivity:]",  "%s\n",  v11);
        if (v12 != buf) {
          free(v12);
        }
      }

      -[CLCardioChangeService executeDailyAggregateFeatureCompute:](self, "executeDailyAggregateFeatureCompute:", a3);
    }

    return;
  }

  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  int v10 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unexpected DailyAggregateFeatureCompute activity state: %ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  16LL,  "Unexpected DailyAggregateFeatureCompute activity state: %ld",  &v14);
    goto LABEL_32;
  }

- (void)executeDailyAggregateFeatureCompute:(id)a3
{
  uint64_t v17 = 0LL;
  double v18 = 0.0;
  int v19 = -1;
  uint64_t v20 = 0LL;
  uint64_t v5 = 0LL;
  double v6 = floor(CFAbsoluteTimeGetCurrent() / 86400.0) * 86400.0;
  double v15 = 0LL;
  uint64_t v16 = 0LL;
  __int128 v14 = (uint64_t *)&v15;
  do
  {
    v13[0] = dword_101364C00[v5];
    if (sub_10024DA50((uint64_t)self->fAggregateFeatureDb.__ptr_, (uint64_t)&v17, v13[0]) == 100)
    {
      double v7 = v18;
      *(void *)buf = v13;
      if (v18 <= 0.0) {
        *((double *)sub_10000C858(&v14, v13, (uint64_t)&unk_1012CF090, (_DWORD **)buf) + 5) = v6 + -7776000.0;
      }
      else {
        *((double *)sub_10000C858(&v14, v13, (uint64_t)&unk_1012CF090, (_DWORD **)buf) + 5) = v7 + 86400.0;
      }
    }

    ++v5;
  }

  while (v5 != 8);
  if (v16 == 8)
  {
    int64_t value = self->fCardioChangeEstimator.__ptr_.__value_;
    sub_100F15C0C((uint64_t *)v12, (uint64_t)&v14);
    sub_100FBB5AC((uint64_t)value, v12, v6);
    sub_100008390((uint64_t)v12, v12[1]);
    -[CLCardioChangeService executeRiskModelFeatureCompute](self, "executeRiskModelFeatureCompute");
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    double v9 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to get startTimes for all aggregate features",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      LOWORD(v13[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  16LL,  "Failed to get startTimes for all aggregate features",  v13,  2);
      double v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLCardioChangeService executeDailyAggregateFeatureCompute:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

  -[CLCardioChangeService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
  sub_100008390((uint64_t)&v14, v15);
}

- (void)executeRiskModelFeatureCompute
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v30 = 0.0;
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A82BC(v4, "WeeklyRiskModelEstimationTime", &v30);
  if (v30 <= 0.0 || v30 > Current)
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    double v6 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v48 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Weekly risk model estimation scheduled to run at %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      int v31 = 134217984;
      double v32 = v30;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  1LL,  "Weekly risk model estimation scheduled to run at %f",  COERCE_DOUBLE(&v31));
      int v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    double v9 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v48 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Running risk model compute, estimationTime, %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      int v31 = 134217984;
      double v32 = v30;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  1LL,  "Running risk model compute, estimationTime, %f",  COERCE_DOUBLE(&v31));
      double v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    uint64_t v29 = 0LL;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    if (sub_100FBC598((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (uint64_t)&v25))
    {
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      int v10 = (os_log_s *)qword_101934768;
      if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219776;
        double v48 = *((double *)&v25 + 1);
        __int16 v49 = 2048;
        uint64_t v50 = v26;
        __int16 v51 = 2048;
        uint64_t v52 = *((void *)&v26 + 1);
        __int16 v53 = 2048;
        uint64_t v54 = v27;
        __int16 v55 = 2048;
        uint64_t v56 = *((void *)&v27 + 1);
        __int16 v57 = 2048;
        uint64_t v58 = v28;
        __int16 v59 = 2048;
        uint64_t v60 = *((void *)&v28 + 1);
        __int16 v61 = 2048;
        uint64_t v62 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Risk Model input features, sessionVo2maxDailyMean_Window0to90_Mean,%.2f, sessionHRRecovery_DailyMean_Window0to 90_Mean,%.2f, heartRateDailyMax_Window0To90_Mean,%.2f, sixMinuteWalkDistanceDailyMean_Window0To90_Mean,%.2f,wa lkingHeartRateAverageDailyMean_Window0To90_Mean, %.2f,walkingSpeedNormLegLengthDailyMax_Window0to90_Mean,%.2f, stairAscentSpeedDailyMean_Window0to90_Mean,%.2f, stairDescentSpeedDailyMean_Window0to90_Mean,%.2f",  buf,  0x52u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        int v31 = 134219776;
        double v32 = *((double *)&v25 + 1);
        __int16 v33 = 2048;
        uint64_t v34 = v26;
        __int16 v35 = 2048;
        uint64_t v36 = *((void *)&v26 + 1);
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2048;
        uint64_t v40 = *((void *)&v27 + 1);
        __int16 v41 = 2048;
        uint64_t v42 = v28;
        __int16 v43 = 2048;
        uint64_t v44 = *((void *)&v28 + 1);
        __int16 v45 = 2048;
        uint64_t v46 = v29;
        LODWORD(v18) = 82;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  1LL,  "Risk Model input features, sessionVo2maxDailyMean_Window0to90_Mean,%.2f, sessionHRRecovery_DailyMean_Window0to 90_Mean,%.2f, heartRateDailyMax_Window0To90_Mean,%.2f, sixMinuteWalkDistanceDailyMean_Window0To90_Mean,%.2f,wa lkingHeartRateAverageDailyMean_Window0To90_Mean, %.2f,walkingSpeedNormLegLengthDailyMax_Window0to90_Mean,%.2f, stairAscentSpeedDailyMean_Window0to90_Mean,%.2f, stairDescentSpeedDailyMean_Window0to90_Mean,%.2f",  COERCE_DOUBLE(&v31),  v18,  v19[0],  v19[1],  *(double *)&v20,  *((double *)&v20 + 1),  *(double *)&v21,  *((double *)&v21 + 1));
        double v15 = (uint8_t *)v14;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v14);
        if (v15 != buf) {
          free(v15);
        }
      }

      __int128 v22 = v27;
      __int128 v23 = v28;
      uint64_t v24 = v29;
      __int128 v20 = v25;
      __int128 v21 = v26;
      -[CLCardioChangeService sendCoreAnalyticsEvent:](self, "sendCoreAnalyticsEvent:", &v20);
      sub_100FBCBC0((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (double *)&v25, (uint64_t)&v31);
      sub_100FBCA70((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (uint64_t)&v25);
      if (*(_DWORD *)((char *)&v34 + 2) == 1)
      {
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        double v11 = (os_log_s *)qword_101934768;
        if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CLCardioChangeService: Change detected. Firing alarm and notifying watch.",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934760 != -1) {
            dispatch_once(&qword_101934760, &stru_10188C710);
          }
          LOWORD(v19[0]) = 0;
          LODWORD(v18) = 2;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "CLCardioChangeService: Change detected. Firing alarm and notifying watch.",  v19,  *(void *)&v18);
          uint64_t v17 = (uint8_t *)v16;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v16);
          if (v17 != buf) {
            free(v17);
          }
        }

        objc_msgSend( objc_msgSend( objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLCompanionNotifier"),  "doAsync:",  &stru_10188C6B0);
      }

      -[CLCardioChangeService resetWeeklyRiskModuleComputeTime](self, "resetWeeklyRiskModuleComputeTime");
      -[CLCardioChangeService scheduleWeeklyRiskModelCompute](self, "scheduleWeeklyRiskModelCompute");
    }
  }

- (BOOL)checkDeferral:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      uint64_t v5 = (os_log_s *)qword_101934768;
      if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        __int128 v21 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[Service] Cancelling (%{public}s) early due to deferral.",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        int v18 = 136446210;
        int v19 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  1LL,  "[Service] Cancelling (%{public}s) early due to deferral.",  &v18,  12);
        int v12 = (uint8_t *)v11;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService checkDeferral:]", "%s\n", v11);
        if (v12 != buf) {
          free(v12);
        }
      }

      if (xpc_activity_set_state((xpc_activity_t)a3, 3LL))
      {
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        double v6 = (os_log_s *)qword_101934768;
        if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Service] Activity deferred", buf, 2u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  1LL,  "[Service] Activity deferred",  &v18,  v17);
        int v8 = (uint8_t *)v7;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService checkDeferral:]", "%s\n", v7);
        if (v8 == buf) {
          goto LABEL_24;
        }
      }

      else
      {
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        double v9 = (os_log_s *)qword_101934768;
        if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          __int128 v21 = (const char *)state;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "[Service] Failed to defer activity. Current state is %{public}ld",  buf,  0xCu);
        }

        if (!sub_1002921D0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_101934760 != -1) {
          dispatch_once(&qword_101934760, &stru_10188C710);
        }
        uint64_t v13 = qword_101934768;
        xpc_activity_state_t v14 = xpc_activity_get_state((xpc_activity_t)a3);
        int v18 = 134349056;
        int v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  17LL,  "[Service] Failed to defer activity. Current state is %{public}ld",  &v18,  v17);
        int v8 = (uint8_t *)v15;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCardioChangeService checkDeferral:]", "%s\n", v15);
        if (v8 == buf) {
          goto LABEL_24;
        }
      }

      free(v8);
LABEL_24:
      LOBYTE(should_defer) = 1;
    }
  }

  else
  {
    LOBYTE(should_defer) = 0;
  }

  return should_defer;
}

- (void)logAnalytics:(EstimateResult *)a3
{
  uint64_t v87 = 0LL;
  uint64_t v89 = 0LL;
  uint64_t v90 = 0LL;
  uint64_t v91 = 0LL;
  uint64_t v5 = sub_100D74AD8();
  if ((sub_100D75394(v5, &v86) & 1) != 0)
  {
    int v6 = llround(v88);
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    double v7 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CardioChange, unable to access DB due to device lock.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      LOWORD(v38) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  0LL,  "CardioChange, unable to access DB due to device lock.",  &v38,  2);
      __int16 v37 = (uint8_t *)v36;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService logAnalytics:]", "%s\n", v36);
      if (v37 != buf) {
        free(v37);
      }
    }

    int v6 = -1;
  }

  p_fStats = &self->fStats;
  self->fStats.int vo2Max = v6;
  self->fStats.int status = a3->var2;
  if (qword_101934760 != -1) {
    dispatch_once(&qword_101934760, &stru_10188C710);
  }
  double v9 = (os_log_s *)qword_101934768;
  if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEBUG))
  {
    double age = self->fStats.age;
    int biologicalSex = p_fStats->biologicalSex;
    BOOL betaBlockerUse = self->fStats.betaBlockerUse;
    double userBMI = self->fStats.userBMI;
    int status = self->fStats.status;
    double meanVO2MaxFromClusters = self->fStats.meanVO2MaxFromClusters;
    double likelihoodRatio = self->fStats.likelihoodRatio;
    double maxAcceptedChange = self->fStats.maxAcceptedChange;
    double minConfidenceRatio = self->fStats.minConfidenceRatio;
    int numClustersContributed = self->fStats.numClustersContributed;
    double slope = self->fStats.slope;
    int vo2Max = self->fStats.vo2Max;
    *(_DWORD *)buf = 134220800;
    double v63 = age;
    __int16 v64 = 1024;
    int v65 = biologicalSex;
    __int16 v66 = 1024;
    BOOL v67 = betaBlockerUse;
    __int16 v68 = 2048;
    double v69 = userBMI;
    __int16 v70 = 1024;
    int v71 = status;
    __int16 v72 = 2048;
    double v73 = meanVO2MaxFromClusters;
    __int16 v74 = 2048;
    double v75 = likelihoodRatio;
    __int16 v76 = 2048;
    double v77 = maxAcceptedChange;
    __int16 v78 = 2048;
    double v79 = minConfidenceRatio;
    __int16 v80 = 1024;
    int v81 = numClustersContributed;
    __int16 v82 = 2048;
    double v83 = slope;
    __int16 v84 = 1024;
    int v85 = vo2Max;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "CardioChange Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,status,%d,avgFromClustersVO2Max,%. 2f,likelihoodRatio,%.2f,maxAcceptedChange,%.2f,minConfidenceRatio,%.2f,numClustersContributed,%d,slope,%.2f,vo2Max,%d",  buf,  0x66u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    double v22 = self->fStats.age;
    int v23 = p_fStats->biologicalSex;
    BOOL v24 = self->fStats.betaBlockerUse;
    double v25 = self->fStats.userBMI;
    int v26 = self->fStats.status;
    double v27 = self->fStats.meanVO2MaxFromClusters;
    double v28 = self->fStats.likelihoodRatio;
    double v29 = self->fStats.maxAcceptedChange;
    double v30 = self->fStats.minConfidenceRatio;
    int v31 = self->fStats.numClustersContributed;
    double v32 = self->fStats.slope;
    int v33 = self->fStats.vo2Max;
    int v38 = 134220800;
    double v39 = v22;
    __int16 v40 = 1024;
    int v41 = v23;
    __int16 v42 = 1024;
    BOOL v43 = v24;
    __int16 v44 = 2048;
    double v45 = v25;
    __int16 v46 = 1024;
    int v47 = v26;
    __int16 v48 = 2048;
    double v49 = v27;
    __int16 v50 = 2048;
    double v51 = v28;
    __int16 v52 = 2048;
    double v53 = v29;
    __int16 v54 = 2048;
    double v55 = v30;
    __int16 v56 = 1024;
    int v57 = v31;
    __int16 v58 = 2048;
    double v59 = v32;
    __int16 v60 = 1024;
    int v61 = v33;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  2LL,  "CardioChange Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,status,%d,avgFromClustersVO2Max,%. 2f,likelihoodRatio,%.2f,maxAcceptedChange,%.2f,minConfidenceRatio,%.2f,numClustersContributed,%d,slope,%.2f,vo2Max,%d",  COERCE_DOUBLE(&v38),  102);
    __int16 v35 = (uint8_t *)v34;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService logAnalytics:]", "%s\n", v34);
    if (v35 != buf) {
      free(v35);
    }
  }

  -[CLCardioChangeService sendAnalytics](self, "sendAnalytics");
}

- (void)sendAnalytics
{
  *(void *)&double v3 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v4
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v3),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&qword_10199F468);
    if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_10199F468))
    {
      int v16 = 1118961664;
      *(_OWORD *)buf = xmmword_101364C20;
      __int128 v15 = unk_101364C30;
      sub_1001B4118(&qword_10199F450, buf, 9uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199F450, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199F468);
    }

    unsigned __int8 v6 = atomic_load((unsigned __int8 *)&qword_10199F488);
    if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_10199F488))
    {
      LODWORD(v15) = 1108056474;
      *(_OWORD *)buf = xmmword_101364C44;
      sub_1001B4118(&qword_10199F470, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199F470, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199F488);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100F14990;
    v12[3] = &unk_101820740;
    v12[4] = self;
    AnalyticsSendEventLazy(@"com.apple.com.apple.CoreMotion.CardioChangeEstimate", v12);
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    double v7 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "CardioChange, sent Core Analytics event.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  1LL,  "CardioChange, sent Core Analytics event.",  v13,  2);
      double v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService sendAnalytics]", "%s\n", v8);
LABEL_22:
      if (v9 != buf) {
        free(v9);
      }
    }
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    int v10 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "CardioChange, not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  2LL,  "CardioChange, not sending analytics, no IHA permission",  v13,  2);
      double v9 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService sendAnalytics]", "%s\n", v11);
      goto LABEL_22;
    }
  }

- (void)sendCoreAnalyticsEvent:(RiskModelFeatureInput *)a3
{
  *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v6
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v5),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&qword_10199F4A8);
    if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_10199F4A8))
    {
      *(_OWORD *)buf = xmmword_101364C58;
      *(_OWORD *)&buf[12] = *(__int128 *)((char *)&xmmword_101364C58 + 12);
      sub_1001B4118(&qword_10199F490, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199F490, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199F4A8);
    }

    unsigned __int8 v8 = atomic_load((unsigned __int8 *)&qword_10199F4C8);
    if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_10199F4C8))
    {
      *(_OWORD *)buf = xmmword_101364C74;
      *(_OWORD *)&uint8_t buf[16] = unk_101364C84;
      *(void *)&buf[32] = 0x3FF333333FECCCCDLL;
      sub_1001B4118(&qword_10199F4B0, buf, 0xAuLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199F4B0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199F4C8);
    }

    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&qword_10199F4E8);
    if ((v9 & 1) == 0)
    {
      if (__cxa_guard_acquire(&qword_10199F4E8))
      {
        *(_OWORD *)buf = xmmword_101364C9C;
        *(_OWORD *)&uint8_t buf[16] = unk_101364CAC;
        *(_OWORD *)&buf[28] = unk_101364CB8;
        sub_1001B4118(&qword_10199F4D0, buf, 0xBuLL);
        __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199F4D0, (void *)&_mh_execute_header);
        __cxa_guard_release(&qword_10199F4E8);
      }
    }

    int v10 = (char *)self->fCardioChangeEstimator.__ptr_.__value_ + 64;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100F150DC;
    v16[3] = &unk_10188C6D0;
    memmove(&v22, v10, 0x3CuLL);
    __int128 v11 = *(_OWORD *)&a3->var6;
    __int128 v19 = *(_OWORD *)&a3->var4;
    __int128 v20 = v11;
    double var8 = a3->var8;
    __int128 v12 = *(_OWORD *)&a3->var0;
    __int128 v18 = *(_OWORD *)&a3->var2;
    __int128 v17 = v12;
    AnalyticsSendEventLazy(@"com.apple.com.apple.CoreMotion.CardioChangeEstimate", v16);
  }

  else
  {
    if (qword_101934760 != -1) {
      dispatch_once(&qword_101934760, &stru_10188C710);
    }
    uint64_t v13 = (os_log_s *)qword_101934768;
    if (os_log_type_enabled((os_log_t)qword_101934768, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "CardioChange, not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934760 != -1) {
        dispatch_once(&qword_101934760, &stru_10188C710);
      }
      v23[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934768,  2LL,  "CardioChange, not sending analytics, no IHA permission",  v23,  2);
      __int128 v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCardioChangeService sendCoreAnalyticsEvent:]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }
  }

- (void).cxx_destruct
{
  int64_t value = self->fCardioChangeEstimator.__ptr_.__value_;
  self->fCardioChangeEstimator.__ptr_.__value_ = 0LL;
  if (value) {
    sub_100F15778((uint64_t)&self->fCardioChangeEstimator, (uint64_t)value);
  }
  uint64_t v4 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  sub_1001B4F90((uint64_t *)&self->fDailyAggregateFeatureAggregator, 0LL);
  sub_1001B4F90((uint64_t *)&self->fChangeAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fAggregateFeatureDb);
  sub_10000AE14((uint64_t)&self->fOutputDb);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((_DWORD *)self + 16) = 0;
  __asm { FMOV            V0.2S, #-1.0 }

  *((_BYTE *)self + 76) = 0;
  *((void *)self + 10) = 0xFFFFFFFFLL;
  *((_DWORD *)self + 22) = -1;
  *(void *)((char *)self + 100) = 0LL;
  *(void *)((char *)self + 92) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 16) = 0LL;
  *(void *)((char *)self + 68) = _D0;
  *((void *)self + 17) = 0LL;
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  *((void *)self + 20) = 0LL;
  return self;
}

@end