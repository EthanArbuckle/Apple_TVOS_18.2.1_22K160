@interface CLContextManagerWaterSubmersionDemo
+ (double)boundedIncrementBetweenStart:(double)a3 andStop:(double)a4 withCurrent:(double)a5 withIncrement:(double *)a6;
+ (double)incrementTowardsTarget:(double)result andCurrent:(double)a4 withIncrement:(double)a5;
+ (double)settleToTemperatureFromStart:(double)a3 toStop:(double)a4 withCurrent:(double)a5 withDecrement:(double)a6;
- (CLContextManagerWaterSubmersionDemo)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (float)targetPressure;
- (void)dealloc;
- (void)demoDepthUpdate_bounce;
- (void)pauseEvent_bounce;
- (void)resumeEvent_bounce;
- (void)retrieveCachedSubmersionState;
- (void)startUpdates;
- (void)stopUpdates;
- (void)updateEvent_bounce:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)updateTargetDemoDepth;
@end

@implementation CLContextManagerWaterSubmersionDemo

- (CLContextManagerWaterSubmersionDemo)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184EA80);
  }
  v11 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Demo context manager started", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    LOWORD(v48[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "Demo context manager started",  v48,  2);
    v24 = (uint8_t *)v23;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionDemo initWithUniverse:delegate:withBuffer:withSourceAggregator:]",  "%s\n",  v23);
    if (v24 != buf) {
      free(v24);
    }
  }

  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersionDemo;
  v12 = -[CLContextManagerWaterSubmersionBase initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v49,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  v13 = v12;
  if (v12)
  {
    -[CLContextManagerWaterSubmersionDemo retrieveCachedSubmersionState](v12, "retrieveCachedSubmersionState");
    v13->_measurementTimer = (CLTimer *)objc_msgSend(objc_msgSend(a3, "silo"), "newTimer");
    -[CLContextManagerWaterSubmersionBase setSubmersionState:](v13, "setSubmersionState:", 100LL);
    for (uint64_t i = 0LL; i != 5; ++i)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  v13,  (CFNotificationCallback)sub_100793C40,  off_10184E9F8[i],  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    }

    *(void *)buf = 0LL;
    v51 = buf;
    uint64_t v52 = 0x2020000000LL;
    uint64_t v53 = 0x405954CCCCCCCCCDLL;
    -[CLContextManagerWaterSubmersionDemo updateTargetDemoDepth](v13, "updateTargetDemoDepth");
    LODWORD(v47[0]) = 1036831949;
    sub_101206C88((unsigned __int8 *)v48, "DemoMetersPerSecond", v47, 0);
    float v16 = *((float *)v48 + 1);
    LOBYTE(v47[0]) = 1;
    sub_1012049AC((unsigned __int8 *)v48, "DemoCycleMinMaxDepth", (unsigned __int8 *)v47, 0);
    char v17 = BYTE1(v48[0]);
    v48[0] = 0LL;
    v48[1] = v48;
    v48[2] = 0x2020000000LL;
    *(double *)&v48[3] = v16 * 1020.0 * 9.80665016 / 1000.0;
    v47[0] = 0LL;
    v47[1] = v47;
    v47[2] = 0x2020000000LL;
    v47[3] = 0x40595407FC6B3FB5LL;
    uint64_t v43 = 0LL;
    v44 = (double *)&v43;
    uint64_t v45 = 0x2020000000LL;
    LODWORD(v38) = 1101004800;
    sub_101206C88((unsigned __int8 *)v42, "DemoInitialTemperature", &v38, 0);
    double v46 = *((float *)v42 + 1);
    v42[0] = 0LL;
    v42[1] = v42;
    uint64_t v18 = *((void *)v44 + 3);
    v42[2] = 0x2020000000LL;
    v42[3] = v18;
    uint64_t v38 = 0LL;
    v39 = (double *)&v38;
    uint64_t v40 = 0x2020000000LL;
    LODWORD(v30) = 1094713344;
    sub_101206C88((unsigned __int8 *)&v34, "DemoFinalTemperature", &v30, 0);
    double v41 = *((float *)&v34 + 1);
    uint64_t v34 = 0LL;
    v35 = (double *)&v34;
    uint64_t v36 = 0x2020000000LL;
    uint64_t v37 = 0x4014000000000000LL;
    uint64_t v30 = 0LL;
    v31 = (double *)&v30;
    uint64_t v32 = 0x2020000000LL;
    uint64_t v33 = 0x3FF0000000000000LL;
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x2020000000LL;
    v29[3] = 0x4014000000000000LL;
    LODWORD(v27[0]) = 1106247680;
    sub_101206C88((unsigned __int8 *)v28, "DemoTemperatureSettlingTime", v27, 0);
    double v19 = *((float *)v28 + 1);
    v28[0] = 0LL;
    v28[1] = v28;
    double v20 = (v44[3] - v39[3]) / v19;
    v28[2] = 0x2020000000LL;
    *(double *)&v28[3] = v20;
    v27[0] = 0LL;
    v27[1] = v27;
    double v21 = v35[3] - v31[3];
    v27[2] = 0x2020000000LL;
    *(double *)&v27[3] = v21 / v19;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100793E94;
    v25[3] = &unk_10184EA28;
    char v26 = v17;
    v25[4] = v13;
    v25[5] = buf;
    v25[6] = v48;
    v25[7] = v42;
    v25[8] = &v43;
    v25[9] = &v38;
    v25[10] = v28;
    v25[11] = v29;
    v25[12] = &v34;
    v25[13] = &v30;
    v25[14] = v27;
    v25[15] = v47;
    -[CLTimer setHandler:](v13->_measurementTimer, "setHandler:", v25);
    -[CLContextManagerWaterSubmersionDemo startUpdates](v13, "startUpdates");
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(v47, 8);
    _Block_object_dispose(v48, 8);
    _Block_object_dispose(buf, 8);
  }

  return v13;
}

- (float)targetPressure
{
  return self->_targetDemoDepth * 9.80665016 + 101.325;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersionDemo;
  -[CLContextManagerWaterSubmersionBase dealloc](&v4, "dealloc");
}

- (void)updateEvent_bounce:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  ptr = a3.__ptr_;
  id v5 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo", a3.__ptr_, a3.__cntrl_);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3321888768LL;
  v13[2] = sub_10079422C;
  v13[3] = &unk_10184EA50;
  uint64_t v7 = *(void *)ptr;
  v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
  v13[4] = self;
  v13[5] = v7;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }

  [v5 async:v13];
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

- (void)pauseEvent_bounce
{
  id v3 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100794364;
  v4[3] = &unk_10181A288;
  v4[4] = self;
  [v3 async:v4];
}

- (void)resumeEvent_bounce
{
  id v3 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1007943DC;
  v4[3] = &unk_10181A288;
  v4[4] = self;
  [v3 async:v4];
}

- (void)demoDepthUpdate_bounce
{
  id v3 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100794454;
  v4[3] = &unk_10181A288;
  v4[4] = self;
  [v3 async:v4];
}

- (void)retrieveCachedSubmersionState
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersionDemo;
  -[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState](&v8, "retrieveCachedSubmersionState");
  if (self)
  {
    -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
  }

  -[CLContextManagerWaterSubmersionBase updateSubmersionStateFromAOPState:]( self,  "updateSubmersionStateFromAOPState:",  &v6);
  id v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

+ (double)settleToTemperatureFromStart:(double)a3 toStop:(double)a4 withCurrent:(double)a5 withDecrement:(double)a6
{
  if (a3 >= a4) {
    double v6 = a4;
  }
  else {
    double v6 = a3;
  }
  if (a3 < a4) {
    a3 = a4;
  }
  double v7 = a5 - a6;
  if (a3 < v7 || v7 < v6) {
    return a4;
  }
  else {
    return v7;
  }
}

+ (double)boundedIncrementBetweenStart:(double)a3 andStop:(double)a4 withCurrent:(double)a5 withIncrement:(double *)a6
{
  if (a3 >= a4) {
    double v6 = a4;
  }
  else {
    double v6 = a3;
  }
  if (a3 >= a4) {
    double v7 = a3;
  }
  else {
    double v7 = a4;
  }
  double v8 = *a6;
  double result = *a6 + a5;
  if (result < v6 || v7 < result)
  {
    *a6 = -v8;
    return a5 - v8;
  }

  return result;
}

+ (double)incrementTowardsTarget:(double)result andCurrent:(double)a4 withIncrement:(double)a5
{
  double v5 = fabs(a5);
  if (vabdd_f64(result, a4) > v5)
  {
    if (result - a4 >= 0.0) {
      return v5 + a4;
    }
    else {
      return a4 - v5;
    }
  }

  return result;
}

- (void)startUpdates
{
}

- (void)stopUpdates
{
}

- (void)updateTargetDemoDepth
{
  *(float *)&double v3 = v3;
  int v4 = LODWORD(v3);
  sub_101206C88(v5, "DemoMaxDepthMeters", &v4, 0);
  self->_targetDemoDepth = v6;
}

@end