@interface NIServerFindingDiscoveryProvider
- (NIServerFindingDiscoveryProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 enableBluetooth:(BOOL)a5 launchOnDemand:(BOOL)a6 scanRate:(int)a7 discoveryTimeout:(double)a8 oobRefreshPeriod:(double)a9 consumer:(id)a10 queue:(id)a11;
- (NSDictionary)advertisingPeers;
- (NSDictionary)discoveredPeers;
- (NSSet)peersEligibleForDiscovery;
- (array<unsigned)advertisingAddress;
- (id).cxx_construct;
- (id)_cbAdvertisingAddress;
- (id)_configureNearbyActionNoWakeScannerAndRequestScan:(BOOL)a3;
- (id)_configureSpatialInteractionScannerAndRequestScan:(BOOL)a3;
- (id)_getAdvertisementFromCBDevice:(id)a3 advertisementType:(int)a4;
- (id)_getDiscoveryTokenFromCBDevice:(id)a3 advertisementType:(int)a4;
- (id)_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers;
- (id)printableState;
- (id)processAdvertisement:(id)a3 receivedOOBFromPeer:(id)a4;
- (id)processLostEventReceivedOOBFromPeer:(id)a3;
- (id)setPeersEligibleForDiscovery:(id)a3 requestScan:(BOOL)a4;
- (id)startAdvertisingToPeer:(id)a3 advertisement:(id)a4 timeout:(double)a5;
- (id)stopAdvertisingToPeer:(id)a3;
- (void)_cbAdvertisingAddressChangedHandler;
- (void)_cbBluetoothStateChangedHandler;
- (void)_cbDeviceFoundHandler:(id)a3;
- (void)_cbErrorHandler:(id)a3;
- (void)_cbInterruptionHandler;
- (void)_configureAdvertisementOOBRefreshTimerForToken:(id)a3;
- (void)_configureAdvertisementTimeout:(double)a3 forToken:(id)a4;
- (void)_configureDiscoveryTimeout:(double)a3 forToken:(id)a4;
- (void)_nearbyActionNoWakeDisableScanDupesIfNecessary;
- (void)_processReceivedAdvertisement:(id)a3 fromPeer:(id)a4 overBluetooth:(BOOL)a5 cbDevice:(id)a6;
- (void)_resetAdvertisingStateForAllPeers;
- (void)_resetDiscoveryStateForAllPeers;
- (void)_resetDiscoveryStateForPeer:(id)a3;
- (void)_updateLaunchOnDemandScannerAndRequestScan:(BOOL)a3;
- (void)activate;
- (void)invalidate;
@end

@implementation NIServerFindingDiscoveryProvider

- (NIServerFindingDiscoveryProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 enableBluetooth:(BOOL)a5 launchOnDemand:(BOOL)a6 scanRate:(int)a7 discoveryTimeout:(double)a8 oobRefreshPeriod:(double)a9 consumer:(id)a10 queue:(id)a11
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  BOOL v16 = a4;
  id v19 = a10;
  id v20 = a11;
  if (!v19) {
    __assert_rtn( "-[NIServerFindingDiscoveryProvider initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTi meout:oobRefreshPeriod:consumer:queue:]",  "NIServerFindingDiscovery.mm",  802,  "consumer");
  }
  v21 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = sub_100277A54(v16);
    if (a7 > 34)
    {
      if (a7 > 49)
      {
        if (a7 == 50)
        {
          v23 = "High";
          goto LABEL_23;
        }

        if (a7 == 60)
        {
          v23 = "Max";
          goto LABEL_23;
        }
      }

      else
      {
        if (a7 == 35)
        {
          v23 = "MediumLow";
          goto LABEL_23;
        }

        if (a7 == 40)
        {
          v23 = "Medium";
          goto LABEL_23;
        }
      }
    }

    else if (a7 > 19)
    {
      if (a7 == 20)
      {
        v23 = "Background";
        goto LABEL_23;
      }

      if (a7 == 30)
      {
        v23 = "Low";
        goto LABEL_23;
      }
    }

    else
    {
      if (!a7)
      {
        v23 = "Default";
        goto LABEL_23;
      }

      if (a7 == 10)
      {
        v23 = "Periodic";
LABEL_23:
        *(_DWORD *)buf = 136316418;
        v49 = v22;
        __int16 v50 = 1024;
        BOOL v51 = v15;
        __int16 v52 = 1024;
        BOOL v53 = v14;
        __int16 v54 = 2080;
        v55 = v23;
        __int16 v56 = 2048;
        double v57 = a8;
        __int16 v58 = 2048;
        double v59 = a9;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] init. Enable BT: %d. Launch on demand: %d. Scan rate: %s. Discovery timeout: %0.1f s. OOB refresh: %0.1f s",  buf,  0x36u);
        goto LABEL_24;
      }
    }

    v23 = "?";
    goto LABEL_23;
  }

- (void)activate
{
  if (!self->_consumerQueue)
  {
    v3 = objc_opt_new(&OBJC_CLASS___CBController);
    consumerQueue = self->_consumerQueue;
    self->_consumerQueue = v3;

    -[OS_dispatch_queue setDispatchQueue:](self->_consumerQueue, "setDispatchQueue:", *(void *)&self->_isFinder);
    v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"nearbyd%s",  sub_100277A54(LOBYTE(self->_identifier.__r_.var0)));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[OS_dispatch_queue setLabel:](self->_consumerQueue, "setLabel:", v6);

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10029B994;
    v29[3] = &unk_1007A1CA0;
    objc_copyWeak(&v30, &location);
    -[OS_dispatch_queue setInterruptionHandler:](self->_consumerQueue, "setInterruptionHandler:", v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10029B9DC;
    v27[3] = &unk_1007A1CC8;
    objc_copyWeak(&v28, &location);
    -[OS_dispatch_queue setErrorHandler:](self->_consumerQueue, "setErrorHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10029BA3C;
    v25[3] = &unk_1007A1CA0;
    objc_copyWeak(&v26, &location);
    -[OS_dispatch_queue setBluetoothStateChangedHandler:](self->_consumerQueue, "setBluetoothStateChangedHandler:", v25);
    self->_enableBluetooth = 0;
    v7 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      v33 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] activate controller",  buf,  0xCu);
    }

    double v9 = sub_100023CC4();
    v10 = self->_consumerQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10029BA84;
    v23[3] = &unk_1007B13F0;
    v24[1] = *(id *)&v9;
    objc_copyWeak(v24, &location);
    -[OS_dispatch_queue activateWithCompletion:](v10, "activateWithCompletion:", v23);
    objc_destroyWeak(v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
  }

  if (!self->_controller)
  {
    v11 = objc_opt_new(&OBJC_CLASS___CBAdvertiser);
    controller = self->_controller;
    self->_controller = v11;

    -[CBController setDispatchQueue:](self->_controller, "setDispatchQueue:", *(void *)&self->_isFinder);
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"nearbyd%s",  sub_100277A54(LOBYTE(self->_identifier.__r_.var0)));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[CBController setLabel:](self->_controller, "setLabel:", v14);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10029BBF8;
    v21[3] = &unk_1007A1CA0;
    objc_copyWeak(&v22, &location);
    -[CBController setAdvertisingAddressChangedHandler:](self->_controller, "setAdvertisingAddressChangedHandler:", v21);
    self->_activatedController = 0;
    BOOL v15 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      v33 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] activate address observer",  buf,  0xCu);
    }

    double v17 = sub_100023CC4();
    v18 = self->_controller;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10029BC40;
    v19[3] = &unk_1007B13F0;
    v20[1] = *(id *)&v17;
    objc_copyWeak(v20, &location);
    -[CBController activateWithCompletion:](v18, "activateWithCompletion:", v19);
    objc_destroyWeak(v20);
    objc_destroyWeak(&v22);
  }

  objc_destroyWeak(&location);
}

- (void)invalidate
{
  consumerQueue = self->_consumerQueue;
  if (consumerQueue)
  {
    -[OS_dispatch_queue invalidate](consumerQueue, "invalidate");
    v4 = self->_consumerQueue;
    self->_consumerQueue = 0LL;
  }

  controller = self->_controller;
  if (controller)
  {
    -[CBController invalidate](controller, "invalidate");
    v6 = self->_controller;
    self->_controller = 0LL;
  }

  addressObserver = self->_addressObserver;
  if (addressObserver)
  {
    -[CBAdvertiser invalidate](addressObserver, "invalidate");
    v8 = self->_addressObserver;
    self->_addressObserver = 0LL;
  }

  double v9 = *(void **)&self->_activatedAddressObserver;
  if (v9)
  {
    [v9 invalidate];
    v10 = *(void **)&self->_activatedAddressObserver;
    *(void *)&self->_activatedAddressObserver = 0LL;

    advertisingTimeoutTimers = self->_advertisingTimeoutTimers;
    self->_advertisingTimeoutTimers = 0LL;
  }

  self->_enableBluetooth = 0;
  self->_activatedController = 0;
  LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
  discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10029BEC0;
  v13[3] = &unk_1007B4080;
  v13[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveryTimeoutTimers,  "enumerateKeysAndObjectsUsingBlock:",  v13);
  -[NIServerFindingDiscoveryProvider _resetDiscoveryStateForAllPeers](self, "_resetDiscoveryStateForAllPeers");
  -[NIServerFindingDiscoveryProvider _resetAdvertisingStateForAllPeers](self, "_resetAdvertisingStateForAllPeers");
  [*(id *)&self->_activatedScanner removeAllObjects];
  -[NIServerFindingDiscoveryProvider _updateLaunchOnDemandScannerAndRequestScan:]( self,  "_updateLaunchOnDemandScannerAndRequestScan:",  0LL);
}

- (id)setPeersEligibleForDiscovery:(id)a3 requestScan:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (NSSet *)a3;
  v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    unsigned int v9 = -[NSSet count](v6, "count");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v6, "allObjects"));
    id v11 = sub_10027801C(v10, 10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 136315907;
    v37 = v8;
    __int16 v38 = 1024;
    BOOL v39 = v4;
    __int16 v40 = 1024;
    unsigned int v41 = v9;
    __int16 v42 = 2113;
    v43 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] setPeersEligibleForDiscovery. requestScan: %d. Peers (%d): %{private}@",  buf,  0x22u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v6) {
    v6 = objc_opt_new(&OBJC_CLASS___NSSet);
  }
  v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  disableScanDupeConfigTimer = self->_disableScanDupeConfigTimer;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10029C2DC;
  v33[3] = &unk_1007BBA50;
  BOOL v15 = v6;
  v34 = v15;
  BOOL v16 = v13;
  v35 = v16;
  -[OS_dispatch_source enumerateKeysAndObjectsUsingBlock:]( disableScanDupeConfigTimer,  "enumerateKeysAndObjectsUsingBlock:",  v33);
  -[OS_dispatch_source removeObjectsForKeys:](self->_disableScanDupeConfigTimer, "removeObjectsForKeys:", v16);
  -[NSMutableSet removeObjectsForKeys:](self->_eligibleDiscoveryPeers, "removeObjectsForKeys:", v16);
  -[NSMutableArray removeAllObjects](v16, "removeAllObjects");
  discoveredPeers = self->_discoveredPeers;
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  v29 = sub_10029C33C;
  id v30 = &unk_1007BBA78;
  v18 = v15;
  v31 = v18;
  id v19 = v16;
  v32 = v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredPeers, "enumerateKeysAndObjectsUsingBlock:", &v27);
  -[NSMutableDictionary removeObjectsForKeys:](self->_discoveredPeers, "removeObjectsForKeys:", v19, v27, v28, v29, v30);
  id v20 = -[NSSet mutableCopy](v18, "mutableCopy");
  v21 = *(void **)&self->_activatedScanner;
  *(void *)&self->_activatedScanner = v20;

  if (!LOBYTE(self->_consumer))
  {
    v24 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#find-disc,BT not enabled. Skipping configuring scanner.",  buf,  2u);
    }

    goto LABEL_14;
  }

  int v22 = sub_100277758(LOBYTE(self->_identifier.__r_.var0) == 0);
  if (v22 == 19)
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider _configureSpatialInteractionScannerAndRequestScan:]( self,  "_configureSpatialInteractionScannerAndRequestScan:",  v4));
  }

  else
  {
    if (v22 != 26)
    {
LABEL_13:
      -[NIServerFindingDiscoveryProvider _updateLaunchOnDemandScannerAndRequestScan:]( self,  "_updateLaunchOnDemandScannerAndRequestScan:",  v4);
LABEL_14:
      v25 = 0LL;
      goto LABEL_15;
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider _configureNearbyActionNoWakeScannerAndRequestScan:]( self,  "_configureNearbyActionNoWakeScannerAndRequestScan:",  v4));
  }

  v25 = (void *)v23;
  if (!v23) {
    goto LABEL_13;
  }
LABEL_15:

  return v25;
}

- (id)startAdvertisingToPeer:(id)a3 advertisement:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315907;
    v32 = v11;
    __int16 v33 = 2113;
    id v34 = v8;
    __int16 v35 = 2048;
    double v36 = a5;
    __int16 v37 = 2113;
    id v38 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] startAdvertisingToPeer: %{private}@. Timeout: %0.1f s. Advertisement: %{private}@",  buf,  0x2Au);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v8)
  {
    id v26 = "token";
    int v27 = 1067;
    goto LABEL_19;
  }

  if (!v9)
  {
    id v26 = "advertisement";
    int v27 = 1068;
LABEL_19:
    __assert_rtn( "-[NIServerFindingDiscoveryProvider startAdvertisingToPeer:advertisement:timeout:]",  "NIServerFindingDiscovery.mm",  v27,  v26);
  }

  if (LOBYTE(self->_consumer))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_FindingAdvertiser sharedInstance](&OBJC_CLASS____FindingAdvertiser, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 startAdvertisingAsFinder:LOBYTE(self->_identifier.__r_.var0) toPeer:v8 withAdvertisement:v9]);

    if (v13)
    {
      BOOL v14 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A594C((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
      }
      goto LABEL_16;
    }
  }

  else
  {
    v21 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#find-disc,BT not enabled. Skipping configuring advertiser.",  buf,  2u);
    }
  }

  if (a5 > 0.0) {
    -[NIServerFindingDiscoveryProvider _configureAdvertisementTimeout:forToken:]( self,  "_configureAdvertisementTimeout:forToken:",  v8,  a5);
  }
  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveryTimeoutTimers, "objectForKey:", v8));
  unsigned __int8 v23 = [v9 isEqual:v22];

  if ((v23 & 1) == 0)
  {
    v24 = *(dispatch_queue_s **)&self->_isFinder;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029C6A8;
    block[3] = &unk_1007B14B8;
    block[4] = self;
    id v29 = v9;
    id v30 = v8;
    dispatch_async(v24, block);
  }

  -[NSMutableDictionary setObject:forKey:](self->_discoveryTimeoutTimers, "setObject:forKey:", v9, v8);
  v13 = 0LL;
LABEL_16:

  return v13;
}

- (id)stopAdvertisingToPeer:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    int v24 = 136315395;
    v25 = v6;
    __int16 v26 = 2113;
    id v27 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] stopAdvertisingToPeer: %{private}@",  (uint8_t *)&v24,  0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4) {
    __assert_rtn( "-[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:]",  "NIServerFindingDiscovery.mm",  1105,  "token");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_FindingAdvertiser sharedInstance](&OBJC_CLASS____FindingAdvertiser, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stopAdvertisingAsFinder:LOBYTE(self->_identifier.__r_.var0) toPeer:v4]);

  if (v8)
  {
    id v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A59B0((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
    id v16 = v8;
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->_discoveryTimeoutSeconds objectForKey:v4]);
    BOOL v18 = v17 == 0LL;

    if (!v18)
    {
      uint64_t v19 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)&self->_discoveryTimeoutSeconds objectForKey:v4]);
      dispatch_source_cancel(v19);

      [*(id *)&self->_discoveryTimeoutSeconds removeObjectForKey:v4];
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_advertisingPeers, "objectForKey:", v4));
    BOOL v21 = v20 == 0LL;

    if (!v21)
    {
      int v22 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_advertisingPeers, "objectForKey:", v4));
      dispatch_source_cancel(v22);

      -[NSMutableDictionary removeObjectForKey:](self->_advertisingPeers, "removeObjectForKey:", v4);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_discoveryTimeoutTimers, "removeObjectForKey:", v4);
  }

  return v8;
}

- (NSSet)peersEligibleForDiscovery
{
  return (NSSet *)*(id *)&self->_activatedScanner;
}

- (NSDictionary)discoveredPeers
{
  return (NSDictionary *)self->_disableScanDupeConfigTimer;
}

- (NSDictionary)advertisingPeers
{
  return (NSDictionary *)self->_discoveryTimeoutTimers;
}

- (array<unsigned)advertisingAddress
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _cbAdvertisingAddress](self, "_cbAdvertisingAddress"));
  uint64_t v4 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:]( &OBJC_CLASS___NIServerFindingAdvertisement,  "convertCBAddressToRoseAddress:",  v3);

  return (array<unsigned char, 6UL>)v4;
}

- (id)processAdvertisement:(id)a3 receivedOOBFromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (qword_1007FE120 != -1) {
    dispatch_once(&qword_1007FE120, &stru_1007BBBB0);
  }
  int v8 = byte_1007FE128;
  id v9 = (os_log_s *)(id)qword_1008000A0;
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      int v14 = 136315651;
      uint64_t v15 = v11;
      __int16 v16 = 2113;
      id v17 = v7;
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] IGNORING processAdvertisementReceivedOOB (disabled in defaults). Peer: %{private}@. Adv: %{private}@",  (uint8_t *)&v14,  0x20u);
    }
  }

  else
  {
    if (v10)
    {
      uint64_t v12 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      int v14 = 136315651;
      uint64_t v15 = v12;
      __int16 v16 = 2113;
      id v17 = v7;
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] processAdvertisementReceivedOOB. Peer: %{private}@. Adv: %{private}@",  (uint8_t *)&v14,  0x20u);
    }

    -[NIServerFindingDiscoveryProvider _processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:]( self,  "_processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:",  v6,  v7,  0LL,  0LL);
  }

  return 0LL;
}

- (id)processLostEventReceivedOOBFromPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (qword_1007FE120 != -1) {
    dispatch_once(&qword_1007FE120, &stru_1007BBBB0);
  }
  int v5 = byte_1007FE128;
  id v6 = (os_log_s *)(id)qword_1008000A0;
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315395;
      __int16 v16 = v8;
      __int16 v17 = 2113;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] IGNORING processLostEventReceivedOOB (disabled in defaults). Peer: %{private}@",  buf,  0x16u);
    }
  }

  else
  {
    if (v7)
    {
      id v9 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315395;
      __int16 v16 = v9;
      __int16 v17 = 2113;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] processLostEventReceivedOOB. Peer: %{private}@",  buf,  0x16u);
    }

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_source objectForKey:](self->_disableScanDupeConfigTimer, "objectForKey:", v4));
    -[NIServerFindingDiscoveryProvider _resetDiscoveryStateForPeer:](self, "_resetDiscoveryStateForPeer:", v4);
    if (v10)
    {
      uint64_t v11 = *(dispatch_queue_s **)&self->_isFinder;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10029CDF8;
      v13[3] = &unk_1007A2248;
      v13[4] = self;
      id v14 = v4;
      dispatch_async(v11, v13);
    }
  }

  return 0LL;
}

- (id)printableState
{
  uint64_t v85 = 0LL;
  v86 = &v85;
  uint64_t v87 = 0x3032000000LL;
  v88 = sub_100298494;
  v89 = sub_1002984A4;
  v90 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)v86[5];
  id v4 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
  int consumer_high = HIDWORD(self->_consumer);
  if (consumer_high > 34)
  {
    if (consumer_high > 49)
    {
      if (consumer_high == 50)
      {
        id v6 = "High";
        goto LABEL_21;
      }

      if (consumer_high == 60)
      {
        id v6 = "Max";
        goto LABEL_21;
      }
    }

    else
    {
      if (consumer_high == 35)
      {
        id v6 = "MediumLow";
        goto LABEL_21;
      }

      if (consumer_high == 40)
      {
        id v6 = "Medium";
        goto LABEL_21;
      }
    }

- (void)_resetDiscoveryStateForPeer:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  -[OS_dispatch_source removeObjectForKey:](self->_disableScanDupeConfigTimer, "removeObjectForKey:", v6);
  -[NSMutableSet removeObjectForKey:](self->_eligibleDiscoveryPeers, "removeObjectForKey:", v6);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveredPeers, "objectForKey:", v6));

  if (v4)
  {
    int v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveredPeers, "objectForKey:", v6));
    dispatch_source_cancel(v5);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_discoveredPeers, "removeObjectForKey:", v6);
  if (!-[OS_dispatch_source count](self->_disableScanDupeConfigTimer, "count")
    && sub_100277758(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
  {
    -[NIServerFindingDiscoveryProvider _nearbyActionNoWakeDisableScanDupesIfNecessary]( self,  "_nearbyActionNoWakeDisableScanDupesIfNecessary");
  }
}

- (void)_resetDiscoveryStateForAllPeers
{
}

- (void)_resetAdvertisingStateForAllPeers
{
}

- (void)_processReceivedAdvertisement:(id)a3 fromPeer:(id)a4 overBluetooth:(BOOL)a5 cbDevice:(id)a6
{
  BOOL v7 = a5;
  id v34 = a3;
  id v10 = a4;
  id v33 = a6;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_source objectForKey:](self->_disableScanDupeConfigTimer, "objectForKey:", v10));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet objectForKey:](self->_eligibleDiscoveryPeers, "objectForKey:", v10));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  if (v11)
  {
    unsigned int v14 = [v34 isEqual:v11] ^ 1;
    if (v12) {
      goto LABEL_3;
    }
LABEL_13:
    BOOL v16 = 1;
    goto LABEL_14;
  }

  unsigned int v14 = 1;
  if (!v12) {
    goto LABEL_13;
  }
LABEL_3:
  [v13 timeIntervalSinceDate:v12];
  BOOL v16 = v15 >= 2.0;
  if (v15 >= 2.0) {
    int v17 = 1;
  }
  else {
    int v17 = v14;
  }
  if (v17 != 1)
  {
    id v18 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      uint64_t v20 = "OOB";
      *(_DWORD *)buf = 136315907;
      int v40 = v19;
      __int16 v41 = 2080;
      if (v7) {
        uint64_t v20 = "BT";
      }
      __int16 v42 = v20;
      __int16 v43 = 2113;
      id v44 = v10;
      __int16 v45 = 2113;
      *(void *)v46 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "#find-disc,[%s] Found device (%s) for token %{private}@, but ignoring. Device: %{private}@",  buf,  0x2Au);
    }

- (void)_cbDeviceFoundHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4) {
    __assert_rtn( "-[NIServerFindingDiscoveryProvider _cbDeviceFoundHandler:]",  "NIServerFindingDiscovery.mm",  1429,  "device");
  }
  if ((self->_addressObserver || *(void *)&self->_activatedAddressObserver)
    && LOBYTE(self->_nearbyActionNoWakeScanner))
  {
    uint64_t v5 = sub_100277758(LOBYTE(self->_identifier.__r_.var0) == 0);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider _getDiscoveryTokenFromCBDevice:advertisementType:]( self,  "_getDiscoveryTokenFromCBDevice:advertisementType:",  v4,  v5));
    if (v6)
    {
      BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider _getAdvertisementFromCBDevice:advertisementType:]( self,  "_getAdvertisementFromCBDevice:advertisementType:",  v4,  v5));
      if (v7)
      {
        -[NIServerFindingDiscoveryProvider _processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:]( self,  "_processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:",  v7,  v6,  1LL,  v4);
      }

      else
      {
        id v9 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
          sub_1003A5A6C((uint64_t)v10, (uint64_t)v4, (uint64_t)&v11, v9);
        }
      }
    }

    else
    {
      BOOL v7 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
        int v11 = 136315395;
        uint64_t v12 = v8;
        __int16 v13 = 2113;
        id v14 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "#find-disc,[%s] Found device (BT) but cannot resolve discovery token. Device: %{private}@",  (uint8_t *)&v11,  0x16u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A5A40();
  }
}

- (void)_cbAdvertisingAddressChangedHandler
{
  if (self->_controller && self->_activatedController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider _cbAdvertisingAddress](self, "_cbAdvertisingAddress"));
    uint64_t v4 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:]( &OBJC_CLASS___NIServerFindingAdvertisement,  "convertCBAddressToRoseAddress:",  v3);
    uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      uint64_t v7 = CUPrintNSDataAddress(v3);
      int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 136315395;
      unsigned __int8 v23 = v6;
      __int16 v24 = 2113;
      double v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] BT address changed: %{private}@",  buf,  0x16u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_discoveryTimeoutTimers, "allKeys"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10029E800;
    v19[3] = &unk_1007BBB70;
    void v19[4] = self;
    int v20 = v4;
    __int16 v21 = WORD2(v4);
    [v9 enumerateObjectsUsingBlock:v19];
    if (LOBYTE(self->_consumer))
    {
      discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10029E8B4;
      v18[3] = &unk_1007B4080;
      v18[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveryTimeoutTimers,  "enumerateKeysAndObjectsUsingBlock:",  v18);
    }

    else
    {
      int v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#find-disc,BT not enabled. Skipping updating advertiser on address change.",  buf,  2u);
      }
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    __int16 v13 = self->_discoveryTimeoutTimers;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10029E954;
    v15[3] = &unk_1007BBA50;
    id v16 = WeakRetained;
    int v17 = self;
    id v14 = WeakRetained;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v13, "enumerateKeysAndObjectsUsingBlock:", v15);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A5AB4();
  }

- (id)_cbAdvertisingAddress
{
  __int16 v12 = 0;
  int v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v11, 6LL));
  uint64_t v4 = v3;
  if (self->_controller && self->_activatedController)
  {
    int v5 = sub_100277758(LOBYTE(self->_identifier.__r_.var0));
    if (v5 == 19)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CBController advertisingAddressDataNonConnectable]( self->_controller,  "advertisingAddressDataNonConnectable"));
    }

    else
    {
      if (v5 != 26)
      {
        int v8 = 0LL;
        goto LABEL_12;
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CBController advertisingAddressDataConnectable]( self->_controller,  "advertisingAddressDataConnectable"));
    }

    int v8 = v6;
    if (v6 && (unint64_t)[v6 length] > 5)
    {
      id v9 = v8;
      int v8 = v9;
LABEL_13:
      id v7 = v9;

      goto LABEL_14;
    }

- (void)_cbBluetoothStateChangedHandler
{
  consumerQueue = self->_consumerQueue;
  if (consumerQueue && self->_enableBluetooth)
  {
    unint64_t v4 = (unint64_t)-[OS_dispatch_queue bluetoothState](consumerQueue, "bluetoothState");
    int v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      if (v4 > 0xA) {
        id v7 = "?";
      }
      else {
        id v7 = off_1007BBBD0[v4];
      }
      int v11 = 136315394;
      __int16 v12 = v6;
      __int16 v13 = 2080;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] BT state changed: %s",  (uint8_t *)&v11,  0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    id v9 = WeakRetained;
    switch(v4)
    {
      case 1uLL:
      case 4uLL:
        [WeakRetained bluetoothDiscoveryBecameUnavailable];
        break;
      case 2uLL:
      case 3uLL:
        id v10 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_1003A5B0C(v4, v10);
        }
        break;
      case 5uLL:
        [WeakRetained bluetoothDiscoveryBecameAvailable];
        break;
      default:
        break;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A5AE0();
  }

- (void)_cbInterruptionHandler
{
  if (self->_consumerQueue && self->_enableBluetooth)
  {
    v3 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      int v6 = 136315138;
      id v7 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-disc,[%s] BT interrupted",  (uint8_t *)&v6,  0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained bluetoothDiscoveryBecameUnavailable];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A5B94();
  }

- (void)_cbErrorHandler:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    sub_1003A5BC0((uint64_t)v6, (uint64_t)v4, (uint64_t)&v7, v5);
  }
}

- (id)_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = *(void **)&self->_activatedScanner;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10029EF08;
  v7[3] = &unk_1007B4198;
  int v5 = v3;
  int v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void)_nearbyActionNoWakeDisableScanDupesIfNecessary
{
  spatialInteractionScanner = self->_spatialInteractionScanner;
  if (spatialInteractionScanner)
  {
    dispatch_source_cancel((dispatch_source_t)spatialInteractionScanner);
    id v4 = self->_spatialInteractionScanner;
    self->_spatialInteractionScanner = 0LL;
  }

  int v5 = (CBSpatialInteractionSession *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)&self->_isFinder);
  int v6 = self->_spatialInteractionScanner;
  self->_spatialInteractionScanner = v5;

  uint64_t v7 = self->_spatialInteractionScanner;
  dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  id v9 = self->_spatialInteractionScanner;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10029F0EC;
  v10[3] = &unk_1007A1CA0;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
  dispatch_resume((dispatch_object_t)self->_spatialInteractionScanner);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_configureNearbyActionNoWakeScannerAndRequestScan:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  id v5 = [*(id *)&self->_activatedScanner count];
  addressObserver = self->_addressObserver;
  if (v5 && v3)
  {
    if (addressObserver)
    {
      if (LOBYTE(self->_nearbyActionNoWakeScanner))
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers]( self,  "_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers"));
        -[CBAdvertiser setOobKeys:](self->_addressObserver, "setOobKeys:", v7);

        if (((unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") & 0x200100000LL) == 0)
        {
          dispatch_time_t v8 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-disc,NearbyActionNoWake: enabling scan dupes",  (uint8_t *)&buf,  2u);
          }

          -[CBAdvertiser setDiscoveryFlags:]( self->_addressObserver,  "setDiscoveryFlags:",  (unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") | 0x200100000LL);
        }

        if (!-[OS_dispatch_source count](self->_disableScanDupeConfigTimer, "count")) {
          -[NIServerFindingDiscoveryProvider _nearbyActionNoWakeDisableScanDupesIfNecessary]( self,  "_nearbyActionNoWakeDisableScanDupesIfNecessary");
        }
      }

      else
      {
        int v20 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#find-disc,NearbyActionNoWake: scanner still activating",  (uint8_t *)&buf,  2u);
        }
      }
    }

    else
    {
      __int16 v12 = objc_opt_new(&OBJC_CLASS___CBDiscovery);
      __int16 v13 = self->_addressObserver;
      self->_addressObserver = v12;

      -[CBAdvertiser setDispatchQueue:](self->_addressObserver, "setDispatchQueue:", *(void *)&self->_isFinder);
      id v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"nearbyd%s",  sub_100277A54(LOBYTE(self->_identifier.__r_.var0)));
      double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[CBAdvertiser setLabel:](self->_addressObserver, "setLabel:", v15);

      -[CBAdvertiser setUseCase:](self->_addressObserver, "setUseCase:", 458753LL);
      objc_initWeak(&buf, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10029F614;
      v25[3] = &unk_1007A1C78;
      objc_copyWeak(&v26, &buf);
      -[CBAdvertiser setDeviceFoundHandler:](self->_addressObserver, "setDeviceFoundHandler:", v25);
      -[CBAdvertiser setBleScanRate:](self->_addressObserver, "setBleScanRate:", HIDWORD(self->_consumer));
      -[CBAdvertiser setBleRSSIThresholdHint:](self->_addressObserver, "setBleRSSIThresholdHint:", 4294967176LL);
      -[CBAdvertiser setDiscoveryFlags:]( self->_addressObserver,  "setDiscoveryFlags:",  (unint64_t)-[CBAdvertiser discoveryFlags](self->_addressObserver, "discoveryFlags") | 0x80242100000LL);
      -[CBAdvertiser addDiscoveryType:](self->_addressObserver, "addDiscoveryType:", 16LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers]( self,  "_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers"));
      -[CBAdvertiser setOobKeys:](self->_addressObserver, "setOobKeys:", v16);

      LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
      int v17 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v24 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#find-disc,NearbyActionNoWake: activating scanner (enabling scan dupes)",  v24,  2u);
      }

      double v18 = sub_100023CC4();
      id v19 = self->_addressObserver;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10029F674;
      v22[3] = &unk_1007B13F0;
      v23[1] = *(id *)&v18;
      objc_copyWeak(v23, &buf);
      -[CBAdvertiser activateWithCompletion:](v19, "activateWithCompletion:", v22);
      objc_destroyWeak(v23);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&buf);
    }
  }

  else
  {
    if (addressObserver)
    {
      -[CBAdvertiser invalidate](addressObserver, "invalidate");
      id v9 = self->_addressObserver;
      self->_addressObserver = 0LL;

      LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
    }

    id v10 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [*(id *)&self->_activatedScanner count];
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v11;
      __int16 v28 = 1024;
      BOOL v29 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#find-disc,NearbyActionNoWake: not configuring scanner. Eligible discovery peers: %d. Request scan: %d.",  (uint8_t *)&buf,  0xEu);
    }
  }

  return 0LL;
}

- (id)_configureSpatialInteractionScannerAndRequestScan:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  id v5 = *(void **)&self->_activatedAddressObserver;
  if (v5)
  {
    [v5 invalidate];
    int v6 = *(void **)&self->_activatedAddressObserver;
    *(void *)&self->_activatedAddressObserver = 0LL;

    advertisingTimeoutTimers = self->_advertisingTimeoutTimers;
    self->_advertisingTimeoutTimers = 0LL;

    LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
  }

  if ([*(id *)&self->_activatedScanner count] && v3)
  {
    dispatch_time_t v8 = objc_opt_new(&OBJC_CLASS___CBSpatialInteractionSession);
    id v9 = *(void **)&self->_activatedAddressObserver;
    *(void *)&self->_activatedAddressObserver = v8;

    [*(id *)&self->_activatedAddressObserver setDispatchQueue:*(void *)&self->_isFinder];
    id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"nearbyd%s",  sub_100277A54(LOBYTE(self->_identifier.__r_.var0)));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [*(id *)&self->_activatedAddressObserver setLabel:v11];

    [*(id *)&self->_activatedAddressObserver setControlFlags:12296];
    [*(id *)&self->_activatedAddressObserver setScanRate:HIDWORD(self->_consumer)];
    [*(id *)&self->_activatedAddressObserver setBleRSSIThresholdOrder:132];
    [*(id *)&self->_activatedAddressObserver setBleRSSIThresholdHint:4294967176];
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10029FB7C;
    v21[3] = &unk_1007A1C78;
    objc_copyWeak(&v22, &location);
    [*(id *)&self->_activatedAddressObserver setDeviceFoundHandler:v21];
    LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
    __int16 v12 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-disc,SpatialInteraction: activating scanner",  buf,  2u);
    }

    double v13 = sub_100023CC4();
    id v14 = *(void **)&self->_activatedAddressObserver;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10029FBDC;
    v18[3] = &unk_1007B13F0;
    v19[1] = *(id *)&v13;
    objc_copyWeak(v19, &location);
    [v14 activateWithCompletion:v18];
    objc_destroyWeak(v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  else
  {
    double v15 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [*(id *)&self->_activatedScanner count];
      LODWORD(location) = 67109376;
      HIDWORD(location) = v16;
      __int16 v24 = 1024;
      BOOL v25 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#find-disc,SpatialInteraction: not configuring scanner. Eligible discovery peers: %d. Request scan: %d.",  (uint8_t *)&location,  0xEu);
    }
  }

  return 0LL;
}

- (void)_updateLaunchOnDemandScannerAndRequestScan:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (BYTE1(self->_consumer) && sub_100277758(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
  {
    uint64_t v16 = 0LL;
    int v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    id v19 = sub_100298494;
    int v20 = sub_1002984A4;
    id v21 = xpc_array_create(0LL, 0LL);
    if (v3)
    {
      id v5 = *(void **)&self->_activatedScanner;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1002A0300;
      v15[3] = &unk_1007B2BD8;
      void v15[4] = &v16;
      [v5 enumerateObjectsUsingBlock:v15];
    }

    xpc_object_t v6 = xpc_array_create(0LL, 0LL);
    xpc_object_t v7 = xpc_array_create(0LL, 0LL);
    if ([*(id *)&self->_activatedScanner count] && v3)
    {
      xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "ScreenOff");
      xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "BLEAdvertisementData");
      xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, "PrecisionFinding");
    }

    dispatch_time_t v8 = (void *)xpc_copy_event("com.apple.bluetooth.discovery", "PrecisionFindingDiscovery");
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
    {
      id v9 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = CUPrintXPC(v8);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)id buf = 138739971;
        unsigned __int8 v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#find-disc,Configuring launch on demand. XPC event before update: %{sensitive}@",  buf,  0xCu);
      }
    }

    xpc_dictionary_set_value(v8, "oobKeys", (xpc_object_t)v17[5]);
    xpc_dictionary_set_value(v8, "discoveryFlags", v6);
    xpc_dictionary_set_value(v8, "discoveryTypes", v7);
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
    {
      __int16 v12 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = CUPrintXPC(v8);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)id buf = 138739971;
        unsigned __int8 v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-disc,XPC event after update: %{sensitive}@",  buf,  0xCu);
      }
    }

    xpc_set_event("com.apple.bluetooth.discovery", "PrecisionFindingDiscovery", v8);

    _Block_object_dispose(&v16, 8);
  }

- (void)_configureAdvertisementOOBRefreshTimerForToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_identifier.__r_.var0))
  {
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)&self->_discoveryTimeoutSeconds objectForKey:v4]);
    xpc_object_t v6 = v5;
    if (v5)
    {
      dispatch_source_cancel(v5);
      [*(id *)&self->_discoveryTimeoutSeconds removeObjectForKey:v4];
    }

    xpc_object_t v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)&self->_isFinder);

    dispatch_time_t v8 = dispatch_time(0LL, (unint64_t)(*(double *)&self->_advertisingOOBRefreshTimers * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002A05FC;
    handler[3] = &unk_1007A2060;
    objc_copyWeak(&v12, &location);
    id v9 = v4;
    id v11 = v9;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);
    [*(id *)&self->_discoveryTimeoutSeconds setObject:v7 forKey:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_configureAdvertisementTimeout:(double)a3 forToken:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (a3 <= 0.0) {
    __assert_rtn( "-[NIServerFindingDiscoveryProvider _configureAdvertisementTimeout:forToken:]",  "NIServerFindingDiscovery.mm",  1941,  "timeoutSeconds > 0.0");
  }
  xpc_object_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_advertisingPeers, "objectForKey:", v6));
  dispatch_time_t v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_advertisingPeers, "removeObjectForKey:", v6);
  }

  id v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)&self->_isFinder);

  dispatch_time_t v10 = dispatch_time(0LL, (unint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1002A0894;
  handler[3] = &unk_1007A2060;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(v9);
  -[NSMutableDictionary setObject:forKey:](self->_advertisingPeers, "setObject:forKey:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_configureDiscoveryTimeout:(double)a3 forToken:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  xpc_object_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_discoveredPeers, "objectForKey:", v6));
  dispatch_time_t v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_discoveredPeers, "removeObjectForKey:", v6);
  }

  id v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)&self->_isFinder);

  dispatch_time_t v10 = dispatch_time(0LL, (unint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1002A0AF4;
  handler[3] = &unk_1007A2060;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(v9);
  -[NSMutableDictionary setObject:forKey:](self->_discoveredPeers, "setObject:forKey:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)_getDiscoveryTokenFromCBDevice:(id)a3 advertisementType:(int)a4
{
  id v6 = a3;
  xpc_object_t v7 = v6;
  if (!v6) {
    __assert_rtn( "-[NIServerFindingDiscoveryProvider _getDiscoveryTokenFromCBDevice:advertisementType:]",  "NIServerFindingDiscovery.mm",  2023,  "device");
  }
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 btAddressData]);

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A5D28();
    }
    goto LABEL_9;
  }

  if (a4 == 26)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 nearbyActionNoWakeAuthTagData]);

    if (v13)
    {
      uint64_t v18 = 0LL;
      id v19 = &v18;
      uint64_t v20 = 0x3032000000LL;
      id v21 = sub_100298494;
      id v22 = sub_1002984A4;
      id v23 = 0LL;
      id v14 = *(void **)&self->_activatedScanner;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1002A0DF8;
      v15[3] = &unk_1007B3FB8;
      id v16 = v7;
      int v17 = &v18;
      [v14 enumerateObjectsUsingBlock:v15];
      self = (NIServerFindingDiscoveryProvider *)(id)v19[5];

      _Block_object_dispose(&v18, 8);
      goto LABEL_10;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A5D80();
    }
    goto LABEL_9;
  }

  if (a4 == 19)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 spatialInteractionTokenData]);

    if (v9)
    {
      dispatch_time_t v10 = objc_alloc(&OBJC_CLASS___NIDiscoveryToken);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 spatialInteractionTokenData]);
      self = -[NIDiscoveryToken initWithBytes:](v10, "initWithBytes:", v11);

      goto LABEL_10;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A5D54();
    }
LABEL_9:
    self = 0LL;
  }

- (id)_getAdvertisementFromCBDevice:(id)a3 advertisementType:(int)a4
{
  id v6 = a3;
  xpc_object_t v7 = v6;
  if (!v6) {
    __assert_rtn( "-[NIServerFindingDiscoveryProvider _getAdvertisementFromCBDevice:advertisementType:]",  "NIServerFindingDiscovery.mm",  2065,  "device");
  }
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 btAddressData]);
  uint64_t v9 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:]( &OBJC_CLASS___NIServerFindingAdvertisement,  "convertCBAddressToRoseAddress:",  v8);
  int v23 = v9;
  __int16 v24 = WORD2(v9);

  if (a4 == 19)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 spatialInteractionUWBConfigData]);
    id v15 = [v14 length];

    if ((unint64_t)v15 > 4)
    {
      id v16 = objc_alloc(&OBJC_CLASS___NIServerSpatialInteractionPayload);
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 spatialInteractionUWBConfigData]);
      id v12 = -[NIServerSpatialInteractionPayload initWithUWBConfigData:](v16, "initWithUWBConfigData:", v17);

      if (-[NIServerSpatialInteractionPayload findingEnabled](v12, "findingEnabled"))
      {
        unsigned __int16 v18 = -[NIServerSpatialInteractionPayload findingConfig](v12, "findingConfig");
        unsigned __int16 v19 = -[NIServerSpatialInteractionPayload findingConfig2](v12, "findingConfig2");
        uint64_t v20 = operator new(2uLL);
        *uint64_t v20 = v18 | (v19 << 8);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v20, 2LL));
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingAdvertisement advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:]( &OBJC_CLASS___NIServerFindingAdvertisement,  "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:",  LOBYTE(self->_identifier.__r_.var0) == 0,  &v23,  -[NIServerSpatialInteractionPayload findingStatus](v12, "findingStatus"),  v21,  0LL));

        operator delete(v20);
        goto LABEL_5;
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A5DD8();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003A5DAC();
    }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((void *)self + 3) = 0LL;
  return self;
}

@end