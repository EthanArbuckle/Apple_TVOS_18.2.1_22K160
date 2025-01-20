@interface CLContextManagerWaterSubmersionBase
- (BOOL)inSwimmingWorkout;
- (BOOL)sampleShouldBeWrittenToHK:(id)a3;
- (BOOL)updatingHK;
- (BOOL)updatingSurfacePressure;
- (CLContextManagerWaterSubmersionBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLSubmersionDataCollector)hkCollector;
- (CLSubmersionStateMachine)submersionStateMachine;
- (CLWaterSubmersionMeasurement)deepestDepthForHK;
- (double)lastDefaultLevelLogTimestamp;
- (double)lastHKUpdate;
- (double)timeBetweenHKUpdates;
- (id).cxx_construct;
- (int64_t)externalSubmersionState;
- (int64_t)submersionState;
- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)aopSubmersionState;
- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4;
- (void)dealloc;
- (void)notificationAcknowledged:(unint64_t)a3;
- (void)notifyHKUpdates:(id)a3;
- (void)onDeepSubmersion:(double)a3 withStateChanged:(BOOL)a4;
- (void)onMotionStateMediatorData:(NotificationData *)a3;
- (void)onNotSubmerged;
- (void)onShallowSubmersion:(double)a3 withStateChanged:(BOOL)a4;
- (void)retrieveCachedSubmersionState;
- (void)saveCachedSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)setAopSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)setDeepestDepthForHK:(id)a3;
- (void)setExternalSubmersionState:(int64_t)a3;
- (void)setHkCollector:(id)a3;
- (void)setInSwimmingWorkout:(BOOL)a3;
- (void)setLastDefaultLevelLogTimestamp:(double)a3;
- (void)setLastHKUpdate:(double)a3;
- (void)setSubmersionState:(int64_t)a3;
- (void)setSubmersionStateMachine:(id)a3;
- (void)setTimeBetweenHKUpdates:(double)a3;
- (void)setUpdatingHK:(BOOL)a3;
- (void)setUpdatingSurfacePressure:(BOOL)a3;
- (void)startHKCollector:(double)a3;
- (void)startSubmersionPowerAssertion;
- (void)stopHKCollector;
- (void)updateClientsSubmersionMeasurement:(id)a3;
- (void)updateClientsSubmersionState:(id)a3;
- (void)updateSubmersionStateFromAOPState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3;
- (void)updateSubmersionStateFromMeasurement:(id)a3;
@end

@implementation CLContextManagerWaterSubmersionBase

- (CLContextManagerWaterSubmersionBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersionBase;
  v7 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v23,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  uint64_t v8 = (uint64_t)v7;
  if (v7)
  {
    v7->_submersionState = 0LL;
    v7->_externalSubmersionState = 0LL;
    v9 = operator new(0x28uLL);
    v9[2] = 0LL;
    void *v9 = off_10184EAB0;
    v9[1] = 0LL;
    v9[4] = 0LL;
    *((void *)&v22 + 1) = v9;
    v9[3] = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)&__int128 v22 = v9 + 3;
    sub_10005F550(v8 + 144, &v22);
    v10 = (std::__shared_weak_count *)*((void *)&v22 + 1);
    if (*((void *)&v22 + 1))
    {
      v11 = (unint64_t *)(*((void *)&v22 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    uint64_t v13 = *(void *)(v8 + 144);
    *(_BYTE *)(v13 + 8) = 1;
    *(void *)uint64_t v13 = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)(v8 + 104) = -[CLSubmersionStateMachine initWithType:]( objc_alloc(&OBJC_CLASS___CLSubmersionStateMachine),  "initWithType:",  1LL);
    *(_BYTE *)(v8 + 74) = 0;
    *(_BYTE *)(v8 + 72) = 0;
    *(_BYTE *)(v8 + 73) = 0;
    int v21 = 1075838976;
    sub_101206C88((unsigned __int8 *)&v22, "SubmersionHKDecimationTime", &v21, 0);
    *(double *)(v8 + 136) = *((float *)&v22 + 1);
    *(void *)(v8 + 128) = 0LL;
    *(void *)(v8 + 112) = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)(v8 + 96) = -[CLSubmersionDataCollector initWithUniverse:andStateMachine:]( objc_alloc(&OBJC_CLASS___CLSubmersionDataCollector),  "initWithUniverse:andStateMachine:",  a3,  *(void *)(v8 + 104));
    v14 = operator new(0x30uLL);
    sub_100AD558C((uint64_t)v14, (uint64_t)"SubmersionAssertion", v8, 10.0);
    uint64_t v15 = *(void *)(v8 + 48);
    *(void *)(v8 + 48) = v14;
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 8LL))(v15);
    }
    id v16 = objc_msgSend(objc_msgSend(*(id *)(v8 + 8), "silo"), "newTimer");
    *(void *)(v8 + 56) = v16;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10078D1A4;
    v20[3] = &unk_10181A288;
    v20[4] = v8;
    [v16 setHandler:v20];
    v17 = operator new(0x30uLL);
    sub_100AD558C((uint64_t)v17, (uint64_t)"SubmersionDeepAssertionForHK", v8, 10800.0);
    uint64_t v18 = *(void *)(v8 + 64);
    *(void *)(v8 + 64) = v17;
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 8LL))(v18);
    }
    *(void *)(v8 + 120) = 0x7FEFFFFFFFFFFFFFLL;
  }

  return (CLContextManagerWaterSubmersionBase *)v8;
}

- (void)dealloc
{
  self->_deepestDepthForHK = 0LL;
  self->_hkCollector = 0LL;

  self->_submersionStateMachine = 0LL;
  -[CLTimer invalidate](self->_submersionPowerAssertionTimer, "invalidate");

  self->_submersionPowerAssertionTimer = 0LL;
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionSubmersion.__ptr_.__value_ = 0LL;
    goto LABEL_5;
  }

  sub_100AD5D38((uint64_t)value);
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  self->_powerAssertionSubmersion.__ptr_.__value_ = 0LL;
  if (value) {
LABEL_5:
  }
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
  v4 = self->_powerAssertionHK.__ptr_.__value_;
  if (*((int *)v4 + 2) <= 0)
  {
    self->_powerAssertionHK.__ptr_.__value_ = 0LL;
  }

  else
  {
    sub_100AD5D38((uint64_t)v4);
    v4 = self->_powerAssertionHK.__ptr_.__value_;
    self->_powerAssertionHK.__ptr_.__value_ = 0LL;
    if (!v4) {
      goto LABEL_11;
    }
  }

  (*(void (**)(CLPowerAssertion *))(*(void *)v4 + 8LL))(v4);
LABEL_11:
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersionBase;
  -[CLBarometerCalibrationContextManager dealloc](&v5, "dealloc");
}

- (void)startHKCollector:(double)a3
{
  if (*((int *)self->_powerAssertionHK.__ptr_.__value_ + 2) <= 0)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    objc_super v5 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "power assertion for writing to HK,timestamp,%{public}f,assertionState,1,reason,submergedDeep",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v7 = qword_1019346A8;
      int v12 = 134349056;
      CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  0LL,  "power assertion for writing to HK,timestamp,%{public}f,assertionState,1,reason,submergedDeep",  &v12,  12);
      v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerWaterSubmersionBase startHKCollector:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }

    value = self->_powerAssertionHK.__ptr_.__value_;
    sub_1010DDBC0(__p, "none");
    sub_100AD5668((uint64_t)value, (uint64_t *)__p);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
  }

  -[CLSubmersionDataCollector startAt:](self->_hkCollector, "startAt:", a3);
}

- (void)stopHKCollector
{
  if (*((int *)self->_powerAssertionHK.__ptr_.__value_ + 2) >= 1)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    v3 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "power assertion for writing to HK,timestamp,%{public}f,assertionState,0,reason,notSubmergedDeep",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v4 = qword_1019346A8;
      int v7 = 134349056;
      CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v4,  0LL,  "power assertion for writing to HK,timestamp,%{public}f,assertionState,0,reason,notSubmergedDeep",  &v7,  12);
      v6 = (uint8_t *)v5;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerWaterSubmersionBase stopHKCollector]", "%s\n", v5);
      if (v6 != buf) {
        free(v6);
      }
    }

    sub_100AD5D38((uint64_t)self->_powerAssertionHK.__ptr_.__value_);
  }

- (void)notifyHKUpdates:(id)a3
{
  hkCollector = self->_hkCollector;
  [a3 startAt];
  -[CLSubmersionDataCollector collectAt:measurement:atSensorLimit:]( hkCollector,  "collectAt:measurement:atSensorLimit:",  a3,  [a3 state] == (id)600,  v5);
}

- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4
{
  if (a4 == 3)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___CLWaterSubmersionState);
    -[CLWaterSubmersionState setStartAt:](v6, "setStartAt:", CFAbsoluteTimeGetCurrent());
    if (-[CLContextManagerWaterSubmersionBase externalSubmersionState](self, "externalSubmersionState"))
    {
      -[CLWaterSubmersionState setState:]( v6,  "setState:",  -[CLContextManagerWaterSubmersionBase externalSubmersionState](self, "externalSubmersionState"));
      [a3 onSubmersionStateUpdate:v6];
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      int v7 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        -[CLWaterSubmersionState startAt](v6, "startAt");
        *(_DWORD *)buf = 134349568;
        CFAbsoluteTime v22 = Current;
        __int16 v23 = 2050;
        uint64_t v24 = v9;
        __int16 v25 = 1026;
        unsigned int v26 = -[CLWaterSubmersionState state](v6, "state");
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "water submersion state sent to new client,timestamp,%{public}f,startAt,%{public}f,state,%{public}d",  buf,  0x1Cu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v10 = qword_1019346A8;
        CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent();
        -[CLWaterSubmersionState startAt](v6, "startAt");
        int v15 = 134349568;
        CFAbsoluteTime v16 = v11;
        __int16 v17 = 2050;
        uint64_t v18 = v12;
        __int16 v19 = 1026;
        unsigned int v20 = -[CLWaterSubmersionState state](v6, "state");
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  0LL,  "water submersion state sent to new client,timestamp,%{public}f,startAt,%{public}f,state,%{public}d",  &v15,  28);
        v14 = (uint8_t *)v13;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase clientConnected:withNotification:]",  "%s\n",  v13);
        if (v14 != buf) {
          free(v14);
        }
      }
    }
  }

- (void)updateClientsSubmersionMeasurement:(id)a3
{
  if (self->_externalSubmersionState == 2
    && vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 15.0)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    double v5 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      uint64_t v8 = v7;
      [a3 pressure];
      uint64_t v10 = v9;
      [a3 depth];
      uint64_t v12 = v11;
      [a3 temperature];
      uint64_t v14 = v13;
      [a3 temperatureUncertainty];
      uint64_t v16 = v15;
      [a3 surfacePressure];
      *(_DWORD *)buf = 134350848;
      CFAbsoluteTime v85 = Current;
      __int16 v86 = 2050;
      uint64_t v87 = v8;
      __int16 v88 = 2050;
      uint64_t v89 = v10;
      __int16 v90 = 2050;
      uint64_t v91 = v12;
      __int16 v92 = 2050;
      uint64_t v93 = v14;
      __int16 v94 = 2050;
      uint64_t v95 = v16;
      __int16 v96 = 2050;
      uint64_t v97 = v17;
      __int16 v98 = 1026;
      unsigned int v99 = [a3 state];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{p ublic}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d",  buf,  0x4Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v53 = qword_1019346A8;
      CFAbsoluteTime v54 = CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      uint64_t v56 = v55;
      [a3 pressure];
      uint64_t v58 = v57;
      [a3 depth];
      uint64_t v60 = v59;
      [a3 temperature];
      uint64_t v62 = v61;
      [a3 temperatureUncertainty];
      uint64_t v64 = v63;
      [a3 surfacePressure];
      int v68 = 134350848;
      CFAbsoluteTime v69 = v54;
      __int16 v70 = 2050;
      uint64_t v71 = v56;
      __int16 v72 = 2050;
      uint64_t v73 = v58;
      __int16 v74 = 2050;
      uint64_t v75 = v60;
      __int16 v76 = 2050;
      uint64_t v77 = v62;
      __int16 v78 = 2050;
      uint64_t v79 = v64;
      __int16 v80 = 2050;
      uint64_t v81 = v65;
      __int16 v82 = 1026;
      unsigned int v83 = [a3 state];
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v53,  0LL,  "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{p ublic}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d",  &v68,  78);
      v67 = (uint8_t *)v66;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:]",  "%s\n",  v66);
      if (v67 != buf) {
        free(v67);
      }
    }

    self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v18 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      uint64_t v21 = v20;
      [a3 pressure];
      uint64_t v23 = v22;
      [a3 depth];
      uint64_t v25 = v24;
      [a3 temperature];
      uint64_t v27 = v26;
      [a3 temperatureUncertainty];
      uint64_t v29 = v28;
      [a3 surfacePressure];
      *(_DWORD *)buf = 134350848;
      CFAbsoluteTime v85 = v19;
      __int16 v86 = 2050;
      uint64_t v87 = v21;
      __int16 v88 = 2050;
      uint64_t v89 = v23;
      __int16 v90 = 2050;
      uint64_t v91 = v25;
      __int16 v92 = 2050;
      uint64_t v93 = v27;
      __int16 v94 = 2050;
      uint64_t v95 = v29;
      __int16 v96 = 2050;
      uint64_t v97 = v30;
      __int16 v98 = 1026;
      unsigned int v99 = [a3 state];
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{p ublic}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d",  buf,  0x4Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v38 = qword_1019346A8;
      CFAbsoluteTime v39 = CFAbsoluteTimeGetCurrent();
      [a3 startAt];
      uint64_t v41 = v40;
      [a3 pressure];
      uint64_t v43 = v42;
      [a3 depth];
      uint64_t v45 = v44;
      [a3 temperature];
      uint64_t v47 = v46;
      [a3 temperatureUncertainty];
      uint64_t v49 = v48;
      [a3 surfacePressure];
      int v68 = 134350848;
      CFAbsoluteTime v69 = v39;
      __int16 v70 = 2050;
      uint64_t v71 = v41;
      __int16 v72 = 2050;
      uint64_t v73 = v43;
      __int16 v74 = 2050;
      uint64_t v75 = v45;
      __int16 v76 = 2050;
      uint64_t v77 = v47;
      __int16 v78 = 2050;
      uint64_t v79 = v49;
      __int16 v80 = 2050;
      uint64_t v81 = v50;
      __int16 v82 = 1026;
      unsigned int v83 = [a3 state];
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v38,  1LL,  "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{p ublic}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d",  &v68,  78);
      v52 = (uint8_t *)v51;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:]",  "%s\n",  v51);
      if (v52 != buf) {
        free(v52);
      }
    }
  }

  if (-[CLContextManagerWaterSubmersionBase sampleShouldBeWrittenToHK:](self, "sampleShouldBeWrittenToHK:", a3))
  {
    if (!self->_updatingHK)
    {
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase startHKCollector:](self, "startHKCollector:");
      BOOL v31 = 1;
LABEL_19:
      self->_updatingHK = v31;
    }
  }

  else if (self->_updatingHK)
  {
    -[CLContextManagerWaterSubmersionBase setDeepestDepthForHK:](self, "setDeepestDepthForHK:", 0LL);
    -[CLContextManagerWaterSubmersionBase stopHKCollector](self, "stopHKCollector");
    BOOL v31 = 0;
    goto LABEL_19;
  }

  if (-[CLContextManagerWaterSubmersionBase updatingHK](self, "updatingHK"))
  {
    -[CLContextManagerWaterSubmersionBase lastHKUpdate](self, "lastHKUpdate");
    if (v32 == 1.79769313e308
      || ([a3 startAt],
          double v34 = v33,
          -[CLContextManagerWaterSubmersionBase lastHKUpdate](self, "lastHKUpdate"),
          double v36 = vabdd_f64(v34, v35),
          -[CLContextManagerWaterSubmersionBase timeBetweenHKUpdates](self, "timeBetweenHKUpdates"),
          v36 > v37))
    {
      -[CLContextManagerWaterSubmersionBase notifyHKUpdates:]( self,  "notifyHKUpdates:",  -[CLContextManagerWaterSubmersionBase deepestDepthForHK](self, "deepestDepthForHK"));
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase setLastHKUpdate:](self, "setLastHKUpdate:");
      -[CLContextManagerWaterSubmersionBase setDeepestDepthForHK:](self, "setDeepestDepthForHK:", 0LL);
    }
  }

- (BOOL)sampleShouldBeWrittenToHK:(id)a3
{
  return self->_inSwimmingWorkout && [a3 state] == (id)200 || (uint64_t)objc_msgSend(a3, "state") > 299;
}

- (void)updateClientsSubmersionState:(id)a3
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184EA80);
  }
  uint64_t v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    [a3 startAt];
    *(_DWORD *)buf = 134349568;
    CFAbsoluteTime v19 = Current;
    __int16 v20 = 2050;
    uint64_t v21 = v6;
    __int16 v22 = 1026;
    unsigned int v23 = [a3 state];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "water submersion state sent to clients,timestamp,%{public}f,startAt,%{public}f,state,%{public}d",  buf,  0x1Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v7 = qword_1019346A8;
    CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
    [a3 startAt];
    int v12 = 134349568;
    CFAbsoluteTime v13 = v8;
    __int16 v14 = 2050;
    uint64_t v15 = v9;
    __int16 v16 = 1026;
    unsigned int v17 = [a3 state];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  0LL,  "water submersion state sent to clients,timestamp,%{public}f,startAt,%{public}f,state,%{public}d",  &v12,  28);
    uint64_t v11 = (uint8_t *)v10;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionState:]",  "%s\n",  v10);
    if (v11 != buf) {
      free(v11);
    }
  }

- (void)updateSubmersionStateFromAOPState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  ptr = a3.__ptr_;
  double v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v26 = *(void *)a3.__ptr_;
  uint64_t v27 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }

  -[CLContextManagerWaterSubmersionBase saveCachedSubmersionState:]( self,  "saveCachedSubmersionState:",  &v26,  a3.__cntrl_);
  CFAbsoluteTime v8 = v27;
  if (v27)
  {
    uint64_t v9 = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  sub_1000F2F30(&self->_aopSubmersionState.__ptr_, (uint64_t *)ptr);
  int64_t externalSubmersionState = self->_externalSubmersionState;
  int v12 = objc_alloc_init(&OBJC_CLASS___CLWaterSubmersionState);
  -[CLWaterSubmersionState setStartAt:](v12, "setStartAt:", *(double *)*(double *)ptr);
  int v13 = *(unsigned __int8 *)(*(void *)ptr + 8LL);
  if (v13 == 1)
  {
    -[CLContextManagerWaterSubmersionBase onNotSubmerged](self, "onNotSubmerged");
    -[CLWaterSubmersionState setState:](v12, "setState:", 1LL);
  }

  else if (v13 == 2)
  {
    -[CLWaterSubmersionState setState:](v12, "setState:", 2LL);
    self->_int64_t externalSubmersionState = 2LL;
    self->_updatingSurfacePressure = 0;
  }

  else
  {
    -[CLWaterSubmersionState setState:](v12, "setState:", 0LL);
  }

  if (externalSubmersionState != self->_externalSubmersionState)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    __int16 v14 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      -[CLWaterSubmersionState startAt](v12, "startAt");
      uint64_t v17 = v16;
      unsigned int v18 = -[CLWaterSubmersionState state](v12, "state");
      *(_DWORD *)buf = 134349824;
      CFAbsoluteTime v37 = Current;
      __int16 v38 = 2050;
      uint64_t v39 = v17;
      __int16 v40 = 1026;
      unsigned int v41 = v18;
      __int16 v42 = 1026;
      int v43 = externalSubmersionState;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "update submersion state,timestamp,%{public}f,submersionState.startAt,%{public}f,submersionState.state,%{public}d ,previousState,%{public}d",  buf,  0x22u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v19 = qword_1019346A8;
      CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
      -[CLWaterSubmersionState startAt](v12, "startAt");
      uint64_t v22 = v21;
      unsigned int v23 = -[CLWaterSubmersionState state](v12, "state");
      int v28 = 134349824;
      CFAbsoluteTime v29 = v20;
      __int16 v30 = 2050;
      uint64_t v31 = v22;
      __int16 v32 = 1026;
      unsigned int v33 = v23;
      __int16 v34 = 1026;
      int v35 = externalSubmersionState;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  0LL,  "update submersion state,timestamp,%{public}f,submersionState.startAt,%{public}f,submersionState.state,%{public}d ,previousState,%{public}d",  &v28,  34,  v26);
      uint64_t v25 = (uint8_t *)v24;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase updateSubmersionStateFromAOPState:]",  "%s\n",  v24);
      if (v25 != buf) {
        free(v25);
      }
    }

    -[CLContextManagerWaterSubmersionBase updateClientsSubmersionState:](self, "updateClientsSubmersionState:", v12);
    int64_t externalSubmersionState = self->_externalSubmersionState;
  }

  if (externalSubmersionState != 2) {
    self->_submersionState = 100LL;
  }
}

- (void)updateSubmersionStateFromMeasurement:(id)a3
{
  if ((id)-[CLContextManagerWaterSubmersionBase externalSubmersionState](self, "externalSubmersionState") == (id)2)
  {
    objc_msgSend( a3,  "setState:",  -[CLSubmersionStateMachine stateFromDepth:forceSubmersion:]( self->_submersionStateMachine,  "stateFromDepth:forceSubmersion:",  a3,  1));
    if (-[CLContextManagerWaterSubmersionBase sampleShouldBeWrittenToHK:](self, "sampleShouldBeWrittenToHK:", a3))
    {
      if (!-[CLContextManagerWaterSubmersionBase deepestDepthForHK](self, "deepestDepthForHK")
        || (-[CLWaterSubmersionMeasurement depth]( -[CLContextManagerWaterSubmersionBase deepestDepthForHK](self, "deepestDepthForHK"),  "depth"),  double v6 = v5,  [a3 depth],  v6 < v7))
      {
        -[CLContextManagerWaterSubmersionBase setDeepestDepthForHK:](self, "setDeepestDepthForHK:", a3);
      }
    }

    if ([a3 state] == (id)300)
    {
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase onDeepSubmersion:withStateChanged:]( self,  "onDeepSubmersion:withStateChanged:",  [a3 state] != (id)self->_submersionState,  v8);
    }

    else if ([a3 state] == (id)200)
    {
      [a3 startAt];
      -[CLContextManagerWaterSubmersionBase onShallowSubmersion:withStateChanged:]( self,  "onShallowSubmersion:withStateChanged:",  [a3 state] != (id)self->_submersionState,  v9);
    }

    if ([a3 state] != (id)self->_submersionState)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      unint64_t v10 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        [a3 depth];
        uint64_t v12 = v11;
        -[CLSubmersionStateMachine deepThreshold](self->_submersionStateMachine, "deepThreshold");
        uint64_t v14 = v13;
        unsigned int v15 = [a3 state];
        int64_t submersionState = self->_submersionState;
        *(_DWORD *)buf = 134349824;
        uint64_t v35 = v12;
        __int16 v36 = 2050;
        uint64_t v37 = v14;
        __int16 v38 = 1026;
        unsigned int v39 = v15;
        __int16 v40 = 1026;
        int v41 = submersionState;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "update submersion depth state,measurement.depth,%{public}f,submergedDeepThreshold,%{public}f,submersionState.s tate,%{public}d, previousState,%{public}d",  buf,  0x22u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v17 = qword_1019346A8;
        [a3 depth];
        uint64_t v19 = v18;
        -[CLSubmersionStateMachine deepThreshold](self->_submersionStateMachine, "deepThreshold");
        uint64_t v21 = v20;
        unsigned int v22 = [a3 state];
        int64_t v23 = self->_submersionState;
        int v26 = 134349824;
        uint64_t v27 = v19;
        __int16 v28 = 2050;
        uint64_t v29 = v21;
        __int16 v30 = 1026;
        unsigned int v31 = v22;
        __int16 v32 = 1026;
        int v33 = v23;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v17,  0LL,  "update submersion depth state,measurement.depth,%{public}f,submergedDeepThreshold,%{public}f,submersionState.s tate,%{public}d, previousState,%{public}d",  &v26,  34);
        uint64_t v25 = (uint8_t *)v24;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase updateSubmersionStateFromMeasurement:]",  "%s\n",  v24);
        if (v25 != buf) {
          free(v25);
        }
      }

      self->_int64_t submersionState = (int64_t)[a3 state];
    }
  }

- (void)onShallowSubmersion:(double)a3 withStateChanged:(BOOL)a4
{
  if (a4) {
    -[CLContextManagerWaterSubmersionBase startSubmersionPowerAssertion](self, "startSubmersionPowerAssertion", a3);
  }
  self->_updatingSurfacePressure = 0;
}

- (void)onDeepSubmersion:(double)a3 withStateChanged:(BOOL)a4
{
  if (a4) {
    -[CLContextManagerWaterSubmersionBase startSubmersionPowerAssertion](self, "startSubmersionPowerAssertion");
  }
  if (!self->_updatingHK)
  {
    -[CLContextManagerWaterSubmersionBase startHKCollector:](self, "startHKCollector:", a3);
    self->_updatingHK = 1;
  }

  self->_updatingSurfacePressure = 0;
}

- (void)onNotSubmerged
{
  self->_int64_t externalSubmersionState = 1LL;
  self->_updatingSurfacePressure = 1;
}

- (void)saveCachedSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  ptr = (const void **)a3.__ptr_;
  uint64_t v4 = sub_1002F8DDC();
  sub_1002AC7B8(v4, "CLWaterSubmersion_StateTimestamp", *ptr);
  uint64_t v5 = sub_1002F8DDC();
  *(_DWORD *)buf = *((unsigned __int8 *)*ptr + 8);
  sub_1002AC220(v5, "CLWaterSubmersion_State", buf);
  uint64_t v6 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v6 + 944LL))(v6);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184EA80);
  }
  double v7 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)*ptr;
    int v9 = *((unsigned __int8 *)*ptr + 8);
    *(_DWORD *)buf = 134349312;
    uint64_t v19 = v8;
    __int16 v20 = 1026;
    int v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "saved submerged state,timestamp,%{public}f,state,%{public}d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v10 = *(void *)*ptr;
    int v11 = *((unsigned __int8 *)*ptr + 8);
    int v14 = 134349312;
    uint64_t v15 = v10;
    __int16 v16 = 1026;
    int v17 = v11;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "saved submerged state,timestamp,%{public}f,state,%{public}d",  &v14,  18);
    uint64_t v13 = (uint8_t *)v12;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase saveCachedSubmersionState:]",  "%s\n",  v12);
    if (v13 != buf) {
      free(v13);
    }
  }

- (void)retrieveCachedSubmersionState
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v22 = 1.79769313e308;
  int v21 = 1;
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A82BC(v4, "CLWaterSubmersion_StateTimestamp", &v22);
  uint64_t v5 = sub_1002F8DDC();
  sub_1002A7CB0(v5, "CLWaterSubmersion_State", &v21);
  int v23 = 1177075712;
  sub_101206C88(buf, "MaxSubmersionStateAgeFromRecovery", &v23, 0);
  if (v22 != 1.79769313e308 && Current - v22 < *(float *)&buf[4])
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v8 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "recovering state on locationd start,timestamp,%{public}f,submersion state,%{public}d",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      int v23 = 134349312;
      double v24 = v22;
      __int16 v25 = 1026;
      int v26 = v21;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "recovering state on locationd start,timestamp,%{public}f,submersion state,%{public}d",  &v23,  18);
      __int16 v20 = (char *)v19;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState]",  "%s\n",  v19);
      if (v20 != buf) {
        free(v20);
      }
    }

    char v9 = v21;
    -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
    uint64_t v10 = *(std::__shared_weak_count **)&buf[8];
    *(_BYTE *)(*(void *)buf + 8LL) = v9;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        unint64_t v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    double v13 = v22;
    -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
    int v14 = *(std::__shared_weak_count **)&buf[8];
    **(double **)buf = v13;
    if (v14)
    {
      uint64_t v15 = (unint64_t *)&v14->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    double v7 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "submersion state is too old to be recovered",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      LOWORD(v23) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "submersion state is too old to be recovered",  &v23,  2);
      uint64_t v18 = (char *)v17;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState]",  "%s\n",  v17);
      if (v18 != buf) {
        free(v18);
      }
    }
  }

- (void)startSubmersionPowerAssertion
{
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    sub_1010DDBC0(__p, "Altimeter, submersion state client notification power assertion");
    sub_100AD5668((uint64_t)value, (uint64_t *)__p);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v4 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime v15 = Current;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "power assertion for depth state change,timestamp,%{public}f,assertionState,1,reason,stateChange",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v6 = qword_1019346A8;
      CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent();
      int v12 = 134349056;
      CFAbsoluteTime v13 = v7;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  0LL,  "power assertion for depth state change,timestamp,%{public}f,assertionState,1,reason,stateChange",  &v12,  12);
      char v9 = (uint8_t *)v8;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase startSubmersionPowerAssertion]",  "%s\n",  v8);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

  -[CLTimer setNextFireDelay:](self->_submersionPowerAssertionTimer, "setNextFireDelay:", 10.0);
}

- (void)notificationAcknowledged:(unint64_t)a3
{
  if (a3 == 3 && *((int *)self->_powerAssertionSubmersion.__ptr_.__value_ + 2) >= 1)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v4 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "power assertion for depth state change,timestamp,%{public}f,assertionState,0,reason,clientResponse",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v5 = qword_1019346A8;
      int v8 = 134349056;
      CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent();
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v5,  0LL,  "power assertion for depth state change,timestamp,%{public}f,assertionState,0,reason,clientResponse",  &v8,  12);
      CFAbsoluteTime v7 = (uint8_t *)v6;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase notificationAcknowledged:]",  "%s\n",  v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    sub_100AD5D38((uint64_t)self->_powerAssertionSubmersion.__ptr_.__value_);
  }

- (void)onMotionStateMediatorData:(NotificationData *)a3
{
  if (*((void *)a3 + 14) == 19LL)
  {
    uint64_t v6 = *((void *)a3 + 2);
    if ((unint64_t)(v6 - 1) < 2)
    {
      self->_inSwimmingWorkout = 0;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      char v11 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "swimming workout stopped,timestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v12 = qword_1019346A8;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  0LL,  "swimming workout stopped,timestamp,%f");
        goto LABEL_25;
      }
    }

    else if (v6 == 3 || v6 == 0)
    {
      self->_inSwimmingWorkout = 1;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      int v8 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "swimming workout started,timestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v9 = qword_1019346A8;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  0LL,  "swimming workout started,timestamp,%f");
LABEL_25:
        CFAbsoluteTime v13 = (uint8_t *)v10;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersionBase onMotionStateMediatorData:]",  "%s\n",  v10);
        if (v13 != buf) {
          free(v13);
        }
      }
    }
  }

- (int64_t)submersionState
{
  return self->_submersionState;
}

- (void)setSubmersionState:(int64_t)a3
{
  self->_int64_t submersionState = a3;
}

- (BOOL)updatingHK
{
  return self->_updatingHK;
}

- (void)setUpdatingHK:(BOOL)a3
{
  self->_updatingHK = a3;
}

- (BOOL)inSwimmingWorkout
{
  return self->_inSwimmingWorkout;
}

- (void)setInSwimmingWorkout:(BOOL)a3
{
  self->_inSwimmingWorkout = a3;
}

- (int64_t)externalSubmersionState
{
  return self->_externalSubmersionState;
}

- (void)setExternalSubmersionState:(int64_t)a3
{
  self->_int64_t externalSubmersionState = a3;
}

- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)aopSubmersionState
{
  cntrl = self->_aopSubmersionState.__cntrl_;
  *v2 = self->_aopSubmersionState.__ptr_;
  v2[1] = (CLBarometerCalibrationWaterSubmersion *)cntrl;
  if (cntrl)
  {
    uint64_t v4 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLBarometerCalibrationWaterSubmersion *)self;
  return result;
}

- (void)setAopSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
}

- (BOOL)updatingSurfacePressure
{
  return self->_updatingSurfacePressure;
}

- (void)setUpdatingSurfacePressure:(BOOL)a3
{
  self->_updatingSurfacePressure = a3;
}

- (CLSubmersionDataCollector)hkCollector
{
  return self->_hkCollector;
}

- (void)setHkCollector:(id)a3
{
}

- (CLSubmersionStateMachine)submersionStateMachine
{
  return self->_submersionStateMachine;
}

- (void)setSubmersionStateMachine:(id)a3
{
}

- (double)lastHKUpdate
{
  return self->_lastHKUpdate;
}

- (void)setLastHKUpdate:(double)a3
{
  self->_lastHKUpdate = a3;
}

- (double)lastDefaultLevelLogTimestamp
{
  return self->_lastDefaultLevelLogTimestamp;
}

- (void)setLastDefaultLevelLogTimestamp:(double)a3
{
  self->_lastDefaultLevelLogTimestamp = a3;
}

- (CLWaterSubmersionMeasurement)deepestDepthForHK
{
  return self->_deepestDepthForHK;
}

- (void)setDeepestDepthForHK:(id)a3
{
}

- (double)timeBetweenHKUpdates
{
  return self->_timeBetweenHKUpdates;
}

- (void)setTimeBetweenHKUpdates:(double)a3
{
  self->_timeBetweenHKUpdates = a3;
}

- (void).cxx_destruct
{
  value = self->_powerAssertionHK.__ptr_.__value_;
  self->_powerAssertionHK.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
  }
  uint64_t v4 = self->_powerAssertionSubmersion.__ptr_.__value_;
  self->_powerAssertionSubmersion.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(CLPowerAssertion *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  return self;
}

@end