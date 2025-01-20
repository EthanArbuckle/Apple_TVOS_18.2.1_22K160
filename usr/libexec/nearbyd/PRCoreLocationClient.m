@interface PRCoreLocationClient
- (BOOL)dowgradeToBystanderMonitoring;
- (BOOL)isMonitoringLocation;
- (BOOL)startMonitoring;
- (BOOL)stopMonitoring;
- (BOOL)upgradeToBestAccuracyMonitoring;
- (CLLocation)location;
- (PRCoreLocationClient)initWithQueue:(id)a3;
- (id)regulatoryLocationAuthorized;
- (id)regulatoryLocationHandler;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setLocation:(id)a3;
- (void)setRegulatoryLocationAuthorized:(id)a3;
- (void)setRegulatoryLocationHandler:(id)a3;
- (void)updateLocationAuthorized;
@end

@implementation PRCoreLocationClient

- (PRCoreLocationClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PRCoreLocationClient;
  v6 = -[PRCoreLocationClient init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( objc_alloc(&OBJC_CLASS___CLLocationManager),  "initWithEffectiveBundlePath:delegate:onQueue:",  @"/System/Library/LocationBundles/UWBRegulatory.bundle",  v7,  v5);
    manager = v7->_manager;
    v7->_manager = v8;

    -[CLLocationManager setDesiredAccuracy:](v7->_manager, "setDesiredAccuracy:", 2147483650.0);
    *(_WORD *)&v7->_isMonitoringLocation = 0;
  }

  return v7;
}

- (BOOL)startMonitoring
{
  manager = self->_manager;
  v4 = (os_log_s *)qword_1007FC190;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG);
  if (manager)
  {
    if (v5) {
      sub_1003A2D70((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
    }
    if (self->_isMonitoringLocation)
    {
      if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG)) {
        sub_1003A2D44();
      }
    }

    else
    {
      self->_isMonitoringLocation = 1;
      -[CLLocationManager startUpdatingLocation](self->_manager, "startUpdatingLocation");
      if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG)) {
        sub_1003A2D18();
      }
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100267790;
      block[3] = &unk_1007A3000;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }

  else if (v5)
  {
    sub_1003A2DD8();
  }

  return manager != 0LL;
}

- (BOOL)stopMonitoring
{
  manager = self->_manager;
  if (manager)
  {
    if (self->_isMonitoringLocation)
    {
      self->_isMonitoringLocation = 0;
      -[CLLocationManager stopUpdatingLocation](manager, "stopUpdatingLocation");
      if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG)) {
        sub_1003A2E30();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG))
    {
      sub_1003A2E04();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG))
  {
    sub_1003A2E5C();
  }

  return manager != 0LL;
}

- (BOOL)upgradeToBestAccuracyMonitoring
{
  manager = self->_manager;
  if (manager)
  {
    -[CLLocationManager setDesiredAccuracy:](self->_manager, "setDesiredAccuracy:", -1.0);
    if (self->_isMonitoringLocation)
    {
      -[PRCoreLocationClient stopMonitoring](self, "stopMonitoring");
      -[PRCoreLocationClient startMonitoring](self, "startMonitoring");
    }

    else if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG))
    {
      sub_1003A2E88();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG))
  {
    sub_1003A2EB4();
  }

  return manager != 0LL;
}

- (BOOL)dowgradeToBystanderMonitoring
{
  manager = self->_manager;
  if (manager)
  {
    -[CLLocationManager setDesiredAccuracy:](self->_manager, "setDesiredAccuracy:", 2147483650.0);
    if (self->_isMonitoringLocation)
    {
      -[PRCoreLocationClient stopMonitoring](self, "stopMonitoring");
      -[PRCoreLocationClient startMonitoring](self, "startMonitoring");
    }

    else if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG))
    {
      sub_1003A2EE0();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG))
  {
    sub_1003A2F0C();
  }

  return manager != 0LL;
}

- (void)updateLocationAuthorized
{
  regulatoryLocationAuthorized = (void (**)(id, BOOL))self->_regulatoryLocationAuthorized;
  if (regulatoryLocationAuthorized) {
    regulatoryLocationAuthorized[2](regulatoryLocationAuthorized, self->_isLocationAuthorized);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v22 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    -[PRCoreLocationClient setLocation:](self, "setLocation:", v6);
    if (self->_regulatoryLocationHandler)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      [v7 coordinate];
      double v9 = v8;

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      [v10 coordinate];
      double v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      [v13 altitude];
      double v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      [v16 horizontalAccuracy];
      double v18 = v17;

      regulatoryLocationHandler = (void (**)(id, void, double, double, double, double, double))self->_regulatoryLocationHandler;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
      [v20 timeIntervalSinceReferenceDate];
      regulatoryLocationHandler[2](regulatoryLocationHandler, 0LL, v9, v12, v15, v18, v21);
    }

    id v5 = v22;
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = (os_log_s *)qword_1007FC190;
  if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG)) {
    sub_1003A2F38((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = (os_log_s *)qword_1007FC190;
  if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG)) {
    sub_1003A2FC8(v4, v7, v8, v9, v10, v11, v12, v13);
  }
  BOOL v15 = (_DWORD)v4 == 3 || (_DWORD)v4 == 0;
  self->_isLocationAuthorized = v15;
  if (self->_isMonitoringLocation)
  {
    -[PRCoreLocationClient updateLocationAuthorized](self, "updateLocationAuthorized");
  }

  else if (os_log_type_enabled((os_log_t)qword_1007FC190, OS_LOG_TYPE_DEBUG))
  {
    sub_1003A2F9C();
  }
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLocation:(id)a3
{
}

- (BOOL)isMonitoringLocation
{
  return self->_isMonitoringLocation;
}

- (id)regulatoryLocationHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRegulatoryLocationHandler:(id)a3
{
}

- (id)regulatoryLocationAuthorized
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRegulatoryLocationAuthorized:(id)a3
{
}

- (void).cxx_destruct
{
}

@end