@interface NSPPrivacyProxyLocationMonitor
+ (id)sharedMonitor;
- (BOOL)checkSignificantLocationChange:(id)a3;
- (BOOL)isAuthorized;
- (BOOL)isCoreWLANAuthorized;
- (NSPPrivacyProxyLocationMonitor)init;
- (NSPPrivacyProxyLocationMonitorDelegate)delegate;
- (NSString)currentCountryPlusTimezone;
- (id)geohashFromLocation:(id)a3;
- (void)handleLocationUpdate:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)refreshCountryPlusTimezone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastCountryPlusTimezone:(id)a3;
- (void)setLastGeohash:(id)a3;
- (void)setMonitorTimeInterval:(double)a3;
- (void)setUserEventAgentTimer;
- (void)start;
- (void)startLocationMonitor;
- (void)stop;
- (void)stopLocationMonitor;
@end

@implementation NSPPrivacyProxyLocationMonitor

+ (id)sharedMonitor
{
  if (qword_1001170B0 != -1) {
    dispatch_once(&qword_1001170B0, &stru_1000F93B0);
  }
  return (id)qword_1001170A8;
}

- (NSPPrivacyProxyLocationMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSPPrivacyProxyLocationMonitor;
  v2 = -[NSPPrivacyProxyLocationMonitor init](&v19, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isMonitoringEnabled = 0;
    locationMonitorTimer = v2->_locationMonitorTimer;
    v2->_locationMonitorTimer = 0LL;

    objc_setProperty_atomic(v3, v5, 0LL, 32LL);
    -[NSPPrivacyProxyLocationMonitor setDelegate:](v3, "setDelegate:", 0LL);
    -[NSPPrivacyProxyLocationMonitor setMonitorTimeInterval:](v3, "setMonitorTimeInterval:", 1800.0);
    v6 = objc_alloc(&OBJC_CLASS___CLLocationManager);
    uint64_t v7 = NPGetInternalQueue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( v6,  "initWithEffectiveBundlePath:delegate:onQueue:",  @"/System/Library/LocationBundles/NetworkServiceProxy.framework",  v3,  v8);
    clLocationManager = v3->_clLocationManager;
    v3->_clLocationManager = v9;

    uint64_t v14 = nplog_obj(v11, v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      unsigned int v16 = -[NSPPrivacyProxyLocationMonitor isAuthorized](v3, "isAuthorized");
      v17 = "is not";
      if (v16) {
        v17 = "is";
      }
      *(_DWORD *)buf = 138412546;
      v21 = v3;
      __int16 v22 = 2080;
      v23 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%@: networkserviceproxy %s authorized to access location",  buf,  0x16u);
    }

    -[CLLocationManager setDesiredAccuracy:](v3->_clLocationManager, "setDesiredAccuracy:", kCLLocationAccuracyReduced);
  }

  return v3;
}

- (id)geohashFromLocation:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  [v3 coordinate];
  double v5 = v4;
  [v3 coordinate];

  uint64_t v6 = latitudeLongitudeToGeohash(4LL, v5);
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

- (void)refreshCountryPlusTimezone:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  if (!v6)
  {
    uint64_t v15 = nplog_obj(0LL, v4, v5);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v19 = "-[NSPPrivacyProxyLocationMonitor refreshCountryPlusTimezone:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null completion",  buf,  0xCu);
    }

    goto LABEL_12;
  }

  if (self)
  {
    if (!objc_getProperty(self, v4, 40LL, 1))
    {
      v8 = (os_log_s *)objc_getProperty(self, v7, 32LL, 1);
      if (v8)
      {
        v9 = v8;
        uint64_t v12 = objc_alloc_init(&OBJC_CLASS___CLGeocoder);
        if (v12)
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_100007194;
          v16[3] = &unk_1000F93D8;
          v16[4] = self;
          v17 = v6;
          -[CLGeocoder reverseGeocodeLocation:completionHandler:]( v12,  "reverseGeocodeLocation:completionHandler:",  v9,  v16);
        }

        else
        {
          uint64_t v13 = nplog_obj(0LL, v10, v11);
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to initialize geocoder",  buf,  2u);
          }

          v6[2](v6);
        }

LABEL_12:
        goto LABEL_13;
      }
    }
  }

  v6[2](v6);
LABEL_13:
}

- (NSString)currentCountryPlusTimezone
{
  if (self) {
    self = (NSPPrivacyProxyLocationMonitor *)objc_getProperty(self, a2, 40LL, 1);
  }
  return (NSString *)self;
}

- (void)startLocationMonitor
{
  if (self)
  {
    if (self->_isMonitoringEnabled)
    {
      BOOL v3 = -[NSPPrivacyProxyLocationMonitor isAuthorized](self, "isAuthorized");
      if (v3 && !self->_locationMonitorTimer)
      {
        uint64_t v6 = nplog_obj(v3, v4, v5);
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = self;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: starting location monitoring", buf, 0xCu);
        }

        -[CLLocationManager requestLocation](self->_clLocationManager, "requestLocation");
        double monitorTimeInterval = self->_monitorTimeInterval;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10000750C;
        v11[3] = &unk_1000F9400;
        v11[4] = self;
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  1LL,  v11,  monitorTimeInterval));
        objc_storeStrong((id *)&self->_locationMonitorTimer, v9);

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        [v10 addTimer:self->_locationMonitorTimer forMode:NSDefaultRunLoopMode];

        -[NSPPrivacyProxyLocationMonitor setUserEventAgentTimer](self, "setUserEventAgentTimer");
      }
    }
  }

- (void)start
{
  v2 = self;
  if (self)
  {
    self->_isMonitoringEnabled = 1;
    self = (NSPPrivacyProxyLocationMonitor *)self->_clLocationManager;
  }

  -[NSPPrivacyProxyLocationMonitor setDelegate:](self, "setDelegate:", v2);
  objc_opt_self(&OBJC_CLASS___NSPPrivacyProxyLocationMonitor);
  BOOL v3 = (void *)CFPreferencesCopyAppValue(@"NSPLastGeohash", kCFPreferencesCurrentApplication);
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  -[NSPPrivacyProxyLocationMonitor setLastGeohash:](v2, "setLastGeohash:", v5);
  -[NSPPrivacyProxyLocationMonitor startLocationMonitor](v2, "startLocationMonitor");
}

- (void)stopLocationMonitor
{
  if (self && self->_locationMonitorTimer)
  {
    uint64_t v4 = nplog_obj(self, a2, v2);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%@: stopping location monitoring",  (uint8_t *)&v6,  0xCu);
    }

    -[NSTimer invalidate](self->_locationMonitorTimer, "invalidate");
    sub_100006F58((uint64_t)self, 0LL);
  }

- (void)stop
{
  if (self)
  {
    objc_setProperty_atomic(self, v3, 0LL, 32LL);
    -[NSPPrivacyProxyLocationMonitor setLastGeohash:](self, "setLastGeohash:", 0LL);
    objc_setProperty_atomic(self, v4, 0LL, 40LL);
    -[CLLocationManager setDelegate:](self->_clLocationManager, "setDelegate:", 0LL);
    self->_isMonitoringEnabled = 0;
  }

  else
  {
    [0 setLastGeohash:0];
    [0 setDelegate:0];
  }

- (BOOL)isCoreWLANAuthorized
{
  return 0;
}

- (BOOL)isAuthorized
{
  return +[CLLocationManager authorizationStatusForBundlePath:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundlePath:",  @"/System/Library/LocationBundles/NetworkServiceProxy.framework")
       - 3 < 2;
}

- (void)setMonitorTimeInterval:(double)a3
{
  if (a3 >= 60.0 && a3 <= 1800.0)
  {
    uint64_t v6 = nplog_obj(self, a2, v3);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412546;
      v9 = self;
      __int16 v10 = 2048;
      double v11 = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@: location monitoring interval changed to %lf",  (uint8_t *)&v8,  0x16u);
    }

    self->_double monitorTimeInterval = a3;
    -[NSPPrivacyProxyLocationMonitor stopLocationMonitor](self, "stopLocationMonitor");
    -[NSPPrivacyProxyLocationMonitor startLocationMonitor](self, "startLocationMonitor");
  }

- (void)setLastGeohash:(id)a3
{
}

- (void)setLastCountryPlusTimezone:(id)a3
{
}

- (void)setUserEventAgentTimer
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = sub_1000079E0;
  v6[4] = sub_1000079F0;
  id v7 = (id)os_transaction_create("com.apple.networkserviceproxy.resetUEADates");
  uint64_t v3 = NPGetInternalQueue(v7);
  SEL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000079F8;
  v5[3] = &unk_1000F9428;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(v4, v5);

  _Block_object_dispose(v6, 8);
}

- (BOOL)checkSignificantLocationChange:(id)a3
{
  id v4 = a3;
  BOOL v9 = 0;
  if (self)
  {
    lastGeohash = self->_lastGeohash;
    if (lastGeohash)
    {
      uint64_t v6 = lastGeohash;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 0, 2));
      unsigned int v8 = -[NSString hasPrefix:](v6, "hasPrefix:", v7);

      if (!v8) {
        BOOL v9 = 1;
      }
    }
  }

  return v9;
}

- (void)handleLocationUpdate:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_setProperty_atomic(self, v4, v5, 32LL);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyLocationMonitor geohashFromLocation:](self, "geohashFromLocation:", v5));
  id v7 = v6;
  if (v6 && ([v6 isEqualToString:self->_lastGeohash] & 1) == 0)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyLocationMonitor delegate](self, "delegate"));

    if (v8)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyLocationMonitor delegate](self, "delegate"));
      [v9 didUpdateGeohash:v7];
    }

    id v10 = v7;
    objc_opt_self(&OBJC_CLASS___NSPPrivacyProxyLocationMonitor);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      CFPreferencesSetAppValue(@"NSPLastGeohash", v10, kCFPreferencesCurrentApplication);
      uint64_t v12 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
      if (!(_DWORD)v12)
      {
        uint64_t v15 = nplog_obj(v12, v13, v14);
        unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to store Geohash to preferences",  buf,  2u);
        }
      }
    }

    v17 = self->_lastGeohash;
    if (!v17
      || (v20 = v17,
          unsigned int v21 = -[NSPPrivacyProxyLocationMonitor checkSignificantLocationChange:]( self,  "checkSignificantLocationChange:",  v10),  v20,  v21))
    {
      uint64_t v22 = nplog_obj(v17, v18, v19);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@: location changed significantly",  buf,  0xCu);
      }

      objc_setProperty_atomic(self, v24, 0LL, 40LL);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100007D58;
      v25[3] = &unk_1000F9450;
      v25[4] = self;
      -[NSPPrivacyProxyLocationMonitor refreshCountryPlusTimezone:](self, "refreshCountryPlusTimezone:", v25);
    }

    -[NSPPrivacyProxyLocationMonitor setLastGeohash:](self, "setLastGeohash:", v10);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = -[NSPPrivacyProxyLocationMonitor isAuthorized](self, "isAuthorized");
    id v7 = "unauthorized";
    if (v6) {
      id v7 = "authorized";
    }
    int v8 = 138412546;
    BOOL v9 = self;
    __int16 v10 = 2080;
    uint64_t v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%@: received location authorization status update: [%s]",  (uint8_t *)&v8,  0x16u);
  }

  if (-[NSPPrivacyProxyLocationMonitor isAuthorized](self, "isAuthorized")) {
    -[NSPPrivacyProxyLocationMonitor startLocationMonitor](self, "startLocationMonitor");
  }
  else {
    -[NSPPrivacyProxyLocationMonitor stopLocationMonitor](self, "stopLocationMonitor");
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v8 = nplog_obj(v5, v6, v7);
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@: failed with error: %@",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = nplog_obj(v7, v8, v9);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@: received location update",  (uint8_t *)&buf,  0xCu);
  }

  if (v7 && [v7 count])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000LL;
    v20 = sub_1000079E0;
    unsigned int v21 = sub_1000079F0;
    id v22 = (id)os_transaction_create("com.apple.networkserviceproxy.didUpdateLocations");
    uint64_t v12 = NPGetInternalQueue(v22);
    __int16 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100008134;
    block[3] = &unk_1000F9320;
    id v15 = v7;
    unsigned int v16 = self;
    p___int128 buf = &buf;
    dispatch_async(v13, block);

    _Block_object_dispose(&buf, 8);
  }
}

- (NSPPrivacyProxyLocationMonitorDelegate)delegate
{
  return (NSPPrivacyProxyLocationMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end