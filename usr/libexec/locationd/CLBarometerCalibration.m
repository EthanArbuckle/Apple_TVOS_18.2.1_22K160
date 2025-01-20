@interface CLBarometerCalibration
+ (BOOL)isNotificationSupported:(unint64_t)a3;
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isIHAAuthorized;
- (BOOL)isInOutdoorWorkout;
- (BOOL)isInOutdoorWorkout:(NotificationData *)a3;
- (BOOL)isInVisit;
- (CLBarometerCalibration)init;
- (double)getLastAltitude;
- (double)getLastAltitudeAccuracy;
- (double)getLastAltitudeTime;
- (id).cxx_construct;
- (id)copyCurrentBias;
- (id)latestAbsoluteAltitude;
- (void)absoluteAltitudeUpdate:(id)a3;
- (void)acknowledgeNotification:(unint64_t)a3;
- (void)alertElevationAlertClientsOnChange;
- (void)announceMostRecentForcedGPS:(double)a3;
- (void)beginService;
- (void)didUpdateDataBuffer:(unint64_t)a3;
- (void)endService;
- (void)fetchLoiFromId:(id)a3 atTimestamp:(double)a4;
- (void)fetchVisitStatusAtStart;
- (void)initAllDayContextManagers;
- (void)initContextManagersForNotification:(unint64_t)a3;
- (void)logBuffers;
- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4;
- (void)onMotionStateMediatorNotification:(int)a3 data:(NotificationData *)a4;
- (void)onMotionStateObserverNotification:(int)a3 data:(NotificationData *)a4;
- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onVisit:(id)a3;
- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7;
- (void)registerClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4;
- (void)registerClient:(id)a3 forNotification:(unint64_t)a4;
- (void)releaseAllContextManagers;
- (void)releaseAndClearManager:(id *)a3;
- (void)releaseContextManagersForNotification:(unint64_t)a3;
- (void)sendClientRegisterAnalyticsWithCurrentUncertainty:(double)a3 andTime:(double)a4;
- (void)sendInVisit:(BOOL)a3;
- (void)setAltimeterReleaseTimer;
- (void)setInOutdoorWorkout:(BOOL)a3;
- (void)setLastAltitude:(double)a3;
- (void)setLastAltitudeAccuracy:(double)a3;
- (void)setLastAltitudeTime:(double)a3;
- (void)setupAltimeterReleaseTimer;
- (void)startTrack:(id)a3;
- (void)stopTrack:(id)a3;
- (void)submersionMeasurementUpdate:(id)a3;
- (void)submersionStateUpdate:(id)a3;
- (void)unregisterClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4;
- (void)unregisterClient:(id)a3 forNotification:(unint64_t)a4;
- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateCompanionConnected:(BOOL)a3;
- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
- (void)updateWetState;
- (void)writeThresholdToMsl:(float)a3 withTimestamp:(double)a4 andClientId:(id)a5 active:(BOOL)a6;
@end

@implementation CLBarometerCalibration

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019989A8 != -1) {
    dispatch_once(&qword_1019989A8, &stru_10184F390);
  }
  return (id)qword_1019989A0;
}

- (CLBarometerCalibration)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBarometerCalibration;
  return -[CLBarometerCalibration initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLBarometerCalibrationProtocol,  &OBJC_PROTOCOL___CLBarometerCalibrationClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_1019989B8 != -1) {
    dispatch_once(&qword_1019989B8, &stru_10184F3B0);
  }
  return byte_1019989B0;
}

+ (BOOL)isNotificationSupported:(unint64_t)a3
{
  int v4 = sub_1004F8A40();
  sub_1004F2598();
  if (v4) {
    unsigned __int8 v5 = sub_1004F7000();
  }
  else {
    unsigned __int8 v5 = sub_1004FC81C();
  }
  unsigned __int8 v14 = v5;
  sub_1012049AC(&v15, "BarometerCalibrationEnableFeature", &v14, 0);
  int v6 = v16;
  unsigned __int8 v14 = 0;
  sub_1012049AC(&v15, "AbsoluteAltitudeEnabled", &v14, 0);
  int v7 = v16;
  unsigned __int8 v14 = 0;
  sub_1012049AC(&v15, "AllowWaterSubmersionSimulation", &v14, 0);
  int v8 = v16;
  unsigned __int8 v14 = 0;
  sub_1012049AC(&v15, "AllowWaterSubmersionOverride", &v14, 0);
  switch(a3)
  {
    case 0uLL:
      unsigned int v9 = (sub_1004FAB40() >> 4) & 1;
      if (v6) {
        LOBYTE(v10) = v9;
      }
      else {
        LOBYTE(v10) = 0;
      }
      break;
    case 1uLL:
      if ((sub_1004FAB40() & 0x10) == 0) {
        goto LABEL_12;
      }
      sub_1004F2598();
      if ((sub_1004F7000() & 1) != 0)
      {
        LOBYTE(v10) = 1;
      }

      else
      {
        sub_1004F2598();
        unint64_t v12 = ((unint64_t)sub_1004F97F4() >> 51) & 1;
        if (v7) {
          LOBYTE(v10) = 1;
        }
        else {
          LOBYTE(v10) = v12;
        }
      }

      break;
    case 2uLL:
      unsigned int v10 = (sub_1004FAB40() >> 4) & 1;
      break;
    case 3uLL:
      int v11 = v16;
      LOBYTE(v10) = sub_1004FC8A0();
      if (v11 | v8) {
        LOBYTE(v10) = 1;
      }
      break;
    default:
LABEL_12:
      LOBYTE(v10) = 0;
      break;
  }

  return v10;
}

- (void)beginService
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___CLWaterStateInterface);
  self->waterStateInterface = v3;
  -[CLWaterStateInterface connect](v3, "connect");
  int v4 = -[CLBarometerCalibrationSourceAggregator initWithUniverse:buffers:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourceAggregator),  "initWithUniverse:buffers:",  -[CLBarometerCalibration universe](self, "universe"),  &self->fDataBuffers);
  self->_sourceAggregator = v4;
  -[CLBarometerCalibrationSourceAggregator setDelegate:](v4, "setDelegate:", self);
  for (uint64_t i = 0LL; i != 5; ++i)
    self->_clientSets[i] = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  *(_OWORD *)self->_contextManagers.__elems_ = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[2] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[4] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[6] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[8] = 0u;
  if (+[CLBarometerCalibration isNotificationSupported:]( &OBJC_CLASS___CLBarometerCalibration,  "isNotificationSupported:",  2LL))
  {
    -[CLBarometerCalibration initAllDayContextManagers](self, "initAllDayContextManagers");
    sub_10027EB5C((uint64_t)sub_1007A09F0, (uint64_t)self, -[CLBarometerCalibration universe](self, "universe"), &v21);
    int v6 = v21;
    v21 = 0LL;
    value = self->fOdometerClient.__ptr_.__value_;
    self->fOdometerClient.__ptr_.__value_ = v6;
    if (value)
    {
      (*(void (**)(Client *))(*(void *)value + 8LL))(value);
      int v8 = v21;
      v21 = 0LL;
      if (v8) {
        (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
      }
    }

    [*((id *)self->fOdometerClient.__ptr_.__value_ + 2) register:*((void *)self->fOdometerClient.__ptr_.__value_ + 1) forNotification:8 registrationInfo:0];
    sub_100DAA9F8((uint64_t)sub_1007A0A4C, (uint64_t)self, -[CLBarometerCalibration universe](self, "universe"), &v21);
    unsigned int v9 = v21;
    v21 = 0LL;
    unsigned int v10 = self->fMotionStateObserverClient.__ptr_.__value_;
    self->fMotionStateObserverClient.__ptr_.__value_ = v9;
    if (v10)
    {
      (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
      int v11 = v21;
      v21 = 0LL;
      if (v11) {
        (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
      }
    }

    [*((id *)self->fMotionStateObserverClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateObserverClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
    sub_100468458((uint64_t)sub_1007A0AB4, (uint64_t)self, -[CLBarometerCalibration universe](self, "universe"), &v21);
    unint64_t v12 = v21;
    v21 = 0LL;
    v13 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = v12;
    if (v13)
    {
      (*(void (**)(Client *))(*(void *)v13 + 8LL))(v13);
      unsigned __int8 v14 = v21;
      v21 = 0LL;
      if (v14) {
        (*(void (**)(Client *))(*(void *)v14 + 8LL))(v14);
      }
    }

    [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
    [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
    unsigned __int8 v15 = (CLRoutineMonitorServiceProtocol *) objc_msgSend( objc_msgSend( -[CLBarometerCalibration universe](self, "universe"),  "vendor"),  "proxyForService:",  @"CLRoutineMonitor");
    self->_routineMonitorProxy = v15;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:]( v15,  "registerDelegate:inSilo:",  self,  objc_msgSend(-[CLBarometerCalibration universe](self, "universe"), "silo"));
    -[CLRoutineMonitorServiceProtocol setDelegateEntityName:]( self->_routineMonitorProxy,  "setDelegateEntityName:",  "Altimeter");
    -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:]( self->_routineMonitorProxy,  "startLeechingVisitsForClient:",  self);
  }

  sub_1003CC884((uint64_t)sub_1007A0B30, (uint64_t)self, -[CLBarometerCalibration universe](self, "universe"), &v21);
  unsigned __int8 v16 = v21;
  v21 = 0LL;
  v17 = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = v16;
  if (v17)
  {
    (*(void (**)(Client *))(*(void *)v17 + 8LL))(v17);
    v18 = v21;
    v21 = 0LL;
    if (v18) {
      (*(void (**)(Client *))(*(void *)v18 + 8LL))(v18);
    }
  }

  [*((id *)self->fStatusClient.__ptr_.__value_ + 2) register:*((void *)self->fStatusClient.__ptr_.__value_ + 1) forNotification:7 registrationInfo:0];
  self->_biasEstimator = -[CLBarometerCalibrationBiasEstimator initWithUniverse:delegate:buffers:contextManager:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationBiasEstimator),  "initWithUniverse:delegate:buffers:contextManager:",  -[CLBarometerCalibration universe](self, "universe"),  self,  &self->fDataBuffers,  self->_contextManagers.__elems_[9]);
  self->_releaseAltimeterContextTimer = (CLTimer *)objc_msgSend( objc_msgSend( -[CLBarometerCalibration universe](self, "universe"),  "silo"),  "newTimer");
  -[CLBarometerCalibration setupAltimeterReleaseTimer](self, "setupAltimeterReleaseTimer");
  v19 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
  self->_latestAbsoluteAltitude = v19;
  -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v19, "setTimestamp:", 1.79769313e308);
  -[CLBarometerCalibration setInOutdoorWorkout:](self, "setInOutdoorWorkout:", 0LL);
  self->_isSensorWet = 0;
  self->_wetState = 0LL;
  self->_isCompanionConnected = 0;
  self->_prevElevationAscended = 0;
  self->_prevElevationDescended = 0;
  self->_sameElevationCounter = 0;
  self->_lastAltitude = 1.79769313e308;
  self->_lastAltitudeTime = 1.79769313e308;
  self->_lastAltitudeAccuracy = 1.79769313e308;
  self->_inVisit = 0;
  unsigned __int8 v20 = 0;
  sub_1012049AC((unsigned __int8 *)&v21, "BarometerCalibrationLogLoi", &v20, 0);
  self->_logLois = BYTE1(v21);
  unsigned __int8 v20 = 0;
  sub_1012049AC((unsigned __int8 *)&v21, "BarometerCalibrationLogLoiAltitude", &v20, 0);
  self->_logLoiAltitude = BYTE1(v21);
  unsigned __int8 v20 = 0;
  sub_1012049AC((unsigned __int8 *)&v21, "BarometerCalibrationLogElevationThresholds", &v20, 0);
  self->_logElevationThresholds = BYTE1(v21);
  unsigned __int8 v20 = 0;
  sub_1012049AC((unsigned __int8 *)&v21, "LogHIDShower", &v20, 0);
  self->_logHIDShower = BYTE1(v21);
  unsigned __int8 v20 = 0;
  sub_1012049AC((unsigned __int8 *)&v21, "BarometerCalibrationLogWorkoutActivity", &v20, 0);
  self->_logWorkoutActivity = BYTE1(v21);
  self->_lastAltimeterClientRegisterTime = 1.79769313e308;
  self->_fetchRoutineVisitsTimer = (CLTimer *)objc_msgSend( objc_msgSend( -[CLBarometerCalibration universe](self, "universe"),  "silo"),  "newTimer");
  -[CLBarometerCalibration fetchVisitStatusAtStart](self, "fetchVisitStatusAtStart");
  self->_charging = 0;
  self->_lastWaterStateSent = 0;
  self->_thresholdManager = objc_alloc_init(&OBJC_CLASS___CLElevationThresholdManager);
  self->_mostRecentFilteredPressure = 1.79769313e308;
}

- (void)endService
{
  for (uint64_t i = 0LL; i != 5; ++i)

  self->_biasEstimator = 0LL;
  self->_latestAbsoluteAltitude = 0LL;
  -[CLTimer invalidate](self->_releaseAltimeterContextTimer, "invalidate");

  self->_releaseAltimeterContextTimer = 0LL;
  -[CLTimer invalidate](self->_fetchRoutineVisitsTimer, "invalidate");

  self->_fetchRoutineVisitsTimer = 0LL;
  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:]( self->_routineMonitorProxy,  "stopLeechingVisitsForClient:",  self);

  -[CLWaterStateInterface disconnect](self->waterStateInterface, "disconnect");
  self->_thresholdManager = 0LL;
}

- (void)releaseAndClearManager:(id *)a3
{
  if (*a3)
  {
    [*a3 cleanup];

    *a3 = 0LL;
  }

- (void)initContextManagersForNotification:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      objc_super v3 = &self->_contextManagers.__elems_[3];
      if (self->_contextManagers.__elems_[3]) {
        return;
      }
      int v4 = off_101815838;
      goto LABEL_10;
    case 2uLL:
      objc_super v3 = &self->_contextManagers.__elems_[6];
      if (self->_contextManagers.__elems_[6]) {
        return;
      }
      int v4 = off_101815830;
      goto LABEL_10;
    case 1uLL:
      objc_super v3 = &self->_contextManagers.__elems_[5];
      if (!self->_contextManagers.__elems_[5])
      {
        int v4 = off_101815828;
LABEL_10:
        *objc_super v3 = (CLBarometerCalibrationContextManager *)objc_msgSend( objc_alloc(*v4),  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  -[CLBarometerCalibration universe](self, "universe"),  self,  &self->fDataBuffers,  self->_sourceAggregator);
      }

      break;
  }

- (void)releaseContextManagersForNotification:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 2) {
      return;
    }
    uint64_t v3 = 6LL;
  }

  else
  {
    uint64_t v3 = 3LL;
  }

  -[CLBarometerCalibration releaseAndClearManager:]( self,  "releaseAndClearManager:",  &self->_contextManagers.__elems_[v3]);
}

- (void)releaseAllContextManagers
{
  uint64_t v3 = 0LL;
  p_contextManagers = &self->_contextManagers;
  do
  {
    -[CLBarometerCalibration releaseAndClearManager:](self, "releaseAndClearManager:", (char *)p_contextManagers + v3);
    v3 += 8LL;
  }

  while (v3 != 80);
}

- (void)initAllDayContextManagers
{
  p_contextManagers = &self->_contextManagers;
  if (!self->_contextManagers.__elems_[6]) {
    self->_contextManagers.__elems_[6] = (CLBarometerCalibrationContextManager *)-[CLContextManagerBiasEstimationScheduler initWithUniverse:delegate:withBuffer:withSourceAggregator:]( objc_alloc(&OBJC_CLASS___CLContextManagerBiasEstimationScheduler),  "initWithUniverse:delegate:withBuffer: withSourceAggregator:",  -[CLBarometerCalibration universe]( self,  "universe"),  self,  &self->fDataBuffers,  self->_sourceAggregator);
  }
  if (!p_contextManagers->__elems_[9]) {
    p_contextManagers->__elems_[9] = (CLBarometerCalibrationContextManager *)-[CLContextManagerElevationProfile initWithUniverse:delegate:withBuffer:withSourceAggregator:]( objc_alloc(&OBJC_CLASS___CLContextManagerElevationProfile),  "initWithUniverse:delegate:withBuffer:with SourceAggregator:",  -[CLBarometerCalibration universe]( self,  "universe"),  self,  &self->fDataBuffers,  self->_sourceAggregator);
  }
  unsigned __int8 v12 = 0;
  sub_1012049AC(v13, "AllowWaterSubmersionSimulation", &v12, 0);
  if (v13[1])
  {
    unsigned __int8 v5 = p_contextManagers->__elems_[8];
    int v4 = &p_contextManagers->__elems_[8];
    if (v5) {
      return;
    }
    int v6 = &off_101815848;
    goto LABEL_12;
  }

  unsigned __int8 v10 = 0;
  sub_1012049AC(v11, "AllowWaterSubmersionOverride", &v10, 0);
  int v7 = v11[1];
  int v8 = sub_1004FC8A0();
  if (v7 || v8)
  {
    unsigned int v9 = p_contextManagers->__elems_[7];
    int v4 = &p_contextManagers->__elems_[7];
    if (!v9)
    {
      int v6 = off_101815840;
LABEL_12:
      *int v4 = (CLBarometerCalibrationContextManager *)objc_msgSend( objc_alloc(*v6),  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  -[CLBarometerCalibration universe](self, "universe"),  self,  &self->fDataBuffers,  self->_sourceAggregator);
    }
  }

- (void)registerClient:(id)a3 forNotification:(unint64_t)a4
{
  if (+[CLBarometerCalibration isNotificationSupported:]( &OBJC_CLASS___CLBarometerCalibration,  "isNotificationSupported:",  a4))
  {
    int v7 = self->_clientSets[a4];
    -[NSMutableSet addObject:](v7, "addObject:", a3);
    if (-[NSMutableSet count](v7, "count") == (id)1) {
      -[CLBarometerCalibration initContextManagersForNotification:](self, "initContextManagersForNotification:", a4);
    }
    if (a4 == 1)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v9 = sub_1008FA854(0);
      (*(void (**)(uint64_t, void))(*(void *)(v9 + 112) + 16LL))(v9 + 112, 0LL);
      -[CLTimer invalidate](self->_releaseAltimeterContextTimer, "invalidate");
      id v10 = -[CLBarometerCalibration copyCurrentBias](self, "copyCurrentBias");
      int v11 = v10;
      if (v10)
      {
        [v10 timestamp];
        if (v12 != 1.79769313e308 && self->_lastAltimeterClientRegisterTime != 1.79769313e308)
        {
          [v11 uncertaintyInMeters];
          -[CLBarometerCalibration sendClientRegisterAnalyticsWithCurrentUncertainty:andTime:]( self,  "sendClientRegisterAnalyticsWithCurrentUncertainty:andTime:");
        }
      }

      self->_lastAltimeterClientRegisterTime = Current;

      -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
      if (v16 != 1.79769313e308)
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184F448);
        }
        v17 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
        {
          -[CLBarometerCalibrationAbsoluteAltitude altitude](self->_latestAbsoluteAltitude, "altitude");
          uint64_t v19 = v18;
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
          *(_DWORD *)buf = 134218496;
          *(double *)v39 = Current;
          *(_WORD *)&v39[8] = 2048;
          *(void *)&v39[10] = v19;
          *(_WORD *)&v39[18] = 2048;
          *(void *)&v39[20] = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Send cached altitude to client,timestamp,%f,altitude,%f,altitudeTimestamp,%f",  buf,  0x20u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10184F448);
          }
          uint64_t v25 = qword_1019346A8;
          -[CLBarometerCalibrationAbsoluteAltitude altitude](self->_latestAbsoluteAltitude, "altitude");
          uint64_t v27 = v26;
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
          int v32 = 134218496;
          unint64_t v33 = *(void *)&Current;
          __int16 v34 = 2048;
          uint64_t v35 = v27;
          __int16 v36 = 2048;
          uint64_t v37 = v28;
          LODWORD(v31) = 32;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v25,  1LL,  "Send cached altitude to client,timestamp,%f,altitude,%f,altitudeTimestamp,%f",  COERCE_DOUBLE(&v32),  v31);
          v30 = (uint8_t *)v29;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibration registerClient:forNotification:]",  "%s\n",  v29);
          if (v30 != buf) {
            free(v30);
          }
        }

        [a3 onAbsoluteAltitudeUpdate:self->_latestAbsoluteAltitude];
      }
    }

    uint64_t v21 = 0LL;
    p_contextManagers = &self->_contextManagers;
    do
      -[CLBarometerCalibrationContextManager clientConnected:withNotification:]( p_contextManagers->__elems_[v21++],  "clientConnected:withNotification:",  a3,  a4);
    while (v21 != 10);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    v23 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = -[NSMutableSet count](v7, "count");
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)v39 = 0;
      *(_WORD *)&v39[4] = 2082;
      *(void *)&v39[6] = "";
      *(_WORD *)&v39[14] = 2050;
      *(void *)&v39[16] = a4;
      *(_WORD *)&v39[24] = 2050;
      *(void *)&v39[26] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:registerClient, notification:%{public}ld, newCount:%{public}ld}",  buf,  0x26u);
    }
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    v13 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v39 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "registerClient: notification %ld is not supported\n",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      int v32 = 134217984;
      unint64_t v33 = a4;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "registerClient: notification %ld is not supported\n",  &v32);
      unsigned __int8 v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLBarometerCalibration registerClient:forNotification:]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }
  }

- (void)unregisterClient:(id)a3 forNotification:(unint64_t)a4
{
  int v6 = self->_clientSets[a4];
  -[NSMutableSet removeObject:](v6, "removeObject:", a3);
  if (!-[NSMutableSet count](v6, "count"))
  {
    if (a4 == 1)
    {
      uint64_t v7 = sub_1008FA854(0);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 + 112) + 16LL))(v7 + 112, 1LL);
      -[CLBarometerCalibration setAltimeterReleaseTimer](self, "setAltimeterReleaseTimer");
    }

    -[CLBarometerCalibration releaseContextManagersForNotification:](self, "releaseContextManagersForNotification:", a4);
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  int v8 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2050;
    unint64_t v13 = a4;
    __int16 v14 = 2050;
    id v15 = -[NSMutableSet count](v6, "count");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:unregisterClient, notification:%{public}ld, newCount:%{public}ld}",  (uint8_t *)v9,  0x26u);
  }

- (void)acknowledgeNotification:(unint64_t)a3
{
  uint64_t v4 = 0LL;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager notificationAcknowledged:]( p_contextManagers->__elems_[v4++],  "notificationAcknowledged:",  a3);
  while (v4 != 10);
}

- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7
{
  p_contextManagers = &self->_contextManagers;
  unint64_t v13 = self->_contextManagers.__elems_[9];
  objc_opt_class(&OBJC_CLASS___CLContextManagerElevationProfile);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    -[CLBarometerCalibrationContextManager queryElevationsFromDate:toDate:withBatchSize:fromRecordId:withReply:]( p_contextManagers->__elems_[9],  "queryElevationsFromDate:toDate:withBatchSize:fromRecordId:withReply:",  a3,  a4,  a5,  a6,  a7);
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    id v15 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "queryElevationsFromDate,elevation profile context manager does not exist!",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      v18[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "queryElevationsFromDate,elevation profile context manager does not exist!",  v18,  2);
      v17 = (uint8_t *)v16;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLBarometerCalibration queryElevationsFromDate:toDate:withBatchSize:fromRecordId:withReply:]",  "%s\n",  v16);
      if (v17 != buf) {
        free(v17);
      }
    }
  }

- (void)registerClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4
{
  float var1 = a4.var1;
  float v7 = var1;
  -[CLElevationThresholdManager insertClient:withThreshold:]( self->_thresholdManager,  "insertClient:withThreshold:",  a4.var0);
  if (self->_logElevationThresholds)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v9 = Current;
    *(float *)&CFAbsoluteTime Current = var1;
    -[CLBarometerCalibration writeThresholdToMsl:withTimestamp:andClientId:active:]( self,  "writeThresholdToMsl:withTimestamp:andClientId:active:",  a3,  1LL,  Current,  v9);
  }

- (void)unregisterClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4
{
  double var1 = a4.var1;
  if (-[CLElevationThresholdManager removeClient:](self->_thresholdManager, "removeClient:", a4.var0))
  {
    if (self->_logElevationThresholds)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      double v9 = Current;
      float v7 = var1;
      *(float *)&CFAbsoluteTime Current = v7;
      -[CLBarometerCalibration writeThresholdToMsl:withTimestamp:andClientId:active:]( self,  "writeThresholdToMsl:withTimestamp:andClientId:active:",  a3,  0LL,  Current,  v9);
    }
  }

- (void)didUpdateDataBuffer:(unint64_t)a3
{
  uint64_t v5 = 0LL;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager sourceUpdated:](p_contextManagers->__elems_[v5++], "sourceUpdated:", a3);
  while (v5 != 10);
  if (a3 == 1)
  {
    sub_1004908E0((uint64_t)v15, &self->fDataBuffers.__elems_[1].__map_.__first_);
    uint64_t v7 = v17;
    uint64_t v9 = *v8;
    __int16 v10 = (std::__shared_weak_count *)v8[1];
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        unint64_t v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      uint64_t v7 = v17;
    }

    if (v7) {
      self->_mostRecentFilteredPressure = *(double *)(v9 + 8) * 1000.0;
    }
    if (v10)
    {
      unint64_t v13 = (unint64_t *)&v10->__shared_owners_;
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    sub_10049108C(v15);
  }

- (void)startTrack:(id)a3
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  uint64_t v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    [a3 fStartTime];
    v6[0] = 68289539;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    __int16 v9 = 2049;
    uint64_t v10 = v5;
    __int16 v11 = 1025;
    unsigned int v12 = [a3 fType];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLBarometerCalibration track started, time:%{private}f, type:%{private}d}",  (uint8_t *)v6,  0x22u);
  }

- (void)stopTrack:(id)a3
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  uint64_t v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    [a3 fEndTime];
    uint64_t buf = 68289539LL;
    __int16 v27 = 2082;
    uint64_t v28 = "";
    __int16 v29 = 2049;
    uint64_t v30 = v6;
    __int16 v31 = 1025;
    unsigned int v32 = [a3 fType];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLBarometerCalibration track stopped, time:%{private}f, type:%{private}d}",  (uint8_t *)&buf,  0x22u);
  }

  if ([a3 fNotification] == (id)2)
  {
    [a3 fStartTime];
    double v8 = v7;
    [a3 fEndTime];
    double v10 = v9;
    [a3 fNextTrackStartTime];
    -[CLBarometerCalibration updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]( self,  "updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:",  v8,  v10,  v11);
  }

  sourceAggregator = self->_sourceAggregator;
  id v13 = [a3 fType];
  if (sourceAggregator) {
    -[CLBarometerCalibrationSourceAggregator copyDataBuffersForTrack:]( sourceAggregator,  "copyDataBuffersForTrack:",  v13);
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  id v14 = sub_1007A270C((uint64_t)v24);
  for (uint64_t i = 27LL; i != -3; i -= 3LL)
    sub_10049108C(&v24[i]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v16 = self->_clientSets[(void)objc_msgSend(a3, "fNotification", 0)];
  id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v17)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)j),  "onBarometerCalibrationNotification:track:data:",  objc_msgSend(a3, "fNotification"),  a3,  v14);
      }

      id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v17);
  }

- (void)absoluteAltitudeUpdate:(id)a3
{
  uint64_t v5 = (CLBarometerCalibrationAbsoluteAltitude *)[a3 copy];
  self->_latestAbsoluteAltitude = v5;
  -[CLBarometerCalibrationAbsoluteAltitude altitude](v5, "altitude");
  self->_lastAltitude = v6;
  -[CLBarometerCalibrationAbsoluteAltitude accuracy](self->_latestAbsoluteAltitude, "accuracy");
  self->_lastAltitudeAccuracy = v7;
  -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
  self->_lastAltitudeTime = v8;
  [a3 setFilteredPressure:self->_mostRecentFilteredPressure];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  double v9 = self->_clientSets[1];
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)i) onAbsoluteAltitudeUpdate:a3];
      }

      id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v11);
  }

  float v20 = -3.4028e38;
  float v21 = 3.4028e38;
  thresholdManager = self->_thresholdManager;
  -[CLBarometerCalibrationAbsoluteAltitude altitude](self->_latestAbsoluteAltitude, "altitude");
  float v16 = v15;
  -[CLBarometerCalibrationAbsoluteAltitude accuracy](self->_latestAbsoluteAltitude, "accuracy");
  *(float *)&double v18 = v17;
  *(float *)&double v17 = v16;
  LODWORD(thresholdManager) = -[CLElevationThresholdManager updateWithAltitude:andAccuracy:upperBound:lowerBound:]( thresholdManager,  "updateWithAltitude:andAccuracy:upperBound:lowerBound:",  &v21,  &v20,  v17,  v18);
  -[CLBarometerCalibration alertElevationAlertClientsOnChange](self, "alertElevationAlertClientsOnChange");
  if ((_DWORD)thresholdManager)
  {
    uint64_t v19 = sub_1008FA854(0);
    (*(void (**)(uint64_t, float, float))(*(void *)(v19 + 112) + 80LL))(v19 + 112, v20, v21);
  }

- (void)submersionStateUpdate:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v4 = self->_clientSets[3];
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) onSubmersionStateUpdate:a3];
      }

      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }

- (void)submersionMeasurementUpdate:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v4 = self->_clientSets[3];
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) onSubmersionMeasurementUpdate:a3];
      }

      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }

- (void)logBuffers
{
  uint64_t v3 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"Location: ");
  p_fDataBuffers = &self->fDataBuffers;
  begin = self->fDataBuffers.__elems_[0].__map_.__begin_;
  if (self->fDataBuffers.__elems_[0].__map_.__end_ != begin)
  {
    unint64_t start = self->fDataBuffers.__elems_[0].__start_;
    uint64_t v7 = &begin[start >> 8];
    double v8 = (char *)*v7 + 16 * start;
    uint64_t v9 = *(uint64_t *)((char *)begin
                    + (((self->fDataBuffers.__elems_[0].__size_.__value_ + start) >> 5) & 0x7FFFFFFFFFFFFF8LL))
       + 16 * (LOBYTE(self->fDataBuffers.__elems_[0].__size_.__value_) + start);
    while (v8 != (char *)v9)
    {
      __int128 v10 = *(void **)v8;
      __int128 v11 = (std::__shared_weak_count *)*((void *)v8 + 1);
      *(void *)&__int128 v58 = *(void *)v8;
      *((void *)&v58 + 1) = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          unint64_t v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }

      -[NSMutableString appendFormat:](v3, "appendFormat:", @"time,%f,lat,%f,long,%f,", *v10, v10[1], v10[2]);
      if ((unint64_t)-[NSMutableString length](v3, "length") >= 0x3C1)
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184F448);
        }
        id v14 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
        {
          id v15 = -[NSMutableString UTF8String](v3, "UTF8String");
          *(_DWORD *)uint64_t buf = 136315138;
          id v57 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10184F448);
          }
          uint64_t v19 = qword_1019346A8;
          id v20 = -[NSMutableString UTF8String](v3, "UTF8String");
          int v54 = 136315138;
          id v55 = v20;
          _os_log_send_and_compose_impl(2LL, 0LL, buf, 1628LL, &_mh_execute_header, v19, 2LL, "%s", (const char *)&v54);
          __int128 v22 = (uint8_t *)v21;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration logBuffers]", "%s\n", v21);
          if (v22 != buf) {
            free(v22);
          }
        }

        -[NSMutableString setString:](v3, "setString:", @"GPS: ");
      }

      if (v11)
      {
        float v16 = (unint64_t *)&v11->__shared_owners_;
        do
          unint64_t v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }

      v8 += 16;
      if (v8 - (_BYTE *)*v7 == 4096)
      {
        double v18 = (char *)v7[1];
        ++v7;
        double v8 = v18;
      }
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  __int128 v23 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    id v24 = -[NSMutableString UTF8String](v3, "UTF8String");
    *(_DWORD *)uint64_t buf = 136315138;
    id v57 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    uint64_t v46 = qword_1019346A8;
    id v47 = -[NSMutableString UTF8String](v3, "UTF8String");
    LODWORD(v58) = 136315138;
    *(void *)((char *)&v58 + 4) = v47;
    _os_log_send_and_compose_impl(2LL, 0LL, buf, 1628LL, &_mh_execute_header, v46, 2LL, "%s", (const char *)&v58);
    v49 = (uint8_t *)v48;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration logBuffers]", "%s\n", v48);
    if (v49 != buf) {
      free(v49);
    }
  }

  -[NSMutableString setString:](v3, "setString:", @"Pressure: ");
  __int128 v25 = p_fDataBuffers->__elems_[1].__map_.__begin_;
  if (p_fDataBuffers->__elems_[1].__map_.__end_ != v25)
  {
    unint64_t v26 = p_fDataBuffers->__elems_[1].__start_;
    unint64_t value = p_fDataBuffers->__elems_[1].__size_.__value_;
    uint64_t v28 = &v25[v26 >> 8];
    __int16 v29 = (char *)*v28 + 16 * v26;
    uint64_t v30 = *(uint64_t *)((char *)v25 + (((value + v26) >> 5) & 0x7FFFFFFFFFFFFF8LL)) + 16 * (value + v26);
    while (v29 != (char *)v30)
    {
      __int16 v31 = *(void **)v29;
      unsigned int v32 = (std::__shared_weak_count *)*((void *)v29 + 1);
      *(void *)&__int128 v58 = *(void *)v29;
      *((void *)&v58 + 1) = v32;
      if (v32)
      {
        unint64_t v33 = (unint64_t *)&v32->__shared_owners_;
        do
          unint64_t v34 = __ldxr(v33);
        while (__stxr(v34 + 1, v33));
      }

      -[NSMutableString appendFormat:](v3, "appendFormat:", @"time,%f,pressure,%f,temp,%f,", *v31, v31[1], v31[2]);
      if ((unint64_t)-[NSMutableString length](v3, "length") >= 0x3C1)
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184F448);
        }
        uint64_t v35 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
        {
          id v36 = -[NSMutableString UTF8String](v3, "UTF8String");
          *(_DWORD *)uint64_t buf = 136315138;
          id v57 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10184F448);
          }
          uint64_t v40 = qword_1019346A8;
          id v41 = -[NSMutableString UTF8String](v3, "UTF8String");
          int v54 = 136315138;
          id v55 = v41;
          _os_log_send_and_compose_impl(2LL, 0LL, buf, 1628LL, &_mh_execute_header, v40, 2LL, "%s", (const char *)&v54);
          v43 = (uint8_t *)v42;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration logBuffers]", "%s\n", v42);
          if (v43 != buf) {
            free(v43);
          }
        }

        -[NSMutableString setString:](v3, "setString:", @"Pressure: ");
      }

      if (v32)
      {
        uint64_t v37 = (unint64_t *)&v32->__shared_owners_;
        do
          unint64_t v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }

      v29 += 16;
      if (v29 - (_BYTE *)*v28 == 4096)
      {
        v39 = (char *)v28[1];
        ++v28;
        __int16 v29 = v39;
      }
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  v44 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    id v45 = -[NSMutableString UTF8String](v3, "UTF8String");
    *(_DWORD *)uint64_t buf = 136315138;
    id v57 = v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    uint64_t v50 = qword_1019346A8;
    id v51 = -[NSMutableString UTF8String](v3, "UTF8String");
    LODWORD(v58) = 136315138;
    *(void *)((char *)&v58 + 4) = v51;
    _os_log_send_and_compose_impl(2LL, 0LL, buf, 1628LL, &_mh_execute_header, v50, 2LL, "%s", (const char *)&v58);
    v53 = (uint8_t *)v52;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration logBuffers]", "%s\n", v52);
    if (v53 != buf) {
      free(v53);
    }
  }

- (id)copyCurrentBias
{
  return -[CLBarometerCalibrationBiasEstimator copyCurrentBias](self->_biasEstimator, "copyCurrentBias");
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
}

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
}

- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 != 8) {
    return;
  }
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  id v6 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *((void *)a4 + 1);
    int v8 = *((_DWORD *)a4 + 4);
    int v9 = *((_DWORD *)a4 + 5);
    int v10 = *((unsigned __int16 *)a4 + 27);
    int v11 = *((_DWORD *)a4 + 10);
    *(_DWORD *)uint64_t buf = 134219008;
    uint64_t v59 = v7;
    __int16 v60 = 1024;
    int v61 = v8;
    __int16 v62 = 1024;
    int v63 = v9;
    __int16 v64 = 1024;
    int v65 = v10;
    __int16 v66 = 1024;
    int v67 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "received odometer notification, startTime %f, elevationAscended %u, elevationDescended %u, failure mode %u, source %u",  buf,  0x24u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    uint64_t v38 = *((void *)a4 + 1);
    int v39 = *((_DWORD *)a4 + 4);
    int v40 = *((_DWORD *)a4 + 5);
    int v41 = *((unsigned __int16 *)a4 + 27);
    int v42 = *((_DWORD *)a4 + 10);
    int v71 = 134219008;
    uint64_t v72 = v38;
    __int16 v73 = 1024;
    int v74 = v39;
    __int16 v75 = 1024;
    int v76 = v40;
    __int16 v77 = 1024;
    int v78 = v41;
    __int16 v79 = 1024;
    int v80 = v42;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "received odometer notification, startTime %f, elevationAscended %u, elevationDescended %u, failure mode %u, source %u",  COERCE_DOUBLE(&v71),  36,  (_DWORD)v45,  DWORD2(v45),  (_DWORD)v46);
    v44 = (uint8_t *)v43;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration onOdometerNotification:data:]", "%s\n", v43);
    if (v44 != buf) {
      free(v44);
    }
  }

  unsigned int v12 = -[CLWaterStateInterface isWaterStateON](self->waterStateInterface, "isWaterStateON");
  if ((sub_1001B9A1C() & v12) == 1)
  {
    uint64_t v13 = sub_1008FA854(0);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 + 112) + 48LL))(v13 + 112, 1LL);
    if (self->_logHIDShower)
    {
      sub_101125260(buf);
      sub_10113A398(buf);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v70 |= 1u;
      CFAbsoluteTime v68 = Current;
      uint64_t v15 = v69;
      *(_BYTE *)(v69 + 20) |= 2u;
      *(_BYTE *)(v15 + 16) = 1;
      if (qword_1019A1D00 != -1) {
        dispatch_once(&qword_1019A1D00, &stru_10184F468);
      }
      if (qword_1019A1D08) {
        sub_1011CF3D0(qword_1019A1D08, (uint64_t)buf);
      }
      sub_101127D00((PB::Base *)buf);
    }
  }

  sub_1004F2598();
  if (!sub_1001B9A1C() || *((_DWORD *)a4 + 10) != 1)
  {
    sub_1004F2598();
    if (self->_prevElevationAscended == *((_DWORD *)a4 + 4) && self->_prevElevationDescended == *((_DWORD *)a4 + 5))
    {
      p_int sameElevationCounter = &self->_sameElevationCounter;
      int sameElevationCounter = self->_sameElevationCounter;
      if (sameElevationCounter > 9) {
        goto LABEL_25;
      }
      int *p_sameElevationCounter = sameElevationCounter + 1;
      if (sameElevationCounter == 9) {
        return;
      }
    }

    else
    {
      self->_int sameElevationCounter = 0;
    }

    uint64_t v29 = 0LL;
    self->_prevElevationAscended = *((_DWORD *)a4 + 4);
    self->_prevElevationDescended = *((_DWORD *)a4 + 5);
    p_contextManagers = &self->_contextManagers;
    do
    {
      __int16 v31 = p_contextManagers->__elems_[v29];
      __int128 v32 = *((_OWORD *)a4 + 9);
      __int128 v53 = *((_OWORD *)a4 + 8);
      __int128 v54 = v32;
      __int128 v33 = *((_OWORD *)a4 + 11);
      __int128 v55 = *((_OWORD *)a4 + 10);
      __int128 v56 = v33;
      __int128 v34 = *((_OWORD *)a4 + 5);
      __int128 v49 = *((_OWORD *)a4 + 4);
      __int128 v50 = v34;
      __int128 v35 = *((_OWORD *)a4 + 7);
      __int128 v51 = *((_OWORD *)a4 + 6);
      __int128 v52 = v35;
      __int128 v36 = *((_OWORD *)a4 + 1);
      __int128 v45 = *(_OWORD *)a4;
      __int128 v46 = v36;
      __int128 v37 = *((_OWORD *)a4 + 3);
      __int128 v47 = *((_OWORD *)a4 + 2);
      __int128 v48 = v37;
      -[CLBarometerCalibrationContextManager stepCountElevationNotification:]( v31,  "stepCountElevationNotification:",  &v45);
      ++v29;
    }

    while (v29 != 10);
    return;
  }

  self->_isSensorWet = (*((_WORD *)a4 + 27) & 0x1000) != 0;
  sub_1012049AC(buf, "BarometerWet", (unsigned __int8 *)&self->_isSensorWet, 0);
  self->_isSensorWet = buf[1];
  -[CLBarometerCalibration updateWetState](self, "updateWetState");
  if (self->_prevElevationAscended != *((_DWORD *)a4 + 4) || self->_prevElevationDescended != *((_DWORD *)a4 + 5))
  {
    int v18 = 0;
    p_int sameElevationCounter = &self->_sameElevationCounter;
    goto LABEL_27;
  }

  p_int sameElevationCounter = &self->_sameElevationCounter;
  int v17 = self->_sameElevationCounter;
  if (v17 > 9)
  {
LABEL_25:
    int *p_sameElevationCounter = 10;
    return;
  }

  int v18 = v17 + 1;
LABEL_27:
  int *p_sameElevationCounter = v18;
  if (!self->_isSensorWet && v18 <= 9)
  {
    uint64_t v20 = 0LL;
    self->_prevElevationAscended = *((_DWORD *)a4 + 4);
    self->_prevElevationDescended = *((_DWORD *)a4 + 5);
    float v21 = &self->_contextManagers;
    do
    {
      __int128 v22 = v21->__elems_[v20];
      __int128 v23 = *((_OWORD *)a4 + 9);
      v57[8] = *((_OWORD *)a4 + 8);
      v57[9] = v23;
      __int128 v24 = *((_OWORD *)a4 + 11);
      v57[10] = *((_OWORD *)a4 + 10);
      v57[11] = v24;
      __int128 v25 = *((_OWORD *)a4 + 5);
      v57[4] = *((_OWORD *)a4 + 4);
      v57[5] = v25;
      __int128 v26 = *((_OWORD *)a4 + 7);
      v57[6] = *((_OWORD *)a4 + 6);
      v57[7] = v26;
      __int128 v27 = *((_OWORD *)a4 + 1);
      v57[0] = *(_OWORD *)a4;
      v57[1] = v27;
      __int128 v28 = *((_OWORD *)a4 + 3);
      v57[2] = *((_OWORD *)a4 + 2);
      v57[3] = v28;
      -[CLBarometerCalibrationContextManager stepCountElevationNotification:]( v22,  "stepCountElevationNotification:",  v57);
      ++v20;
    }

    while (v20 != 10);
  }

- (BOOL)isInOutdoorWorkout:(NotificationData *)a3
{
  int v3 = *((_DWORD *)a3 + 2);
  BOOL result = 1;
  if (v3 <= 19089)
  {
    BOOL v7 = v3 > 8;
    int v8 = (1 << v3) & 0x150;
    if (v7 || v8 == 0) {
      return 0;
    }
  }

  else
  {
    if (v3 > 90602)
    {
      BOOL v5 = v3 == 90603;
      int v6 = 519150;
    }

    else
    {
      BOOL v5 = v3 == 19090;
      int v6 = 19150;
    }

    if (!v5 && v3 != v6) {
      return 0;
    }
  }

  return result;
}

- (void)onMotionStateObserverNotification:(int)a3 data:(NotificationData *)a4
{
  if (!a3)
  {
    __int128 v7 = *((_OWORD *)a4 + 1);
    v47[0] = *(_OWORD *)a4;
    v47[1] = v7;
    int v48 = *((_DWORD *)a4 + 8);
    BOOL v8 = -[CLBarometerCalibration isInOutdoorWorkout:](self, "isInOutdoorWorkout:", v47);
    if (v8)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      int v9 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)a4;
        int v11 = *((_DWORD *)a4 + 2);
        int v12 = *((_DWORD *)a4 + 3);
        *(_DWORD *)uint64_t buf = 134218496;
        uint64_t v33 = v10;
        __int16 v34 = 1024;
        int v35 = v11;
        __int16 v36 = 1024;
        int v37 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "motion state observer updates,time,%f,activityType,%d,predictedWorkoutType,%d",  buf,  0x18u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184F448);
        }
        uint64_t v26 = *(void *)a4;
        int v27 = *((_DWORD *)a4 + 2);
        int v28 = *((_DWORD *)a4 + 3);
        int v41 = 134218496;
        uint64_t v42 = v26;
        __int16 v43 = 1024;
        int v44 = v27;
        __int16 v45 = 1024;
        int v46 = v28;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "motion state observer updates,time,%f,activityType,%d,predictedWorkoutType,%d",  COERCE_DOUBLE(&v41),  24);
        uint64_t v30 = (uint8_t *)v29;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibration onMotionStateObserverNotification:data:]",  "%s\n",  v29);
        if (v30 != buf) {
          free(v30);
        }
      }
    }

    -[CLBarometerCalibration setInOutdoorWorkout:](self, "setInOutdoorWorkout:", v8);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    uint64_t v13 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = -[CLBarometerCalibration isInOutdoorWorkout](self, "isInOutdoorWorkout");
      *(_DWORD *)uint64_t buf = 67109120;
      LODWORD(v33) = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "outdoor workout status updated,inOutdoorWorkout,%d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      uint64_t v22 = qword_1019346A8;
      unsigned int v23 = -[CLBarometerCalibration isInOutdoorWorkout](self, "isInOutdoorWorkout");
      int v41 = 67109120;
      LODWORD(v42) = v23;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v22,  0LL,  "outdoor workout status updated,inOutdoorWorkout,%d",  &v41);
      __int128 v25 = (uint8_t *)v24;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibration onMotionStateObserverNotification:data:]",  "%s\n",  v24);
      if (v25 != buf) {
        free(v25);
      }
    }
  }

  if (self->_logWorkoutActivity)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    uint64_t v15 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "write workout activity to msl.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      LOWORD(v41) = 0;
      LODWORD(v31) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "write workout activity to msl.",  &v41,  v31);
      float v21 = (uint8_t *)v20;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibration onMotionStateObserverNotification:data:]",  "%s\n",  v20);
      if (v21 != buf) {
        free(v21);
      }
    }

    sub_101125260(buf);
    sub_10113A1F4(buf);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v40 |= 1u;
    CFAbsoluteTime v38 = Current;
    uint64_t v17 = v39;
    int v18 = *((_DWORD *)a4 + 2);
    *(_BYTE *)(v39 + 16) |= 1u;
    *(_DWORD *)(v17 + 8) = v18;
    uint64_t v19 = v39;
    *(_BYTE *)(v39 + 16) |= 2u;
    *(_DWORD *)(v19 + 12) = a3;
    if (qword_1019A1D00 != -1) {
      dispatch_once(&qword_1019A1D00, &stru_10184F468);
    }
    if (qword_1019A1D08) {
      sub_1011CF3D0(qword_1019A1D08, (uint64_t)buf);
    }
    sub_101127D00((PB::Base *)buf);
  }

- (void)onMotionStateMediatorNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 2)
  {
    uint64_t v8 = 0LL;
    p_contextManagers = &self->_contextManagers;
    do
    {
      uint64_t v10 = p_contextManagers->__elems_[v8];
      memcpy(__dst, a4, sizeof(__dst));
      -[CLBarometerCalibrationContextManager onMotionStateMediatorData:](v10, "onMotionStateMediatorData:", __dst);
      ++v8;
    }

    while (v8 != 10);
  }

- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 7 && self->_charging != *((unsigned __int8 *)a4 + 9))
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    int v6 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *((unsigned __int8 *)a4 + 9);
      *(_DWORD *)uint64_t buf = 67109376;
      int v18 = v7;
      __int16 v19 = 2048;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "charging on puck,%d,timestamp,%f", buf, 0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      uint64_t v9 = qword_1019346A8;
      int v10 = *((unsigned __int8 *)a4 + 9);
      v14[0] = 67109376;
      v14[1] = v10;
      __int16 v15 = 2048;
      CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent();
      LODWORD(v13) = 18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  0LL,  "charging on puck,%d,timestamp,%f",  v14,  v13);
      int v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration onDaemonStatusNotification:data:]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    uint64_t v8 = 0LL;
    self->_charging = *((_BYTE *)a4 + 9);
    do
      -[CLBarometerCalibrationContextManager onCharger:]( self->_contextManagers.__elems_[v8++],  "onCharger:",  self->_charging);
    while (v8 != 10);
  }

- (void)updateCompanionConnected:(BOOL)a3
{
  self->_BOOL isCompanionConnected = a3;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  uint64_t v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCompanionConnected = self->_isCompanionConnected;
    *(_DWORD *)uint64_t buf = 67109120;
    BOOL v11 = isCompanionConnected;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "companion connected updated: %d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    BOOL v6 = self->_isCompanionConnected;
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "companion connected updated: %d",  v9);
    uint64_t v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration updateCompanionConnected:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  -[CLBarometerCalibration updateWetState](self, "updateWetState");
}

- (void)updateWetState
{
  uint64_t v3 = 0LL;
  self->_unint64_t wetState = self->_isSensorWet;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager wetStateUpdated:]( p_contextManagers->__elems_[v3++],  "wetStateUpdated:",  self->_wetState);
  while (v3 != 10);
  -[CLBarometerCalibrationSourceAggregator wetStateUpdated:]( self->_sourceAggregator,  "wetStateUpdated:",  self->_wetState);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  BOOL v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t wetState = self->_wetState;
    *(_DWORD *)uint64_t buf = 67109120;
    int v12 = wetState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "wet state updated to %d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    unint64_t v7 = self->_wetState;
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "wet state updated to %d",  v10);
    uint64_t v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration updateWetState]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

- (void)setupAltimeterReleaseTimer
{
  releaseAltimeterContextTimer = self->_releaseAltimeterContextTimer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1007A468C;
  v3[3] = &unk_10181A288;
  v3[4] = self;
  -[CLTimer setHandler:](releaseAltimeterContextTimer, "setHandler:", v3);
}

- (void)setAltimeterReleaseTimer
{
}

- (id)latestAbsoluteAltitude
{
  return self->_latestAbsoluteAltitude;
}

- (void)onVisit:(id)a3
{
  if (a3)
  {
    if ([a3 hasArrivalDate] && !objc_msgSend(a3, "hasDepartureDate"))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }

    if ([a3 hasArrivalDate] && objc_msgSend(a3, "hasDepartureDate"))
    {
      BOOL v5 = 0;
LABEL_8:
      self->_BOOL inVisit = v5;
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184F448);
  }
  BOOL v6 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inVisit = self->_inVisit;
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    uint64_t v9 = v8;
    objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
    unint64_t buf = __PAIR64__(inVisit, 67109888);
    __int16 v41 = 2048;
    uint64_t v42 = v9;
    __int16 v43 = 2048;
    uint64_t v44 = v10;
    __int16 v45 = 2048;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "received visit for altimeter,inVisit,%d,arrivalDate,%f,departureDate,%f,currentTime,%f",  (uint8_t *)&buf,  0x26u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    uint64_t v30 = qword_1019346A8;
    BOOL v31 = self->_inVisit;
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    uint64_t v33 = v32;
    objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
    uint64_t v35 = v34;
    CFAbsoluteTime v36 = CFAbsoluteTimeGetCurrent();
    v50[0] = 67109888;
    v50[1] = v31;
    __int16 v51 = 2048;
    uint64_t v52 = v33;
    __int16 v53 = 2048;
    uint64_t v54 = v35;
    __int16 v55 = 2048;
    CFAbsoluteTime v56 = v36;
    LODWORD(v39) = 38;
    _os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  v30,  0LL,  "received visit for altimeter,inVisit,%d,arrivalDate,%f,departureDate,%f,currentTime,%f",  v50,  v39);
    CFAbsoluteTime v38 = (char *)v37;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration onVisit:]", "%s\n", v37);
  }

  if (self->_inVisit)
  {
    id v11 = objc_msgSend(objc_msgSend(a3, "_placeInference"), "_loiIdentifier");
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    -[CLBarometerCalibration fetchLoiFromId:atTimestamp:](self, "fetchLoiFromId:atTimestamp:", v11);
    BOOL v12 = self->_inVisit;
  }

  else
  {
    BOOL v12 = 0LL;
  }

  biasEstimator = self->_biasEstimator;
  objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
  double v15 = v14;
  objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
  -[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]( biasEstimator,  "updateVisitState:arrivalTime:departureTime:",  v12,  v15,  v16);
  if (self->_logLois)
  {
    sub_101125260(&buf);
    sub_10113B0B8(&buf);
    CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
    v49 |= 1u;
    CFAbsoluteTime v47 = v17;
    uint64_t v18 = v48;
    [a3 coordinate];
    *(_WORD *)(v18 + 92) |= 0x40u;
    *(void *)(v18 + 56) = v19;
    uint64_t v20 = v48;
    [a3 coordinate];
    *(_WORD *)(v20 + 92) |= 0x20u;
    *(void *)(v20 + 48) = v21;
    uint64_t v22 = v48;
    objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
    *(_WORD *)(v22 + 92) |= 4u;
    *(void *)(v22 + 24) = v23;
    uint64_t v24 = v48;
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    *(_WORD *)(v24 + 92) |= 1u;
    *(void *)(v24 + 8) = v25;
    uint64_t v26 = v48;
    [a3 horizontalAccuracy];
    *(_WORD *)(v26 + 92) |= 0x10u;
    *(void *)(v26 + 40) = v27;
    uint64_t v28 = v48;
    *(_WORD *)(v48 + 92) |= 0x200u;
    *(_DWORD *)(v28 + 80) = 2;
    uint64_t v29 = v48;
    *(_WORD *)(v48 + 92) |= 0x400u;
    *(_DWORD *)(v29 + 84) = -1;
    if (qword_1019A1D00 != -1) {
      dispatch_once(&qword_1019A1D00, &stru_10184F468);
    }
    if (qword_1019A1D08) {
      sub_1011CF3D0(qword_1019A1D08, (uint64_t)&buf);
    }
    sub_101127D00((PB::Base *)&buf);
  }

  -[CLBarometerCalibration sendInVisit:](self, "sendInVisit:", self->_inVisit);
}

- (void)announceMostRecentForcedGPS:(double)a3
{
}

- (BOOL)isInVisit
{
  return self->_inVisit;
}

- (void)sendClientRegisterAnalyticsWithCurrentUncertainty:(double)a3 andTime:(double)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1007A4D6C;
  v4[3] = &unk_10184F3D8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  *(double *)&v4[6] = a4;
  AnalyticsSendEventLazy(@"com.apple.Motion.Altimeter.RegisterClient", v4);
}

- (void)fetchVisitStatusAtStart
{
  if (self->_routineMonitorProxy)
  {
    fetchRoutineVisitsTimer = self->_fetchRoutineVisitsTimer;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1007A51A8;
    v5[3] = &unk_10181A288;
    v5[4] = self;
    -[CLTimer setHandler:](fetchRoutineVisitsTimer, "setHandler:", v5);
    -[CLTimer setNextFireDelay:](self->_fetchRoutineVisitsTimer, "setNextFireDelay:", 10.0);
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    uint64_t v4 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning Routine Monitor is not available.}",  buf,  0x12u);
    }
  }

- (BOOL)isIHAAuthorized
{
  *(void *)&double v3 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v2) {
    LOBYTE(v2) = objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v3),  "isHealthDataSubmissionAllowed");
  }
  return v2;
}

- (void)fetchLoiFromId:(id)a3 atTimestamp:(double)a4
{
  routineMonitorProxy = self->_routineMonitorProxy;
  if (routineMonitorProxy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    _DWORD v9[2] = sub_1007A5A64;
    v9[3] = &unk_101838B68;
    _DWORD v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestWithIdentifier:withReply:]( routineMonitorProxy,  "fetchLocationOfInterestWithIdentifier:withReply:",  a3,  v9);
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184F448);
    }
    BOOL v6 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Routine Monitor is not supported.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      v10[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "Routine Monitor is not supported.",  v10,  2);
      __int16 v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibration fetchLoiFromId:atTimestamp:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

- (void)alertElevationAlertClientsOnChange
{
  thresholdManager = self->_thresholdManager;
  if (thresholdManager)
  {
    -[CLElevationThresholdManager getElevationThresholdProxyMap](thresholdManager, "getElevationThresholdProxyMap");
    double v3 = v17;
  }

  else
  {
    double v3 = 0LL;
    CFAbsoluteTime v17 = 0LL;
    v18[0] = 0LL;
    v18[1] = 0LL;
  }

  HIDWORD(v4) = 0;
  int v16 = 134218496;
  do
  {
    if (*((_BYTE *)v3 + 56))
    {
      BOOL v5 = (void *)*((void *)v3 + 6);
      float v6 = v3[8];
      *(float *)&double v4 = v6;
      [v5 onElevationThresold:*((unsigned __int8 *)v3 + 41) direction:v4];
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184F448);
      }
      int v7 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *((unsigned __int8 *)v3 + 41);
        *(_DWORD *)unint64_t buf = v16;
        double v26 = v6;
        __int16 v27 = 2048;
        uint64_t v28 = v5;
        __int16 v29 = 1024;
        int v30 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "threshold,%f,client,%p,above,%d",  buf,  0x1Cu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184F448);
        }
        int v12 = *((unsigned __int8 *)v3 + 41);
        int v19 = v16;
        double v20 = v6;
        __int16 v21 = 2048;
        uint64_t v22 = v5;
        __int16 v23 = 1024;
        int v24 = v12;
        LODWORD(v15) = 28;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "threshold,%f,client,%p,above,%d",  COERCE_DOUBLE(&v19),  v15,  v16);
        double v14 = (uint8_t *)v13;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibration alertElevationAlertClientsOnChange]",  "%s\n",  v13);
        if (v14 != buf) {
          free(v14);
        }
      }
    }

    uint64_t v9 = (float *)*((void *)v3 + 1);
    if (v9)
    {
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = *(float **)v9;
      }

      while (v9);
    }

    else
    {
      do
      {
        uint64_t v10 = (float *)*((void *)v3 + 2);
        BOOL v11 = *(void *)v10 == (void)v3;
        double v3 = v10;
      }

      while (!v11);
    }

    double v3 = v10;
  }

  while (v10 != (float *)v18);
LABEL_3:
  sub_100008390((uint64_t)&v17, v18[0]);
}

- (void)sendInVisit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = sub_1008FA854(0);
  (*(void (**)(uint64_t, BOOL))(*(void *)(v4 + 112) + 72LL))(v4 + 112, v3);
}

- (void)writeThresholdToMsl:(float)a3 withTimestamp:(double)a4 andClientId:(id)a5 active:(BOOL)a6
{
  v17 |= 1u;
  *(double *)&v15[77] = a4;
  uint64_t v10 = v16;
  *(_BYTE *)(v16 + 32) |= 1u;
  *(double *)(v10 + 16) = a4;
  uint64_t v11 = v16;
  std::stringbuf::str(&v14, &v19);
  sub_1007A71E8(v11, (__n128 *)&v14);
  uint64_t v12 = v16;
  *(_BYTE *)(v16 + 32) |= 2u;
  *(float *)(v12 + 24) = a3;
  uint64_t v13 = v16;
  *(_BYTE *)(v16 + 32) |= 4u;
  *(_BYTE *)(v13 + 28) = a6;
  if (qword_1019A1D00 != -1) {
    dispatch_once(&qword_1019A1D00, &stru_10184F468);
  }
  if (qword_1019A1D08) {
    sub_1011CF3D0(qword_1019A1D08, (uint64_t)v15);
  }
  sub_101127D00((PB::Base *)v15);
  std::streambuf::~streambuf(&v19);
  std::ios::~ios(&v20);
}

- (BOOL)isInOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_inOutdoorWorkout = a3;
}

- (double)getLastAltitude
{
  return self->_lastAltitude;
}

- (void)setLastAltitude:(double)a3
{
  self->_lastAltitude = a3;
}

- (double)getLastAltitudeAccuracy
{
  return self->_lastAltitudeAccuracy;
}

- (void)setLastAltitudeAccuracy:(double)a3
{
  self->_lastAltitudeAccuracy = a3;
}

- (double)getLastAltitudeTime
{
  return self->_lastAltitudeTime;
}

- (void)setLastAltitudeTime:(double)a3
{
  self->_lastAltitudeTime = a3;
}

- (void).cxx_destruct
{
  unint64_t value = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  uint64_t v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  BOOL v5 = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  float v6 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8LL))(v6, a2);
  }
  p_fDataBuffers = &self->fDataBuffers;
  for (uint64_t i = 432LL; i != -48; i -= 48LL)
    sub_10049108C((array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 10UL> *)((char *)p_fDataBuffers + i));
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *((void *)self + 83) = 0LL;
  *((void *)self + 85) = 0LL;
  *((void *)self + 86) = 0LL;
  *((void *)self + 94) = 0LL;
  return self;
}

@end