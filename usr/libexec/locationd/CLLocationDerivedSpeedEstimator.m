@interface CLLocationDerivedSpeedEstimator
+ (BOOL)isSupported;
+ (BOOL)isSupportedForAnalytics;
+ (BOOL)isSupportedForDerivedSpeedEstimate;
- ($1AB5FA073B851C12C2339EC22442E995)currentEstimate;
- (BOOL)_feedLocation:(id)a3;
- (BOOL)feedLocation:(const CLDaemonLocation *)a3;
- (BOOL)valid;
- (CLLocation)prevLoc;
- (CLLocationDerivedSpeedEstimator)init;
- (CLTimer)scanTimer;
- (id).cxx_construct;
- (id)initInUniverse:(id)a3;
- (void)_invalidateSpeedEstimate;
- (void)_onScanTimer;
- (void)clearStatusBarColorAndText;
- (void)dealloc;
- (void)handleMotionStateNotification:(NotificationData *)a3;
- (void)handleVehicularStateChanged;
- (void)invalidate;
- (void)logLatencyMetricsInternal;
- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4;
- (void)onWifiServiceNotification:(int)a3 data:(NotificationData *)a4;
- (void)registerForNotifications;
- (void)setCurrentEstimate:(id)a3;
- (void)setPrevLoc:(id)a3;
- (void)setScanTimer:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)startWsbClient;
- (void)stopWsbClient;
- (void)submitFalseDetectionMetricsWithType:(unint64_t)a3;
- (void)submitLatencyMetrics;
- (void)unregisterForNotifications;
- (void)updateWsbClient:(BOOL)a3;
@end

@implementation CLLocationDerivedSpeedEstimator

+ (BOOL)isSupported
{
  v4 = (void *)objc_opt_class(a1);
  return _[v4 isSupportedForAnalytics];
}

+ (BOOL)isSupportedForAnalytics
{
  return sub_1001B9A1C();
}

+ (BOOL)isSupportedForDerivedSpeedEstimate
{
  LODWORD(v2) = sub_1004F7000();
  if ((_DWORD)v2) {
    return ((unint64_t)sub_1004F97F4() >> 35) & 1;
  }
  return v2;
}

- (CLLocationDerivedSpeedEstimator)init
{
  return 0LL;
}

- (id)initInUniverse:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLLocationDerivedSpeedEstimator.mm",  155LL,  @"Invalid parameter not satisfying: %@",  @"universe");
  }
  if ([(id)objc_opt_class(self) isSupported])
  {
    v31.receiver = self;
    v31.super_class = (Class)&OBJC_CLASS___CLLocationDerivedSpeedEstimator;
    v5 = -[CLLocationDerivedSpeedEstimator init](&v31, "init");
    v6 = v5;
    if (v5)
    {
      v5->_valid = 1;
      v5->_universe = (CLIntersiloUniverse *)a3;
      v7 = (CLSilo *)[a3 silo];
      *(_WORD *)&v6->_showActivityVehicular = 0;
      p_showActivityVehicular = &v6->_showActivityVehicular;
      v6->_vehicleStateProxy = 0LL;
      v6->_silo = v7;
      sub_1004F2598();
      p_showActivityVehicularMounted = &v6->_showActivityVehicularMounted;
      if (sub_1004F8A40())
      {
        sub_1002F0B04(buf);
        sub_1002A6F64(*(uint64_t *)buf, "ShowActivityVehicular", &v6->_showActivityVehicular);
        v10 = *(std::__shared_weak_count **)&buf[8];
        if (*(void *)&buf[8])
        {
          v11 = (unint64_t *)(*(void *)&buf[8] + 8LL);
          do
            unint64_t v12 = __ldaxr(v11);
          while (__stlxr(v12 - 1, v11));
          if (!v12)
          {
            ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
            std::__shared_weak_count::__release_weak(v10);
          }
        }

        sub_1002F0B04(buf);
        sub_1002A6F64(*(uint64_t *)buf, "ShowActivityVehicularMounted", &v6->_showActivityVehicularMounted);
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
      }

      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      v16 = (os_log_s *)qword_1019344F8;
      if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_INFO))
      {
        BOOL v17 = *p_showActivityVehicular;
        BOOL v18 = *p_showActivityVehicularMounted;
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "ShowActivityVehicular";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v17;
        __int16 v41 = 2080;
        v42 = "ShowActivityVehicularMounted";
        __int16 v43 = 1024;
        BOOL v44 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s, %d, %s, %d", buf, 0x22u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019344F0 != -1) {
          dispatch_once(&qword_1019344F0, &stru_101835500);
        }
        BOOL v26 = *p_showActivityVehicular;
        BOOL v27 = *p_showActivityVehicularMounted;
        int v32 = 136315906;
        v33 = "ShowActivityVehicular";
        __int16 v34 = 1024;
        BOOL v35 = v26;
        __int16 v36 = 2080;
        v37 = "ShowActivityVehicularMounted";
        __int16 v38 = 1024;
        BOOL v39 = v27;
        v28 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  1LL,  "%s, %d, %s, %d",  (const char *)&v32,  34,  v29,  LODWORD(v30[0]));
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator initInUniverse:]", "%s\n", v28);
        if (v28 != buf) {
          free(v28);
        }
      }

      *(_WORD *)&v6->_visualIndicatorActive = 0;
      v6->_motionVehicular = 0;
      v6->_prevLoc = 0LL;
      v6->_currentEstimate.speed = -1.0;
      __asm { FMOV            V0.2D, #-1.0 }

      *(_OWORD *)&v6->_currentEstimate.timestamp = _Q0;
      v6->_vehicularHints = 0LL;
      v6->_prevVehicularHints = 0LL;
      v6->_hintsAvailable = 21LL;
      *(_OWORD *)&v6->_vehicularStartTime = 0u;
      *(_OWORD *)&v6->_vehicularLastBTHintTime = 0u;
      *(_OWORD *)&v6->_accelDetectionLatency = _Q0;
      *(_OWORD *)&v6->_basebandDetectionLatency = _Q0;
      *(_OWORD *)&v6->_btDetectionLatency = _Q0;
      *(_OWORD *)&v6->_vehicularDurationExitFromNoHints = _Q0;
      v6->_vehicularDurationLastBTHintFromLastMotionHint = -1.0;
      *(void *)&v6->_numMotionExitsWithBT = 0LL;
      v6->_sequentialVehicularIndex = 0;
      v6->_numConsecutiveVehicularSpeedObservations = 0;
      v6->_wsbClientStartTime = 0LL;
      v6->_lastElapsedTime = 0.0;
      v6->_lastDistanceMoved = 0.0;
      -[CLLocationDerivedSpeedEstimator registerForNotifications](v6, "registerForNotifications");
      v24 = (CLTimer *)-[CLSilo newTimer](v6->_silo, "newTimer");
      v6->_scanTimer = v24;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100399CF8;
      v30[3] = &unk_10181A288;
      v30[4] = v6;
      -[CLTimer setHandler:](v24, "setHandler:", v30);
    }
  }

  else
  {

    return 0LL;
  }

  return v6;
}

- (void)registerForNotifications
{
  v3 = v12;
  unint64_t v12 = 0LL;
  value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = v12;
    unint64_t v12 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  -[CLLocationDerivedSpeedEstimator startWsbClient](self, "startWsbClient");
  sub_10036B3B4((uint64_t)sub_100399F9C, (uint64_t)self, self->_universe, &v12);
  v6 = v12;
  unint64_t v12 = 0LL;
  v7 = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = v6;
  if (v7)
  {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    v8 = v12;
    unint64_t v12 = 0LL;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    }
  }

  [*((id *)self->_motionStateClient.__ptr_.__value_ + 2) register:*((void *)self->_motionStateClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  if (objc_msgSend( -[CLIntersiloUniverse vendor](self->_universe, "vendor"),  "isServiceEnabled:",  @"CLVehicleStateNotifier"))
  {
    v9 = (CLVehicleStateNotifierProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor](self->_universe, "vendor"),  "proxyForService:",  @"CLVehicleStateNotifier");
    self->_vehicleStateProxy = v9;
    -[CLVehicleStateNotifierProtocol registerDelegate:inSilo:](v9, "registerDelegate:inSilo:", self, self->_silo);
    -[CLVehicleStateNotifierProtocol setDelegateEntityName:]( self->_vehicleStateProxy,  "setDelegateEntityName:",  "CLLocationDerivedSpeedEstimator");
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10039A01C;
  v11[3] = &unk_10182D2A0;
  v11[4] = self;
  notify_register_dispatch( (const char *)[kCMVehicularStateChangedNotification UTF8String],  &self->_vehicularToken,  global_queue,  v11);
}

- (void)startWsbClient
{
  if (!self->_wsbClientStartTime)
  {
    LODWORD(v6) = 3600;
    WORD2(v6) = 257;
    *((void *)&v6 + 1) = "dndwd";
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12 registrationInfo:sub_10039E77C(&v6)];
    self->_wsbClientStartTime = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    v3 = (os_log_s *)qword_1019344F8;
    if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startWsbClient", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      v5[0] = 0;
      v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "startWsbClient",  v5,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator startWsbClient]", "%s\n", v4);
    }
  }

- (void)stopWsbClient
{
  if (self->_wsbClientStartTime)
  {
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];

    self->_wsbClientStartTime = 0LL;
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    v3 = (os_log_s *)qword_1019344F8;
    if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopWsbClient", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      v5[0] = 0;
      v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "stopWsbClient",  v5,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator stopWsbClient]", "%s\n", v4);
    }
  }

- (void)updateWsbClient:(BOOL)a3
{
  if (a3) {
    -[CLLocationDerivedSpeedEstimator stopWsbClient](self, "stopWsbClient");
  }
  else {
    -[CLLocationDerivedSpeedEstimator startWsbClient](self, "startWsbClient");
  }
}

- (void)unregisterForNotifications
{
  value = self->_wifiServiceClient.__ptr_.__value_;
  if (value)
  {
    self->_wifiServiceClient.__ptr_.__value_ = 0LL;
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
    v4 = self->_wifiServiceClient.__ptr_.__value_;
    self->_wifiServiceClient.__ptr_.__value_ = 0LL;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
    }
  }

  v5 = self->_motionStateClient.__ptr_.__value_;
  if (v5)
  {
    self->_motionStateClient.__ptr_.__value_ = 0LL;
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
    __int128 v6 = self->_motionStateClient.__ptr_.__value_;
    self->_motionStateClient.__ptr_.__value_ = 0LL;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
    }
  }

  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }

- (void)invalidate
{
}

- (void)dealloc
{
  self->_scanTimer = 0LL;
  self->_prevLoc = 0LL;

  self->_silo = 0LL;
  self->_universe = 0LL;

  self->_vehicleStateProxy = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationDerivedSpeedEstimator;
  -[CLLocationDerivedSpeedEstimator dealloc](&v3, "dealloc");
}

- (BOOL)feedLocation:(const CLDaemonLocation *)a3
{
  v5 = objc_alloc(&OBJC_CLASS___CLLocation);
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  v12[6] = *(_OWORD *)&a3->lifespan;
  v12[7] = rawCoordinate;
  v13[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)&a3->integrity;
  __int128 v7 = *(_OWORD *)&a3->speed;
  v12[2] = *(_OWORD *)&a3->altitude;
  v12[3] = v7;
  __int128 v8 = *(_OWORD *)&a3->timestamp;
  v12[4] = *(_OWORD *)&a3->course;
  v12[5] = v8;
  __int128 v9 = *(_OWORD *)&a3->coordinate.longitude;
  v12[0] = *(_OWORD *)&a3->suitability;
  v12[1] = v9;
  v10 = -[CLLocation initWithClientLocation:](v5, "initWithClientLocation:", v12);
  LOBYTE(self) = -[CLLocationDerivedSpeedEstimator _feedLocation:](self, "_feedLocation:", v10);

  return (char)self;
}

- (void)_onScanTimer
{
  if (qword_1019344F0 != -1) {
    dispatch_once(&qword_1019344F0, &stru_101835500);
  }
  objc_super v3 = (os_log_s *)qword_1019344F8;
  if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VEHICULAR: start extra scan", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    v19[0] = 0;
    __int128 v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: start extra scan",  v19,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator _onScanTimer]", "%s\n", v6);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  sub_1010DDBC0(__p, "speedestimator");
  sub_100495E50(buf, 4LL, 1LL, __p, Current);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  id v5 = objc_msgSend( -[CLIntersiloUniverse vendor](self->_universe, "vendor"),  "proxyForService:",  @"CLWifiLocationProvider");
  uint64_t v7 = *(void *)buf;
  char v8 = v21;
  if (SHIBYTE(v23) < 0)
  {
    sub_1010DD48C(&v9, (void *)v22, *((unint64_t *)&v22 + 1));
  }

  else
  {
    __int128 v9 = v22;
    uint64_t v10 = v23;
  }

  __int128 v12 = v25;
  __int128 v13 = v26;
  v14[0] = v27[0];
  *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)((char *)v27 + 12);
  __int128 v11 = v24;
  if (SHIBYTE(v29) < 0)
  {
    sub_1010DD48C(&v15, (void *)v28, *((unint64_t *)&v28 + 1));
  }

  else
  {
    __int128 v15 = v28;
    uint64_t v16 = v29;
  }

  [v5 requestLocationUpdateWithParameters:sub_10039A914((uint64_t)&v7)];
  if (SHIBYTE(v16) < 0) {
    operator delete((void *)v15);
  }
  if (SHIBYTE(v10) < 0) {
    operator delete((void *)v9);
  }
  if (SHIBYTE(v29) < 0) {
    operator delete((void *)v28);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete((void *)v22);
  }
}

- (void)_invalidateSpeedEstimate
{
}

- (BOOL)_feedLocation:(id)a3
{
  if (qword_1019344F0 != -1) {
    dispatch_once(&qword_1019344F0, &stru_101835500);
  }
  id v5 = (os_log_s *)qword_1019344F8;
  if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v84 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VEHICULAR: leeched location, %s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    uint64_t v60 = qword_1019344F8;
    *(_DWORD *)v80 = 136315138;
    *(void *)&v80[4] = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    v61 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v60,  2LL,  "VEHICULAR: leeched location, %s",  v80);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v61);
  }

  if ([a3 type] == 4)
  {
    if (-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc")
      && objc_msgSend( objc_msgSend( objc_msgSend(a3, "timestamp"),  "earlierDate:",  -[CLLocation timestamp]( -[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"),  "timestamp")),  "isEqualToDate:",  objc_msgSend(a3, "timestamp")))
    {
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      __int128 v6 = (os_log_s *)qword_1019344F8;
      if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: location timestamp out of order",  buf,  2u);
      }

      BOOL v7 = sub_1002921D0(115, 2);
      if (v7)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019344F0 != -1) {
          dispatch_once(&qword_1019344F0, &stru_101835500);
        }
        char v8 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: location timestamp out of order");
LABEL_29:
        __int128 v12 = (uint8_t *)v8;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v8);
        if (v12 != buf) {
          free(v12);
        }
        goto LABEL_75;
      }

      return v7;
    }

    [a3 horizontalAccuracy];
    if (v13 > 150.0)
    {
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      v14 = (os_log_s *)qword_1019344F8;
      if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
      {
        [a3 horizontalAccuracy];
        *(_DWORD *)buf = 134217984;
        *(void *)v84 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: disqualified leeched location, horizontal accuracy, %f",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_74;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      uint64_t v16 = qword_1019344F8;
      [a3 horizontalAccuracy];
      BOOL v17 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v16,  0LL,  "VEHICULAR: disqualified leeched location, horizontal accuracy, %f");
LABEL_40:
      char v18 = (uint8_t *)v17;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v17);
      if (v18 == buf) {
        goto LABEL_74;
      }
      goto LABEL_52;
    }

    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceNow");
    *(float *)&double v19 = v19;
    float v20 = fabsf(*(float *)&v19);
    if (v20 > 180.0)
    {
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      double v21 = v20;
      __int128 v22 = (os_log_s *)qword_1019344F8;
      if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v84 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: disqualified leeched location, age, %f",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_74;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      uint64_t v23 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: disqualified leeched location, age, %f");
LABEL_51:
      char v18 = (uint8_t *)v23;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v23);
      if (v18 == buf)
      {
LABEL_74:
        -[CLLocationDerivedSpeedEstimator _invalidateSpeedEstimate](self, "_invalidateSpeedEstimate");
LABEL_75:
        LOBYTE(v7) = 0;
        return v7;
      }

- (void)handleVehicularStateChanged
{
  if (!self->_showActivityVehicularMounted)
  {
    vehicleStateProxy = self->_vehicleStateProxy;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10039C284;
    v3[3] = &unk_101835490;
    v3[4] = self;
    -[CLVehicleStateNotifierProtocol fetchVehicularDndStateAndHintsWithReply:]( vehicleStateProxy,  "fetchVehicularDndStateAndHintsWithReply:",  v3);
  }

- (void)handleMotionStateNotification:(NotificationData *)a3
{
  __int128 v7 = *((_OWORD *)a3 + 7);
  __int128 v85 = *((_OWORD *)a3 + 6);
  __int128 v86 = v7;
  uint64_t v87 = *((void *)a3 + 16);
  __int128 v8 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&v83.isStanding = *((_OWORD *)a3 + 2);
  *(_OWORD *)&v83.isVehicleConnected = v8;
  __int128 v9 = *((_OWORD *)a3 + 5);
  *(_OWORD *)&v83.vehicleType = *((_OWORD *)a3 + 4);
  __int128 v84 = v9;
  __int128 v10 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&v83.int type = *(_OWORD *)a3;
  *(_OWORD *)&v83.mountedConfidence = v10;
  if (qword_1019344F0 != -1) {
    dispatch_once(&qword_1019344F0, &stru_101835500);
  }
  uint64_t v11 = (os_log_s *)qword_1019344F8;
  if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_INFO))
  {
    int type = v83.type;
    uint64_t v13 = CLMotionActivity::activityTypeToString(v83.type);
    int confidence = v83.confidence;
    int isMounted = CLMotionActivity::isMounted(&v83);
    *(_DWORD *)buf = 136316162;
    double v99 = *(double *)&v13;
    __int16 v100 = 1024;
    int v101 = type;
    __int16 v102 = 1024;
    int v103 = confidence;
    __int16 v104 = 1024;
    int v105 = isMounted;
    __int16 v106 = 2048;
    uint64_t v107 = v84;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "MotionState, %s, type, %d, conf, %d, mounted, %d, startTime, %f",  buf,  0x28u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    uint64_t v54 = qword_1019344F8;
    uint64_t v55 = CLMotionActivity::activityTypeToString(v83.type);
    int v56 = v83.type;
    int v57 = v83.confidence;
    int v58 = CLMotionActivity::isMounted(&v83);
    int v88 = 136316162;
    double v89 = *(double *)&v55;
    __int16 v90 = 1024;
    int v91 = v56;
    __int16 v92 = 1024;
    int v93 = v57;
    __int16 v94 = 1024;
    int v95 = v58;
    __int16 v96 = 2048;
    uint64_t v97 = v84;
    unsigned int v59 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v54,  1LL,  "MotionState, %s, type, %d, conf, %d, mounted, %d, startTime, %f",  (const char *)&v88,  40,  (_DWORD)v69,  v70,  *(double *)&v71);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]",  "%s\n",  v59);
  }

  int v16 = CLMotionActivity::isInVehicle(&v83);
  double vehicularStartTime = self->_vehicularStartTime;
  if (v16)
  {
    if (vehicularStartTime == 0.0)
    {
      double v18 = *(double *)&v84;
      *(void *)&self->_double vehicularStartTime = v84;
      else {
        int v19 = self->_sequentialVehicularIndex + 1;
      }
      self->_int sequentialVehicularIndex = v19;
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      unsigned int v31 = (os_log_s *)qword_1019344F8;
      if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
      {
        double v32 = self->_vehicularStartTime;
        int sequentialVehicularIndex = self->_sequentialVehicularIndex;
        *(_DWORD *)buf = 134218240;
        double v99 = v32;
        __int16 v100 = 1024;
        int v101 = sequentialVehicularIndex;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: vehicularStartTime, %f, seq, %d",  buf,  0x12u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019344F0 != -1) {
          dispatch_once(&qword_1019344F0, &stru_101835500);
        }
        double v61 = self->_vehicularStartTime;
        int v62 = self->_sequentialVehicularIndex;
        int v88 = 134218240;
        double v89 = v61;
        __int16 v90 = 1024;
        int v91 = v62;
        unsigned int v63 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: vehicularStartTime, %f, seq, %d",  COERCE_DOUBLE(&v88),  18);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]",  "%s\n",  v63);
      }

      uint64_t v70 = 3221225472LL;
      __int128 v79 = v84;
      __int128 v80 = v85;
      __int128 v81 = v86;
      __int128 v75 = *(_OWORD *)&v83.mountedConfidence;
      __int128 v76 = *(_OWORD *)&v83.isStanding;
      __int128 v77 = *(_OWORD *)&v83.isVehicleConnected;
      __int128 v78 = *(_OWORD *)&v83.vehicleType;
      vehicleStateProxy = self->_vehicleStateProxy;
      v69 = _NSConcreteStackBlock;
      uint64_t v71 = sub_10039CCEC;
      unsigned int v72 = &unk_1018354B8;
      uint64_t v82 = v87;
      __int128 v74 = *(_OWORD *)&v83.type;
      v73 = self;
      -[CLVehicleStateNotifierProtocol fetchVehicularFalsePositiveSuppressionStatusWithReply:]( vehicleStateProxy,  "fetchVehicularFalsePositiveSuppressionStatusWithReply:",  &v69);
      double vehicularStartTime = self->_vehicularStartTime;
    }

    double v35 = *(double *)&v84;
    double v36 = *(double *)&v84 - vehicularStartTime;
    char v37 = v85;
    if ((v85 & 1) != 0)
    {
      unint64_t vehicularHints = self->_vehicularHints;
      self->_unint64_t vehicularHints = vehicularHints | 1;
      unint64_t v38 = 1LL;
      if ((v37 & 2) == 0)
      {
LABEL_42:
        if ((v37 & 4) != 0)
        {
          unint64_t v43 = self->_vehicularHints;
          if ((v43 & 4) == 0) {
            self->_basebandDetectionLatency = v36;
          }
          self->_unint64_t vehicularHints = v43 | 4;
          v38 |= 4uLL;
          if ((v37 & 8) == 0)
          {
LABEL_44:
            if ((v37 & 0x10) == 0) {
              goto LABEL_45;
            }
            goto LABEL_61;
          }
        }

        else if ((v37 & 8) == 0)
        {
          goto LABEL_44;
        }

        unint64_t v44 = self->_vehicularHints;
        if ((v44 & 8) == 0) {
          self->_wifiDetectionLatency = v36;
        }
        self->_unint64_t vehicularHints = v44 | 8;
        v38 |= 8uLL;
        if ((v37 & 0x10) == 0)
        {
LABEL_45:
          if (!v38)
          {
            if (self->_vehicularLastNoHintsTime == 0.0)
            {
              self->_double vehicularLastNoHintsTime = v35;
              if (qword_1019344F0 != -1) {
                dispatch_once(&qword_1019344F0, &stru_101835500);
              }
              double v41 = (os_log_s *)qword_1019344F8;
              if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_INFO))
              {
                double vehicularLastNoHintsTime = self->_vehicularLastNoHintsTime;
                *(_DWORD *)buf = 134217984;
                double v99 = vehicularLastNoHintsTime;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "VEHICULAR: vehicularLastNoHintsTime, %f",  buf,  0xCu);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019344F0 != -1) {
                  dispatch_once(&qword_1019344F0, &stru_101835500);
                }
                double v66 = self->_vehicularLastNoHintsTime;
                int v88 = 134217984;
                double v89 = v66;
                unsigned int v67 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  1LL,  "VEHICULAR: vehicularLastNoHintsTime, %f",  COERCE_DOUBLE(&v88));
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]",  "%s\n",  v67);
              }
            }

            unint64_t v38 = 0LL;
            goto LABEL_65;
          }

- (void)onWifiServiceNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 6)
  {
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    __int128 v9 = (os_log_s *)qword_1019344F8;
    if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)a4 + 96);
      if (*((_BYTE *)a4 + 96)) {
        int v10 = *((_DWORD *)a4 + 12) > 0;
      }
      *(_DWORD *)buf = 67109120;
      int v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: wifi associated state, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      int v13 = *((unsigned __int8 *)a4 + 96);
      if (*((_BYTE *)a4 + 96)) {
        int v13 = *((_DWORD *)a4 + 12) > 0;
      }
      int v15 = 67109120;
      int v16 = v13;
      v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: wifi associated state, %d",  &v15);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]",  "%s\n",  v14);
    }

    if (*((_BYTE *)a4 + 96)) {
      BOOL v11 = *((_DWORD *)a4 + 12) > 0;
    }
    else {
      BOOL v11 = 0LL;
    }
    -[CLLocationDerivedSpeedEstimator updateWsbClient:](self, "updateWsbClient:", v11);
  }

  else if (a3 == 12)
  {
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    id v5 = (os_log_s *)qword_1019344F8;
    if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = 12;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: notification ScanCache received %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      int v15 = 67109120;
      int v16 = 12;
      __int128 v6 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: notification ScanCache received %d",  &v15);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]",  "%s\n");
LABEL_28:
      if (v6 != buf) {
        free(v6);
      }
    }
  }

  else
  {
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    __int128 v12 = (os_log_s *)qword_1019344F8;
    if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "VEHICULAR: received unhandled WifiService notification %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      int v15 = 67109120;
      int v16 = a3;
      __int128 v6 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  16LL,  "VEHICULAR: received unhandled WifiService notification %d",  &v15);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]",  "%s\n");
      goto LABEL_28;
    }
  }

- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 4)
  {
    -[CLLocationDerivedSpeedEstimator handleMotionStateNotification:](self, "handleMotionStateNotification:", a4);
  }

  else
  {
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    __int128 v8 = (os_log_s *)qword_1019344F8;
    if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "VEHICULAR: received unhandled notification %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      v10[0] = 67109120;
      v10[1] = a3;
      __int128 v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  16LL,  "VEHICULAR: received unhandled notification %d",  v10);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLLocationDerivedSpeedEstimator onMotionStateNotification:data:]",  "%s\n",  v9);
    }
  }

- (void)clearStatusBarColorAndText
{
  self->_visualIndicatorActive = 0;
}

- (void)logLatencyMetricsInternal
{
  if (sub_1004F8A40())
  {
    double v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    double v32 = sub_10039D71C;
    double v33 = &unk_1018354E0;
    double v34 = self;
    int v3 = off_101937AB0((uint64_t)@"212", (uint64_t)@"VehicleConnection_NOT_A_CRASH", 0LL, 0LL, (uint64_t)&v30);
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    v4 = (os_log_s *)qword_1019344F8;
    if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
    {
      double accelDetectionLatency = self->_accelDetectionLatency;
      double gpsDetectionLatency = self->_gpsDetectionLatency;
      double basebandDetectionLatency = self->_basebandDetectionLatency;
      double wifiDetectionLatency = self->_wifiDetectionLatency;
      double vehicularDurationExitFromNoHints = self->_vehicularDurationExitFromNoHints;
      double vehicularDurationExitFromLastBTHint = self->_vehicularDurationExitFromLastBTHint;
      double vehicularDurationLastBTHintFromLastMotionHint = self->_vehicularDurationLastBTHintFromLastMotionHint;
      int numMotionExitsWithBT = self->_numMotionExitsWithBT;
      int sequentialVehicularIndex = self->_sequentialVehicularIndex;
      double btDetectionLatency = self->_btDetectionLatency;
      double vehicularDuration = self->_vehicularDuration;
      *(_DWORD *)buf = 134220800;
      double v60 = accelDetectionLatency;
      __int16 v61 = 2048;
      double v62 = gpsDetectionLatency;
      __int16 v63 = 2048;
      double v64 = basebandDetectionLatency;
      __int16 v65 = 2048;
      double v66 = wifiDetectionLatency;
      __int16 v67 = 2048;
      double v68 = btDetectionLatency;
      __int16 v69 = 2048;
      double v70 = vehicularDurationExitFromNoHints;
      __int16 v71 = 2048;
      double v72 = vehicularDurationExitFromLastBTHint;
      __int16 v73 = 2048;
      double v74 = vehicularDurationLastBTHintFromLastMotionHint;
      __int16 v75 = 1024;
      int v76 = numMotionExitsWithBT;
      __int16 v77 = 1024;
      int v78 = sequentialVehicularIndex;
      __int16 v79 = 2048;
      double v80 = vehicularDuration;
      __int16 v81 = 1024;
      int v82 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: logLatencyMetricsInternal, accel, %f, gps, %f, bb, %f, wifi, %f, bt, %f, exitFromNoHints, %f, exitFro mLastBTHint, %f, BTHintFromLastMotionHintDuration, %f, motionExitsWithBTCount, %d, sequentialVehicularIndex, %d, duration, %f, success, %d",  buf,  0x6Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      double v16 = self->_accelDetectionLatency;
      double v17 = self->_gpsDetectionLatency;
      double v18 = self->_basebandDetectionLatency;
      double v19 = self->_wifiDetectionLatency;
      double v20 = self->_vehicularDurationExitFromNoHints;
      double v21 = self->_vehicularDurationExitFromLastBTHint;
      double v22 = self->_vehicularDurationLastBTHintFromLastMotionHint;
      int v23 = self->_numMotionExitsWithBT;
      int v24 = self->_sequentialVehicularIndex;
      double v26 = self->_btDetectionLatency;
      double v25 = self->_vehicularDuration;
      int v35 = 134220800;
      double v36 = v16;
      __int16 v37 = 2048;
      double v38 = v17;
      __int16 v39 = 2048;
      double v40 = v18;
      __int16 v41 = 2048;
      double v42 = v19;
      __int16 v43 = 2048;
      double v44 = v26;
      __int16 v45 = 2048;
      double v46 = v20;
      __int16 v47 = 2048;
      double v48 = v21;
      __int16 v49 = 2048;
      double v50 = v22;
      __int16 v51 = 1024;
      int v52 = v23;
      __int16 v53 = 1024;
      int v54 = v24;
      __int16 v55 = 2048;
      double v56 = v25;
      __int16 v57 = 1024;
      int v58 = v3;
      LODWORD(v28) = 110;
      double v27 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: logLatencyMetricsInternal, accel, %f, gps, %f, bb, %f, wifi, %f, bt, %f, exitFromNoHint s, %f, exitFromLastBTHint, %f, BTHintFromLastMotionHintDuration, %f, motionExitsWithBTCount, %d, s equentialVehicularIndex, %d, duration, %f, success, %d",  COERCE_DOUBLE(&v35),  v28,  v29,  *(double *)&v30,  *(double *)&v31,  *(double *)&v32,  *(double *)&v33,  *(double *)&v34);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator logLatencyMetricsInternal]", "%s\n", v27);
    }
  }

- (void)submitFalseDetectionMetricsWithType:(unint64_t)a3
{
  if (qword_1019344F0 != -1) {
    dispatch_once(&qword_1019344F0, &stru_101835500);
  }
  v4 = (os_log_s *)qword_1019344F8;
  if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: false positive detected, hint, %lu",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    int v10 = 134217984;
    unint64_t v11 = a3;
    __int128 v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: false positive detected, hint, %lu",  &v10);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationDerivedSpeedEstimator submitFalseDetectionMetricsWithType:]",  "%s\n",  v8);
  }

  AnalyticsSendEvent(@"com.apple.carexperience.falseDetection.all", &off_1018D6648);
  switch(a3)
  {
    case 1uLL:
      id v5 = @"com.apple.carexperience.falseDetection.accel";
      __int128 v6 = &off_1018D6670;
      goto LABEL_18;
    case 2uLL:
      id v5 = @"com.apple.carexperience.falseDetection.gps";
      __int128 v6 = &off_1018D6698;
      goto LABEL_18;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      if (qword_1019344F0 != -1) {
        dispatch_once(&qword_1019344F0, &stru_101835500);
      }
      __int128 v7 = (os_log_s *)qword_1019344F8;
      if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = 6488064;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: submit baseband false detection metric, id, %u",  buf,  8u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019344F0 != -1) {
          dispatch_once(&qword_1019344F0, &stru_101835500);
        }
        int v10 = 67109120;
        LODWORD(v11) = 6488064;
        __int128 v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344F8,  0LL,  "VEHICULAR: submit baseband false detection metric, id, %u",  &v10);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationDerivedSpeedEstimator submitFalseDetectionMetricsWithType:]",  "%s\n",  v9);
      }

      AWDPostSimpleMetric(6488064LL);
      id v5 = @"com.apple.carexperience.falseDetection.baseband";
      __int128 v6 = &off_1018D66C0;
      goto LABEL_18;
    case 8uLL:
      id v5 = @"com.apple.carexperience.falseDetection.wifi";
      __int128 v6 = &off_1018D66E8;
      goto LABEL_18;
    default:
      if (a3 != 16) {
        return;
      }
      id v5 = @"com.apple.carexperience.falseDetection.bt";
      __int128 v6 = &off_1018D6710;
LABEL_18:
      AnalyticsSendEvent(v5, v6);
      return;
  }

- (void)submitLatencyMetrics
{
  int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_vehicularDuration),  @"duration");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", self->_hintsAvailable),  @"hintsAvailable");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", self->_vehicularHints),  @"hintsDetected");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_sequentialVehicularIndex),  @"sequentialVehicularIndex");
  if (self->_vehicularDurationExitFromNoHints >= 0.0) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"durationExitFromNoHints");
  }
  unint64_t vehicularHints = self->_vehicularHints;
  if ((vehicularHints & 1) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_accelDetectionLatency),  @"accel");
    double accelDetectionLatency = self->_accelDetectionLatency;
    unint64_t vehicularHints = self->_vehicularHints;
  }

  else
  {
    double accelDetectionLatency = 1.79769313e308;
  }

  double wifiDetectionLatency = accelDetectionLatency;
  if ((vehicularHints & 8) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_wifiDetectionLatency),  @"wifi");
    if (self->_wifiDetectionLatency >= accelDetectionLatency) {
      double wifiDetectionLatency = accelDetectionLatency;
    }
    else {
      double wifiDetectionLatency = self->_wifiDetectionLatency;
    }
    unint64_t vehicularHints = self->_vehicularHints;
  }

  if ((vehicularHints & 4) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_basebandDetectionLatency),  @"baseband");
    double basebandDetectionLatency = self->_basebandDetectionLatency;
    if (basebandDetectionLatency < accelDetectionLatency) {
      double accelDetectionLatency = self->_basebandDetectionLatency;
    }
    if (basebandDetectionLatency >= wifiDetectionLatency) {
      double v7 = wifiDetectionLatency;
    }
    else {
      double v7 = self->_basebandDetectionLatency;
    }
    unint64_t vehicularHints = self->_vehicularHints;
  }

  else
  {
    double v7 = wifiDetectionLatency;
  }

  double gpsDetectionLatency = v7;
  if ((vehicularHints & 2) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_gpsDetectionLatency),  @"gps");
    if (self->_gpsDetectionLatency >= v7) {
      double gpsDetectionLatency = v7;
    }
    else {
      double gpsDetectionLatency = self->_gpsDetectionLatency;
    }
    unint64_t vehicularHints = self->_vehicularHints;
  }

  if ((vehicularHints & 0x10) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_btDetectionLatency),  @"bt");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_numMotionExitsWithBT),  @"countMotionExitsWithBT");
    if (self->_vehicularDurationExitFromLastBTHint >= 0.0) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"durationExitFromLastBTHint");
    }
    if (self->_vehicularDurationLastBTHintFromLastMotionHint >= 0.0) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"durationBTHintFromLastMotionHint");
    }
  }

  if (wifiDetectionLatency < 1.79769313e308)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", wifiDetectionLatency),  @"accelWifi");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", accelDetectionLatency),  @"accelBaseband");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7),  @"accelWifiBaseband");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", gpsDetectionLatency),  @"accelWifiBasebandGPS");
  }

  AnalyticsSendEvent(@"com.apple.carexperience.detectionLatency", v3);
  if (qword_1019344F0 != -1) {
    dispatch_once(&qword_1019344F0, &stru_101835500);
  }
  int v10 = (os_log_s *)qword_1019344F8;
  if (os_log_type_enabled((os_log_t)qword_1019344F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138416386;
    id v48 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accel");
    __int16 v49 = 2112;
    id v50 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"gps");
    __int16 v51 = 2112;
    id v52 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"baseband");
    __int16 v53 = 2112;
    id v54 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"wifi");
    __int16 v55 = 2112;
    id v56 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"bt");
    __int16 v57 = 2112;
    id v58 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelWifi");
    __int16 v59 = 2112;
    id v60 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelBaseband");
    __int16 v61 = 2112;
    id v62 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelWifiBaseband");
    __int16 v63 = 2112;
    id v64 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelWifiBasebandGPS");
    __int16 v65 = 2112;
    id v66 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"durationExitFromNoHints");
    __int16 v67 = 2112;
    id v68 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"durationExitFromLastBTHint");
    __int16 v69 = 2112;
    id v70 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"durationBTHintFromLastMotionHint");
    __int16 v71 = 2112;
    id v72 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"countMotionExitsWithBT");
    __int16 v73 = 2112;
    id v74 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"sequentialVehicularIndex");
    __int16 v75 = 2112;
    id v76 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"duration");
    __int16 v77 = 2112;
    id v78 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"hintsAvailable");
    __int16 v79 = 2112;
    id v80 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"hintsDetected");
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "VEHICULAR: submitLatencyMetrics, accel, %@, gps, %@, baseband, %@, wifi, %@, bt, %@, accelWifi, %@, accelBaseband, %@, accelWifiBaseband, %@, accelWifiBasebandGPS, %@, exitFromNoHints, %@, durationExitFromLastBTHint, %@, duratio nBTHintFromLastMotionHint, %@, countMotionExitsWithBT, %@, sequentialVehicularIndex, %@, duration, %@, hintsAvaila ble, %@, hintsDetected, %@",  buf,  0xACu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344F0 != -1) {
      dispatch_once(&qword_1019344F0, &stru_101835500);
    }
    uint64_t v12 = qword_1019344F8;
    int v13 = 138416386;
    id v14 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accel");
    __int16 v15 = 2112;
    id v16 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"gps");
    __int16 v17 = 2112;
    id v18 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"baseband");
    __int16 v19 = 2112;
    id v20 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"wifi");
    __int16 v21 = 2112;
    id v22 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"bt");
    __int16 v23 = 2112;
    id v24 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelWifi");
    __int16 v25 = 2112;
    id v26 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelBaseband");
    __int16 v27 = 2112;
    id v28 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelWifiBaseband");
    __int16 v29 = 2112;
    id v30 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"accelWifiBasebandGPS");
    __int16 v31 = 2112;
    id v32 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"durationExitFromNoHints");
    __int16 v33 = 2112;
    id v34 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"durationExitFromLastBTHint");
    __int16 v35 = 2112;
    id v36 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"durationBTHintFromLastMotionHint");
    __int16 v37 = 2112;
    id v38 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"countMotionExitsWithBT");
    __int16 v39 = 2112;
    id v40 = -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"sequentialVehicularIndex");
    __int16 v41 = 2112;
    id v42 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"duration");
    __int16 v43 = 2112;
    id v44 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"hintsAvailable");
    __int16 v45 = 2112;
    id v46 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"hintsDetected");
    unint64_t v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  0LL,  "VEHICULAR: submitLatencyMetrics, accel, %@, gps, %@, baseband, %@, wifi, %@, bt, %@, accelWifi, %@, accelBaseband, %@, accelWifiBaseband, %@, accelWifiBasebandGPS, %@, exitFromNoHints, %@, durationExi tFromLastBTHint, %@, durationBTHintFromLastMotionHint, %@, countMotionExitsWithBT, %@, sequentialVeh icularIndex, %@, duration, %@, hintsAvailable, %@, hintsDetected, %@",  &v13,  172);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationDerivedSpeedEstimator submitLatencyMetrics]", "%s\n", v11);
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)currentEstimate
{
  double speed = self->_currentEstimate.speed;
  double timestamp = self->_currentEstimate.timestamp;
  double uncertainty = self->_currentEstimate.uncertainty;
  result.var2 = uncertainty;
  result.var1 = timestamp;
  result.var0 = speed;
  return result;
}

- (void)setCurrentEstimate:(id)a3
{
  self->_currentEstimate = ($9E02BBE4D008A67F6CE59182E6F5D717)a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLLocation)prevLoc
{
  return self->_prevLoc;
}

- (void)setPrevLoc:(id)a3
{
}

- (CLTimer)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  return self;
}

@end