@interface WiFiLocationManager
+ (id)getStringOfCallbackType:(int)a3;
+ (id)getStringOfState:(int)a3;
+ (id)sharedWiFiLocationManager;
+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 isHighAccuracy:(unsigned __int8)a5;
+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 requiredAccuracy:(double)a5;
+ (void)logLocation:(id)a3 addPrefixString:(id)a4;
- (CLLocation)latestLocation;
- (CLLocationManager)clLocationManager;
- (NSMutableArray)clientsDataArray;
- (NSMutableArray)visitClientsDataArray;
- (OS_dispatch_queue)queue;
- (WiFiLocationManager)init;
- (WiFiLocationManagerDelegate)delegate;
- (int)locationManagerState;
- (unsigned)isAuthorized;
- (unsigned)shouldMonitorVisits;
- (void)cancelLocationRequestTimeOut;
- (void)createCoreLocationObjects;
- (void)dealloc;
- (void)destroyCoreLocationObjects;
- (void)invokeClientsCallbackType:(int)a3 withLocation:(id)a4 withError:(id)a5;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationRequestDidTimeOut;
- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerVisitCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)requestHighAccuracyLocationUpdate;
- (void)requestLeechedAccuracyLocationUpdate;
- (void)requestLowAccuracyLocationUpdate;
- (void)setCLLocationUpdateParams:(id)a3;
- (void)setClLocationManager:(id)a3;
- (void)setClientsDataArray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAuthorized:(unsigned __int8)a3;
- (void)setLatestLocation:(id)a3;
- (void)setLocationManagerState:(int)a3;
- (void)setQueue:(id)a3;
- (void)setShouldMonitorVisits:(unsigned __int8)a3;
- (void)setVisitClientsDataArray:(id)a3;
- (void)stopQueryingLocation;
@end

@implementation WiFiLocationManager

+ (id)sharedWiFiLocationManager
{
  if (sharedWiFiLocationManager_onceToken != -1) {
    dispatch_once(&sharedWiFiLocationManager_onceToken, &__block_literal_global_13);
  }
  return (id)sharedWiFiLocationManager_sharedWiFiLocationManager;
}

void __48__WiFiLocationManager_sharedWiFiLocationManager__block_invoke()
{
  if (objc_opt_class())
  {
    v0 = objc_alloc_init(&OBJC_CLASS___WiFiLocationManager);
    v1 = (void *)sharedWiFiLocationManager_sharedWiFiLocationManager;
    sharedWiFiLocationManager_sharedWiFiLocationManager = (uint64_t)v0;
  }

- (WiFiLocationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiLocationManager;
  v2 = -[WiFiLocationManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WiFiLocationManager setIsAuthorized:](v2, "setIsAuthorized:", 0LL);
    -[WiFiLocationManager setLocationManagerState:](v3, "setLocationManagerState:", 5LL);
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[WiFiLocationManager setClientsDataArray:](v3, "setClientsDataArray:", v4);

    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[WiFiLocationManager setVisitClientsDataArray:](v3, "setVisitClientsDataArray:", v5);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifi.location-manager", 0LL);
    -[WiFiLocationManager setQueue:](v3, "setQueue:", v6);

    -[WiFiLocationManager queue](v3, "queue");
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __27__WiFiLocationManager_init__block_invoke;
    block[3] = &unk_18A16C770;
    v10 = v3;
    dispatch_async(v7, block);
  }

  return v3;
}

uint64_t __27__WiFiLocationManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createCoreLocationObjects];
}

- (void)dealloc
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__WiFiLocationManager_dealloc__block_invoke;
  block[3] = &unk_18A16C770;
  void block[4] = self;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiLocationManager;
  -[WiFiLocationManager dealloc](&v4, sel_dealloc);
}

uint64_t __30__WiFiLocationManager_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) destroyCoreLocationObjects];
}

- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v7 = (void *)MEMORY[0x1895BA820](self, a2);
  v11[0] = a4;
  v11[1] = a3;
  [MEMORY[0x189607B18] valueWithBytes:v11 objCType:"{?=^v^?}"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WiFiLocationManager registerCallbackFunctionPtr:withContext:]";
    __int16 v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: Adding client: %p", buf, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  v10 = -[WiFiLocationManager clientsDataArray](v9, "clientsDataArray");
  [v10 addObject:v8];

  objc_sync_exit(v9);
  objc_autoreleasePoolPop(v7);
}

- (void)registerVisitCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v7 = (void *)MEMORY[0x1895BA820](self, a2);
  v11[0] = a4;
  v11[1] = a3;
  [MEMORY[0x189607B18] valueWithBytes:v11 objCType:"{?=^v^?}"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WiFiLocationManager registerVisitCallbackFunctionPtr:withContext:]";
    __int16 v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: Adding client: %p", buf, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  v10 = -[WiFiLocationManager visitClientsDataArray](v9, "visitClientsDataArray");
  [v10 addObject:v8];

  objc_sync_exit(v9);
  objc_autoreleasePoolPop(v7);
}

- (void)invokeClientsCallbackType:(int)a3 withLocation:(id)a4 withError:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1895BA820]();
  objc_super v11 = self;
  objc_sync_enter(v11);
  v12 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v13 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    +[WiFiLocationManager getStringOfCallbackType:](&OBJC_CLASS___WiFiLocationManager, "getStringOfCallbackType:", v6);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v9 userInfo];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: callbackType: %@, error: %@",  buf,  0x20u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[WiFiLocationManager clientsDataArray](v11, "clientsDataArray", 0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) getValue:buf];
        if (*(void *)&buf[8]) {
          (*(void (**)(uint64_t, void, id, id))&buf[8])(v6, *(void *)buf, v8, v9);
        }
      }

      uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v17);
  }

  objc_sync_exit(v11);
  objc_autoreleasePoolPop(v10);
}

- (void)requestLowAccuracyLocationUpdate
{
}

void __55__WiFiLocationManager_requestLowAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)requestHighAccuracyLocationUpdate
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895BA820](self, a2);
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v26 = "-[WiFiLocationManager requestHighAccuracyLocationUpdate]";
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (-[WiFiLocationManager isAuthorized](v4, "isAuthorized"))
  {
    if (-[WiFiLocationManager locationManagerState](v4, "locationManagerState") == 2)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Already querying high accuracy location",  buf,  2u);
      }
    }

    else
    {
      -[WiFiLocationManager setLocationManagerState:](v4, "setLocationManagerState:", 2LL);
      -[WiFiLocationManager queue](v4, "queue");
      __int128 v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __56__WiFiLocationManager_requestHighAccuracyLocationUpdate__block_invoke;
      block[3] = &unk_18A16C770;
      void block[4] = v4;
      dispatch_async(v21, block);
    }
  }

  else
  {
    id v5 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 localizedStringForKey:@"Location services are not authorized." value:&stru_18A170410 table:0];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 errorWithDomain:@"com.apple.ios.wifi" code:1 userInfo:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v10) {
      -[WiFiLocationManager requestLowAccuracyLocationUpdate].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]( v4,  "invokeClientsCallbackType:withLocation:withError:",  2LL,  0LL,  v9);
    -[WiFiLocationManager delegate](v4, "delegate");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[WiFiLocationManager delegate](v4, "delegate");
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 didFailWithError:v9];
    }
  }

  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
}

void __56__WiFiLocationManager_requestHighAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)requestLeechedAccuracyLocationUpdate
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895BA820](self, a2);
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v26 = "-[WiFiLocationManager requestLeechedAccuracyLocationUpdate]";
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (-[WiFiLocationManager isAuthorized](v4, "isAuthorized"))
  {
    -[WiFiLocationManager setLocationManagerState:](v4, "setLocationManagerState:", 3LL);
    -[WiFiLocationManager queue](v4, "queue");
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __59__WiFiLocationManager_requestLeechedAccuracyLocationUpdate__block_invoke;
    block[3] = &unk_18A16C770;
    void block[4] = v4;
    dispatch_async(v5, block);
  }

  else
  {
    uint64_t v6 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 localizedStringForKey:@"Location services are not authorized." value:&stru_18A170410 table:0];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 errorWithDomain:@"com.apple.ios.wifi" code:1 userInfo:v9];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v11 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[WiFiLocationManager requestLowAccuracyLocationUpdate].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]( v4,  "invokeClientsCallbackType:withLocation:withError:",  2LL,  0LL,  v10);
    -[WiFiLocationManager delegate](v4, "delegate");
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[WiFiLocationManager delegate](v4, "delegate");
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 didFailWithError:v10];
    }
  }

  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
}

void __59__WiFiLocationManager_requestLeechedAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)stopQueryingLocation
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895BA820](self, a2);
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[WiFiLocationManager stopQueryingLocation]";
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[WiFiLocationManager setLocationManagerState:](v4, "setLocationManagerState:", 0LL);
  -[WiFiLocationManager queue](v4, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__WiFiLocationManager_stopQueryingLocation__block_invoke;
  block[3] = &unk_18A16C770;
  void block[4] = v4;
  dispatch_async(v5, block);

  objc_sync_exit(v4);
  objc_autoreleasePoolPop(v3);
}

void __43__WiFiLocationManager_stopQueryingLocation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)setShouldMonitorVisits:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = (void *)MEMORY[0x1895BA820](self, a2);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v10 = "-[WiFiLocationManager setShouldMonitorVisits:]";
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s shouldMonitorVisits: %d", buf, 0x12u);
  }

  v6->_shouldMonitorVisits = v3;
  -[WiFiLocationManager queue](v6, "queue");
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__WiFiLocationManager_setShouldMonitorVisits___block_invoke;
  block[3] = &unk_18A16C770;
  void block[4] = v6;
  dispatch_async(v7, block);

  objc_sync_exit(v6);
  objc_autoreleasePoolPop(v5);
}

void __46__WiFiLocationManager_setShouldMonitorVisits___block_invoke(uint64_t a1)
{
  v1 = *(unsigned __int8 **)(a1 + 32);
  int v2 = v1[8];
  [v1 clLocationManager];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v2) {
    [v3 startMonitoringVisits];
  }
  else {
    [v3 stopMonitoringVisits];
  }
}

- (void)createCoreLocationObjects
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v3 = (void *)MEMORY[0x1895BA820](self, a2);
  id v4 = objc_alloc(MEMORY[0x1896056E0]);
  -[WiFiLocationManager queue](self, "queue");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v4 initWithEffectiveBundlePath:@"/System/Library/PrivateFrameworks/MobileWiFi.framework" delegate:self onQueue:v5];
  -[WiFiLocationManager setClLocationManager:](self, "setClLocationManager:", v6);

  -[WiFiLocationManager setIsAuthorized:]( self,  "setIsAuthorized:",  [MEMORY[0x1896056E0] authorizationStatusForBundlePath:@"/System/Library/PrivateFrameworks/MobileWiFi.framework"]
  - 3 < 2);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = -[WiFiLocationManager isAuthorized](self, "isAuthorized");
    id v8 = "is";
    if (!v7) {
      id v8 = "is not";
    }
    int v9 = 136315394;
    BOOL v10 = "-[WiFiLocationManager createCoreLocationObjects]";
    __int16 v11 = 2080;
    int v12 = v8;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: WiFi %s authorized for location",  (uint8_t *)&v9,  0x16u);
  }

  if (-[WiFiLocationManager isAuthorized](self, "isAuthorized")) {
    -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](self, "requestLeechedAccuracyLocationUpdate");
  }
  objc_autoreleasePoolPop(v3);
}

- (void)destroyCoreLocationObjects
{
  int v3 = (void *)MEMORY[0x1895BA820](self, a2);
  -[WiFiLocationManager clLocationManager](self, "clLocationManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stopUpdatingLocation];

  -[WiFiLocationManager setQueue:](self, "setQueue:", 0LL);
  -[WiFiLocationManager setClLocationManager:](self, "setClLocationManager:", 0LL);
  objc_autoreleasePoolPop(v3);
}

- (void)setCLLocationUpdateParams:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1895BA820]();
  uint64_t v6 = [v4 intValue];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    +[WiFiLocationManager getStringOfState:](&OBJC_CLASS___WiFiLocationManager, "getStringOfState:", v6);
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = 136315394;
    char v19 = "-[WiFiLocationManager setCLLocationUpdateParams:]";
    __int16 v20 = 2112;
    __int128 v21 = v7;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: state <%@>", (uint8_t *)&v18, 0x16u);
  }

  switch((int)v6)
  {
    case 0:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 stopUpdatingLocation];
      goto LABEL_9;
    case 1:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 stopUpdatingLocation];

      BOOL v10 = (double *)MEMORY[0x1896056F0];
      goto LABEL_7;
    case 2:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stopUpdatingLocation];

      BOOL v10 = (double *)MEMORY[0x1896056E8];
LABEL_7:
      double v12 = *v10;
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setDesiredAccuracy:v12];

      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 startUpdatingLocation];

      -[WiFiLocationManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  sel_locationRequestDidTimeOut,  0LL,  60.0);
      break;
    case 3:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 stopUpdatingLocation];

      double v16 = *MEMORY[0x1896056F8];
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setDesiredAccuracy:v16];

      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 startUpdatingLocation];
LABEL_9:

      break;
    default:
      break;
  }

  objc_autoreleasePoolPop(v5);
}

- (void)locationRequestDidTimeOut
{
  v13[1] = *MEMORY[0x1895F89C0];
  int v3 = (void *)MEMORY[0x1895BA820](self, a2);
  id v4 = (void *)MEMORY[0x189607870];
  uint64_t v12 = *MEMORY[0x1896075E0];
  [MEMORY[0x1896077F8] mainBundle];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 localizedStringForKey:@"Location request timed out." value:&stru_18A170410 table:0];
  v13[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 errorWithDomain:@"com.apple.ios.wifi" code:60 userInfo:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]( self,  "invokeClientsCallbackType:withLocation:withError:",  2LL,  0LL,  v8);
  -[WiFiLocationManager delegate](self, "delegate");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WiFiLocationManager delegate](self, "delegate");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 didFailWithError:v8];
  }

  -[WiFiLocationManager setLocationManagerState:](self, "setLocationManagerState:", 3LL);
  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[WiFiLocationManager locationManagerState](self, "locationManagerState"));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiLocationManager setCLLocationUpdateParams:](self, "setCLLocationUpdateParams:", v11);

  objc_autoreleasePoolPop(v3);
}

- (void)cancelLocationRequestTimeOut
{
  int v3 = (void *)MEMORY[0x1895BA820](self, a2);
  [MEMORY[0x189616338] cancelPreviousPerformRequestsWithTarget:self selector:sel_locationRequestDidTimeOut object:0];
  objc_autoreleasePoolPop(v3);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1895BA820]();
  if (v7 && [v7 count])
  {
    [v7 lastObject];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v9 = 0LL;
  }

  if (-[WiFiLocationManager locationManagerState](self, "locationManagerState") != 3
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = "available";
    if (!v9) {
      BOOL v10 = "not available";
    }
    int v28 = 136315394;
    v29 = "-[WiFiLocationManager locationManager:didUpdateLocations:]";
    __int16 v30 = 2080;
    v31 = v10;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: updated location %s",  (uint8_t *)&v28,  0x16u);
  }

  if (v9)
  {
    [v9 timestamp];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiLocationManager latestLocation](self, "latestLocation");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 timestamp];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 timeIntervalSinceDate:v13];
    double v15 = v14;

    -[WiFiLocationManager latestLocation](self, "latestLocation");
    double v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 horizontalAccuracy];
    double v18 = v17;
    [v9 horizontalAccuracy];
    double v20 = v19;

    if (v15 >= 30.0 || v18 - v20 > -100.0)
    {
      -[WiFiLocationManager setLatestLocation:](self, "setLatestLocation:", v9);
      [MEMORY[0x189607958] defaultCenter];
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 postNotificationName:@"com.apple.wifid.locationUpdateNotification" object:v9];

      uint64_t v22 = self;
      objc_sync_enter(v22);
      if (-[WiFiLocationManager locationManagerState](v22, "locationManagerState") != 3)
      {
        -[WiFiLocationManager latestLocation](v22, "latestLocation");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]( v22,  "invokeClientsCallbackType:withLocation:withError:",  1LL,  v23,  0LL);
        v24 = -[WiFiLocationManager delegate](v22, "delegate");
        char v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) != 0)
        {
          -[WiFiLocationManager delegate](v22, "delegate");
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[WiFiLocationManager latestLocation](v22, "latestLocation");
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 didUpdateLocations:v27];
        }

        -[WiFiLocationManager cancelLocationRequestTimeOut](v22, "cancelLocationRequestTimeOut");
        -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](v22, "requestLeechedAccuracyLocationUpdate");
      }

      objc_sync_exit(v22);
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Ignoring new location, keeping existing one",  (uint8_t *)&v28,  2u);
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1895BA820]();
  -[WiFiLocationManager setIsAuthorized:](self, "setIsAuthorized:", (a4 - 3) < 2);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = a4;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "didChangeAuthorizationStatus: Notify registered clients of authorization status change, new status: %d",  buf,  8u);
  }

  if (-[WiFiLocationManager isAuthorized](self, "isAuthorized"))
  {
    -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](self, "requestLeechedAccuracyLocationUpdate");
    id v8 = 0LL;
  }

  else
  {
    int v9 = (void *)MEMORY[0x189607870];
    objc_msgSend(MEMORY[0x1896077F8], "mainBundle", *MEMORY[0x1896075E0]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 localizedStringForKey:@"Location services are not authorized." value:&stru_18A170410 table:0];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    double v17 = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithDomain:@"com.apple.wifi" code:1 userInfo:v12];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]( self,  "invokeClientsCallbackType:withLocation:withError:",  3LL,  0LL,  v8);
  -[WiFiLocationManager delegate](self, "delegate");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WiFiLocationManager delegate](self, "delegate");
    double v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 didChangeAuthorizationStatus];
  }

  objc_autoreleasePoolPop(v7);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1895BA820]();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    -[WiFiLocationManager locationManager:didFailWithError:].cold.1(v7);
  }
  if (-[WiFiLocationManager locationManagerState](self, "locationManagerState") != 3)
  {
    -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]( self,  "invokeClientsCallbackType:withLocation:withError:",  2LL,  0LL,  v7);
    -[WiFiLocationManager delegate](self, "delegate");
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[WiFiLocationManager delegate](self, "delegate");
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 didFailWithError:v7];
    }

    -[WiFiLocationManager cancelLocationRequestTimeOut](self, "cancelLocationRequestTimeOut");
    -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](self, "requestLeechedAccuracyLocationUpdate");
  }

  objc_autoreleasePoolPop(v8);
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1895BA820]();
  int v9 = self;
  objc_sync_enter(v9);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WiFiLocationManager locationManager:didVisit:]";
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (-[WiFiLocationManager shouldMonitorVisits](v9, "shouldMonitorVisits"))
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    -[WiFiLocationManager visitClientsDataArray](v9, "visitClientsDataArray", 0LL);
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v13) getValue:&buf];
          if (*((void *)&buf + 1)) {
            (*((void (**)(void, id))&buf + 1))(buf, v7);
          }
          ++v13;
        }

        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v11);
    }

    -[WiFiLocationManager delegate](v9, "delegate");
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WiFiLocationManager delegate](v9, "delegate");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 didUpdateVisits:v7];
    }
  }

  objc_sync_exit(v9);

  objc_autoreleasePoolPop(v8);
}

+ (void)logLocation:(id)a3 addPrefixString:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1895BA820]();
  if (v5)
  {
    unsigned int v8 = [v5 type] - 1;
    if (v8 > 9) {
      int v9 = @"unknown";
    }
    else {
      int v9 = off_18A16E560[v8];
    }
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@: source=%@", (uint8_t *)&v10, 0x16u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    +[WiFiLocationManager logLocation:addPrefixString:].cold.1((uint64_t)v6);
  }

  objc_autoreleasePoolPop(v7);
}

+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 isHighAccuracy:(unsigned __int8)a5
{
  double v6 = dbl_187F83C10[a5 == 0];
  id v7 = a3;
  unsigned __int8 v8 = [(id)objc_opt_class() isLocationValid:v7 uptoSeconds:a4 requiredAccuracy:v6];

  return v8;
}

+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 requiredAccuracy:(double)a5
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  unsigned __int8 v8 = (void *)MEMORY[0x1895BA820]();
  if (v7)
  {
    [v7 timestamp];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    if (v9)
    {
      [v9 timeIntervalSinceNow];
      if (v11 > 0.0)
      {
        BOOL v35 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v35) {
          +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:].cold.3( v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42);
        }
      }

      else
      {
        double v12 = -v11;
        [v7 clientLocation];
        if (v12 < a4 || (int)v43 == -1 || v43 > v12)
        {
          [v7 horizontalAccuracy];
          if (v15 <= a5)
          {
            unsigned __int8 v16 = 1;
            __int128 v17 = "YES";
            goto LABEL_17;
          }
        }
      }
    }

    else
    {
      BOOL v27 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v27) {
        +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:].cold.2( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34);
      }
    }

    unsigned __int8 v16 = 0;
    __int128 v17 = "NO";
LABEL_17:
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v45 = v17;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "isLocationValid: %s", buf, 0xCu);
    }

    goto LABEL_20;
  }

  BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  if (v18) {
    +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  unsigned __int8 v16 = 0;
LABEL_20:
  objc_autoreleasePoolPop(v8);

  return v16;
}

+ (id)getStringOfCallbackType:(int)a3
{
  id v4 = (void *)MEMORY[0x1895BA820](a1, a2);
  else {
    id v5 = off_18A16E5B0[a3 - 1];
  }
  objc_autoreleasePoolPop(v4);
  return (id)v5;
}

+ (id)getStringOfState:(int)a3
{
  id v4 = (void *)MEMORY[0x1895BA820](a1, a2);
  else {
    id v5 = off_18A16E5C8[a3];
  }
  objc_autoreleasePoolPop(v4);
  return (id)v5;
}

- (unsigned)shouldMonitorVisits
{
  return self->_shouldMonitorVisits;
}

- (WiFiLocationManagerDelegate)delegate
{
  return (WiFiLocationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CLLocation)latestLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLatestLocation:(id)a3
{
}

- (unsigned)isAuthorized
{
  return self->_isAuthorized;
}

- (void)setIsAuthorized:(unsigned __int8)a3
{
  self->_isAuthorized = a3;
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (void)setClLocationManager:(id)a3
{
}

- (NSMutableArray)clientsDataArray
{
  return self->_clientsDataArray;
}

- (void)setClientsDataArray:(id)a3
{
}

- (NSMutableArray)visitClientsDataArray
{
  return self->_visitClientsDataArray;
}

- (void)setVisitClientsDataArray:(id)a3
{
}

- (int)locationManagerState
{
  return self->_locationManagerState;
}

- (void)setLocationManagerState:(int)a3
{
  self->_locationManagerState = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)locationManager:(void *)a1 didFailWithError:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 description];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  int v2 = 136315394;
  int v3 = "-[WiFiLocationManager locationManager:didFailWithError:]";
  __int16 v4 = 2112;
  id v5 = v1;
  _os_log_error_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%s: error: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)logLocation:(uint64_t)a1 addPrefixString:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%@: Error: location is nil",  (uint8_t *)&v1,  0xCu);
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end