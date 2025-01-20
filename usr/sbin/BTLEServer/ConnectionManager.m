@interface ConnectionManager
+ (id)instance;
- (BOOL)allowInRestrictedMode:(id)a3;
- (BOOL)authInProgress;
- (BOOL)isAlwaysConnecting:(id)a3;
- (BOOL)requireServicesAndMFi:(id)a3;
- (CBCentralManager)centralManager;
- (CBL2CAPChannel)mfiAuthChannel;
- (CBL2CAPChannel)peerChannel;
- (CBPeripheral)mfiPeripheral;
- (ConnectionManager)init;
- (NSArray)peripherals;
- (NSMutableArray)L2CAPChannels;
- (NSMutableArray)services;
- (NSMutableDictionary)clientServiceManagerMap;
- (NSMutableDictionary)connectAlwaysIdentifiersMap;
- (NSMutableDictionary)connectOnceIdentifiersMap;
- (NSMutableSet)connectOnceNoTimeoutIdentifiers;
- (NSMutableSet)denylistedIdentifiers;
- (NSMutableSet)mfiAuthPendingPeripherals;
- (NSString)connectionUUID;
- (NSString)endpointUUID;
- (OS_os_transaction)connectionAssertion;
- (OS_voucher)mfiVoucher;
- (id)centralManagerStateString;
- (id)peripheralForIdentifier:(id)a3;
- (void)analyzeConnectionError:(id)a3 peripheral:(id)a4 info:(id)a5;
- (void)authDidFail:(id)a3;
- (void)authDidSucceed:(id)a3;
- (void)cancelPeripheralConnectionForConnectOnceIdentifier:(id)a3;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 timestamp:(double)a5 isReconnecting:(BOOL)a6 error:(id)a7;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connectAlways:(id)a3;
- (void)connectOnce:(id)a3;
- (void)connectOnce:(id)a3 connectionTimeoutEnabled:(BOOL)a4;
- (void)connectPeripheral:(id)a3;
- (void)connectionTimeout:(id)a3;
- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4;
- (void)peerDidIdleTimeout:(id)a3;
- (void)peerIsUsingBuiltinService:(id)a3;
- (void)performMFiAuth:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralPairingDidFail:(id)a3;
- (void)refreshConnectionAssertion;
- (void)refreshPeripherals;
- (void)setAuthInProgress:(BOOL)a3;
- (void)setCentralManager:(id)a3;
- (void)setClientServiceManagerMap:(id)a3;
- (void)setConnectAlwaysIdentifiersMap:(id)a3;
- (void)setConnectOnceIdentifiersMap:(id)a3;
- (void)setConnectOnceNoTimeoutIdentifiers:(id)a3;
- (void)setConnectionAssertion:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setDenylistedIdentifiers:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setL2CAPChannels:(id)a3;
- (void)setMfiAuthChannel:(id)a3;
- (void)setMfiAuthPendingPeripherals:(id)a3;
- (void)setMfiPeripheral:(id)a3;
- (void)setMfiVoucher:(id)a3;
- (void)setPeerChannel:(id)a3;
- (void)setPeripherals:(id)a3;
- (void)setServices:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5;
- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7;
- (void)transportClientServerDisconnected:(id)a3;
@end

@implementation ConnectionManager

+ (id)instance
{
  if (qword_100070C68 != -1) {
    dispatch_once(&qword_100070C68, &stru_10005D1C8);
  }
  return (id)qword_100070C60;
}

- (void)connectOnce:(id)a3
{
}

- (void)connectOnce:(id)a3 connectionTimeoutEnabled:(BOOL)a4
{
  id v9 = a3;
  if (a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "connectionTimeout:",  v9,  0LL,  5.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
    [v7 setObject:v6 forKeyedSubscript:v9];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
    [v6 addObject:v9];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  [v8 removeObject:v9];

  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
}

- (void)connectAlways:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  unsigned __int8 v7 = [v6 isEqualToArray:v4];

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v17 = v4;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
          v16 = (PeripheralConnectionInfo *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

          if (!v16) {
            v16 = objc_alloc_init(&OBJC_CLASS___PeripheralConnectionInfo);
          }
          [v8 setObject:v16 forKeyedSubscript:v14];

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }

    -[ConnectionManager setConnectAlwaysIdentifiersMap:](self, "setConnectAlwaysIdentifiersMap:", v8);
    -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
    -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");

    id v4 = v17;
  }
}

- (BOOL)isAlwaysConnecting:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  LOBYTE(v4) = v7 != 0LL;

  return (char)v4;
}

- (id)peripheralForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)cancelPeripheralConnectionForConnectOnceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  [v5 removeObject:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  [v6 removeObjectForKey:v4];

  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
}

- (void)performMFiAuth:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Perform MFIAuth for %@", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  id v7 = [v6 state];

  if (v7 == (id)5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    id v40 = v4;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 retrievePeripheralsWithIdentifiers:v9]);

    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    if ([v11 hasTag:@"needsMFiAuthentication4.0"])
    {
      -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", v11);
      uint64_t v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      __int128 v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      -[NSMutableDictionary connectPeripheral:options:](v12, "connectPeripheral:options:", v13, 0LL);
    }

    else
    {
      v33 = v10;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", @"0xFE13"));
      v39 = v19;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 retrieveConnectedPeripheralsWithServices:v20]);

      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      uint64_t v12 = v21;
      id v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v35;
        while (2)
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(v12);
            }
            v26 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
            unsigned int v28 = [v27 isEqual:v4];

            if (v28)
            {
              -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", v26);
              v30 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
              -[NSMutableArray connectPeripheral:options:](v30, "connectPeripheral:options:", v32, 0LL);
              __int128 v13 = v12;
              goto LABEL_21;
            }
          }

          id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
          if (v23) {
            continue;
          }
          break;
        }
      }

      -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0LL);
      v29 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Register for connection event for this Fitness machine service",  buf,  2u);
      }

      __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"0000FE13-0000-1000-8000-00805F9B34FB"));
      -[NSMutableArray addObject:](v30, "addObject:", v31);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v30,  CBConnectionEventMatchingOptionServiceUUIDs);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      [v32 registerForConnectionEventsWithOptions:v13];
LABEL_21:
      id v10 = v33;
    }
  }

  else
  {
    __int128 v14 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v15 = v14;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      unsigned int v17 = [v16 state];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v42 = v17;
      *(_WORD *)&v42[4] = 2112;
      *(void *)&v42[6] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Manager state is %d, deferring MFI Auth for %@",  buf,  0x12u);
    }

    -[NSMutableSet addObject:](self->_mfiAuthPendingPeripherals, "addObject:", v4);
  }
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v11 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    int v17 = 138412546;
    __int128 v18 = v12;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ connection event:%tu",  (uint8_t *)&v17,  0x16u);
  }

  if (a4 == 1)
  {
    -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", v9);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    [v13 connectPeripheral:v14 options:0];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    [v15 registerForConnectionEventsWithOptions:0];
  }

  else
  {
    __int128 v16 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003A96C(v16, v9);
    }
    -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0LL);
  }
}

- (ConnectionManager)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ConnectionManager;
  v2 = -[ConnectionManager init](&v31, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___CBCentralManager);
    v32[0] = CBCentralManagerOptionReceiveSystemEvents;
    v32[1] = CBManagerNeedsRestrictedStateOperation;
    v33[0] = &__kCFBooleanTrue;
    v33[1] = &__kCFBooleanTrue;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
    v5 = -[CBCentralManager initWithDelegate:queue:options:]( v3,  "initWithDelegate:queue:options:",  v2,  &_dispatch_main_q,  v4);
    centralManager = v2->_centralManager;
    v2->_centralManager = v5;

    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connectOnceIdentifiersMap = v2->_connectOnceIdentifiersMap;
    v2->_connectOnceIdentifiersMap = v7;

    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    connectOnceNoTimeoutIdentifiers = v2->_connectOnceNoTimeoutIdentifiers;
    v2->_connectOnceNoTimeoutIdentifiers = v9;

    connectAlwaysIdentifiersMap = v2->_connectAlwaysIdentifiersMap;
    v2->_connectAlwaysIdentifiersMap = 0LL;

    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    denylistedIdentifiers = v2->_denylistedIdentifiers;
    v2->_denylistedIdentifiers = v12;

    connectionAssertion = v2->_connectionAssertion;
    v2->_connectionAssertion = 0LL;

    peripherals = v2->_peripherals;
    v2->_peripherals = 0LL;

    __int128 v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    L2CAPChannels = v2->_L2CAPChannels;
    v2->_L2CAPChannels = v16;

    mfiPeripheral = v2->_mfiPeripheral;
    v2->_mfiPeripheral = 0LL;

    peerChannel = v2->_peerChannel;
    v2->_peerChannel = 0LL;

    mfiAuthChannel = v2->_mfiAuthChannel;
    v2->_mfiAuthChannel = 0LL;

    v2->_authInProgress = 0;
    __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clientServiceManagerMap = v2->_clientServiceManagerMap;
    v2->_clientServiceManagerMap = v21;

    id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    mfiAuthPendingPeripherals = v2->_mfiAuthPendingPeripherals;
    v2->_mfiAuthPendingPeripherals = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v25 addObserver:v2 selector:"peripheralPairingDidFail:" name:@"PeripheralPairingDidFailNotification" object:0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v26 addObserver:v2 selector:"authDidSucceed:" name:@"AuthenticationServiceAuthDidSucceedNotification" object:0];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:v2 selector:"authDidFail:" name:@"AuthenticationServiceAuthDidFailNotification" object:0];

    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v2 selector:"peerIsUsingBuiltinService:" name:@"PeerIsUsingBuiltinServiceNotification" object:0];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v2 selector:"peerDidIdleTimeout:" name:@"PeerDidIdleTimeoutNotification" object:0];
  }

  return v2;
}

- (BOOL)allowInRestrictedMode:(id)a3
{
  id v3 = a3;
  if (([v3 hasTag:@"A1603"] & 1) != 0
    || ([v3 hasTag:@"A2051"] & 1) != 0
    || ([v3 hasTag:@"A3085"] & 1) != 0
    || ([v3 hasTag:@"A2538"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 hasTag:@"FastConnection"];
  }

  return v4;
}

- (BOOL)requireServicesAndMFi:(id)a3
{
  return [a3 hasTag:@"A2538"];
}

- (void)refreshPeripherals
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if ([v3 state] == (id)5)
  {
  }

  else
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    id v5 = [v4 state];

    if (v5 != (id)10) {
      return;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  [v6 addObjectsFromArray:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
  [v6 addObjectsFromArray:v10];

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  [v6 addObjectsFromArray:v12];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  __int128 v36 = v6;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 retrievePeripheralsWithIdentifiers:v14]);

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals"));
  id v17 = [v16 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
      }

      id v18 = [v16 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }

    while (v18);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v22 = v15;
  id v23 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      v26 = 0LL;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v26);
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
        id v29 = [v28 state];

        if (v29 != (id)10) {
          goto LABEL_22;
        }
        unsigned int v30 = -[ConnectionManager allowInRestrictedMode:](self, "allowInRestrictedMode:", v27);
        objc_super v31 = (os_log_s *)qword_100070CC8;
        BOOL v32 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT);
        if (v30)
        {
          if (v32)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Bluetooth is restricted. Allowing connection to Apple Pencil.",  buf,  2u);
          }

- (void)connectPeripheral:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if ([v5 state] == (id)5)
  {
    id v6 = [v4 state];

    if (v6) {
      goto LABEL_22;
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    if ([v7 state] != (id)10)
    {

LABEL_21:
      goto LABEL_22;
    }

    id v8 = [v4 state];

    if (v8) {
      goto LABEL_22;
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned __int8 v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);

    if (v17) {
      [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:CBConnectPeripheralOptionEnableAutoReconnect];
    }
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    id v19 = [v18 state];

    if (v19 == (id)10)
    {
      unsigned int v20 = -[ConnectionManager allowInRestrictedMode:](self, "allowInRestrictedMode:", v4);
      uint64_t v21 = (void *)qword_100070CC8;
      BOOL v22 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (!v22) {
          goto LABEL_21;
        }
        v27 = v21;
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        *(_DWORD *)id v29 = 138412290;
        *(void *)&v29[4] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Ignoring connection to %@ since bluetooth state is restricted",  v29,  0xCu);

        goto LABEL_20;
      }

      if (v22)
      {
        id v23 = v21;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        *(_DWORD *)id v29 = 138412546;
        *(void *)&v29[4] = v24;
        *(_WORD *)&v29[12] = 2112;
        *(void *)&v29[14] = v5;
        uint64_t v25 = "Allowing connection to Apple Pencil %@ options %@...";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, v29, 0x16u);
      }
    }

    else
    {
      v26 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v26;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        *(_DWORD *)id v29 = 138412546;
        *(void *)&v29[4] = v24;
        *(_WORD *)&v29[12] = 2112;
        *(void *)&v29[14] = v5;
        uint64_t v25 = "Connecting peripheral %@ options %@...";
        goto LABEL_18;
      }
    }

    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager", *(_OWORD *)v29, *(void *)&v29[16]));
    -[os_log_s connectPeripheral:options:](v27, "connectPeripheral:options:", v4, v5);
LABEL_20:

    goto LABEL_21;
  }

  uint64_t v12 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v13 = v12;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)id v29 = 138412290;
    *(void *)&v29[4] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Not connecting peripheral %@ as it is denylisted",  v29,  0xCu);
  }

- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if ([v7 state] == (id)5)
  {
    id v8 = [v6 state];

    if (!v8) {
      goto LABEL_12;
    }
LABEL_6:
    unsigned __int8 v11 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      int v21 = 138412290;
      BOOL v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Disconnecting peripheral %@...",  (uint8_t *)&v21,  0xCu);
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
    [v14 cancelPeripheralConnection:v6 force:v4];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    [v15 removeObjectForKey:v6];

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    [v16 removeObject:v17];

    if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v6))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));

      if (v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
        [v19 destroyConnectionWithUUID:v20];
      }
    }

    goto LABEL_12;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if ([v9 state] != (id)10)
  {

    goto LABEL_12;
  }

  id v10 = [v6 state];

  if (v10) {
    goto LABEL_6;
  }
LABEL_12:
}

- (void)refreshConnectionAssertion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  if ([v3 state] == (id)4)
  {

LABEL_3:
    -[ConnectionManager setConnectionAssertion:](self, "setConnectionAssertion:", 0LL);
    return;
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  if ([v4 count]) {
    goto LABEL_7;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  if ([v5 count])
  {

LABEL_7:
    goto LABEL_8;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  id v11 = [v10 count];

  if (!v11) {
    goto LABEL_3;
  }
LABEL_8:
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionAssertion](self, "connectionAssertion"));

  if (!v6)
  {
    id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@",  objc_opt_class(self, v7));
    id v12 = objc_claimAutoreleasedReturnValue(v8);
    id v9 = (void *)os_transaction_create([v12 UTF8String]);
    -[ConnectionManager setConnectionAssertion:](self, "setConnectionAssertion:", v9);
  }

- (void)connectionTimeout:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);

  if (v7 == v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripheralForIdentifier:](self, "peripheralForIdentifier:", v5));
    id v9 = v8;
    if (v8 && [v8 state] == (id)1)
    {
      id v10 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003A9F8(v10, v9);
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      [v11 removeObjectForKey:v5];

      -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
      -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
    }
  }
}

- (void)analyzeConnectionError:(id)a3 peripheral:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (NSString *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if (v11 == CBErrorDomain && [v8 code] == (id)6)
  {

    goto LABEL_7;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  __int128 v13 = v12;
  if (v12 == (void *)CBInternalErrorDomain)
  {
    id v14 = [v8 code];

    if (v14 == (id)31)
    {
LABEL_7:
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 date]);
      [v15 timeIntervalSinceDate:v16];
      double v18 = v17;

      if (v18 < 10.0) {
        goto LABEL_20;
      }
    }
  }

  else
  {
  }

  if ([v10 tryCount])
  {
    id v19 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = v19;
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      int v31 = 138412546;
      BOOL v32 = v21;
      __int16 v33 = 2048;
      id v34 = [v10 tryCount];
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ did not use any built-in service, strike #%lu",  (uint8_t *)&v31,  0x16u);
    }

    unsigned __int8 v22 = [v9 hasTag:@"DoNotStopAutoConnecting"];
    if ((unint64_t)[v10 tryCount] >= 5 && (v22 & 1) == 0)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v23 postNotificationName:@"PeerIsNotUsingBuiltinServiceNotification" object:v9];
    }
  }

  id v24 = (NSString *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if (v24 != CBErrorDomain) {
    goto LABEL_19;
  }
  id v25 = [v8 code];

  if (v25 == (id)14)
  {
    v26 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      int v31 = 138412290;
      BOOL v32 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ removed pairing info, stop always connect",  (uint8_t *)&v31,  0xCu);
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 postNotificationName:@"PeerIsNotUsingBuiltinServiceNotification" object:v9];

    id v24 = (NSString *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    -[NSString removeObjectForKey:](v24, "removeObjectForKey:", v30);

LABEL_19:
  }

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManagerStateString](self, "centralManagerStateString"));
    *(_DWORD *)buf = 138412290;
    v68 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CentralManager state is now %@", buf, 0xCu);
  }

  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  id v9 = [v8 state];

  if (v9 == (id)10)
  {
    id v56 = v4;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals"));
    id v11 = [v10 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v11)
    {
      id v12 = v11;
      __int128 v13 = 0LL;
      uint64_t v14 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v62 != v14) {
            objc_enumerationMutation(v10);
          }
          __int128 v16 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
          if (-[ConnectionManager allowInRestrictedMode:](self, "allowInRestrictedMode:", v16))
          {
            id v17 = v16;

            __int128 v13 = v17;
          }

          else
          {
            double v18 = (os_log_s *)qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v68 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Disconnecting peripheral : %@ since bluetooth is in restricted mode",  buf,  0xCu);
            }

            -[ConnectionManager disconnectPeripheral:force:](self, "disconnectPeripheral:force:", v16, 1LL);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }

      while (v12);
    }

    else
    {
      __int128 v13 = 0LL;
    }

    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:v33]);

    if (v34)
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v36]);

      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      [v38 removeAllObjects];

      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      [v39 setObject:v37 forKey:v40];
    }

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v42]);

    if (v43)
    {
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
      v45 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:v45]);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
      [v47 removeAllObjects];

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      [v48 setObject:v46 forKey:v49];
    }

    -[ConnectionManager setDenylistedIdentifiers:](self, "setDenylistedIdentifiers:", 0LL);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:v13]);

    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v13]);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      [v54 removeAllObjects];

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      [v55 setObject:v53 forKey:v13];
    }

    -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");

LABEL_37:
    id v4 = v56;
    goto LABEL_38;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  id v20 = [v19 state];

  if (v20 == (id)5)
  {
    id v56 = v4;
    -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    int v21 = self->_mfiAuthPendingPeripherals;
    id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v58;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
          v27 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Deferred MFI Auth for %@", buf, 0xCu);
          }

          -[ConnectionManager performMFiAuth:](self, "performMFiAuth:", v26);
        }

        id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
      }

      while (v23);
    }

    -[NSMutableSet removeAllObjects](self->_mfiAuthPendingPeripherals, "removeAllObjects");
    goto LABEL_37;
  }

  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  [v28 removeAllObjects];

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  [v29 removeAllObjects];

  -[ConnectionManager setConnectAlwaysIdentifiersMap:](self, "setConnectAlwaysIdentifiersMap:", 0LL);
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  [v30 removeAllObjects];

  -[ConnectionManager setPeripherals:](self, "setPeripherals:", 0LL);
  -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0LL);
  -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0LL);
  int v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  [v31 removeAllObjects];

LABEL_38:
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    *(_DWORD *)buf = 138412290;
    v66 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peripheral %@ is now connected", buf, 0xCu);
  }

  if (!-[ConnectionManager authInProgress](self, "authInProgress")
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral")),
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]),
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]),
        unsigned int v14 = [v12 isEqual:v13],
        v13,
        v12,
        v11,
        !v14))
  {
    if (-[ConnectionManager authInProgress](self, "authInProgress")) {
      goto LABEL_18;
    }
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    if (!v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v19 retrievePairingInfoForPeripheral:v7]);

      id v62 = objc_claimAutoreleasedReturnValue([v18 objectForKey:@"kCBMsgArgRemoteAddress"]);
      id v20 = (unsigned __int8 *)[v62 bytes];
      int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x:%02x:%02x:%02x:%02x:%02x",  *v20,  v20[1],  v20[2],  v20[3],  v20[4],  v20[5]));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      [v22 setDelegate:self];

      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 identifierForConnectionWithUUID:v24]);

      if (v25 == v21)
      {
        unsigned int v30 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Connection exists!", buf, 2u);
        }
      }

      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 createConnectionWithType:2 andIdentifier:v21]);
        -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v27);

        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
        [v28 setConnectionAuthenticated:v29 state:1];
      }

      int v31 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Previously connected peripheral ..",  buf,  2u);
      }
    }

LABEL_18:
    uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    if (v32)
    {
      __int16 v33 = (void *)v32;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      unsigned int v37 = [v35 isEqual:v36];

      if (v37)
      {
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
        [v38 setDelegate:self];

        __int128 v39 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v40 = v39;
          __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 name]);
          *(_DWORD *)buf = 138412290;
          v66 = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Perform mfi auth for %@...",  buf,  0xCu);
        }

        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 sharedPairingAgent]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 retrievePairedPeers]);

        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472LL;
        v63[2] = sub_10001D930;
        v63[3] = &unk_10005D1F8;
        id v46 = v7;
        id v64 = v46;
        if ([v45 indexOfObjectPassingTest:v63] != (id)0x7FFFFFFFFFFFFFFFLL
          || !-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v46))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          [v47 openL2CAPChannel:128];

          -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 1LL);
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          unsigned int v49 = -[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v48);

          if (!v49)
          {

            goto LABEL_36;
          }
        }
      }
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager peripherals](self, "peripherals"));
    unsigned int v51 = [v50 containsObject:v7];

    if (!v51)
    {
      -[ConnectionManager disconnectPeripheral:force:](self, "disconnectPeripheral:force:", v7, 0LL);
      goto LABEL_36;
    }

    [v7 setDelegate:self];
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v7]);

    if (!v53)
    {
      v54 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        id v56 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
        *(_DWORD *)buf = 138412290;
        v66 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Initializing ClientServiceManager for %@...",  buf,  0xCu);
      }

      __int128 v57 = -[ClientServiceManager initWithPeripheral:]( objc_alloc(&OBJC_CLASS___ClientServiceManager),  "initWithPeripheral:",  v7);
      __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      [v58 setObject:v57 forKeyedSubscript:v7];
    }

    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v16 = (id)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:v60]);

    if (v16)
    {
      __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v16 setDate:v61];

      objc_msgSend(v16, "setTryCount:", (char *)objc_msgSend(v16, "tryCount") + 1);
    }

    goto LABEL_33;
  }

  __int128 v15 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    *(_DWORD *)buf = 138412290;
    v66 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Authentication in progress for %@ Return.",  buf,  0xCu);

LABEL_33:
  }

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    int v24 = 138412546;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ failed to connect: %@",  (uint8_t *)&v24,  0x16u);
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v14 removeObjectForKey:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v16 removeObject:v17];

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v19]);

  if (v20)
  {
    -[ConnectionManager analyzeConnectionError:peripheral:info:]( self,  "analyzeConnectionError:peripheral:info:",  v10,  v9,  v20);
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v22]);

    if (v23) {
      -[ConnectionManager connectPeripheral:](self, "connectPeripheral:", v9);
    }
  }

  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 timestamp:(double)a5 isReconnecting:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int128 v15 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
    int v32 = 138413058;
    __int16 v33 = v17;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2048;
    double v37 = CFAbsoluteTimeGetCurrent() - a5;
    __int16 v38 = 1024;
    BOOL v39 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ is disconnected: %@ %lf seconds ago, is reconnecting: %d",  (uint8_t *)&v32,  0x26u);
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  [v18 removeObjectForKey:v13];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceIdentifiersMap](self, "connectOnceIdentifiersMap"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  [v19 removeObjectForKey:v20];

  int v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectOnceNoTimeoutIdentifiers](self, "connectOnceNoTimeoutIdentifiers"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  [v21 removeObject:v22];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  int v24 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v24]);

  if (v25)
  {
    -[ConnectionManager analyzeConnectionError:peripheral:info:]( self,  "analyzeConnectionError:peripheral:info:",  v14,  v13,  v25);
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v27]);

    if (v28)
    {
      if (!v8) {
        -[ConnectionManager connectPeripheral:](self, "connectPeripheral:", v13);
      }
    }
  }

  if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v13))
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));

    if (v29)
    {
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      int v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      [v30 destroyConnectionWithUUID:v31];
    }
  }

  -[ConnectionManager refreshConnectionAssertion](self, "refreshConnectionAssertion");
  -[ConnectionManager refreshPeripherals](self, "refreshPeripherals");
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Error in opening CBL2CAP channel: %@",  buf,  0xCu);
    }

    -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0LL);
    -[ConnectionManager setMfiPeripheral:](self, "setMfiPeripheral:", 0LL);
    if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v8)) {
      -[ConnectionManager disconnectPeripheral:force:](self, "disconnectPeripheral:force:", v8, 0LL);
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager L2CAPChannels](self, "L2CAPChannels"));
    [v12 addObject:v9];

    id v13 = (void *)voucher_copy();
    -[ConnectionManager setMfiVoucher:](self, "setMfiVoucher:", v13);

    -[ConnectionManager setPeerChannel:](self, "setPeerChannel:", v9);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 inputStream]);
    [v14 setDelegate:self];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 outputStream]);
    [v15 setDelegate:self];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 inputStream]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v16 scheduleInRunLoop:v17 forMode:NSDefaultRunLoopMode];

    double v18 = (void *)objc_claimAutoreleasedReturnValue([v9 outputStream]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v18 scheduleInRunLoop:v19 forMode:NSDefaultRunLoopMode];

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 inputStream]);
    [v20 open];

    int v21 = (void *)objc_claimAutoreleasedReturnValue([v9 outputStream]);
    [v21 open];

    if ([v8 hasTag:@"needsMFiAuthentication4.0"])
    {
      -[ConnectionManager setMfiAuthChannel:](self, "setMfiAuthChannel:", v9);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 retrievePairingInfoForPeripheral:v8]);

      id v24 = objc_claimAutoreleasedReturnValue([v23 objectForKey:@"kCBMsgArgRemoteAddress"]);
      id v25 = (unsigned __int8 *)[v24 bytes];
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x:%02x:%02x:%02x:%02x:%02x",  *v25,  v25[1],  v25[2],  v25[3],  v25[4],  v25[5]));
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      [v27 setDelegate:self];

      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 createConnectionWithType:2 andIdentifier:v26]);
      -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v29);

      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10001E3EC;
      v43[3] = &unk_10005D220;
      id v44 = v9;
      int v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      int v32 = (void *)objc_claimAutoreleasedReturnValue( [v30 createEndpointWithTransportType:3 andProtocol:14 andIdentifier:0 andDataOutHandler:v43 forConnectionWithUUI D:v31 publishConnection:1]);
      -[ConnectionManager setEndpointUUID:](self, "setEndpointUUID:", v32);
    }

    else
    {
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      [v33 setDelegate:self];

      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 UUIDString]);
      double v37 = (void *)objc_claimAutoreleasedReturnValue([v34 createConnectionWithType:2 andIdentifier:v36]);
      -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v37);

      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_10001E468;
      v41[3] = &unk_10005D220;
      id v42 = v9;
      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( [v38 createEndpointWithTransportType:3 andProtocol:4 andIdentifier:0 andDataOutHandler:v41 forConnectionWithUUI D:v39 publishConnection:1]);
      -[ConnectionManager setEndpointUUID:](self, "setEndpointUUID:", v40);
    }
  }
}

- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
    unsigned int v11 = -[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v10);

    if (v11)
    {
      -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0LL);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 inputStream]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v13 removeFromRunLoop:v14 forMode:NSDefaultRunLoopMode];

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 outputStream]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v16 removeFromRunLoop:v17 forMode:NSDefaultRunLoopMode];

      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 inputStream]);
      [v19 setDelegate:0];

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 outputStream]);
      [v21 setDelegate:0];

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 inputStream]);
      [v23 close];

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiAuthChannel](self, "mfiAuthChannel"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 outputStream]);
      [v25 close];
    }
  }

  __int16 v26 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = "not authenticated";
    if (v5) {
      id v27 = "authenticated";
    }
    *(_DWORD *)buf = 138412546;
    id v58 = v7;
    __int16 v59 = 2080;
    __int128 v60 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "AuthStatusDidChange %@ %s", buf, 0x16u);
  }

  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
  id v29 = v28;
  if (v5)
  {

    if (v29)
    {
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral", @"peerIdentifier"));
      int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
      int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
      id v56 = v32;
      __int16 v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.bluetooth.accessory-authentication.success",  0LL,  0LL,  0);
      DistributedCenter = CFNotificationCenterGetDistributedCenter();
      CFNotificationCenterPostNotification( DistributedCenter,  @"com.apple.bluetooth.accessory-authentication.success",  0LL,  v33,  0);
      -[ConnectionManager setMfiVoucher:](self, "setMfiVoucher:", 0LL);
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      LODWORD(v31) = [v36 hasTag:@"A2538"];

      if ((_DWORD)v31)
      {
        double v37 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v38 = v37;
          BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          *(_DWORD *)buf = 138412290;
          id v58 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Posting Find My specific auth successful notification for: %@",  buf,  0xCu);
        }

        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
        [v40 postNotificationName:@"A2538_AuthenticationDidSucceed" object:v41 userInfo:0];
      }

      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
      unsigned int v43 = [v42 hasTag:@"needsMFiAuthentication4.0"];

      if (v43)
      {
        id v44 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          v45 = v44;
          id v46 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
          *(_DWORD *)buf = 138412290;
          id v58 = v46;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Posting auth successful notification for: %@",  buf,  0xCu);
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager mfiPeripheral](self, "mfiPeripheral"));
        [v47 postNotificationName:@"AuthenticationServiceAuthDidSucceedNotification" object:v48 userInfo:0];
      }

- (void)transportClientServerDisconnected:(id)a3
{
  id v22 = a3;
  id v4 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "transportClientServerDisconnected!!", buf, 2u);
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 retrieveConnectedPeripheralsWithServices:0 allowAll:1]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (-[ConnectionManager requireServicesAndMFi:](self, "requireServicesAndMFi:", v11))
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 retrievePairingInfoForPeripheral:v11]);

          id v14 = objc_claimAutoreleasedReturnValue([v13 objectForKey:@"kCBMsgArgRemoteAddress"]);
          __int128 v15 = (unsigned __int8 *)[v14 bytes];
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x:%02x:%02x:%02x:%02x:%02x",  *v15,  v15[1],  v15[2],  v15[3],  v15[4],  v15[5],  v22));
          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
          [v17 setDelegate:self];

          double v18 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 createConnectionWithType:2 andIdentifier:v16]);
          -[ConnectionManager setConnectionUUID:](self, "setConnectionUUID:", v19);

          id v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
          int v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
          [v20 setConnectionAuthenticated:v21 state:1];
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v8);
  }
}

- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7
{
  id v7 = a4;
  id v8 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003AAC4((uint64_t)v7, v8);
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  [v9 peripheral:v7 didModifyServices:v6];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  [v9 peripheral:v7 didDiscoverServices:v6];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didDiscoverCharacteristicsForService:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didUpdateValueForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didWriteValueForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didUpdateNotificationStateForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didDiscoverDescriptorsForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didUpdateValueForDescriptor:v9 error:v8];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v5 = a3;
  if (a4 != 16)
  {
    if (a4 != 8)
    {
      if (a4 == 2)
      {
        id v6 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NSStreamEventHasBytesAvailable", buf, 2u);
        }

        bzero(buf, 0x1000uLL);
        id v7 = [v5 read:buf maxLength:4096];
        if (v7)
        {
          uint64_t v8 = (uint64_t)v7;
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, v7));
          id v10 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
            sub_10003AB38((uint64_t)v9, v8, v10);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager endpointUUID](self, "endpointUUID"));
          [v11 processIncomingData:v9 forEndpointWithUUID:v12];

          goto LABEL_27;
        }
      }

      goto LABEL_28;
    }

    id v13 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 streamError]);
      *(_DWORD *)buf = 138412290;
      id v42 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NSStreamEventErrorOccurred : %@. Teardown auth",  buf,  0xCu);
    }
  }

  id v16 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NSStreamEventEndEncountered", buf, 2u);
  }

  -[ConnectionManager setAuthInProgress:](self, "setAuthInProgress:", 0LL);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[ConnectionManager L2CAPChannels](self, "L2CAPChannels"));
  id v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(obj);
        }
        int v21 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 inputStream]);
        if ([v22 isEqual:v5])
        {
        }

        else
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 outputStream]);
          unsigned int v24 = [v23 isEqual:v5];

          if (!v24) {
            continue;
          }
        }

        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 inputStream]);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
        [v25 removeFromRunLoop:v26 forMode:NSDefaultRunLoopMode];

        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v21 outputStream]);
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
        [v27 removeFromRunLoop:v28 forMode:NSDefaultRunLoopMode];

        id v29 = (void *)objc_claimAutoreleasedReturnValue([v21 inputStream]);
        [v29 setDelegate:0];

        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v21 outputStream]);
        [v30 setDelegate:0];

        int v31 = (void *)objc_claimAutoreleasedReturnValue([v21 inputStream]);
        [v31 close];

        int v32 = (void *)objc_claimAutoreleasedReturnValue([v21 outputStream]);
        [v32 close];

        -[ConnectionManager setMfiVoucher:](self, "setMfiVoucher:", 0LL);
      }

      id v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v18);
  }

  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
  if (v33)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectionUUID](self, "connectionUUID"));
    [v9 destroyConnectionWithUUID:v11];
LABEL_27:
  }

- (void)peripheralPairingDidFail:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (!v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001F78C;
    v8[3] = &unk_10005D248;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)authDidSucceed:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v4 removeObject:v5];
}

- (void)authDidFail:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager denylistedIdentifiers](self, "denylistedIdentifiers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v5 addObject:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001F8CC;
  v8[3] = &unk_10005D248;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(&_dispatch_main_q, v8);
}

- (void)peerIsUsingBuiltinService:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager connectAlwaysIdentifiersMap](self, "connectAlwaysIdentifiersMap"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6) {
    [v6 setTryCount:0];
  }
}

- (void)peerDidIdleTimeout:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F9F0;
  v4[3] = &unk_10005D248;
  v4[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (id)centralManagerStateString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionManager centralManager](self, "centralManager"));
  id v3 = (char *)[v2 state];

  else {
    return off_10005D268[(void)(v3 - 1)];
  }
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableDictionary)connectOnceIdentifiersMap
{
  return self->_connectOnceIdentifiersMap;
}

- (void)setConnectOnceIdentifiersMap:(id)a3
{
}

- (NSMutableSet)connectOnceNoTimeoutIdentifiers
{
  return self->_connectOnceNoTimeoutIdentifiers;
}

- (void)setConnectOnceNoTimeoutIdentifiers:(id)a3
{
}

- (NSMutableDictionary)connectAlwaysIdentifiersMap
{
  return self->_connectAlwaysIdentifiersMap;
}

- (void)setConnectAlwaysIdentifiersMap:(id)a3
{
}

- (NSMutableSet)denylistedIdentifiers
{
  return self->_denylistedIdentifiers;
}

- (void)setDenylistedIdentifiers:(id)a3
{
}

- (OS_os_transaction)connectionAssertion
{
  return self->_connectionAssertion;
}

- (void)setConnectionAssertion:(id)a3
{
}

- (NSArray)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
}

- (NSMutableArray)L2CAPChannels
{
  return self->_L2CAPChannels;
}

- (void)setL2CAPChannels:(id)a3
{
}

- (NSMutableDictionary)clientServiceManagerMap
{
  return self->_clientServiceManagerMap;
}

- (void)setClientServiceManagerMap:(id)a3
{
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (CBPeripheral)mfiPeripheral
{
  return self->_mfiPeripheral;
}

- (void)setMfiPeripheral:(id)a3
{
}

- (CBL2CAPChannel)peerChannel
{
  return self->_peerChannel;
}

- (void)setPeerChannel:(id)a3
{
}

- (CBL2CAPChannel)mfiAuthChannel
{
  return self->_mfiAuthChannel;
}

- (void)setMfiAuthChannel:(id)a3
{
}

- (BOOL)authInProgress
{
  return self->_authInProgress;
}

- (void)setAuthInProgress:(BOOL)a3
{
  self->_authInProgress = a3;
}

- (OS_voucher)mfiVoucher
{
  return self->_mfiVoucher;
}

- (void)setMfiVoucher:(id)a3
{
}

- (NSMutableSet)mfiAuthPendingPeripherals
{
  return self->_mfiAuthPendingPeripherals;
}

- (void)setMfiAuthPendingPeripherals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end