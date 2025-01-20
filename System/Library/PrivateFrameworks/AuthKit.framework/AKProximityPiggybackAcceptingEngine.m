@interface AKProximityPiggybackAcceptingEngine
- (BOOL)isActivated;
- (id)matchHandler;
- (void)_discoveredPeripheral:(id)a3 withServiceID:(id)a4;
- (void)activate;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)invalidate;
- (void)prepareWithController:(id)a3 queue:(id)a4;
- (void)setMatchHandler:(id)a3;
@end

@implementation AKProximityPiggybackAcceptingEngine

- (void)prepareWithController:(id)a3 queue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackAcceptingEngine;
  -[AKProximityPiggybackEngine prepareWithController:queue:](&v9, "prepareWithController:queue:", a3, a4);
  v5 = objc_alloc(&OBJC_CLASS___CBCentralManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine queue](self, "queue"));
  v7 = -[CBCentralManager initWithDelegate:queue:options:](v5, "initWithDelegate:queue:options:", self, v6, 0LL);
  centralManager = self->_centralManager;
  self->_centralManager = v7;
}

- (void)activate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine presenceSID](self, "presenceSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithNSUUID:](&OBJC_CLASS___CBUUID, "UUIDWithNSUUID:", v3));

  centralManager = self->_centralManager;
  v11 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v9[0] = CBManagerIsPrivilegedDaemonKey;
  v9[1] = CBCentralManagerScanOptionAllowDuplicatesKey;
  v9[2] = CBCentralManagerScanOptionActive;
  v9[3] = CBCentralManagerScanOptionScanWindow;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanFalse;
  v10[2] = &__kCFBooleanFalse;
  v10[3] = &off_1001D8D70;
  v9[4] = CBCentralManagerScanOptionScanInterval;
  v10[4] = &off_1001D8D88;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  5LL));
  -[CBCentralManager scanForPeripheralsWithServices:options:]( centralManager,  "scanForPeripheralsWithServices:options:",  v6,  v7);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackAcceptingEngine;
  -[AKProximityPiggybackEngine activate](&v8, "activate");
}

- (void)invalidate
{
  centralManager = self->_centralManager;
  if (centralManager)
  {
    -[CBCentralManager stopScan](centralManager, "stopScan");
    v4 = self->_centralManager;
    self->_centralManager = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackAcceptingEngine;
  -[AKProximityPiggybackEngine invalidate](&v5, "invalidate");
}

- (BOOL)isActivated
{
  return self->_centralManager != 0LL;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine controller](self, "controller"));
  [v5 proximityEngine:self managerDidUpdateState:v4];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _AKLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v38 = self;
    __int16 v39 = 2112;
    id v40 = v10;
    __int16 v41 = 2112;
    id v42 = v11;
    __int16 v43 = 2112;
    id v44 = v12;
    __int16 v45 = 2112;
    id v46 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%@: Central manager (%@) discovered peripheral (%@) with advertisement data (%@) and RSSI (%@)",  buf,  0x34u);
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
  id v18 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:CBAdvertisementDataServiceUUIDsKey]);
  v30 = v13;
  v31 = v10;
  if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0) {
    id v19 = v18;
  }
  else {
    id v19 = 0LL;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v20 = v19;
  id v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v21)
  {
    id v23 = v21;
    uint64_t v24 = *(void *)v33;
    do
    {
      v25 = 0LL;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v25);
        uint64_t v27 = objc_opt_class(&OBJC_CLASS___CBUUID, v22);
        id v28 = v26;
        if ((objc_opt_isKindOfClass(v28, v27) & 1) != 0) {
          id v29 = v28;
        }
        else {
          id v29 = 0LL;
        }

        -[AKProximityPiggybackAcceptingEngine _discoveredPeripheral:withServiceID:]( self,  "_discoveredPeripheral:withServiceID:",  v11,  v29,  v30,  v31,  (void)v32);
        v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v23);
  }
}

- (void)_discoveredPeripheral:(id)a3 withServiceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine presenceSID](self, "presenceSID"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    id v11 = [v9 isEqual:v10];
    int v12 = (int)v11;
    uint64_t v13 = _AKLogSystem(v11);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void (**)(void))v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine presenceSID](self, "presenceSID"));
        int v19 = 138413314;
        id v20 = self;
        __int16 v21 = 2112;
        id v22 = v6;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040LL;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "%@: Discovered peripheral (%@) with matching presenceSID (%{mask.hash}@) and serviceID (%@)",  (uint8_t *)&v19,  0x34u);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackAcceptingEngine matchHandler](self, "matchHandler"));
      if (!v17) {
        goto LABEL_12;
      }
      v15 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackAcceptingEngine matchHandler](self, "matchHandler"));
      v15[2]();
    }

    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138412802;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEBUG,  "%@: Discovered peripheral (%@) with non-matching serviceID (%@)",  (uint8_t *)&v19,  0x20u);
    }

LABEL_12:
    goto LABEL_13;
  }

  uint64_t v18 = _AKLogSystem(0LL);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
    sub_100136FD0((uint64_t)self, (uint64_t)v6, (os_log_t)v9);
  }
LABEL_13:
}

- (id)matchHandler
{
  return self->_matchHandler;
}

- (void)setMatchHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end