@interface ADStationaryDeviceLocationManager
- (BOOL)isStationaryDeviceCachedLocationAvailable;
- (BOOL)shouldUseStationaryLocation;
- (id)createLocationInUseAssertion;
- (void)_scheduleLocationTimerWithTimeout:(double)a3;
- (void)_startMonitoringLocationWithDesiredAccuracy:(double)a3;
- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4;
- (void)forceLocationUpdateFromCoreLocation;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLastShiftedLocation:(id)a3;
- (void)startLocationUpdateSession;
@end

@implementation ADStationaryDeviceLocationManager

- (void)_startMonitoringLocationWithDesiredAccuracy:(double)a3
{
  v5 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ADStationaryDeviceLocationManager _startMonitoringLocationWithDesiredAccuracy:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  if (-[ADStationaryDeviceLocationManager isStationaryDeviceCachedLocationAvailable]( self,  "isStationaryDeviceCachedLocationAvailable"))
  {
    v6 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[ADStationaryDeviceLocationManager _startMonitoringLocationWithDesiredAccuracy:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s _stationaryDeviceCachedLocation is available, no need to start monitoring location",  buf,  0xCu);
    }

    v7 = self->super._requestOriginCommand;
    if (v7)
    {
      v8 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[ADStationaryDeviceLocationManager _startMonitoringLocationWithDesiredAccuracy:]";
        __int16 v13 = 2112;
        v14 = v7;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Handle outstanding GetRequestOrigin (%@)",  buf,  0x16u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager locationForSnapshot](self, "locationForSnapshot"));
      if (v9) {
        -[ADLocationManager _generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:]( self,  "_generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:",  v7,  v9,  self->super._updateCompletion);
      }
      else {
        -[ADLocationManager _generateLocationUnknownResponseForGetRequestOriginCommand:completion:]( self,  "_generateLocationUnknownResponseForGetRequestOriginCommand:completion:",  v7,  self->super._updateCompletion);
      }
      -[ADLocationManager _clearCompletionState](self, "_clearCompletionState");
    }
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager _startMonitoringLocationWithDesiredAccuracy:]( &v10,  "_startMonitoringLocationWithDesiredAccuracy:",  a3);
  }

- (void)_scheduleLocationTimerWithTimeout:(double)a3
{
  if (-[ADStationaryDeviceLocationManager isStationaryDeviceCachedLocationAvailable]( self,  "isStationaryDeviceCachedLocationAvailable"))
  {
    v5 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[ADStationaryDeviceLocationManager _scheduleLocationTimerWithTimeout:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Cached location available, skipping location timer scheduling as it's not necessary",  buf,  0xCu);
    }
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager _scheduleLocationTimerWithTimeout:](&v6, "_scheduleLocationTimerWithTimeout:", a3);
  }

- (BOOL)shouldUseStationaryLocation
{
  id v2 = +[AFFeatureFlags isStationaryDeviceLocationManagerEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isStationaryDeviceLocationManagerEnabled");
  if ((_DWORD)v2) {
    LOBYTE(v2) = AFIsHorseman(v2);
  }
  return (char)v2;
}

- (BOOL)isStationaryDeviceCachedLocationAvailable
{
  if (!-[ADStationaryDeviceLocationManager shouldUseStationaryLocation](self, "shouldUseStationaryLocation")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager knownLocation](self, "knownLocation"));
  v4 = v3;
  if (v3)
  {
    [v3 coordinate];
    if (v5 != 0.0)
    {
      [v4 coordinate];
      if (v6 != 0.0)
      {
        BOOL v8 = 1;
        goto LABEL_8;
      }
    }

    v7 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315395;
      v11 = "-[ADStationaryDeviceLocationManager isStationaryDeviceCachedLocationAvailable]";
      __int16 v12 = 2113;
      __int16 v13 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Zero latitude or longitude detected: %{private}@",  (uint8_t *)&v10,  0x16u);
    }
  }

  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (void)setLastLocation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[ADStationaryDeviceLocationManager shouldUseStationaryLocation](self, "shouldUseStationaryLocation");
  if (v4 || !v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager setLastLocation:](&v7, "setLastLocation:", v4);
  }

  else
  {
    double v6 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[ADStationaryDeviceLocationManager setLastLocation:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Not resetting lastLocation to nil for stationary device",  buf,  0xCu);
    }
  }
}

- (void)setLastShiftedLocation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[ADStationaryDeviceLocationManager shouldUseStationaryLocation](self, "shouldUseStationaryLocation");
  if (v4 || !v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager setLastShiftedLocation:](&v7, "setLastShiftedLocation:", v4);
  }

  else
  {
    double v6 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[ADStationaryDeviceLocationManager setLastShiftedLocation:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Not resetting lastShiftedLocation to nil for stationary device",  buf,  0xCu);
    }
  }
}

- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ADStationaryDeviceLocationManager shouldUseStationaryLocation](self, "shouldUseStationaryLocation"))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager knownLocation](self, "knownLocation"));
    if (v8)
    {
      internalQueue = (dispatch_queue_s *)self->super._internalQueue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1002E45F4;
      v10[3] = &unk_1004FD990;
      id v12 = v7;
      id v11 = v8;
      dispatch_async(internalQueue, v10);
    }

    else
    {
      v13.receiver = self;
      v13.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
      -[ADLocationManager currentLocationWithFetchRequest:completion:]( &v13,  "currentLocationWithFetchRequest:completion:",  v6,  v7);
    }
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager currentLocationWithFetchRequest:completion:]( &v14,  "currentLocationWithFetchRequest:completion:",  v6,  v7);
  }
}

- (void)startLocationUpdateSession
{
  if (-[ADStationaryDeviceLocationManager isStationaryDeviceCachedLocationAvailable]( self,  "isStationaryDeviceCachedLocationAvailable"))
  {
    v3 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[ADStationaryDeviceLocationManager startLocationUpdateSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Not starting location update session for stationary device, location is already present",  buf,  0xCu);
    }
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager startLocationUpdateSession](&v4, "startLocationUpdateSession");
  }

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
  -[ADLocationManager locationManagerDidChangeAuthorization:](&v7, "locationManagerDidChangeAuthorization:", a3);
  id v4 = -[ADLocationManager currentState](self, "currentState");
  if ((v4 & 1) == 0 || HIDWORD(v4) <= 2)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager setLastLocation:](&v6, "setLastLocation:", 0LL);
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager setLastShiftedLocation:](&v5, "setLastShiftedLocation:", 0LL);
    -[ADLocationManager updateLocationSnapshot](self, "updateLocationSnapshot");
  }

- (id)createLocationInUseAssertion
{
  if (-[ADStationaryDeviceLocationManager isStationaryDeviceCachedLocationAvailable]( self,  "isStationaryDeviceCachedLocationAvailable"))
  {
    return 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
  id v4 = -[ADLocationManager createLocationInUseAssertion](&v5, "createLocationInUseAssertion");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)forceLocationUpdateFromCoreLocation
{
  if (!-[ADStationaryDeviceLocationManager isStationaryDeviceCachedLocationAvailable]( self,  "isStationaryDeviceCachedLocationAvailable"))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___ADStationaryDeviceLocationManager;
    -[ADLocationManager forceLocationUpdateFromCoreLocation](&v3, "forceLocationUpdateFromCoreLocation");
  }

@end