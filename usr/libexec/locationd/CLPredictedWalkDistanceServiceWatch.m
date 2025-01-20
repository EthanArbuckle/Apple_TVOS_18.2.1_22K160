@interface CLPredictedWalkDistanceServiceWatch
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLPredictedWalkDistanceServiceWatch)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)onAddBout:(CLPredictedWalkDistanceBoutEntry *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)setUpAggregationOnTimer;
@end

@implementation CLPredictedWalkDistanceServiceWatch

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997228 != -1) {
    dispatch_once(&qword_101997228, &stru_101841F48);
  }
  return (id)qword_101997220;
}

- (CLPredictedWalkDistanceServiceWatch)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPredictedWalkDistanceServiceWatch;
  return -[CLPredictedWalkDistanceServiceWatch initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceWatchProtocol,  &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceWatchClientProtocol);
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  if (qword_1019346C0 != -1) {
    dispatch_once(&qword_1019346C0, &stru_101841F68);
  }
  objc_super v3 = (os_log_s *)qword_1019346C8;
  if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Starting up CLPredictedWalkDistanceServiceWatch",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_101841F68);
    }
    v38[0] = 0;
    LODWORD(v37) = 2;
    v36 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  1LL,  "Starting up CLPredictedWalkDistanceServiceWatch",  v38,  v37);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPredictedWalkDistanceServiceWatch beginService]", "%s\n", v36);
  }

  HIBYTE(v37) = 0;
  sub_1001B4CA0((unsigned __int8 *)&v37 + 7, buf);
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
  v16 = (CLPredictedWalkDistanceBoutDetector *)operator new(0x170uLL);
  v17 = v16;
  v18 = self->fBoutDb.__cntrl_;
  if (p_fBoutDb->__ptr_) {
    uint64_t v19 = (uint64_t)p_fBoutDb->__ptr_ + 424;
  }
  else {
    uint64_t v19 = 0LL;
  }
  *(void *)buf = v19;
  *(void *)&buf[8] = v18;
  if (v18)
  {
    v20 = (unint64_t *)((char *)v18 + 8);
    do
      unint64_t v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }

  v22.n128_f64[0] = sub_10036E474((uint64_t)v16, buf);
  v23 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v24 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v23->__on_zero_shared)(v23, v22);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

  value = self->fBoutDetector.__ptr_.__value_;
  self->fBoutDetector.__ptr_.__value_ = v17;
  if (value)
  {
    sub_1005C0B5C((uint64_t)&self->fBoutDetector, value);
    v17 = self->fBoutDetector.__ptr_.__value_;
  }

  *((void *)v17 + 39) = sub_1005C0080;
  *((void *)v17 + 40) = self;
  -[CLPredictedWalkDistanceServiceWatch setUpAggregationOnTimer](self, "setUpAggregationOnTimer", v22.n128_f64[0]);
  sub_100468458((uint64_t)sub_1005C00CC, (uint64_t)self, self, buf);
  v27 = *(Client **)buf;
  *(void *)buf = 0LL;
  v28 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = v27;
  if (v28)
  {
    (*(void (**)(Client *))(*(void *)v28 + 8LL))(v28);
    uint64_t v29 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v29) {
      (*(void (**)(uint64_t))(*(void *)v29 + 8LL))(v29);
    }
  }

  [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  sub_101037234((uint64_t)sub_1005C00DC, (uint64_t)self, self, buf);
  v30 = *(Client **)buf;
  *(void *)buf = 0LL;
  v31 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = v30;
  if (v31)
  {
    (*(void (**)(Client *))(*(void *)v31 + 8LL))(v31);
    uint64_t v32 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v32) {
      (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
    }
  }

  [*((id *)self->fStepCountClient.__ptr_.__value_ + 2) register:*((void *)self->fStepCountClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  sub_100E18F18((uint64_t)sub_1005C00EC, (uint64_t)self, self, buf);
  v33 = *(Client **)buf;
  *(void *)buf = 0LL;
  v34 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = v33;
  if (v34)
  {
    (*(void (**)(Client *))(*(void *)v34 + 8LL))(v34);
    uint64_t v35 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v35) {
      (*(void (**)(uint64_t))(*(void *)v35 + 8LL))(v35);
    }
  }

  [*((id *)self->fUserInfoClient.__ptr_.__value_ + 2) register:*((void *)self->fUserInfoClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
}

- (void)endService
{
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
  v4 = self->fStepCountClient.__ptr_.__value_;
  if (v4) {
    [*((id *)v4 + 2) unregister:*((void *)v4 + 1) forNotification:0];
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
}

- (void)onAddBout:(CLPredictedWalkDistanceBoutEntry *)a3
{
  if (qword_1019346C0 != -1) {
    dispatch_once(&qword_1019346C0, &stru_101841F68);
  }
  unint64_t v5 = (os_log_s *)qword_1019346C8;
  if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Attempting to send ids message from watch to phone",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_101841F68);
    }
    v8[0] = 0;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "Attempting to send ids message from watch to phone",  v8,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPredictedWalkDistanceServiceWatch onAddBout:]", "%s\n", v6);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1005C03C4;
  v7[3] = &unk_101840D20;
  v7[4] = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, 120LL);
  objc_msgSend( objc_msgSend( objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLCompanionNotifier"),  "doAsync:",  v7);
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_101841F68);
    }
    unint64_t v7 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "CLPredictedWalkDistanceServiceWatch: Received user info update",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_101841F68);
      }
      LOWORD(v13[0]) = 0;
      v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  2LL,  "CLPredictedWalkDistanceServiceWatch: Received user info update",  v13,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceWatch onUserInfoUpdate:data:]",  "%s\n",  v10);
    }

    sub_100370AD0((uint64_t)self->fBoutDetector.__ptr_.__value_, (__int128 *)a4);
  }

  else
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_101841F68);
    }
    v8 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *a3;
      *(_DWORD *)buf = 67109120;
      int v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#Warning Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_101841F68);
      }
      int v11 = *a3;
      v13[0] = 67109120;
      v13[1] = v11;
      unint64_t v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  0LL,  "#Warning Unhandled notification type, %d",  v13);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceServiceWatch onUserInfoUpdate:data:]",  "%s\n",  v12);
    }
  }

- (void)setUpAggregationOnTimer
{
  int v13 = 86400;
  uint64_t v3 = sub_1006E27E8();
  sub_100413284(v3, &v11);
  sub_1002A7CB0(v11, "P6MWDAggregationTimeInterval", &v13);
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
  v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CLPredictedWalkDistanceServiceWatch universe](self, "universe"),  "silo"),  "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0LL, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1005C0878;
  v10[3] = &unk_10181A288;
  v10[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void).cxx_destruct
{
  value = self->fBoutDetector.__ptr_.__value_;
  self->fBoutDetector.__ptr_.__value_ = 0LL;
  if (value) {
    sub_1005C0B5C((uint64_t)&self->fBoutDetector, value);
  }
  v4 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  unint64_t v5 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
  }
  unint64_t v6 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
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
  return self;
}

@end