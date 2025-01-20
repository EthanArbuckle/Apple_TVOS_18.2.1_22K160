@interface CLMobilityWalkingBoutService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferMobilityCompanionSyncActivity:(id)a3;
- (BOOL)checkDeferRequestForBoutsActivity:(id)a3;
- (CLMobilityWalkingBoutService)init;
- (NSMutableSet)boutClients;
- (NSMutableSet)steadinessClients;
- (float)BMIFromHeight:(float)a3 weight:(float)a4;
- (id).cxx_construct;
- (void)beginService;
- (void)checkForBoutsReadyToProcessWithCompletion:(id)a3 activity:(id)a4;
- (void)checkForHistoricalComputeTrigger:(CLBodyMetrics *)a3;
- (void)classifySteadinessWithCompletion:(id)a3 activity:(id)a4;
- (void)dealloc;
- (void)endService;
- (void)handleBoutResults:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult;
- (void)onAggregationTimer;
- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onDataCollectionRequested:(id)a3;
- (void)onMobilityClassificationActivity:(id)a3;
- (void)onMobilityCompanionSyncActivity:(id)a3;
- (void)onMobilityProcessBoutsActivity:(id)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSPUGaitMetrics:(const SPUGaitMetrics *)a3;
- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)registerForMobilityBoutMetrics:(id)a3;
- (void)registerForWalkingSteadiness:(id)a3;
- (void)sendAnalyticsBoutMetrics:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult;
- (void)sendAnalyticsSteadinessResult:(uint64_t)a3;
- (void)sendCompanionSyncAnalyticsWithMsgSize:(int)a3 isSuccess:(BOOL)a4 isActivityDeferred:(BOOL)a5 isActivityValid:(BOOL)a6 isWatchPaired:(BOOL)a7;
- (void)setBoutClients:(id)a3;
- (void)setCompanionSyncActivityAsDone:(id)a3;
- (void)setSteadinessClients:(id)a3;
- (void)setUpAggregationOnTimer;
- (void)setUpClassificationActivityWithDeferral:(BOOL)a3;
- (void)setUpMobilityCompanionSyncActivity;
- (void)setUpProcessBoutsActivity;
- (void)unregisterForMobilityBoutMetrics:(id)a3;
- (void)unregisterForWalkingSteadiness:(id)a3;
@end

@implementation CLMobilityWalkingBoutService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199AA30 != -1) {
    dispatch_once(&qword_10199AA30, &stru_101872DB0);
  }
  return (id)qword_10199AA28;
}

- (CLMobilityWalkingBoutService)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLMobilityWalkingBoutService;
  v2 = -[CLMobilityWalkingBoutService initWithInboundProtocol:outboundProtocol:]( &v4,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMobilityWalkingBoutServiceProtocol,  &OBJC_PROTOCOL___CLMobilityWalkingBoutServiceClientProtocol);
  if (v2)
  {
    -[CLMobilityWalkingBoutService setBoutClients:](v2, "setBoutClients:", objc_opt_new(&OBJC_CLASS___NSMutableSet));
    -[CLMobilityWalkingBoutService setSteadinessClients:]( v2,  "setSteadinessClients:",  objc_opt_new(&OBJC_CLASS___NSMutableSet));
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMobilityWalkingBoutService;
  -[CLMobilityWalkingBoutService dealloc](&v3, "dealloc");
}

+ (BOOL)isSupported
{
  if (qword_10199AA40 != -1) {
    dispatch_once(&qword_10199AA40, &stru_101872DD0);
  }
  return byte_10199AA38;
}

- (void)beginService
{
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  objc_super v3 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Starting up CLMobilityWalkingBoutService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    LOWORD(v119) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "Starting up CLMobilityWalkingBoutService",  &v119,  2);
    v115 = (uint8_t *)v114;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService beginService]", "%s\n", v114);
    if (v115 != buf) {
      free(v115);
    }
  }

  LOBYTE(v122) = 0;
  sub_100B4E3F4((unsigned __int8 *)&v122, buf);
  sub_10005F550((uint64_t)&self->fBoutBoundaryDb, (__int128 *)buf);
  objc_super v4 = *(std::__shared_weak_count **)&buf[8];
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

  v7 = operator new(0x30uLL);
  uint64_t v8 = (uint64_t)v7;
  cntrl = self->fBoutBoundaryDb.__cntrl_;
  *(void *)buf = self->fBoutBoundaryDb.__ptr_;
  *(void *)&buf[8] = cntrl;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  sub_1001B4E14((uint64_t)v7, (uint64_t *)buf);
  v12 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v13 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fBoutBoundaryAggregator, v8);
  LOBYTE(v122) = 0;
  sub_1001B4FF4((unsigned __int8 *)&v122, buf);
  sub_10005F550((uint64_t)&self->fGaitMetricsDb, (__int128 *)buf);
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

  v18 = operator new(0x30uLL);
  uint64_t v19 = (uint64_t)v18;
  v20 = self->fGaitMetricsDb.__cntrl_;
  *(void *)buf = self->fGaitMetricsDb.__ptr_;
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

  sub_1001B4F90((uint64_t *)&self->fGaitMetricsAggregator, v19);
  LOBYTE(v122) = 0;
  sub_100B4E4E4((unsigned __int8 *)&v122, buf);
  p_fBoutMetricsDb = &self->fBoutMetricsDb;
  sub_10005F550((uint64_t)&self->fBoutMetricsDb, (__int128 *)buf);
  v27 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v28 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  v30 = operator new(0x30uLL);
  uint64_t v31 = (uint64_t)v30;
  v32 = self->fBoutMetricsDb.__cntrl_;
  *(void *)buf = p_fBoutMetricsDb->__ptr_;
  *(void *)&buf[8] = v32;
  if (v32)
  {
    v33 = (unint64_t *)((char *)v32 + 8);
    do
      unint64_t v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
  }

  sub_1001B4E14((uint64_t)v30, (uint64_t *)buf);
  v35 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v36 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fBoutMetricsAggregator, v31);
  LOBYTE(v122) = 0;
  sub_100B4E5D4((unsigned __int8 *)&v122, buf);
  sub_10005F550((uint64_t)&self->fPedometerDb, (__int128 *)buf);
  v38 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v39 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  sub_100B4E6C4(buf);
  sub_10005F550((uint64_t)&self->fHKQueryDelegate, (__int128 *)buf);
  v41 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v42 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }

  sub_100B4007C(&self->fBoutBoundaryDb.__ptr_, &self->fGaitMetricsDb.__ptr_, &self->fPedometerDb.__ptr_, buf);
  v44 = *(WalkingBoutExtractor **)buf;
  *(void *)buf = 0LL;
  value = self->fBoutExtractor.__ptr_.__value_;
  self->fBoutExtractor.__ptr_.__value_ = v44;
  if (value)
  {
    sub_100B4E79C((uint64_t)&self->fBoutExtractor, (uint64_t)value);
    uint64_t v46 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v46) {
      sub_100B4E79C((uint64_t)buf, v46);
    }
  }

  v47 = operator new(0x58uLL);
  uint64_t v48 = (uint64_t)v47;
  v49 = self->fBoutMetricsDb.__cntrl_;
  if (p_fBoutMetricsDb->__ptr_) {
    uint64_t v50 = (uint64_t)p_fBoutMetricsDb->__ptr_ + 528;
  }
  else {
    uint64_t v50 = 0LL;
  }
  *(void *)buf = v50;
  *(void *)&buf[8] = v49;
  if (v49)
  {
    v51 = (unint64_t *)((char *)v49 + 8);
    do
      unint64_t v52 = __ldxr(v51);
    while (__stxr(v52 + 1, v51));
  }

  v53.n128_f64[0] = sub_10104511C((uint64_t)v47, buf);
  v54 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v55 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v54->__on_zero_shared)(v54, v53);
      std::__shared_weak_count::__release_weak(v54);
    }
  }

  sub_1003949B8((uint64_t *)&self->fSteadinessClassifier, v48);
  LOBYTE(v122) = 0;
  sub_100B4E80C((unsigned __int8 *)&v122, buf);
  p_fSmoothedGaitMetricsDb = &self->fSmoothedGaitMetricsDb;
  sub_10005F550((uint64_t)&self->fSmoothedGaitMetricsDb, (__int128 *)buf);
  v58 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v59 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }

  v61 = operator new(0x30uLL);
  uint64_t v62 = (uint64_t)v61;
  v63 = self->fSmoothedGaitMetricsDb.__cntrl_;
  *(void *)buf = p_fSmoothedGaitMetricsDb->__ptr_;
  *(void *)&buf[8] = v63;
  if (v63)
  {
    v64 = (unint64_t *)((char *)v63 + 8);
    do
      unint64_t v65 = __ldxr(v64);
    while (__stxr(v65 + 1, v64));
  }

  sub_1001B4E14((uint64_t)v61, (uint64_t *)buf);
  v66 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v67 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fSmoothedGaitMetricsAggregator, v62);
  sub_100B40238(&self->fSmoothedGaitMetricsDb.__ptr_, &self->fGaitMetricsDb.__ptr_, buf);
  uint64_t v69 = *(void *)buf;
  *(void *)buf = 0LL;
  sub_100B4E8FC((uint64_t *)&self->fSmoothedGaitMetricsProcessor, v69);
  sub_100B4E8FC((uint64_t *)buf, 0LL);
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  v70 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEBUG,  "Attempting to set up data manager for mobility calibrator.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    LOWORD(v119) = 0;
    LODWORD(v118) = 2;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "Attempting to set up data manager for mobility calibrator.",  &v119,  v118);
    v117 = (uint8_t *)v116;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService beginService]", "%s\n", v116);
    if (v117 != buf) {
      free(v117);
    }
  }

  sub_100B40378(&self->fBoutMetricsDb.__ptr_, &self->fGaitMetricsDb.__ptr_, buf);
  v71 = *(CMMobilityCalibrationManager **)buf;
  *(void *)buf = 0LL;
  v72 = self->fMobilityCalManager.__ptr_.__value_;
  self->fMobilityCalManager.__ptr_.__value_ = v71;
  if (v72)
  {
    sub_100B4E93C((_DWORD)self + 232, v72);
    v73 = *(void **)buf;
    *(void *)buf = 0LL;
    if (v73) {
      sub_100B4E93C((int)buf, v73);
    }
  }

  self->fClassificationInProgress = 0;
  self->fIsMigrationComplete = 0;
  self->fCompanionConnected = 0;
  *(_OWORD *)&self->_previousBodyMetrics.gender = xmmword_10134B1E8;
  *(_OWORD *)&self->_previousBodyMetrics.vo2max = xmmword_10134B1F8;
  *(_OWORD *)&self->_previousBodyMetrics.hronset = xmmword_10134B208;
  *(_OWORD *)&self->_previousBodyMetrics.runVo2max = *(__int128 *)((char *)&xmmword_10134B208 + 12);
  sub_100E18F18((uint64_t)sub_100B40500, (uint64_t)self, self, buf);
  v74 = *(Client **)buf;
  *(void *)buf = 0LL;
  v75 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = v74;
  if (v75)
  {
    (*(void (**)(Client *))(*(void *)v75 + 8LL))(v75);
    uint64_t v76 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v76) {
      (*(void (**)(uint64_t))(*(void *)v76 + 8LL))(v76);
    }
  }

  [*((id *)self->fUserInfoClient.__ptr_.__value_ + 2) register:*((void *)self->fUserInfoClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  sub_1003CC884((uint64_t)sub_100B40510, (uint64_t)self, -[CLMobilityWalkingBoutService universe](self, "universe"), buf);
  v77 = *(Client **)buf;
  *(void *)buf = 0LL;
  v78 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = v77;
  if (v78)
  {
    (*(void (**)(Client *))(*(void *)v78 + 8LL))(v78);
    uint64_t v79 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v79) {
      (*(void (**)(uint64_t))(*(void *)v79 + 8LL))(v79);
    }
  }

  [*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->fDaemonStatusClient.__ptr_.__value_ + 1) forNotification:11 registrationInfo:0];
  [*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->fDaemonStatusClient.__ptr_.__value_ + 1) forNotification:17 registrationInfo:0];
  sub_101037234((uint64_t)sub_100B40520, (uint64_t)self, self, buf);
  v80 = *(Client **)buf;
  *(void *)buf = 0LL;
  v81 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = v80;
  if (v81)
  {
    (*(void (**)(Client *))(*(void *)v81 + 8LL))(v81);
    uint64_t v82 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v82) {
      (*(void (**)(uint64_t))(*(void *)v82 + 8LL))(v82);
    }
  }

  [*((id *)self->fStepCountClient.__ptr_.__value_ + 2) register:*((void *)self->fStepCountClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  sub_100DAA9F8((uint64_t)sub_100B40530, (uint64_t)self, -[CLMobilityWalkingBoutService universe](self, "universe"), buf);
  v83 = *(Client **)buf;
  *(void *)buf = 0LL;
  v84 = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = v83;
  if (v84)
  {
    (*(void (**)(Client *))(*(void *)v84 + 8LL))(v84);
    uint64_t v85 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v85) {
      (*(void (**)(uint64_t))(*(void *)v85 + 8LL))(v85);
    }
  }

  [*((id *)self->fMotionStateObserverClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateObserverClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  sub_100468458((uint64_t)sub_100B40540, (uint64_t)self, self, buf);
  v86 = *(Client **)buf;
  *(void *)buf = 0LL;
  v87 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = v86;
  if (v87)
  {
    (*(void (**)(Client *))(*(void *)v87 + 8LL))(v87);
    uint64_t v88 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v88) {
      (*(void (**)(uint64_t))(*(void *)v88 + 8LL))(v88);
    }
  }

  [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  if (sub_1008FA854(0))
  {
    id v89 = objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
    v90 = operator new(0x38uLL);
    sub_1008D75E0(v90, v89, (uint64_t)sub_100B40550, (uint64_t)self, 0LL);
    v91 = self->fSPUGaitMetricsDispatcher.__ptr_.__value_;
    self->fSPUGaitMetricsDispatcher.__ptr_.__value_ = v90;
    if (v91) {
      (*(void (**)(void *))(*(void *)v91 + 8LL))(v91);
    }
    uint64_t v92 = sub_1008FA854(0);
    sub_1006DCB40(v92, 27, (uint64_t)self->fSPUGaitMetricsDispatcher.__ptr_.__value_, -1.0);
  }

  self->fHealthKitWriter = -[CLMobilityHealthKitWriter initWithDelegate:]( objc_alloc(&OBJC_CLASS___CLMobilityHealthKitWriter),  "initWithDelegate:",  self);
  id v93 = objc_msgSend( objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CMHealthColdStorageService");
  if (v93)
  {
    v94 = self->fBoutMetricsDb.__cntrl_;
    if (p_fBoutMetricsDb->__ptr_) {
      uint64_t v95 = (uint64_t)p_fBoutMetricsDb->__ptr_ + 72;
    }
    else {
      uint64_t v95 = 0LL;
    }
    *(void *)buf = v95;
    *(void *)&buf[8] = v94;
    if (v94)
    {
      v96 = (unint64_t *)((char *)v94 + 8);
      do
        unint64_t v97 = __ldxr(v96);
      while (__stxr(v97 + 1, v96));
    }

    v98 = self->fSmoothedGaitMetricsDb.__cntrl_;
    if (p_fSmoothedGaitMetricsDb->__ptr_) {
      uint64_t v99 = (uint64_t)p_fSmoothedGaitMetricsDb->__ptr_ + 72;
    }
    else {
      uint64_t v99 = 0LL;
    }
    uint64_t v125 = v99;
    v126 = v98;
    if (v98)
    {
      v100 = (unint64_t *)((char *)v98 + 8);
      do
        unint64_t v101 = __ldxr(v100);
      while (__stxr(v101 + 1, v100));
    }

    v119 = 0LL;
    v120 = 0LL;
    v121 = 0LL;
    v122 = &v119;
    char v123 = 0;
    v102 = operator new(0x20uLL);
    uint64_t v103 = 0LL;
    v119 = v102;
    v120 = v102;
    v121 = v102 + 2;
    do
    {
      __int128 v104 = *(_OWORD *)&buf[16 * v103];
      _OWORD *v102 = v104;
      if (*((void *)&v104 + 1))
      {
        v105 = (unint64_t *)(*((void *)&v104 + 1) + 8LL);
        do
          unint64_t v106 = __ldxr(v105);
        while (__stxr(v106 + 1, v105));
      }

      ++v103;
      ++v102;
    }

    while (v103 != 2);
    v120 = v102;
    for (uint64_t i = 16LL; i != -16; i -= 16LL)
      sub_10000AE14((uint64_t)&buf[i]);
    v108 = v119;
    v109 = v120;
    if (v119 != (void *)v120)
    {
      do
      {
        id v110 = +[CLActivityRecorderUtils getDbDetails:](&OBJC_CLASS___CLActivityRecorderUtils, "getDbDetails:", *v108);
        objc_msgSend( v93,  "registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:",  objc_msgSend(v110, "objectForKeyedSubscript:", @"url"),  objc_msgSend(v110, "objectForKeyedSubscript:", @"name"),  1,  1,  0);
        v108 += 2;
      }

      while (v108 != v109);
    }

    *(void *)buf = &v119;
    sub_10004CC28((void ***)buf);
  }

  -[CLMobilityWalkingBoutService setUpAggregationOnTimer](self, "setUpAggregationOnTimer");
  -[CLMobilityWalkingBoutService setUpProcessBoutsActivity](self, "setUpProcessBoutsActivity");
  -[CLMobilityWalkingBoutService setUpClassificationActivityWithDeferral:]( self,  "setUpClassificationActivityWithDeferral:",  0LL);
  sub_1003A09BC((uint64_t)sub_100B4055C, (uint64_t)self, self, buf);
  v111 = *(Client **)buf;
  *(void *)buf = 0LL;
  v112 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = v111;
  if (v112)
  {
    (*(void (**)(Client *))(*(void *)v112 + 8LL))(v112);
    uint64_t v113 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v113) {
      (*(void (**)(uint64_t))(*(void *)v113 + 8LL))(v113);
    }
  }

  [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:5 registrationInfo:0];
}

- (void)endService
{
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  objc_super v3 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Shutting down CLMobilityWalkingBoutService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v11[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "Shutting down CLMobilityWalkingBoutService",  v11,  2);
    v10 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService endService]", "%s\n", v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0LL;
  }

  if (sub_1008FA854(0))
  {
    uint64_t v5 = sub_1008FA854(0);
    sub_1006DD2A0(v5, 27, (uint64_t)self->fSPUGaitMetricsDispatcher.__ptr_.__value_);
  }

  value = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  v7 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
  }
  uint64_t v8 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0LL;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
  }

  self->fHealthKitWriter = 0LL;
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3)
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v7 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_ERROR))
    {
      int v8 = *a3;
      *(_DWORD *)buf = 67240192;
      int v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "CLMobilityWalkingBoutService: Received unexpected type %{public}d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      int v9 = *a3;
      v12[0] = 67240192;
      v12[1] = v9;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  16LL,  "CLMobilityWalkingBoutService: Received unexpected type %{public}d",  v12,  8);
      unint64_t v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService onStepCountNotification:data:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

  else
  {
    sub_100912B24((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a4);
  }

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v7 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "CLMobilityWalkingBoutService: Received user info update",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      LOWORD(v21[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "CLMobilityWalkingBoutService: Received user info update",  v21,  2);
      v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService onUserInfoUpdate:data:]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    if (!sub_10120C434((uint64_t)a4, (uint64_t)&self->_previousBodyMetrics))
    {
      sub_100913A80((uint64_t)self->fBoutExtractor.__ptr_.__value_, (__int128 *)a4);
      sub_101045168((uint64_t)self->fSteadinessClassifier.__ptr_.__value_, (uint64_t)a4);
      __int128 v8 = *((_OWORD *)a4 + 1);
      v19[0] = *(_OWORD *)a4;
      v19[1] = v8;
      v20[0] = *((_OWORD *)a4 + 2);
      *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)((char *)a4 + 44);
      -[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:](self, "checkForHistoricalComputeTrigger:", v19);
    }

    __int128 v9 = *(_OWORD *)a4;
    __int128 v10 = *((_OWORD *)a4 + 1);
    __int128 v11 = *((_OWORD *)a4 + 2);
    *(_OWORD *)&self->_previousBodyMetrics.runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&self->_previousBodyMetrics.vo2max = v10;
    *(_OWORD *)&self->_previousBodyMetrics.hronset = v11;
    *(_OWORD *)&self->_previousBodyMetrics.gender = v9;
  }

  else
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v12 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *a3;
      *(_DWORD *)buf = 67109120;
      int v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Warning Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      int v16 = *a3;
      v21[0] = 67109120;
      v21[1] = v16;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  0LL,  "#Warning Unhandled notification type, %d",  v21);
      v18 = (uint8_t *)v17;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService onUserInfoUpdate:data:]", "%s\n", v17);
      if (v18 != buf) {
        free(v18);
      }
    }
  }

- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if ((*a3 == 17 || *a3 == 11) && !self->fIsMigrationComplete && *(_BYTE *)a4 != 0)
  {
    self->fIsMigrationComplete = 1;
    [*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->fDaemonStatusClient.__ptr_.__value_ + 1) forNotification:11];
    [*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->fDaemonStatusClient.__ptr_.__value_ + 1) forNotification:17];
  }

- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (!*a3) {
    sub_100914368((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a4);
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (!*a3) {
    sub_10091450C((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a4 + 8);
  }
}

- (void)onSPUGaitMetrics:(const SPUGaitMetrics *)a3
{
  if ((sub_1004F97F4() & 0x20000000000000LL) == 0)
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    uint64_t v5 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "This device is not expected to support Gait Metrics. Please file a radar: rdar://component/1021534",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  17LL,  "This device is not expected to support Gait Metrics. Please file a radar: rdar://component/1021534",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLMobilityWalkingBoutService onSPUGaitMetrics:]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

  sub_100913CA0((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a3);
}

- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 5)
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v7 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "companionConnected notification received.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "companionConnected notification received.",  v15,  2);
      __int128 v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService onCompanionNotification:data:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    self->fCompanionConnected = *(_BYTE *)a4;
  }

  else
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    __int128 v8 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *a3;
      *(_DWORD *)buf = 67109120;
      int v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unhandled notification type, %d", buf, 8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      int v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  16LL,  "Unhandled notification type, %d",  v15);
      int v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService onCompanionNotification:data:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }
  }

- (void)onMobilityProcessBoutsActivity:(id)a3
{
  if (!a3)
  {
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    v7 = (os_log_s *)qword_101934488;
    if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v17 = "com.apple.locationd.Mobility.ProcessBouts";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    int v12 = 136315138;
    int v13 = "com.apple.locationd.Mobility.ProcessBouts";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  16LL,  "Invalid xpc activity (%s).",  &v12);
LABEL_22:
    __int128 v10 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLMobilityWalkingBoutService onMobilityProcessBoutsActivity:]", "%s\n", v8);
    if (v10 != buf) {
      free(v10);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100B41660;
    v11[3] = &unk_10182D2A0;
    v11[4] = a3;
    -[CLMobilityWalkingBoutService checkForBoutsReadyToProcessWithCompletion:activity:]( self,  "checkForBoutsReadyToProcessWithCompletion:activity:",  v11,  a3);
    return;
  }

  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  int v9 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "com.apple.locationd.Mobility.ProcessBouts";
    __int16 v18 = 2048;
    xpc_activity_state_t v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity (%s) state: %ld", buf, 0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    int v12 = 136315394;
    int v13 = "com.apple.locationd.Mobility.ProcessBouts";
    __int16 v14 = 2048;
    xpc_activity_state_t v15 = v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  16LL,  "Unexpected activity (%s) state: %ld",  &v12,  22);
    goto LABEL_22;
  }

- (void)onMobilityClassificationActivity:(id)a3
{
  if (!a3)
  {
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    v7 = (os_log_s *)qword_101934488;
    if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc classification activity.", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    LOWORD(v12) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  16LL,  "Invalid xpc classification activity.");
LABEL_22:
    __int128 v10 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService onMobilityClassificationActivity:]",  "%s\n",  v8);
    if (v10 != buf) {
      free(v10);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100B41CD0;
    v11[3] = &unk_101872DF8;
    v11[4] = a3;
    void v11[5] = self;
    -[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]( self,  "classifySteadinessWithCompletion:activity:",  v11,  a3);
    return;
  }

  if (qword_101934480 != -1) {
    dispatch_once(&qword_101934480, &stru_101872F38);
  }
  int v9 = (os_log_s *)qword_101934488;
  if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "com.apple.locationd.Mobility.Classification";
    __int16 v18 = 2048;
    xpc_activity_state_t v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity (%s) state: %ld", buf, 0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    int v12 = 136315394;
    int v13 = "com.apple.locationd.Mobility.Classification";
    __int16 v14 = 2048;
    xpc_activity_state_t v15 = v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  16LL,  "Unexpected activity (%s) state: %ld",  &v12,  22);
    goto LABEL_22;
  }

- (void)onDataCollectionRequested:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100B41F64;
  v3[3] = &unk_101868498;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async( (dispatch_queue_t)objc_msgSend( objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo"),  "queue"),  v3);
}

- (void)onAggregationTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100B423F0;
  v2[3] = &unk_10182D2A0;
  v2[4] = self;
  -[CLMobilityWalkingBoutService checkForBoutsReadyToProcessWithCompletion:activity:]( self,  "checkForBoutsReadyToProcessWithCompletion:activity:",  v2,  0LL);
}

- (void)onMobilityCompanionSyncActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v7 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "com.apple.locationd.Mobility.CompanionSync";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "XPC Mobility Sync: Invalid xpc activity (%s).",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      int v33 = 136315138;
      unint64_t v34 = "com.apple.locationd.Mobility.CompanionSync";
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  16LL,  "XPC Mobility Sync: Invalid xpc activity (%s).",  (const char *)&v33);
      int v23 = (uint8_t *)v22;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]",  "%s\n",  v22);
      if (v23 != buf) {
        free(v23);
      }
    }

    BOOL fCompanionConnected = self->fCompanionConnected;
    int v9 = self;
    uint64_t v10 = 0LL;
    goto LABEL_12;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]( self,  "checkDeferMobilityCompanionSyncActivity:",  a3))
    {
      -[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]( self,  "sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:",  0LL,  0LL,  1LL,  1LL,  self->fCompanionConnected);
      return;
    }

    if (self->fCompanionConnected)
    {
      value = (uint64_t *)self->fMobilityCalManager.__ptr_.__value_;
      double v14 = CFAbsoluteTimeGetCurrent() - (double)qword_10199AA20;
      double Current = CFAbsoluteTimeGetCurrent();
      int v16 = sub_10102098C(value, v14, Current);
      int v17 = v16;
      if (v16 && -[NSData length](v16, "length"))
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100B4457C;
        v32[3] = &unk_101840D20;
        v32[4] = v17;
        objc_msgSend( objc_msgSend( objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLCompanionNotifier"),  "doAsync:",  v32);
      }

      else
      {
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        __int16 v18 = (os_log_s *)qword_1019346B8;
        if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "XPC Mobility Sync: No data to send",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346B0 != -1) {
            dispatch_once(&qword_1019346B0, &stru_101872F18);
          }
          LOWORD(v33) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  0LL,  "XPC Mobility Sync: No data to send",  &v33,  2);
          unint64_t v25 = (uint8_t *)v24;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]",  "%s\n",  v24);
          if (v25 != buf) {
            free(v25);
          }
        }
      }

      -[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]( self,  "sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:",  -[NSData length](v17, "length"),  1LL,  0LL,  1LL,  self->fCompanionConnected);
      if (xpc_activity_set_state((xpc_activity_t)a3, 5LL)) {
        return;
      }
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      xpc_activity_state_t v19 = (os_log_s *)qword_1019346B8;
      if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_FAULT))
      {
        xpc_activity_state_t v20 = xpc_activity_get_state((xpc_activity_t)a3);
        *(_DWORD *)buf = 136446466;
        v38 = "com.apple.locationd.Mobility.CompanionSync";
        __int16 v39 = 2050;
        xpc_activity_state_t v40 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "XPC Mobility Sync: failed to mark %{public}s activity as Done. Current state is %{public}ld",  buf,  0x16u);
      }

      if (!sub_1002921D0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      uint64_t v28 = qword_1019346B8;
      xpc_activity_state_t v29 = xpc_activity_get_state((xpc_activity_t)a3);
      int v33 = 136446466;
      unint64_t v34 = "com.apple.locationd.Mobility.CompanionSync";
      __int16 v35 = 2050;
      xpc_activity_state_t v36 = v29;
      LODWORD(v31) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v28,  17LL,  "XPC Mobility Sync: failed to mark %{public}s activity as Done. Current state is %{public}ld",  &v33,  v31);
LABEL_58:
      v30 = (uint8_t *)v12;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]",  "%s\n",  v12);
      if (v30 != buf) {
        free(v30);
      }
      return;
    }

    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v21 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[PhoneService] Cannot send data, companion not nearby",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      LOWORD(v33) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  0LL,  "[PhoneService] Cannot send data, companion not nearby",  &v33,  2);
      v27 = (uint8_t *)v26;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]",  "%s\n",  v26);
      if (v27 != buf) {
        free(v27);
      }
    }

    -[CLMobilityWalkingBoutService setCompanionSyncActivityAsDone:](self, "setCompanionSyncActivityAsDone:", a3);
    BOOL fCompanionConnected = self->fCompanionConnected;
    int v9 = self;
    uint64_t v10 = 1LL;
LABEL_12:
    -[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]( v9,  "sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:",  0LL,  0LL,  0LL,  v10,  fCompanionConnected);
    return;
  }

  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  __int128 v11 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "com.apple.locationd.Mobility.CompanionSync";
    __int16 v39 = 2048;
    xpc_activity_state_t v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "XPC Mobility Sync: Unexpected activity (%s) state: %ld",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    int v33 = 136315394;
    unint64_t v34 = "com.apple.locationd.Mobility.CompanionSync";
    __int16 v35 = 2048;
    xpc_activity_state_t v36 = v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  16LL,  "XPC Mobility Sync: Unexpected activity (%s) state: %ld",  &v33,  22);
    goto LABEL_58;
  }

- (BOOL)checkDeferMobilityCompanionSyncActivity:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      uint64_t v5 = (os_log_s *)qword_1019346B8;
      if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "com.apple.locationd.Mobility.CompanionSync";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "XPC Mobility Sync: Cancelling (%{public}s) early due to deferral.",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        int v18 = 136446210;
        xpc_activity_state_t v19 = "com.apple.locationd.Mobility.CompanionSync";
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  1LL,  "XPC Mobility Sync: Cancelling (%{public}s) early due to deferral.",  &v18,  12);
        int v12 = (uint8_t *)v11;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]",  "%s\n",  v11);
        if (v12 != buf) {
          free(v12);
        }
      }

      if (xpc_activity_set_state((xpc_activity_t)a3, 3LL))
      {
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        xpc_activity_state_t v6 = (os_log_s *)qword_1019346B8;
        if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "XPC Mobility Sync: Activity deferred",  buf,  2u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  1LL,  "XPC Mobility Sync: Activity deferred",  &v18,  v17);
        __int128 v8 = (uint8_t *)v7;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]",  "%s\n",  v7);
        if (v8 == buf) {
          goto LABEL_24;
        }
      }

      else
      {
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        int v9 = (os_log_s *)qword_1019346B8;
        if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          v21 = (const char *)state;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "XPC Mobility Sync: Failed to defer activity. Current state is %{public}ld",  buf,  0xCu);
        }

        if (!sub_1002921D0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        uint64_t v13 = qword_1019346B8;
        xpc_activity_state_t v14 = xpc_activity_get_state((xpc_activity_t)a3);
        int v18 = 134349056;
        xpc_activity_state_t v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  17LL,  "XPC Mobility Sync: Failed to defer activity. Current state is %{public}ld",  &v18,  v17);
        __int128 v8 = (uint8_t *)v15;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]",  "%s\n",  v15);
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

- (void)setCompanionSyncActivityAsDone:(id)a3
{
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5LL))
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    objc_super v4 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v13 = "com.apple.locationd.Mobility.CompanionSync";
      __int16 v14 = 2050;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "[PhoneService] failed to mark %{public}s activity as Done. Current state is %{public}ld",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      uint64_t v5 = qword_1019346B8;
      int v8 = 136446466;
      int v9 = "com.apple.locationd.Mobility.CompanionSync";
      __int16 v10 = 2050;
      xpc_activity_state_t v11 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v5,  17LL,  "[PhoneService] failed to mark %{public}s activity as Done. Current state is %{public}ld",  &v8,  22);
      v7 = (uint8_t *)v6;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService setCompanionSyncActivityAsDone:]",  "%s\n",  v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

- (BOOL)checkDeferRequestForBoutsActivity:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      uint64_t v5 = (os_log_s *)qword_1019346B8;
      if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "com.apple.locationd.Mobility.ProcessBouts";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BoutService: Cancelling (%{public}s) early due to deferral.",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        int v18 = 136446210;
        xpc_activity_state_t v19 = "com.apple.locationd.Mobility.ProcessBouts";
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  1LL,  "BoutService: Cancelling (%{public}s) early due to deferral.",  &v18,  12);
        int v12 = (uint8_t *)v11;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]",  "%s\n",  v11);
        if (v12 != buf) {
          free(v12);
        }
      }

      if (xpc_activity_set_state((xpc_activity_t)a3, 3LL))
      {
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        xpc_activity_state_t v6 = (os_log_s *)qword_1019346B8;
        if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BoutService: Activity deferred", buf, 2u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  1LL,  "BoutService: Activity deferred",  &v18,  v17);
        int v8 = (uint8_t *)v7;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]",  "%s\n",  v7);
        if (v8 == buf) {
          goto LABEL_24;
        }
      }

      else
      {
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        int v9 = (os_log_s *)qword_1019346B8;
        if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          v21 = (const char *)state;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "Failed to defer activity. Current state is %{public}ld",  buf,  0xCu);
        }

        if (!sub_1002921D0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        uint64_t v13 = qword_1019346B8;
        xpc_activity_state_t v14 = xpc_activity_get_state((xpc_activity_t)a3);
        int v18 = 134349056;
        xpc_activity_state_t v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  17LL,  "Failed to defer activity. Current state is %{public}ld",  &v18,  v17);
        int v8 = (uint8_t *)v15;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]",  "%s\n",  v15);
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

- (void)checkForBoutsReadyToProcessWithCompletion:(id)a3 activity:(id)a4
{
  if (sub_100914554(self->fBoutExtractor.__ptr_.__value_, (double *)&v8, (double *)&v7))
  {
    if (-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]( self,  "checkDeferRequestForBoutsActivity:",  a4))
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, 103LL);
    }

    else
    {
      nullsub_10(self->fHKQueryDelegate.__ptr_);
      sub_100AF9230(self->fSmoothedGaitMetricsProcessor.__ptr_.__value_);
    }
  }

  else
  {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 109LL);
  }

- (void)handleBoutResults:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult
{
  uint64_t v50 = a3;
  if (-[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count")
    && a3->var1 != a3->var0)
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    uint64_t v5 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = 0xEEEEEEEEEEEEEEEFLL * ((v50->var1 - v50->var0) >> 4);
      *(_DWORD *)buf = 134218240;
      unint64_t v67 = v6;
      __int16 v68 = 1024;
      LODWORD(v69) = -[NSMutableSet count]( -[CLMobilityWalkingBoutService boutClients](self, "boutClients"),  "count");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "CLMobilityWalkingBoutService: Sending %lu bout metrics to %d client(s)",  buf,  0x12u);
    }

    a3 = v50;
    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      uint64_t v43 = qword_1019346B8;
      var0 = v50->var0;
      var1 = v50->var1;
      int v60 = 134218240;
      unint64_t v61 = 0xEEEEEEEEEEEEEEEFLL * ((var1 - var0) >> 4);
      __int16 v62 = 1024;
      LODWORD(v63) = -[NSMutableSet count]( -[CLMobilityWalkingBoutService boutClients](self, "boutClients"),  "count");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v43,  1LL,  "CLMobilityWalkingBoutService: Sending %lu bout metrics to %d client(s)",  &v60,  18);
      v47 = (uint8_t *)v46;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService handleBoutResults:]", "%s\n", v46);
      if (v47 != buf) {
        free(v47);
      }
      a3 = v50;
    }
  }

  uint64_t v7 = a3;
  uint64_t v8 = a3->var0;
  int v9 = v7->var1;
  if (v8 == v9)
  {
    v42 = v8;
  }

  else
  {
    do
    {
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      __int16 v10 = (os_log_s *)qword_1019346B8;
      if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v11 = *((void *)v8 + 3);
        uint64_t v12 = *((void *)v8 + 4);
        int v13 = *((_DWORD *)v8 + 10);
        *(_DWORD *)buf = 134218496;
        unint64_t v67 = v11;
        __int16 v68 = 2048;
        uint64_t v69 = v12;
        __int16 v70 = 1024;
        int v71 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Bout metrics result, startTime, %.2f, endTime, %.2f, stepCount, %d",  buf,  0x1Cu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346B0 != -1) {
          dispatch_once(&qword_1019346B0, &stru_101872F18);
        }
        unint64_t v37 = *((void *)v8 + 3);
        uint64_t v38 = *((void *)v8 + 4);
        int v39 = *((_DWORD *)v8 + 10);
        int v60 = 134218496;
        unint64_t v61 = v37;
        __int16 v62 = 2048;
        uint64_t v63 = v38;
        __int16 v64 = 1024;
        int v65 = v39;
        LODWORD(v48) = 28;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "Bout metrics result, startTime, %.2f, endTime, %.2f, stepCount, %d",  COERCE_DOUBLE(&v60),  v48,  v49);
        v41 = (uint8_t *)v40;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService handleBoutResults:]", "%s\n", v40);
        if (v41 != buf) {
          free(v41);
        }
      }

      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      xpc_activity_state_t v14 = -[CLMobilityWalkingBoutService boutClients](self, "boutClients");
      id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v55,  v59,  16LL);
      if (v15)
      {
        uint64_t v16 = *(void *)v56;
        do
        {
          for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v56 != v16) {
              objc_enumerationMutation(v14);
            }
            int v18 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
            __int128 v19 = *((_OWORD *)v8 + 1);
            __int128 v20 = *((_OWORD *)v8 + 2);
            __int128 v21 = *((_OWORD *)v8 + 3);
            __int128 v22 = *((_OWORD *)v8 + 4);
            __int128 v23 = *((_OWORD *)v8 + 6);
            v54[4] = *((_OWORD *)v8 + 5);
            v54[5] = v23;
            __int128 v24 = *((_OWORD *)v8 + 7);
            __int128 v25 = *((_OWORD *)v8 + 9);
            __int128 v26 = *((_OWORD *)v8 + 10);
            v54[7] = *((_OWORD *)v8 + 8);
            v54[8] = v25;
            __int128 v27 = *((_OWORD *)v8 + 11);
            __int128 v28 = *((_OWORD *)v8 + 12);
            __int128 v29 = *((_OWORD *)v8 + 14);
            v54[12] = *((_OWORD *)v8 + 13);
            v54[13] = v29;
            v54[10] = v27;
            v54[11] = v28;
            v54[9] = v26;
            v54[6] = v24;
            v54[2] = v21;
            v54[3] = v22;
            v54[0] = v19;
            v54[1] = v20;
            [v18 onMobilityBoutMetrics:v54];
          }

          id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v55,  v59,  16LL);
        }

        while (v15);
      }

      if (!*((_DWORD *)v8 + 17))
      {
        v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  *((double *)v8 + 3));
        uint64_t v31 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  *((double *)v8 + 4));
        int v32 = *((_DWORD *)v8 + 17);
        if (v32) {
          int v33 = 42;
        }
        else {
          int v33 = -1;
        }
        if ((v33 & *((_DWORD *)v8 + 52)) == 0)
        {
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:]( self->fHealthKitWriter,  "writeToHealthKitType:value:startDate:endDate:",  0LL,  v30,  v31,  *((double *)v8 + 16));
          int v32 = *((_DWORD *)v8 + 17);
        }

        if (v32) {
          int v34 = 42;
        }
        else {
          int v34 = -1;
        }
        if ((v34 & *((_DWORD *)v8 + 53)) == 0)
        {
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:]( self->fHealthKitWriter,  "writeToHealthKitType:value:startDate:endDate:",  1LL,  v30,  v31,  *((double *)v8 + 17));
          int v32 = *((_DWORD *)v8 + 17);
        }

        if (v32) {
          int v35 = 42;
        }
        else {
          int v35 = -1;
        }
        if ((v35 & *((_DWORD *)v8 + 54)) == 0)
        {
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:]( self->fHealthKitWriter,  "writeToHealthKitType:value:startDate:endDate:",  2LL,  v30,  v31,  *((double *)v8 + 18));
          int v32 = *((_DWORD *)v8 + 17);
        }

        if (v32) {
          int v36 = 42;
        }
        else {
          int v36 = -1;
        }
        if ((v36 & *((_DWORD *)v8 + 55)) == 0) {
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:deviceSide:]( self->fHealthKitWriter,  "writeToHealthKitType:value:startDate:endDate:deviceSide:",  3LL,  v30,  v31,  *((unsigned __int8 *)v8 + 64),  *((double *)v8 + 19));
        }
      }

      (*(void (**)(BoutMetricsRecorderDb *, uint64_t))(*(void *)self->fBoutMetricsDb.__ptr_ + 152LL))( self->fBoutMetricsDb.__ptr_,  (uint64_t)v8 + 16);
      sub_10091936C(self->fBoutExtractor.__ptr_.__value_);
      uint64_t v8 = (ProcessedBoutResult *)((char *)v8 + 240);
    }

    while (v8 != v9);
    v42 = v50->var0;
    uint64_t v8 = v50->var1;
  }

  __p = 0LL;
  unint64_t v52 = 0LL;
  uint64_t v53 = 0LL;
  sub_100B4F21C(&__p, v42, (uint64_t)v8, 0xEEEEEEEEEEEEEEEFLL * ((v8 - v42) >> 4));
  -[CLMobilityWalkingBoutService sendAnalyticsBoutMetrics:](self, "sendAnalyticsBoutMetrics:", &__p);
  if (__p)
  {
    unint64_t v52 = __p;
    operator delete(__p);
  }

- (void)classifySteadinessWithCompletion:(id)a3 activity:(id)a4
{
  if (self->fIsMigrationComplete)
  {
    if (-[CLMobilityHealthKitWriter isWalkingSteadinessAvailable]( self->fHealthKitWriter,  "isWalkingSteadinessAvailable"))
    {
      if (self->fClassificationInProgress)
      {
        if (qword_101934480 != -1) {
          dispatch_once(&qword_101934480, &stru_101872F38);
        }
        uint64_t v7 = (os_log_s *)qword_101934488;
        if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "#warning: Classification already in progress",  buf,  2u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_67;
        }
        bzero(buf, 0x65CuLL);
        if (qword_101934480 != -1) {
          dispatch_once(&qword_101934480, &stru_101872F38);
        }
        LOWORD(v51) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  1LL,  "#warning: Classification already in progress",  &v51,  2);
        int v13 = (char *)v34;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]",  "%s\n",  v34);
        if (v13 == buf) {
          goto LABEL_67;
        }
        goto LABEL_88;
      }

      if (a4 && xpc_activity_should_defer((xpc_activity_t)a4))
      {
        xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a4);
        if (xpc_activity_set_state((xpc_activity_t)a4, 3LL))
        {
          if (qword_101934480 != -1) {
            dispatch_once(&qword_101934480, &stru_101872F38);
          }
          unint64_t v11 = (os_log_s *)qword_101934488;
          if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "#warning: Classification deferred",  buf,  2u);
          }

          if (!sub_1002921D0(115, 2)) {
            goto LABEL_67;
          }
          bzero(buf, 0x65CuLL);
          if (qword_101934480 != -1) {
            dispatch_once(&qword_101934480, &stru_101872F38);
          }
          LOWORD(v51) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  1LL,  "#warning: Classification deferred",  &v51,  2);
          int v13 = (char *)v12;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]",  "%s\n",  v12);
        }

        else
        {
          if (qword_101934480 != -1) {
            dispatch_once(&qword_101934480, &stru_101872F38);
          }
          uint64_t v31 = (os_log_s *)qword_101934488;
          if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134349056;
            *(void *)&uint8_t buf[4] = state;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_FAULT,  "Failed to mark activity as Deferred. Current state is %{public}ld",  buf,  0xCu);
          }

          if (!sub_1002921D0(115, 0)) {
            goto LABEL_67;
          }
          bzero(buf, 0x65CuLL);
          if (qword_101934480 != -1) {
            dispatch_once(&qword_101934480, &stru_101872F38);
          }
          int v51 = 134349056;
          xpc_activity_state_t v52 = state;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  17LL,  "Failed to mark activity as Deferred. Current state is %{public}ld",  &v51,  12);
          int v13 = (char *)v40;
          sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]",  "%s\n",  v40);
        }

        if (v13 == buf)
        {
LABEL_67:
          (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
          return;
        }

- (void)checkForHistoricalComputeTrigger:(CLBodyMetrics *)a3
{
  if (a3->_isHeightSet)
  {
    if (sub_100D8AB84((uint64_t)self->fGaitMetricsDb.__ptr_ + 72))
    {
      if (self->fIsMigrationComplete)
      {
        double v20 = 0.0;
        uint64_t v4 = sub_1006E27E8();
        sub_100413284(v4, buf);
        sub_1002A82BC(*(uint64_t *)buf, "steadinessClassificationNextClassificationTime", &v20);
        uint64_t v5 = *(std::__shared_weak_count **)&buf[8];
        if (*(void *)&buf[8])
        {
          unint64_t v6 = (unint64_t *)(*(void *)&buf[8] + 8LL);
          do
            unint64_t v7 = __ldaxr(v6);
          while (__stlxr(v7 - 1, v6));
          if (!v7)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }

        if (v20 <= CFAbsoluteTimeGetCurrent() + -7776000.0)
        {
          if (qword_101934480 != -1) {
            dispatch_once(&qword_101934480, &stru_101872F38);
          }
          uint64_t v16 = (os_log_s *)qword_101934488;
          if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "checkForHistoricalComputeTrigger: YES, attempting classification",  buf,  2u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934480 != -1) {
              dispatch_once(&qword_101934480, &stru_101872F38);
            }
            LOWORD(v21) = 0;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  0LL,  "checkForHistoricalComputeTrigger: YES, attempting classification",  &v21,  2);
            unint64_t v18 = (char *)v17;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]",  "%s\n",  v17);
            if (v18 != buf) {
              free(v18);
            }
          }

          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          _OWORD v19[2] = sub_100B487F4;
          v19[3] = &unk_101872ED0;
          v19[4] = self;
          -[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]( self,  "classifySteadinessWithCompletion:activity:",  v19,  0LL);
        }

        else
        {
          if (qword_101934480 != -1) {
            dispatch_once(&qword_101934480, &stru_101872F38);
          }
          uint64_t v8 = (os_log_s *)qword_101934488;
          if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134349056;
            *(double *)&uint8_t buf[4] = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "checkForHistoricalComputeTrigger: NO, nextClassificationTime already set (%{public}.2f)",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934480 != -1) {
              dispatch_once(&qword_101934480, &stru_101872F38);
            }
            int v21 = 134349056;
            double v22 = v20;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  2LL,  "checkForHistoricalComputeTrigger: NO, nextClassificationTime already set (%{public}.2f)",  &v21,  12);
            __int16 v10 = (char *)v9;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]",  "%s\n",  v9);
LABEL_34:
            if (v10 != buf) {
              free(v10);
            }
          }
        }
      }

      else
      {
        if (qword_101934480 != -1) {
          dispatch_once(&qword_101934480, &stru_101872F38);
        }
        uint64_t v15 = (os_log_s *)qword_101934488;
        if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "";
          __int16 v24 = 2082;
          __int128 v25 = "Migration is not complete";
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:checkForHistoricalComputeTrigger: NO, reason:%{public, location:escape_only}s}",  buf,  0x1Cu);
        }
      }
    }

    else
    {
      if (qword_101934480 != -1) {
        dispatch_once(&qword_101934480, &stru_101872F38);
      }
      int v13 = (os_log_s *)qword_101934488;
      if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "checkForHistoricalComputeTrigger: NO, ClassB database inaccessible",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934480 != -1) {
          dispatch_once(&qword_101934480, &stru_101872F38);
        }
        LOWORD(v21) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  2LL,  "checkForHistoricalComputeTrigger: NO, ClassB database inaccessible",  &v21,  2);
        __int16 v10 = (char *)v14;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]",  "%s\n",  v14);
        goto LABEL_34;
      }
    }
  }

  else
  {
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    unint64_t v11 = (os_log_s *)qword_101934488;
    if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "checkForHistoricalComputeTrigger: NO, height is unset",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934480 != -1) {
        dispatch_once(&qword_101934480, &stru_101872F38);
      }
      LOWORD(v21) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  2LL,  "checkForHistoricalComputeTrigger: NO, height is unset",  &v21,  2);
      __int16 v10 = (char *)v12;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]",  "%s\n",  v12);
      goto LABEL_34;
    }
  }

- (float)BMIFromHeight:(float)a3 weight:(float)a4
{
  float result = 0.0;
  if (a3 != 0.0) {
    return a4 / (float)(a3 * a3);
  }
  return result;
}

- (void)sendAnalyticsBoutMetrics:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult
{
  *(void *)&double v4 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v5
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v4),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)&qword_10199AA60);
    if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_10199AA60))
    {
      *(_OWORD *)buf = xmmword_10134B224;
      *(_OWORD *)&uint8_t buf[16] = unk_10134B234;
      *(_OWORD *)double v19 = xmmword_10134B244;
      *(_OWORD *)&v19[12] = *(__int128 *)((char *)&xmmword_10134B244 + 12);
      sub_1001B4118(&qword_10199AA48, buf, 0xFuLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199AA48, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199AA60);
    }

    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&qword_10199AA80);
    if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_10199AA80))
    {
      *(_OWORD *)buf = xmmword_10134B260;
      *(_OWORD *)&buf[12] = *(__int128 *)((char *)&xmmword_10134B260 + 12);
      sub_1001B4118(&qword_10199AA68, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199AA68, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199AA80);
    }

    unsigned __int8 v8 = atomic_load((unsigned __int8 *)&qword_10199AAA0);
    if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_10199AAA0))
    {
      *(_OWORD *)buf = xmmword_10134B27C;
      *(_OWORD *)&buf[12] = *(__int128 *)((char *)&xmmword_10134B27C + 12);
      sub_1001B4118(&qword_10199AA88, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199AA88, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199AAA0);
    }

    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&qword_10199AAC0);
    if ((v9 & 1) == 0 && __cxa_guard_acquire(&qword_10199AAC0))
    {
      LODWORD(v20) = 200;
      *(_OWORD *)buf = xmmword_10134B298;
      *(_OWORD *)&uint8_t buf[16] = unk_10134B2A8;
      *(_OWORD *)double v19 = xmmword_10134B2B8;
      *(_OWORD *)&v19[16] = unk_10134B2C8;
      sub_100B48D24(&qword_10199AAA8, buf, 0x11uLL);
      __cxa_atexit((void (*)(void *))sub_100B48DA4, &qword_10199AAA8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199AAC0);
    }

    unsigned __int8 v10 = atomic_load((unsigned __int8 *)&qword_10199AAE0);
    if ((v10 & 1) == 0 && __cxa_guard_acquire(&qword_10199AAE0))
    {
      *(_OWORD *)double v19 = xmmword_10134B300;
      *(_OWORD *)&v19[16] = unk_10134B310;
      __int128 v20 = xmmword_10134B320;
      __int128 v21 = unk_10134B330;
      *(_OWORD *)buf = xmmword_10134B2E0;
      *(_OWORD *)&uint8_t buf[16] = unk_10134B2F0;
      sub_100B48DD4(&qword_10199AAC8, buf, 0xCuLL);
      __cxa_atexit((void (*)(void *))sub_1001AD9F0, &qword_10199AAC8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199AAE0);
    }

    var0 = a3->var0;
    var1 = a3->var1;
    if (a3->var0 != var1)
    {
      do
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100B48E54;
        v16[3] = &unk_101827B10;
        v16[4] = (char *)var0 + 16;
        v16[5] = var0;
        AnalyticsSendEventLazy(@"com.apple.CoreMotion.Mobility.WalkingBout", v16);
        var0 = (ProcessedBoutResult *)((char *)var0 + 240);
      }

      while (var0 != var1);
    }
  }

  else if (a3->var0 != a3->var1)
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    int v13 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "BoutService: Not authorized to submit analytics without IHA",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      v17[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "BoutService: Not authorized to submit analytics without IHA",  v17,  2);
      uint64_t v15 = (char *)v14;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService sendAnalyticsBoutMetrics:]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }
  }

- (void)sendAnalyticsSteadinessResult:(uint64_t)a3
{
  if (objc_msgSend(objc_msgSend(a1, "steadinessClients"), "count"))
  {
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    uint64_t v5 = (os_log_s *)qword_101934488;
    if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a1, "steadinessClients"), "count");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BoutService: Sending WalkingSteadiness to %d client(s)",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934480 != -1) {
        dispatch_once(&qword_101934480, &stru_101872F38);
      }
      uint64_t v30 = qword_101934488;
      LODWORD(v84) = 67109120;
      DWORD1(v84) = objc_msgSend(objc_msgSend(a1, "steadinessClients"), "count");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v30,  1LL,  "BoutService: Sending WalkingSteadiness to %d client(s)",  &v84);
      int v32 = (char *)v31;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]",  "%s\n",  v31);
      if (v32 != buf) {
        free(v32);
      }
    }

    __int128 v73 = 0u;
    __int128 v72 = 0u;
    __int128 v71 = 0u;
    __int128 v70 = 0u;
    id v6 = [a1 steadinessClients];
    id v7 = [v6 countByEnumeratingWithState:&v70 objects:v88 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v71;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v71 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v10 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
          memcpy(__dst, (const void *)a3, sizeof(__dst));
          [v10 onWalkingSteadinessClassification:__dst];
        }

        id v7 = [v6 countByEnumeratingWithState:&v70 objects:v88 count:16];
      }

      while (v7);
    }
  }

  *(void *)&double v11 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v12
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v11),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    __int128 v13 = *(_OWORD *)(a3 + 208);
    __int128 v84 = *(_OWORD *)(a3 + 192);
    __int128 v85 = v13;
    __int128 v86 = *(_OWORD *)(a3 + 224);
    uint64_t v87 = *(void *)(a3 + 240);
    __int128 v14 = *(_OWORD *)(a3 + 416);
    __int128 v65 = *(_OWORD *)(a3 + 400);
    __int128 v66 = v14;
    __int128 v67 = *(_OWORD *)(a3 + 432);
    uint64_t v68 = *(void *)(a3 + 448);
    __int128 v15 = *(_OWORD *)(a3 + 552);
    __int128 v61 = *(_OWORD *)(a3 + 536);
    __int128 v62 = v15;
    __int128 v63 = *(_OWORD *)(a3 + 568);
    uint64_t v64 = *(void *)(a3 + 584);
    __int128 v16 = *(_OWORD *)(a3 + 640);
    __int128 v57 = *(_OWORD *)(a3 + 624);
    __int128 v58 = v16;
    __int128 v59 = *(_OWORD *)(a3 + 656);
    uint64_t v60 = *(void *)(a3 + 672);
    unsigned __int8 v17 = atomic_load((unsigned __int8 *)&qword_10199AB00);
    if ((v17 & 1) == 0 && __cxa_guard_acquire(&qword_10199AB00))
    {
      *(void *)buf = 0x420C000041A00000LL;
      *(_DWORD *)&buf[8] = 1112014848;
      sub_1001B4118(&qword_10199AAE8, buf, 3uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199AAE8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199AB00);
    }

    unsigned __int8 v18 = atomic_load((unsigned __int8 *)&qword_10199AB20);
    if ((v18 & 1) == 0 && __cxa_guard_acquire(&qword_10199AB20))
    {
      *(void *)buf = 0x41C8000041940000LL;
      *(_DWORD *)&buf[8] = 1106247680;
      sub_1001B4118(&qword_10199AB08, buf, 3uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_10199AB08, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10199AB20);
    }

    double Current = CFAbsoluteTimeGetCurrent();
    double v20 = *(double *)(a3 + 1072);
    if (v20 <= 0.0) {
      int v21 = -1;
    }
    else {
      int v21 = (int)((Current - v20) / 604800.0);
    }
    double v25 = *(double *)(a3 + 1080);
    if (v25 <= 0.0) {
      int v26 = -1;
    }
    else {
      int v26 = (int)((Current - v25) / 604800.0);
    }
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    double v27 = (os_log_s *)qword_101934488;
    if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = *(void *)(a3 + 1072);
      uint64_t v29 = *(void *)(a3 + 1080);
      *(_DWORD *)buf = 134219009;
      *(double *)&uint8_t buf[4] = Current;
      __int16 v90 = 2049;
      uint64_t v91 = v28;
      __int16 v92 = 1025;
      int v93 = v21;
      __int16 v94 = 2049;
      uint64_t v95 = v29;
      __int16 v96 = 1025;
      int v97 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "currentTime, %{}.2f, mostRecentLowNotificationTime, %{private}.2f,  weeksSinceLowNotification, %{private}d, most RecentVeryLowNotificationTime, %{private}.2f, weeksSinceVeryLowNotification, %{private}d",  buf,  0x2Cu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934480 != -1) {
        dispatch_once(&qword_101934480, &stru_101872F38);
      }
      uint64_t v33 = *(void *)(a3 + 1072);
      uint64_t v34 = *(void *)(a3 + 1080);
      int v74 = 134219009;
      double v75 = Current;
      __int16 v76 = 2049;
      uint64_t v77 = v33;
      __int16 v78 = 1025;
      int v79 = v21;
      __int16 v80 = 2049;
      uint64_t v81 = v34;
      __int16 v82 = 1025;
      int v83 = v26;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  2LL,  "currentTime, %{}.2f, mostRecentLowNotificationTime, %{private}.2f,  weeksSinceLowNotification, %{private}d, most RecentVeryLowNotificationTime, %{private}.2f, weeksSinceVeryLowNotification, %{private}d",  &v74,  44);
      int v36 = (char *)v35;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]",  "%s\n",  v35);
      if (v36 != buf) {
        free(v36);
      }
    }

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100B4A748;
    v37[3] = &unk_101872EF8;
    memcpy(v38, (const void *)a3, sizeof(v38));
    __int128 v39 = v84;
    __int128 v40 = v85;
    __int128 v41 = v86;
    v37[4] = a1;
    uint64_t v42 = v87;
    __int128 v43 = v61;
    __int128 v44 = v62;
    __int128 v45 = v63;
    uint64_t v46 = v64;
    __int128 v48 = v66;
    __int128 v49 = v67;
    __int128 v47 = v65;
    uint64_t v50 = v68;
    uint64_t v54 = v60;
    __int128 v53 = v59;
    __int128 v52 = v58;
    __int128 v51 = v57;
    int v55 = v21;
    int v56 = v26;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.Mobility.SteadinessClassificationV3", v37);
  }

  else
  {
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    double v22 = (os_log_s *)qword_101934488;
    if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "BoutService: Not authorized to submit steadiness analytics without IHA",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934480 != -1) {
        dispatch_once(&qword_101934480, &stru_101872F38);
      }
      LOWORD(v84) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  2LL,  "BoutService: Not authorized to submit steadiness analytics without IHA",  &v84,  2);
      __int16 v24 = (char *)v23;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]",  "%s\n",  v23);
      if (v24 != buf) {
        free(v24);
      }
    }
  }

- (void)setUpClassificationActivityWithDeferral:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v6 = sub_1006E27E8();
  sub_100413284(v6, &v24);
  double v23 = 0.0;
  sub_1002A82BC(v24, "steadinessClassificationNextClassificationTime", &v23);
  double v7 = v23;
  if (v23 > Current + 691200.0)
  {
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    uint64_t v8 = (os_log_s *)qword_101934488;
    if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v33 = "steadinessClassificationNextClassificationTime";
      __int16 v34 = 2050;
      double v35 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934480 != -1) {
        dispatch_once(&qword_101934480, &stru_101872F38);
      }
      int v26 = 136446466;
      double v27 = "steadinessClassificationNextClassificationTime";
      __int16 v28 = 2050;
      double v29 = v23;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  16LL,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  &v26,  22);
      double v20 = (uint8_t *)v19;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMobilityWalkingBoutService setUpClassificationActivityWithDeferral:]",  "%s\n",  v19);
      if (v20 != buf) {
        free(v20);
      }
    }

    sub_1002A667C(v24, "steadinessClassificationNextClassificationTime", 0xFFFFFFFFLL);
    double v23 = 0.0;
    double v7 = 0.0;
  }

  unsigned __int8 v9 = &XPC_ACTIVITY_INTERVAL_1_DAY;
  if (!v3) {
    unsigned __int8 v9 = &XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  uint64_t v10 = *v9;
  double v11 = v7 - Current;
  else {
    uint64_t v12 = v10;
  }
  if (qword_101934480 != -1) {
    dispatch_once(&qword_101934480, &stru_101872F38);
  }
  __int128 v13 = (os_log_s *)qword_101934488;
  if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v33 = "com.apple.locationd.Mobility.Classification";
    __int16 v34 = 2050;
    double v35 = v23;
    __int16 v36 = 2050;
    uint64_t v37 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Registering XPC Activity with nextClassificationTime=(%{public}.2f) and delay=(%{public}lld)",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    int v26 = 136446722;
    double v27 = "com.apple.locationd.Mobility.Classification";
    __int16 v28 = 2050;
    double v29 = v23;
    __int16 v30 = 2050;
    uint64_t v31 = v12;
    LODWORD(v21) = 32;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934488,  0LL,  "%{public}s: Registering XPC Activity with nextClassificationTime=(%{public}.2f) and delay=(%{public}lld)",  &v26,  v21);
    unsigned __int8 v18 = (uint8_t *)v17;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService setUpClassificationActivityWithDeferral:]",  "%s\n",  v17);
    if (v18 != buf) {
      free(v18);
    }
  }

  xpc_activity_unregister("com.apple.locationd.Mobility.Classification");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100B4B6AC;
  handler[3] = &unk_1018268C8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLMobilityWalkingBoutService");
  handler[5] = v12;
  xpc_activity_register("com.apple.locationd.Mobility.Classification", XPC_ACTIVITY_CHECK_IN, handler);
  __int128 v14 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

- (void)setUpProcessBoutsActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 600LL);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100B4BD34;
  handler[3] = &unk_101831AF8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLMobilityWalkingBoutService");
  xpc_activity_register("com.apple.locationd.Mobility.ProcessBouts", v3, handler);
  xpc_release(v3);
}

- (void)setUpAggregationOnTimer
{
  int v14 = 86400;
  uint64_t v3 = sub_1006E27E8();
  sub_100413284(v3, &v12);
  int v4 = sub_1002A7CB0(v12, "MobilityAggregationInterval", &v14);
  uint64_t v5 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      unint64_t v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  if (v4) {
    uint64_t v8 = 1000000000LL * v14;
  }
  else {
    uint64_t v8 = 86400000000000LL;
  }
  unsigned __int8 v9 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CLMobilityWalkingBoutService universe](self, "universe"),  "silo"),  "queue"));
  self->fAggregationTimer = v9;
  dispatch_source_set_timer((dispatch_source_t)v9, 0LL, v8, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100B4CD10;
  v11[3] = &unk_10181A288;
  v11[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)fAggregationTimer, v11);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)setUpMobilityCompanionSyncActivity
{
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  uint64_t v3 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = qword_10199AA20;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "XPC Mobility Sync: setting up activity. Timer set to %lld seconds",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    int v8 = 134217984;
    uint64_t v9 = qword_10199AA20;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  1LL,  "XPC Mobility Sync: setting up activity. Timer set to %lld seconds",  &v8);
    uint64_t v6 = (uint8_t *)v5;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService setUpMobilityCompanionSyncActivity]",  "%s\n",  v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, qword_10199AA20);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100B4CFA0;
  handler[3] = &unk_101831AF8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLMobilityWalkingBoutService");
  xpc_activity_register("com.apple.locationd.Mobility.CompanionSync", v4, handler);
  xpc_release(v4);
}

- (void)registerForMobilityBoutMetrics:(id)a3
{
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = a3;
    __int16 v15 = 1024;
    unsigned int v16 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BoutService: Registered new BoutMetrics client %@. Current client count: %d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    uint64_t v6 = qword_1019346B8;
    int v9 = 138412546;
    id v10 = a3;
    __int16 v11 = 1024;
    unsigned int v12 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  1LL,  "BoutService: Registered new BoutMetrics client %@. Current client count: %d",  &v9,  18);
    int v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService registerForMobilityBoutMetrics:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

- (void)unregisterForMobilityBoutMetrics:(id)a3
{
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = a3;
    __int16 v15 = 1024;
    unsigned int v16 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BoutService: Unregistered BoutMetrics client %@. Current client count: %d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    uint64_t v6 = qword_1019346B8;
    int v9 = 138412546;
    id v10 = a3;
    __int16 v11 = 1024;
    unsigned int v12 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  1LL,  "BoutService: Unregistered BoutMetrics client %@. Current client count: %d",  &v9,  18);
    int v8 = (uint8_t *)v7;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService unregisterForMobilityBoutMetrics:]",  "%s\n",  v7);
    if (v8 != buf) {
      free(v8);
    }
  }

- (void)registerForWalkingSteadiness:(id)a3
{
  if (qword_101934480 != -1) {
    dispatch_once(&qword_101934480, &stru_101872F38);
  }
  uint64_t v5 = (os_log_s *)qword_101934488;
  if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = a3;
    __int16 v15 = 1024;
    unsigned int v16 = -[NSMutableSet count]( -[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"),  "count");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BoutService: Registered new WalkingSteadiness client %@. Current client count: %d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    uint64_t v6 = qword_101934488;
    int v9 = 138412546;
    id v10 = a3;
    __int16 v11 = 1024;
    unsigned int v12 = -[NSMutableSet count]( -[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"),  "count");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  1LL,  "BoutService: Registered new WalkingSteadiness client %@. Current client count: %d",  &v9,  18);
    int v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService registerForWalkingSteadiness:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

- (void)unregisterForWalkingSteadiness:(id)a3
{
  if (qword_101934480 != -1) {
    dispatch_once(&qword_101934480, &stru_101872F38);
  }
  uint64_t v5 = (os_log_s *)qword_101934488;
  if (os_log_type_enabled((os_log_t)qword_101934488, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = a3;
    __int16 v15 = 1024;
    unsigned int v16 = -[NSMutableSet count]( -[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"),  "count");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BoutService: Unregistered new WalkingSteadiness client %@. Current client count: %d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934480 != -1) {
      dispatch_once(&qword_101934480, &stru_101872F38);
    }
    uint64_t v6 = qword_101934488;
    int v9 = 138412546;
    id v10 = a3;
    __int16 v11 = 1024;
    unsigned int v12 = -[NSMutableSet count]( -[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"),  "count");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  1LL,  "BoutService: Unregistered new WalkingSteadiness client %@. Current client count: %d",  &v9,  18);
    int v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMobilityWalkingBoutService unregisterForWalkingSteadiness:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

- (void)sendCompanionSyncAnalyticsWithMsgSize:(int)a3 isSuccess:(BOOL)a4 isActivityDeferred:(BOOL)a5 isActivityValid:(BOOL)a6 isWatchPaired:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  unsigned int v12 = operator new(0x14uLL);
  _DWORD v12[4] = 500000;
  *(_OWORD *)unsigned int v12 = xmmword_10134B340;
  __int16 v36 = 0LL;
  uint64_t v37 = 0LL;
  double v35 = 0LL;
  sub_10001B72C(&v35, v12, (uint64_t)(v12 + 5), 5uLL);
  uint64_t v13 = v36 - (_BYTE *)v35;
  if (v36 == (_BYTE *)v35)
  {
    LODWORD(v14) = 0;
    int v16 = 0;
    if (!v36) {
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = v13 >> 2;
    while (v35[v14] < a3)
    {
      if (v15 == ++v14)
      {
        LODWORD(v14) = v15;
        break;
      }
    }
  }

  __int16 v36 = v35;
  operator delete(v35);
  int v16 = v14;
LABEL_9:
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101872F18);
  }
  unsigned __int8 v17 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    int v50 = a3;
    __int16 v51 = 1024;
    int v52 = v16;
    __int16 v53 = 1024;
    BOOL v54 = v9;
    __int16 v55 = 1024;
    BOOL v56 = v10;
    __int16 v57 = 1024;
    BOOL v58 = v8;
    __int16 v59 = 1024;
    BOOL v60 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "CLMobilityWalkingBoutService: CompanionSync core analytics: %d, %d, %d, %d, %d, %d",  buf,  0x26u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    v38[0] = 67110400;
    v38[1] = a3;
    __int16 v39 = 1024;
    int v40 = v16;
    __int16 v41 = 1024;
    BOOL v42 = v9;
    __int16 v43 = 1024;
    BOOL v44 = v10;
    __int16 v45 = 1024;
    BOOL v46 = v8;
    __int16 v47 = 1024;
    BOOL v48 = v7;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  0LL,  "CLMobilityWalkingBoutService: CompanionSync core analytics: %d, %d, %d, %d, %d, %d",  v38,  38,  (_DWORD)v26,  v27,  (_DWORD)v28,  (_DWORD)v29);
    double v22 = (uint8_t *)v21;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]",  "%s\n",  v21);
    if (v22 != buf) {
      free(v22);
    }
  }

  *(void *)&double v18 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v19
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v18),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    int v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    __int16 v28 = sub_100B4DF14;
    double v29 = &unk_101820718;
    BOOL v31 = v9;
    BOOL v32 = v10;
    BOOL v33 = v8;
    BOOL v34 = v7;
    int v30 = v16;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.Mobility.MobilityCalibrationCommunication", &v26);
  }

  else
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101872F18);
    }
    double v20 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "CLMobilityWalkingBoutService: Not authorized to submit analytics without IHA",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101872F18);
      }
      LOWORD(v38[0]) = 0;
      LODWORD(v25) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  1LL,  "CLMobilityWalkingBoutService: Not authorized to submit analytics without IHA",  v38,  v25);
      uint64_t v24 = (uint8_t *)v23;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityVali d:isWatchPaired:]",  "%s\n",  v23);
      if (v24 != buf) {
        free(v24);
      }
    }
  }

  operator delete(v12);
}

- (NSMutableSet)boutClients
{
  return self->_boutClients;
}

- (void)setBoutClients:(id)a3
{
}

- (NSMutableSet)steadinessClients
{
  return self->_steadinessClients;
}

- (void)setSteadinessClients:(id)a3
{
}

- (void).cxx_destruct
{
  p_fMobilityCalManager = &self->fMobilityCalManager;
  value = p_fMobilityCalManager->__ptr_.__value_;
  p_fMobilityCalManager->__ptr_.__value_ = 0LL;
  if (value) {
    sub_100B4E93C((int)p_fMobilityCalManager, value);
  }
  sub_100B4E8FC((uint64_t *)&self->fSmoothedGaitMetricsProcessor, 0LL);
  uint64_t v5 = self->fSPUGaitMetricsDispatcher.__ptr_.__value_;
  self->fSPUGaitMetricsDispatcher.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(void *))(*(void *)v5 + 8LL))(v5);
  }
  sub_1003949B8((uint64_t *)&self->fSteadinessClassifier, 0LL);
  uint64_t v6 = self->fBoutExtractor.__ptr_.__value_;
  self->fBoutExtractor.__ptr_.__value_ = 0LL;
  if (v6) {
    sub_100B4E79C((uint64_t)&self->fBoutExtractor, (uint64_t)v6);
  }
  sub_1001B4F90((uint64_t *)&self->fSmoothedGaitMetricsAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fSmoothedGaitMetricsDb);
  sub_10000AE14((uint64_t)&self->fHKQueryDelegate);
  sub_10000AE14((uint64_t)&self->fPedometerDb);
  sub_1001B4F90((uint64_t *)&self->fBoutMetricsAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fBoutMetricsDb);
  sub_1001B4F90((uint64_t *)&self->fGaitMetricsAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fGaitMetricsDb);
  sub_1001B4F90((uint64_t *)&self->fBoutBoundaryAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fBoutBoundaryDb);
  BOOL v7 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
  }
  BOOL v8 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
  }
  BOOL v9 = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0LL;
  if (v9) {
    (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
  }
  BOOL v10 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0LL;
  if (v10) {
    (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
  }
  __int16 v11 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0LL;
  if (v11) {
    (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
  }
  unsigned int v12 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0LL;
  if (v12) {
    (*(void (**)(Client *))(*(void *)v12 + 8LL))(v12);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 16) = 0LL;
  *((void *)self + 17) = 0LL;
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  *((void *)self + 20) = 0LL;
  *((void *)self + 21) = 0LL;
  *((void *)self + 22) = 0LL;
  *((void *)self + 24) = 0LL;
  *((void *)self + 25) = 0LL;
  *((void *)self + 27) = 0LL;
  *((void *)self + 28) = 0LL;
  *((void *)self + 29) = 0LL;
  return self;
}

@end