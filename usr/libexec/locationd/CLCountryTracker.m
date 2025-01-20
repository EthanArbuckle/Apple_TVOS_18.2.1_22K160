@interface CLCountryTracker
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)allowSimulatedLocations;
- (BOOL)countriesAreUnchanged:(id)a3;
- (BOOL)locationIsUsable:(id)a3;
- (BOOL)previousDisputedState;
- (BOOL)skipUpdatingRegulatoryDomain;
- (CLCountryTracker)init;
- (CLLocation)previousLocation;
- (CLLocationManager)locManager;
- (CLSettingsMirror)settings;
- (NSArray)previousCountries;
- (double)calculateDistance:(id)a3 b:(id)a4;
- (double)debounceTime;
- (double)maximumCountryLocationChangeAccuracy;
- (double)maximumCountryLocationChangeSpeed;
- (double)minimumMoveDistance;
- (double)previousCountryCodeTimeStamp;
- (double)stalenessTime;
- (double)timeToActiveGiveup;
- (double)timeToRequestCheapActiveLocation;
- (double)timeToUnknown;
- (id).cxx_construct;
- (int)authStatus;
- (int)countryCodeDebounceInterval;
- (int)minimumConfidence;
- (void)beginService;
- (void)checkLocationServicesStatus;
- (void)endService;
- (void)handleNewLocation:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)onLocationUnknownTimer;
- (void)onManagerNotification:(const int *)a3 data:(const void *)a4;
- (void)refreshSettings;
- (void)requestLocationWithDesiredAccuracy:(double)a3;
- (void)sendUpdateToRDIfAllowed:(id)a3;
- (void)setAllowSimulatedLocations:(BOOL)a3;
- (void)setAuthStatus:(int)a3;
- (void)setCountryCodeDebounceInterval:(int)a3;
- (void)setDebounceTime:(double)a3;
- (void)setLocManager:(id)a3;
- (void)setMaximumCountryLocationChangeAccuracy:(double)a3;
- (void)setMaximumCountryLocationChangeSpeed:(double)a3;
- (void)setMinimumConfidence:(int)a3;
- (void)setMinimumMoveDistance:(double)a3;
- (void)setPreviousCountries:(id)a3;
- (void)setPreviousCountryCodeTimeStamp:(double)a3;
- (void)setPreviousDisputedState:(BOOL)a3;
- (void)setPreviousLocation:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSkipUpdatingRegulatoryDomain:(BOOL)a3;
- (void)setStalenessTime:(double)a3;
- (void)setTimeToActiveGiveup:(double)a3;
- (void)setTimeToRequestCheapActiveLocation:(double)a3;
- (void)setTimeToUnknown:(double)a3;
- (void)updateLocationUnknown;
@end

@implementation CLCountryTracker

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101996CC0 != -1) {
    dispatch_once(&qword_101996CC0, &stru_10183F1D8);
  }
  return (id)qword_101996CB8;
}

- (CLCountryTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCountryTracker;
  return -[CLCountryTracker initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCountryTrackerProtocol,  &OBJC_PROTOCOL___CLCountryTrackerClientProtocol);
}

- (void)beginService
{
  self->fAtLeastOneValidLocation = 0;
  self->fAtLeastOneAuthDetermination = 0;
  self->_previousLocation = 0LL;
  self->fLocationUnknownTimeoutTimer = 0LL;
  self->_previousCountryCodeTimeStamp = -1.0;
  self->_previousDisputedState = 0;
  -[CLCountryTracker setSettings:]( self,  "setSettings:",  -[CLSettingsMirror initInUniverse:]( objc_alloc(&OBJC_CLASS___CLSettingsMirror),  "initInUniverse:",  -[CLCountryTracker universe](self, "universe")));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100532508;
  v38[3] = &unk_10183F200;
  v38[4] = self;
  -[CLSettingsMirror setSettingsChangeHandler:]( -[CLCountryTracker settings](self, "settings"),  "setSettingsChangeHandler:",  v38);
  -[CLCountryTracker refreshSettings](self, "refreshSettings");
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  objc_super v3 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = -[CLCountryTracker skipUpdatingRegulatoryDomain](self, "skipUpdatingRegulatoryDomain");
    unsigned int v5 = -[CLCountryTracker allowSimulatedLocations](self, "allowSimulatedLocations");
    unsigned int v6 = -[CLCountryTracker minimumConfidence](self, "minimumConfidence");
    -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
    uint64_t v8 = v7;
    -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
    uint64_t v10 = v9;
    -[CLCountryTracker minimumMoveDistance](self, "minimumMoveDistance");
    uint64_t v12 = v11;
    -[CLCountryTracker debounceTime](self, "debounceTime");
    uint64_t v14 = v13;
    -[CLCountryTracker stalenessTime](self, "stalenessTime");
    uint64_t v16 = v15;
    -[CLCountryTracker timeToUnknown](self, "timeToUnknown");
    uint64_t v18 = v17;
    -[CLCountryTracker timeToActiveGiveup](self, "timeToActiveGiveup");
    buf.__r_.__value_.__r.__words[0] = 68291586LL;
    LOWORD(buf.__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf.__r_.__value_.__r.__words[2]) = 1026;
    HIDWORD(buf.__r_.__value_.__r.__words[2]) = v4;
    __int16 v44 = 1026;
    unsigned int v45 = v5;
    __int16 v46 = 1026;
    unsigned int v47 = v6;
    __int16 v48 = 2050;
    uint64_t v49 = v8;
    __int16 v50 = 2050;
    uint64_t v51 = v10;
    __int16 v52 = 2050;
    uint64_t v53 = v12;
    __int16 v54 = 2050;
    uint64_t v55 = v14;
    __int16 v56 = 2050;
    uint64_t v57 = v16;
    __int16 v58 = 2050;
    uint64_t v59 = v18;
    __int16 v60 = 2050;
    uint64_t v61 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:settings initialized, SkipUpdatingRegulatoryDomain:%{public}hhd, AllowSimulatedLoca tions:%{public}hhd, CountryLocationMinimumConfidence:%{public}d, MaximumCountryLocationChangeSpeed:%{p ublic}f, MaximumCountryLocationChangeAccuracy:%{public}f, MinimumMoveDistance:%{public}f, Coun tryLocationDebounceTime:%{public}f, CountryLocationStalenessTime:%{public}f, TimeToCountryUnknown :%{public}f, TimeToCountryCheapLocation:%{public}f}",  (uint8_t *)&buf,  0x6Au);
  }

  self->_locManager = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( [CLLocationManager alloc],  "initWithEffectiveBundlePath:delegate:onQueue:",  @"/System/Library/LocationBundles/CountryTracker.bundle",  self,  objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "queue"));
  self->_authStatus = 0;
  sub_100583844((uint64_t)sub_100532510, (uint64_t)self, -[CLCountryTracker universe](self, "universe"), &buf);
  v20 = (Client *)buf.__r_.__value_.__r.__words[0];
  buf.__r_.__value_.__r.__words[0] = 0LL;
  value = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = v20;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    std::string::size_type v22 = buf.__r_.__value_.__r.__words[0];
    buf.__r_.__value_.__r.__words[0] = 0LL;
    if (v22) {
      (*(void (**)(std::string::size_type))(*(void *)v22 + 8LL))(v22);
    }
  }

  [*((id *)self->fClientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->fClientManagerClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  [*((id *)self->fClientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->fClientManagerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  memset(&buf, 0, sizeof(buf));
  std::string::operator=(&buf, (const std::string *)&qword_101996CA0);
  [*((id *)self->fClientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->fClientManagerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:sub_10120E548((uint64_t)&buf)];
  v23 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "newTimer");
  self->fLocationUnknownTimeoutTimer = v23;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100532520;
  v37[3] = &unk_10181A288;
  v37[4] = self;
  -[CLTimer setHandler:](v23, "setHandler:", v37);
  fLocationUnknownTimeoutTimer = self->fLocationUnknownTimeoutTimer;
  -[CLCountryTracker timeToUnknown](self, "timeToUnknown");
  -[CLTimer setNextFireDelay:](fLocationUnknownTimeoutTimer, "setNextFireDelay:");
  v25 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "newTimer");
  self->fActiveLocationDeregisterTimer = v25;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100532528;
  v36[3] = &unk_10181A288;
  v36[4] = self;
  -[CLTimer setHandler:](v25, "setHandler:", v36);
  fActiveLocationDeregisterTimer = self->fActiveLocationDeregisterTimer;
  -[CLCountryTracker timeToActiveGiveup](self, "timeToActiveGiveup");
  -[CLTimer setNextFireDelay:](fActiveLocationDeregisterTimer, "setNextFireDelay:");
  self->fReceiveStatusEverywhere = 0;
  sub_1002F0B04(v39);
  sub_1002A6F64(*(uint64_t *)v39, "RDAliveAgainAllPlatforms", &self->fReceiveStatusEverywhere);
  v27 = *(std::__shared_weak_count **)v40;
  if (*(void *)v40)
  {
    v28 = (unint64_t *)(*(void *)v40 + 8LL);
    do
      unint64_t v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  if (objc_opt_class(&OBJC_CLASS___RDStatusShareWrapper))
  {
    v30 = objc_alloc_init(&OBJC_CLASS___RDStatusShareWrapper);
    self->fShareListener = v30;
    if (self->fReceiveStatusEverywhere) {
      -[RDStatusShareWrapper listenForStatus:](v30, "listenForStatus:", &stru_10183F240);
    }
  }

  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  v31 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
  {
    -[CLCountryTracker timeToActiveGiveup](self, "timeToActiveGiveup");
    *(_DWORD *)v39 = 68289282;
    *(_DWORD *)&v39[4] = 0;
    *(_WORD *)v40 = 2082;
    *(void *)&v40[2] = "";
    __int16 v41 = 1026;
    int v42 = (int)v32;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:initially requesting best possible update accuracy to find where we are, duration:%{public}d}",  v39,  0x18u);
  }

  -[CLCountryTracker requestLocationWithDesiredAccuracy:]( self,  "requestLocationWithDesiredAccuracy:",  kCLLocationAccuracyBest);
  v33 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "newTimer");
  self->fLocationRequestTimer = v33;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100532900;
  v35[3] = &unk_10181A288;
  v35[4] = self;
  -[CLTimer setHandler:](v33, "setHandler:", v35);
  fLocationRequestTimer = self->fLocationRequestTimer;
  -[CLCountryTracker timeToRequestCheapActiveLocation](self, "timeToRequestCheapActiveLocation");
  -[CLTimer setNextFireDelay:](fLocationRequestTimer, "setNextFireDelay:");
  -[CLLocationManager startUpdatingLocation](self->_locManager, "startUpdatingLocation");
}

- (void)endService
{
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  objc_super v3 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:shutting down...}",  buf,  0x12u);
  }

  -[CLCountryTracker requestLocationWithDesiredAccuracy:]( self,  "requestLocationWithDesiredAccuracy:",  kCLLocationAccuracyBystander);
  value = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100532C00;
  v5[3] = &unk_10181A288;
  v5[4] = -[CLCountryTracker locManager](self, "locManager");
  objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "async:", v5);
  -[CLCountryTracker setLocManager:](self, "setLocManager:", 0LL);
  if (objc_opt_class(&OBJC_CLASS___RDStatusShareWrapper))
  {

    self->fShareListener = 0LL;
  }

  -[CLTimer invalidate](self->fLocationRequestTimer, "invalidate");

  self->fLocationRequestTimer = 0LL;
  -[CLTimer invalidate](self->fLocationUnknownTimeoutTimer, "invalidate");

  self->fLocationUnknownTimeoutTimer = 0LL;
  -[CLTimer invalidate](self->fActiveLocationDeregisterTimer, "invalidate");

  self->fActiveLocationDeregisterTimer = 0LL;
}

- (void)refreshSettings
{
  self->_maximumCountryLocationChangeSpeed = v3;
  -[CLSettingsMirror doubleForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "doubleForKey:defaultValue:",  @"MaximumCountryLocationChangeAccuracy",  1000.0);
  self->_maximumCountryLocationChangeAccuracy = v4;
  -[CLSettingsMirror doubleForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "doubleForKey:defaultValue:",  @"MinimumMoveDistance",  5000.0);
  self->_minimumMoveDistance = v5;
  -[CLSettingsMirror doubleForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "doubleForKey:defaultValue:",  @"CountryLocationDebounceTime",  180.0);
  self->_debounceTime = v6;
  -[CLSettingsMirror doubleForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "doubleForKey:defaultValue:",  @"CountryLocationStalenessTime",  600.0);
  self->_stalenessTime = v7;
  -[CLSettingsMirror doubleForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "doubleForKey:defaultValue:",  @"TimeToCountryUnknown",  3600.0);
  self->_timeToUnknown = v8;
  -[CLSettingsMirror doubleForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "doubleForKey:defaultValue:",  @"TimeToCountryCheapLocation",  10.0);
  self->_timeToActiveGiveup = v9;
  self->_minimumConfidence = -[CLSettingsMirror intForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "intForKey:defaultValue:",  @"CountryLocationMinimumConfidence",  33LL);
  self->_skipUpdatingRegulatoryDomain = -[CLSettingsMirror BOOLForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "BOOLForKey:defaultValue:",  @"SkipUpdatingRegulatoryDomain",  0LL);
  self->_allowSimulatedLocations = -[CLSettingsMirror BOOLForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "BOOLForKey:defaultValue:",  @"AllowSimulatedLocations",  0LL);
  self->_countryCodeDebounceInterval = -[CLSettingsMirror intForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "intForKey:defaultValue:",  @"CountryDebounceInterval",  10800LL);
  -[CLSettingsMirror doubleForKey:defaultValue:]( -[CLCountryTracker settings](self, "settings"),  "doubleForKey:defaultValue:",  @"TimeToRequestCheapActiveLocation",  1800.0);
  self->_timeToRequestCheapActiveLocation = v10;
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  uint64_t v11 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = -[CLCountryTracker skipUpdatingRegulatoryDomain](self, "skipUpdatingRegulatoryDomain");
    unsigned int v13 = -[CLCountryTracker allowSimulatedLocations](self, "allowSimulatedLocations");
    unsigned int v14 = -[CLCountryTracker minimumConfidence](self, "minimumConfidence");
    -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
    uint64_t v16 = v15;
    -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
    uint64_t v18 = v17;
    -[CLCountryTracker minimumMoveDistance](self, "minimumMoveDistance");
    uint64_t v20 = v19;
    -[CLCountryTracker debounceTime](self, "debounceTime");
    uint64_t v22 = v21;
    -[CLCountryTracker stalenessTime](self, "stalenessTime");
    uint64_t v24 = v23;
    -[CLCountryTracker timeToUnknown](self, "timeToUnknown");
    uint64_t v26 = v25;
    -[CLCountryTracker timeToActiveGiveup](self, "timeToActiveGiveup");
    uint64_t v28 = v27;
    -[CLCountryTracker timeToRequestCheapActiveLocation](self, "timeToRequestCheapActiveLocation");
    v30[0] = 68292098;
    v30[1] = 0;
    __int16 v31 = 2082;
    double v32 = "";
    __int16 v33 = 1026;
    unsigned int v34 = v12;
    __int16 v35 = 1026;
    unsigned int v36 = v13;
    __int16 v37 = 1026;
    unsigned int v38 = v14;
    __int16 v39 = 2050;
    uint64_t v40 = v16;
    __int16 v41 = 2050;
    uint64_t v42 = v18;
    __int16 v43 = 2050;
    uint64_t v44 = v20;
    __int16 v45 = 2050;
    uint64_t v46 = v22;
    __int16 v47 = 2050;
    uint64_t v48 = v24;
    __int16 v49 = 2050;
    uint64_t v50 = v26;
    __int16 v51 = 2050;
    uint64_t v52 = v28;
    __int16 v53 = 2050;
    uint64_t v54 = v29;
    __int16 v55 = 1026;
    unsigned int v56 = -[CLCountryTracker countryCodeDebounceInterval](self, "countryCodeDebounceInterval");
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:settings updated, SkipUpdatingRegulatoryDomain:%{public}hhd, AllowSimulatedLocation s:%{public}hhd, CountryLocationMinimumConfidence:%{public}d, MaximumCountryLocationChangeSpeed:%{publi c}f, MaximumCountryLocationChangeAccuracy:%{public}f, MinimumMoveDistance:%{public}f, CountryL ocationDebounceTime:%{public}f, CountryLocationStalenessTime:%{public}f, TimeToCountryUnknown: %{public}f, TimeToCountryCheapLocation:%{public}f, TimeToRequestCheapActiveLocation:%{public}f, CountryDebounceInterval:%{public}d}",  (uint8_t *)v30,  0x7Au);
  }

- (BOOL)locationIsUsable:(id)a3
{
  if (v5 >= 0.0)
  {
    [a3 coordinate];
    double v10 = v9;
    [a3 coordinate];
    if (sub_1002954D0(v10, v11))
    {
      [a3 speed];
      double v13 = v12;
      -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
      if (v13 <= v14)
      {
        [a3 horizontalAccuracy];
        double v23 = v22;
        -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
        if (v23 <= v24)
        {
          if (a3)
          {
            [a3 clientLocation];
            int v28 = DWORD1(v40);
          }

          else
          {
            int v28 = 0;
            __int128 v42 = 0u;
            memset(v43, 0, sizeof(v43));
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            memset(buf, 0, sizeof(buf));
          }

          if (v28 >= -[CLCountryTracker minimumConfidence](self, "minimumConfidence"))
          {
            if (objc_msgSend(objc_msgSend(a3, "sourceInformation"), "isSimulatedBySoftware")
              && !-[CLCountryTracker allowSimulatedLocations](self, "allowSimulatedLocations"))
            {
              if (qword_101934930 != -1) {
                dispatch_once(&qword_101934930, &stru_10183F288);
              }
              uint64_t v6 = qword_101934938;
              BOOL v7 = os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO);
              if (v7)
              {
                *(_DWORD *)std::string buf = 68289026;
                *(_DWORD *)&uint8_t buf[4] = 0;
                *(_WORD *)&buf[8] = 2082;
                *(void *)&buf[10] = "";
                double v8 = "{msg%{public}.0s:location is simulated, rejecting}";
                goto LABEL_16;
              }
            }

            else
            {
              LOBYTE(v7) = 1;
            }
          }

          else
          {
            if (qword_101934930 != -1) {
              dispatch_once(&qword_101934930, &stru_10183F288);
            }
            uint64_t v29 = qword_101934938;
            BOOL v7 = os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO);
            if (v7)
            {
              if (a3)
              {
                [a3 clientLocation];
                int v30 = DWORD1(v40);
              }

              else
              {
                int v30 = 0;
                __int128 v42 = 0u;
                memset(v43, 0, sizeof(v43));
                __int128 v40 = 0u;
                __int128 v41 = 0u;
                __int128 v38 = 0u;
                __int128 v39 = 0u;
                memset(buf, 0, sizeof(buf));
              }

              v32[0] = 68289282;
              v32[1] = 0;
              __int16 v33 = 2082;
              unsigned int v34 = "";
              __int16 v35 = 1026;
              int v36 = v30;
              double v8 = "{msg%{public}.0s:location confidence too low, discarding, confidence:%{public}d}";
              uint64_t v19 = (uint8_t *)v32;
              uint64_t v20 = (os_log_s *)v29;
              uint32_t v21 = 24;
              goto LABEL_23;
            }
          }

          return v7;
        }

        if (qword_101934930 != -1) {
          dispatch_once(&qword_101934930, &stru_10183F288);
        }
        uint64_t v15 = qword_101934938;
        BOOL v7 = os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO);
        if (!v7) {
          return v7;
        }
        [a3 horizontalAccuracy];
        uint64_t v26 = v25;
        -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
        *(_DWORD *)std::string buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v26;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v27;
        double v8 = "{msg%{public}.0s:location accuracy too low, discarding, accuracy:%{public}f, limit:%{public}f}";
      }

      else
      {
        if (qword_101934930 != -1) {
          dispatch_once(&qword_101934930, &stru_10183F288);
        }
        uint64_t v15 = qword_101934938;
        BOOL v7 = os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO);
        if (!v7) {
          return v7;
        }
        [a3 speed];
        uint64_t v17 = v16;
        -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
        *(_DWORD *)std::string buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v17;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v18;
        double v8 = "{msg%{public}.0s:location speed too high, discarding, speed:%{public}f, limit:%{public}f}";
      }

      uint64_t v19 = buf;
      uint64_t v20 = (os_log_s *)v15;
      uint32_t v21 = 38;
      goto LABEL_23;
    }

    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    uint64_t v6 = qword_101934938;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO);
    if (v7)
    {
      *(_DWORD *)std::string buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      double v8 = "{msg%{public}.0s:location not valid: bad coordinate}";
      goto LABEL_16;
    }
  }

  else
  {
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    uint64_t v6 = qword_101934938;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO);
    if (v7)
    {
      *(_DWORD *)std::string buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      double v8 = "{msg%{public}.0s:location not valid: horizontalAccuracy less than zero}";
LABEL_16:
      uint64_t v19 = buf;
      uint64_t v20 = (os_log_s *)v6;
      uint32_t v21 = 18;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v8, v19, v21);
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = objc_msgSend(a4, "firstObject", a3);
  if (-[CLCountryTracker locationIsUsable:](self, "locationIsUsable:", v5))
  {
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    uint64_t v6 = (os_log_s *)qword_101934938;
    if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO))
    {
      [v5 coordinate];
      uint64_t v8 = v7;
      [v5 coordinate];
      uint64_t v10 = v9;
      [v5 horizontalAccuracy];
      uint64_t v12 = v11;
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSince1970");
      uint64_t v14 = v13;
      if (v5)
      {
        [v5 clientLocation];
        uint64_t v15 = *((void *)&v80 + 1);
        [v5 clientLocation];
        int v16 = DWORD1(v56);
      }

      else
      {
        int v16 = 0;
        uint64_t v15 = 0LL;
        __int128 v82 = 0u;
        memset(v83, 0, sizeof(v83));
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        memset(v79, 0, sizeof(v79));
        *(_OWORD *)&v60[-4] = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v51 = 0u;
      }

      *(_DWORD *)std::string buf = 134284801;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2049;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v12;
      *(_WORD *)&buf[32] = 2048;
      *(void *)&buf[34] = v14;
      *(_WORD *)&buf[42] = 2048;
      *(void *)&buf[44] = v15;
      *(_WORD *)&buf[52] = 1024;
      *(_DWORD *)&buf[54] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Got a usable location <%{private}+.8lf,%{private}+.8lf>, acc %.2f, timestamp %.2f, lifespan %.2f, confidence %d",  buf,  0x3Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(v79, 0x65CuLL);
      if (qword_101934930 != -1) {
        dispatch_once(&qword_101934930, &stru_10183F288);
      }
      uint64_t v39 = qword_101934938;
      [v5 coordinate];
      uint64_t v41 = v40;
      [v5 coordinate];
      uint64_t v43 = v42;
      [v5 horizontalAccuracy];
      uint64_t v45 = v44;
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSince1970");
      uint64_t v47 = v46;
      if (v5)
      {
        [v5 clientLocation];
        uint64_t v48 = *((void *)&v56 + 1);
        [v5 clientLocation];
        int v49 = DWORD1(v63);
      }

      else
      {
        int v49 = 0;
        *(_OWORD *)&v60[-4] = 0u;
        uint64_t v48 = 0LL;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v51 = 0u;
        __int128 v65 = 0u;
        memset(v66, 0, 28);
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v62 = 0u;
        memset(buf, 0, sizeof(buf));
      }

      int v67 = 134284801;
      uint64_t v68 = v41;
      __int16 v69 = 2049;
      uint64_t v70 = v43;
      __int16 v71 = 2048;
      uint64_t v72 = v45;
      __int16 v73 = 2048;
      uint64_t v74 = v47;
      __int16 v75 = 2048;
      uint64_t v76 = v48;
      __int16 v77 = 1024;
      int v78 = v49;
      uint64_t v50 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  v79,  1628LL,  &_mh_execute_header,  v39,  1LL,  "Got a usable location <%{private}+.8lf,%{private}+.8lf>, acc %.2f, timestamp %.2f, lifespan %.2f, confidence %d",  &v67,  58,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59,  *(void *)v60,  *(_DWORD *)&v60[8],  *(void *)buf,  *(void *)&buf[8],  *(void *)&buf[16],  *(void *)&buf[24],  *(_OWORD *)&buf[32],  *(void *)&buf[48],  *(void *)&buf[56],  v62,  (void)v63,  *((void *)&v63 + 1),  v64,  v65,  v66[0],  *(void *)&v66[1],  *((void *)&v66[1] + 1));
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCountryTracker locationManager:didUpdateLocations:]", "%s\n", v50);
    }

    fLocationRequestTimer = self->fLocationRequestTimer;
    -[CLCountryTracker timeToRequestCheapActiveLocation](self, "timeToRequestCheapActiveLocation");
    -[CLTimer setNextFireDelay:](fLocationRequestTimer, "setNextFireDelay:");
    if (!self->fAtLeastOneValidLocation) {
      goto LABEL_23;
    }
    -[CLCountryTracker calculateDistance:b:]( self,  "calculateDistance:b:",  v5,  -[CLCountryTracker previousLocation](self, "previousLocation"));
    double v19 = v18;
    objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSince1970");
    double v21 = v20;
    -[NSDate timeIntervalSince1970]( -[CLLocation timestamp](-[CLCountryTracker previousLocation](self, "previousLocation"), "timestamp"),  "timeIntervalSince1970");
    double v23 = v22;
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    double v24 = vabdd_f64(v21, v23);
    uint64_t v25 = (os_log_s *)qword_101934938;
    if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO))
    {
      -[CLCountryTracker debounceTime](self, "debounceTime");
      uint64_t v27 = v26;
      -[CLCountryTracker stalenessTime](self, "stalenessTime");
      uint64_t v29 = v28;
      -[CLLocation coordinate](-[CLCountryTracker previousLocation](self, "previousLocation"), "coordinate");
      uint64_t v31 = v30;
      -[CLLocation coordinate](-[CLCountryTracker previousLocation](self, "previousLocation"), "coordinate");
      *(_DWORD *)v79 = 68290563;
      *(_DWORD *)&v79[4] = 0;
      *(_WORD *)&v79[8] = 2082;
      *(void *)&v79[10] = "";
      *(_WORD *)&v79[18] = 2050;
      *(double *)&v79[20] = v19;
      *(_WORD *)&v79[28] = 2050;
      *(double *)&v79[30] = v24;
      *(_WORD *)&v79[38] = 2050;
      *(void *)&v79[40] = v27;
      *(_WORD *)&v79[48] = 2050;
      *(void *)&v79[50] = v29;
      *(_WORD *)&v79[58] = 2049;
      *(void *)&v79[60] = v31;
      *(_WORD *)&v79[68] = 2049;
      *(void *)&v79[70] = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:computed deltas, deltaR:%{public}f, deltaT:%{public}f, debounceTime :%{public}f, staleTime:%{public}f, prevLat:%{private}f, prevLon:%{private}f}",  v79,  0x4Eu);
    }

    if (!self->fAtLeastOneValidLocation)
    {
LABEL_23:
      if (qword_101934930 != -1) {
        dispatch_once(&qword_101934930, &stru_10183F288);
      }
      __int128 v38 = (os_log_s *)qword_101934938;
      if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v79 = 68289026;
        *(_DWORD *)&v79[4] = 0;
        *(_WORD *)&v79[8] = 2082;
        *(void *)&v79[10] = "";
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:first valid location since start!}",  v79,  0x12u);
      }

      -[CLCountryTracker requestLocationWithDesiredAccuracy:]( self,  "requestLocationWithDesiredAccuracy:",  kCLLocationAccuracyBystander);
      -[CLTimer setNextFireDelay:](self->fActiveLocationDeregisterTimer, "setNextFireDelay:", 1.79769313e308);
      goto LABEL_28;
    }

    -[CLCountryTracker minimumMoveDistance](self, "minimumMoveDistance");
    if (v19 > v33 && (-[CLCountryTracker debounceTime](self, "debounceTime"), v24 >= v34))
    {
      if (qword_101934930 != -1) {
        dispatch_once(&qword_101934930, &stru_10183F288);
      }
      int v36 = (os_log_s *)qword_101934938;
      if (!os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
      *(_DWORD *)v79 = 68289026;
      *(_DWORD *)&v79[4] = 0;
      *(_WORD *)&v79[8] = 2082;
      *(void *)&v79[10] = "";
      __int16 v37 = "{msg%{public}.0s:accepting location because we've moved enough and we're past the debounce time}";
    }

    else
    {
      -[CLCountryTracker stalenessTime](self, "stalenessTime");
      if (v24 < v35) {
        return;
      }
      if (qword_101934930 != -1) {
        dispatch_once(&qword_101934930, &stru_10183F288);
      }
      int v36 = (os_log_s *)qword_101934938;
      if (!os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
      *(_DWORD *)v79 = 68289026;
      *(_DWORD *)&v79[4] = 0;
      *(_WORD *)&v79[8] = 2082;
      *(void *)&v79[10] = "";
      __int16 v37 = "{msg%{public}.0s:accepting location because it's been long enough without an update}";
    }

    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v37, v79, 0x12u);
LABEL_28:
    -[CLCountryTracker handleNewLocation:](self, "handleNewLocation:", v5);

    self->_previousLocation = 0LL;
    self->_previousLocation = (CLLocation *)v5;
    self->fAtLeastOneValidLocation = 1;
    -[CLTimer setNextFireDelay:](self->fLocationUnknownTimeoutTimer, "setNextFireDelay:", 1.79769313e308);
  }

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  self->fAtLeastOneAuthDetermination = 1;
  -[CLCountryTracker setAuthStatus:](self, "setAuthStatus:", [a3 authorizationStatus]);
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  double v4 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
  {
    -[CLCountryTracker authStatus](self, "authStatus");
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    uint64_t v7 = "";
    __int16 v8 = 2050;
    uint64_t v9 = -[CLCountryTracker authStatus](self, "authStatus");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:authorization status changed, status:%{public, location:CLAuthorizationStatus}lld}",  (uint8_t *)v5,  0x1Cu);
  }

  -[CLCountryTracker checkLocationServicesStatus](self, "checkLocationServicesStatus");
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  __int16 v6 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    uint64_t v10 = "";
    __int16 v11 = 2082;
    id v12 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Got location unavailable, error:%{public, location:escape_only}s}",  (uint8_t *)v8,  0x1Cu);
  }

  if (self->fAtLeastOneValidLocation)
  {
    fLocationUnknownTimeoutTimer = self->fLocationUnknownTimeoutTimer;
    -[CLCountryTracker timeToUnknown](self, "timeToUnknown");
    -[CLTimer setNextFireDelay:](fLocationUnknownTimeoutTimer, "setNextFireDelay:");
  }

+ (BOOL)isSupported
{
  return 1;
}

- (void)sendUpdateToRDIfAllowed:(id)a3
{
  if (&_RDUpdateCountryCodeInfoFromLocation)
  {
    if (-[CLCountryTracker skipUpdatingRegulatoryDomain](self, "skipUpdatingRegulatoryDomain"))
    {
      if (qword_101934930 != -1) {
        dispatch_once(&qword_101934930, &stru_10183F288);
      }
      double v4 = (os_log_s *)qword_101934938;
      if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_INFO))
      {
        v5[0] = 68289026;
        v5[1] = 0;
        __int16 v6 = 2082;
        uint64_t v7 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:skipping country code update because of setting}",  (uint8_t *)v5,  0x12u);
      }
    }

    else
    {
      RDUpdateCountryCodeInfoFromLocation(a3);
    }
  }

- (BOOL)countriesAreUnchanged:(id)a3
{
  __int16 v6 = -[CLCountryTracker previousCountries](self, "previousCountries");
  BOOL result = 0;
  if (a3)
  {
    if (v6)
    {
      uint64_t v7 = -[NSSet initWithArray:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithArray:",  -[CLCountryTracker previousCountries](self, "previousCountries"));
      __int16 v8 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", a3);
      unsigned __int8 v9 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v8);

      return v9;
    }
  }

  return result;
}

- (void)handleNewLocation:(id)a3
{
  double v6 = v5;
  [a3 coordinate];
  id v8 = objc_msgSend([GEOLocation alloc], "initWithGEOCoordinate:", v6, v7);
  if (v8)
  {
    unsigned __int8 v9 = v8;
    [a3 altitude];
    [v9 setAltitude:(int)v10];
    [a3 horizontalAccuracy];
    objc_msgSend(v9, "setHorizontalAccuracy:");
    [a3 verticalAccuracy];
    objc_msgSend(v9, "setVerticalAccuracy:");
    unsigned int v11 = [a3 referenceFrame];
    if (v11 == 1) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = 2 * (v11 == 2);
    }
    [v9 setReferenceFrame:v12];
    *(void *)std::string buf = 0LL;
    *(void *)&__int128 v17 = buf;
    *((void *)&v17 + 1) = 0x3052000000LL;
    double v18 = sub_100534298;
    double v19 = sub_1005342A8;
    double v20 = -[CLOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CLOSTransaction),  "initWithDescription:",  "com.apple.locationd.CountryTracker.fetchCountries");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1005342B4;
    v15[3] = &unk_10183F268;
    v15[4] = self;
    v15[5] = buf;
    +[GEOGeographicMetadataRequester fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:]( GEOGeographicMetadataRequester,  "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:",  v9,  objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "queue"),  v15);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    uint64_t v13 = (os_log_s *)qword_101934938;
    if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v17) = 2082;
      *(void *)((char *)&v17 + 2) = "";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:failed to allocate a GEOLocation object?}",  buf,  0x12u);
      if (qword_101934930 != -1) {
        dispatch_once(&qword_101934930, &stru_10183F288);
      }
    }

    uint64_t v14 = (os_log_s *)qword_101934938;
    if (os_signpost_enabled((os_log_t)qword_101934938))
    {
      *(_DWORD *)std::string buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v17) = 2082;
      *(void *)((char *)&v17 + 2) = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "failed to allocate a GEOLocation object?",  "{msg%{public}.0s:failed to allocate a GEOLocation object?}",  buf,  0x12u);
    }
  }

- (void)updateLocationUnknown
{
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  double v3 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    double v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:setting country code from location to be unknown}",  (uint8_t *)v4,  0x12u);
  }

  -[CLCountryTracker sendUpdateToRDIfAllowed:](self, "sendUpdateToRDIfAllowed:", 0LL);
}

- (void)onLocationUnknownTimer
{
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  double v3 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    double v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:no known location received beyond the time limit}",  (uint8_t *)v4,  0x12u);
  }

  self->fAtLeastOneValidLocation = 0;

  self->_previousLocation = 0LL;
  self->_previousCountries = 0LL;
  -[CLCountryTracker updateLocationUnknown](self, "updateLocationUnknown");
  -[CLTimer setNextFireDelay:](self->fLocationUnknownTimeoutTimer, "setNextFireDelay:", 1.79769313e308);
}

- (void)requestLocationWithDesiredAccuracy:(double)a3
{
  if (kCLLocationAccuracyBystander == a3)
  {
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    uint64_t v9 = qword_101934938;
    if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = 68289026LL;
      *(_WORD *)unsigned int v11 = 2082;
      *(void *)&v11[2] = "";
      double v6 = "{msg%{public}.0s:registering for bystander location updates}";
      double v7 = (os_log_s *)v9;
      uint32_t v8 = 18;
      goto LABEL_10;
    }
  }

  else
  {
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    uint64_t v5 = qword_101934938;
    if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = 68289282LL;
      *(_WORD *)unsigned int v11 = 2082;
      *(void *)&v11[2] = "";
      *(_WORD *)&v11[10] = 2050;
      *(double *)&v11[12] = a3;
      double v6 = "{msg%{public}.0s:registering for active location updates, accuracy:%{public}f}";
      double v7 = (os_log_s *)v5;
      uint32_t v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }

  -[CLLocationManager setDesiredAccuracy:]( self->_locManager,  "setDesiredAccuracy:",  a3,  v10,  *(_OWORD *)v11,  *(void *)&v11[16]);
}

- (void)checkLocationServicesStatus
{
  if (sub_1002958AC() != 1)
  {
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    double v3 = (os_log_s *)qword_101934938;
    if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      double v6 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:location services are disabled, stopping updates}",  (uint8_t *)v4,  0x12u);
    }

    goto LABEL_9;
  }

  if (self->fAtLeastOneAuthDetermination && -[CLCountryTracker authStatus](self, "authStatus") != 3)
  {
LABEL_9:
    -[CLCountryTracker updateLocationUnknown](self, "updateLocationUnknown");
    -[CLCountryTracker requestLocationWithDesiredAccuracy:]( self,  "requestLocationWithDesiredAccuracy:",  kCLLocationAccuracyBystander);
    self->fAtLeastOneValidLocation = 0;

    self->_previousLocation = 0LL;
    self->_previousCountries = 0LL;
  }

- (void)onManagerNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 4)
  {
    -[CLCountryTracker checkLocationServicesStatus](self, "checkLocationServicesStatus");
  }

  else if (!*a3)
  {
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    __int16 v5 = (os_log_s *)qword_101934938;
    if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#Warning location status reset; removing all clients",
        buf,
        2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934930 != -1) {
        dispatch_once(&qword_101934930, &stru_10183F288);
      }
      v9[0] = 0;
      uint32_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934938,  0LL,  "#Warning location status reset; removing all clients",
                     v9,
                     2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCountryTracker onManagerNotification:data:]", "%s\n", v8);
    }

    self->_previousLocation = 0LL;
    -[CLCountryTracker updateLocationUnknown](self, "updateLocationUnknown");
    id v6 = objc_msgSend( objc_msgSend(-[CLCountryTracker universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLClientManager");
    if (byte_101996CB7 >= 0) {
      double v7 = &qword_101996CA0;
    }
    else {
      double v7 = (uint64_t *)qword_101996CA0;
    }
    objc_msgSend( v6,  "resetNotificationConsumedForIdentifier:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  }

- (double)calculateDistance:(id)a3 b:(id)a4
{
  if (qword_101934930 != -1) {
    dispatch_once(&qword_101934930, &stru_10183F288);
  }
  double v7 = (os_log_s *)qword_101934938;
  if (os_log_type_enabled((os_log_t)qword_101934938, OS_LOG_TYPE_DEBUG))
  {
    [a3 coordinate];
    uint64_t v9 = v8;
    [a3 coordinate];
    uint64_t v11 = v10;
    [a4 coordinate];
    uint64_t v13 = v12;
    [a4 coordinate];
    *(_DWORD *)std::string buf = 134284289;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2049;
    *(void *)&buf[24] = v13;
    LOWORD(v45) = 2049;
    *(void *)((char *)&v45 + 2) = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "computing distance between points at <%{private}+.8lf,%{private}+.8lf> and <%{private}+.8lf,%{private}+.8lf>",  buf,  0x2Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934930 != -1) {
      dispatch_once(&qword_101934930, &stru_10183F288);
    }
    uint64_t v16 = qword_101934938;
    [a3 coordinate];
    uint64_t v18 = v17;
    [a3 coordinate];
    uint64_t v20 = v19;
    [a4 coordinate];
    uint64_t v22 = v21;
    [a4 coordinate];
    LODWORD(v36[0]) = 134284289;
    *(void *)((char *)v36 + 4) = v18;
    WORD6(v36[0]) = 2049;
    *(void *)((char *)v36 + 14) = v20;
    WORD3(v36[1]) = 2049;
    *((void *)&v36[1] + 1) = v22;
    LOWORD(v37) = 2049;
    *(void *)((char *)&v37 + 2) = v23;
    double v24 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v16,  2LL,  "computing distance between points at <%{private}+.8lf,%{private}+.8lf> and <%{private}+.8lf,%{private}+.8lf>",  v36,  42);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCountryTracker calculateDistance:b:]", "%s\n", v24);
    if (v24 != buf) {
      free(v24);
    }
  }

  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v42 = 0u;
    memset(v43, 0, 28);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = 0u;
    memset(v36, 0, sizeof(v36));
  }

  __int128 v49 = v41;
  __int128 v50 = v42;
  v51[0] = v43[0];
  *(_OWORD *)((char *)v51 + 12) = *(_OWORD *)((char *)v43 + 12);
  __int128 v45 = v37;
  __int128 v46 = v38;
  __int128 v47 = v39;
  __int128 v48 = v40;
  *(_OWORD *)std::string buf = v36[0];
  *(_OWORD *)&buf[16] = v36[1];
  if (a4)
  {
    [a4 clientLocation];
  }

  else
  {
    __int128 v32 = 0u;
    memset(v33, 0, 28);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v25 = 0u;
  }

  v34[6] = v31;
  v34[7] = v32;
  v35[0] = v33[0];
  *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v33 + 12);
  v34[2] = v27;
  v34[3] = v28;
  v34[4] = v29;
  v34[5] = v30;
  v34[0] = v25;
  v34[1] = v26;
  sub_100D2DCA4(&self->fDistanceCalc.fM, (uint64_t)buf, (uint64_t)v34);
  return result;
}

- (CLSettingsMirror)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (int)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(int)a3
{
  self->_minimumConfidence = a3;
}

- (double)maximumCountryLocationChangeSpeed
{
  return self->_maximumCountryLocationChangeSpeed;
}

- (void)setMaximumCountryLocationChangeSpeed:(double)a3
{
  self->_maximumCountryLocationChangeSpeed = a3;
}

- (double)maximumCountryLocationChangeAccuracy
{
  return self->_maximumCountryLocationChangeAccuracy;
}

- (void)setMaximumCountryLocationChangeAccuracy:(double)a3
{
  self->_maximumCountryLocationChangeAccuracy = a3;
}

- (double)minimumMoveDistance
{
  return self->_minimumMoveDistance;
}

- (void)setMinimumMoveDistance:(double)a3
{
  self->_minimumMoveDistance = a3;
}

- (double)debounceTime
{
  return self->_debounceTime;
}

- (void)setDebounceTime:(double)a3
{
  self->_debounceTime = a3;
}

- (double)stalenessTime
{
  return self->_stalenessTime;
}

- (void)setStalenessTime:(double)a3
{
  self->_stalenessTime = a3;
}

- (double)timeToUnknown
{
  return self->_timeToUnknown;
}

- (void)setTimeToUnknown:(double)a3
{
  self->_timeToUnknown = a3;
}

- (double)timeToActiveGiveup
{
  return self->_timeToActiveGiveup;
}

- (void)setTimeToActiveGiveup:(double)a3
{
  self->_timeToActiveGiveup = a3;
}

- (BOOL)skipUpdatingRegulatoryDomain
{
  return self->_skipUpdatingRegulatoryDomain;
}

- (void)setSkipUpdatingRegulatoryDomain:(BOOL)a3
{
  self->_skipUpdatingRegulatoryDomain = a3;
}

- (BOOL)allowSimulatedLocations
{
  return self->_allowSimulatedLocations;
}

- (void)setAllowSimulatedLocations:(BOOL)a3
{
  self->_allowSimulatedLocations = a3;
}

- (int)countryCodeDebounceInterval
{
  return self->_countryCodeDebounceInterval;
}

- (void)setCountryCodeDebounceInterval:(int)a3
{
  self->_countryCodeDebounceInterval = a3;
}

- (double)timeToRequestCheapActiveLocation
{
  return self->_timeToRequestCheapActiveLocation;
}

- (void)setTimeToRequestCheapActiveLocation:(double)a3
{
  self->_timeToRequestCheapActiveLocation = a3;
}

- (CLLocationManager)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
}

- (CLLocation)previousLocation
{
  return self->_previousLocation;
}

- (void)setPreviousLocation:(id)a3
{
}

- (NSArray)previousCountries
{
  return self->_previousCountries;
}

- (void)setPreviousCountries:(id)a3
{
}

- (BOOL)previousDisputedState
{
  return self->_previousDisputedState;
}

- (void)setPreviousDisputedState:(BOOL)a3
{
  self->_previousDisputedState = a3;
}

- (double)previousCountryCodeTimeStamp
{
  return self->_previousCountryCodeTimeStamp;
}

- (void)setPreviousCountryCodeTimeStamp:(double)a3
{
  self->_previousCountryCodeTimeStamp = a3;
}

- (int)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(int)a3
{
  self->_authStatus = a3;
}

- (void).cxx_destruct
{
  value = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  self->fClientManagerClient.__ptr_.__value_ = 0LL;
  return self;
}

@end