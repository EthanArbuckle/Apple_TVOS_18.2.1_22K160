@interface PBSystemAppearanceManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isDaylight;
- (BOOL)isLocationAvailable;
- (CLLocationCoordinate2D)locationForDaylight;
- (CLLocationManager)locationManager;
- (GEOAlmanac)almanac;
- (NSTimer)deferredInterfaceUpdateTimer;
- (PBSystemAppearanceManager)init;
- (double)lastUserInterfaceUpdate;
- (id)_defaultTransitionContext;
- (int64_t)_activeKioskUserInterfaceStyle;
- (int64_t)_systemAppearanceForUserInterfaceStyle:(int64_t)a3;
- (int64_t)_userInterfaceStyleForSystemAppearance:(int64_t)a3;
- (int64_t)effectiveUserInterfaceStyle;
- (int64_t)effectiveUserInterfaceStyleForBundleIdentifier:(id)a3;
- (int64_t)reportingValueForCurrentSystemAppearance;
- (int64_t)systemAppearance;
- (unint64_t)locationFailureCount;
- (void)_handleLocationFailure;
- (void)_setInterfaceStyleToCurrentEffectiveValue;
- (void)_updateLocationForDaylight:(id)a3;
- (void)_updateSystemAppPermissionsToMatchTimeZone;
- (void)_updateUserInterfaceStyleForScenesWithUserInterfaceStyle:(int64_t)a3;
- (void)_videoPlayerNowPlayingStateDidChange:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)screenSaverManagerWillDismissScreenSaver:(id)a3;
- (void)setAlmanac:(id)a3;
- (void)setDeferredInterfaceUpdateTimer:(id)a3;
- (void)setLastUserInterfaceUpdate:(double)a3;
- (void)setLocationFailureCount:(unint64_t)a3;
- (void)setLocationForDaylight:(CLLocationCoordinate2D)a3;
- (void)setLocationManager:(id)a3;
- (void)setSystemAppearance:(int64_t)a3;
- (void)setup;
- (void)toggleSystemAppearance;
- (void)updateAutomaticSystemAppearanceIfNeeded;
@end

@implementation PBSystemAppearanceManager

+ (PBDependencyDescription)dependencyDescription
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100104C74;
  v11[3] = &unk_1003CFF78;
  v11[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v11);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBScreenSaverManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBPowerManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100104D0C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470EE8 != -1) {
    dispatch_once(&qword_100470EE8, block);
  }
  return (id)qword_100470EE0;
}

- (PBSystemAppearanceManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBSystemAppearanceManager;
  v2 = -[PBSystemAppearanceManager init](&v16, "init");
  if (v2)
  {
    id v3 = sub_1000840E0();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting default location to kCLLocationCoordinate2DInvalid",  buf,  2u);
    }

    v2->_locationForDaylight = kCLLocationCoordinate2DInvalid;
    v5 = objc_alloc_init(&OBJC_CLASS___GEOAlmanac);
    almanac = v2->_almanac;
    v2->_almanac = v5;

    uint64_t v7 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( objc_alloc(&OBJC_CLASS___CLLocationManager),  "initWithEffectiveBundlePath:delegate:onQueue:",  @"/System/Library/LocationBundles/TimeZone.bundle",  v2,  &_dispatch_main_q);
    locationManager = v2->_locationManager;
    v2->_locationManager = v7;

    -[CLLocationManager setDesiredAccuracy:]( v2->_locationManager,  "setDesiredAccuracy:",  kCLLocationAccuracyThreeKilometers);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100104F08;
    v13[3] = &unk_1003D0FA8;
    v9 = v2;
    v14 = v9;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v9,  v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v10 addObserver:v9 selector:"_videoPlayerNowPlayingStateDidChange:" name:AVPlayerViewControllerVideoPresentationDidBecomeNowPlayingNotification object:0 suspensionBehavior:4];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v11 addObserver:v9 selector:"_videoPlayerNowPlayingStateDidChange:" name:AVPlayerViewControllerVideoPresentationDidResignNowPlayingNotification object:0 suspensionBehavior:4];
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBSystemAppearanceManager;
  -[PBSystemAppearanceManager dealloc](&v4, "dealloc");
}

- (void)setup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBInternalShortcutManager sharedInstance](&OBJC_CLASS___PBInternalShortcutManager, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100105104;
  v4[3] = &unk_1003D0890;
  objc_copyWeak(&v5, &location);
  [v3 registerWithOption:1 handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (int64_t)systemAppearance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 systemAppearance];

  return (int64_t)v3;
}

- (void)setSystemAppearance:(int64_t)a3
{
  if (-[PBSystemAppearanceManager systemAppearance](self, "systemAppearance") != a3)
  {
    id v5 = sub_1000840E0();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      int64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting System Appearance: %ld",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v7 setSystemAppearance:a3];
    [v7 synchronize];
    if (a3 == 2
      && (self->_locationFailureCount = 0LL,
          !-[PBSystemAppearanceManager isLocationAvailable](self, "isLocationAvailable")))
    {
      id v10 = sub_1000840E0();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "System set to Automatic appearance but location is not available, using dark appearance as default",  (uint8_t *)&v13,  2u);
      }

      v9 = self;
      int64_t v8 = 2LL;
    }

    else
    {
      int64_t v8 = -[PBSystemAppearanceManager effectiveUserInterfaceStyle](self, "effectiveUserInterfaceStyle");
      v9 = self;
    }

    -[PBSystemAppearanceManager _updateUserInterfaceStyleForScenesWithUserInterfaceStyle:]( v9,  "_updateUserInterfaceStyleForScenesWithUserInterfaceStyle:",  v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v12 postNotificationName:PBSSystemAppearanceDidChangeNotification object:0];
  }

- (void)updateAutomaticSystemAppearanceIfNeeded
{
  if ((id)-[PBSystemAppearanceManager systemAppearance](self, "systemAppearance") == (id)2)
  {
    id v3 = sub_1000840E0();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "System set to PBSSystemAppearanceAutomatic, checking if a change is needed...",  buf,  2u);
    }

    if (-[PBSystemAppearanceManager isLocationAvailable](self, "isLocationAvailable"))
    {
      -[PBSystemAppearanceManager _updateUserInterfaceStyleForScenesWithUserInterfaceStyle:]( self,  "_updateUserInterfaceStyleForScenesWithUserInterfaceStyle:",  -[PBSystemAppearanceManager effectiveUserInterfaceStyle](self, "effectiveUserInterfaceStyle"));
    }

    else
    {
      id v5 = sub_1000840E0();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Location is invalid, system is set to PBSSystemAppearanceAutomatic but won't be updated",  v7,  2u);
      }

      -[PBSystemAppearanceManager _handleLocationFailure](self, "_handleLocationFailure");
    }
  }

- (void)_handleLocationFailure
{
  unint64_t v2 = self->_locationFailureCount + 1;
  self->_locationFailureCount = v2;
  if (v2 >= 3)
  {
    id v4 = sub_1000840E0();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Reached maximum location failure count, turning off automatic appearance.",  v6,  2u);
    }

    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    if ((id)-[PBSystemAppearanceManager systemAppearance](self, "systemAppearance") == (id)2) {
      -[PBSystemAppearanceManager _setInterfaceStyleToCurrentEffectiveValue]( self,  "_setInterfaceStyleToCurrentEffectiveValue");
    }
    self->_locationFailureCount = 0LL;
  }

- (BOOL)isDaylight
{
  if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild")
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
        unsigned int v4 = [v3 forceNight],
        v3,
        v4))
  {
    id v5 = sub_1000840E0();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking if it's daylight: (Force night is enabled)",  v13,  2u);
    }

    return 0;
  }

  else
  {
    double latitude = self->_locationForDaylight.latitude;
    double longitude = self->_locationForDaylight.longitude;
    almanac = self->_almanac;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    -[GEOAlmanac calculateAstronomicalTimeForLocation:time:altitudeInDegrees:]( almanac,  "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:",  latitude,  longitude,  v11,  GEOAlmanacAltitudeSunset);
    v12 = self->_almanac;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    return -[GEOAlmanac isDayLightForTime:](v12, "isDayLightForTime:");
  }

- (BOOL)isLocationAvailable
{
  return CLLocationCoordinate2DIsValid(self->_locationForDaylight);
}

- (void)toggleSystemAppearance
{
  if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild")) {
    -[PBSystemAppearanceManager setSystemAppearance:]( self,  "setSystemAppearance:",  (id)-[PBSystemAppearanceManager systemAppearance](self, "systemAppearance") != (id)1);
  }
}

- (int64_t)reportingValueForCurrentSystemAppearance
{
  int64_t result = -[PBSystemAppearanceManager systemAppearance](self, "systemAppearance");
  return result;
}

- (int64_t)effectiveUserInterfaceStyle
{
  return -[PBSystemAppearanceManager _userInterfaceStyleForSystemAppearance:]( self,  "_userInterfaceStyleForSystemAppearance:",  -[PBSystemAppearanceManager systemAppearance](self, "systemAppearance"));
}

- (int64_t)effectiveUserInterfaceStyleForBundleIdentifier:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 installedApplicationWithBundleIdentifier:v3]);

  id v6 = [v5 supportedUserInterfaceStyle];
  id v7 = v3;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v7,  @"default"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneWithIdentifier:v10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientSettings]);

  if ([v12 isUISubclass])
  {
    int64_t v13 = (int64_t)[v12 userInterfaceStyle];
    if (v13)
    {
      id v14 = sub_1000840E0();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138543618;
        id v25 = v7;
        __int16 v26 = 2048;
        uint64_t v27 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Preferred UIUserInterfaceStyle for %{public}@ is %ld",  (uint8_t *)&v24,  0x16u);
      }
    }
  }

  else
  {
    int64_t v13 = 0LL;
  }

  if ([v5 isLegacyContentPartnerApp])
  {
    id v16 = sub_1000840E0();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = 1000LL;
      goto LABEL_21;
    }

    int v24 = 138543618;
    id v25 = v7;
    __int16 v26 = 2048;
    int64_t v13 = 1000LL;
    uint64_t v27 = 1000LL;
    v18 = "%{public}@ specifies a legacy style, effective style is %ld";
    goto LABEL_13;
  }

  if (v13)
  {
    id v19 = sub_1000840E0();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543618;
      id v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      v18 = "%{public}@ specifies an overridden style, effective style is %ld";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, 0x16u);
    }
  }

  else
  {
    if (!v6)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemAppearanceManager sharedInstance]( &OBJC_CLASS___PBSystemAppearanceManager,  "sharedInstance"));
      int64_t v13 = (int64_t)[v21 effectiveUserInterfaceStyle];

      id v22 = sub_1000840E0();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v24 = 138543618;
      id v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      v18 = "%{public}@ specifies an automatic style, effective style is %ld";
      goto LABEL_13;
    }

    id v20 = sub_1000840E0();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543618;
      id v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = (uint64_t)v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ specifies a supported style, effective style is %ld",  (uint8_t *)&v24,  0x16u);
    }

    int64_t v13 = (int64_t)v6;
  }

- (void)_setInterfaceStyleToCurrentEffectiveValue
{
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = [a3 authorizationStatus];
  uint64_t v5 = (uint64_t)v4;
  if (((_DWORD)v4 - 1) <= 1)
  {
    id v6 = sub_1000840E0();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v5 == 2)
      {
        int64_t v8 = @"kCLAuthorizationStatusDenied";
      }

      else if ((_DWORD)v5 == 1)
      {
        int64_t v8 = @"kCLAuthorizationStatusRestricted";
      }

      else
      {
        int64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v5));
      }

      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WARN: Authorization status changed and no longer allows updates, CLAuthorizationStatus: %{public}@",  buf,  0xCu);
    }

LABEL_23:
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    self->_locationForDaylight = kCLLocationCoordinate2DInvalid;
    if ((id)-[PBSystemAppearanceManager systemAppearance](self, "systemAppearance") == (id)2) {
      -[PBSystemAppearanceManager _setInterfaceStyleToCurrentEffectiveValue]( self,  "_setInterfaceStyleToCurrentEffectiveValue");
    }
LABEL_28:
    -[PBSystemAppearanceManager _updateSystemAppPermissionsToMatchTimeZone]( self,  "_updateSystemAppPermissionsToMatchTimeZone");
    return;
  }

  if ((v4 & 0xFFFFFFFB) != 0)
  {
    id v9 = sub_1000840E0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    double v11 = v10;
    if ((_DWORD)v5 != 3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10028107C(v5, v11);
      }

      id v15 = sub_1000840E0();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Unknown authorization status, stopping location-based appearance updates",  buf,  2u);
      }

      goto LABEL_23;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = @"kCLAuthorizationStatusAuthorizedAlways";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Authorization status changed to %{public}@, starting location updates",  buf,  0xCu);
    }

    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    self->_locationFailureCount = 0LL;
  }

  else
  {
    id v12 = sub_1000840E0();
    int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 >= 5) {
        id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v5));
      }
      else {
        id v14 = off_1003D7820[(int)v5];
      }
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Authorization status changed to %{public}@",  buf,  0xCu);
    }

    if ((_DWORD)v5 != 3) {
      goto LABEL_28;
    }
  }

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000840E0();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Location Manager did update locations", v9, 2u);
  }

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  -[PBSystemAppearanceManager _updateLocationForDaylight:](self, "_updateLocationForDaylight:", v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = sub_1000840E0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ERROR: Location update failed: %{public}@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)screenSaverManagerWillDismissScreenSaver:(id)a3
{
  id v4 = sub_1000840E0();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen saver will dimiss", v6, 2u);
  }

  -[PBSystemAppearanceManager updateAutomaticSystemAppearanceIfNeeded](self, "updateAutomaticSystemAppearanceIfNeeded");
}

- (void)_videoPlayerNowPlayingStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000840E0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138543362;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AVKit sent a %{public}@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100105F80;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v6 = (void (**)(void))a5;
  -[PBSystemAppearanceManager updateAutomaticSystemAppearanceIfNeeded](self, "updateAutomaticSystemAppearanceIfNeeded");
  v6[2](v6);
}

- (void)_updateLocationForDaylight:(id)a3
{
  CLLocationDegrees latitude = v12.latitude;
  CLLocationDegrees longitude = v12.longitude;
  if (CLLocationCoordinate2DIsValid(v12))
  {
    self->_locationForDaylight.CLLocationDegrees latitude = latitude;
    self->_locationForDaylight.CLLocationDegrees longitude = longitude;
    self->_locationFailureCount = 0LL;
    id v6 = sub_1000840E0();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updated location for daylight, turning off location updating",  buf,  2u);
    }

    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  }

  else
  {
    id v8 = sub_1000840E0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ERROR: Failed to update location for daylight, CLLocationCoordinate2D is invalid",  v10,  2u);
    }

    -[PBSystemAppearanceManager _handleLocationFailure](self, "_handleLocationFailure");
  }

  -[PBSystemAppearanceManager updateAutomaticSystemAppearanceIfNeeded](self, "updateAutomaticSystemAppearanceIfNeeded");
}

- (void)_updateSystemAppPermissionsToMatchTimeZone
{
  id v2 = +[CLLocationManager authorizationStatusForBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundleIdentifier:",  @"com.apple.locationd.bundle-/System/Library/LocationBundles/TimeZone.bundle");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CLLocationManager sharedManager](&OBJC_CLASS___CLLocationManager, "sharedManager"));
  unsigned int v4 = [v3 authorizationStatus];

  if (v4 != (_DWORD)v2)
  {
    id v5 = sub_1000840E0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      else {
        id v7 = off_1003D7820[(int)v2];
      }
      *(_DWORD *)buf = 138543362;
      double v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting PineBoard location permissions to match Time Zone: %{public}@",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    +[CLLocationManager setAuthorizationStatusByType:forBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundleIdentifier:",  v2,  v9);
  }

- (int64_t)_userInterfaceStyleForSystemAppearance:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      return 1LL;
    case 2LL:
      if (-[PBSystemAppearanceManager isLocationAvailable](self, "isLocationAvailable"))
      {
        if (-[PBSystemAppearanceManager isDaylight](self, "isDaylight")) {
          return 1LL;
        }
        else {
          return 2LL;
        }
      }

      else
      {
        return 2LL;
      }

    case 1LL:
      return 2LL;
    default:
      return 0LL;
  }

- (int64_t)_systemAppearanceForUserInterfaceStyle:(int64_t)a3
{
  return a3 == 2 || a3 == 1000;
}

- (void)_updateUserInterfaceStyleForScenesWithUserInterfaceStyle:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSince1970];
  double v7 = v6;

  double v8 = v7 - self->_lastUserInterfaceUpdate;
  deferredInterfaceUpdateTimer = self->_deferredInterfaceUpdateTimer;
  if (v8 >= 1.0)
  {
    self->_deferredInterfaceUpdateTimer = 0LL;

    self->_lastUserInterfaceUpdate = v7;
    CLLocationCoordinate2D v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100106488;
    v15[3] = &unk_1003D7800;
    v15[4] = a3;
    [v12 enumerateScenesWithBlock:v15];

    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBWallpaperManager sharedInstance](&OBJC_CLASS___PBWallpaperManager, "sharedInstance"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemAppearanceManager _defaultTransitionContext](self, "_defaultTransitionContext"));
    [v13 updateWallpaperWithTransitionContext:v14];
  }

  else
  {
    -[NSTimer invalidate](deferredInterfaceUpdateTimer, "invalidate");
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100106454;
    v16[3] = &unk_1003D77C0;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a3;
    id v10 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v16,  1.0 - v8));
    double v11 = self->_deferredInterfaceUpdateTimer;
    self->_deferredInterfaceUpdateTimer = v10;

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

- (id)_defaultTransitionContext
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneTransitionContext transitionContext]( &OBJC_CLASS___FBSSceneTransitionContext,  "transitionContext"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSAnimationSettings settingsWithDuration:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:",  0.5));
  [v3 setAnimationSettings:v4];

  [v3 setAnimationFence:v2];
  return v3;
}

- (int64_t)_activeKioskUserInterfaceStyle
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_kioskAppSceneIdentity]( &OBJC_CLASS___FBSSceneIdentity,  "pb_kioskAppSceneIdentity"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 sceneWithIdentifier:v4]);

  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
    if ([v6 isUISubclass])
    {
      int64_t v7 = (int64_t)[v6 userInterfaceStyle];
      id v8 = sub_1000840E0();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1002811C4(v5);
      }
    }

    else
    {
      int64_t v7 = 2LL;
    }
  }

  else
  {
    int64_t v7 = 2LL;
  }

  return v7;
}

- (GEOAlmanac)almanac
{
  return self->_almanac;
}

- (void)setAlmanac:(id)a3
{
}

- (CLLocationCoordinate2D)locationForDaylight
{
  double latitude = self->_locationForDaylight.latitude;
  double longitude = self->_locationForDaylight.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setLocationForDaylight:(CLLocationCoordinate2D)a3
{
  self->_locationForDaylight = a3;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (unint64_t)locationFailureCount
{
  return self->_locationFailureCount;
}

- (void)setLocationFailureCount:(unint64_t)a3
{
  self->_locationFailureCount = a3;
}

- (double)lastUserInterfaceUpdate
{
  return self->_lastUserInterfaceUpdate;
}

- (void)setLastUserInterfaceUpdate:(double)a3
{
  self->_lastUserInterfaceUpdate = a3;
}

- (NSTimer)deferredInterfaceUpdateTimer
{
  return self->_deferredInterfaceUpdateTimer;
}

- (void)setDeferredInterfaceUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end