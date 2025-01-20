@interface CLHRRecoveryService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLHRRecoveryService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)logBodyMetrics:(const CLBodyMetrics *)a3;
- (void)logSessionStats:(const HRRecoveryResult *)a3;
- (void)logVO2MaxStats:(const VO2MaxResult *)a3;
- (void)onCatherineNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onHRRecoveryEstimate:(HRRecoveryResult *)a3;
- (void)onHRRecoveryRegisterHRNotification;
- (void)onHRRecoverySessionEnd;
- (void)onHRRecoverySessionStart;
- (void)onHRRecoveryUnregisterHRNotification;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)sendAnalytics;
- (void)setUpAggregationOnTimer;
@end

@implementation CLHRRecoveryService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993DB0 != -1) {
    dispatch_once(&qword_101993DB0, &stru_10182CFE8);
  }
  return (id)qword_101993DA8;
}

- (CLHRRecoveryService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHRRecoveryService;
  return -[CLHRRecoveryService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLHRRecoveryServiceProtocol,  &OBJC_PROTOCOL___CLHRRecoveryServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_101993DC0 != -1) {
    dispatch_once(&qword_101993DC0, &stru_10182D008);
  }
  return byte_101993DB8;
}

- (void)beginService
{
  if (qword_101934770 != -1) {
    dispatch_once(&qword_101934770, &stru_10182D028);
  }
  objc_super v3 = (os_log_s *)qword_101934778;
  if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLHRRecoveryService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    v58[0] = 0;
    LODWORD(v57) = 2;
    v56 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  0LL,  "Starting up CLHRRecoveryService",  v58,  v57);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHRRecoveryService beginService]", "%s\n", v56);
  }

  HIBYTE(v57) = 0;
  sub_1002777C8((unsigned __int8 *)&v57 + 7, buf);
  sub_10005F550((uint64_t)&self->fInputHRDb, (__int128 *)buf);
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

  v7 = operator new(0x30uLL);
  uint64_t v8 = (uint64_t)v7;
  cntrl = self->fInputHRDb.__cntrl_;
  *(void *)buf = self->fInputHRDb.__ptr_;
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

  sub_1001B4F90((uint64_t *)&self->fInputHRAggregator, v8);
  HIBYTE(v57) = 0;
  sub_1002778B8((unsigned __int8 *)&v57 + 7, buf);
  sub_10005F550((uint64_t)&self->fInputWRDb, (__int128 *)buf);
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
  v20 = self->fInputWRDb.__cntrl_;
  *(void *)buf = self->fInputWRDb.__ptr_;
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

  sub_1001B4F90((uint64_t *)&self->fInputWRAggregator, v19);
  HIBYTE(v57) = 0;
  sub_1002779A8((unsigned __int8 *)&v57 + 7, buf);
  sub_10005F550((uint64_t)&self->fSessionDb, (__int128 *)buf);
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

  v29 = operator new(0x30uLL);
  uint64_t v30 = (uint64_t)v29;
  v31 = self->fSessionDb.__cntrl_;
  *(void *)buf = self->fSessionDb.__ptr_;
  *(void *)&buf[8] = v31;
  if (v31)
  {
    v32 = (unint64_t *)((char *)v31 + 8);
    do
      unint64_t v33 = __ldxr(v32);
    while (__stxr(v33 + 1, v32));
  }

  sub_1001B4E14((uint64_t)v29, (uint64_t *)buf);
  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v35 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fSessionAggregator, v30);
  sub_10027390C((uint64_t *)&self->fInputHRDb, (uint64_t *)&self->fInputWRDb, (uint64_t *)&self->fSessionDb, buf);
  p_fHRRecoveryEstimator = (uint64_t *)&self->fHRRecoveryEstimator;
  v38 = *(CLHRRecoveryEstimator **)buf;
  *(void *)buf = 0LL;
  value = self->fHRRecoveryEstimator.__ptr_.__value_;
  self->fHRRecoveryEstimator.__ptr_.__value_ = v38;
  if (value)
  {
    sub_100277A98((uint64_t)&self->fHRRecoveryEstimator, value);
    v40 = *(void **)buf;
    *(void *)buf = 0LL;
    if (v40) {
      sub_100277A98((uint64_t)buf, v40);
    }
  }

  v41 = (void *)*p_fHRRecoveryEstimator;
  void *v41 = j__objc_msgSend_onHRRecoverySessionStart;
  v41[5] = self;
  uint64_t v42 = *p_fHRRecoveryEstimator;
  *(void *)(v42 + 8) = j__objc_msgSend_onHRRecoverySessionEnd;
  *(void *)(v42 + 40) = self;
  uint64_t v43 = *p_fHRRecoveryEstimator;
  *(void *)(v43 + 16) = sub_100273AAC;
  *(void *)(v43 + 40) = self;
  uint64_t v44 = *p_fHRRecoveryEstimator;
  *(void *)(v44 + 24) = j__objc_msgSend_onHRRecoveryUnregisterHRNotification;
  *(void *)(v44 + 40) = self;
  uint64_t v45 = *p_fHRRecoveryEstimator;
  *(void *)(v45 + 32) = j__objc_msgSend_onHRRecoveryRegisterHRNotification;
  *(void *)(v45 + 40) = self;
  -[CLHRRecoveryService setUpAggregationOnTimer](self, "setUpAggregationOnTimer");
  sub_10070EDF0((uint64_t)sub_100273AF4, (uint64_t)self, self, buf);
  v46 = *(Client **)buf;
  *(void *)buf = 0LL;
  v47 = self->fCatherineClient.__ptr_.__value_;
  self->fCatherineClient.__ptr_.__value_ = v46;
  if (v47)
  {
    (*(void (**)(Client *))(*(void *)v47 + 8LL))(v47);
    uint64_t v48 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v48) {
      (*(void (**)(uint64_t))(*(void *)v48 + 8LL))(v48);
    }
  }

  [*((id *)self->fCatherineClient.__ptr_.__value_ + 2) register:*((void *)self->fCatherineClient.__ptr_.__value_ + 1) forNotification:7 registrationInfo:0];
  sub_100468458((uint64_t)sub_100273B04, (uint64_t)self, self, buf);
  v49 = *(Client **)buf;
  *(void *)buf = 0LL;
  v50 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = v49;
  if (v50)
  {
    (*(void (**)(Client *))(*(void *)v50 + 8LL))(v50);
    uint64_t v51 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v51) {
      (*(void (**)(uint64_t))(*(void *)v51 + 8LL))(v51);
    }
  }

  [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  sub_100E18F18((uint64_t)sub_100273B14, (uint64_t)self, self, buf);
  v52 = *(Client **)buf;
  *(void *)buf = 0LL;
  v53 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = v52;
  if (v53)
  {
    (*(void (**)(Client *))(*(void *)v53 + 8LL))(v53);
    uint64_t v54 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v54) {
      (*(void (**)(uint64_t))(*(void *)v54 + 8LL))(v54);
    }
  }

  p_fNatalimetryClient = &self->fNatalimetryClient;
  [*((id *)p_fNatalimetryClient->__ptr_.__value_ + 2) register:*((void *)p_fNatalimetryClient->__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)p_fNatalimetryClient->__ptr_.__value_ + 2) register:*((void *)p_fNatalimetryClient->__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  sub_100671064(*p_fHRRecoveryEstimator);
}

- (void)endService
{
  if (qword_101934770 != -1) {
    dispatch_once(&qword_101934770, &stru_10182D028);
  }
  objc_super v3 = (os_log_s *)qword_101934778;
  if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLHRRecoveryService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    v6[0] = 0;
    unint64_t v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  0LL,  "Shutting down CLHRRecoveryService",  v6,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHRRecoveryService endService]", "%s\n", v5);
  }

  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0LL;
  }

- (void)setUpAggregationOnTimer
{
  int v13 = 86400;
  uint64_t v3 = sub_1006E27E8();
  sub_100413284(v3, &v11);
  sub_1002A7CB0(v11, "HRRecoveryAggregationTimeInterval", &v13);
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
  uint64_t v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CLHRRecoveryService universe](self, "universe"),  "silo"),  "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0LL, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100274688;
  v10[3] = &unk_10181A288;
  v10[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onCatherineNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 9)
  {
    sub_10066EAC8((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (uint64_t)a4);
  }

  else if (*a3 == 7)
  {
    float v7 = *((double *)a4 + 3);
    sub_10066E904((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, v7);
  }

  else
  {
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    uint64_t v8 = (os_log_s *)qword_101934778;
    if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_ERROR))
    {
      int v9 = *a3;
      *(_DWORD *)buf = 67109120;
      int v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "CLHRRecoveryService: Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934770 != -1) {
        dispatch_once(&qword_101934770, &stru_10182D028);
      }
      int v10 = *a3;
      v12[0] = 67109120;
      v12[1] = v10;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  16LL,  "CLHRRecoveryService: Unhandled notification type, %d",  v12);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLHRRecoveryService onCatherineNotification:data:]", "%s\n", v11);
    }
  }

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    sub_10066FB18((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (uint64_t)a4);
  }

  else
  {
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    int v10 = (os_log_s *)qword_101934778;
    if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_ERROR))
    {
      int v11 = *a3;
      *(_DWORD *)buf = 67109120;
      int v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CLHRRecoveryService: Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934770 != -1) {
        dispatch_once(&qword_101934770, &stru_10182D028);
      }
      int v12 = *a3;
      v14[0] = 67109120;
      v14[1] = v12;
      int v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  16LL,  "CLHRRecoveryService: Unhandled notification type, %d",  v14);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLHRRecoveryService onMotionStateMediatorNotification:data:]",  "%s\n",  v13);
    }
  }

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v7 = *a3;
  if (*a3 == 9)
  {
    sub_10066F8A0( (uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_,  *((_DWORD *)a4 + 26),  *((_DWORD *)a4 + 22),  *((double *)a4 + 2),  *((float *)a4 + 39),  *((double *)a4 + 12),  *((double *)a4 + 4));
  }

  else if (v7 == 6)
  {
    -[CLHRRecoveryService logVO2MaxStats:](self, "logVO2MaxStats:", a4);
  }

  else if (v7 == 2)
  {
    sub_10066E66C((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (__int128 *)a4);
    -[CLHRRecoveryService logBodyMetrics:](self, "logBodyMetrics:", a4);
  }

  else
  {
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    uint64_t v8 = (os_log_s *)qword_101934778;
    if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_ERROR))
    {
      int v9 = *a3;
      *(_DWORD *)buf = 67109120;
      int v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "CLHRRecoveryService: Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934770 != -1) {
        dispatch_once(&qword_101934770, &stru_10182D028);
      }
      int v10 = *a3;
      v12[0] = 67109120;
      v12[1] = v10;
      int v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  16LL,  "CLHRRecoveryService: Unhandled notification type, %d",  v12);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLHRRecoveryService onNatalimetryNotification:data:]", "%s\n", v11);
    }
  }

- (void)onHRRecoverySessionStart
{
}

- (void)onHRRecoverySessionEnd
{
  self->fSessionStats.biologicalSex = 0;
  __asm { FMOV            V0.2S, #-1.0 }

  *(void *)&self->fSessionStats.age = _D0;
  self->fSessionStats.betaBlockerUse = 0;
  self->fSessionStats.status = 0;
  *(int64x2_t *)&self->fSessionStats.diffTimeRecoveryOnsetWorkout = vdupq_n_s64(0xC7EFFFFFE0000000LL);
  *(void *)&self->fSessionStats.hrRecovery = -1LL;
  __asm { FMOV            V2.4S, #-1.0 }

  *(_OWORD *)&self->fSessionStats.peakHR = xmmword_1012E37F0;
  *(_OWORD *)&self->fSessionStats.recoveryLoad = _Q2;
  *(void *)&self->fSessionStats.recoveryMetsStdDev = _D0;
  self->fSessionStats.isOtherwiseEligibleForLongitudinal = 0;
  *(_OWORD *)&self->fSessionStats.hrRecoveryReference = _Q2;
  self->fSessionStats.isEligibleForHK = 0;
  *(_OWORD *)&self->fSessionStats.minHRAfterWorkoutEnd = _Q2;
  *(void *)&self->fSessionStats.hrmax = _D0;
  *(void *)&self->fSessionStats.estimationStatus = -13LL;
  *(void *)&self->fSessionStats.lambda = _D0;
  *(void *)&self->fSessionStats.explainedVarianceScore = 3212836864LL;
  self->fSessionStats.workoutType = 0LL;
  *(void *)&self->fSessionStats.sessionDuration = 0x1BF800000LL;
}

- (void)onHRRecoveryEstimate:(HRRecoveryResult *)a3
{
}

- (void)onHRRecoveryUnregisterHRNotification
{
}

- (void)onHRRecoveryRegisterHRNotification
{
}

- (void)logBodyMetrics:(const CLBodyMetrics *)a3
{
  self->fSessionStats.age = a3->age;
  self->fSessionStats.biologicalSex = a3->biologicalSex;
  self->fSessionStats.betaBlockerUse = a3->betaBlockerUse;
  float weightKG = a3->weightKG;
  if (weightKG != 0.0)
  {
    float heightM = a3->heightM;
    if (heightM != 0.0) {
      self->fSessionStats.userBMI = weightKG / (float)(heightM * heightM);
    }
  }

  self->fSessionStats.hrmax = a3->hrmax;
}

- (void)logVO2MaxStats:(const VO2MaxResult *)a3
{
  int v5 = llround(a3->var2);
  int var12 = a3->var12;
  self->fSessionStats.estimationStatus = a3->var11;
  self->fSessionStats.vo2MaxValue = v5;
  self->fSessionStats.sessionType = var12;
}

- (void)logSessionStats:(const HRRecoveryResult *)a3
{
  p_fSessionStats = &self->fSessionStats;
  self->fSessionStats.int status = a3->var0;
  float var3 = a3->var3;
  self->fSessionStats.double sessionDuration = var3;
  self->fSessionStats.int64_t workoutType = a3->var4;
  double var6 = a3->var6;
  self->fSessionStats.double diffTimeRecoveryOnsetWorkout = a3->var7 - var6;
  self->fSessionStats.double diffTimeTDropWorkoutEnd = a3->var13 - var6;
  self->fSessionStats.int hrRecovery = llround(a3->var2);
  self->fSessionStats.int hrRecoverySession = llround(a3->var22);
  *(float32x2_t *)&self->fSessionStats.double peakHR = vcvt_f32_f64(*(float64x2_t *)&a3->var8);
  float var14 = a3->var14;
  self->fSessionStats.double hrMinAdjusted = var14;
  double var29 = a3->var29;
  double var15 = a3->var15;
  float v11 = var29 - var15;
  self->fSessionStats.double observedHRRecovery = v11;
  *(float32x4_t *)&self->fSessionStats.double recoveryLoad = vcvt_hight_f32_f64( (int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var16),  *(float64x2_t *)&a3->var18);
  float var20 = a3->var20;
  self->fSessionStats.double recoveryMetsStdDev = var20;
  float var24 = a3->var24;
  self->fSessionStats.double biasAdjustment = var24;
  self->fSessionStats.BOOL isOtherwiseEligibleForLongitudinal = a3->var34;
  *(float *)&double var15 = var15;
  *(float *)&double var29 = var29;
  self->fSessionStats.double hrRecoveryReference = *(float *)&var15;
  self->fSessionStats.double hrRecoveryReferencePeak = *(float *)&var29;
  *(float *)&double var29 = a3->var28;
  self->fSessionStats.double hrOneMinPostRecovery = *(float *)&var29;
  *(float *)&double var29 = a3->var30;
  self->fSessionStats.double hrOneMinExponential = *(float *)&var29;
  self->fSessionStats.BOOL isEligibleForHK = a3->var27;
  v14.f64[0] = a3->var33;
  v14.f64[1] = a3->var35;
  *(float32x4_t *)&self->fSessionStats.double minHRAfterWorkoutEnd = vcvt_hight_f32_f64( (int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var31),  v14);
  *(float *)&double var29 = a3->var23;
  self->fSessionStats.double peakHrOneMinusFhr = *(float *)&var29;
  *(float32x2_t *)&self->fSessionStats.double lambda = vcvt_f32_f64(*(float64x2_t *)&a3->var10);
  *(float *)&double var29 = a3->var12;
  self->fSessionStats.double explainedVarianceScore = *(float *)&var29;
  if (qword_101934770 != -1) {
    dispatch_once(&qword_101934770, &stru_10182D028);
  }
  v15 = (os_log_s *)qword_101934778;
  if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_DEBUG))
  {
    double age = self->fSessionStats.age;
    int biologicalSex = p_fSessionStats->biologicalSex;
    BOOL betaBlockerUse = self->fSessionStats.betaBlockerUse;
    double userBMI = self->fSessionStats.userBMI;
    double sevenDayRestingHR = self->fSessionStats.sevenDayRestingHR;
    double hrmax = self->fSessionStats.hrmax;
    int status = self->fSessionStats.status;
    double diffTimeRecoveryOnsetWorkout = self->fSessionStats.diffTimeRecoveryOnsetWorkout;
    double diffTimeTDropWorkoutEnd = self->fSessionStats.diffTimeTDropWorkoutEnd;
    int hrRecovery = self->fSessionStats.hrRecovery;
    int hrRecoverySession = self->fSessionStats.hrRecoverySession;
    double peakHR = self->fSessionStats.peakHR;
    double steadyStateHR = self->fSessionStats.steadyStateHR;
    double hrMinAdjusted = self->fSessionStats.hrMinAdjusted;
    double observedHRRecovery = self->fSessionStats.observedHRRecovery;
    double recoveryLoad = self->fSessionStats.recoveryLoad;
    double maxRecoveryHR = self->fSessionStats.maxRecoveryHR;
    double minRecoveryHR = self->fSessionStats.minRecoveryHR;
    double recoveryMetsMean = self->fSessionStats.recoveryMetsMean;
    double recoveryMetsStdDev = self->fSessionStats.recoveryMetsStdDev;
    double biasAdjustment = self->fSessionStats.biasAdjustment;
    BOOL isOtherwiseEligibleForLongitudinal = self->fSessionStats.isOtherwiseEligibleForLongitudinal;
    double hrRecoveryReference = self->fSessionStats.hrRecoveryReference;
    double hrRecoveryReferencePeak = self->fSessionStats.hrRecoveryReferencePeak;
    double hrOneMinPostRecovery = self->fSessionStats.hrOneMinPostRecovery;
    double hrOneMinExponential = self->fSessionStats.hrOneMinExponential;
    BOOL isEligibleForHK = self->fSessionStats.isEligibleForHK;
    double minHRAfterWorkoutEnd = self->fSessionStats.minHRAfterWorkoutEnd;
    double maxHRAfterWorkoutEnd = self->fSessionStats.maxHRAfterWorkoutEnd;
    double oneMinusFHRAfterWorkoutEnd = self->fSessionStats.oneMinusFHRAfterWorkoutEnd;
    double peakHrOneMinusFhr = self->fSessionStats.peakHrOneMinusFhr;
    int estimationStatus = self->fSessionStats.estimationStatus;
    int vo2MaxValue = self->fSessionStats.vo2MaxValue;
    double lambda = self->fSessionStats.lambda;
    double meanSquaredError = self->fSessionStats.meanSquaredError;
    double explainedVarianceScore = self->fSessionStats.explainedVarianceScore;
    int sessionType = self->fSessionStats.sessionType;
    int64_t workoutType = self->fSessionStats.workoutType;
    double sessionDuration = self->fSessionStats.sessionDuration;
    unsigned int hrRecoveryAlgorithmVersion = self->fSessionStats.hrRecoveryAlgorithmVersion;
    *(_DWORD *)buf = 134227968;
    double v178 = age;
    __int16 v179 = 1024;
    int v180 = biologicalSex;
    __int16 v181 = 1024;
    BOOL v182 = betaBlockerUse;
    __int16 v183 = 2048;
    double v184 = userBMI;
    __int16 v185 = 2048;
    double v186 = sevenDayRestingHR;
    __int16 v187 = 2048;
    double v188 = hrmax;
    __int16 v189 = 1024;
    int v190 = status;
    __int16 v191 = 2048;
    double v192 = diffTimeRecoveryOnsetWorkout;
    __int16 v193 = 2048;
    double v194 = diffTimeTDropWorkoutEnd;
    __int16 v195 = 1024;
    int v196 = hrRecovery;
    __int16 v197 = 1024;
    int v198 = hrRecoverySession;
    __int16 v199 = 2048;
    double v200 = peakHR;
    __int16 v201 = 2048;
    double v202 = steadyStateHR;
    __int16 v203 = 2048;
    double v204 = hrMinAdjusted;
    __int16 v205 = 2048;
    double v206 = observedHRRecovery;
    __int16 v207 = 2048;
    double v208 = recoveryLoad;
    __int16 v209 = 2048;
    double v210 = maxRecoveryHR;
    __int16 v211 = 2048;
    double v212 = minRecoveryHR;
    __int16 v213 = 2048;
    double v214 = recoveryMetsMean;
    __int16 v215 = 2048;
    double v216 = recoveryMetsStdDev;
    __int16 v217 = 2048;
    double v218 = biasAdjustment;
    __int16 v219 = 1024;
    BOOL v220 = isOtherwiseEligibleForLongitudinal;
    __int16 v221 = 2048;
    double v222 = hrRecoveryReference;
    __int16 v223 = 2048;
    double v224 = hrRecoveryReferencePeak;
    __int16 v225 = 2048;
    double v226 = hrOneMinPostRecovery;
    __int16 v227 = 2048;
    double v228 = hrOneMinExponential;
    __int16 v229 = 1024;
    BOOL v230 = isEligibleForHK;
    __int16 v231 = 2048;
    double v232 = minHRAfterWorkoutEnd;
    __int16 v233 = 2048;
    double v234 = maxHRAfterWorkoutEnd;
    __int16 v235 = 2048;
    double v236 = oneMinusFHRAfterWorkoutEnd;
    __int16 v237 = 2048;
    double v238 = peakHrOneMinusFhr;
    __int16 v239 = 1024;
    int v240 = estimationStatus;
    __int16 v241 = 1024;
    int v242 = vo2MaxValue;
    __int16 v243 = 2048;
    double v244 = lambda;
    __int16 v245 = 2048;
    double v246 = meanSquaredError;
    __int16 v247 = 2048;
    double v248 = explainedVarianceScore;
    __int16 v249 = 1024;
    int v250 = sessionType;
    __int16 v251 = 1024;
    int v252 = workoutType;
    __int16 v253 = 2048;
    double v254 = sessionDuration;
    __int16 v255 = 1024;
    unsigned int v256 = hrRecoveryAlgorithmVersion;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "HRRecovery Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,sevenDayRestingHR,%.2f,hrmax,%.2f,st atus,%d,diffTimeRecoveryOnsetWorkout,%.2f,diffTimeTDropWorkoutEnd,%.2f,hrRecovery,%d,hrRecoverySession,%d,peakHR,% .2f,steadyStateHR,%.2f,hrMinAdjusted,%.2f,observedHRRecovery,%.2f,recoveryLoad,%.2f,maxRecoveryHR,%.2f,minRecovery HR,%.2f,recoveryMetsMean,%.2f,recoveryMetsStdDev,%.2f,biasAdjustment,%.2f,isOtherwiseEligibleForLongitudinal,%d,hr RecoveryReference,%.2f,hrRecoveryReferencePeak,%.2f,hrOneMinPostRecovery,%.2f,hrOneMinExponential,%.2f,isEligibleF orHK,%d,minHRAfterWorkoutEnd,%.2f,maxHRAfterWorkoutEnd,%.2f,oneMinusFHRAfterWorkoutEnd,%.2f,peakHrOneMinusFhr,%.2f ,vo2MaxestimationStatus,%d,vo2MaxValue,%d,lambda,%.2f,mse,%.2f,evs,%.2f,sessionType,%d,workoutType,%d,sessionDurat ion,%.2f,hrRecoveryAlgorithmVersion,%d",  buf,  0x162u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    double v56 = self->fSessionStats.age;
    int v57 = p_fSessionStats->biologicalSex;
    BOOL v58 = self->fSessionStats.betaBlockerUse;
    double v59 = self->fSessionStats.userBMI;
    double v60 = self->fSessionStats.sevenDayRestingHR;
    double v61 = self->fSessionStats.hrmax;
    int v62 = self->fSessionStats.status;
    double v64 = self->fSessionStats.diffTimeRecoveryOnsetWorkout;
    double v63 = self->fSessionStats.diffTimeTDropWorkoutEnd;
    int v65 = self->fSessionStats.hrRecovery;
    int v66 = self->fSessionStats.hrRecoverySession;
    double v67 = self->fSessionStats.peakHR;
    double v68 = self->fSessionStats.steadyStateHR;
    double v69 = self->fSessionStats.hrMinAdjusted;
    double v70 = self->fSessionStats.observedHRRecovery;
    double v71 = self->fSessionStats.recoveryLoad;
    double v72 = self->fSessionStats.maxRecoveryHR;
    double v73 = self->fSessionStats.minRecoveryHR;
    double v74 = self->fSessionStats.recoveryMetsMean;
    double v75 = self->fSessionStats.recoveryMetsStdDev;
    double v76 = self->fSessionStats.biasAdjustment;
    BOOL v77 = self->fSessionStats.isOtherwiseEligibleForLongitudinal;
    double v78 = self->fSessionStats.hrRecoveryReference;
    double v79 = self->fSessionStats.hrRecoveryReferencePeak;
    double v80 = self->fSessionStats.hrOneMinPostRecovery;
    double v81 = self->fSessionStats.hrOneMinExponential;
    BOOL v82 = self->fSessionStats.isEligibleForHK;
    double v83 = self->fSessionStats.minHRAfterWorkoutEnd;
    double v84 = self->fSessionStats.maxHRAfterWorkoutEnd;
    double v85 = self->fSessionStats.oneMinusFHRAfterWorkoutEnd;
    double v86 = self->fSessionStats.peakHrOneMinusFhr;
    int v88 = self->fSessionStats.estimationStatus;
    int v87 = self->fSessionStats.vo2MaxValue;
    double v89 = self->fSessionStats.lambda;
    double v90 = self->fSessionStats.meanSquaredError;
    double v91 = self->fSessionStats.explainedVarianceScore;
    int v92 = self->fSessionStats.sessionType;
    int64_t v93 = self->fSessionStats.workoutType;
    double v94 = self->fSessionStats.sessionDuration;
    unsigned int v95 = self->fSessionStats.hrRecoveryAlgorithmVersion;
    int v97 = 134227968;
    double v98 = v56;
    __int16 v99 = 1024;
    int v100 = v57;
    __int16 v101 = 1024;
    BOOL v102 = v58;
    __int16 v103 = 2048;
    double v104 = v59;
    __int16 v105 = 2048;
    double v106 = v60;
    __int16 v107 = 2048;
    double v108 = v61;
    __int16 v109 = 1024;
    int v110 = v62;
    __int16 v111 = 2048;
    double v112 = v64;
    __int16 v113 = 2048;
    double v114 = v63;
    __int16 v115 = 1024;
    int v116 = v65;
    __int16 v117 = 1024;
    int v118 = v66;
    __int16 v119 = 2048;
    double v120 = v67;
    __int16 v121 = 2048;
    double v122 = v68;
    __int16 v123 = 2048;
    double v124 = v69;
    __int16 v125 = 2048;
    double v126 = v70;
    __int16 v127 = 2048;
    double v128 = v71;
    __int16 v129 = 2048;
    double v130 = v72;
    __int16 v131 = 2048;
    double v132 = v73;
    __int16 v133 = 2048;
    double v134 = v74;
    __int16 v135 = 2048;
    double v136 = v75;
    __int16 v137 = 2048;
    double v138 = v76;
    __int16 v139 = 1024;
    BOOL v140 = v77;
    __int16 v141 = 2048;
    double v142 = v78;
    __int16 v143 = 2048;
    double v144 = v79;
    __int16 v145 = 2048;
    double v146 = v80;
    __int16 v147 = 2048;
    double v148 = v81;
    __int16 v149 = 1024;
    BOOL v150 = v82;
    __int16 v151 = 2048;
    double v152 = v83;
    __int16 v153 = 2048;
    double v154 = v84;
    __int16 v155 = 2048;
    double v156 = v85;
    __int16 v157 = 2048;
    double v158 = v86;
    __int16 v159 = 1024;
    int v160 = v88;
    __int16 v161 = 1024;
    int v162 = v87;
    __int16 v163 = 2048;
    double v164 = v89;
    __int16 v165 = 2048;
    double v166 = v90;
    __int16 v167 = 2048;
    double v168 = v91;
    __int16 v169 = 1024;
    int v170 = v92;
    __int16 v171 = 1024;
    int v172 = v93;
    __int16 v173 = 2048;
    double v174 = v94;
    __int16 v175 = 1024;
    unsigned int v176 = v95;
    v96 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  2LL,  "HRRecovery Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,sevenDayRestingHR,%.2f ,hrmax,%.2f,status,%d,diffTimeRecoveryOnsetWorkout,%.2f,diffTimeTDropWorkoutEnd,%.2f,hrRecovery,%d,h rRecoverySession,%d,peakHR,%.2f,steadyStateHR,%.2f,hrMinAdjusted,%.2f,observedHRRecovery,%.2f,recove ryLoad,%.2f,maxRecoveryHR,%.2f,minRecoveryHR,%.2f,recoveryMetsMean,%.2f,recoveryMetsStdDev,%.2f,bias Adjustment,%.2f,isOtherwiseEligibleForLongitudinal,%d,hrRecoveryReference,%.2f,hrRecoveryReferencePe ak,%.2f,hrOneMinPostRecovery,%.2f,hrOneMinExponential,%.2f,isEligibleForHK,%d,minHRAfterWorkoutEnd,% .2f,maxHRAfterWorkoutEnd,%.2f,oneMinusFHRAfterWorkoutEnd,%.2f,peakHrOneMinusFhr,%.2f,vo2Maxestimatio nStatus,%d,vo2MaxValue,%d,lambda,%.2f,mse,%.2f,evs,%.2f,sessionType,%d,workoutType,%d,sessionDuratio n,%.2f,hrRecoveryAlgorithmVersion,%d",  COERCE_DOUBLE(&v97),  354);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHRRecoveryService logSessionStats:]", "%s\n", v96);
  }

  -[CLHRRecoveryService sendAnalytics](self, "sendAnalytics");
}

- (void)sendAnalytics
{
  if (objc_opt_class(&OBJC_CLASS___MCProfileConnection)
    && (objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_101993DE0);
    if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_101993DE0))
    {
      LODWORD(v12) = 1153138688;
      *(_OWORD *)buf = xmmword_1012E3800;
      sub_1001B4118(&qword_101993DC8, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_101993DC8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_101993DE0);
    }

    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&qword_101993E00);
    if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_101993E00))
    {
      int v13 = 1118961664;
      *(_OWORD *)buf = xmmword_1012E3814;
      __int128 v12 = unk_1012E3824;
      sub_1001B4118(&qword_101993DE8, buf, 9uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_101993DE8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_101993E00);
    }

    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&qword_101993E20);
    if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_101993E20))
    {
      LODWORD(v12) = 1108056474;
      *(_OWORD *)buf = xmmword_1012E3838;
      sub_1001B4118(&qword_101993E08, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_101993E08, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_101993E20);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100276DA4;
    v9[3] = &unk_101820740;
    v9[4] = self;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.HRRecoveryEstimate", v9);
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    unint64_t v6 = (os_log_s *)qword_101934778;
    if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Sent Core Analytics event", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934770 != -1) {
        dispatch_once(&qword_101934770, &stru_10182D028);
      }
      v10[0] = 0;
      int v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  1LL,  "Sent Core Analytics event",  v10,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHRRecoveryService sendAnalytics]", "%s\n", v7);
LABEL_23:
    }
  }

  else
  {
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10182D028);
    }
    uint64_t v8 = (os_log_s *)qword_101934778;
    if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "HRRecovery, not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934770 != -1) {
        dispatch_once(&qword_101934770, &stru_10182D028);
      }
      v10[0] = 0;
      int v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  2LL,  "HRRecovery, not sending analytics, no IHA permission",  v10,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHRRecoveryService sendAnalytics]", "%s\n", v7);
      goto LABEL_23;
    }
  }

- (void).cxx_destruct
{
  value = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  unsigned __int8 v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  unsigned __int8 v5 = self->fCatherineClient.__ptr_.__value_;
  self->fCatherineClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  unint64_t v6 = self->fHRRecoveryEstimator.__ptr_.__value_;
  self->fHRRecoveryEstimator.__ptr_.__value_ = 0LL;
  if (v6) {
    sub_100277A98((uint64_t)&self->fHRRecoveryEstimator, v6);
  }
  sub_1001B4F90((uint64_t *)&self->fSessionAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fSessionDb);
  sub_1001B4F90((uint64_t *)&self->fInputWRAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fInputWRDb);
  sub_1001B4F90((uint64_t *)&self->fInputHRAggregator, 0LL);
  sub_10000AE14((uint64_t)&self->fInputHRDb);
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
  *((void *)self + 11) = 0LL;
  *((_DWORD *)self + 24) = 0;
  __asm { FMOV            V0.2S, #-1.0 }

  *(void *)((char *)self + 100) = _D0;
  *((_BYTE *)self + 108) = 0;
  *((_DWORD *)self + 28) = 0;
  *(int64x2_t *)((char *)self + 120) = vdupq_n_s64(0xC7EFFFFFE0000000LL);
  *((void *)self + 17) = -1LL;
  __asm { FMOV            V2.4S, #-1.0 }

  *((_OWORD *)self + 9) = xmmword_1012E37F0;
  *((_OWORD *)self + 10) = _Q2;
  *((void *)self + 22) = _D0;
  *((_BYTE *)self + 184) = 0;
  *(_OWORD *)((char *)self + 188) = _Q2;
  *((_BYTE *)self + 204) = 0;
  *((_OWORD *)self + 13) = _Q2;
  *((void *)self + 28) = _D0;
  *((void *)self + 29) = -13LL;
  *((void *)self + 30) = _D0;
  *((void *)self + 33) = 0x1BF800000LL;
  *((void *)self + 31) = 3212836864LL;
  *((void *)self + 34) = 0LL;
  *((void *)self + 35) = 0LL;
  *((void *)self + 32) = 0LL;
  *((void *)self + 36) = 0LL;
  return self;
}

@end