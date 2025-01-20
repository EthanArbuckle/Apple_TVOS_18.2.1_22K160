@interface CattManager
+ (id)instance;
- (CBCentralManager)centralManager;
- (CattManager)init;
- (NSMutableArray)cattPeripheral;
- (NSMutableArray)services;
- (NSMutableDictionary)clientServiceManagerMap;
- (NSMutableDictionary)options;
- (id)centralManagerStateString;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connectPeripheral:(id)a3;
- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)registerServices;
- (void)removeOpportunisticConnection:(id)a3;
- (void)setCattPeripheral:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setClientServiceManagerMap:(id)a3;
- (void)setOpportunisticConnection:(id)a3;
- (void)setOptions:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation CattManager

+ (id)instance
{
  if (qword_100070C30 != -1) {
    dispatch_once(&qword_100070C30, &stru_10005CF50);
  }
  return (id)qword_100070C28;
}

- (void)registerServices
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
    id v6 = [v5 state];

    if (v6 == (id)5)
    {
      v7 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Register service for CATT", v10, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager options](self, "options"));
      [v8 registerForConnectionEventsWithOptions:v9];
    }
  }

- (void)setOpportunisticConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating connection option for %@ to be opportunistic",  buf,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  uint64_t v10 = CBConnectPeripheralOptionOpportunistic;
  v11 = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  [v8 updatePeripheral:v4 options:v9];
}

- (void)removeOpportunisticConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing opportunistic connection option for %@. Setting low connection latency",  buf,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  [v8 setDesiredConnectionLatency:0 forPeripheral:v4];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  uint64_t v11 = CBConnectPeripheralOptionOpportunistic;
  v12 = &__kCFBooleanFalse;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  [v9 updatePeripheral:v4 options:v10];
}

- (CattManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CattManager;
  v2 = -[CattManager init](&v20, "init");
  if (v2)
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___CBCentralManager);
    v21[0] = CBCentralManagerOptionReceiveSystemEvents;
    v21[1] = CBManagerNeedsRestrictedStateOperation;
    v22[0] = &__kCFBooleanTrue;
    v22[1] = &__kCFBooleanTrue;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
    v5 = -[CBCentralManager initWithDelegate:queue:options:]( v3,  "initWithDelegate:queue:options:",  v2,  &_dispatch_main_q,  v4);
    centralManager = v2->_centralManager;
    v2->_centralManager = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    cattPeripheral = v2->_cattPeripheral;
    v2->_cattPeripheral = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    services = v2->_services;
    v2->_services = v9;

    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clientServiceManagerMap = v2->_clientServiceManagerMap;
    v2->_clientServiceManagerMap = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    options = v2->_options;
    v2->_options = v13;

    v15 = v2->_services;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDDoAPServiceString));
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    v17 = v2->_services;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDUnifiedAccessoryRestoreProtocolServiceString));
    -[NSMutableArray addObject:](v17, "addObject:", v18);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_options,  "setObject:forKeyedSubscript:",  v2->_services,  CBConnectionEventMatchingOptionServiceUUIDs);
  }

  return v2;
}

- (void)connectPeripheral:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  id v6 = [v5 state];

  if (v6 == (id)5)
  {
    v7 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Connecting CATT peripheral %@...",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
    [v10 connectPeripheral:v4 options:0];
  }
}

- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  if ([v7 state] == (id)5)
  {
    id v8 = [v6 state];

    if (v8)
    {
      v9 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Disconnecting CATT peripheral %@...",  buf,  0xCu);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v4,  CBCancelPeripheralConnectionOptionForce));
      v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      [v12 cancelPeripheralConnection:v6 options:v14];

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      [v15 removeObjectForKey:v6];
    }
  }

  else
  {
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManagerStateString](self, "centralManagerStateString"));
    int v15 = 138412290;
    uint64_t v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CentralManager state is now %@",  (uint8_t *)&v15,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  id v9 = [v8 state];

  if (v9 != (id)5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
    if ([v10 state] == (id)4)
    {
    }

    else
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
      id v12 = [v11 state];

      if (v12 != (id)1) {
        goto LABEL_9;
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
    [v13 removeAllObjects];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    [v14 removeAllObjects];

    goto LABEL_9;
  }

  -[CattManager registerServices](self, "registerServices");
LABEL_9:
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v17 = 138412290;
    v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ is now connected",  (uint8_t *)&v17,  0xCu);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
  unsigned int v12 = [v11 containsObject:v7];

  if (v12)
  {
    [v7 setDelegate:self];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v7]);

    if (!v14)
    {
      int v15 = -[ClientServiceManager initWithPeripheral:]( objc_alloc(&OBJC_CLASS___ClientServiceManager),  "initWithPeripheral:",  v7);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
      [v16 setObject:v15 forKeyedSubscript:v7];
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ failed to connect: %@",  (uint8_t *)&v13,  0x16u);
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
  [v12 removeObject:v7];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v14 = 138412546;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ is now disconnected: %@",  (uint8_t *)&v14,  0x16u);
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  [v12 removeObjectForKey:v7];

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
  [v13 removeObject:v7];
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = v10;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    int v16 = 138412546;
    id v17 = v12;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Peripheral %@ connection event:%tu",  (uint8_t *)&v16,  0x16u);
  }

  if (a4 == 1)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
    [v13 addObject:v9];

    -[CattManager connectPeripheral:](self, "connectPeripheral:", v9);
  }

  else
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
    [v14 removeObjectForKey:v9];

    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager cattPeripheral](self, "cattPeripheral"));
    [v15 removeObject:v9];
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  [v9 peripheral:v7 didModifyServices:v6];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  [v9 peripheral:v7 didDiscoverServices:v6];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didDiscoverCharacteristicsForService:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didUpdateValueForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didWriteValueForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didUpdateNotificationStateForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didDiscoverDescriptorsForCharacteristic:v9 error:v8];
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager clientServiceManagerMap](self, "clientServiceManagerMap"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  [v12 peripheral:v10 didUpdateValueForDescriptor:v9 error:v8];
}

- (id)centralManagerStateString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CattManager centralManager](self, "centralManager"));
  uint64_t v3 = (char *)[v2 state];

  else {
    return off_10005CF70[(void)(v3 - 1)];
  }
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
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

- (NSMutableArray)cattPeripheral
{
  return self->_cattPeripheral;
}

- (void)setCattPeripheral:(id)a3
{
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end