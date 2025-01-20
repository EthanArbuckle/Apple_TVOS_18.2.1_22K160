@interface ADLocationManager
+ (void)prepareForAssistantEnablementInBackground;
- (ADLocationManager)initWithSerialQueue:(id)a3;
- (ADLocationManagerDelegate)delegate;
- (ADLocationManagerState)currentState;
- (BOOL)_locationUpdateIsCapableOfSucceeding;
- (BOOL)allowAdHocSendingLocationToServer;
- (BOOL)doNotClearLocationManagerDelegateForUnitTests;
- (BOOL)isNavigating;
- (BOOL)needsToSendLocation;
- (BOOL)shouldEndLocationUpdateSession;
- (BOOL)shouldSendLocationToServer:(id)a3 forAceCommand:(id)a4;
- (CLLocation)knownLocation;
- (CLLocation)lastLocation;
- (CLLocation)lastShiftedLocation;
- (CLLocation)locationSentToServer;
- (id)_locationManager;
- (id)_locationShifter;
- (id)_peerLocationConnection;
- (id)createCurrentLocationSnapshot;
- (id)createLocationInUseAssertion;
- (id)createSetRequestOrigin;
- (id)locationForSnapshot;
- (id)shiftLocationUsingCachedShifterFunction:(id)a3;
- (void)_cancelLocationSLATimer;
- (void)_cancelLocationTimer;
- (void)_clearCompletionState;
- (void)_dismissTCCDialogIfNeeded;
- (void)_generateLocationDeniedResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationDisabledResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationTimedOutResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationUnknownResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationWiFiOffResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withStatus:(id)a4 completion:(id)a5;
- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withUnshiftedLocation:(id)a4 completion:(id)a5;
- (void)_processUpdatedLocation:(id)a3;
- (void)_requestLocationForGetRequestOrigin:(id)a3 completion:(id)a4;
- (void)_requestLocationWithBestAccuracy;
- (void)_scheduleLocationSLATimer;
- (void)_scheduleLocationTimerWithTimeout:(double)a3;
- (void)_startMonitoringLocationForGetRequestOrigin:(id)a3 completion:(id)a4;
- (void)_startMonitoringLocationWithDesiredAccuracy:(double)a3;
- (void)_triggerLocationABCForSubtype:(id)a3;
- (void)cancelLocationUpdateSessionTeardown;
- (void)currentAuthorizationStyle:(id)a3;
- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5;
- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissTCCDialogIfNeeded:(id)a3;
- (void)dismissedAllVisibleAssistantUIForReason:(id)a3;
- (void)drainAuthorizationRequestCompletionsWithPossibleError:(id)a3;
- (void)drainLocationFetchRequestsWithPossibleError:(id)a3;
- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5;
- (void)endLocationUpdateSessionIfNeeded;
- (void)fetchLocationAuthorization:(id)a3;
- (void)forceLocationUpdateFromCoreLocation;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)navStatusChanged:(id)a3;
- (void)peerLocationConnection:(id)a3 didReceiveUnsolicitedLocation:(id)a4;
- (void)peerLocationConnectionSuggestsClearingCachedLocation:(id)a3;
- (void)prefetchCurrentLocation;
- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)scheduleAuthorizationRequestTimeoutForCompletionBlock:(id)a3 timeout:(double)a4;
- (void)scheduleLocationFetchRequestTimeoutForRequest:(id)a3 timeout:(double)a4;
- (void)scheduleLocationUpdateSessionTeardown;
- (void)sendTemporaryAccuracyAuthorizationRequestWithTimeout:(double)a3 completion:(id)a4;
- (void)setAllowAdHocSendingLocationToServer:(BOOL)a3;
- (void)setCurrentState:(ADLocationManagerState)a3;
- (void)setDelegate:(id)a3;
- (void)setDoNotClearLocationManagerDelegateForUnitTests:(BOOL)a3;
- (void)setIsNavigating:(BOOL)a3;
- (void)setLastLocation:(id)a3;
- (void)setLastShiftedLocation:(id)a3;
- (void)setLocationSentToServer:(id)a3;
- (void)setNeedsToSendLocation:(BOOL)a3;
- (void)shiftLocation:(id)a3 completion:(id)a4;
- (void)shiftLocationWithTimeout:(id)a3 timeoutHandler:(id)a4 completion:(id)a5;
- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4;
- (void)startLocationPrefetchRoutine;
- (void)startLocationUpdateSession;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)updateLocationForCommand:(id)a3 completion:(id)a4;
- (void)updateLocationSnapshot;
- (void)updateLocationSnapshotWithCompletion:(id)a3;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5;
- (void)upgradeAccuracyIfNeeded:(double)a3;
@end

@implementation ADLocationManager

- (void)fetchLocationAuthorization:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    v7 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
    {
      v11 = v7;
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 136315394;
      v19 = "-[ADLocationManager fetchLocationAuthorization:]";
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Fetching location authorization via %@ is not supported when location service prompting feature is enabled",  buf,  0x16u);

      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_4;
    }

    if (v6)
    {
LABEL_4:
      internalQueue = (dispatch_queue_s *)self->_internalQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100186E54;
      block[3] = &unk_1004FC838;
      id v17 = v6;
      dispatch_async(internalQueue, block);
      v9 = v17;
LABEL_7:
    }
  }

  else if (v5)
  {
    v10 = (dispatch_queue_s *)self->_internalQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100186E68;
    v14[3] = &unk_1004FD990;
    v14[4] = self;
    id v15 = v5;
    dispatch_async(v10, v14);
    v9 = v15;
    goto LABEL_7;
  }

- (ADLocationManager)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___ADLocationManager;
  id v6 = -[ADLocationManager init](&v41, "init");
  if (v6)
  {
    v7 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[ADLocationManager initWithSerialQueue:]";
      __int16 v44 = 2048;
      id v45 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }

    dispatch_group_t v8 = dispatch_group_create();
    v9 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v8;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 12));
    *((void *)v6 + 19) = 0LL;
    *((_DWORD *)v6 + 40) = 0;
    *((_BYTE *)v6 + 195) = 1;
    objc_storeStrong((id *)v6 + 6, a3);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);

    dispatch_queue_t v15 = dispatch_queue_create("ADLocationManager", v14);
    v16 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v15;

    *((_BYTE *)v6 + 193) = 1;
    *((_BYTE *)v6 + 194) = AFMapsNavigationStatusIsActive();
    id v17 = objc_opt_new(&OBJC_CLASS___ADGreenTeaLogger);
    v18 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:v6 selector:"navStatusChanged:" name:AFPreferencesNavStatusDidChangeNotification object:0];

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextDonationService defaultService](&OBJC_CLASS___AFContextDonationService, "defaultService"));
    [v20 registerContextTransformer:v6 forType:AFDeviceContextKeyLocation];

    id v21 = *((id *)v6 + 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100186D20;
    v39[3] = &unk_1004FBBD0;
    id v40 = v21;
    id v23 = v21;
    [v22 addQueue:v23 heartBeatInterval:v39 timeoutInterval:5.0 timeoutHandler:5.0];

    *((_BYTE *)v6 + 128) = +[AFFeatureFlags isSiriLocationServicesPromptingEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriLocationServicesPromptingEnabled");
    *((_BYTE *)v6 + 224) = 0;
    *((_DWORD *)v6 + 57) = 0;
    *((void *)v6 + 29) = 0LL;
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v25 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v27 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v26;

    *((void *)v6 + 23) = 0LL;
    v28 = (dispatch_queue_s *)*((void *)v6 + 1);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100186E38;
    v37[3] = &unk_1004FD940;
    v29 = (CLLocationAccuracy *)v6;
    v38 = v29;
    dispatch_async(v28, v37);
    v29[21] = kCLLocationAccuracyThreeKilometers;
    uint64_t v32 = AFIsHorseman(v30, v31);
    if ((_DWORD)v32 && (AFHasGPS(v32, v33, v34, v35) & 1) == 0) {
      v29[21] = kCLLocationAccuracyHundredMeters;
    }
  }

  return (ADLocationManager *)v6;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ADLocationManager dealloc]";
    __int16 v10 = 2048;
    dispatch_queue_attr_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFLocationServiceErrorDomain,  0LL,  0LL));
  -[ADLocationManager drainAuthorizationRequestCompletionsWithPossibleError:]( self,  "drainAuthorizationRequestCompletionsWithPossibleError:",  v4);
  -[ADLocationManager drainLocationFetchRequestsWithPossibleError:]( self,  "drainLocationFetchRequestsWithPossibleError:",  v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:AFPreferencesNavStatusDidChangeNotification object:0];

  if (!self->_doNotClearLocationManagerDelegateForUnitTests) {
    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0LL);
  }
  -[ADLocationManager _cancelLocationTimer](self, "_cancelLocationTimer");
  locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
  if (locationUpdateSessionTeardownTimer) {
    dispatch_source_cancel((dispatch_source_t)locationUpdateSessionTeardownTimer);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADLocationManager;
  -[ADLocationManager dealloc](&v7, "dealloc");
}

- (CLLocation)knownLocation
{
  if (self->_isSiriLocationServicesPromptingEnabled) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager lastShiftedLocation](self, "lastShiftedLocation"));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager lastLocation](self, "lastLocation"));
  }
  return (CLLocation *)v2;
}

- (CLLocation)lastLocation
{
  p_lastLocationLock = &self->_lastLocationLock;
  os_unfair_lock_lock(&self->_lastLocationLock);
  id v4 = -[CLLocation copy](self->_lastLocation, "copy");
  os_unfair_lock_unlock(p_lastLocationLock);
  return (CLLocation *)v4;
}

- (void)setLastLocation:(id)a3
{
  p_lastLocationLock = &self->_lastLocationLock;
  id v5 = a3;
  os_unfair_lock_lock(p_lastLocationLock);
  id v6 = (CLLocation *)[v5 copy];

  lastLocation = self->_lastLocation;
  self->_lastLocation = v6;

  os_unfair_lock_unlock(p_lastLocationLock);
}

- (CLLocation)lastShiftedLocation
{
  p_lastShiftedLocationLock = &self->_lastShiftedLocationLock;
  os_unfair_lock_lock(&self->_lastShiftedLocationLock);
  id v4 = -[CLLocation copy](self->_lastShiftedLocation, "copy");
  os_unfair_lock_unlock(p_lastShiftedLocationLock);
  return (CLLocation *)v4;
}

- (void)setLastShiftedLocation:(id)a3
{
  p_lastShiftedLocationLock = &self->_lastShiftedLocationLock;
  id v5 = a3;
  os_unfair_lock_lock(p_lastShiftedLocationLock);
  id v6 = (CLLocation *)[v5 copy];

  lastShiftedLocation = self->_lastShiftedLocation;
  self->_lastShiftedLocation = v6;

  os_unfair_lock_unlock(p_lastShiftedLocationLock);
}

- (CLLocation)locationSentToServer
{
  p_locationSentToServerLock = &self->_locationSentToServerLock;
  os_unfair_lock_lock(&self->_locationSentToServerLock);
  id v4 = -[CLLocation copy](self->_locationSentToServer, "copy");
  os_unfair_lock_unlock(p_locationSentToServerLock);
  return (CLLocation *)v4;
}

- (void)setLocationSentToServer:(id)a3
{
  p_locationSentToServerLock = &self->_locationSentToServerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_locationSentToServerLock);
  id v6 = (CLLocation *)[v5 copy];

  locationSentToServer = self->_locationSentToServer;
  self->_locationSentToServer = v6;

  os_unfair_lock_unlock(p_locationSentToServerLock);
}

- (id)_locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    id v4 = objc_alloc(&OBJC_CLASS___CLLocationManager);
    uint64_t v5 = AFEffectiveSiriBundlePathForLocation();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_super v7 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( v4,  "initWithEffectiveBundlePath:delegate:onQueue:",  v6,  self,  self->_internalQueue);
    dispatch_group_t v8 = self->_locationManager;
    self->_locationManager = v7;

    -[CLLocationManager registerAsLocationClient](self->_locationManager, "registerAsLocationClient");
    v9 = self->_locationManager;
    LODWORD(v4) = +[CLLocationManager locationServicesEnabled]( &OBJC_CLASS___CLLocationManager,  "locationServicesEnabled");
    id v10 = (id)-[CLLocationManager authorizationStatus](v9, "authorizationStatus");
    id v11 = -[CLLocationManager accuracyAuthorization](v9, "accuracyAuthorization");

    -[ADLocationManager setCurrentState:](self, "setCurrentState:", v4 | ((void)v10 << 32), v11);
    locationManager = self->_locationManager;
  }

  return locationManager;
}

- (id)_peerLocationConnection
{
  peerLocationConnection = self->_peerLocationConnection;
  if (!peerLocationConnection)
  {
    id v4 = -[ADPeerLocationConnection initWithDelegate:]( objc_alloc(&OBJC_CLASS___ADPeerLocationConnection),  "initWithDelegate:",  self);
    uint64_t v5 = self->_peerLocationConnection;
    self->_peerLocationConnection = v4;

    peerLocationConnection = self->_peerLocationConnection;
  }

  return peerLocationConnection;
}

- (id)_locationShifter
{
  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    id v4 = (GEOLocationShifter *)objc_opt_new(&OBJC_CLASS___GEOLocationShifter, a2);
    uint64_t v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }

  return locationShifter;
}

- (void)navStatusChanged:(id)a3
{
  externalQueue = (dispatch_queue_s *)self->_externalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100186CF8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(externalQueue, block);
}

- (id)shiftLocationUsingCachedShifterFunction:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  double v28 = v5;
  double v29 = v7;
  [v4 horizontalAccuracy];
  double v10 = v9;
  double v27 = v9;
  if ((+[GEOLocationShifter isLocationShiftRequiredForCoordinate:]( &OBJC_CLASS___GEOLocationShifter,  "isLocationShiftRequiredForCoordinate:",  v6,  v8) & 1) == 0)
  {
LABEL_5:
    uint64_t v24 = (CLLocation *)v4;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _locationShifter](self, "_locationShifter"));
    unsigned int v12 = objc_msgSend( v11,  "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:",  &v28,  &v27,  v6,  v8,  v10);

    if (v12)
    {
      double v13 = v27;
      CLLocationDegrees v14 = v28;
      CLLocationDegrees v15 = v29;
      id v16 = v4;
      CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v14, v15);
      v18 = objc_alloc(&OBJC_CLASS___CLLocation);
      [v16 altitude];
      double v20 = v19;
      [v16 verticalAccuracy];
      double v22 = v21;
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 timestamp]);

      uint64_t v24 = -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:]( v18,  "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:",  v23,  2LL,  v17.latitude,  v17.longitude,  v20,  v13,  v22);
    }

    else
    {
      uint64_t v26 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v31 = "-[ADLocationManager shiftLocationUsingCachedShifterFunction:]";
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Cache-based location shifting failed",  buf,  0xCu);
      }

      uint64_t v24 = 0LL;
    }
  }

  return v24;
}

- (void)shiftLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, id, void))a4;
  if ([v6 referenceFrame] == 2)
  {
    double v8 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[ADLocationManager shiftLocation:completion:]";
      double v9 = "%s Location is already shifted";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  [v6 coordinate];
  double v11 = v10;
  double v13 = v12;
  [v6 horizontalAccuracy];
  double v15 = v14;
  if ((+[GEOLocationShifter isLocationShiftRequiredForCoordinate:]( &OBJC_CLASS___GEOLocationShifter,  "isLocationShiftRequiredForCoordinate:",  v11,  v13) & 1) == 0)
  {
    double v8 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[ADLocationManager shiftLocation:completion:]";
      double v9 = "%s Location shifting is not needed";
      goto LABEL_8;
    }

- (void)shiftLocationWithTimeout:(id)a3 timeoutHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADLocationManager shiftLocationWithTimeout:timeoutHandler:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Starting location shifting routine",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  dispatch_time_t v12 = dispatch_time(0LL, 2000000000LL);
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018690C;
  block[3] = &unk_1004FC1D8;
  p___int128 buf = &buf;
  id v14 = v9;
  id v20 = v14;
  dispatch_after(v12, internalQueue, block);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001869D8;
  v16[3] = &unk_1004F3D88;
  v18 = &buf;
  id v15 = v10;
  id v17 = v15;
  -[ADLocationManager shiftLocation:completion:](self, "shiftLocation:completion:", v8, v16);

  _Block_object_dispose(&buf, 8);
}

- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withUnshiftedLocation:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    dispatch_time_t v12 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315395;
      char v24 = "-[ADLocationManager _generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:]";
      __int16 v25 = 2113;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Attempting to shift from location: %{private}@",  buf,  0x16u);
    }

    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100186594;
    v19[3] = &unk_1004F3DB0;
    objc_copyWeak(v22, (id *)buf);
    v22[1] = (id)a2;
    id v13 = v9;
    id v20 = v13;
    id v14 = v11;
    id v21 = v14;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10018669C;
    v15[3] = &unk_1004F3DD8;
    objc_copyWeak(v18, (id *)buf);
    v18[1] = (id)a2;
    id v16 = v13;
    id v17 = v14;
    -[ADLocationManager shiftLocationWithTimeout:timeoutHandler:completion:]( self,  "shiftLocationWithTimeout:timeoutHandler:completion:",  v10,  v19,  v15);

    objc_destroyWeak(v18);
    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withStatus:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v8 = (void (**)(id, SASetRequestOrigin *))a5;
    id v9 = a4;
    id v10 = a3;
    id v15 = objc_opt_new(&OBJC_CLASS___SASetRequestOrigin);
    -[SASetRequestOrigin setStatus:](v15, "setStatus:", v9);

    -[ADLocationManager currentState](self, "currentState");
    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11 == 0));
    -[SASetRequestOrigin setPreciseLocationEnabled:](v15, "setPreciseLocationEnabled:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 aceId]);
    -[SASetRequestOrigin setRefId:](v15, "setRefId:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 desiredAccuracy]);
    -[SASetRequestOrigin setDesiredAccuracy:](v15, "setDesiredAccuracy:", v14);

    v8[2](v8, v15);
  }

- (void)_generateLocationDisabledResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationDeniedResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationWiFiOffResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationTimedOutResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationUnknownResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_clearCompletionState
{
  id updateCompletion = self->_updateCompletion;
  self->_id updateCompletion = 0LL;

  requestOriginCommand = self->_requestOriginCommand;
  self->_requestOriginCommand = 0LL;
}

- (void)_cancelLocationSLATimer
{
  locationSLATimerSource = self->_locationSLATimerSource;
  if (locationSLATimerSource)
  {
    id v4 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[ADLocationManager _cancelLocationSLATimer]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Canceling Location-SLA timer",  (uint8_t *)&v6,  0xCu);
      locationSLATimerSource = self->_locationSLATimerSource;
    }

    dispatch_source_cancel((dispatch_source_t)locationSLATimerSource);
    double v5 = self->_locationSLATimerSource;
    self->_locationSLATimerSource = 0LL;
  }

- (void)_triggerLocationABCForSubtype:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SAGetRequestOrigin aceId](self->_requestOriginCommand, "aceId"));
  int v6 = (void *)v5;
  if (v5)
  {
    id v15 = @"refID";
    uint64_t v16 = v5;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  }

  else
  {
    double v7 = &__NSDictionary0__struct;
  }

  id v8 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    id v10 = "-[ADLocationManager _triggerLocationABCForSubtype:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s SERIOUS PROBLEM FETCHING LOCATION %@ %@",  (uint8_t *)&v9,  0x20u);
  }
}

- (void)_scheduleLocationSLATimer
{
  if (AFIsInternalInstall(self))
  {
    locationSLATimerSource = self->_locationSLATimerSource;
    id v4 = (os_log_s *)AFSiriLogContextLocation;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (locationSLATimerSource)
    {
      if (v5)
      {
        *(_DWORD *)__int128 buf = 136315138;
        __int16 v13 = "-[ADLocationManager _scheduleLocationSLATimer]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Already waiting for a response", buf, 0xCu);
      }
    }

    else
    {
      if (v5)
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v13 = "-[ADLocationManager _scheduleLocationSLATimer]";
        __int16 v14 = 2048;
        uint64_t v15 = 0x3FBD70A3D70A3D71LL;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Scheduling location-SLA timer for %lf",  buf,  0x16u);
      }

      int v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_internalQueue);
      double v7 = self->_locationSLATimerSource;
      self->_locationSLATimerSource = v6;

      id v8 = self->_locationSLATimerSource;
      dispatch_time_t v9 = dispatch_time(0LL, 115000000LL);
      dispatch_source_set_timer((dispatch_source_t)v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      id v10 = self->_locationSLATimerSource;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1001864D4;
      handler[3] = &unk_1004FD940;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
      dispatch_resume((dispatch_object_t)self->_locationSLATimerSource);
    }
  }

- (void)_cancelLocationTimer
{
  locationTimerSource = self->_locationTimerSource;
  if (locationTimerSource)
  {
    id v4 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[ADLocationManager _cancelLocationTimer]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Canceling location timer",  (uint8_t *)&v6,  0xCu);
      locationTimerSource = self->_locationTimerSource;
    }

    dispatch_source_cancel((dispatch_source_t)locationTimerSource);
    BOOL v5 = self->_locationTimerSource;
    self->_locationTimerSource = 0LL;
  }

- (void)_scheduleLocationTimerWithTimeout:(double)a3
{
  BOOL v5 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v13 = "-[ADLocationManager _scheduleLocationTimerWithTimeout:]";
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Scheduling location timer for %lf", buf, 0x16u);
  }

  int v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_internalQueue);
  locationTimerSource = self->_locationTimerSource;
  self->_locationTimerSource = v6;

  id v8 = self->_locationTimerSource;
  dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  id v10 = self->_locationTimerSource;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001862EC;
  v11[3] = &unk_1004FD0A0;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_source_set_event_handler((dispatch_source_t)v10, v11);
  dispatch_resume((dispatch_object_t)self->_locationTimerSource);
}

- (void)_startMonitoringLocationWithDesiredAccuracy:(double)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v11[0] = @"desiredAccuracy";
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v11[1] = @"refID";
  v12[0] = v6;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SAGetRequestOrigin aceId](self->_requestOriginCommand, "aceId"));
  id v8 = (void *)v7;
  dispatch_time_t v9 = @"NULL";
  if (v7) {
    dispatch_time_t v9 = (const __CFString *)v7;
  }
  v12[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  [v5 logEventWithType:1928 context:v10];

  -[ADLocationManager upgradeAccuracyIfNeeded:](self, "upgradeAccuracyIfNeeded:", a3);
  -[ADLocationManager startLocationUpdateSession](self, "startLocationUpdateSession");
  -[ADLocationManager setLastLocation:](self, "setLastLocation:", 0LL);
  -[ADLocationManager _scheduleLocationSLATimer](self, "_scheduleLocationSLATimer");
}

- (void)_startMonitoringLocationForGetRequestOrigin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    id v17 = "-[ADLocationManager _startMonitoringLocationForGetRequestOrigin:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Starting location monitoring",  (uint8_t *)&v16,  0xCu);
  }

  dispatch_time_t v9 = (SAGetRequestOrigin *)[v6 copy];
  requestOriginCommand = self->_requestOriginCommand;
  self->_requestOriginCommand = v9;

  id v11 = objc_retainBlock(v7);
  id updateCompletion = self->_updateCompletion;
  self->_id updateCompletion = v11;

  [v6 desiredCLAccuracy];
  -[ADLocationManager _startMonitoringLocationWithDesiredAccuracy:]( self,  "_startMonitoringLocationWithDesiredAccuracy:");
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 searchTimeout]);
  [v13 doubleValue];
  double v15 = v14;

  if (v15 > 0.0) {
    -[ADLocationManager _scheduleLocationTimerWithTimeout:](self, "_scheduleLocationTimerWithTimeout:", v15);
  }
}

- (void)_requestLocationWithBestAccuracy
{
  if (!self->_locationTimerSource)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _locationManager](self, "_locationManager"));
    [v3 requestLocation];

    if (AFIsNano(v4))
    {
      BOOL v5 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        dispatch_time_t v9 = "-[ADLocationManager _requestLocationWithBestAccuracy]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Asking for location from peer", buf, 0xCu);
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _peerLocationConnection](self, "_peerLocationConnection"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10018615C;
      v7[3] = &unk_1004F3E00;
      v7[4] = self;
      [v6 getBestLocationWithCompletion:v7];
    }
  }

  -[ADLocationManager _scheduleLocationTimerWithTimeout:](self, "_scheduleLocationTimerWithTimeout:", 10.0);
}

- (void)_requestLocationForGetRequestOrigin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    double v14 = "-[ADLocationManager _requestLocationForGetRequestOrigin:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Requesting best location",  (uint8_t *)&v13,  0xCu);
  }

  dispatch_time_t v9 = (SAGetRequestOrigin *)[v6 copy];
  requestOriginCommand = self->_requestOriginCommand;
  self->_requestOriginCommand = v9;

  id v11 = objc_retainBlock(v7);
  id updateCompletion = self->_updateCompletion;
  self->_id updateCompletion = v11;

  -[ADLocationManager _requestLocationWithBestAccuracy](self, "_requestLocationWithBestAccuracy");
}

- (id)locationForSnapshot
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    v3 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADLocationManager locationForSnapshot]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Using lastShiftedLocation for location snapshot",  (uint8_t *)&v9,  0xCu);
    }

    return (id)objc_claimAutoreleasedReturnValue(-[ADLocationManager lastShiftedLocation](self, "lastShiftedLocation"));
  }

  else
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager lastLocation](self, "lastLocation"));
    id v6 = (os_log_s *)AFSiriLogContextLocation;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        int v9 = 136315138;
        id v10 = "-[ADLocationManager locationForSnapshot]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Using lastLocation for location snapshot",  (uint8_t *)&v9,  0xCu);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADLocationManager shiftLocationUsingCachedShifterFunction:]( self,  "shiftLocationUsingCachedShifterFunction:",  v5));
    }

    else
    {
      if (v7)
      {
        int v9 = 136315138;
        id v10 = "-[ADLocationManager locationForSnapshot]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s No cached location available to shift for location snapshot",  (uint8_t *)&v9,  0xCu);
      }

      id v8 = 0LL;
    }

    return v8;
  }

- (BOOL)_locationUpdateIsCapableOfSucceeding
{
  return 1;
}

- (void)_processUpdatedLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager lastLocation](self, "lastLocation"));
  id v6 = self->_requestOriginCommand;
  if (-[ADLocationManager shouldSendLocationToServer:forAceCommand:]( self,  "shouldSendLocationToServer:forAceCommand:",  v4,  v6))
  {
    -[ADLocationManager _cancelLocationTimer](self, "_cancelLocationTimer");
    id updateCompletion = self->_updateCompletion;
    if (!updateCompletion)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10018609C;
      v13[3] = &unk_1004FCDD8;
      id updateCompletion = v13;
      v13[4] = self;
    }

    -[ADLocationManager _generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:]( self,  "_generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:",  v6,  v4,  updateCompletion);
    -[ADLocationManager _clearCompletionState](self, "_clearCompletionState");
  }

  id v8 = v4;
  id v9 = v5;
  id v10 = v9;
  id v11 = v9;
  if (v8)
  {
    id v11 = v8;
    if (v9)
    {
      else {
        id v11 = v10;
      }
    }
  }

  id v12 = v11;

  -[ADLocationManager setLastLocation:](self, "setLastLocation:", v12);
  -[ADLocationManager updateLocationSnapshot](self, "updateLocationSnapshot");
}

- (void)peerLocationConnection:(id)a3 didReceiveUnsolicitedLocation:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    id v12 = "-[ADLocationManager peerLocationConnection:didReceiveUnsolicitedLocation:]";
    __int16 v13 = 2113;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100185FA0;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(internalQueue, v9);
}

- (void)peerLocationConnectionSuggestsClearingCachedLocation:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v8 = "-[ADLocationManager peerLocationConnectionSuggestsClearingCachedLocation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100185F90;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
  id v8 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    double v28 = "-[ADLocationManager locationManager:didUpdateLocations:]";
    __int16 v29 = 2113;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  uint64_t v9 = mach_absolute_time();
  kdebug_trace(722496580LL, 0LL, 0LL, 0LL, 0LL);
  -[ADLocationManager _cancelLocationSLATimer](self, "_cancelLocationSLATimer");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v25[0] = @"locationTimestamp";
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);
  [v11 timeIntervalSince1970];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v26[0] = v12;
  v25[1] = @"horizontalAccuracy";
  [v7 horizontalAccuracy];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v26[1] = v13;
  v25[2] = @"refID";
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SAGetRequestOrigin aceId](self->_requestOriginCommand, "aceId"));
  double v15 = (void *)v14;
  int v16 = @"NULL";
  if (v14) {
    int v16 = (const __CFString *)v14;
  }
  v26[2] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL,  v18));
  [v10 logEventWithType:1929 machAbsoluteTime:v9 context:v17];

  -[ADLocationManager _processUpdatedLocation:](self, "_processUpdatedLocation:", v7);
  objc_initWeak((id *)buf, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100185CA4;
  v23[3] = &unk_1004FC458;
  objc_copyWeak(v24, (id *)buf);
  v24[1] = (id)a2;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100185DE0;
  v21[3] = &unk_1004F3E28;
  objc_copyWeak(v22, (id *)buf);
  v22[1] = (id)a2;
  -[ADLocationManager shiftLocationWithTimeout:timeoutHandler:completion:]( self,  "shiftLocationWithTimeout:timeoutHandler:completion:",  v7,  v23,  v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADLocationManager locationManager:didFailWithError:]";
    __int16 v32 = 2114;
    id v33 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  __int16 v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  double v27 = sub_100185B84;
  double v28 = &unk_1004F9A30;
  id v10 = v7;
  id v29 = v10;
  id v30 = self;
  [v9 logEventWithType:1929 contextProvider:&v25 contextProvidingQueue:self->_internalQueue];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain", v25, v26, v27, v28));
  unsigned int v12 = [v11 isEqualToString:kCLErrorDomain];

  if (!v12)
  {
LABEL_8:
    uint64_t v14 = 0LL;
    goto LABEL_9;
  }

  __int16 v13 = (char *)[v10 code];
  if (!v13)
  {
    goto LABEL_8;
  }

  uint64_t v14 = v13;
LABEL_9:
  -[ADLocationManager _cancelLocationTimer](self, "_cancelLocationTimer");
  -[ADLocationManager _cancelLocationSLATimer](self, "_cancelLocationSLATimer");
  double v15 = self->_requestOriginCommand;
  if (v15)
  {
    id updateCompletion = self->_updateCompletion;
    if (v14 == (char *)1) {
      -[ADLocationManager _generateLocationDeniedResponseForGetRequestOriginCommand:completion:]( self,  "_generateLocationDeniedResponseForGetRequestOriginCommand:completion:",  v15,  updateCompletion);
    }
    else {
      -[ADLocationManager _generateLocationUnknownResponseForGetRequestOriginCommand:completion:]( self,  "_generateLocationUnknownResponseForGetRequestOriginCommand:completion:",  v15,  updateCompletion);
    }
    -[ADLocationManager _clearCompletionState](self, "_clearCompletionState");
  }

  if ((unint64_t)(v14 - 1) < 2)
  {
    NSErrorUserInfoKey v36 = NSUnderlyingErrorKey;
    *(void *)__int128 buf = v10;
    id v17 = v10;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v36,  1LL));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFLocationServiceErrorDomain,  6LL,  v18));

    -[ADLocationManager drainLocationFetchRequestsWithPossibleError:]( self,  "drainLocationFetchRequestsWithPossibleError:",  v19);
    goto LABEL_21;
  }

  if (v14 == (char *)18)
  {
    id v20 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
    {
      authorizationRequestCompletions = self->_authorizationRequestCompletions;
      double v22 = v20;
      id v23 = -[NSMutableSet count](authorizationRequestCompletions, "count");
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ADLocationManager locationManager:didFailWithError:]";
      __int16 v32 = 2112;
      id v33 = v10;
      __int16 v34 = 2048;
      id v35 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s CoreLocation decline presenting authorization prompt with error: %@. This error is intentionally ignored. Cur rently awaiting requests count: %lu",  buf,  0x20u);
    }

    goto LABEL_21;
  }

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)-[ADLocationManager currentState](self, "currentState");
  id v7 = v6;
  unint64_t v21 = HIDWORD(v5);
  id v8 = v4;
  BOOL v9 = +[CLLocationManager locationServicesEnabled](&OBJC_CLASS___CLLocationManager, "locationServicesEnabled");
  id v10 = [v8 authorizationStatus];
  id v11 = [v8 accuracyAuthorization];

  -[ADLocationManager setCurrentState:](self, "setCurrentState:", v9 | ((void)v10 << 32), v11);
  if (!self->_isLocationManagerReady)
  {
    self->_isLocationManagerReady = 1;
    unsigned int v12 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      double v27 = "-[ADLocationManager locationManagerDidChangeAuthorization:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Got our first location authorization callback",  buf,  0xCu);
    }

    dispatch_group_leave((dispatch_group_t)self->_initialLocationAuthorizationCallbackGroup);
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10018580C;
  void v25[3] = &unk_1004F3E50;
  v25[6] = v11;
  v25[7] = v5;
  v25[8] = v7;
  v25[4] = self;
  v25[5] = v9 | ((void)v10 << 32);
  [v13 logEventWithType:1929 contextProvider:v25 contextProvidingQueue:self->_internalQueue];

  if (((v5 & 1) == 0) == v9 || (_DWORD)v10 != HIDWORD(v5) || v11 != v7)
  {
    uint64_t v14 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      double v15 = v14;
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11 == 0LL));
      *(_DWORD *)__int128 buf = 136315906;
      double v27 = "-[ADLocationManager locationManagerDidChangeAuthorization:]";
      __int16 v28 = 1024;
      int v29 = (int)v10;
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Authorization status changed to %d, isEnabled: %@, preciseLocationEnabled: %@",  buf,  0x26u);
    }

    if ((_DWORD)v10 == 1 || (_DWORD)v21 == 1)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v18 postNotificationName:@"ADLocationRestrictionDidChangeNotification" object:0];
    }

    -[ADLocationManager _cancelLocationSLATimer](self, "_cancelLocationSLATimer");
    if (v10 >= 3)
    {
      if (((_DWORD)v10 - 3) >= 2)
      {
LABEL_32:
        -[ADLocationManager drainAuthorizationRequestCompletionsWithPossibleError:]( self,  "drainAuthorizationRequestCompletionsWithPossibleError:",  0LL);
        goto LABEL_33;
      }

      id v19 = (SAGetRequestOrigin *)objc_claimAutoreleasedReturnValue(-[ADLocationManager locationForSnapshot](self, "locationForSnapshot"));
      if (v19)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1001859C4;
        v23[3] = &unk_1004FCDD8;
        void v23[4] = self;
        -[ADLocationManager _generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:]( self,  "_generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:",  0LL,  v19,  v23);
      }

      else
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        id v22[2] = sub_100185A44;
        v22[3] = &unk_1004FCDD8;
        v22[4] = self;
        -[ADLocationManager _generateLocationUnknownResponseForGetRequestOriginCommand:completion:]( self,  "_generateLocationUnknownResponseForGetRequestOriginCommand:completion:",  0LL,  v22);
      }

      if ((_DWORD)v10 == (_DWORD)v21)
      {
        if (v7 && !v11) {
          -[ADLocationManager forceLocationUpdateFromCoreLocation](self, "forceLocationUpdateFromCoreLocation");
        }
      }

      else
      {
        -[ADLocationManager startLocationPrefetchRoutine](self, "startLocationPrefetchRoutine");
      }
    }

    else
    {
      -[ADLocationManager setLastShiftedLocation:](self, "setLastShiftedLocation:", 0LL);
      id v19 = self->_requestOriginCommand;
      id v20 = objc_retainBlock(self->_updateCompletion);
      if (!v20)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        id v24[2] = sub_100185944;
        v24[3] = &unk_1004FCDD8;
        v24[4] = self;
        id v20 = objc_retainBlock(v24);
      }

      if (v9) {
        -[ADLocationManager _generateLocationDeniedResponseForGetRequestOriginCommand:completion:]( self,  "_generateLocationDeniedResponseForGetRequestOriginCommand:completion:",  v19,  v20);
      }
      else {
        -[ADLocationManager _generateLocationDisabledResponseForGetRequestOriginCommand:completion:]( self,  "_generateLocationDisabledResponseForGetRequestOriginCommand:completion:",  v19,  v20);
      }
      if (self->_updateCompletion) {
        -[ADLocationManager _clearCompletionState](self, "_clearCompletionState");
      }
    }

    goto LABEL_32;
  }

- (id)createCurrentLocationSnapshot
{
  id v3 = -[ADLocationManager currentState](self, "currentState");
  uint64_t v5 = v4;
  id v6 = (os_log_s *)AFSiriLogContextLocation;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if ((v3 & 1) == 0)
  {
    if (v7)
    {
      int v14 = 136315138;
      double v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Generating location snapshot for location services disabled",  (uint8_t *)&v14,  0xCu);
    }

    id v8 = &stru_1004F3E90;
    return +[AFLocationSnapshot newWithBuilder:](&OBJC_CLASS___AFLocationSnapshot, "newWithBuilder:", v8);
  }

  if (v7)
  {
    int v14 = 136315650;
    double v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
    __int16 v16 = 1024;
    int v17 = HIDWORD(v3);
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Generating location snapshot for authorization status: %d, accuracy authorization: %ld",  (uint8_t *)&v14,  0x1Cu);
  }

  if (HIDWORD(v3) < 3)
  {
    id v8 = &stru_1004F3EB0;
    return +[AFLocationSnapshot newWithBuilder:](&OBJC_CLASS___AFLocationSnapshot, "newWithBuilder:", v8);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager locationForSnapshot](self, "locationForSnapshot"));
  id v11 = (os_log_s *)AFSiriLogContextLocation;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v12)
    {
      int v14 = 136315138;
      double v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s No cached location available to create location snapshot",  (uint8_t *)&v14,  0xCu);
    }

    return 0LL;
  }

  if (v12)
  {
    int v14 = 136315138;
    double v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Creating location snapshot from cached location",  (uint8_t *)&v14,  0xCu);
  }

  __int16 v13 = -[AFLocationSnapshot initWithLocation:locationManagerState:]( objc_alloc(&OBJC_CLASS___AFLocationSnapshot),  "initWithLocation:locationManagerState:",  v10,  v3,  v5);

  return v13;
}

- (void)updateLocationSnapshot
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADLocationManager createCurrentLocationSnapshot](self, "createCurrentLocationSnapshot"));
  if (v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v3 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
    uint64_t v4 = AFDeviceContextKeyLocation;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingTimeInterval:300.0]);
    id v6 = [v3 initWithType:v4 deliveryDate:v2 expirationDate:v5 redactedKeyPaths:0 historyConfiguration:0];

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextDonationService defaultService](&OBJC_CLASS___AFContextDonationService, "defaultService"));
    [v7 donateContext:v8 withMetadata:v6 pushToRemote:0];
  }
}

- (void)updateLocationSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001857B8;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (BOOL)shouldSendLocationToServer:(id)a3 forAceCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 maxAge]);
    unsigned int v10 = objc_msgSend(v6, "_af_isOlderThanAge:", v9);

    id v11 = (void *)AFSiriLogContextLocation;
    BOOL v12 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        __int16 v13 = v11;
        double v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v8 maxAge]));
        int v44 = 136315394;
        id v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
        __int16 v46 = 2112;
        double v47 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Not sending location to server for server request because location is too old. Max age %@",  (uint8_t *)&v44,  0x16u);
      }

- (void)updateLocationForCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100185284;
  v15[3] = &unk_1004F3ED8;
  void v15[4] = self;
  id v16 = a4;
  id v7 = v16;
  id v8 = objc_retainBlock(v15);
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100185404;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  unsigned int v10 = v8;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001850E0;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

- (void)dismissedAllVisibleAssistantUIForReason:(id)a3
{
  id v4 = a3;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100185018;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v7 = (void (*)(id, id, id))*((void *)a6 + 2);
  if (a5 == 10) {
    v7(a6, a3, a4);
  }
  else {
    ((void (*)(id, void, void, id))v7)(a6, 0LL, 0LL, a4);
  }
}

- (void)scheduleAuthorizationRequestTimeoutForCompletionBlock:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100184EC0;
  block[3] = &unk_1004F5340;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, internalQueue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)scheduleLocationFetchRequestTimeoutForRequest:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100184DE8;
  v10[3] = &unk_1004F9AA8;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  dispatch_after(v7, internalQueue, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)drainAuthorizationRequestCompletionsWithPossibleError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      double v26 = "-[ADLocationManager drainAuthorizationRequestCompletionsWithPossibleError:]";
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Draining authorization requests with error %@",  buf,  0x16u);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v6 = self->_authorizationRequestCompletions;
    id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8LL * (void)i) + 16LL))();
        }

        id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
      }

      while (v8);
    }
  }

  else
  {
    -[ADLocationManager currentState](self, "currentState");
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = self->_authorizationRequestCompletions;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8LL * (void)j) + 16LL))(*(void *)(*((void *)&v15 + 1) + 8LL * (void)j));
        }

        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
      }

      while (v12);
    }
  }

  -[NSMutableSet removeAllObjects](self->_authorizationRequestCompletions, "removeAllObjects");
}

- (void)drainLocationFetchRequestsWithPossibleError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      double v36 = "-[ADLocationManager drainLocationFetchRequestsWithPossibleError:]";
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Draining location fetch requests with error %@",  buf,  0x16u);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v6 = self->_locationFetchRequests;
    id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v29 + 1) + 8 * (void)i) completion]);
          ((void (**)(void, void, id))v11)[2](v11, 0LL, v4);
        }

        id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
      }

      while (v8);
    }

    -[NSMutableSet removeAllObjects](self->_locationFetchRequests, "removeAllObjects");
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager lastShiftedLocation](self, "lastShiftedLocation"));
    if (v12)
    {
      id v13 = -[NSMutableSet copy](self->_locationFetchRequests, "copy");
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (j = 0LL; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            __int128 v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
            if (!objc_msgSend(v19, "style", (void)v25))
            {
              [v12 horizontalAccuracy];
              [v19 desiredAccuracy];
            }

            [v12 horizontalAccuracy];
            double v21 = v20;
            [v19 desiredAccuracy];
            if (v21 <= v22)
            {
              double v23 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v19 completion]);
              ((void (**)(void, void *, void))v23)[2](v23, v12, 0LL);

              -[NSMutableSet removeObject:](self->_locationFetchRequests, "removeObject:", v19);
            }
          }

          id v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }

        while (v16);
      }
    }

    else
    {
      double v24 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315138;
        double v36 = "-[ADLocationManager drainLocationFetchRequestsWithPossibleError:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Drain location is called with no location and no error, this situation should not be possible",  buf,  0xCu);
      }
    }
  }
}

- (void)currentAuthorizationStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v11 = "-[ADLocationManager currentAuthorizationStyle:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Received current authorizationg style request",  buf,  0xCu);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100184CF8;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(internalQueue, v8);
}

- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)__int128 buf = 136315650;
    __int128 v19 = "-[ADLocationManager requestAuthorizationWithStyle:timeout:completion:]";
    __int16 v20 = 2112;
    double v21 = v11;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Received location authorization request with style: %@, timeout: %.5g",  buf,  0x20u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001849BC;
  v14[3] = &unk_1004F6B28;
  v14[4] = self;
  id v15 = v8;
  double v16 = a4;
  unint64_t v17 = a3;
  id v13 = v8;
  dispatch_async(internalQueue, v14);
}

- (void)sendTemporaryAccuracyAuthorizationRequestWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  authorizationRequestCompletions = self->_authorizationRequestCompletions;
  id v8 = objc_retainBlock(v6);
  -[NSMutableSet addObject:](authorizationRequestCompletions, "addObject:", v8);

  -[ADLocationManager scheduleAuthorizationRequestTimeoutForCompletionBlock:timeout:]( self,  "scheduleAuthorizationRequestTimeoutForCompletionBlock:timeout:",  v6,  a3);
  if (!self->_locationInUseAssertion)
  {
    id v9 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v19 = "-[ADLocationManager sendTemporaryAccuracyAuthorizationRequestWithTimeout:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Will request temporary full accuracy authorization - grabbing assertion once",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager createLocationInUseAssertion](self, "createLocationInUseAssertion"));
    id locationInUseAssertion = self->_locationInUseAssertion;
    self->_id locationInUseAssertion = v10;
  }

  id v12 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v19 = "-[ADLocationManager sendTemporaryAccuracyAuthorizationRequestWithTimeout:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Sending requestTemporaryFullAccuracyAuthorizationWithPurposeKey:completion:",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _locationManager](self, "_locationManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100184738;
  v15[3] = &unk_1004F3F20;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v6;
  void v15[4] = self;
  id v16 = v14;
  [v13 requestTemporaryFullAccuracyAuthorizationWithPurposeKey:@"generic" completion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)__int128 buf = 136315650;
    __int128 v18 = "-[ADLocationManager requestTemporaryAccuracyAuthorizationWithStyle:timeout:completion:]";
    __int16 v19 = 2112;
    __int16 v20 = v11;
    __int16 v21 = 2048;
    double v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Received temporary accuracy authorization request with style: %@, timeout: %.5g",  buf,  0x20u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001844B4;
  block[3] = &unk_1004FB930;
  void block[4] = self;
  id v15 = v8;
  double v16 = a4;
  id v13 = v8;
  dispatch_async(internalQueue, block);
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001844A8;
  v7[3] = &unk_1004F3F48;
  id v8 = a4;
  id v6 = v8;
  -[ADLocationManager updateAuthorizationStyleWithUserSelection:timeout:completion:]( self,  "updateAuthorizationStyleWithUserSelection:timeout:completion:",  a3,  v7,  2.0);
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v19 = "-[ADLocationManager updateAuthorizationStyleWithUserSelection:timeout:completion:]";
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Received update authorization style: %@, timeout: %.5g",  buf,  0x20u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001841E0;
  v14[3] = &unk_1004F6B28;
  id v15 = v8;
  unint64_t v16 = a3;
  v14[4] = self;
  double v17 = a4;
  id v13 = v8;
  dispatch_async(internalQueue, v14);
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001841D4;
  v7[3] = &unk_1004F3F48;
  id v8 = a4;
  id v6 = v8;
  -[ADLocationManager updateTemporaryAuthorizationForAccurateLocation:timeout:completion:]( self,  "updateTemporaryAuthorizationForAccurateLocation:timeout:completion:",  v4,  v7,  2.0);
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v19 = "-[ADLocationManager updateTemporaryAuthorizationForAccurateLocation:timeout:completion:]";
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Received update temporary accuracy authorization, isAuthorized: %@, timeout: %.5g",  buf,  0x20u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100183F50;
  v14[3] = &unk_1004F3F70;
  BOOL v17 = v6;
  v14[4] = self;
  id v15 = v8;
  double v16 = a4;
  id v13 = v8;
  dispatch_async(internalQueue, v14);
}

- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_opt_new(&OBJC_CLASS___AFLocationFetchRequest);
  [v9 setDesiredAccuracy:a3];
  [v9 setTimeout:a4];
  [v9 setStyle:0];
  -[ADLocationManager currentLocationWithFetchRequest:completion:]( self,  "currentLocationWithFetchRequest:completion:",  v9,  v8);
}

- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 desiredAccuracy];
  uint64_t v9 = v8;
  [v6 timeout];
  uint64_t v11 = v10;
  id v12 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v22 = "-[ADLocationManager currentLocationWithFetchRequest:completion:]";
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Received current location request with accuracy: %.5g, timeout: %.5g",  buf,  0x20u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100183A48;
  block[3] = &unk_1004FB3F8;
  id v17 = v6;
  id v18 = v7;
  void block[4] = self;
  uint64_t v19 = v9;
  uint64_t v20 = v11;
  id v14 = v6;
  id v15 = v7;
  dispatch_async(internalQueue, block);
}

- (void)startLocationPrefetchRoutine
{
  id v3 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[ADLocationManager startLocationPrefetchRoutine]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Starting location pre-fetching",  (uint8_t *)&v7,  0xCu);
  }

  -[ADLocationManager _startMonitoringLocationWithDesiredAccuracy:]( self,  "_startMonitoringLocationWithDesiredAccuracy:",  self->_preferredPlatformLocationAccuracy);
  if (!self->_locationInUseAssertion)
  {
    BOOL v4 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[ADLocationManager startLocationPrefetchRoutine]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Location prefetching routine is started - grabbing assertion once",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager createLocationInUseAssertion](self, "createLocationInUseAssertion"));
    id locationInUseAssertion = self->_locationInUseAssertion;
    self->_id locationInUseAssertion = v5;
  }

- (void)prefetchCurrentLocation
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100183948;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100183838;
  block[3] = &unk_1004F3F98;
  BOOL v7 = a4;
  void block[4] = self;
  void block[5] = a3;
  BOOL v8 = a5;
  dispatch_async(internalQueue, block);
}

- (void)_dismissTCCDialogIfNeeded
{
  v2 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    BOOL v7 = "-[ADLocationManager _dismissTCCDialogIfNeeded]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Sending the dialog dismiss to CoreLocation",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t v3 = objc_opt_respondsToSelector(&OBJC_CLASS___CLLocationManager, "tearDownLocationAuthorizationPromptForBundlePath:");
  if ((v3 & 1) != 0)
  {
    uint64_t v4 = AFEffectiveSiriBundlePathForLocation(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    +[CLLocationManager tearDownLocationAuthorizationPromptForBundlePath:]( &OBJC_CLASS___CLLocationManager,  "tearDownLocationAuthorizationPromptForBundlePath:",  v5);
  }

- (void)dismissTCCDialogIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    internalQueue = (dispatch_queue_s *)self->_internalQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001837FC;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(internalQueue, v7);
  }

  else if (v4)
  {
    dispatch_async((dispatch_queue_t)self->_internalQueue, v4);
  }
}

- (id)createLocationInUseAssertion
{
  uint64_t v2 = AFEffectiveSiriBundleForLocation(self);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = +[CLInUseAssertion newAssertionForBundle:withReason:]( &OBJC_CLASS___CLInUseAssertion,  "newAssertionForBundle:withReason:",  v3,  @"Assistant Daemon requires location to handle Siri & Dictation requests");

  return v4;
}

- (void)upgradeAccuracyIfNeeded:(double)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _locationManager](self, "_locationManager"));
  int v6 = v5;
  if (self->_locationUpdateSessionStatus && ([v5 desiredAccuracy], a3 - v7 > 2.22044605e-16))
  {
    id v8 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      unint64_t locationUpdateSessionStatus = self->_locationUpdateSessionStatus;
      uint64_t v10 = v8;
      [v6 desiredAccuracy];
      int v13 = 136315906;
      id v14 = "-[ADLocationManager upgradeAccuracyIfNeeded:]";
      __int16 v15 = 2048;
      double v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = locationUpdateSessionStatus;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Not upgrading desired accuracy of location to %.5g. Session status: %lu, current desired accuracy: %.5g",  (uint8_t *)&v13,  0x2Au);
    }
  }

  else
  {
    id v12 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      id v14 = "-[ADLocationManager upgradeAccuracyIfNeeded:]";
      __int16 v15 = 2048;
      double v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Upgrading desired accuracy of location to %.5g",  (uint8_t *)&v13,  0x16u);
    }

    [v6 setDesiredAccuracy:a3];
    -[ADLocationManager forceLocationUpdateFromCoreLocation](self, "forceLocationUpdateFromCoreLocation");
  }
}

- (void)scheduleLocationUpdateSessionTeardown
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    int v13 = "-[ADLocationManager scheduleLocationUpdateSessionTeardown]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Scheduling location update session teardown",  buf,  0xCu);
  }

  locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
  if (locationUpdateSessionTeardownTimer)
  {
    dispatch_source_cancel((dispatch_source_t)locationUpdateSessionTeardownTimer);
  }

  else
  {
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_internalQueue);
    int v6 = self->_locationUpdateSessionTeardownTimer;
    self->_locationUpdateSessionTeardownTimer = v5;
  }

  double v7 = self->_locationUpdateSessionTeardownTimer;
  dispatch_time_t v8 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak((id *)buf, self);
  uint64_t v9 = self->_locationUpdateSessionTeardownTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10018372C;
  handler[3] = &unk_1004FAF58;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
  dispatch_activate((dispatch_object_t)self->_locationUpdateSessionTeardownTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)cancelLocationUpdateSessionTeardown
{
  locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
  if (locationUpdateSessionTeardownTimer)
  {
    id v4 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[ADLocationManager cancelLocationUpdateSessionTeardown]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Canceling location update session teardown timer",  (uint8_t *)&v6,  0xCu);
      locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
    }

    dispatch_source_cancel((dispatch_source_t)locationUpdateSessionTeardownTimer);
    uint64_t v5 = self->_locationUpdateSessionTeardownTimer;
    self->_locationUpdateSessionTeardownTimer = 0LL;
  }

- (void)startLocationUpdateSession
{
  unint64_t locationUpdateSessionStatus = self->_locationUpdateSessionStatus;
  id v4 = (os_log_s *)AFSiriLogContextLocation;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if (locationUpdateSessionStatus == 1)
  {
    if (v5)
    {
      int v11 = 136315138;
      id v12 = "-[ADLocationManager startLocationUpdateSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Location update session is already active, not trying to activate it again",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    if (v5)
    {
      int v11 = 136315138;
      id v12 = "-[ADLocationManager startLocationUpdateSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Starting location update session",  (uint8_t *)&v11,  0xCu);
    }

    -[ADLocationManager cancelLocationUpdateSessionTeardown](self, "cancelLocationUpdateSessionTeardown");
    if (!self->_locationInUseAssertion)
    {
      int v6 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "-[ADLocationManager startLocationUpdateSession]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Starting location update session - grabbing assertion once",  (uint8_t *)&v11,  0xCu);
      }

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager createLocationInUseAssertion](self, "createLocationInUseAssertion"));
      id locationInUseAssertion = self->_locationInUseAssertion;
      self->_id locationInUseAssertion = v7;
    }

    uint64_t v9 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[ADLocationManager startLocationUpdateSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Starting updating location with CoreLocation",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _locationManager](self, "_locationManager"));
    [v10 startUpdatingLocation];

    self->_unint64_t locationUpdateSessionStatus = 1LL;
  }

- (BOOL)shouldEndLocationUpdateSession
{
  return !self->_siriUserInterfaceIsVisible && -[NSMutableSet count](self->_locationFetchRequests, "count") == 0LL;
}

- (void)endLocationUpdateSessionIfNeeded
{
  if (-[ADLocationManager shouldEndLocationUpdateSession](self, "shouldEndLocationUpdateSession"))
  {
    unint64_t locationUpdateSessionStatus = self->_locationUpdateSessionStatus;
    id v4 = (os_log_s *)AFSiriLogContextLocation;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (locationUpdateSessionStatus == 1)
    {
      if (v5)
      {
        int v17 = 136315138;
        unint64_t v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Ending location update session",  (uint8_t *)&v17,  0xCu);
      }

      -[ADLocationManager scheduleLocationUpdateSessionTeardown](self, "scheduleLocationUpdateSessionTeardown");
      int v6 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        unint64_t v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Stopping location updates from CoreLocation",  (uint8_t *)&v17,  0xCu);
      }

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _locationManager](self, "_locationManager"));
      [v7 stopUpdatingLocation];

      dispatch_time_t v8 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        unint64_t v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Clearing last shifted location",  (uint8_t *)&v17,  0xCu);
      }

      -[ADLocationManager setLastShiftedLocation:](self, "setLastShiftedLocation:", 0LL);
      uint64_t v9 = (os_log_s *)AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        unint64_t v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Clearing location sent to server",  (uint8_t *)&v17,  0xCu);
      }

      -[ADLocationManager setLocationSentToServer:](self, "setLocationSentToServer:", 0LL);
      id locationInUseAssertion = self->_locationInUseAssertion;
      if (locationInUseAssertion)
      {
        int v11 = (os_log_s *)AFSiriLogContextLocation;
        if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
        {
          int v17 = 136315138;
          unint64_t v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Location update session ended - releasing assertion",  (uint8_t *)&v17,  0xCu);
          id locationInUseAssertion = self->_locationInUseAssertion;
        }

        self->_id locationInUseAssertion = 0LL;
      }

      self->_unint64_t locationUpdateSessionStatus = 2LL;
    }

    else if (v5)
    {
      int v17 = 136315138;
      unint64_t v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Location update session is not active, not trying to end it",  (uint8_t *)&v17,  0xCu);
    }
  }

  else
  {
    id v12 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      BOOL siriUserInterfaceIsVisible = self->_siriUserInterfaceIsVisible;
      id v14 = v12;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", siriUserInterfaceIsVisible));
      id v16 = -[NSMutableSet count](self->_locationFetchRequests, "count");
      int v17 = 136315650;
      unint64_t v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2048;
      id v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Not ending location update session. UI visible: %@, location fetch requests count: %lu",  (uint8_t *)&v17,  0x20u);
    }
  }

- (void)forceLocationUpdateFromCoreLocation
{
  if (self->_locationUpdateSessionStatus == 1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager _locationManager](self, "_locationManager"));
    uint64_t v3 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[ADLocationManager forceLocationUpdateFromCoreLocation]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Stopping location updates from CoreLocation",  (uint8_t *)&v6,  0xCu);
    }

    [v2 stopUpdatingLocation];
    id v4 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[ADLocationManager forceLocationUpdateFromCoreLocation]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Starting location updates from CoreLocation",  (uint8_t *)&v6,  0xCu);
    }

    [v2 startUpdatingLocation];
  }

  else
  {
    BOOL v5 = (os_log_s *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[ADLocationManager forceLocationUpdateFromCoreLocation]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Not forcing location update from CoreLocation because location update session is not active",  (uint8_t *)&v6,  0xCu);
    }
  }

- (id)createSetRequestOrigin
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___SASetRequestOrigin);
  id v4 = -[ADLocationManager currentState](self, "currentState");
  if ((v4 & 1) == 0)
  {
    BOOL v5 = &SASetRequestOriginStatusDisabledValue;
LABEL_5:
    -[SASetRequestOrigin setStatus:](v3, "setStatus:", *v5);
    return v3;
  }

  if (HIDWORD(v4) < 3)
  {
    BOOL v5 = &SASetRequestOriginStatusDeniedValue;
    goto LABEL_5;
  }

  if ((HIDWORD(v4) - 3) < 2)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADLocationManager locationForSnapshot](self, "locationForSnapshot"));
    [v7 coordinate];
    -[SASetRequestOrigin setLatitude:](v3, "setLatitude:");
    [v7 coordinate];
    -[SASetRequestOrigin setLongitude:](v3, "setLongitude:", v8);
    [v7 horizontalAccuracy];
    -[SASetRequestOrigin setHorizontalAccuracy:](v3, "setHorizontalAccuracy:");
    [v7 verticalAccuracy];
    -[SASetRequestOrigin setVerticalAccuracy:](v3, "setVerticalAccuracy:");
    [v7 speed];
    -[SASetRequestOrigin setSpeed:](v3, "setSpeed:");
    [v7 altitude];
    -[SASetRequestOrigin setAltitude:](v3, "setAltitude:");
    [v7 course];
    -[SASetRequestOrigin setDirection:](v3, "setDirection:");
    -[SASetRequestOrigin setStatus:](v3, "setStatus:", SASetRequestOriginStatusValidValue);
  }

  return v3;
}

- (ADLocationManagerDelegate)delegate
{
  return (ADLocationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)needsToSendLocation
{
  return self->_needsToSendLocation;
}

- (void)setNeedsToSendLocation:(BOOL)a3
{
  self->_needsToSendLocation = a3;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (BOOL)allowAdHocSendingLocationToServer
{
  return self->_allowAdHocSendingLocationToServer;
}

- (void)setAllowAdHocSendingLocationToServer:(BOOL)a3
{
  self->_allowAdHocSendingLocationToServer = a3;
}

- (ADLocationManagerState)currentState
{
  uint64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.accuracyAuthorization = v3;
  result.locationServicesEnabled = v2;
  result.authorizationStatus = HIDWORD(v2);
  return result;
}

- (void)setCurrentState:(ADLocationManagerState)a3
{
  ADLocationManagerState v3 = a3;
  objc_copyStruct(&self->_currentState, &v3, 16LL, 1, 0);
}

- (BOOL)doNotClearLocationManagerDelegateForUnitTests
{
  return self->_doNotClearLocationManagerDelegateForUnitTests;
}

- (void)setDoNotClearLocationManagerDelegateForUnitTests:(BOOL)a3
{
  self->_doNotClearLocationManagerDelegateForUnitTests = a3;
}

- (void).cxx_destruct
{
}

+ (void)prepareForAssistantEnablementInBackground
{
  unsigned int v2 = +[AFFeatureFlags isSiriLocationServicesPromptingEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriLocationServicesPromptingEnabled");
  ADLocationManagerState v3 = (os_log_s *)AFSiriLogContextLocation;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v7 = 136315138;
      double v8 = "+[ADLocationManager prepareForAssistantEnablementInBackground]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s prepareForAssistantEnablementInBackground is not available when location service prompting feature is enabled , TCC guardflow is in control of location authorization",  (uint8_t *)&v7,  0xCu);
    }
  }

  else
  {
    if (v4)
    {
      int v7 = 136315138;
      double v8 = "+[ADLocationManager prepareForAssistantEnablementInBackground]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Preparing location subsystem for Siri...",  (uint8_t *)&v7,  0xCu);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v6, &stru_1004F3EF8);
  }

@end