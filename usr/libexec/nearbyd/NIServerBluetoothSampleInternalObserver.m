@interface NIServerBluetoothSampleInternalObserver
+ (BOOL)_advertisementCacheEnabled;
+ (id)sharedObserver;
+ (unint64_t)_cachePreloadValue;
- (NIBluetoothDeviceCapabilities)deviceCapabilities;
- (id)_initPrivate;
- (id)activateCBDiscovery;
- (void)configureBTMaxRateScanningForPrototypeHomeSession;
- (void)configureCBDiscovery;
- (void)didDiscoverDevice:(id)a3;
- (void)handleCBDiscoveryInterrupted;
- (void)handleCBDiscoveryStateChanged;
- (void)handleCBDiscoverySystemOverride;
- (void)registerForInternalBluetoothSamples:(id)a3;
- (void)registerForInternalBluetoothSamples:(id)a3 reportCache:(BOOL)a4;
- (void)startBTScanningWithMaxRateForPrototypeHomeSession:(id)a3;
- (void)startHighPriorityScanningForToken:(id)a3 forConsumer:(id)a4;
- (void)startLeechingForConsumer:(id)a3;
- (void)stopBTScanningWithMaxRateForPrototypeHomeSession;
- (void)stopHighPriorityScanning;
- (void)stopLeechingForConsumer:(id)a3;
- (void)unregisterForInternalBluetoothSamples:(id)a3;
@end

@implementation NIServerBluetoothSampleInternalObserver

- (id)_initPrivate
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NIServerBluetoothSampleInternalObserver;
  v2 = -[NIServerBluetoothSampleInternalObserver init](&v32, "init");
  p_isa = (id *)&v2->super.isa;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    consumers = v2->_consumers;
    v2->_consumers = (NSHashTable *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    activeConsumers = v2->_activeConsumers;
    v2->_activeConsumers = (NSHashTable *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    currentHighPriorityConsumer = v2->_currentHighPriorityConsumer;
    v2->_currentHighPriorityConsumer = (NSHashTable *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nearbyd.devicepresence.cbdiscovery", 0LL);
    cbDiscoveryQueue = v2->_cbDiscoveryQueue;
    v2->_cbDiscoveryQueue = (OS_dispatch_queue *)v9;

    atomic_store(0, (unsigned __int8 *)&v2->_activated);
    atomic_store(0, (unsigned __int8 *)&v2->_homeSessionAggressiveScanningActivated);
    if (objc_msgSend((id)objc_opt_class(v2, v11), "_advertisementCacheEnabled"))
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NIBluetoothAdvertisementCache);
      advertisementCache = v2->_advertisementCache;
      v2->_advertisementCache = v12;

      uint64_t v14 = mach_continuous_time();
      double v15 = sub_100023BEC(v14);
      int v17 = objc_msgSend((id)objc_opt_class(v2, v16), "_cachePreloadValue");
      if (v17 >= 1)
      {
        LODWORD(v18) = v17;
        int v19 = 8 * v17 - 1;
        do
        {
          int v20 = v18;
          uint64_t v18 = (v18 - 1);
          for (int i = 6; i != -2; --i)
          {
            v22 = objc_alloc(&OBJC_CLASS___NIBluetoothSample);
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%08i",  v18));
            v24 = -[NIBluetoothSample initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:]( v22,  "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:",  v23,  @"a",  ((v20 + i) % 3 + 37),  (double)((v20 + i) % 70 - 80),  v15 - (double)(v19 + i - 6) * 0.125);

            -[NIBluetoothAdvertisementCache addSample:](v2->_advertisementCache, "addSample:", v24);
          }

          v19 -= 8;
        }

        while (v20 >= 2);
      }

      v25 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([p_isa[10] allSamples]);
        id v27 = [v26 count];
        uint64_t v28 = mach_continuous_time();
        double v29 = sub_100023BEC(v28);
        *(_DWORD *)buf = 134218240;
        id v34 = v27;
        __int16 v35 = 2048;
        double v36 = v29 - v15;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor AdvertisementCache preloaded with %lu samples in %f seconds",  buf,  0x16u);
      }
    }

    [p_isa configureCBDiscovery];
  }

  return p_isa;
}

+ (BOOL)_advertisementCacheEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"AdvertisementCacheEnabled"]);
  v4 = (os_log_s *)qword_1008000A0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      dispatch_queue_t v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor AdvertisementCache Enabled default override: %@",  (uint8_t *)&v8,  0xCu);
    }

    unsigned __int8 v6 = [v3 BOOLValue];
  }

  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor AdvertisementCache Enabled: YES",  (uint8_t *)&v8,  2u);
    }

    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (unint64_t)_cachePreloadValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"AdvertisementCachePreloadValue"]);
  v4 = (os_log_s *)qword_1008000A0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      dispatch_queue_t v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor AdvertisementCache PreloadValue default override: %@",  (uint8_t *)&v8,  0xCu);
    }

    id v6 = [v3 unsignedLongLongValue];
  }

  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor AdvertisementCache PreloadValue: 0",  (uint8_t *)&v8,  2u);
    }

    id v6 = 0LL;
  }

  return (unint64_t)v6;
}

+ (id)sharedObserver
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100157468;
  block[3] = &unk_1007A2398;
  block[4] = a1;
  if (qword_1007F8200 != -1) {
    dispatch_once(&qword_1007F8200, block);
  }
  return (id)qword_1007F81F8;
}

- (void)registerForInternalBluetoothSamples:(id)a3
{
  id v5 = a3;
  -[NIServerBluetoothSampleInternalObserver registerForInternalBluetoothSamples:reportCache:]( self,  "registerForInternalBluetoothSamples:reportCache:",  v5,  objc_msgSend((id)objc_opt_class(self, v4), "_advertisementCacheEnabled"));
}

- (void)registerForInternalBluetoothSamples:(id)a3 reportCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (([v6 supportsDevicePresence] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100390D20();
    }
    uint64_t v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/DevicePresence/NIServerBlu"
            "etoothSampleDistributor.mm";
      __int16 v17 = 1024;
      int v18 = 210;
      __int16 v19 = 2080;
      int v20 = "-[NIServerBluetoothSampleInternalObserver registerForInternalBluetoothSamples:reportCache:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "#btsampledistributor %s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  -[NSHashTable addObject:](self->_consumers, "addObject:", v6);
  if (v4)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothAdvertisementCache allSamples](self->_advertisementCache, "allSamples"));
    dispatch_queue_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 getQueueForInputingData]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001576F0;
    v12[3] = &unk_1007A2248;
    id v13 = v8;
    id v14 = v6;
    id v10 = v8;
    dispatch_async(v9, v12);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterForInternalBluetoothSamples:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_consumers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (NIBluetoothDeviceCapabilities)deviceCapabilities
{
  return (NIBluetoothDeviceCapabilities)1;
}

- (void)startLeechingForConsumer:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_activeConsumers, "addObject:", v4);
  if (!-[CBDiscovery discoveryFlags](self->_cbDiscovery, "discoveryFlags")) {
    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0x101202000040LL);
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBluetoothSampleInternalObserver activateCBDiscovery](self, "activateCBDiscovery"));
    if (v7 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100390D58();
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)startBTScanningWithMaxRateForPrototypeHomeSession:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  if (!homeSessionAggressiveScanner)
  {
    -[NIServerBluetoothSampleInternalObserver configureBTMaxRateScanningForPrototypeHomeSession]( self,  "configureBTMaxRateScanningForPrototypeHomeSession");
    homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  }

  -[CBDiscovery setDiscoveryFlags:](homeSessionAggressiveScanner, "setDiscoveryFlags:", 0x1200000040LL);
  -[CBDiscovery setBleScanRate:](self->_homeSessionAggressiveScanner, "setBleScanRate:", 60LL);
  -[CBDiscovery setUseCase:](self->_homeSessionAggressiveScanner, "setUseCase:", 131093LL);
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  if ((v6 & 1) == 0)
  {
    if (-[CBDiscovery bluetoothState](self->_homeSessionAggressiveScanner, "bluetoothState") == (id)4)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100390DBC();
      }
    }

    else
    {
      objc_initWeak(&location, self);
      double v7 = sub_100023CC4();
      int v8 = self->_homeSessionAggressiveScanner;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100157B64;
      v9[3] = &unk_1007B13F0;
      v10[1] = *(id *)&v7;
      objc_copyWeak(v10, &location);
      -[CBDiscovery activateWithCompletion:](v8, "activateWithCompletion:", v9);
      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)stopBTScanningWithMaxRateForPrototypeHomeSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  if ((v4 & 1) != 0)
  {
    -[CBDiscovery setDiscoveryFlags:](self->_homeSessionAggressiveScanner, "setDiscoveryFlags:", 0LL);
    -[CBDiscovery setBleScanRate:](self->_homeSessionAggressiveScanner, "setBleScanRate:", 0LL);
    -[CBDiscovery setUseCase:](self->_homeSessionAggressiveScanner, "setUseCase:", 0LL);
    -[CBDiscovery removeAllDiscoveryTypes](self->_homeSessionAggressiveScanner, "removeAllDiscoveryTypes");
    atomic_store(0, (unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)stopLeechingForConsumer:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_activeConsumers, "removeObject:", v4);
  if (-[NSHashTable containsObject:](self->_currentHighPriorityConsumer, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_currentHighPriorityConsumer, "removeObject:", v4);
    -[NIServerBluetoothSampleInternalObserver stopHighPriorityScanning](self, "stopHighPriorityScanning");
  }

  if (!-[NSHashTable count](self->_activeConsumers, "count"))
  {
    NSUInteger v5 = -[NSHashTable count](self->_currentHighPriorityConsumer, "count");
    unsigned __int8 v6 = (os_log_s *)qword_1008000A0;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor No active leech consumers but we have a high priority consumer so not changing discovery flags",  v8,  2u);
      }
    }

    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor No active leech consumers and no active high priority consumers so unsetting discovery flags",  buf,  2u);
      }

      -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0LL);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)startHighPriorityScanningForToken:(id)a3 forConsumer:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v7 = objc_alloc_init(&OBJC_CLASS___CBOOBKeyInfo);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectInRawTokenOPACKDictForKey:&off_1007D2328]);
  [v7 setIrkData:v8];

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectInRawTokenOPACKDictForKey:&off_1007D2340]);
  if (v9)
  {
    [v7 setBtAddressData:v9];
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( NSMutableString,  "stringWithCapacity:",  3 * (void)[v9 length]));
    id v11 = v9;
    v12 = (unsigned __int8 *)[v11 bytes];
    if (![v10 length])
    {
      __int16 v19 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100390E74((uint64_t)buf, (uint64_t)[v10 length], v19);
      }
      goto LABEL_25;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringToIndex:", (char *)objc_msgSend( v10,  "length") - 1));
    id v15 = [v14 mutableCopy];

    uint64_t v16 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = [v15 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor #nibtfinding starting token finding for btaddress: %s",  buf,  0xCu);
    }

    id v17 = [v11 length];
    if (v17 == (id)6)
    {
      id v10 = v15;
    }

    else
    {
      if (v17 != (id)7)
      {
        __int16 v19 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v10 = v15;
          sub_100390EB0((uint64_t)[v10 UTF8String], (uint64_t)buf, v19);
        }

        else
        {
          id v10 = v15;
        }

        goto LABEL_25;
      }

      int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 substringFromIndex:3]);
      id v10 = [v18 mutableCopy];
    }

    int v20 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v10 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v29 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor #nibtfinding setting device filter: %s",  buf,  0xCu);
    }

    id v27 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    -[CBDiscovery setOobKeys:](self->_cbDiscovery, "setOobKeys:", v22);

    id v26 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    -[CBDiscovery setDeviceFilter:](self->_cbDiscovery, "setDeviceFilter:", v23);

    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0x200000000LL);
    -[CBDiscovery setBleScanRate:](self->_cbDiscovery, "setBleScanRate:", 60LL);
    -[CBDiscovery setUseCase:](self->_cbDiscovery, "setUseCase:", 589824LL);
    -[CBDiscovery addDiscoveryType:](self->_cbDiscovery, "addDiscoveryType:", 14LL);
    -[NSHashTable addObject:](self->_currentHighPriorityConsumer, "addObject:", v25);
    unsigned __int8 v24 = atomic_load((unsigned __int8 *)&self->_activated);
    if ((v24 & 1) != 0) {
      goto LABEL_26;
    }
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NIServerBluetoothSampleInternalObserver activateCBDiscovery](self, "activateCBDiscovery"));
    if (v19 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100390D58();
    }
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100390E48();
  }
LABEL_27:

  os_unfair_lock_unlock(&self->_lock);
}

- (void)stopHighPriorityScanning
{
}

- (id)activateCBDiscovery
{
  if (!self->_cbDiscovery
    || _os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE]( &OBJC_CLASS____TtC19ProximityDaemonCore22AONSenseSampleProvider,  "AONSENSE_FRAMEWORK_AVAILABLE")
    && (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples")
     && !self->_cbDiscoveryScreenOffBuffer
     || !self->_cbDiscoveryAirPodsLeech)
    || -[CBDiscovery bluetoothState](self->_cbDiscovery, "bluetoothState") == (id)4
    || _os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider")
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE]( &OBJC_CLASS____TtC19ProximityDaemonCore22AONSenseSampleProvider,  "AONSENSE_FRAMEWORK_AVAILABLE")
    && (_os_feature_enabled_impl("Sharing", "AirPodsProxUseBufferedSamples")
     && -[CBDiscovery bluetoothState](self->_cbDiscoveryScreenOffBuffer, "bluetoothState") == (id)4
     || -[CBDiscovery bluetoothState](self->_cbDiscoveryAirPodsLeech, "bluetoothState") == (id)4))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10017LL,  0LL));
  }

  else
  {
    objc_initWeak(&location, self);
    double v4 = sub_100023CC4();
    cbDiscovery = self->_cbDiscovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10015858C;
    v7[3] = &unk_1007B13F0;
    v8[1] = *(id *)&v4;
    objc_copyWeak(v8, &location);
    -[CBDiscovery activateWithCompletion:](cbDiscovery, "activateWithCompletion:", v7);
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (void)configureCBDiscovery
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
  cbDiscovery = self->_cbDiscovery;
  self->_cbDiscovery = v3;

  -[CBDiscovery setDispatchQueue:](self->_cbDiscovery, "setDispatchQueue:", self->_cbDiscoveryQueue);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001588C4;
  v11[3] = &unk_1007A1C78;
  objc_copyWeak(&v12, &location);
  -[CBDiscovery setDeviceFoundHandler:](self->_cbDiscovery, "setDeviceFoundHandler:", v11);
  -[CBDiscovery setInvalidationHandler:](self->_cbDiscovery, "setInvalidationHandler:", &stru_1007B1410);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100158964;
  v9[3] = &unk_1007A1CA0;
  objc_copyWeak(&v10, &location);
  -[CBDiscovery setInterruptionHandler:](self->_cbDiscovery, "setInterruptionHandler:", v9);
  -[CBDiscovery setErrorHandler:](self->_cbDiscovery, "setErrorHandler:", &stru_1007B1450);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100158A1C;
  v7[3] = &unk_1007A1CA0;
  objc_copyWeak(&v8, &location);
  -[CBDiscovery setBluetoothStateChangedHandler:](self->_cbDiscovery, "setBluetoothStateChangedHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100158A64;
  v5[3] = &unk_1007A1CA0;
  objc_copyWeak(&v6, &location);
  -[CBDiscovery setSystemOverrideHandler:](self->_cbDiscovery, "setSystemOverrideHandler:", v5);
  -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0LL);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)configureBTMaxRateScanningForPrototypeHomeSession
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___CBDiscovery);
  homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  self->_homeSessionAggressiveScanner = v3;

  -[CBDiscovery setDispatchQueue:](self->_homeSessionAggressiveScanner, "setDispatchQueue:", self->_cbDiscoveryQueue);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100158CB0;
  v11[3] = &unk_1007A1C78;
  objc_copyWeak(&v12, &location);
  -[CBDiscovery setDeviceFoundHandler:](self->_homeSessionAggressiveScanner, "setDeviceFoundHandler:", v11);
  -[CBDiscovery setInvalidationHandler:]( self->_homeSessionAggressiveScanner,  "setInvalidationHandler:",  &stru_1007B1470);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100158D58;
  v9[3] = &unk_1007A1CA0;
  objc_copyWeak(&v10, &location);
  -[CBDiscovery setInterruptionHandler:](self->_homeSessionAggressiveScanner, "setInterruptionHandler:", v9);
  -[CBDiscovery setErrorHandler:](self->_homeSessionAggressiveScanner, "setErrorHandler:", &stru_1007B1490);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100158E18;
  v7[3] = &unk_1007A1CA0;
  objc_copyWeak(&v8, &location);
  -[CBDiscovery setBluetoothStateChangedHandler:]( self->_homeSessionAggressiveScanner,  "setBluetoothStateChangedHandler:",  v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100158E68;
  v5[3] = &unk_1007A1CA0;
  objc_copyWeak(&v6, &location);
  -[CBDiscovery setSystemOverrideHandler:](self->_homeSessionAggressiveScanner, "setSystemOverrideHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)didDiscoverDevice:(id)a3
{
  id v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = v4;
  v40 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
  if (!v6)
  {
    unsigned int v48 = objc_msgSend(v5, "proximityPairingProductID", lock);
    sub_100200E60(&v48, __p);
    if (v50 < 0)
    {
      if (!__p[1])
      {
        id v6 = 0LL;
LABEL_43:
        operator delete(__p[0]);
        goto LABEL_2;
      }

      id v12 = (void **)__p[0];
    }

    else
    {
      if (!v50)
      {
        id v6 = 0LL;
        goto LABEL_2;
      }

      id v12 = __p;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
    if ((v50 & 0x80000000) == 0) {
      goto LABEL_2;
    }
    goto LABEL_43;
  }

- (void)handleCBDiscoveryInterrupted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = self->_consumers;
  id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (unint64_t i = 0LL; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 getQueueForInputingData]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100159704;
        block[3] = &unk_1007A3000;
        block[4] = v8;
        dispatch_async(v9, block);
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)handleCBDiscoveryStateChanged
{
  unint64_t v3 = (unint64_t)-[CBDiscovery bluetoothState](self->_cbDiscovery, "bluetoothState");
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 0xA) {
      id v5 = "?";
    }
    else {
      id v5 = off_1007B15E0[v3];
    }
    *(_DWORD *)buf = 136315138;
    int v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor CBDiscovery Bluetooth state changed: %s",  buf,  0xCu);
  }

  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = self->_consumers;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 getQueueForInputingData]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100159910;
        block[3] = &unk_1007B14E0;
        block[4] = v10;
        void block[5] = v3;
        dispatch_async(v11, block);
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)handleCBDiscoverySystemOverride
{
  if ((-[CBDiscovery systemOverrideFlags](self->_cbDiscovery, "systemOverrideFlags") & 1) != 0)
  {
    id v3 = (id)qword_1008000A0;
    if (!os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

      return;
    }

    int v4 = -[CBDiscovery bleScanRate](self->_cbDiscovery, "bleScanRate");
    if (v4 > 34)
    {
      if (v4 > 49)
      {
        if (v4 == 50)
        {
          id v5 = "High";
          goto LABEL_23;
        }

        if (v4 == 60)
        {
          id v5 = "Max";
          goto LABEL_23;
        }
      }

      else
      {
        if (v4 == 35)
        {
          id v5 = "MediumLow";
          goto LABEL_23;
        }

        if (v4 == 40)
        {
          id v5 = "Medium";
          goto LABEL_23;
        }
      }
    }

    else if (v4 > 19)
    {
      if (v4 == 20)
      {
        id v5 = "Background";
        goto LABEL_23;
      }

      if (v4 == 30)
      {
        id v5 = "Low";
        goto LABEL_23;
      }
    }

    else
    {
      if (!v4)
      {
        id v5 = "Default";
        goto LABEL_23;
      }

      if (v4 == 10)
      {
        id v5 = "Periodic";
LABEL_23:
        int v6 = 136315138;
        id v7 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "#btsampledistributor CBDiscovery #nicoex Bluetooth scanning reduced (%s) due to WiFi critical.",  (uint8_t *)&v6,  0xCu);
        goto LABEL_24;
      }
    }

    id v5 = "?";
    goto LABEL_23;
  }

- (void).cxx_destruct
{
}

  ;
}

@end