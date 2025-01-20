@interface ADPeerLocationRemote
- (ADPeerLocationRemote)init;
- (BOOL)_hasActiveBestLocationRequest;
- (id)_locationManager;
- (void)_cancelBestLocationTimer;
- (void)_executeBestLocationCompletionWithLocation:(id)a3;
- (void)_executeBestLocationCompletionWithLocation:(id)a3 error:(id)a4;
- (void)_executeBestLocationCompletionWithLocationErrorWithCode:(int64_t)a3;
- (void)_getBestLocationWithCompletion:(id)a3;
- (void)_startBestLocationTimer;
- (void)_startUpdatingLocation;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidPauseLocationUpdates:(id)a3;
- (void)locationManagerDidResumeLocationUpdates:(id)a3;
- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5;
@end

@implementation ADPeerLocationRemote

- (ADPeerLocationRemote)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADPeerLocationRemote;
  v2 = -[ADPeerLocationRemote init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADPeerLocationRemote", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = [[ADPeerConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.location" forRequests:j__objc_msgSend__ADPBLocationRequestType requireConnectedPeer:1];
    peerConnection = v2->_peerConnection;
    v2->_peerConnection = v7;

    -[ADPeerConnection setDelegate:forRequestTypes:]( v2->_peerConnection,  "setDelegate:forRequestTypes:",  v2,  sub_10029EEC8);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADPeerLocationRemote;
  -[ADPeerLocationRemote dealloc](&v3, "dealloc");
}

- (id)_locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = objc_alloc(&OBJC_CLASS___CLLocationManager);
    uint64_t v5 = AFEffectiveSiriBundleForLocation();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[CLLocationManager initWithEffectiveBundle:delegate:onQueue:]( v4,  "initWithEffectiveBundle:delegate:onQueue:",  v6,  self,  self->_queue);
    v8 = self->_locationManager;
    self->_locationManager = v7;

    -[CLLocationManager registerAsLocationClient](self->_locationManager, "registerAsLocationClient");
    -[CLLocationManager setDesiredAccuracy:]( self->_locationManager,  "setDesiredAccuracy:",  kCLLocationAccuracyKilometer);
    locationManager = self->_locationManager;
  }

  return locationManager;
}

- (void)_startBestLocationTimer
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADPeerLocationRemote _startBestLocationTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  bestLocationTimer = self->_bestLocationTimer;
  self->_bestLocationTimer = v4;

  v6 = self->_bestLocationTimer;
  dispatch_time_t v7 = dispatch_time(0LL, 2000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  v8 = self->_bestLocationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001103AC;
  handler[3] = &unk_1004FD940;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  dispatch_resume((dispatch_object_t)self->_bestLocationTimer);
}

- (void)_cancelBestLocationTimer
{
  bestLocationTimer = self->_bestLocationTimer;
  if (bestLocationTimer)
  {
    v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      dispatch_time_t v7 = "-[ADPeerLocationRemote _cancelBestLocationTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
      bestLocationTimer = self->_bestLocationTimer;
    }

    dispatch_source_cancel((dispatch_source_t)bestLocationTimer);
    uint64_t v5 = self->_bestLocationTimer;
    self->_bestLocationTimer = 0LL;
  }

- (void)_startUpdatingLocation
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADPeerLocationRemote _startUpdatingLocation]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s starting location updates",  (uint8_t *)&v5,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerLocationRemote _locationManager](self, "_locationManager"));
  [v4 startUpdatingLocation];
}

- (BOOL)_hasActiveBestLocationRequest
{
  return self->_bestLocationCompletion != 0LL;
}

- (void)_getBestLocationWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001100DC;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_executeBestLocationCompletionWithLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315651;
    v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
    __int16 v20 = 2113;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %{private}@ %@", (uint8_t *)&v18, 0x20u);
  }

  -[ADPeerLocationRemote _cancelBestLocationTimer](self, "_cancelBestLocationTimer");
  v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s stopping location updates",  (uint8_t *)&v18,  0xCu);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerLocationRemote _locationManager](self, "_locationManager"));
  [v10 stopUpdatingLocation];

  unsigned int v11 = -[ADPeerLocationRemote _hasActiveBestLocationRequest](self, "_hasActiveBestLocationRequest");
  v12 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v13 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      int v18 = 136315138;
      v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s has active request; calling completion",
        (uint8_t *)&v18,
        0xCu);
    }

    if (v6)
    {
      v14 = objc_alloc_init(&OBJC_CLASS____ADPBLocationSetPeerLocationRequest);
      -[_ADPBLocationSetPeerLocationRequest ad_setLocation:](v14, "ad_setLocation:", v6);
    }

    else
    {
      v14 = 0LL;
    }

    (*((void (**)(void))self->_bestLocationCompletion + 2))();
    id bestLocationCompletion = self->_bestLocationCompletion;
    self->_id bestLocationCompletion = 0LL;

    id locationInUseAssertion = self->_locationInUseAssertion;
    if (locationInUseAssertion)
    {
      v17 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s ADPeerLocationRemote: location found for peer",  (uint8_t *)&v18,  0xCu);
        id locationInUseAssertion = self->_locationInUseAssertion;
      }

      self->_id locationInUseAssertion = 0LL;
    }
  }

  else if (v13)
  {
    int v18 = 136315138;
    v19 = "-[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s no active request", (uint8_t *)&v18, 0xCu);
  }
}

- (void)_executeBestLocationCompletionWithLocation:(id)a3
{
}

- (void)_executeBestLocationCompletionWithLocationErrorWithCode:(int64_t)a3
{
  id v4 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.siri.location.Error",  a3,  &__NSDictionary0__struct);
  -[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]( self,  "_executeBestLocationCompletionWithLocation:error:",  0LL,  v4);
}

- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    unsigned int v11 = "-[ADPeerLocationRemote peerConnection:handlePBSubclass:completion:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v7, "_ad_performWithPeerLocationManagerRemote:completion:", self, v8);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lastObject", a3));
  id v6 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315395;
    id v8 = "-[ADPeerLocationRemote locationManager:didUpdateLocations:]";
    __int16 v9 = 2113;
    int v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s updated location %{private}@",  (uint8_t *)&v7,  0x16u);
  }

  -[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:]( self,  "_executeBestLocationCompletionWithLocation:",  v5);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[ADPeerLocationRemote locationManager:didFailWithError:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[ADPeerLocationRemote _executeBestLocationCompletionWithLocation:error:]( self,  "_executeBestLocationCompletionWithLocation:error:",  0LL,  v5);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    __int16 v12 = "-[ADPeerLocationRemote locationManager:didChangeAuthorizationStatus:]";
    __int16 v13 = 1024;
    int v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v11, 0x12u);
  }

  int IsAllowed = AFLocationStatusIsAllowed(v4);
  if (-[ADPeerLocationRemote _hasActiveBestLocationRequest](self, "_hasActiveBestLocationRequest"))
  {
    __int16 v9 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (IsAllowed)
    {
      if (v10)
      {
        int v11 = 136315138;
        __int16 v12 = "-[ADPeerLocationRemote locationManager:didChangeAuthorizationStatus:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s authorized with active request; starting location updates",
          (uint8_t *)&v11,
          0xCu);
      }

      -[ADPeerLocationRemote _startUpdatingLocation](self, "_startUpdatingLocation");
    }

    else
    {
      if (v10)
      {
        int v11 = 136315138;
        __int16 v12 = "-[ADPeerLocationRemote locationManager:didChangeAuthorizationStatus:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s not authorized with active request; failing with error",
          (uint8_t *)&v11,
          0xCu);
      }

      -[ADPeerLocationRemote _executeBestLocationCompletionWithLocationErrorWithCode:]( self,  "_executeBestLocationCompletionWithLocationErrorWithCode:",  100LL);
    }
  }
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADPeerLocationRemote locationManagerDidPauseLocationUpdates:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADPeerLocationRemote locationManagerDidResumeLocationUpdates:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

- (void).cxx_destruct
{
}

@end