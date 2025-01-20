@interface CLZoneRelevanceTracker
- (CLDaemonLocation)currentLocation;
- (CLZoneRelevanceTracker)initWithClientManagerPointer:(void *)a3 andUniverse:(id)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)handleEntryExitDelegateCallbackForRegion:(id)a3 withState:(int64_t)a4;
- (void)invalidate;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)onLeechedNotification:(int)a3 withData:(NotificationData *)a4;
- (void)startCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7;
- (void)startStopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)longitude longitude:(double)latitude radius:(double)a7 shouldStart:(BOOL)a8;
- (void)stopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4;
@end

@implementation CLZoneRelevanceTracker

- (CLZoneRelevanceTracker)initWithClientManagerPointer:(void *)a3 andUniverse:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLZoneRelevanceTracker;
  v6 = -[CLZoneRelevanceTracker init](&v17, "init");
  if (v6)
  {
    *((void *)v6 + 1) = a4;
    *((void *)v6 + 23) = a3;
    *((void *)v6 + 24) = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( [CLLocationManager alloc],  "initWithEffectiveBundlePath:delegate:onQueue:",  @"/System/Library/LocationBundles/PLAMonitor.bundle",  v6,  objc_msgSend(objc_msgSend(*((id *)v6 + 1), "silo"), "queue"));
    v6[200] = 1;
    sub_10043AC3C((uint64_t)sub_10059A254, (uint64_t)v6, *((void **)v6 + 1), &v16);
    uint64_t v7 = v16;
    uint64_t v16 = 0LL;
    uint64_t v8 = *((void *)v6 + 2);
    *((void *)v6 + 2) = v7;
    if (v8)
    {
      (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
      uint64_t v9 = v16;
      uint64_t v16 = 0LL;
      if (v9) {
        (*(void (**)(uint64_t))(*(void *)v9 + 8LL))(v9);
      }
    }

    [*(id *)(*((void *)v6 + 2) + 16) register:*(void *)(*((void *)v6 + 2) + 8) forNotification:5 registrationInfo:0];
    *((_DWORD *)v6 + 6) = 0xFFFF;
    *(void *)(v6 + 36) = 0LL;
    *(void *)(v6 + 28) = 0LL;
    *(_OWORD *)(v6 + 44) = xmmword_1012E0070;
    __asm { FMOV            V0.2D, #-1.0 }

    *(_OWORD *)(v6 + 60) = _Q0;
    *(_OWORD *)(v6 + 76) = _Q0;
    *(_OWORD *)(v6 + 92) = _Q0;
    *((_DWORD *)v6 + 27) = 0;
    *((void *)v6 + 15) = 0LL;
    *((void *)v6 + 16) = 0LL;
    *((void *)v6 + 14) = 0xBFF0000000000000LL;
    *((_DWORD *)v6 + 34) = 0;
    *(void *)(v6 + 140) = 0xBFF0000000000000LL;
    *((_DWORD *)v6 + 37) = 0x7FFFFFFF;
    *((void *)v6 + 20) = 0LL;
    *((void *)v6 + 21) = 0LL;
    *((void *)v6 + 19) = 0LL;
    v6[176] = 0;
  }

  return (CLZoneRelevanceTracker *)v6;
}

- (void)dealloc
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }

  *(void *)&self->_currentLocation.fromSimulationController = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLZoneRelevanceTracker;
  -[CLZoneRelevanceTracker dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  LOBYTE(self->_clientManager) = 0;
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840E98);
  }
  v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2082;
    id v10 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#pla #zone-relevance-tracker region-monitoring started, RegionIdentifier/ZoneRelevanceM onitoringId:%{public, location:escape_only}s}",  (uint8_t *)v6,  0x1Cu);
  }

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840E98);
  }
  __int16 v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
  {
    int v11 = 68289538;
    int v12 = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2082;
    id v16 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    __int16 v17 = 2082;
    id v18 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#pla #zone-relevance-tracker region-monitoring failed to start, RegionIdentifier/ZoneRe levanceMonitoringId:%{public, location:escape_only}s, Error:%{public, location:escape_only}s}",  (uint8_t *)&v11,  0x26u);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840E98);
    }
  }

  uint64_t v8 = (os_log_s *)qword_101934988;
  if (os_signpost_enabled((os_log_t)qword_101934988))
  {
    id v9 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    id v10 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    int v11 = 68289538;
    int v12 = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2082;
    id v16 = v9;
    __int16 v17 = 2082;
    id v18 = v10;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#pla #zone-relevance-tracker region-monitoring failed to start",  "{msg%{public}.0s:#pla #zone-relevance-tracker region-monitoring failed to start, RegionIdentifier/ZoneRe levanceMonitoringId:%{public, location:escape_only}s, Error:%{public, location:escape_only}s}",  (uint8_t *)&v11,  0x26u);
  }

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840E98);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2082;
    id v11 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#pla #zone-relevance-tracker entered circular region, RegionIdentifier/ZoneRelevanceMon itoringId:%{public, location:escape_only}s}",  (uint8_t *)v7,  0x1Cu);
  }

  -[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:]( self,  "handleEntryExitDelegateCallbackForRegion:withState:",  a4,  1LL);
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840E98);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2082;
    id v11 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#pla #zone-relevance-tracker exited circular-region, RegionIdentifier/ZoneRelevanceMoni toringId:%{public, location:escape_only}s}",  (uint8_t *)v7,  0x1Cu);
  }

  -[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:]( self,  "handleEntryExitDelegateCallbackForRegion:withState:",  a4,  2LL);
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840E98);
  }
  __int16 v8 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 1026;
    int v13 = a4;
    __int16 v14 = 2082;
    id v15 = objc_msgSend(objc_msgSend(a5, "identifier"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#pla #zone-relevance-tracker determined state, State:%{public}d, RegionIdentifier/Z oneRelevanceMonitoringId:%{public, location:escape_only}s}",  (uint8_t *)v9,  0x22u);
  }

  -[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:]( self,  "handleEntryExitDelegateCallbackForRegion:withState:",  a5,  a4);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840E98);
  }
  v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2082;
    id v13 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#pla locationManager delegate received error, Error:%{public, location:escape_only}s}",  (uint8_t *)&v8,  0x1Cu);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840E98);
    }
  }

  v6 = (os_log_s *)qword_101934988;
  if (os_signpost_enabled((os_log_t)qword_101934988))
  {
    id v7 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2082;
    id v13 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#pla locationManager delegate received error",  "{msg%{public}.0s:#pla locationManager delegate received error, Error:%{public, location:escape_only}s}",  (uint8_t *)&v8,  0x1Cu);
  }

- (void)handleEntryExitDelegateCallbackForRegion:(id)a3 withState:(int64_t)a4
{
  if (a4)
  {
    id v5 = [a3 identifier];
    v6 = (char *)[v5 rangeOfString:@":"];
    id v7 = [v5 substringToIndex:v6];
    id v8 = [v5 substringFromIndex:v6 + 1];
    if (LOBYTE(self->_clientManager))
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840E98);
      }
      int v9 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "#pla #zone-relevance-tracker recompute auth context",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840E98);
        }
        v15[0] = 0;
        __int16 v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "#pla #zone-relevance-tracker recompute auth context",  v15,  2);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:]",  "%s\n",  v14);
      }

      __int16 v10 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithLegacyClientKey:",  v7);
      uint64_t v11 = *(void *)&self->_currentLocation.ellipsoidalAltitude;
      sub_1010DDBC0(buf, "");
      sub_100544214(v11, v10, (uint64_t)buf);
      if (SBYTE3(v20) < 0) {
        operator delete(*(void **)buf);
      }
    }

    else
    {
      __int16 v12 = v8;
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840E98);
      }
      id v13 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2082;
        id v20 = [v7 UTF8String];
        __int16 v21 = 2082;
        id v22 = [v12 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#pla ClientManager has marked ZoneTracker as invalid, not updating zone relevance,  Client:%{public, location:escape_only}s, ZoneId:%{public, location:escape_only}s}",  buf,  0x26u);
      }
    }
  }

- (void)startStopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)longitude longitude:(double)latitude radius:(double)a7 shouldStart:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@%@", a3, @":", a4);
  if (v8)
  {
    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(longitude, latitude);
    latitude = v16.latitude;
    longitude = v16.longitude;
    __int16 v17 = (CLCircularRegion *)-[CLCircularRegion initNearbyAllowedWithCenter:radius:identifier:]( objc_alloc(&OBJC_CLASS___CLCircularRegion),  "initNearbyAllowedWithCenter:radius:identifier:",  v15,  v16.latitude,  v16.longitude,  a7);
    -[CLCircularRegion setNotifyOnEntry:](v17, "setNotifyOnEntry:", 1LL);
    -[CLCircularRegion setNotifyOnExit:](v17, "setNotifyOnExit:", 1LL);
  }

  else
  {
    __int16 v17 = -[CLCircularRegion initWithCenter:radius:identifier:]( objc_alloc(&OBJC_CLASS___CLCircularRegion),  "initWithCenter:radius:identifier:",  v15);
  }

  if (v17)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840E98);
    }
    id v18 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        __int16 v19 = "starting";
      }
      else {
        __int16 v19 = "stopping";
      }
      *(_DWORD *)buf = 68290562;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2082;
      v30 = v19;
      __int16 v31 = 2050;
      double v32 = latitude;
      __int16 v33 = 2050;
      double v34 = longitude;
      __int16 v35 = 2050;
      double v36 = a7;
      __int16 v37 = 2082;
      id v38 = [a3 UTF8String];
      __int16 v39 = 2082;
      id v40 = [a4 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#pla #zone-relevance-tracker for circular-region, monitoring:%{public, location:esc ape_only}s, latitude:%{public}.7f, longitude:%{public}.7f, radius:%{public}.3f, Client :%{public, location:escape_only}s, ZoneId:%{public, location:escape_only}s}",  buf,  0x4Eu);
    }

    id v20 = *(void **)&self->_currentLocation.fromSimulationController;
    if (v8) {
      [v20 startMonitoringForRegion:v17];
    }
    else {
      [v20 stopMonitoringForRegion:v17];
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840E98);
    }
    __int16 v21 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2082;
      v30 = (const char *)[a3 UTF8String];
      __int16 v31 = 2082;
      double v32 = COERCE_DOUBLE([a4 UTF8String]);
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#pla #zone-relevance-tracker cannot create CircularRegion, Client:%{public, locatio n:escape_only}s, ZoneId:%{public, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840E98);
      }
    }

    id v22 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      v23 = (const char *)[a3 UTF8String];
      id v24 = [a4 UTF8String];
      *(_DWORD *)buf = 68289538;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2082;
      v30 = v23;
      __int16 v31 = 2082;
      double v32 = *(double *)&v24;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#pla #zone-relevance-tracker cannot create CircularRegion",  "{msg%{public}.0s:#pla #zone-relevance-tracker cannot create CircularRegion, Client:%{public, locatio n:escape_only}s, ZoneId:%{public, location:escape_only}s}",  buf,  0x26u);
    }
  }

- (void)startCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7
{
}

- (void)stopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4
{
}

- (CLDaemonLocation)currentLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self->floor;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->rawCoordinate.longitude;
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self->signalEnvironmentType;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)((char *)&self->ellipsoidalAltitude + 4);
  __int128 v4 = *(_OWORD *)&self->courseAccuracy;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->speedAccuracy;
  *(_OWORD *)&retstr->speed = v4;
  __int128 v5 = *(_OWORD *)&self->type;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->confidence;
  *(_OWORD *)&retstr->timestamp = v5;
  __int128 v6 = *(_OWORD *)&self->verticalAccuracy;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->horizontalAccuracy;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  return self;
}

- (void)onLeechedNotification:(int)a3 withData:(NotificationData *)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840E98);
  }
  id v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290307;
    int v24 = 0;
    __int16 v25 = 2082;
    int v26 = "";
    __int16 v27 = 2050;
    uint64_t v28 = a3;
    __int16 v29 = 1040;
    int v30 = 156;
    __int16 v31 = 2097;
    p_currentLocation = &self->_currentLocation;
    __int16 v33 = 1040;
    int v34 = 156;
    __int16 v35 = 2097;
    double v36 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#pla #zone-relevance-tracker, location notification, notification:%{public, location: CLLocationProvider_Type::Notification}lld, _currentLocation:%{private, location:CLClientLocation}.*P, NewLoc ation:%{private, location:CLClientLocation}.*P}",  buf,  0x3Cu);
  }

  if (a3 == 5)
  {
    if ((sub_100869780((uint64_t)a4) & 1) != 0)
    {
      if (*(double *)((char *)a4 + 76) - *(double *)((char *)&self->_currentLocation.courseAccuracy + 4) >= 0.0)
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840E98);
        }
        id v13 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "#pla #zone-relevance-tracker Accepting New Location",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101840E98);
          }
          LOWORD(v22[0]) = 0;
          __int16 v21 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "#pla #zone-relevance-tracker Accepting New Location",  v22,  2);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLZoneRelevanceTracker onLeechedNotification:withData:]",  "%s\n",  v21);
        }

        __int128 v14 = *((_OWORD *)a4 + 1);
        *(_OWORD *)&self->_currentLocation.suitability = *(_OWORD *)a4;
        *(_OWORD *)&self->_currentLocation.coordinate.longitude = v14;
        __int128 v15 = *((_OWORD *)a4 + 2);
        __int128 v16 = *((_OWORD *)a4 + 3);
        __int128 v17 = *((_OWORD *)a4 + 5);
        *(_OWORD *)&self->_currentLocation.course = *((_OWORD *)a4 + 4);
        *(_OWORD *)&self->_currentLocation.timestamp = v17;
        *(_OWORD *)&self->_currentLocation.altitude = v15;
        *(_OWORD *)&self->_currentLocation.speed = v16;
        __int128 v18 = *((_OWORD *)a4 + 6);
        $AB5116BA7E623E054F959CECB034F4E7 v19 = ($AB5116BA7E623E054F959CECB034F4E7)*((_OWORD *)a4 + 7);
        __int128 v20 = *((_OWORD *)a4 + 8);
        *(_OWORD *)&self->_currentLocation.integrity = *(_OWORD *)((char *)a4 + 140);
        self->_currentLocation.rawCoordinate = v19;
        *(_OWORD *)&self->_currentLocation.rawCourse = v20;
        *(_OWORD *)&self->_currentLocation.lifespan = v18;
        sub_10053DD6C(*(void *)&self->_currentLocation.ellipsoidalAltitude, &self->_currentLocation.suitability);
      }

      else
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840E98);
        }
        BOOL v8 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#pla #zone-relevance-tracker stale, older than _currentLocation. Not accepting new location",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101840E98);
          }
          LOWORD(v22[0]) = 0;
          uint64_t v9 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "#pla #zone-relevance-tracker stale, older than _currentLocation. Not accepting new location",  v22,  2,  v22[0]);
LABEL_32:
          uint64_t v11 = (uint8_t *)v9;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n");
LABEL_33:
          if (v11 != buf) {
            free(v11);
          }
        }
      }
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840E98);
      }
      __int16 v12 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "#pla #zone-relevance-tracker invalid lat/lon. Not accepting new location",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840E98);
        }
        LOWORD(v22[0]) = 0;
        uint64_t v9 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "#pla #zone-relevance-tracker invalid lat/lon. Not accepting new location",  v22,  2,  v22[0]);
        goto LABEL_32;
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840E98);
    }
    __int16 v10 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      int v24 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "#pla #zone-relevance-tracker: Unexpected notification: %{public}d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840E98);
      }
      LODWORD(v22[0]) = 67240192;
      HIDWORD(v22[0]) = a3;
      uint64_t v11 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  16LL,  "#pla #zone-relevance-tracker: Unexpected notification: %{public}d",  v22,  8);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n");
      goto LABEL_33;
    }
  }

- (void).cxx_destruct
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((_DWORD *)self + 6) = 0xFFFF;
  *(void *)((char *)self + 36) = 0LL;
  *(void *)((char *)self + 28) = 0LL;
  *(_OWORD *)((char *)self + 44) = xmmword_1012E0070;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)((char *)self + 60) = _Q0;
  *(_OWORD *)((char *)self + 76) = _Q0;
  *(_OWORD *)((char *)self + 92) = _Q0;
  *((_DWORD *)self + 27) = 0;
  *((void *)self + 15) = 0LL;
  *((void *)self + 16) = 0LL;
  *((void *)self + 14) = 0xBFF0000000000000LL;
  *((_DWORD *)self + 34) = 0;
  *(void *)((char *)self + 140) = 0xBFF0000000000000LL;
  *((_DWORD *)self + 37) = 0x7FFFFFFF;
  *((void *)self + 20) = 0LL;
  *((void *)self + 21) = 0LL;
  *((void *)self + 19) = 0LL;
  *((_BYTE *)self + 176) = 0;
  return self;
}

@end