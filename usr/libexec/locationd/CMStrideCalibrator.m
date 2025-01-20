@interface CMStrideCalibrator
- (BOOL)checkValidTrack:(id)a3 associatedEntry:(const CLStepDistance *)a4;
- (BOOL)inOutdoorPedestrianSession;
- (BOOL)isAuthorizedForLocation;
- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3;
- (BOOL)outOfSession;
- (BOOL)queryStrideLengthTracks:(void *)a3;
- (id).cxx_construct;
- (id)calibrationTrackCallback;
- (id)copyHistory;
- (id)initInUniverse:(id)a3 stepCountDb:(shared_ptr<CLStepCountRecorderDb>)a4;
- (int64_t)currentSession;
- (shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)getSpdToKTable;
- (void)addLatestCalData:(id)a3;
- (void)attemptForcedLocation;
- (void)checkForLocationStateTransition;
- (void)checkLocationAuthorization;
- (void)checkTimeToSendNewCAGPSCalibration;
- (void)dealloc;
- (void)feedBodyMetrics:(CLBodyMetrics *)a3;
- (void)fsm:(id)a3 didTransitionFromState:(int)a4 toState:(int)a5;
- (void)fsm:(id)a3 didUpdateLocationAtTime:(double)a4;
- (void)fsm:(id)a3 didYieldTrack:(id)a4;
- (void)onLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onMotionStateNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onRunningFormMetrics:(const FormMetrics *)a3;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)quitForcedLocationState;
- (void)sendGPSCoreAnalyticsAndUpdateTime;
- (void)setCalibrationTrackCallback:(id)a3;
- (void)setSession:(int64_t)a3;
- (void)setupCLNotifiers;
- (void)startElevationSpectatorUpdates;
- (void)startElevationUpdates;
- (void)startGpsOdometerSpectatorUpdates;
- (void)startGpsOdometerUpdates;
- (void)startLeechingLocation;
- (void)startLocationUpdates;
- (void)stopElevationSpectatorUpdates;
- (void)stopElevationUpdates;
- (void)stopGpsOdometerSpectatorUpdates;
- (void)stopGpsOdometerUpdates;
- (void)stopLeechingLocation;
- (void)stopLocationUpdates;
- (void)strideCalibrationDatabase:(id)a3 didInsertEntry:(CLStrideCalEntry *)a4;
- (void)teardownCLNotifiers;
- (void)tick:(double)a3;
- (void)tickleArrow;
- (void)updateCalibrationBins:(double)a3;
- (void)updateUserHeight:(int64_t)a3;
@end

@implementation CMStrideCalibrator

- (id)initInUniverse:(id)a3 stepCountDb:(shared_ptr<CLStepCountRecorderDb>)a4
{
  ptr = (uint64_t *)a4.__ptr_;
  sub_1004F2598();
  if (sub_1004F7500() || (sub_1004F2598(), (sub_1001B9A1C() & 1) != 0))
  {
    v35.receiver = self;
    v35.super_class = (Class)&OBJC_CLASS___CMStrideCalibrator;
    v7 = -[CMStrideCalibrator init](&v35, "init");
    if (!v7) {
      return v7;
    }
    *((void *)v7 + 11) = a3;
    sub_1000F2F30((void *)v7 + 21, ptr);
    *((void *)v7 + 35) = 0LL;
    -[CMPedometerTableRawSpeedToKValue logBins]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "logBins");
    -[CMPedometerTableStepCadenceToStrideLength logBins]( +[CMPedometerTableStepCadenceToStrideLength sharedInstance]( &OBJC_CLASS___CMPedometerTableStepCadenceToStrideLength,  "sharedInstance"),  "logBins");
    v8 = objc_alloc_init(&OBJC_CLASS___CMStrideCalLocationFSM);
    *((void *)v7 + 19) = v8;
    -[CMStrideCalLocationFSM setDelegate:](v8, "setDelegate:", v7);
    *(_OWORD *)(v7 + 184) = xmmword_10130B5B0;
    *(_OWORD *)(v7 + 200) = unk_10130B5C0;
    *(_OWORD *)(v7 + 216) = xmmword_10130B5D0;
    *(_OWORD *)(v7 + 228) = *(__int128 *)((char *)&xmmword_10130B5D0 + 12);
    sub_1004F2598();
    if (sub_1001B9A1C())
    {
      v30[0] = 1;
      unsigned __int8 v34 = 1;
      sub_100602160(v30, &v34, buf);
      sub_10005F550((uint64_t)(v7 + 256), (__int128 *)buf);
      v9 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        v10 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        goto LABEL_18;
      }
    }

    else
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = 0LL;
      sub_10005F550((uint64_t)(v7 + 256), (__int128 *)buf);
      v9 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        v13 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v11 = __ldaxr(v13);
        while (__stlxr(v11 - 1, v13));
LABEL_18:
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }

    *((CFAbsoluteTime *)v7 + 31) = CFAbsoluteTimeGetCurrent();
    *((void *)v7 + 14) = objc_alloc_init(&OBJC_CLASS___CMStrideCalibrationElevationBuffer);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v14 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "AutomaticStrideCalibration,Pass,CreatingDaemonCacheForCalibrationBins",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      LOWORD(v31) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "AutomaticStrideCalibration,Pass,CreatingDaemonCacheForCalibrationBins",  &v31,  2);
      v24 = (uint8_t *)v23;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v23);
      if (v24 != buf) {
        free(v24);
      }
    }

    sub_1004F2598();
    if (sub_1001B9A1C())
    {
      *((void *)v7 + 17) = objc_alloc_init(&OBJC_CLASS___CMStrideCalibrationStats);
    }

    else
    {
      sub_1004F2598();
      if ((sub_1004F97F4() & 0x2000000) != 0)
      {
        *((void *)v7 + 13) = objc_alloc_init(&OBJC_CLASS___CMStrideCalibrationActivityBuffer);
        id v15 = objc_msgSend(objc_msgSend(*((id *)v7 + 11), "silo"), "newTimer");
        *((void *)v7 + 12) = v15;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_1005FEAAC;
        v33[3] = &unk_10181A288;
        v33[4] = v7;
        [v15 setHandler:v33];
      }
    }

    sub_1004F2598();
    if ((sub_1004F97F4() & 0x2000000) != 0)
    {
      *((void *)v7 + 20) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      *((void *)v7 + 16) = objc_alloc_init(&OBJC_CLASS___CMStrideCalibrationStepCountBuffer);
      v16 = -[CMStrideCalibrationDatabase initWithSilo:]( [CMStrideCalibrationDatabase alloc],  "initWithSilo:",  [*((id *)v7 + 11) silo]);
      *((void *)v7 + 18) = v16;
      -[CMStrideCalibrationDatabase setDelegate:](v16, "setDelegate:", v7);
      objc_msgSend( *((id *)v7 + 18),  "registerStrideCalDbForColdStorage:",  objc_msgSend(objc_msgSend(*((id *)v7 + 11), "vendor"), "proxyForService:", @"CMHealthColdStorageService"));
    }

    if (+[CMStrideCalibrationRunningFormBuffer isAvailable]( &OBJC_CLASS___CMStrideCalibrationRunningFormBuffer,  "isAvailable"))
    {
      *((void *)v7 + 15) = objc_alloc_init(&OBJC_CLASS___CMStrideCalibrationRunningFormBuffer);
    }

    [v7 setupCLNotifiers];
    v7[288] = 0;
    uint64_t v17 = sub_1006E27E8();
    sub_100413284(v17, &v31);
    sub_1002A6F64(v31, "MotionLoggerLogPedometer", (BOOL *)v7 + 288);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v18 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "AutomaticStrideCalibration,Success,AllChecksPassed",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      *(_WORD *)v30 = 0;
      LODWORD(v29) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "AutomaticStrideCalibration,Success,AllChecksPassed",  v30,  v29);
      v26 = (uint8_t *)v25;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v25);
      if (v26 != buf) {
        free(v26);
      }
    }

    v19 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    return v7;
  }

  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101843B48);
  }
  v12 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Not companion or watch. Returning.", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    LOWORD(v31) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Not companion or watch. Returning.",  &v31,  2);
    v28 = (uint8_t *)v27;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v27);
    if (v28 != buf) {
      free(v28);
    }
  }

  return 0LL;
}

- (void)dealloc
{
  self->fStopOpportunisticCalibrationTimer = 0LL;
  sub_1000F0D38(&self->fStepCountDb.__ptr_);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMStrideCalibrator;
  -[CMStrideCalibrator dealloc](&v3, "dealloc");
}

- (void)setSession:(int64_t)a3
{
  if (self->fCurrentSession != a3)
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v5 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      int64_t fCurrentSession = self->fCurrentSession;
      *(_DWORD *)buf = 134218240;
      int64_t v15 = fCurrentSession;
      __int16 v16 = 2048;
      int64_t v17 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "setSession,oldSession,%ld,newSession,%ld",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      int64_t v7 = self->fCurrentSession;
      int v10 = 134218240;
      int64_t v11 = v7;
      __int16 v12 = 2048;
      int64_t v13 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "setSession,oldSession,%ld,newSession,%ld",  &v10,  22);
      v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator setSession:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }

    self->int64_t fCurrentSession = a3;
    if (!-[CMStrideCalibrator inOutdoorPedestrianSession](self, "inOutdoorPedestrianSession")) {
      -[CMStrideCalibrator quitForcedLocationState](self, "quitForcedLocationState");
    }
    -[CMStrideCalibrator checkForLocationStateTransition](self, "checkForLocationStateTransition");
  }

- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3
{
  return -[CMStrideCalibrationDatabase isCalibrationConvergedMedianForSpeed:]( self->fDatabase,  "isCalibrationConvergedMedianForSpeed:",  a3);
}

- (void)addLatestCalData:(id)a3
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101843B48);
  }
  v5 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "A new calData is added: %s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    uint64_t v6 = qword_101934518;
    int v9 = 136315138;
    id v10 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  2LL,  "A new calData is added: %s",  (const char *)&v9);
    v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator addLatestCalData:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  -[NSMutableArray addObject:](self->fLatestCalDataArray, "addObject:", a3);
}

- (void)tick:(double)a3
{
}

- (void)checkTimeToSendNewCAGPSCalibration
{
  if (objc_opt_class(&OBJC_CLASS___MCProfileConnection)
    && (objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v4 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      double lastGPSCalibrationUpdateTime = self->lastGPSCalibrationUpdateTime;
      *(_DWORD *)buf = 134218496;
      double v20 = lastGPSCalibrationUpdateTime;
      __int16 v21 = 2048;
      double v22 = Current;
      __int16 v23 = 2048;
      double v24 = Current - lastGPSCalibrationUpdateTime;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Checking send time in checkTimeToSendNewCAGPSCalibration: LastTime: %0.3f, CurrentTime: %0.3f, Difference: %0.3f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      double v9 = self->lastGPSCalibrationUpdateTime;
      int v13 = 134218496;
      double v14 = v9;
      __int16 v15 = 2048;
      double v16 = Current;
      __int16 v17 = 2048;
      double v18 = Current - v9;
      LODWORD(v12) = 32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Checking send time in checkTimeToSendNewCAGPSCalibration: LastTime: %0.3f, CurrentTime: %0.3f, Difference: %0.3f",  COERCE_DOUBLE(&v13),  v12);
      int64_t v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkTimeToSendNewCAGPSCalibration]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    if (Current - self->lastGPSCalibrationUpdateTime >= 28800.0) {
      -[CMStrideCalibrator sendGPSCoreAnalyticsAndUpdateTime](self, "sendGPSCoreAnalyticsAndUpdateTime");
    }
  }

  else
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    uint64_t v6 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Not sending gps core analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      LOWORD(v13) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Not sending gps core analytics, no IHA permission",  &v13,  2);
      v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkTimeToSendNewCAGPSCalibration]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

- (int64_t)currentSession
{
  return self->fCurrentSession;
}

- (BOOL)inOutdoorPedestrianSession
{
  return (self->fCurrentSession < 0x19uLL) & (0x1028000u >> self->fCurrentSession);
}

- (BOOL)outOfSession
{
  return self->fCurrentSession == 0;
}

- (void)checkForLocationStateTransition
{
  int v3 = -[CMStrideCalLocationFSM locationState](self->fStrideCalLocationFSM, "locationState");
  if (-[CMStrideCalibrator inOutdoorPedestrianSession](self, "inOutdoorPedestrianSession") && v3 <= 2)
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v4 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      int64_t fCurrentSession = self->fCurrentSession;
      *(_DWORD *)buf = 134218242;
      int64_t v28 = fCurrentSession;
      __int16 v29 = 2080;
      id v30 = objc_msgSend( +[CMWorkout workoutName:](CMWorkout, "workoutName:", fCurrentSession),  "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "ForcingLocationDueToGizmoRequest,session,%ld,%s",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      uint64_t v10 = qword_101934518;
      int64_t v11 = self->fCurrentSession;
      id v12 = objc_msgSend(+[CMWorkout workoutName:](CMWorkout, "workoutName:", v11), "UTF8String");
      int v23 = 134218242;
      int64_t v24 = v11;
      __int16 v25 = 2080;
      id v26 = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  2LL,  "ForcingLocationDueToGizmoRequest,session,%ld,%s",  &v23,  22);
      double v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    -[CMStrideCalLocationFSM requestTransitionToLocationState:]( self->fStrideCalLocationFSM,  "requestTransitionToLocationState:",  3LL);
  }

  else
  {
    sub_1004F2598();
    if ((sub_1001B9A1C() & 1) == 0
      && -[CMStrideCalibrator outOfSession](self, "outOfSession")
      && -[CMStrideCalibrationActivityBuffer isRunningStateInWindow](self->fActivityBuffer, "isRunningStateInWindow"))
    {
      if (v3 >= 2)
      {
        if (v3 > 2) {
          return;
        }
      }

      else if (-[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow") >= 0xB)
      {
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101843B48);
        }
        uint64_t v6 = (os_log_s *)qword_101934518;
        if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v7 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          *(_DWORD *)buf = 67109120;
          LODWORD(v28) = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "StepRunNotification,Pass,LeechingLocation,Steps,%d",  buf,  8u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934510 != -1) {
            dispatch_once(&qword_101934510, &stru_101843B48);
          }
          uint64_t v19 = qword_101934518;
          unsigned int v20 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          int v23 = 67109120;
          LODWORD(v24) = v20;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  2LL,  "StepRunNotification,Pass,LeechingLocation,Steps,%d",  &v23);
          double v22 = (uint8_t *)v21;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v21);
          if (v22 != buf) {
            free(v22);
          }
        }

        -[CMStrideCalLocationFSM requestTransitionToLocationState:]( self->fStrideCalLocationFSM,  "requestTransitionToLocationState:",  2LL);
      }

      if (-[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow") >= 0x65)
      {
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101843B48);
        }
        v8 = (os_log_s *)qword_101934518;
        if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v9 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          *(_DWORD *)buf = 67109120;
          LODWORD(v28) = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "StepRunNotification,Pass,AttemptingToForceLocation,Steps,%d",  buf,  8u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934510 != -1) {
            dispatch_once(&qword_101934510, &stru_101843B48);
          }
          uint64_t v15 = qword_101934518;
          unsigned int v16 = -[CMStrideCalibrationStepCountBuffer stepsInWindow](self->fStepsBuffer, "stepsInWindow");
          int v23 = 67109120;
          LODWORD(v24) = v16;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v15,  2LL,  "StepRunNotification,Pass,AttemptingToForceLocation,Steps,%d",  &v23);
          double v18 = (uint8_t *)v17;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v17);
          if (v18 != buf) {
            free(v18);
          }
        }

        -[CMStrideCalibrator attemptForcedLocation](self, "attemptForcedLocation");
      }
    }
  }

- (void)attemptForcedLocation
{
  if (!-[CMStrideCalibrator outOfSession](self, "outOfSession")) {
    sub_101240DE0();
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v15 = Current;
  uint64_t v4 = sub_1002F8DDC();
  if (sub_1002A82BC(v4, "StrideCalibrationLastCalibration", &v15) && Current - v15 < 2400.0)
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v5 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v19 = Current - v15;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationSuccess,TimeSinceLastCalibrationSuccess,%0.3f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      int v16 = 134217984;
      double v17 = Current - v15;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationSuccess,TimeSinceLastCalibrationSuccess,%0.3f");
LABEL_32:
      int64_t v11 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator attemptForcedLocation]", "%s\n", v6);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

  else
  {
    uint64_t v7 = sub_1002F8DDC();
    if (sub_1002A82BC(v7, "StrideCalibrationLastCalibrationAttempt", &v15) && Current - v15 < 1200.0)
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      v8 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v19 = Current - v15;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationAttempt,TimeSinceLastCalibrationAttempt,%0.3f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101843B48);
        }
        int v16 = 134217984;
        double v17 = Current - v15;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationAttempt,TimeSinceLastCalibrationAttempt,%0.3f");
        goto LABEL_32;
      }
    }

    else
    {
      uint64_t v9 = sub_1002F8DDC();
      if (sub_1002A82BC(v9, "LastStrideCalibrationConverge", &v15) && Current - v15 < 2592000.0)
      {
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101843B48);
        }
        uint64_t v10 = (os_log_s *)qword_101934518;
        if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v19 = Current - v15;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastConverged,TimeSinceLastCalibrationAttempt,%0.3f",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934510 != -1) {
            dispatch_once(&qword_101934510, &stru_101843B48);
          }
          int v16 = 134217984;
          double v17 = Current - v15;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastConverged,TimeSinceLastCalibrationAttempt,%0.3f");
          goto LABEL_32;
        }
      }

      else
      {
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101843B48);
        }
        id v12 = (os_log_s *)qword_101934518;
        if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "AttemptForcedLocation,Success,AllChecksPassed",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934510 != -1) {
            dispatch_once(&qword_101934510, &stru_101843B48);
          }
          LOWORD(v16) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "AttemptForcedLocation,Success,AllChecksPassed",  &v16,  2);
          double v14 = (uint8_t *)v13;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator attemptForcedLocation]", "%s\n", v13);
          if (v14 != buf) {
            free(v14);
          }
        }

        -[CMStrideCalLocationFSM requestTransitionToLocationState:]( self->fStrideCalLocationFSM,  "requestTransitionToLocationState:",  3LL);
      }
    }
  }

- (void)quitForcedLocationState
{
  if (-[CMStrideCalLocationFSM locationState](self->fStrideCalLocationFSM, "locationState") == 3)
  {
    uint64_t v3 = sub_1002F8DDC();
    *(void *)buf = CFAbsoluteTimeGetCurrent();
    sub_1002AC7B8(v3, "StrideCalibrationLastCalibrationAttempt", buf);
    -[CMStrideCalLocationFSM requestTransitionToLocationState:]( self->fStrideCalLocationFSM,  "requestTransitionToLocationState:",  2LL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    uint64_t v4 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Terminated forced calibration.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      v7[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Terminated forced calibration.",  v7,  2);
      uint64_t v6 = (uint8_t *)v5;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator quitForcedLocationState]", "%s\n", v5);
      if (v6 != buf) {
        free(v6);
      }
    }
  }

- (shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)getSpdToKTable
{
  cntrl = self->fGPSCalibrationTable.__cntrl_;
  *v2 = self->fGPSCalibrationTable.__ptr_;
  v2[1] = (GPSRawSpeedToKValueTable *)cntrl;
  if (cntrl)
  {
    uint64_t v4 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (GPSRawSpeedToKValueTable *)self;
  return result;
}

- (void)strideCalibrationDatabase:(id)a3 didInsertEntry:(CLStrideCalEntry *)a4
{
  if ([a3 isCalibrationConvergedStdForBinWithSpeed:a4->speed])
  {
    uint64_t v6 = sub_1002F8DDC();
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    sub_1002AC7B8(v6, "LastStrideCalibrationConverge", &Current);
  }

  -[CMStrideCalibrationStats activityLoggerLogStrideCalEntry:](self->fStats, "activityLoggerLogStrideCalEntry:", a4);
  if (-[CMStrideCalibrator calibrationTrackCallback](self, "calibrationTrackCallback"))
  {
    uint64_t v7 = -[CMStrideCalibrator calibrationTrackCallback](self, "calibrationTrackCallback");
    __int128 v8 = *(_OWORD *)&a4->percentGrade;
    v11[4] = *(_OWORD *)&a4->steps;
    v11[5] = v8;
    v11[6] = *(_OWORD *)&a4->timestamp;
    uint64_t v12 = *(void *)&a4->runningFormStrideLengthMetrics;
    __int128 v9 = *(_OWORD *)&a4->endTime;
    v11[2] = *(_OWORD *)&a4->kvalueTrack;
    v11[3] = v9;
    __int128 v10 = *(_OWORD *)&a4->pacebin;
    v11[0] = *(_OWORD *)&a4->recordId;
    v11[1] = v10;
    v7[2](v7, v11);
  }

- (void)fsm:(id)a3 didTransitionFromState:(int)a4 toState:(int)a5
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101843B48);
  }
  __int128 v8 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    int v15 = a4;
    __int16 v16 = 1024;
    int v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "LocationStateOld,%d,LocationStateNew,%d",  buf,  0xEu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v11[0] = 67109376;
    v11[1] = a4;
    __int16 v12 = 1024;
    int v13 = a5;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "LocationStateOld,%d,LocationStateNew,%d",  v11,  14);
    __int128 v10 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator fsm:didTransitionFromState:toState:]", "%s\n", v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  if (a5 <= 1)
  {
    -[CMStrideCalibrator stopLeechingLocation](self, "stopLeechingLocation");
    -[CMStrideCalibrator stopGpsOdometerSpectatorUpdates](self, "stopGpsOdometerSpectatorUpdates");
    -[CMStrideCalibrator stopElevationSpectatorUpdates](self, "stopElevationSpectatorUpdates");
    goto LABEL_11;
  }

  self->fLastGoodLocFix = CFAbsoluteTimeGetCurrent();
  -[CMStrideCalibrator startLeechingLocation](self, "startLeechingLocation");
  -[CMStrideCalibrator startGpsOdometerSpectatorUpdates](self, "startGpsOdometerSpectatorUpdates");
  -[CMStrideCalibrator startElevationSpectatorUpdates](self, "startElevationSpectatorUpdates");
  if (a5 == 2)
  {
LABEL_11:
    -[CMStrideCalibrator stopLocationUpdates](self, "stopLocationUpdates");
    -[CMStrideCalibrator stopGpsOdometerUpdates](self, "stopGpsOdometerUpdates");
    -[CMStrideCalibrator stopElevationUpdates](self, "stopElevationUpdates");
    return;
  }

  -[CMStrideCalibrator startLocationUpdates](self, "startLocationUpdates");
  -[CMStrideCalibrator startGpsOdometerUpdates](self, "startGpsOdometerUpdates");
  -[CMStrideCalibrator startElevationUpdates](self, "startElevationUpdates");
  if (-[CMStrideCalibrator outOfSession](self, "outOfSession")) {
    -[CLTimer setNextFireDelay:](self->fStopOpportunisticCalibrationTimer, "setNextFireDelay:", 360.0);
  }
}

- (void)fsm:(id)a3 didYieldTrack:(id)a4
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v6 = sub_1002F8DDC();
  sub_1002AC7B8(v6, "StrideCalibrationLastCalibration", &Current);
  uint64_t v7 = -[CMStrideCalDataContainer initWithTrack:session:]( objc_alloc(&OBJC_CLASS___CMStrideCalDataContainer),  "initWithTrack:session:",  a4,  -[CMStrideCalibrator currentSession](self, "currentSession"));
  -[CMStrideCalibrator addLatestCalData:](self, "addLatestCalData:", v7);
}

- (void)fsm:(id)a3 didUpdateLocationAtTime:(double)a4
{
  if (-[CMStrideCalibrator outOfSession](self, "outOfSession"))
  {
    int v5 = -[CMStrideCalLocationFSM locationState](self->fStrideCalLocationFSM, "locationState");
    double Current = CFAbsoluteTimeGetCurrent();
    double v28 = Current;
    BOOL v7 = Current - self->fLastGoodLocFix > 30.0 && v5 == 3;
    int v8 = v7;
    if (v7)
    {
      -[CMStrideCalLocationFSM requestTransitionToLocationState:]( self->fStrideCalLocationFSM,  "requestTransitionToLocationState:",  2LL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      __int128 v9 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        double v10 = Current - self->fLastGoodLocFix;
        *(_DWORD *)buf = 134217984;
        double v32 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "TrackClose,Pass,LocationTimeout,TimeSinceLastPosition,%0.3f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101843B48);
        }
        double v11 = Current - self->fLastGoodLocFix;
        int v29 = 134217984;
        double v30 = v11;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "TrackClose,Pass,LocationTimeout,TimeSinceLastPosition,%0.3f",  COERCE_DOUBLE(&v29));
        int v13 = (uint8_t *)v12;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator fsm:didUpdateLocationAtTime:]", "%s\n", v12);
        if (v13 != buf) {
          free(v13);
        }
      }

- (BOOL)checkValidTrack:(id)a3 associatedEntry:(const CLStepDistance *)a4
{
  double v8 = v7;
  objc_msgSend(objc_msgSend(a3, "stop"), "timeIntervalSinceReferenceDate");
  double v10 = v9;
  [a3 distanceRawPed];
  if (v11 <= 0.0)
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    uint64_t v19 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v57 = v8;
      __int16 v58 = 2048;
      double v59 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "TrackCalibration,Fail,Pedometer distance is zero,startTime,%f,endTime,%f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      int v46 = 134218240;
      double v47 = v8;
      __int16 v48 = 2048;
      double v49 = v10;
      LODWORD(v45) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "TrackCalibration,Fail,Pedometer distance is zero,startTime,%f,endTime,%f",  COERCE_DOUBLE(&v46),  v45);
      v38 = (uint8_t *)v37;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v37);
      if (v38 != buf) {
        free(v38);
      }
    }

    fStats = self->fStats;
    double var1 = a4->var1;
    double v22 = @"ZeroDistance";
    uint64_t v23 = 7LL;
    goto LABEL_22;
  }

  [a3 distanceRawPed];
  double v13 = v12 / (v10 - v8);
  if (!-[CMPedometerTableRawSpeedToKValue isRawSpeedValid:]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "isRawSpeedValid:",  v13))
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    uint64_t v24 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      double v57 = v13;
      __int16 v58 = 2048;
      double v59 = v8;
      __int16 v60 = 2048;
      double v61 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "TrackCalibration,Fail,rawSpeed %f out of bounds,startTime,%f,endTime,%f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      int v46 = 134218496;
      double v47 = v13;
      __int16 v48 = 2048;
      double v49 = v8;
      __int16 v50 = 2048;
      double v51 = v10;
      LODWORD(v45) = 32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "TrackCalibration,Fail,rawSpeed %f out of bounds,startTime,%f,endTime,%f",  COERCE_DOUBLE(&v46),  v45);
      v40 = (uint8_t *)v39;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v39);
      if (v40 != buf) {
        free(v40);
      }
    }

    fStats = self->fStats;
    double var1 = a4->var1;
    double v22 = @"SpeedOutOfBounds";
    uint64_t v23 = 6LL;
LABEL_22:
    -[CMStrideCalibrationStats awdLogDistance:status:description:]( fStats,  "awdLogDistance:status:description:",  v23,  v22,  var1);
LABEL_23:
    LOBYTE(v25) = 0;
    return v25;
  }

  [a3 distanceGps];
  double v15 = v14;
  [a3 distanceRawPed];
  double v17 = v15 / v16;
  sub_1004F2598();
  if (sub_1001B9A1C())
  {
    if (v17 <= 1.4 && v17 >= 0.5) {
      goto LABEL_27;
    }
  }

  else if (v17 <= 2.0 && v17 >= 0.666666667)
  {
LABEL_27:
    LOBYTE(v25) = 1;
    return v25;
  }

  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101843B48);
  }
  id v26 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    double v57 = COERCE_DOUBLE(objc_msgSend(objc_msgSend(a3, "description"), "UTF8String"));
    __int16 v58 = 2048;
    double v59 = v17;
    __int16 v60 = 2048;
    double v61 = v13;
    __int16 v62 = 2048;
    double v63 = v8;
    __int16 v64 = 2048;
    double v65 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "TrackCalibration,Fail,KFactorOutOfBounds,%s,KFactor,%0.4f,RawSpeed,%f,startTime,%f,endTime,%f",  buf,  0x34u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    uint64_t v41 = qword_101934518;
    int v46 = 136316162;
    double v47 = COERCE_DOUBLE(objc_msgSend(objc_msgSend(a3, "description"), "UTF8String"));
    __int16 v48 = 2048;
    double v49 = v17;
    __int16 v50 = 2048;
    double v51 = v13;
    __int16 v52 = 2048;
    double v53 = v8;
    __int16 v54 = 2048;
    double v55 = v10;
    LODWORD(v45) = 52;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v41,  2LL,  "TrackCalibration,Fail,KFactorOutOfBounds,%s,KFactor,%0.4f,RawSpeed,%f,startTime,%f,endTime,%f",  (const char *)&v46,  v45);
    v43 = (uint8_t *)v42;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v42);
    if (v43 != buf) {
      free(v43);
    }
  }

  -[CMStrideCalibrationStats awdLogDistance:status:description:]( self->fStats,  "awdLogDistance:status:description:",  5LL,  @"GainOutOfBounds",  a4->var1);
  [a3 distanceGps];
  double v28 = v27;
  int v29 = self->fStats;
  double v30 = a4->var1;
  if (v28 >= 70.0)
  {
    -[CMStrideCalibrationStats awdLogDistance:status:description:]( v29,  "awdLogDistance:status:description:",  3LL,  @"GainOutOfBounds",  v30);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    unsigned __int8 v34 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      double v35 = a4->var1;
      *(_DWORD *)buf = 134218496;
      double v57 = v35;
      __int16 v58 = 2048;
      double v59 = v8;
      __int16 v60 = 2048;
      double v61 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "SessionMetrics,Fail,Pedometer,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f",  buf,  0x20u);
    }

    BOOL v25 = sub_1002921D0(115, 2);
    if (v25)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "SessionMetrics,Fail,Pedometer,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f");
      goto LABEL_50;
    }
  }

  else
  {
    -[CMStrideCalibrationStats awdLogDistance:status:description:]( v29,  "awdLogDistance:status:description:",  2LL,  @"GainOutOfBounds",  v30);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    uint64_t v31 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      double v32 = a4->var1;
      *(_DWORD *)buf = 134218496;
      double v57 = v32;
      __int16 v58 = 2048;
      double v59 = v8;
      __int16 v60 = 2048;
      double v61 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "SessionMetrics,Fail,GPS,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f",  buf,  0x20u);
    }

    BOOL v25 = sub_1002921D0(115, 2);
    if (v25)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101843B48);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "SessionMetrics,Fail,GPS,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f");
LABEL_50:
      v36 = (uint8_t *)v33;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v33);
      if (v36 != buf) {
        free(v36);
      }
      goto LABEL_23;
    }
  }

  return v25;
}

- (void)sendGPSCoreAnalyticsAndUpdateTime
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101843B48);
  }
  uint64_t v3 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Correctly sending core analytics and updating latest time in gps calibration",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Correctly sending core analytics and updating latest time in gps calibration",  v7,  2);
    uint64_t v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator sendGPSCoreAnalyticsAndUpdateTime]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  self->double lastGPSCalibrationUpdateTime = CFAbsoluteTimeGetCurrent();
  ptr = self->fGPSCalibrationTable.__ptr_;
  if (ptr) {
    sub_1001AFF5C((uint64_t)ptr, &self->fCLBodyMetrics.gender);
  }
}

- (void)updateCalibrationBins:(double)a3
{
  id v52 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  fLatestCalDataArray = self->fLatestCalDataArray;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( fLatestCalDataArray,  "countByEnumeratingWithState:objects:count:",  &v60,  v74,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v61;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v61 != v7) {
          objc_enumerationMutation(fLatestCalDataArray);
        }
        double v9 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)v8);
        objc_msgSend(objc_msgSend(objc_msgSend(v9, "track"), "start"), "timeIntervalSinceReferenceDate");
        double v11 = v10;
        objc_msgSend(objc_msgSend(objc_msgSend(v9, "track"), "stop"), "timeIntervalSinceReferenceDate");
        double v13 = v12;
        double v14 = a3 - v12;
        if (a3 - v12 >= 60.0)
        {
          -[CMStrideCalibrationElevationBuffer updateGradient:](self->fElevationBuffer, "updateGradient:", v9);
          [v52 addObject:v9];
          if (v14 < 1800.0)
          {
            if (qword_101934510 != -1) {
              dispatch_once(&qword_101934510, &stru_101843B48);
            }
            double v15 = (os_log_s *)qword_101934518;
            if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
            {
              id v16 = objc_msgSend(objc_msgSend(v9, "description"), "UTF8String");
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = v16;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = a3;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "CalData, %s, stepEntryEpochTime, %f",  buf,  0x16u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934510 != -1) {
                dispatch_once(&qword_101934510, &stru_101843B48);
              }
              uint64_t v44 = qword_101934518;
              id v45 = objc_msgSend(objc_msgSend(v9, "description"), "UTF8String");
              int v64 = 136315394;
              *(void *)double v65 = v45;
              *(_WORD *)&v65[8] = 2048;
              double v66 = a3;
              LODWORD(v51) = 22;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v44,  2LL,  "CalData, %s, stepEntryEpochTime, %f",  (const char *)&v64,  v51);
              double v47 = (char *)v46;
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v46);
              if (v47 != buf) {
                free(v47);
              }
            }

            sub_101026CBC((uint64_t)self->fStepCountDb.__ptr_, 1, (uint64_t)v56, v11, v13);
            if ([v9 gradientValidity])
            {
              if (!-[CMStrideCalibrator checkValidTrack:associatedEntry:]( self,  "checkValidTrack:associatedEntry:",  [v9 track],  v56)) {
                goto LABEL_49;
              }
              if (qword_101934510 != -1) {
                dispatch_once(&qword_101934510, &stru_101843B48);
              }
              double v17 = (os_log_s *)qword_101934518;
              if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v58;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v59;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "FloorsAscended,%d,FloorsDescended,%d",  buf,  0xEu);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_101934510 != -1) {
                  dispatch_once(&qword_101934510, &stru_101843B48);
                }
                int v64 = 67109376;
                *(_DWORD *)double v65 = v58;
                *(_WORD *)&v65[4] = 1024;
                *(_DWORD *)&v65[6] = v59;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "FloorsAscended,%d,FloorsDescended,%d",  &v64,  14);
                double v49 = (char *)v48;
                sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v48);
                if (v49 != buf) {
                  free(v49);
                }
              }

              objc_msgSend(objc_msgSend(v9, "track"), "distanceRawPed");
              double v19 = v18;
              sub_1004F2598();
              else {
                unsigned int v20 = 0;
              }
              sub_1004F2598();
              BOOL v24 = sub_1004F7500();
              double v25 = v19 / (v13 - v11);
              if (!v24) {
                goto LABEL_36;
              }
              if (!-[CMStrideCalibrator inOutdoorPedestrianSession](self, "inOutdoorPedestrianSession"))
              {
                BOOL v24 = -[CMStrideCalibrator outOfSession](self, "outOfSession");
                if (v24) {
                  BOOL v24 = -[CMPedometerTableRawSpeedToKValue isRawSpeedRun:]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "isRawSpeedRun:",  v25);
                }
LABEL_36:
                if ((v20 | v24) != 1) {
                  goto LABEL_49;
                }
              }

              double v26 = COERCE_DOUBLE( -[CMStrideCalibrationRunningFormBuffer strideLengthFromStartDate:endDate:]( self->fFormBuffer,  "strideLengthFromStartDate:endDate:",  objc_msgSend(objc_msgSend(v9, "track"), "start"),  objc_msgSend(objc_msgSend(v9, "track"), "stop")));
              uint64_t v28 = v27;
              -[CMPedometerTableRawSpeedToKValue updateBinsWithTrack:]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "updateBinsWithTrack:",  [v9 track]);
              -[CMPedometerTableStepCadenceToStrideLength updateBinsWithTrack:]( +[CMPedometerTableStepCadenceToStrideLength sharedInstance]( CMPedometerTableStepCadenceToStrideLength,  "sharedInstance"),  "updateBinsWithTrack:",  [v9 track]);
              ptr = self->fGPSCalibrationTable.__ptr_;
              if (ptr) {
                sub_1001AF358((uint64_t)ptr, [v9 track]);
              }
              -[CMStrideCalibrator sendGPSCoreAnalyticsAndUpdateTime](self, "sendGPSCoreAnalyticsAndUpdateTime");
              *(_DWORD *)buf = 0;
              *(double *)&buf[8] = v11;
              *(_DWORD *)&buf[16] = 0;
              -[CMPedometerTableRawSpeedToKValue kValueForRawSpeed:]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "kValueForRawSpeed:",  v25);
              *(void *)&buf[24] = v30;
              objc_msgSend(objc_msgSend(v9, "track"), "distanceGps");
              double v32 = v31;
              objc_msgSend(objc_msgSend(v9, "track"), "distanceRawPed");
              __int128 v68 = COERCE_UNSIGNED_INT64(v32 / v33);
              *(double *)&__int128 v69 = v13;
              objc_msgSend(objc_msgSend(v9, "track"), "distanceGps");
              *((void *)&v69 + 1) = v34;
              objc_msgSend(objc_msgSend(v9, "track"), "steps");
              LODWORD(v70) = (int)v35;
              DWORD1(v70) = [v9 session];
              *((double *)&v70 + 1) = v25;
              [v9 gradient];
              *(void *)&__int128 v71 = v36;
              unsigned int v37 = objc_msgSend(objc_msgSend(v9, "track"), "gpsSource");
              double v38 = v26;
              DWORD2(v71) = v37;
              *(void *)&__int128 v72 = 0LL;
              *((double *)&v72 + 1) = v38;
              LODWORD(v73) = v28;
              if (self->fLogPedometer)
              {
                sub_10116FF80((uint64_t)buf, (uint64_t)&v64);
                if (qword_1019A1D00 != -1) {
                  dispatch_once(&qword_1019A1D00, &stru_101843B68);
                }
                uint64_t v39 = qword_1019A1D08;
                if (qword_1019A1D08)
                {
                  v40 = operator new(0x60uLL);
                  uint64_t v55 = sub_101150584((uint64_t)v40, (uint64_t)&v64);
                  double Current = CFAbsoluteTimeGetCurrent();
                  sub_100B50F84(v39, &v55, Current);
                  uint64_t v42 = v55;
                  uint64_t v55 = 0LL;
                  if (v42) {
                    (*(void (**)(uint64_t))(*(void *)v42 + 8LL))(v42);
                  }
                }

                PB::Base::~Base((PB::Base *)&v64);
              }

              fDatabase = self->fDatabase;
              v53[4] = v70;
              v53[5] = v71;
              v53[6] = v72;
              uint64_t v54 = v73;
              v53[0] = *(_OWORD *)buf;
              v53[1] = *(_OWORD *)&buf[16];
              v53[2] = v68;
              v53[3] = v69;
              -[CMStrideCalibrationDatabase addEntry:](fDatabase, "addEntry:", v53);
              -[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:]( self->fStats,  "awdMotionFitnessStrideCalibration:",  buf);
              -[CMStrideCalibrationStats awdLogDistance:status:description:]( self->fStats,  "awdLogDistance:status:description:",  0LL,  @"Yay!",  v57);
              goto LABEL_49;
            }

            -[CMStrideCalibrationStats awdLogDistance:status:description:]( self->fStats,  "awdLogDistance:status:description:",  4LL,  @"GradientOutOfBounds",  v57);
            if (qword_101934510 != -1) {
              dispatch_once(&qword_101934510, &stru_101843B48);
            }
            __int16 v21 = (os_log_s *)qword_101934518;
            if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              *(double *)&uint8_t buf[4] = v11;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "SessionMetrics,Fail,Gradient,DistanceFusion,startTime,%f,endTime,%f",  buf,  0x16u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934510 != -1) {
                dispatch_once(&qword_101934510, &stru_101843B48);
              }
              int v64 = 134218240;
              *(double *)double v65 = v11;
              *(_WORD *)&v65[8] = 2048;
              double v66 = v13;
              LODWORD(v51) = 22;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "SessionMetrics,Fail,Gradient,DistanceFusion,startTime,%f,endTime,%f",  COERCE_DOUBLE(&v64),  v51);
              uint64_t v23 = (char *)v22;
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v22);
              if (v23 != buf) {
                free(v23);
              }
            }
          }
        }

- (void)updateUserHeight:(int64_t)a3
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101843B48);
  }
  int v5 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Correctly calling update user height in stride calibrator.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Correctly calling update user height in stride calibrator.",  v8,  2);
    uint64_t v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator updateUserHeight:]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  -[CMStrideCalibrationStats updateUserHeight:](self->fStats, "updateUserHeight:", a3);
}

- (void)feedBodyMetrics:(CLBodyMetrics *)a3
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101843B48);
  }
  int v5 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Correctly feeding body metrics in stride calibrator.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101843B48);
    }
    v11[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Correctly feeding body metrics in stride calibrator.",  v11,  2);
    double v10 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator feedBodyMetrics:]", "%s\n", v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  __int128 v6 = *(_OWORD *)&a3->gender;
  __int128 v7 = *(_OWORD *)&a3->vo2max;
  __int128 v8 = *(_OWORD *)&a3->hronset;
  *(_OWORD *)&self->fCLBodyMetrics.runVo2max = *(_OWORD *)&a3->runVo2max;
  *(_OWORD *)&self->fCLBodyMetrics.hronset = v8;
  *(_OWORD *)&self->fCLBodyMetrics.vo2max = v7;
  *(_OWORD *)&self->fCLBodyMetrics.gender = v6;
  -[CMStrideCalibrator updateUserHeight:](self, "updateUserHeight:", llroundf(a3->heightM * 100.0));
}

- (id)copyHistory
{
  return -[CMStrideCalibrationDatabase copyHistory](self->fDatabase, "copyHistory");
}

- (BOOL)queryStrideLengthTracks:(void *)a3
{
  return -[CMStrideCalibrationDatabase queryStrideLengthTracks:](self->fDatabase, "queryStrideLengthTracks:", a3);
}

- (id)calibrationTrackCallback
{
  return self->_calibrationTrackCallback;
}

- (void)setCalibrationTrackCallback:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  uint64_t v4 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  int v5 = self->fMotionStateClient.__ptr_.__value_;
  self->fMotionStateClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
  }
  __int128 v6 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
  }
  __int128 v7 = self->fStreamingAwareLocationClient.__ptr_.__value_;
  self->fStreamingAwareLocationClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
  }
  __int128 v8 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = 0LL;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
  }
  double v9 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0LL;
  if (v9) {
    (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 21) = 0LL;
  *((void *)self + 22) = 0LL;
  *((void *)self + 32) = 0LL;
  *((void *)self + 33) = 0LL;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    -[CMStrideCalibrationStepCountBuffer feedStepCountUpdate:](self->fStepsBuffer, "feedStepCountUpdate:", a4);
    -[CMStrideCalibrator tick:](self, "tick:", *((double *)a4 + 2));
    -[CMStrideCalLocationFSM feedPedometerData:](self->fStrideCalLocationFSM, "feedPedometerData:", a4);
  }

- (void)onMotionStateNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1) {
    -[CMStrideCalibrationActivityBuffer feedMotionStateData:](self->fActivityBuffer, "feedMotionStateData:", a4);
  }
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v6 = *a3;
  if (*a3 == 7)
  {
    -[CMStrideCalibrationElevationBuffer feedElevationData:](self->fElevationBuffer, "feedElevationData:", a4);
    int v6 = *a3;
  }

  if (v6 == 4) {
    -[CMStrideCalLocationFSM feedGpsOdometerData:](self->fStrideCalLocationFSM, "feedGpsOdometerData:", a4);
  }
}

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  int v7 = *a3;
  if (*a3)
  {
    if (v7 == 14)
    {
      -[CMStrideCalibrator checkLocationAuthorization](self, "checkLocationAuthorization");
    }

    else if (v7 == 5)
    {
      -[CMStrideCalLocationFSM feedLocationData:](self->fStrideCalLocationFSM, "feedLocationData:", a4);
    }

    else
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101864590);
      }
      __int128 v8 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *a3;
        *(_DWORD *)buf = 67109120;
        int v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#Warning Received unhandled notification, %d",  buf,  8u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101864590);
        }
        int v10 = *a3;
        v13[0] = 67109120;
        v13[1] = v10;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  0LL,  "#Warning Received unhandled notification, %d",  v13);
        double v12 = (uint8_t *)v11;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMStrideCalibrator(DataInput) onLocationNotification:data:]",  "%s\n",  v11);
        if (v12 != buf) {
          free(v12);
        }
      }
    }
  }

- (void)onRunningFormMetrics:(const FormMetrics *)a3
{
}

- (void)setupCLNotifiers
{
  uint64_t v3 = v30;
  uint64_t v30 = 0LL;
  value = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    int v5 = v30;
    uint64_t v30 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->fStepCountClient.__ptr_.__value_ + 2) register:*((void *)self->fStepCountClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  sub_1003A09BC((uint64_t)sub_100DD6554, (uint64_t)self, self->fUniverse, &v30);
  int v6 = v30;
  uint64_t v30 = 0LL;
  int v7 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = v6;
  if (v7)
  {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    __int128 v8 = v30;
    uint64_t v30 = 0LL;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    }
  }

  sub_10027EB5C((uint64_t)sub_100DD6750, (uint64_t)self, self->fUniverse, &v30);
  int v9 = v30;
  uint64_t v30 = 0LL;
  int v10 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = v9;
  if (v10)
  {
    (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
    double v11 = v30;
    uint64_t v30 = 0LL;
    if (v11) {
      (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
    }
  }

  double v12 = operator new(0xC0uLL);
  sub_100AEB404(v12, "MotionCalibration", self->fUniverse);
  self->fServiceLocationProvider = v12;
  sub_100AEB408((uint64_t)v12, (uint64_t)sub_100DD6760, (uint64_t)self, self->fUniverse, &v30);
  double v13 = v30;
  uint64_t v30 = 0LL;
  double v14 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = v13;
  if (v14)
  {
    (*(void (**)(Client *))(*(void *)v14 + 8LL))(v14);
    int v15 = v30;
    uint64_t v30 = 0LL;
    if (v15) {
      (*(void (**)(Client *))(*(void *)v15 + 8LL))(v15);
    }
  }

  [*((id *)self->fServiceLocationClient.__ptr_.__value_ + 2) register:*((void *)self->fServiceLocationClient.__ptr_.__value_ + 1) forNotification:14 registrationInfo:0];
  sub_100AE5DA0((uint64_t)sub_100DD6760, (uint64_t)self, self->fUniverse, &v30);
  id v16 = v30;
  uint64_t v30 = 0LL;
  double v17 = self->fStreamingAwareLocationClient.__ptr_.__value_;
  self->fStreamingAwareLocationClient.__ptr_.__value_ = v16;
  if (v17)
  {
    (*(void (**)(Client *))(*(void *)v17 + 8LL))(v17);
    double v18 = v30;
    uint64_t v30 = 0LL;
    if (v18) {
      (*(void (**)(Client *))(*(void *)v18 + 8LL))(v18);
    }
  }

  self->fStreamingAwareProxy = (CLStreamingAwareLocationProviderProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor]( self->fUniverse,  "vendor"),  "proxyForService:forClient:",  @"CLStreamingAwareLocationProvider",  @"CLStepCountNotifier");
  self->fClientAuthorizationCache = (CLClientAuthorizationCacheProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor]( self->fUniverse,  "vendor"),  "proxyForService:",  @"CLClientAuthorizationCache");
  sub_1004F2598();
  if (sub_1001B9A1C())
  {
    sub_100468458((uint64_t)sub_100DD6770, (uint64_t)self, self->fUniverse, &v30);
    double v19 = v30;
    uint64_t v30 = 0LL;
    unsigned int v20 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = v19;
    if (v20)
    {
      (*(void (**)(Client *))(*(void *)v20 + 8LL))(v20);
      __int16 v21 = v30;
      uint64_t v30 = 0LL;
      if (v21) {
        (*(void (**)(Client *))(*(void *)v21 + 8LL))(v21);
      }
    }

    double v22 = self->fMotionStateMediatorClient.__ptr_.__value_;
    uint64_t v24 = *((void *)v22 + 1);
    uint64_t v23 = (void *)*((void *)v22 + 2);
    uint64_t v25 = 1LL;
  }

  else
  {
    sub_10036B3B4((uint64_t)sub_100DD6780, (uint64_t)self, self->fUniverse, &v30);
    double v26 = v30;
    uint64_t v30 = 0LL;
    uint64_t v27 = self->fMotionStateClient.__ptr_.__value_;
    self->fMotionStateClient.__ptr_.__value_ = v26;
    if (v27)
    {
      (*(void (**)(Client *))(*(void *)v27 + 8LL))(v27);
      uint64_t v28 = v30;
      uint64_t v30 = 0LL;
      if (v28) {
        (*(void (**)(Client *))(*(void *)v28 + 8LL))(v28);
      }
    }

    [*((id *)self->fMotionStateClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
    int v29 = self->fCompanionClient.__ptr_.__value_;
    uint64_t v24 = *((void *)v29 + 1);
    uint64_t v23 = (void *)*((void *)v29 + 2);
    uint64_t v25 = 5LL;
  }

  [v23 register:v24 forNotification:v25 registrationInfo:0];
  -[CMStrideCalibrator checkLocationAuthorization](self, "checkLocationAuthorization");
}

- (void)teardownCLNotifiers
{
  fServiceLocationProvider = self->fServiceLocationProvider;
  if (fServiceLocationProvider) {
    (*(void (**)(void *, SEL))(*(void *)fServiceLocationProvider + 8LL))(fServiceLocationProvider, a2);
  }
  self->fServiceLocationProvider = 0LL;
  -[CLStreamingAwareLocationProviderProtocol releaseAccuracyEnablementAssertionForClient:]( self->fStreamingAwareProxy,  "releaseAccuracyEnablementAssertionForClient:",  CLISP_ME_TOKEN);

  self->fStreamingAwareProxy = 0LL;
  self->fClientAuthorizationCache = 0LL;
}

- (void)startElevationUpdates
{
}

- (void)stopElevationUpdates
{
}

- (void)startElevationSpectatorUpdates
{
}

- (void)stopElevationSpectatorUpdates
{
}

- (void)startGpsOdometerSpectatorUpdates
{
}

- (void)stopGpsOdometerSpectatorUpdates
{
}

- (void)startGpsOdometerUpdates
{
}

- (void)stopGpsOdometerUpdates
{
}

- (void)startLocationUpdates
{
}

- (void)stopLocationUpdates
{
}

- (void)startLeechingLocation
{
}

- (void)stopLeechingLocation
{
}

- (void)tickleArrow
{
}

- (void)checkLocationAuthorization
{
  unsigned int v3 = -[CMStrideCalibrator isAuthorizedForLocation](self, "isAuthorizedForLocation");
  fStrideCalLocationFSM = self->fStrideCalLocationFSM;
  if (v3)
  {
    if (-[CMStrideCalLocationFSM locationState](fStrideCalLocationFSM, "locationState") <= 0)
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101883B78);
      }
      int v5 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "EnableLocationServices,Success,AllChecksPassed",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101883B78);
        }
        v8[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "EnableLocationServices,Success,AllChecksPassed",  v8,  2);
        int v7 = (uint8_t *)v6;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMStrideCalibrator(CLNotifiers) checkLocationAuthorization]",  "%s\n",  v6);
        if (v7 != buf) {
          free(v7);
        }
      }

      -[CMStrideCalLocationFSM requestTransitionToLocationState:]( self->fStrideCalLocationFSM,  "requestTransitionToLocationState:",  1LL);
    }
  }

  else
  {
    -[CMStrideCalLocationFSM requestTransitionToLocationState:]( fStrideCalLocationFSM,  "requestTransitionToLocationState:",  0LL);
  }

- (BOOL)isAuthorizedForLocation
{
  unsigned __int8 v2 = objc_msgSend( -[CLClientAuthorizationCacheProtocol syncgetAuthorizationContextIfClientIsNonZonal:]( self->fClientAuthorizationCache,  "syncgetAuthorizationContextIfClientIsNonZonal:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  "com.apple.locationd.bundle-/System/Library/LocationBundles/MotionCalibration.bundle")),  "isAuthorizedForServiceTypeMask:",  16);
  if ((v2 & 1) != 0)
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101883B78);
    }
    unsigned int v3 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "EnableLocationServices,Success", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101883B78);
      }
      LOWORD(v8[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "EnableLocationServices,Success",  v8,  2,  v8[0]);
LABEL_19:
      int v7 = (uint8_t *)v4;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrator(CLNotifiers) isAuthorizedForLocation]", "%s\n", v4);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

  else
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101883B78);
    }
    int v5 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "EnableLocationServices,Fail,PedometerCalibrationLocationServicesDisabled",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101883B78);
      }
      LOWORD(v8[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "EnableLocationServices,Fail,PedometerCalibrationLocationServicesDisabled",  v8,  2,  v8[0]);
      goto LABEL_19;
    }
  }

  return v2;
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101883B78);
    }
    int v9 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      int v10 = *((_DWORD *)a4 + 2);
      int v11 = *(_DWORD *)a4;
      id v12 = +[CMWorkout workoutName:](&OBJC_CLASS___CMWorkout, "workoutName:", *((void *)a4 + 18));
      uint64_t v13 = *((void *)a4 + 39);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v10;
      __int16 v29 = 1024;
      int v30 = v11;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2048;
      uint64_t v34 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "StrideCal - Register tracks activity %d, override action, %d, session, %@, mode, %ld",  buf,  0x22u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101883B78);
      }
      uint64_t v14 = qword_101934518;
      int v15 = *((_DWORD *)a4 + 2);
      int v16 = *(_DWORD *)a4;
      id v17 = +[CMWorkout workoutName:](&OBJC_CLASS___CMWorkout, "workoutName:", *((void *)a4 + 18));
      uint64_t v18 = *((void *)a4 + 39);
      v21[0] = 67109890;
      v21[1] = v15;
      __int16 v22 = 1024;
      int v23 = v16;
      __int16 v24 = 2112;
      id v25 = v17;
      __int16 v26 = 2048;
      uint64_t v27 = v18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  2LL,  "StrideCal - Register tracks activity %d, override action, %d, session, %@, mode, %ld",  v21,  34);
      unsigned int v20 = (uint8_t *)v19;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMStrideCalibrator(Callbacks) onMotionStateMediatorNotification:data:]",  "%s\n",  v19);
      if (v20 != buf) {
        free(v20);
      }
    }

    if (*(_DWORD *)a4 != 1 || *((void *)a4 + 39))
    {
      if (!*(_DWORD *)a4)
      {
        -[CMStrideCalibrator setSession:](self, "setSession:", 0LL);
        [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:0];
        -[CMStrideCalibrationStats endSessionMetrics:](self->fStats, "endSessionMetrics:", *((double *)a4 + 11));
        -[CMStrideCalibrationStats setReadyForSubmission](self->fStats, "setReadyForSubmission");
      }
    }

    else
    {
      -[CMStrideCalibrator setSession:](self, "setSession:", *((void *)a4 + 18));
      *(void *)buf = self->fCurrentSession;
      [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:sub_100DD71CC(buf)];
      -[CMStrideCalibrationStats startSessionMetricsWithTime:session:]( self->fStats,  "startSessionMetricsWithTime:session:",  LODWORD(self->fCurrentSession),  *((double *)a4 + 11));
    }
  }

@end