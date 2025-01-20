@interface CLMicroLocationLoiBridge
- (BOOL)valid;
- (id)generateLocationManagerNotAvailableError;
- (id)generateRegionMonitorNotAvailableError;
- (id)initInUniverse:(id)a3;
- (void)dealloc;
- (void)fetchLocationOfInterestAtLocation:(id)a3;
- (void)fetchPlaceInferenceAtCurrentLocation;
- (void)fetchRelatedLoisForLoi:(id)a3;
- (void)getCurrentLocation;
- (void)invalidateFetchPlaceInferenceTimer;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)onVisit:(id)a3;
- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3;
- (void)setValid:(BOOL)a3;
- (void)startVisitMonitoring;
@end

@implementation CLMicroLocationLoiBridge

- (id)initInUniverse:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLMicroLocationLoiBridge;
  v4 = -[CLMicroLocationLoiBridge init](&v8, "init");
  if (v4)
  {
    v4->_universe = (CLIntersiloUniverse *)a3;
    v5 = (CLDispatchSilo *)[a3 silo];
    v4->_silo = v5;
    v4->_queue = (OS_dispatch_queue *)-[CLDispatchSilo queue](v5, "queue");
    v4->_fetchPlaceInferenceTimer = 0LL;
    *(_WORD *)&v4->_bridgeReady = 256;
    v6 = (CLRoutineMonitorServiceProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor](v4->_universe, "vendor"),  "proxyForService:",  @"CLRoutineMonitor");
    v4->_routineMonitor = v6;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:]( v6,  "registerDelegate:inSilo:",  v4,  -[CLIntersiloUniverse silo](v4->_universe, "silo"));
    -[CLRoutineMonitorServiceProtocol setDelegateEntityName:]( v4->_routineMonitor,  "setDelegateEntityName:",  "CLMicroLocationLoiBridge");
  }

  return v4;
}

- (void)dealloc
{
  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:]( self->_routineMonitor,  "stopLeechingVisitsForClient:",  self);
  -[CLRoutineMonitorServiceProtocol stopLeechingLowConfidenceVisitsForClient:]( self->_routineMonitor,  "stopLeechingLowConfidenceVisitsForClient:",  self);

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMicroLocationLoiBridge;
  -[CLMicroLocationLoiBridge dealloc](&v3, "dealloc");
}

- (void)setMicroLocationLoiClient:(CLMicroLocationLoiClient *)a3
{
  self->_microlocationLoiClient = a3;
}

- (id)generateLocationManagerNotAvailableError
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_10181A348);
  }
  v2 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "#LOI Bridge, Attempted LOI request when location manager was not available",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
    v6[0] = 0;
    v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  16LL,  "#LOI Bridge, Attempted LOI request when location manager was not available",  v6,  2);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMicroLocationLoiBridge generateLocationManagerNotAvailableError]",  "%s\n",  v5);
  }

  objc_super v3 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  objc_super v8 = @"Location Manager not available";
  return  -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  2LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
}

- (id)generateRegionMonitorNotAvailableError
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_10181A348);
  }
  v2 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "#LOI Bridge, Attempted geofence request when region monitor was not available",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
    v6[0] = 0;
    v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  16LL,  "#LOI Bridge, Attempted geofence request when region monitor was not available",  v6,  2);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMicroLocationLoiBridge generateRegionMonitorNotAvailableError]",  "%s\n",  v5);
  }

  objc_super v3 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  objc_super v8 = @"Routine Monitor is not active";
  return  -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  3LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
}

- (void)startVisitMonitoring
{
}

- (void)invalidateFetchPlaceInferenceTimer
{
  self->_fetchPlaceInferenceTimer = 0LL;
}

- (void)fetchPlaceInferenceAtCurrentLocation
{
  if (sub_10005D88C())
  {
    if (!self->_clLocationManager)
    {
      silo = self->_silo;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10005E064;
      v11[3] = &unk_10181A288;
      v11[4] = self;
      -[CLDispatchSilo async:](silo, "async:", v11);
    }

    v4 = (CLTimer *)-[CLDispatchSilo newTimer](self->_silo, "newTimer");
    self->_fetchPlaceInferenceTimer = v4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005E09C;
    v10[3] = &unk_10181A288;
    v10[4] = self;
    -[CLTimer setHandler:](v4, "setHandler:", v10);
    -[CLTimer setNextFireDelay:](self->_fetchPlaceInferenceTimer, "setNextFireDelay:", 5.0);
    clLocationManager = self->_clLocationManager;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005E290;
    v9[3] = &unk_10181A2B0;
    v9[4] = self;
    -[CLLocationManager _fetchPlaceInferencesWithFidelityPolicy:handler:]( clLocationManager,  "_fetchPlaceInferencesWithFidelityPolicy:handler:",  0LL,  v9);
  }

  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_10181A348);
  }
  v6 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "fetchPlaceInferenceAtCurrentLocation - MicroLocation is disabled",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
    __int16 v8 = 0;
    NSErrorUserInfoKey v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  16LL,  "fetchPlaceInferenceAtCurrentLocation - MicroLocation is disabled",  &v8,  2);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMicroLocationLoiBridge fetchPlaceInferenceAtCurrentLocation]",  "%s\n",  v7);
  }

- (void)fetchLocationOfInterestAtLocation:(id)a3
{
  routineMonitor = self->_routineMonitor;
  if (!routineMonitor)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    v12 = @"Routine Monitor is not active";
    NSErrorUserInfoKey v7 =  -[NSError initWithDomain:code:userInfo:]( v6,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005E63C;
    v10[3] = &unk_10181A2D8;
    v10[4] = self;
    void v10[5] = a3;
    v10[6] = v7;
    -[CLDispatchSilo async:](silo, "async:", v10);
    routineMonitor = self->_routineMonitor;
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005E65C;
  v9[3] = &unk_10181A300;
  v9[4] = self;
  void v9[5] = a3;
  -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestAtLocation:withReply:]( routineMonitor,  "fetchLocationOfInterestAtLocation:withReply:",  a3,  v9);
}

- (void)fetchRelatedLoisForLoi:(id)a3
{
  routineMonitor = self->_routineMonitor;
  if (!routineMonitor)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    v12 = @"Routine Monitor is not active";
    NSErrorUserInfoKey v7 =  -[NSError initWithDomain:code:userInfo:]( v6,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005E824;
    v10[3] = &unk_10181A328;
    v10[4] = self;
    void v10[5] = v7;
    -[CLDispatchSilo async:](silo, "async:", v10);
    routineMonitor = self->_routineMonitor;
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005E83C;
  v9[3] = &unk_10181A2B0;
  v9[4] = self;
  -[CLRoutineMonitorServiceProtocol fetchDedupedLocationOfInterestIdentifiersWithIdentifier:withReply:]( routineMonitor,  "fetchDedupedLocationOfInterestIdentifiersWithIdentifier:withReply:",  a3,  v9);
}

- (void)getCurrentLocation
{
  if (sub_10005D88C())
  {
    clLocationManager = self->_clLocationManager;
    if (!clLocationManager)
    {
      silo = self->_silo;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10005EBB0;
      v7[3] = &unk_10181A288;
      v7[4] = self;
      -[CLDispatchSilo async:](silo, "async:", v7);
      clLocationManager = self->_clLocationManager;
    }

    -[CLLocationManager requestLocation](clLocationManager, "requestLocation");
    self->_waitingOnLocationUpdate = 1;
  }

  else
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
    v5 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      NSErrorUserInfoKey v11 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:LOI Bridge, getCurrentLocation while MicroLocation disabled}",  buf,  0x12u);
      if (qword_1019348D0 != -1) {
        dispatch_once(&qword_1019348D0, &stru_10181A348);
      }
    }

    v6 = (os_log_s *)qword_1019348D8;
    if (os_signpost_enabled((os_log_t)qword_1019348D8))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      NSErrorUserInfoKey v11 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "LOI Bridge, getCurrentLocation while MicroLocation disabled",  "{msg%{public}.0s:LOI Bridge, getCurrentLocation while MicroLocation disabled}",  buf,  0x12u);
    }
  }

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  if (self->_waitingOnLocationUpdate)
  {
    self->_waitingOnLocationUpdate = 0;
    if (a4 && objc_msgSend(a4, "count", a3))
    {
      id v6 = [a4 objectAtIndexedSubscript:0];
      NSErrorUserInfoKey v7 = 0LL;
    }

    else
    {
      __int16 v8 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      v31 = @"Failed to get current Location";
      int v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
      NSErrorUserInfoKey v7 =  -[NSError initWithDomain:code:userInfo:]( v8,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  5LL,  v9);
      id v6 = 0LL;
    }

    [v6 horizontalAccuracy];
    double v11 = v10;
    sub_1002F0B04(buf);
    CFStringRef v12 = CFStringCreateWithCStringNoCopy(0LL, "MicroLocationsCustomLoiGeofenceRadius", 0x8000100u, kCFAllocatorNull);
    int v13 = sub_1002A832C(*(uint64_t *)buf, (uint64_t)v12, v25);
    CFRelease(v12);
    double v14 = *(double *)v25;
    v15 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        unint64_t v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    double v18 = 250.0;
    if (v13) {
      double v18 = v14;
    }
    if (v11 > v18)
    {
      v19 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      v29 = @"Failed to get current Location";
      v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
      NSErrorUserInfoKey v7 =  -[NSError initWithDomain:code:userInfo:]( v19,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  5LL,  v20);
      id v6 = 0LL;
    }

    silo = self->_silo;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10005EF94;
    v24[3] = &unk_10181A2D8;
    v24[4] = self;
    v24[5] = v6;
    v24[6] = v7;
    -[CLDispatchSilo async:](silo, "async:", v24);
  }

  else
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
    v22 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "LOI Bridge: Received location update when not waiting on one... Ignoring",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348D0 != -1) {
        dispatch_once(&qword_1019348D0, &stru_10181A348);
      }
      LOWORD(v25[0]) = 0;
      v23 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  16LL,  "LOI Bridge: Received location update when not waiting on one... Ignoring",  v25,  2);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLMicroLocationLoiBridge locationManager:didUpdateLocations:]",  "%s\n",  v23);
    }
  }

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_10181A348);
  }
  v5 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
  {
    int v7 = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 2113;
    id v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#LOI Bridge: location manager failed, error::%{private, location:escape_only}@}",  (uint8_t *)&v7,  0x1Cu);
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
  }

  id v6 = (os_log_s *)qword_1019348D8;
  if (os_signpost_enabled((os_log_t)qword_1019348D8))
  {
    int v7 = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 2113;
    id v12 = a4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#LOI Bridge: location manager failed",  "{msg%{public}.0s:#LOI Bridge: location manager failed, error::%{private, location:escape_only}@}",  (uint8_t *)&v7,  0x1Cu);
  }

- (void)onVisit:(id)a3
{
  if (a3)
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
    v5 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "LOI Bridge: Received visit notification",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348D0 != -1) {
        dispatch_once(&qword_1019348D0, &stru_10181A348);
      }
      v9[0] = 0;
      int v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  0LL,  "LOI Bridge: Received visit notification",  v9,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMicroLocationLoiBridge onVisit:]", "%s\n", v7);
    }

    ((void (*)(CLMicroLocationLoiClient *, id))*self->_microlocationLoiClient->var0)( self->_microlocationLoiClient,  a3);
  }

  else
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181A348);
    }
    id v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "LOI Bridge: Received nil visit notification",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348D0 != -1) {
        dispatch_once(&qword_1019348D0, &stru_10181A348);
      }
      v9[0] = 0;
      int v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  0LL,  "LOI Bridge: Received nil visit notification",  v9,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMicroLocationLoiBridge onVisit:]", "%s\n", v8);
    }
  }

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end