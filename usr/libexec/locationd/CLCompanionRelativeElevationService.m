@interface CLCompanionRelativeElevationService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLCompanionRelativeElevationService)init;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)calculateRelativeElevation;
- (void)endService;
- (void)logToCA;
- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4;
- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3;
- (void)onMotionActivityNotification:(int)a3 data:(NotificationData *)a4;
- (void)registerForAlgorithmSources;
- (void)registerForUpdates:(id)a3;
- (void)rotateCADaily;
- (void)rotateCAHourly;
- (void)setClients:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)unregisterForAlgorithmSources;
- (void)unregisterForUpdates:(id)a3;
- (void)updateRelativePressureCalibration;
@end

@implementation CLCompanionRelativeElevationService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101994058 != -1) {
    dispatch_once(&qword_101994058, &stru_10182EF08);
  }
  return (id)qword_101994050;
}

- (CLCompanionRelativeElevationService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLCompanionRelativeElevationService;
  v2 = -[CLCompanionRelativeElevationService initWithInboundProtocol:outboundProtocol:]( &v10,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCompanionRelativeElevationServiceProtocol,  &OBJC_PROTOCOL___CLCompanionRelativeElevationClientProtocol);
  v3 = v2;
  if (v2)
  {
    v2->_clients = 0LL;
    value = v2->fCompanionClient.__ptr_.__value_;
    v3->fCompanionClient.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    }
    unint64_t v5 = v3->fMotionActivityClient.__ptr_.__value_;
    v3->fMotionActivityClient.__ptr_.__value_ = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
    v6 = v3->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
    v3->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0LL;
    if (v6) {
      (*(void (**)(Dispatcher *))(*(void *)v6 + 8LL))(v6);
    }
    v7 = v3->fPressureBiasEstimateStat.__ptr_.__value_;
    v3->fPressureBiasEstimateStat.__ptr_.__value_ = 0LL;
    if (v7) {
      operator delete(v7);
    }
    *(_OWORD *)&v3->fCurrentCalibrationEntry.companionPressure = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.companionPressureUncertainty = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.watchPressureTimestamp = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.motionState = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.isNearby = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.isConnected = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.pressureBiasMeasurement = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.deltaPressure = 0u;
    *(_OWORD *)&v3->fCurrentCalibrationEntry.btRssi = 0u;
    v8 = (void **)v3->fCalibrationTable.__ptr_.__value_;
    v3->fCalibrationTable.__ptr_.__value_ = 0LL;
    if (v8) {
      sub_100223734((_DWORD)v3 + 184, v8);
    }
    v3->fHourlyTimer = 0LL;
    v3->fDailyTimer = 0LL;
  }

  return v3;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)beginService
{
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_10182EF48);
  }
  v3 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] Starting service",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v8[0] = 0;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] Starting service",  v8,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService beginService]", "%s\n", v6);
  }

  -[CLCompanionRelativeElevationService setClients:]( self,  "setClients:",  +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  -[CLCompanionRelativeElevationService registerForAlgorithmSources](self, "registerForAlgorithmSources");
  v4 = operator new(0x30uLL);
  sub_1002B4CA4((uint64_t)v4, 0xA8uLL);
  value = (void **)self->fCalibrationTable.__ptr_.__value_;
  self->fCalibrationTable.__ptr_.__value_ = v4;
  if (value) {
    sub_100223734((_DWORD)self + 184, value);
  }
  sub_1002B24A4((void **)&self->fCalibrationHourBuffer.__begin_, 4uLL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B25A8;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)endService
{
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_10182EF48);
  }
  v3 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] Ending service",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v9[0] = 0;
    v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] Ending service",  v9,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService endService]", "%s\n", v8);
  }

  fHourlyTimer = self->fHourlyTimer;
  if (fHourlyTimer)
  {
    -[NSTimer invalidate](fHourlyTimer, "invalidate");
    self->fHourlyTimer = 0LL;
  }

  fDailyTimer = self->fDailyTimer;
  if (fDailyTimer)
  {
    -[NSTimer invalidate](fDailyTimer, "invalidate");
    self->fDailyTimer = 0LL;
  }

  p_fCalibrationTable = &self->fCalibrationTable;
  value = (void **)self->fCalibrationTable.__ptr_.__value_;
  if (value)
  {
    p_fCalibrationTable->__ptr_.__value_ = 0LL;
    sub_100223734((int)p_fCalibrationTable, value);
  }

  -[CLCompanionRelativeElevationService unregisterForAlgorithmSources](self, "unregisterForAlgorithmSources");
  -[CLCompanionRelativeElevationService setClients:](self, "setClients:", 0LL);
}

- (void)registerForAlgorithmSources
{
  v3 = v20;
  v20 = 0LL;
  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    unint64_t v5 = v20;
    v20 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:12 registrationInfo:0];
  [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:13 registrationInfo:0];
  sub_10036B3B4( (uint64_t)sub_1002B2A6C,  (uint64_t)self,  -[CLCompanionRelativeElevationService universe](self, "universe"),  &v20);
  v6 = v20;
  v20 = 0LL;
  v7 = self->fMotionActivityClient.__ptr_.__value_;
  self->fMotionActivityClient.__ptr_.__value_ = v6;
  if (v7)
  {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    v8 = v20;
    v20 = 0LL;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    }
  }

  [*((id *)self->fMotionActivityClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionActivityClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  id v9 = objc_msgSend(-[CLCompanionRelativeElevationService universe](self, "universe"), "silo");
  objc_super v10 = (Dispatcher *)operator new(0x38uLL);
  sub_1002B4F48(v10, v9, (uint64_t)sub_1002B2AEC, (uint64_t)self, 0LL);
  v11 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
  self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = v10;
  if (v11) {
    (*(void (**)(Dispatcher *))(*(void *)v11 + 8LL))(v11);
  }
  if (sub_1008FA854(0))
  {
    uint64_t v12 = sub_1008FA854(0);
    sub_1006DCB40(v12, 30, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_, -1.0);
  }

  v13 = (char *)operator new(0x30uLL);
  *(_DWORD *)v13 = 0;
  *(_OWORD *)(v13 + 8) = xmmword_1012E4DA0;
  __asm { FMOV            V0.2D, #1.0 }

  *(_OWORD *)(v13 + 24) = _Q0;
  *((void *)v13 + 5) = 0LL;
  v19 = self->fPressureBiasEstimateStat.__ptr_.__value_;
  self->fPressureBiasEstimateStat.__ptr_.__value_ = (CLExponentialWeightedRunningStat *)v13;
  if (v19) {
    operator delete(v19);
  }
}

- (void)unregisterForAlgorithmSources
{
  value = self->fCompanionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:12];
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:13];
  }

  v4 = self->fMotionActivityClient.__ptr_.__value_;
  if (v4) {
    [*((id *)v4 + 2) unregister:*((void *)v4 + 1) forNotification:1];
  }
  if (self->fMotionStateCoprocessorDispatcher.__ptr_.__value_)
  {
    uint64_t v5 = sub_1008FA854(0);
    sub_1006DD2A0(v5, 30, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_);
    uint64_t v6 = sub_1008FA854(0);
    sub_1006DD2A0(v6, 0, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_);
    v7 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
    self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0LL;
    if (v7) {
      (*(void (**)(Dispatcher *))(*(void *)v7 + 8LL))(v7);
    }
  }

  v8 = self->fPressureBiasEstimateStat.__ptr_.__value_;
  if (v8)
  {
    self->fPressureBiasEstimateStat.__ptr_.__value_ = 0LL;
    operator delete(v8);
  }

- (void)registerForUpdates:(id)a3
{
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_10182EF48);
  }
  v3 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] Client registerForUpdates",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v5[0] = 0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] Client registerForUpdates",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService registerForUpdates:]", "%s\n", v4);
  }

- (void)unregisterForUpdates:(id)a3
{
}

- (void)updateRelativePressureCalibration
{
  if (self->fPressureBiasEstimateStat.__ptr_.__value_)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v4 = vabdd_f64(Current, self->fCurrentCalibrationEntry.nearbyTimestamp);
    double companionPressure = self->fCurrentCalibrationEntry.companionPressure;
    double v6 = vabdd_f64(Current, self->fCurrentCalibrationEntry.companionPressureTimestamp);
    double watchPressure = self->fCurrentCalibrationEntry.watchPressure;
    double v8 = vabdd_f64(Current, self->fCurrentCalibrationEntry.watchPressureTimestamp);
    int isNearby = self->fCurrentCalibrationEntry.isNearby;
    double v10 = *(double *)&qword_101994040;
    double v11 = vabdd_f64(companionPressure, watchPressure);
    if (isNearby) {
      BOOL v12 = v6 < *(double *)&qword_101994040;
    }
    else {
      BOOL v12 = 0;
    }
    BOOL v13 = v12 && v8 < *(double *)&qword_101994040;
    if (v13 && v11 < 1000.0)
    {
      self->fCurrentCalibrationEntry.double pressureBiasMeasurement = companionPressure - watchPressure;
      sub_1002B31E0((uint64_t)self->fPressureBiasEstimateStat.__ptr_.__value_, companionPressure - watchPressure);
      value = self->fPressureBiasEstimateStat.__ptr_.__value_;
      if (*(_DWORD *)value < 1) {
        double v15 = 0.0;
      }
      else {
        double v15 = *((double *)value + 2);
      }
      self->fCurrentCalibrationEntry.double pressureBiasEstimate = v15;
      unsigned __int8 v22 = atomic_load((unsigned __int8 *)&qword_101994068);
      if ((v22 & 1) == 0 && __cxa_guard_acquire(&qword_101994068))
      {
        qword_101994060 = CFAbsoluteTimeGetCurrent();
        __cxa_guard_release(&qword_101994068);
      }

      CFAbsoluteTime v23 = CFAbsoluteTimeGetCurrent();
      self->fCurrentCalibrationEntry.timeSinceLastCalibration = CFAbsoluteTimeGetCurrent() - *(double *)&qword_101994060;
      qword_101994060 = *(void *)&v23;
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_10182EF48);
      }
      uint64_t v24 = qword_1019346D8;
      if (!os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      double v25 = self->fCurrentCalibrationEntry.watchPressure;
      double v26 = self->fCurrentCalibrationEntry.companionPressure;
      double pressureBiasMeasurement = self->fCurrentCalibrationEntry.pressureBiasMeasurement;
      double pressureBiasEstimate = self->fCurrentCalibrationEntry.pressureBiasEstimate;
      *(_DWORD *)buf = 68290306;
      int v31 = 0;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 2050;
      *(double *)v35 = v25;
      *(_WORD *)&v35[8] = 2050;
      double v36 = v26;
      *(_WORD *)v37 = 2050;
      *(double *)&v37[2] = pressureBiasMeasurement;
      *(_WORD *)&v37[10] = 2050;
      *(double *)&v37[12] = pressureBiasEstimate;
      __int16 v38 = 2050;
      double v39 = v4;
      v19 = "{msg%{public}.0s:[CLCompanionRelativeElevation] Pressure bias sync valid, watchPressure:%{publ"
            "ic}f, companionPressure:%{public}f, pressureBiasMeasurement:%{public}f, pressureBiasEsti"
            "mate:%{public}f, proximityAge:%{public}f}";
      v20 = (os_log_s *)v24;
      uint32_t v21 = 68;
    }

    else
    {
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_10182EF48);
      }
      uint64_t v18 = qword_1019346D8;
      if (!os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 68290306;
      int v31 = 0;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 1026;
      *(_DWORD *)v35 = isNearby != 0;
      *(_WORD *)&v35[4] = 1026;
      *(_DWORD *)&v35[6] = v6 < v10;
      LOWORD(v36) = 1026;
      *(_DWORD *)((char *)&v36 + 2) = v8 < v10;
      HIWORD(v36) = 1026;
      *(_DWORD *)v37 = v11 < 1000.0;
      *(_WORD *)&v37[4] = 2050;
      *(double *)&v37[6] = v4;
      v19 = "{\"msg%{public}.0s\":\"[CLCompanionRelativeElevation] Pressure bias sync not valid\", \"isInProximityValid\""
            ":%{public}hhd, isPhonePressureDurationValid:%{public}hhd, isWatchPressureDurationValid:%{public}hhd,"
            " isPressureBiasValid:%{public}hhd, proximityAge:%{public}f}";
      v20 = (os_log_s *)v18;
      uint32_t v21 = 52;
    }

    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
LABEL_33:
    -[CLCompanionRelativeElevationService logToCA](self, "logToCA");
    return;
  }

  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_10182EF48);
  }
  v16 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is null",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v29[0] = 0;
    v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  16LL,  "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is null",  v29,  2);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLCompanionRelativeElevationService updateRelativePressureCalibration]",  "%s\n",  v17);
  }

- (void)calculateRelativeElevation
{
  value = self->fPressureBiasEstimateStat.__ptr_.__value_;
  if (!value)
  {
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    uint64_t v24 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is null",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v31[0] = 0;
    double v25 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  16LL,  "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is null",  v31,  2);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCompanionRelativeElevationService calculateRelativeElevation]", "%s\n");
LABEL_32:
    if (v25 != buf) {
      free(v25);
    }
    return;
  }

  if (*(_DWORD *)value)
  {
    p_fCurrentCalibrationEntry = &self->fCurrentCalibrationEntry;
    double companionPressure = self->fCurrentCalibrationEntry.companionPressure;
    double v6 = self->fCurrentCalibrationEntry.watchPressure + self->fCurrentCalibrationEntry.pressureBiasEstimate;
    float v7 = companionPressure;
    float v8 = sub_100FADFE8(v7, 101320.0);
    float v9 = v6;
    float v10 = sub_100FADFE8(v9, 101320.0);
    p_fCurrentCalibrationEntry->double deltaPressure = v6 - companionPressure;
    p_fCurrentCalibrationEntry->double deltaElevation = (float)(v10 - v8);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    double v11 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
    {
      double watchPressure = p_fCurrentCalibrationEntry->watchPressure;
      double v13 = p_fCurrentCalibrationEntry->companionPressure;
      double pressureBiasMeasurement = p_fCurrentCalibrationEntry->pressureBiasMeasurement;
      double pressureBiasEstimate = p_fCurrentCalibrationEntry->pressureBiasEstimate;
      double deltaPressure = p_fCurrentCalibrationEntry->deltaPressure;
      double deltaElevation = p_fCurrentCalibrationEntry->deltaElevation;
      *(_DWORD *)buf = 68290562;
      int v34 = 0;
      __int16 v35 = 2082;
      double v36 = "";
      __int16 v37 = 2050;
      double v38 = pressureBiasEstimate;
      __int16 v39 = 2050;
      double v40 = watchPressure;
      __int16 v41 = 2050;
      double v42 = v13;
      __int16 v43 = 2050;
      double v44 = pressureBiasMeasurement;
      __int16 v45 = 2050;
      double v46 = deltaPressure;
      __int16 v47 = 2050;
      double v48 = deltaElevation;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:[CLCompanionRelativeElevation] calculateRelativeElevationWithCompanionPressure, press ureBiasEstimate:%{public}f, watchPressure:%{public}f, companionPressure:%{public}f, pres sureBiasMeasurement:%{public}f, deltaPressure:%{public}f, deltaElevation:%{public}f}",  buf,  0x4Eu);
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v18 = -[CLCompanionRelativeElevationService clients](self, "clients");
    id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = p_fCurrentCalibrationEntry->deltaElevation;
          *(float *)&double v23 = v23;
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)i) onCompanionRelativeElevationUpdate:v23];
        }

        id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
      }

      while (v20);
    }

    return;
  }

  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_10182EF48);
  }
  double v26 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] pressureBiasEstimate not ready, skipping calculateRelativeElevation",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v31[0] = 0;
    double v25 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] pressureBiasEstimate not ready, skipping calculateRelativeElevation",  v31,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService calculateRelativeElevation]", "%s\n");
    goto LABEL_32;
  }

- (void)logToCA
{
  if (byte_101994031)
  {
    p_fCurrentCalibrationEntry = &self->fCurrentCalibrationEntry;
    if (self->fCurrentCalibrationEntry.isNearby)
    {
      p_fCalibrationHourBuffer = &self->fCalibrationHourBuffer;
      if (0x8E38E38E38E38E39LL
         * (((char *)self->fCalibrationHourBuffer.__end_ - (char *)self->fCalibrationHourBuffer.__begin_) >> 4) <= 4)
      {
        if (qword_1019346D0 != -1) {
          dispatch_once(&qword_1019346D0, &stru_10182EF48);
        }
        double v4 = (os_log_s *)qword_1019346D8;
        if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v5 = 0x8E38E38E38E38E39LL
             * (((char *)p_fCalibrationHourBuffer->__end_ - (char *)p_fCalibrationHourBuffer->__begin_) >> 4);
          *(_DWORD *)buf = 134217984;
          unint64_t v41 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] Adding CA entry to fCalibrationHourBuffer, index %zu",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346D0 != -1) {
            dispatch_once(&qword_1019346D0, &stru_10182EF48);
          }
          unint64_t v36 = 0x8E38E38E38E38E39LL
              * (((char *)p_fCalibrationHourBuffer->__end_ - (char *)p_fCalibrationHourBuffer->__begin_) >> 4);
          int v38 = 134217984;
          unint64_t v39 = v36;
          __int16 v37 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] Adding CA entry to fCalibrationHourBuffer, index %zu",  (size_t)&v38);
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService logToCA]", "%s\n", v37);
        }

        value = p_fCalibrationHourBuffer->__end_cap_.__value_;
        end = (char *)p_fCalibrationHourBuffer->__end_;
        if (end >= (char *)value)
        {
          unint64_t v15 = 0x8E38E38E38E38E39LL * ((end - (char *)p_fCalibrationHourBuffer->__begin_) >> 4);
          unint64_t v16 = v15 + 1;
          if (v15 + 1 > 0x1C71C71C71C71C7LL) {
            sub_100007008();
          }
          unint64_t v17 = 0x8E38E38E38E38E39LL * (((char *)value - (char *)p_fCalibrationHourBuffer->__begin_) >> 4);
          if (2 * v17 > v16) {
            unint64_t v16 = 2 * v17;
          }
          if (v17 >= 0xE38E38E38E38E3LL) {
            unint64_t v18 = 0x1C71C71C71C71C7LL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18) {
            id v19 = (char *)sub_1002B4F00((uint64_t)&p_fCalibrationHourBuffer->__end_cap_, v18);
          }
          else {
            id v19 = 0LL;
          }
          id v20 = (RelativePressureBiasCalibrationEntry *)&v19[144 * v15];
          uint64_t v21 = (RelativePressureBiasCalibrationEntry *)&v19[144 * v18];
          *(_OWORD *)&v20->double companionPressure = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressure;
          __int128 v22 = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressureUncertainty;
          __int128 v23 = *(_OWORD *)&p_fCurrentCalibrationEntry->watchPressureTimestamp;
          __int128 v24 = *(_OWORD *)&p_fCurrentCalibrationEntry->isNearby;
          *(_OWORD *)&v20->motionState = *(_OWORD *)&p_fCurrentCalibrationEntry->motionState;
          *(_OWORD *)&v20->int isNearby = v24;
          *(_OWORD *)&v20->companionPressureUncertainty = v22;
          *(_OWORD *)&v20->watchPressureTimestamp = v23;
          __int128 v25 = *(_OWORD *)&p_fCurrentCalibrationEntry->isConnected;
          __int128 v26 = *(_OWORD *)&p_fCurrentCalibrationEntry->pressureBiasMeasurement;
          __int128 v27 = *(_OWORD *)&p_fCurrentCalibrationEntry->btRssi;
          *(_OWORD *)&v20->double deltaPressure = *(_OWORD *)&p_fCurrentCalibrationEntry->deltaPressure;
          *(_OWORD *)&v20->btRssi = v27;
          *(_OWORD *)&v20->isConnected = v25;
          *(_OWORD *)&v20->double pressureBiasMeasurement = v26;
          v14 = v20 + 1;
          begin = p_fCalibrationHourBuffer->__begin_;
          __int128 v28 = p_fCalibrationHourBuffer->__end_;
          if (v28 != p_fCalibrationHourBuffer->__begin_)
          {
            do
            {
              *(_OWORD *)&v20[-1].double companionPressure = *(_OWORD *)&v28[-1].companionPressure;
              __int128 v30 = *(_OWORD *)&v28[-1].companionPressureUncertainty;
              __int128 v31 = *(_OWORD *)&v28[-1].watchPressureTimestamp;
              __int128 v32 = *(_OWORD *)&v28[-1].isNearby;
              *(_OWORD *)&v20[-1].motionState = *(_OWORD *)&v28[-1].motionState;
              *(_OWORD *)&v20[-1].int isNearby = v32;
              *(_OWORD *)&v20[-1].companionPressureUncertainty = v30;
              *(_OWORD *)&v20[-1].watchPressureTimestamp = v31;
              __int128 v33 = *(_OWORD *)&v28[-1].isConnected;
              __int128 v34 = *(_OWORD *)&v28[-1].pressureBiasMeasurement;
              __int128 v35 = *(_OWORD *)&v28[-1].btRssi;
              *(_OWORD *)&v20[-1].double deltaPressure = *(_OWORD *)&v28[-1].deltaPressure;
              *(_OWORD *)&v20[-1].btRssi = v35;
              *(_OWORD *)&v20[-1].isConnected = v33;
              *(_OWORD *)&v20[-1].double pressureBiasMeasurement = v34;
              --v20;
              --v28;
            }

            while (v28 != begin);
            __int128 v28 = p_fCalibrationHourBuffer->__begin_;
          }

          p_fCalibrationHourBuffer->__begin_ = v20;
          p_fCalibrationHourBuffer->__end_ = v14;
          p_fCalibrationHourBuffer->__end_cap_.__value_ = v21;
          if (v28) {
            operator delete(v28);
          }
        }

        else
        {
          *(_OWORD *)end = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressure;
          __int128 v8 = *(_OWORD *)&p_fCurrentCalibrationEntry->companionPressureUncertainty;
          __int128 v9 = *(_OWORD *)&p_fCurrentCalibrationEntry->watchPressureTimestamp;
          __int128 v10 = *(_OWORD *)&p_fCurrentCalibrationEntry->isNearby;
          *((_OWORD *)end + 3) = *(_OWORD *)&p_fCurrentCalibrationEntry->motionState;
          *((_OWORD *)end + 4) = v10;
          *((_OWORD *)end + 1) = v8;
          *((_OWORD *)end + 2) = v9;
          __int128 v11 = *(_OWORD *)&p_fCurrentCalibrationEntry->isConnected;
          __int128 v12 = *(_OWORD *)&p_fCurrentCalibrationEntry->pressureBiasMeasurement;
          __int128 v13 = *(_OWORD *)&p_fCurrentCalibrationEntry->btRssi;
          *((_OWORD *)end + 7) = *(_OWORD *)&p_fCurrentCalibrationEntry->deltaPressure;
          *((_OWORD *)end + 8) = v13;
          *((_OWORD *)end + 5) = v11;
          *((_OWORD *)end + 6) = v12;
          v14 = (RelativePressureBiasCalibrationEntry *)(end + 144);
        }

        p_fCalibrationHourBuffer->__end_ = v14;
      }
    }
  }

- (void)rotateCAHourly
{
  if (!self->fCalibrationTable.__ptr_.__value_)
  {
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    __int128 v9 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[CLCompanionRelativeElevation] fCalibrationTable is null",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v13[0] = 0;
    __int128 v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  16LL,  "[CLCompanionRelativeElevation] fCalibrationTable is null",  v13,  2);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCompanionRelativeElevationService rotateCAHourly]", "%s\n", v10);
LABEL_37:
    return;
  }

  p_fCalibrationHourBuffer = &self->fCalibrationHourBuffer;
  begin = self->fCalibrationHourBuffer.__begin_;
  end = self->fCalibrationHourBuffer.__end_;
  if (begin != end)
  {
    double v6 = begin + 1;
    float v7 = self->fCalibrationHourBuffer.__begin_;
    if (&begin[1] != end)
    {
      float v7 = self->fCalibrationHourBuffer.__begin_;
      do
      {
        if (vabdd_f64(v6->watchPressureTimestamp, v6->nearbyTimestamp) < vabdd_f64( v7->watchPressureTimestamp,  v7->nearbyTimestamp)) {
          float v7 = v6;
        }
        ++v6;
      }

      while (v6 != end);
    }

    if (v7 != end)
    {
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_10182EF48);
      }
      __int128 v8 = (os_log_s *)qword_1019346D8;
      if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] Adding hourly CA entry to fCalibrationTable",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346D0 != -1) {
          dispatch_once(&qword_1019346D0, &stru_10182EF48);
        }
        v13[0] = 0;
        __int128 v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] Adding hourly CA entry to fCalibrationTable",  v13,  2);
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService rotateCAHourly]", "%s\n", v12);
      }

      sub_1002B3F08((void *)self->fCalibrationTable.__ptr_.__value_, v7);
      begin = p_fCalibrationHourBuffer->__begin_;
    }

    p_fCalibrationHourBuffer->__end_ = begin;
    return;
  }

  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_10182EF48);
  }
  __int128 v11 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] fCalibrationHourBuffer is empty, nothing to send this hour.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v13[0] = 0;
    __int128 v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] fCalibrationHourBuffer is empty, nothing to send this hour.",  v13,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService rotateCAHourly]", "%s\n", v10);
    goto LABEL_37;
  }

- (void)rotateCADaily
{
  if (self->fCalibrationTable.__ptr_.__value_)
  {
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    v3 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *((void *)self->fCalibrationTable.__ptr_.__value_ + 4);
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] Submitting daily CA logs, size %zu",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_10182EF48);
      }
      uint64_t v13 = *((void *)self->fCalibrationTable.__ptr_.__value_ + 4);
      int v18 = 134217984;
      uint64_t v19 = v13;
      v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] Submitting daily CA logs, size %zu",  (size_t)&v18);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionRelativeElevationService rotateCADaily]", "%s\n", v14);
    }

    value = self->fCalibrationTable.__ptr_.__value_;
    if (value[4])
    {
      unint64_t v6 = 0LL;
      do
      {
        uint64_t v7 = *value + 144 * ((v6 + value[3]) % value[5]);
        double v8 = *(double *)(v7 + 32);
        double v9 = vabdd_f64(v8, *(double *)(v7 + 72));
        double v10 = vabdd_f64(v8, *(double *)(v7 + 8));
        double v11 = *(double *)(v7 + 56);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1002B4354;
        v16[3] = &unk_10182EF28;
        v16[4] = v7;
        *(double *)&v16[5] = v9;
        *(double *)&v16[6] = v10;
        int v17 = v6;
        *(double *)&v16[7] = v9;
        v16[8] = vabdd_f64(v8, v11);
        v16[9] = vabdd_f64(v8, v8);
        AnalyticsSendEventLazy(@"com.apple.RelativePressureBiasCalibration", v16);
        ++v6;
        value = self->fCalibrationTable.__ptr_.__value_;
      }

      while (value[4] > v6);
    }
  }

  else
  {
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    __int128 v12 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[CLCompanionRelativeElevation] fCalibrationTable is null",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_10182EF48);
      }
      LOWORD(v18) = 0;
      unint64_t v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  16LL,  "[CLCompanionRelativeElevation] fCalibrationTable is null",  &v18,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCompanionRelativeElevationService rotateCADaily]", "%s\n", v15);
    }
  }

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 13)
  {
    p_fCurrentCalibrationEntry = &self->fCurrentCalibrationEntry;
    self->fCurrentCalibrationEntry.int isConnected = *(_BYTE *)a4;
    self->fCurrentCalibrationEntry.int isNearby = *((unsigned __int8 *)a4 + 1);
    self->fCurrentCalibrationEntry.int isActive = *((unsigned __int8 *)a4 + 2);
    self->fCurrentCalibrationEntry.nearbyTimestamp = *((double *)a4 + 1);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    double v10 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
    {
      int isNearby = p_fCurrentCalibrationEntry->isNearby;
      int isConnected = p_fCurrentCalibrationEntry->isConnected;
      int isActive = p_fCurrentCalibrationEntry->isActive;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)__int128 v26 = isConnected;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = isNearby;
      LOWORD(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 2) = isActive;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] kNotificationCompanionDetailedConnectionUpdate, connected %d, nearby %d, active %d",  buf,  0x14u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    int v14 = p_fCurrentCalibrationEntry->isNearby;
    int v15 = p_fCurrentCalibrationEntry->isActive;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v14;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = v15;
    unint64_t v16 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] kNotificationCompanionDetailedConnectionUpdate, connected %d, near by %d, active %d",  &v22,  20,  67109632);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionRelativeElevationService onCompanionNotification:data:]",  "%s\n");
LABEL_31:
    if (v16 != buf) {
      free(v16);
    }
    return;
  }

  if (a3 == 12)
  {
    unint64_t v5 = &self->fCurrentCalibrationEntry;
    *(_OWORD *)&self->fCurrentCalibrationEntry.double companionPressure = *(_OWORD *)a4;
    self->fCurrentCalibrationEntry.double companionPressureUncertainty = *((double *)a4 + 2);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    unint64_t v6 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
    {
      double companionPressure = v5->companionPressure;
      double companionPressureUncertainty = self->fCurrentCalibrationEntry.companionPressureUncertainty;
      *(_DWORD *)buf = 134218240;
      *(double *)__int128 v26 = companionPressure;
      *(_WORD *)&v26[8] = 2048;
      double v27 = companionPressureUncertainty;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CLCompanionRelativeElevation] kNotificationCompanionFilteredPressure, pressure %f, unc %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_10182EF48);
      }
      double v18 = v5->companionPressure;
      double v19 = self->fCurrentCalibrationEntry.companionPressureUncertainty;
      int v22 = 134218240;
      *(double *)__int128 v23 = v18;
      *(_WORD *)&v23[8] = 2048;
      double v24 = v19;
      LODWORD(v21) = 22;
      id v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "[CLCompanionRelativeElevation] kNotificationCompanionFilteredPressure, pressure %f, unc %f",  COERCE_DOUBLE(&v22),  v21);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionRelativeElevationService onCompanionNotification:data:]",  "%s\n",  v20);
    }

    if (self->fPressureBiasEstimateStat.__ptr_.__value_)
    {
      -[CLCompanionRelativeElevationService updateRelativePressureCalibration]( self,  "updateRelativePressureCalibration");
      -[CLCompanionRelativeElevationService calculateRelativeElevation](self, "calculateRelativeElevation");
      return;
    }

    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_10182EF48);
    }
    int v17 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is not ready",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_10182EF48);
      }
      LOWORD(v22) = 0;
      LODWORD(v21) = 2;
      unint64_t v16 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  16LL,  "[CLCompanionRelativeElevation] fPressureBiasEstimateStat is not ready",  &v22,  *(void *)&v21);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLCompanionRelativeElevationService onCompanionNotification:data:]",  "%s\n");
      goto LABEL_31;
    }
  }

- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3
{
  if (a3)
  {
    double var1 = a3->var1;
    self->fCurrentCalibrationEntry.double watchPressure = a3->var2;
    self->fCurrentCalibrationEntry.watchPressureTimestamp = var1;
    self->fCurrentCalibrationEntry.watchPressureUncertainty = a3->var4;
  }

- (void)onMotionActivityNotification:(int)a3 data:(NotificationData *)a4
{
  self->fCurrentCalibrationEntry.motionStateTimestamp = *((double *)a4 + 5);
  self->fCurrentCalibrationEntry.motionState = *(_DWORD *)a4;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
  p_fCalibrationHourBuffer = &self->fCalibrationHourBuffer;
  begin = self->fCalibrationHourBuffer.__begin_;
  if (begin)
  {
    p_fCalibrationHourBuffer->__end_ = begin;
    operator delete(begin);
  }

  value = (void **)self->fCalibrationTable.__ptr_.__value_;
  self->fCalibrationTable.__ptr_.__value_ = 0LL;
  if (value) {
    sub_100223734((_DWORD)self + 184, value);
  }
  unint64_t v6 = self->fPressureBiasEstimateStat.__ptr_.__value_;
  self->fPressureBiasEstimateStat.__ptr_.__value_ = 0LL;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
  self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Dispatcher *))(*(void *)v7 + 8LL))(v7);
  }
  double v8 = self->fMotionActivityClient.__ptr_.__value_;
  self->fMotionActivityClient.__ptr_.__value_ = 0LL;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
  }
  double v9 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0LL;
  if (v9) {
    (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 23) = 0LL;
  *((void *)self + 25) = 0LL;
  *((void *)self + 26) = 0LL;
  *((void *)self + 24) = 0LL;
  return self;
}

@end