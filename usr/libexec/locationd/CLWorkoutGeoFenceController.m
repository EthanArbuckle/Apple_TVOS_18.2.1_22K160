@interface CLWorkoutGeoFenceController
- (BOOL)isGeoFenceAuthorizedAndPossible;
- (CLRegion)installedRegion;
- (CLWorkoutGeoFenceController)initWithDelegate:(id)a3 withSilo:(id)a4;
- (CLWorkoutGeoFenceControllerDelegate)delegate;
- (NSString)fenceIdentifier;
- (void)cancelTimers;
- (void)dealloc;
- (void)installFenceWithCenter:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)onGeoFenceTimerFire;
- (void)onLocationUpdateTimerFire;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setFenceIdentifier:(id)a3;
- (void)setInstalledRegion:(id)a3;
- (void)startGeoFenceWithRadius:(double)a3;
- (void)stopGeoFence;
- (void)uninstallCurrentFence;
@end

@implementation CLWorkoutGeoFenceController

- (CLWorkoutGeoFenceController)initWithDelegate:(id)a3 withSilo:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLWorkoutGeoFenceController;
  v7 = -[CLWorkoutGeoFenceController init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    -[CLWorkoutGeoFenceController setDelegate:](v7, "setDelegate:", a3);
    v8->_silo = (CLDispatchSilo *)a4;
    -[CLWorkoutGeoFenceController setFenceIdentifier:]( v8,  "setFenceIdentifier:",  @"com.apple.locationd.workout.geofence");
    v8->_regionState = 0LL;
    v8->_authorizationStatus = 0;
    v8->_fenceRadius = 200.0;
    silo = v8->_silo;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100F4D51C;
    v11[3] = &unk_10181A328;
    v11[4] = v8;
    v11[5] = a4;
    -[CLDispatchSilo async:](silo, "async:", v11);
  }

  return v8;
}

- (void)dealloc
{
  if (self->_inWorkout) {
    sub_101279494();
  }
  p_silo = &self->_silo;
  silo = self->_silo;
  v4 = p_silo[1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100F4D680;
  v7[3] = &unk_10181A288;
  v7[4] = v4;
  -[CLDispatchSilo async:](silo, "async:", v7);
  self->_locationManager = 0LL;
  self->_delegate = 0LL;

  self->_silo = 0LL;
  self->_fenceIdentifier = 0LL;

  self->_installedRegion = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLWorkoutGeoFenceController;
  -[CLWorkoutGeoFenceController dealloc](&v6, "dealloc");
}

- (void)startGeoFenceWithRadius:(double)a3
{
  self->_inWorkout = 1;
  self->_fenceRadius = a3;
  if (self->_locationManager
    && -[CLWorkoutGeoFenceController isGeoFenceAuthorizedAndPossible](self, "isGeoFenceAuthorizedAndPossible"))
  {
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v5 = (os_log_s *)qword_101934688;
    if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#gfc Starting geofence", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934680 != -1) {
        dispatch_once(&qword_101934680, &stru_10188DD20);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc Starting geofence",  v13,  2);
      v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController startGeoFenceWithRadius:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[CLWorkoutGeoFenceController uninstallCurrentFence](self, "uninstallCurrentFence");
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    silo = self->_silo;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100F4DC34;
    v12[3] = &unk_10181A288;
    v12[4] = self;
    sub_100F4D9D4((dispatch_source_t *)&self->_locationUpdateTimer, 60LL, silo, v12);
  }

  else
  {
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v7 = (os_log_s *)qword_101934688;
    if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#gfc Could not start geofence, check authorizations",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934680 != -1) {
        dispatch_once(&qword_101934680, &stru_10188DD20);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Could not start geofence, check authorizations",  v13,  2);
      v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController startGeoFenceWithRadius:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

- (void)stopGeoFence
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  v3 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc Stopping geofence", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc Stopping geofence",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController stopGeoFence]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  -[CLWorkoutGeoFenceController uninstallCurrentFence](self, "uninstallCurrentFence");
  -[CLWorkoutGeoFenceController cancelTimers](self, "cancelTimers");
  -[CLWorkoutGeoFenceController reset](self, "reset");
}

- (void)reset
{
  self->_regionState = 0LL;
  *(_DWORD *)&self->_isFenceInstalled = 0;
  -[CLWorkoutGeoFenceController setInstalledRegion:](self, "setInstalledRegion:", 0LL);
}

- (BOOL)isGeoFenceAuthorizedAndPossible
{
  *(void *)&double v3 = objc_opt_class(&OBJC_CLASS___CLCircularRegion).n128_u64[0];
  BOOL result = +[CLLocationManager isMonitoringAvailableForClass:]( &OBJC_CLASS___CLLocationManager,  "isMonitoringAvailableForClass:",  v4,  v3);
  if (self->_authorizationStatus != 4) {
    return 0;
  }
  return result;
}

- (void)uninstallCurrentFence
{
  if (-[CLWorkoutGeoFenceController installedRegion](self, "installedRegion"))
  {
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    double v3 = (os_log_s *)qword_101934688;
    if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#gfc Installed region exists at stop workout, uninstalling",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934680 != -1) {
        dispatch_once(&qword_101934680, &stru_10188DD20);
      }
      v14[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Installed region exists at stop workout, uninstalling",  v14,  2);
      v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController uninstallCurrentFence]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[CLLocationManager stopMonitoringForRegion:]( self->_locationManager,  "stopMonitoringForRegion:",  -[CLWorkoutGeoFenceController installedRegion](self, "installedRegion"));
  }

  else
  {
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    uint64_t v4 = (os_log_s *)qword_101934688;
    if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#gfc Generating temporary region to uninstall just in case",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934680 != -1) {
        dispatch_once(&qword_101934680, &stru_10188DD20);
      }
      v14[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Generating temporary region to uninstall just in case",  v14,  2);
      v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController uninstallCurrentFence]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    v5 = -[CLLocation initWithLatitude:longitude:]( objc_alloc(&OBJC_CLASS___CLLocation),  "initWithLatitude:longitude:",  0.0,  0.0);
    objc_super v6 = objc_alloc(&OBJC_CLASS___CLCircularRegion);
    -[CLLocation coordinate](v5, "coordinate");
    id v9 = -[CLCircularRegion initNearbyAllowedWithCenter:radius:identifier:]( v6,  "initNearbyAllowedWithCenter:radius:identifier:",  -[CLWorkoutGeoFenceController fenceIdentifier](self, "fenceIdentifier"),  v7,  v8,  200.0);
    -[CLLocationManager stopMonitoringForRegion:](self->_locationManager, "stopMonitoringForRegion:", v9);
  }

  *(_WORD *)&self->_isFenceInstalled = 0;
  self->_isMonitoringRegion = 0;
}

- (void)installFenceWithCenter:(id)a3
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  v5 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
  {
    double fenceRadius = self->_fenceRadius;
    *(_DWORD *)buf = 134217984;
    double v17 = fenceRadius;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#gfc Installing fence with radius %f", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    double v11 = self->_fenceRadius;
    int v14 = 134217984;
    double v15 = v11;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc Installing fence with radius %f",  COERCE_DOUBLE(&v14));
    v13 = (uint8_t *)v12;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController installFenceWithCenter:]", "%s\n", v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  double v7 = objc_alloc(&OBJC_CLASS___CLCircularRegion);
  [a3 coordinate];
  id v10 = -[CLCircularRegion initNearbyAllowedWithCenter:radius:identifier:]( v7,  "initNearbyAllowedWithCenter:radius:identifier:",  -[CLWorkoutGeoFenceController fenceIdentifier](self, "fenceIdentifier"),  v8,  v9,  self->_fenceRadius);
  -[CLLocationManager startMonitoringForRegion:](self->_locationManager, "startMonitoringForRegion:", v10);
}

- (void)cancelTimers
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  double v3 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc Canceling all timers", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc Canceling all timers",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController cancelTimers]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  sub_100F4E568((dispatch_source_t *)&self->_geoFenceTimer);
  sub_100F4E568((dispatch_source_t *)&self->_locationUpdateTimer);
}

- (void)onGeoFenceTimerFire
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  double v3 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Timed out fence monitoring", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Timed out fence monitoring",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController onGeoFenceTimerFire]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  sub_100F4E568((dispatch_source_t *)&self->_geoFenceTimer);
  if (self->_inWorkout) {
    -[CLWorkoutGeoFenceControllerDelegate didTimeoutGeoFence]( -[CLWorkoutGeoFenceController delegate](self, "delegate"),  "didTimeoutGeoFence");
  }
}

- (void)onLocationUpdateTimerFire
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  double v3 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Timed out location updates", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Timed out location updates",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController onLocationUpdateTimerFire]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  sub_100F4E568((dispatch_source_t *)&self->_locationUpdateTimer);
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  if (self->_inWorkout)
  {
    id v5 = objc_msgSend(a4, "lastObject", a3);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    objc_super v6 = (os_log_s *)qword_101934688;
    if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v5 timestamp];
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSinceNow");
      *(_DWORD *)buf = 138412546;
      id v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "#gfc Received new location, timestamp %@, time since now %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934680 != -1) {
        dispatch_once(&qword_101934680, &stru_10188DD20);
      }
      uint64_t v12 = qword_101934688;
      id v13 = [v5 timestamp];
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSinceNow");
      int v20 = 138412546;
      id v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  2LL,  "#gfc Received new location, timestamp %@, time since now %f",  &v20,  22);
      v16 = (uint8_t *)v15;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:didUpdateLocations:]",  "%s\n",  v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    if (!self->_isFenceInstalled && !self->_isAttemptingFenceInstall)
    {
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSinceNow");
      if (fabs(v9) < 15.0)
      {
        [v5 horizontalAccuracy];
        if (v10 < kCLLocationAccuracyHundredMeters)
        {
          if (qword_101934680 != -1) {
            dispatch_once(&qword_101934680, &stru_10188DD20);
          }
          double v11 = (os_log_s *)qword_101934688;
          if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "#gfc Attempting to install fence",  buf,  2u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934680 != -1) {
              dispatch_once(&qword_101934680, &stru_10188DD20);
            }
            LOWORD(v20) = 0;
            LODWORD(v19) = 2;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc Attempting to install fence",  &v20,  v19);
            v18 = (uint8_t *)v17;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:didUpdateLocations:]",  "%s\n",  v17);
            if (v18 != buf) {
              free(v18);
            }
          }

          self->_isAttemptingFenceInstall = 1;
          -[CLWorkoutGeoFenceController installFenceWithCenter:](self, "installFenceWithCenter:", v5);
          sub_100F4E568((dispatch_source_t *)&self->_locationUpdateTimer);
          -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
        }
      }
    }
  }

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  id v5 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#gfc Exited fence", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Exited fence",  v8,  2);
    id v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutGeoFenceController locationManager:didExitRegion:]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  if (self->_inWorkout) {
    -[CLWorkoutGeoFenceControllerDelegate didExitGeoFence]( -[CLWorkoutGeoFenceController delegate](self, "delegate"),  "didExitGeoFence");
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  id v5 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#gfc Generic failure with error %@", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    int v8 = 138412290;
    id v9 = a4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Generic failure with error %@",  &v8,  12);
    id v7 = (uint8_t *)v6;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:didFailWithError:]",  "%s\n",  v6);
    if (v7 != buf) {
      free(v7);
    }
  }

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  id v7 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#gfc Monitoring failed with error %@, stopping updates",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    int v10 = 138412290;
    id v11 = a5;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Monitoring failed with error %@, stopping updates",  &v10,  12);
    id v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:monitoringDidFailForRegion:withError:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  if (self->_inWorkout)
  {
    self->_isMonitoringRegion = 0;
    if (!self->_isFenceInstalled) {
      self->_isAttemptingFenceInstall = 0;
    }
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  }

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  objc_super v6 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#gfc Started monitoring", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v11[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Started monitoring",  v11,  2);
    id v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:didStartMonitoringForRegion:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  if (self->_inWorkout)
  {
    -[CLWorkoutGeoFenceController setInstalledRegion:](self, "setInstalledRegion:", a4);
    *(_WORD *)&self->_isFenceInstalled = 1;
    self->_isMonitoringRegion = 1;
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100F4F644;
    v10[3] = &unk_10181A288;
    v10[4] = self;
    sub_100F4D9D4((dispatch_source_t *)&self->_geoFenceTimer, 5400LL, silo, v10);
  }

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  id v7 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#gfc Determined state %ld", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    int v10 = 134217984;
    int64_t v11 = a4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc Determined state %ld",  &v10);
    id v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:didDetermineState:forRegion:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  if (self->_inWorkout) {
    self->_regionState = a4;
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_10188DD20);
  }
  objc_super v6 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#gfc Received auth update %d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    v12[0] = 67109120;
    v12[1] = a4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc Received auth update %d",  v12);
    id v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:didChangeAuthorizationStatus:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  self->_authorizationStatus = a4;
  if (a4 != 4)
  {
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_10188DD20);
    }
    id v7 = (os_log_s *)qword_101934688;
    if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#gfc No longer authorized, stopping geofence",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934680 != -1) {
        dispatch_once(&qword_101934680, &stru_10188DD20);
      }
      LOWORD(v12[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  0LL,  "#gfc No longer authorized, stopping geofence",  v12,  2);
      int64_t v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutGeoFenceController locationManager:didChangeAuthorizationStatus:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[CLWorkoutGeoFenceController stopGeoFence](self, "stopGeoFence");
  }

- (CLWorkoutGeoFenceControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLWorkoutGeoFenceControllerDelegate *)a3;
}

- (NSString)fenceIdentifier
{
  return self->_fenceIdentifier;
}

- (void)setFenceIdentifier:(id)a3
{
}

- (CLRegion)installedRegion
{
  return self->_installedRegion;
}

- (void)setInstalledRegion:(id)a3
{
}

@end