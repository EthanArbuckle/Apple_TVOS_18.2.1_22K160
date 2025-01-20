@interface WiFiLocaleManager
+ (id)getStringOfLocaleSource:(int)a3;
- (BOOL)isDefaultCountryCode:(id)a3;
- (BOOL)localeCheckSuspended;
- (BOOL)shouldDetermineNewLocale;
- (NSDateFormatter)dateFormatter;
- (NSString)localeCountryCode;
- (NSString)testHost11d;
- (NSString)testPeer;
- (NSString)testTimeZoneCC;
- (NSString)testUserDefaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)localeTimer;
- (OS_dispatch_source)retryTimer;
- (WiFiLocaleManager)init;
- (WiFiLocaleManagerDelegate)delegate;
- (WiFiLocationManager)locationManager;
- (double)localeLastUpdatedTime;
- (double)localeTimeout;
- (id)applySetCountryCodeExceptions:(id)a3;
- (id)getLocaleFromCompanion;
- (id)getLocaleFromLocation:(id)a3;
- (id)getLocaleFromMcc;
- (id)getLocaleFromMultiple80211d;
- (id)getLocaleFromPeer;
- (id)getLocaleFromTimezone;
- (id)getLocaleFromUserDefaults;
- (id)getLocaleUsingBoundingBoxes:(id)a3;
- (id)getLocaleUsingGeoLocationCache:(id)a3;
- (id)getLocaleUsingReverseGeocoder:(id)a3;
- (id)getRestrictedCountryCodeFromRegionInfo;
- (id)getRestrictedCountryCodeFromTimezone;
- (int)aggressiveRetryAttemptsRemaining;
- (int)localeSource;
- (int)testMcc;
- (unsigned)getNetworkReachability;
- (unsigned)isWaitingForLocationUpdate;
- (unsigned)testModeEnabled;
- (void)dealloc;
- (void)determineAndSetLocale:(unsigned __int8)a3;
- (void)determineLocale:(unsigned __int8)a3;
- (void)didChangeAuthorizationStatus;
- (void)didFailWithError:(id)a3;
- (void)didUpdateLocations:(id)a3;
- (void)setAggressiveRetryAttemptsRemaining:(int)a3;
- (void)setCountryCode:(id)a3 source:(int)a4;
- (void)setDateFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsWaitingForLocationUpdate:(unsigned __int8)a3;
- (void)setLocaleCheckSuspended:(BOOL)a3;
- (void)setLocaleCountryCode:(id)a3;
- (void)setLocaleLastUpdatedTime:(double)a3;
- (void)setLocaleSource:(int)a3;
- (void)setLocaleTestParams:(id)a3;
- (void)setLocaleTimeout:(double)a3;
- (void)setLocaleTimer:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setTestHost11d:(id)a3;
- (void)setTestMcc:(int)a3;
- (void)setTestModeEnabled:(unsigned __int8)a3;
- (void)setTestPeer:(id)a3;
- (void)setTestTimeZoneCC:(id)a3;
- (void)setTestUserDefaults:(id)a3;
@end

@implementation WiFiLocaleManager

- (WiFiLocaleManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___WiFiLocaleManager;
  v2 = -[WiFiLocaleManager init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WiFiLocaleManager setLocaleCheckSuspended:](v2, "setLocaleCheckSuspended:", 0LL);
    -[WiFiLocaleManager setLocaleCountryCode:](v3, "setLocaleCountryCode:", 0LL);
    -[WiFiLocaleManager setLocaleSource:](v3, "setLocaleSource:", 0LL);
    -[WiFiLocaleManager setLocaleLastUpdatedTime:](v3, "setLocaleLastUpdatedTime:", 0.0);
    -[WiFiLocaleManager setLocaleTimeout:](v3, "setLocaleTimeout:", 3600.0);
    -[WiFiLocaleManager setAggressiveRetryAttemptsRemaining:](v3, "setAggressiveRetryAttemptsRemaining:", 5LL);
    -[WiFiLocaleManager setTestMcc:](v3, "setTestMcc:", 0LL);
    -[WiFiLocaleManager setTestHost11d:](v3, "setTestHost11d:", 0LL);
    -[WiFiLocaleManager setTestPeer:](v3, "setTestPeer:", 0LL);
    id v4 = objc_alloc_init(MEMORY[0x189607848]);
    -[WiFiLocaleManager setDateFormatter:](v3, "setDateFormatter:", v4);
    v5 = -[WiFiLocaleManager dateFormatter](v3, "dateFormatter");
    [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    dispatch_queue_t v6 = dispatch_queue_create("WiFiLocaleManager", 0LL);
    -[WiFiLocaleManager setQueue:](v3, "setQueue:", v6);

    -[WiFiLocaleManager queue](v3, "queue");
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v7);
    -[WiFiLocaleManager setLocaleTimer:](v3, "setLocaleTimer:", v8);

    -[WiFiLocaleManager localeTimer](v3, "localeTimer");
    v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __25__WiFiLocaleManager_init__block_invoke;
    handler[3] = &unk_18A16C770;
    v10 = v3;
    v18 = v10;
    dispatch_source_set_event_handler(v9, handler);

    -[WiFiLocaleManager localeTimer](v10, "localeTimer");
    v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_time_t v12 = dispatch_time(0LL, 1000000000LL);
    dispatch_source_set_timer(v11, v12, 0x45D964B800uLL, 0LL);

    -[WiFiLocaleManager localeTimer](v10, "localeTimer");
    v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
    dispatch_activate(v13);
    v14 = +[WiFiLocationManager sharedWiFiLocationManager](&OBJC_CLASS___WiFiLocationManager, "sharedWiFiLocationManager");
    -[WiFiLocaleManager setLocationManager:](v10, "setLocationManager:", v14);
    v15 = -[WiFiLocaleManager locationManager](v10, "locationManager");
    [v15 setDelegate:v10];

    -[WiFiLocaleManager setIsWaitingForLocationUpdate:](v10, "setIsWaitingForLocationUpdate:", 0LL);
  }

  return v3;
}

uint64_t __25__WiFiLocaleManager_init__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Locale timer fired", v3, 2u);
  }

  return [*(id *)(a1 + 32) determineLocale:0];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WiFiLocaleManager localeTimer](self, "localeTimer");
    id v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[WiFiLocaleManager setLocaleTimer:](self, "setLocaleTimer:", 0LL);
  }
  v5 = -[WiFiLocaleManager queue](self, "queue");
  if (v5) {
    -[WiFiLocaleManager setQueue:](self, "setQueue:", 0LL);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiLocaleManager;
  -[WiFiLocaleManager dealloc](&v6, sel_dealloc);
}

- (void)determineAndSetLocale:(unsigned __int8)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WiFiLocaleManager queue](self, "queue");
    objc_super v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __43__WiFiLocaleManager_determineAndSetLocale___block_invoke;
    v7[3] = &unk_18A16CC08;
    v7[4] = self;
    unsigned __int8 v8 = a3;
    dispatch_async(v6, v7);
  }

uint64_t __43__WiFiLocaleManager_determineAndSetLocale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineLocale:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isDefaultCountryCode:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3 == 0LL;
  if (![v3 caseInsensitiveCompare:&stru_18A170410]
    || ![v3 caseInsensitiveCompare:@"X0"]
    || ![v3 caseInsensitiveCompare:@"X2"]
    || ![v3 caseInsensitiveCompare:@"X3"]
    || ![v3 caseInsensitiveCompare:@"XZ"])
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldDetermineNewLocale
{
  v2 = self;
  -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[WiFiLocaleManager isDefaultCountryCode:](v2, "isDefaultCountryCode:", v3);

  return (char)v2;
}

- (void)setLocaleTestParams:(id)a3
{
  id v4 = a3;
  v5 = -[WiFiLocaleManager queue](self, "queue");
  if (v5)
  {
    -[WiFiLocaleManager queue](self, "queue");
    objc_super v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __41__WiFiLocaleManager_setLocaleTestParams___block_invoke;
    v7[3] = &unk_18A16C748;
    id v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);
  }
}

void __41__WiFiLocaleManager_setLocaleTestParams___block_invoke(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) objectForKeyedSubscript:@"enableTestMode"];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 BOOLValue];

  [*(id *)(a1 + 32) objectForKeyedSubscript:@"localeCheckSuspended"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 BOOLValue];

  [*(id *)(a1 + 32) objectForKeyedSubscript:@"mcc"];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = [v6 intValue];

  [*(id *)(a1 + 32) objectForKeyedSubscript:@"cachedLocaleTimeout"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 doubleValue];
  double v10 = v9;

  [*(id *)(a1 + 32) objectForKey:@"host11d"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKey:@"peer"];
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKey:@"timeZoneCC"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKey:@"userDefaults"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKeyedSubscript:@"forceCheck"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v59 = [v15 BOOLValue];

  v16 = *(void **)(a1 + 40);
  if (!v3)
  {
    if ([v16 testModeEnabled])
    {
      [*(id *)(a1 + 40) setTestModeEnabled:0];
      [*(id *)(a1 + 40) setLocaleCheckSuspended:0];
      [*(id *)(a1 + 40) setTestMcc:0];
      [*(id *)(a1 + 40) setLocaleTimeout:3600.0];
      [*(id *)(a1 + 40) setTestHost11d:0];
      [*(id *)(a1 + 40) setTestPeer:0];
      [*(id *)(a1 + 40) setLocaleCountryCode:0];
      [*(id *)(a1 + 40) setLocaleSource:0];
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v27 = [*(id *)(a1 + 40) localeCheckSuspended];
        int v28 = [*(id *)(a1 + 40) testMcc];
        [*(id *)(a1 + 40) testHost11d];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) testPeer];
        v30 = v13;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) localeTimeout];
        *(_DWORD *)buf = 136316674;
        v61 = "-[WiFiLocaleManager setLocaleTestParams:]_block_invoke";
        __int16 v62 = 1024;
        int v63 = v27;
        __int16 v64 = 1024;
        int v65 = v28;
        __int16 v66 = 2112;
        *(void *)v67 = v29;
        *(_WORD *)&v67[8] = 2112;
        *(void *)v68 = v31;
        *(_WORD *)&v68[8] = 2048;
        *(void *)v69 = v32;
        *(_WORD *)&v69[8] = 1024;
        *(_DWORD *)v70 = v59;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: resetting test params: localeCheckSuspended %d, MCC %d, host11d %@, peer %@, timeout %.2f seconds, forceCheck %d",  buf,  0x3Cu);

        v13 = v30;
      }

      [*(id *)(a1 + 40) retryTimer];
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        [*(id *)(a1 + 40) retryTimer];
        v34 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
        dispatch_source_set_timer(v34, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      }

      [*(id *)(a1 + 40) localeTimer];
      v35 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) localeTimeout];
      dispatch_time_t v37 = dispatch_time(0LL, (uint64_t)(v36 * 1000000000.0));
      [*(id *)(a1 + 40) localeTimeout];
      dispatch_source_set_timer(v35, v37, (unint64_t)(v38 * 1000000000.0), 0LL);

      if (v59) {
        goto LABEL_27;
      }
    }

    goto LABEL_28;
  }

  [v16 setTestModeEnabled:1];
  [*(id *)(a1 + 40) setLocaleCheckSuspended:v5];
  if (HIWORD(v7)) {
    uint64_t v17 = 0LL;
  }
  else {
    uint64_t v17 = v7;
  }
  [*(id *)(a1 + 40) setTestMcc:v17];
  objc_msgSend(*(id *)(a1 + 40), "setLocaleTimeout:", fmax(v10, 300.0));
  if (v11)
  {
    id v18 = objc_alloc(NSString);
    [v11 uppercaseString];
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)[v18 initWithString:v19];
    [*(id *)(a1 + 40) setTestHost11d:v20];

    if (v12) {
      goto LABEL_7;
    }
LABEL_17:
    [*(id *)(a1 + 40) setTestPeer:0];
    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }

  [*(id *)(a1 + 40) setTestHost11d:0];
  if (!v12) {
    goto LABEL_17;
  }
LABEL_7:
  id v21 = objc_alloc(NSString);
  [v12 uppercaseString];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)[v21 initWithString:v22];
  [*(id *)(a1 + 40) setTestPeer:v23];

  if (v13)
  {
LABEL_8:
    id v24 = objc_alloc(NSString);
    [v13 uppercaseString];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)[v24 initWithString:v25];
    [*(id *)(a1 + 40) setTestTimeZoneCC:v26];

    goto LABEL_19;
  }

- (void)determineLocale:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  double v6 = v5;
  -[WiFiLocaleManager delegate](self, "delegate");
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 suspendLocaleCheck] == 1)
  {

LABEL_4:
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[WiFiLocaleManager determineLocale:].cold.1(v3, self);
    }
    double v9 = 0LL;
LABEL_7:
    double v10 = 0LL;
    goto LABEL_8;
  }

  BOOL v8 = -[WiFiLocaleManager localeCheckSuspended](self, "localeCheckSuspended");

  if (v8) {
    goto LABEL_4;
  }
  v11 = -[WiFiLocaleManager delegate](self, "delegate");
  [v11 getDeviceCountryCode];
  double v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v9))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Default locale in use, determine fresh locale",  (uint8_t *)&v37,  2u);
    }

    -[WiFiLocaleManager setLocaleCountryCode:](self, "setLocaleCountryCode:", 0LL);
    -[WiFiLocaleManager setLocaleSource:](self, "setLocaleSource:", 0LL);
  }

  if (!v3 && !-[WiFiLocaleManager shouldDetermineNewLocale](self, "shouldDetermineNewLocale"))
  {
    -[WiFiLocaleManager localeLastUpdatedTime](self, "localeLastUpdatedTime");
    double v13 = v6 - v12;
    -[WiFiLocaleManager localeTimeout](self, "localeTimeout");
    if (v13 < v14)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v15 = -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
        v16 = -[WiFiLocaleManager dateFormatter](self, "dateFormatter");
        uint64_t v17 = (void *)MEMORY[0x189603F50];
        -[WiFiLocaleManager localeLastUpdatedTime](self, "localeLastUpdatedTime");
        objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 stringFromDate:v18];
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiLocaleManager localeLastUpdatedTime](self, "localeLastUpdatedTime");
        double v21 = (v6 - v20) / 60.0;
        -[WiFiLocaleManager localeTimeout](self, "localeTimeout");
        int v37 = 138413058;
        double v38 = v15;
        __int16 v39 = 2112;
        v40 = v19;
        __int16 v41 = 2048;
        double v42 = v21;
        __int16 v43 = 2048;
        double v44 = v22 / 60.0;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale <%@> was determined at %@, has been valid for %.2f mins [cache timeout %.2f mins]",  (uint8_t *)&v37,  0x2Au);
      }

      goto LABEL_7;
    }
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 67109120;
    LODWORD(v38) = v3;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Trying to determine locale (forceCheck %d)...",  (uint8_t *)&v37,  8u);
  }

  -[WiFiLocaleManager getLocaleFromCompanion](self, "getLocaleFromCompanion");
  double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
  {
    uint64_t v26 = 1LL;
    goto LABEL_46;
  }
  v23 = -[WiFiLocaleManager locationManager](self, "locationManager");
  int v24 = [v23 isAuthorized];

  if (v24)
  {
    -[WiFiLocaleManager getLocaleFromMcc](self, "getLocaleFromMcc");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v25))
    {
      uint64_t v26 = 2LL;
LABEL_45:
      double v10 = v25;
      goto LABEL_46;
    }
  }

  else
  {
    v25 = v10;
  }

  -[WiFiLocaleManager locationManager](self, "locationManager");
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  int v28 = [v27 isAuthorized];

  if (v28)
  {
    v29 = -[WiFiLocaleManager locationManager](self, "locationManager");
    [v29 latestLocation];
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiLocaleManager localeTimeout](self, "localeTimeout");
    int v31 = +[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:]( &OBJC_CLASS___WiFiLocationManager,  "isLocationValid:uptoSeconds:isHighAccuracy:",  v30,  0LL);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 67109120;
      LODWORD(v38) = v31;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Trying to get cached/leeched location (isValid %d)",  (uint8_t *)&v37,  8u);
    }

    if (v31)
    {
      -[WiFiLocaleManager getLocaleFromLocation:](self, "getLocaleFromLocation:", v30);
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
      {

        uint64_t v26 = 3LL;
        goto LABEL_46;
      }
    }

    else
    {
      double v10 = v25;
    }
  }

  else
  {
    double v10 = v25;
  }

  -[WiFiLocaleManager locationManager](self, "locationManager");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  int v33 = [v32 isAuthorized];

  if (v33)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Trying to get low accuracy location",  (uint8_t *)&v37,  2u);
    }
    v34 = -[WiFiLocaleManager locationManager](self, "locationManager");
    [v34 requestLowAccuracyLocationUpdate];

    -[WiFiLocaleManager setIsWaitingForLocationUpdate:](self, "setIsWaitingForLocationUpdate:", 1LL);
    uint64_t v26 = 0LL;
LABEL_46:
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_47;
  }

  -[WiFiLocaleManager getLocaleFromMultiple80211d](self, "getLocaleFromMultiple80211d");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v25))
  {
    uint64_t v26 = 4LL;
    goto LABEL_45;
  }

  -[WiFiLocaleManager getLocaleFromPeer](self, "getLocaleFromPeer");
  double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
  {
    uint64_t v26 = 5LL;
    goto LABEL_46;
  }

  -[WiFiLocaleManager getLocaleFromTimezone](self, "getLocaleFromTimezone");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v25))
  {
    uint64_t v26 = 6LL;
    goto LABEL_45;
  }

  -[WiFiLocaleManager getLocaleFromUserDefaults](self, "getLocaleFromUserDefaults");
  double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
  {
    uint64_t v26 = 7LL;
    goto LABEL_46;
  }

  uint64_t v26 = 0LL;
  double v10 = &stru_18A170410;
LABEL_47:
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  -[WiFiLocaleManager setLocaleLastUpdatedTime:](self, "setLocaleLastUpdatedTime:");
  -[WiFiLocaleManager setAggressiveRetryAttemptsRemaining:](self, "setAggressiveRetryAttemptsRemaining:", 5LL);
  v35 = -[WiFiLocaleManager retryTimer](self, "retryTimer");
  if (v35)
  {
    -[WiFiLocaleManager retryTimer](self, "retryTimer");
    double v36 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v36);

    -[WiFiLocaleManager setRetryTimer:](self, "setRetryTimer:", 0LL);
  }

  -[WiFiLocaleManager setCountryCode:source:](self, "setCountryCode:source:", v10, v26);
LABEL_8:
}

- (id)getLocaleFromCompanion
{
  return 0LL;
}

- (id)getLocaleFromMcc
{
  return 0LL;
}

- (id)getLocaleFromLocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  double v5 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v4)
  {
    double v6 = v5;
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v7 = -[WiFiLocaleManager getLocaleUsingGeoLocationCache:](self, "getLocaleUsingGeoLocationCache:", v4);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from location services using geolocation cache: <%@>",  (uint8_t *)&v9,  0xCu);
    }

    if (!v7)
    {
LABEL_3:
      uint64_t v7 = -[WiFiLocaleManager getLocaleUsingBoundingBoxes:](self, "getLocaleUsingBoundingBoxes:", v4);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from location services using bounding boxes: <%@>",  (uint8_t *)&v9,  0xCu);
      }

      if (!((unint64_t)v6 | v7))
      {
        uint64_t v7 = -[WiFiLocaleManager getLocaleUsingReverseGeocoder:](self, "getLocaleUsingReverseGeocoder:", v4);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          uint64_t v10 = v7;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from location services using reverse geocoder: <%@>",  (uint8_t *)&v9,  0xCu);
        }
      }
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return (id)v7;
}

- (id)getLocaleFromMultiple80211d
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  unint64_t v28 = 0LL;
  -[WiFiLocaleManager testHost11d](self, "testHost11d");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v10 = -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
      if (!v10)
      {

        goto LABEL_21;
      }

      uint64_t v11 = (void *)v10;
      -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
      double v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 caseInsensitiveCompare:@"OFF"];

      if (!v13)
      {
LABEL_21:
        v16 = -[WiFiLocaleManager delegate](self, "delegate");
        [v16 get80211dCountryCodes:&v28];
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v8 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v30 = v17;
          __int16 v31 = 2048;
          unint64_t v32 = v28;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%lu country code(s) currently advertised by %lu networks",  buf,  0x16u);
        }

        if (v28 >= 3)
        {
          [v8 objectEnumerator];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 nextObject];
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
          double v20 = 0LL;
          if (v7)
          {
            unint64_t v21 = 0LL;
            unint64_t v22 = 0LL;
            v23 = (os_log_s *)MEMORY[0x1895F8DA0];
            *(void *)&__int128 v19 = 138412290LL;
            __int128 v27 = v19;
            do
            {
              unint64_t v24 = v22;
              unint64_t v22 = objc_msgSend(v8, "countForObject:", v7, v27);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v30 = (uint64_t)v7;
                __int16 v31 = 2048;
                unint64_t v32 = v22;
                _os_log_impl(&dword_187EBF000, v23, OS_LOG_TYPE_DEFAULT, "Country <%@> IE count %lu", buf, 0x16u);
              }

              if (v22 < 2 || v22 < v24)
              {
                unint64_t v22 = v24;
              }

              else
              {
                id v25 = v7;

                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v27;
                  uint64_t v30 = (uint64_t)v25;
                  _os_log_impl(&dword_187EBF000, v23, OS_LOG_TYPE_DEFAULT, "Currently highest country <%@>", buf, 0xCu);
                }

                unint64_t v21 = v24;
                double v20 = v25;
              }

              uint64_t v26 = [v18 nextObject];

              uint64_t v7 = (void *)v26;
            }

            while (v26);
            if (v22 == v21) {
              uint64_t v7 = 0LL;
            }
            else {
              uint64_t v7 = (void *)[v20 copy];
            }
          }

          goto LABEL_14;
        }

        goto LABEL_13;
      }
    }

    else
    {
    }

    id v14 = 0LL;
    return v14;
  }

  -[WiFiLocaleManager testHost11d](self, "testHost11d");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 caseInsensitiveCompare:@"OFF"];

  if (v5)
  {
    -[WiFiLocaleManager testHost11d](self, "testHost11d");
    double v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (void *)[v6 copy];

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = (uint64_t)v7;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Using testHost11d [%@]", buf, 0xCu);
    }

    BOOL v8 = 0LL;
    goto LABEL_14;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from 80211d info is disabled",  buf,  2u);
  }

  BOOL v8 = 0LL;
LABEL_13:
  uint64_t v7 = 0LL;
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = (uint64_t)v7;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from multiple 80211d info: <%@>",  buf,  0xCu);
  }

  id v14 = v7;

  return v14;
}

- (id)getLocaleFromPeer
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[WiFiLocaleManager testPeer](self, "testPeer");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WiFiLocaleManager delegate](self, "delegate");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 getPeerCountryCode];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }

    goto LABEL_9;
  }

  -[WiFiLocaleManager testPeer](self, "testPeer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 caseInsensitiveCompare:@"OFF"];

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from peer is disabled",  (uint8_t *)&v12,  2u);
    }

- (id)getLocaleFromTimezone
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[WiFiLocaleManager getRestrictedCountryCodeFromTimezone](self, "getRestrictedCountryCodeFromTimezone");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiLocaleManager getRestrictedCountryCodeFromRegionInfo](self, "getRestrictedCountryCodeFromRegionInfo");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  testTimeZoneCC = self->_testTimeZoneCC;
  if (testTimeZoneCC)
  {
    double v6 = testTimeZoneCC;

    uint64_t v7 = self->_testTimeZoneCC;
    id v4 = v7;
    int v3 = v6;
  }

  BOOL v8 = 0LL;
  if (v3 && v4)
  {
    if ([v3 compare:v4 options:1]) {
      BOOL v8 = @"XZ";
    }
    else {
      BOOL v8 = v3;
    }
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    int v12 = v8;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from timezone: <%@>",  (uint8_t *)&v11,  0xCu);
  }

  char v9 = v8;

  return v9;
}

- (id)getLocaleFromUserDefaults
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v9 = -[WiFiLocaleManager testHost11d](self, "testHost11d");
      if (!v9)
      {

LABEL_17:
        -[WiFiLocaleManager delegate](self, "delegate");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 getCountryCodeFromUserDefaults];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }

      uint64_t v10 = (void *)v9;
      -[WiFiLocaleManager testHost11d](self, "testHost11d");
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 caseInsensitiveCompare:@"OFF"];

      if (!v12) {
        goto LABEL_17;
      }
    }

    else
    {
    }

- (id)applySetCountryCodeExceptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v3 = (__CFString *)a3;
  id v4 = v3;
  if (!-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", @"EU"))
  {

    id v4 = @"DE";
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = @"DE";
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Switching locale %@ => %@",  (uint8_t *)&v6,  0x16u);
    }
  }

  if (!-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", @"IR")
    || !-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", @"KP"))
  {

    id v4 = &stru_18A170410;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = &stru_18A170410;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Switching locale %@ => %@",  (uint8_t *)&v6,  0x16u);
    }
  }

  return v4;
}

- (void)setCountryCode:(id)a3 source:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  int v7 = -[WiFiLocaleManager aggressiveRetryAttemptsRemaining](self, "aggressiveRetryAttemptsRemaining");
  if (!v6)
  {
    int v11 = 0LL;
    goto LABEL_46;
  }

  int v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiLocaleManager getStringOfLocaleSource:](&OBJC_CLASS___WiFiLocaleManager, "getStringOfLocaleSource:", v4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    id v49 = v9;
    __int16 v50 = 2112;
    id v51 = v6;
    __int16 v52 = 2112;
    v53 = v10;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Current locale: <%@>, determined new locale: <%@> using locale source: <%@>",  buf,  0x20u);
  }

  -[WiFiLocaleManager applySetCountryCodeExceptions:](self, "applySetCountryCodeExceptions:", v6);
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiLocaleManager delegate](self, "delegate");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v11 uppercaseString];
    [v14 setUserDefaultCountryCode:v13];
  }

  -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    uint64_t v13 = -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
    if (![v11 caseInsensitiveCompare:v13])
    {

      goto LABEL_31;
    }
  }
  v16 = -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  if (v16)
  {

    if (v15)
    {
    }
  }

  else
  {
    uint64_t v17 = [v11 caseInsensitiveCompare:&stru_18A170410];

    if (v15)
    {
    }

    if (!v17)
    {
LABEL_31:
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        double v20 = (os_log_s *)MEMORY[0x1895F8DA0];
        unint64_t v21 = "Locale has not changed, no need to set country code";
        goto LABEL_33;
      }

      goto LABEL_46;
    }
  }

  -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v18)
    || !-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v11))
  {

LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v11;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Attempting to set locale to <%@>",  buf,  0xCu);
    }

    -[WiFiLocaleManager delegate](self, "delegate");
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 uppercaseString];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    int v24 = [v22 setDeviceCountryCode:v23];

    if (v24 == 1)
    {
      -[WiFiLocaleManager retryTimer](self, "retryTimer");
      id v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[WiFiLocaleManager retryTimer](self, "retryTimer");
        uint64_t v26 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v26);

        -[WiFiLocaleManager setRetryTimer:](self, "setRetryTimer:", 0LL);
      }

      id v27 = objc_alloc(NSString);
      [v11 uppercaseString];
      unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)[v27 initWithString:v28];
      -[WiFiLocaleManager setLocaleCountryCode:](self, "setLocaleCountryCode:", v29);

      -[WiFiLocaleManager setLocaleSource:](self, "setLocaleSource:", v4);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        id v49 = v30;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Locale set to: <%@>", buf, 0xCu);
      }

      if (-[WiFiLocaleManager testModeEnabled](self, "testModeEnabled"))
      {
        [MEMORY[0x189607958] defaultCenter];
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607950] notificationWithName:@"Country Code was set" object:0];
        unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 postNotification:v32];
      }

      uint64_t v33 = self;
      uint64_t v34 = 5LL;
    }

    else
    {
      -[WiFiLocaleManager setLocaleCountryCode:](self, "setLocaleCountryCode:", 0LL);
      -[WiFiLocaleManager setLocaleSource:](self, "setLocaleSource:", 0LL);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        if (v8 > 0) {
          int v35 = 1;
        }
        else {
          int v35 = 30;
        }
        *(_DWORD *)buf = 138412546;
        id v49 = v6;
        __int16 v50 = 1024;
        LODWORD(v51) = v35;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error: Failed to set locale, retrying %@ every %u seconds",  buf,  0x12u);
      }

      -[WiFiLocaleManager retryTimer](self, "retryTimer");
      double v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        -[WiFiLocaleManager queue](self, "queue");
        int v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        dispatch_source_t v38 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v37);
        -[WiFiLocaleManager setRetryTimer:](self, "setRetryTimer:", v38);

        -[WiFiLocaleManager retryTimer](self, "retryTimer");
        __int16 v39 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __43__WiFiLocaleManager_setCountryCode_source___block_invoke;
        handler[3] = &unk_18A16CC30;
        id v45 = v6;
        int v46 = self;
        int v47 = v4;
        dispatch_source_set_event_handler(v39, handler);

        -[WiFiLocaleManager retryTimer](self, "retryTimer");
        v40 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
        dispatch_activate(v40);
      }

      -[WiFiLocaleManager retryTimer](self, "retryTimer");
      __int16 v41 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
      if (v8 < 1)
      {
        dispatch_time_t v43 = dispatch_time(0LL, 30000000000LL);
        dispatch_source_set_timer(v41, v43, 0xFFFFFFFFFFFFFFFFLL, 0LL);

        goto LABEL_46;
      }

      dispatch_time_t v42 = dispatch_time(0LL, 1000000000LL);
      dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0LL);

      if (-[WiFiLocaleManager aggressiveRetryAttemptsRemaining](self, "aggressiveRetryAttemptsRemaining") < 1) {
        goto LABEL_46;
      }
      uint64_t v34 = -[WiFiLocaleManager aggressiveRetryAttemptsRemaining]( self,  "aggressiveRetryAttemptsRemaining")
          - 1;
      uint64_t v33 = self;
    }

    -[WiFiLocaleManager setAggressiveRetryAttemptsRemaining:](v33, "setAggressiveRetryAttemptsRemaining:", v34);
    goto LABEL_46;
  }

  int v19 = -[WiFiLocaleManager testModeEnabled](self, "testModeEnabled");

  if (v19) {
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    double v20 = (os_log_s *)MEMORY[0x1895F8DA0];
    unint64_t v21 = "New locale could not be determined, continue using previously determined locale";
LABEL_33:
    _os_log_impl(&dword_187EBF000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
  }

uint64_t __43__WiFiLocaleManager_setCountryCode_source___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Set locale retry timer fired. Retrying for country code : %@",  (uint8_t *)&v4,  0xCu);
  }

  return [*(id *)(a1 + 40) retrySetCountryCode:*(void *)(a1 + 32) source:*(unsigned int *)(a1 + 48)];
}

- (void)didChangeAuthorizationStatus
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__WiFiLocaleManager_didChangeAuthorizationStatus__block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__WiFiLocaleManager_didChangeAuthorizationStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineLocale:1];
}

- (void)didUpdateLocations:(id)a3
{
  id v4 = a3;
  -[WiFiLocaleManager queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__WiFiLocaleManager_didUpdateLocations___block_invoke;
  v7[3] = &unk_18A16C748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__WiFiLocaleManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) isWaitingForLocationUpdate])
  {
    [*(id *)(a1 + 32) setIsWaitingForLocationUpdate:0];
    uint64_t v2 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) localeTimeout];
    int v3 = +[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:]( &OBJC_CLASS___WiFiLocationManager,  "isLocationValid:uptoSeconds:isHighAccuracy:",  v2,  0LL);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v3;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Trying to get locale from updated location (isValid %d)",  (uint8_t *)v17,  8u);
    }

    if (v3)
    {
      [*(id *)(a1 + 32) getLocaleFromLocation:*(void *)(a1 + 40)];
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (![*(id *)(a1 + 32) isDefaultCountryCode:v4])
      {
        uint64_t v5 = 3LL;
        if (!v4) {
          return;
        }
        goto LABEL_24;
      }
    }

    else
    {
      id v4 = 0LL;
    }

    if ([*(id *)(a1 + 32) shouldDetermineNewLocale])
    {
      [*(id *)(a1 + 32) getLocaleFromMultiple80211d];
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ([*(id *)(a1 + 32) isDefaultCountryCode:v6])
      {
        [*(id *)(a1 + 32) getLocaleFromPeer];
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (![*(id *)(a1 + 32) isDefaultCountryCode:v4])
        {
          uint64_t v5 = 5LL;
          if (!v4) {
            return;
          }
          goto LABEL_24;
        }

        [*(id *)(a1 + 32) getLocaleFromTimezone];
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if ([*(id *)(a1 + 32) isDefaultCountryCode:v6])
        {
          [*(id *)(a1 + 32) getLocaleFromUserDefaults];
          id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if ([*(id *)(a1 + 32) isDefaultCountryCode:v4])
          {

            uint64_t v5 = 0LL;
            id v4 = &stru_18A170410;
          }

          else
          {
            uint64_t v5 = 7LL;
            if (!v4) {
              return;
            }
          }

          goto LABEL_24;
        }

        uint64_t v5 = 6LL;
      }

      else
      {
        uint64_t v5 = 4LL;
      }

      id v4 = v6;
      if (!v6) {
        return;
      }
    }

    else
    {
      uint64_t v5 = 0LL;
      if (!v4) {
        return;
      }
    }

- (void)didFailWithError:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__WiFiLocaleManager_didFailWithError___block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_async(v4, block);
}

void __38__WiFiLocaleManager_didFailWithError___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Trying to determine locale when location services failed",  v7,  2u);
  }

  [*(id *)(a1 + 32) getLocaleFromMultiple80211d];
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![*(id *)(a1 + 32) isDefaultCountryCode:v2])
  {
    uint64_t v4 = 4LL;
    goto LABEL_14;
  }

  [*(id *)(a1 + 32) getLocaleFromPeer];
  int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (![*(id *)(a1 + 32) isDefaultCountryCode:v3])
  {
    uint64_t v4 = 5LL;
LABEL_13:
    uint64_t v2 = v3;
LABEL_14:
    if (!v2) {
      return;
    }
    goto LABEL_15;
  }

  [*(id *)(a1 + 32) getLocaleFromTimezone];
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (![*(id *)(a1 + 32) isDefaultCountryCode:v2])
  {
    uint64_t v4 = 6LL;
    goto LABEL_14;
  }

  [*(id *)(a1 + 32) getLocaleFromUserDefaults];
  int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (![*(id *)(a1 + 32) isDefaultCountryCode:v3])
  {
    uint64_t v4 = 7LL;
    goto LABEL_13;
  }

  uint64_t v4 = 0LL;
  uint64_t v2 = &stru_18A170410;
LABEL_15:
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  objc_msgSend(*(id *)(a1 + 32), "setLocaleLastUpdatedTime:");
  [*(id *)(a1 + 32) setAggressiveRetryAttemptsRemaining:5];
  [*(id *)(a1 + 32) retryTimer];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [*(id *)(a1 + 32) retryTimer];
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

    [*(id *)(a1 + 32) setRetryTimer:0];
  }

  [*(id *)(a1 + 32) setCountryCode:v2 source:v4];
}

- (unsigned)getNetworkReachability
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  sockaddr address = (sockaddr)xmmword_187F836C0;
  uint64_t v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x189604DB0], &address);
  SCNetworkReachabilityFlags flags = 0;
  if (v2)
  {
    int v3 = v2;
    SCNetworkReachabilityGetFlags(v2, &flags);
    CFRelease(v3);
    LOBYTE(v2) = (flags & 0x40002) == 2;
  }

  return v2;
}

- (id)getLocaleUsingGeoLocationCache:(id)a3
{
  return 0LL;
}

- (id)getLocaleUsingBoundingBoxes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 coordinate];
    double v6 = v5;
    [v4 coordinate];
    uint64_t v8 = 0LL;
    while (v7 < *(double *)&boundingBoxes[v8]
         || v7 > *(double *)&boundingBoxes[v8 + 2]
         || v6 > *(double *)&boundingBoxes[v8 + 1]
         || v6 < *(double *)&boundingBoxes[v8 + 3])
    {
      v8 += 5LL;
      if (v8 == 500) {
        goto LABEL_8;
      }
    }

    id v9 = (id)boundingBoxes[v8 + 4];
  }

  else
  {
LABEL_8:
    id v9 = 0LL;
  }

  return v9;
}

- (id)getLocaleUsingReverseGeocoder:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  int v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0LL;
  if (!v4)
  {
    id v8 = 0LL;
    goto LABEL_9;
  }

  if (!-[WiFiLocaleManager getNetworkReachability](self, "getNetworkReachability"))
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v9) {
      -[WiFiLocaleManager getLocaleUsingReverseGeocoder:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_8;
  }

  id v5 = objc_alloc_init(MEMORY[0x1896056D0]);
  if (!v5)
  {
LABEL_8:
    id v8 = (id)v22[5];
    goto LABEL_9;
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __51__WiFiLocaleManager_getLocaleUsingReverseGeocoder___block_invoke;
  v18[3] = &unk_18A16CC58;
  double v20 = &v21;
  double v7 = v6;
  int v19 = v7;
  [v5 reverseGeocodeLocation:v4 completionHandler:v18];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v22[5];

LABEL_9:
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __51__WiFiLocaleManager_getLocaleUsingReverseGeocoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (!a3)
  {
    if ([v11 count])
    {
      [v11 objectAtIndex:0];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        dispatch_semaphore_t v6 = v5;
        [v5 ISOcountryCode];
        double v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v7 copy];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getRestrictedCountryCodeFromRegionInfo
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v12 = xmmword_18A16CC98;
  __int128 v13 = *(_OWORD *)&off_18A16CCA8;
  __int128 v14 = xmmword_18A16CCB8;
  __int128 v10 = xmmword_18A16CC78;
  __int128 v11 = *(_OWORD *)&off_18A16CC88;
  uint64_t v2 = (void *)MGCopyAnswer();
  id v3 = 0LL;
  if (v2)
  {
    id v4 = (const __CFString **)&v11;
    id v5 = @"PA";
    while (objc_msgSend(v2, "compare:options:", v5, 1, v10, v11, v12, v13, v14))
    {
      dispatch_semaphore_t v6 = *v4;
      v4 += 2;
      id v5 = v6;
      if (!v6)
      {
        id v3 = 0LL;
        goto LABEL_7;
      }
    }

    id v3 = (void *)-[__CFString copy]((id)*(v4 - 1), "copy");
  }

- (id)getRestrictedCountryCodeFromTimezone
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  objc_msgSend( MEMORY[0x189604020],  "defaultTimeZone",  0x18A171D50,  0x18A171930,  @"Asia/Jayapura",  @"ID",  0x18A171D90,  0x18A171930,  @"Asia/Pontianak",  @"ID",  0,  0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2)
  {
    id v4 = (uint64_t *)&v12;
    while (1)
    {
      [v3 name];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 compare:*(v4 - 2) options:1];

      if (!v6) {
        break;
      }
      uint64_t v7 = *v4;
      v4 += 2;
      if (!v7)
      {
        uint64_t v2 = 0LL;
        goto LABEL_7;
      }
    }

    uint64_t v2 = (void *)[(id)*(v4 - 1) copy];
  }

+ (id)getStringOfLocaleSource:(int)a3
{
  else {
    return off_18A16CD18[a3];
  }
}

- (WiFiLocaleManagerDelegate)delegate
{
  return (WiFiLocaleManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)localeCheckSuspended
{
  return self->_localeCheckSuspended;
}

- (void)setLocaleCheckSuspended:(BOOL)a3
{
  self->_localeCheckSuspended = a3;
}

- (NSString)localeCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLocaleCountryCode:(id)a3
{
}

- (int)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(int)a3
{
  self->_localeSource = a3;
}

- (double)localeTimeout
{
  return self->_localeTimeout;
}

- (void)setLocaleTimeout:(double)a3
{
  self->_localeTimeout = a3;
}

- (double)localeLastUpdatedTime
{
  return self->_localeLastUpdatedTime;
}

- (void)setLocaleLastUpdatedTime:(double)a3
{
  self->_localeLastUpdatedTime = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)localeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLocaleTimer:(id)a3
{
}

- (OS_dispatch_source)retryTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setRetryTimer:(id)a3
{
}

- (int)aggressiveRetryAttemptsRemaining
{
  return self->_aggressiveRetryAttemptsRemaining;
}

- (void)setAggressiveRetryAttemptsRemaining:(int)a3
{
  self->_aggressiveRetryAttemptsRemaining = a3;
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDateFormatter:(id)a3
{
}

- (WiFiLocationManager)locationManager
{
  return (WiFiLocationManager *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setLocationManager:(id)a3
{
}

- (unsigned)isWaitingForLocationUpdate
{
  return self->_isWaitingForLocationUpdate;
}

- (void)setIsWaitingForLocationUpdate:(unsigned __int8)a3
{
  self->_isWaitingForLocationUpdate = a3;
}

- (unsigned)testModeEnabled
{
  return self->_testModeEnabled;
}

- (void)setTestModeEnabled:(unsigned __int8)a3
{
  self->_testModeEnabled = a3;
}

- (int)testMcc
{
  return self->_testMcc;
}

- (void)setTestMcc:(int)a3
{
  self->_testMcc = a3;
}

- (NSString)testHost11d
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setTestHost11d:(id)a3
{
}

- (NSString)testPeer
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setTestPeer:(id)a3
{
}

- (NSString)testTimeZoneCC
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setTestTimeZoneCC:(id)a3
{
}

- (NSString)testUserDefaults
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTestUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)determineLocale:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = [a2 localeCheckSuspended];
  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error: Locale check was suspended (forceCheck %d, localeCheckSuspended %d), exit",  (uint8_t *)v2,  0xEu);
}

void __40__WiFiLocaleManager_didUpdateLocations___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getLocaleUsingReverseGeocoder:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end