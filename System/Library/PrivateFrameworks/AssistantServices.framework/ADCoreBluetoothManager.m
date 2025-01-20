@interface ADCoreBluetoothManager
+ (void)fetchCBUUIDForConnectedDeviceWithAddress:(id)a3 completion:(id)a4;
+ (void)retrieveConnectedDevicesInfoOnDoAPServiceWithCompletion:(id)a3;
+ (void)retrieveConnectedDevicesInfoWithCompletion:(id)a3;
- (id)_adCoreBluetoothDeviceForPeripheral:(id)a3 RSSI:(id)a4;
- (id)_getPeripheralStateDescriptionFromState:(int64_t)a3;
- (id)_init;
- (void)_connectToPeripherals:(id)a3;
- (void)_didReadRSSI:(id)a3 forPeripheral:(id)a4;
- (void)_retrieveConnectedDevicesInfoOnServices:(id)a3 completion:(id)a4;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5;
@end

@implementation ADCoreBluetoothManager

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADCoreBluetoothManager;
  v2 = -[ADCoreBluetoothManager init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADCoreBluetoothManagerQueue", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_invalidated = 0;
    v2->_counter = 0LL;
    v7 = v2->_queue;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10029B5AC;
    v11[3] = &unk_1004FBBD0;
    v12 = v7;
    v9 = v7;
    [v8 addQueue:v9 heartBeatInterval:v11 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v2;
}

- (void)_retrieveConnectedDevicesInfoOnServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10029B158;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (id)_getPeripheralStateDescriptionFromState:(int64_t)a3
{
  else {
    return off_1004F9470[a3];
  }
}

- (id)_adCoreBluetoothDeviceForPeripheral:(id)a3 RSSI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADCoreBluetoothManager _getPeripheralStateDescriptionFromState:]( self,  "_getPeripheralStateDescriptionFromState:",  [v7 state]));
  id v9 = objc_alloc(&OBJC_CLASS___ADCoreBluetoothDevice);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);

  id v12 = -[ADCoreBluetoothDevice initWithIdentifier:name:RSSI:state:]( v9,  "initWithIdentifier:name:RSSI:state:",  v10,  v11,  v6,  v8);
  unint64_t counter = self->_counter;
  self->_unint64_t counter = counter + 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%tu", counter));
  -[ADCoreBluetoothDevice setIndex:](v12, "setIndex:", v14);

  return v12;
}

- (void)_connectToPeripherals:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    id v6 = v5;
    id v7 = (OS_dispatch_group *)dispatch_group_create();
    group = self->_group;
    self->_group = v7;

    id v9 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v6);
    peripheralsPendingRSSI = self->_peripheralsPendingRSSI;
    self->_peripheralsPendingRSSI = v9;

    v11 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v6);
    peripheralsWithRSSIRead = self->_peripheralsWithRSSIRead;
    self->_peripheralsWithRSSIRead = v11;

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          v19 = self->_peripheralsPendingRSSI;
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
          -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v18, v20);

          [v18 setDelegate:self];
          dispatch_group_enter((dispatch_group_t)self->_group);
          -[CBCentralManager connectPeripheral:options:](self->_cbManager, "connectPeripheral:options:", v18, 0LL);
        }

        id v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v15);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v21 = self->_group;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029B128;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_group_notify((dispatch_group_t)v21, queue, block);
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_completionWrapper);
    [WeakRetained invoke];
  }
}

- (void)_didReadRSSI:(id)a3 forPeripheral:(id)a4
{
  id v6 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[ADCoreBluetoothManager _adCoreBluetoothDeviceForPeripheral:RSSI:]( self,  "_adCoreBluetoothDeviceForPeripheral:RSSI:",  v6,  a3));
  -[NSMutableArray addObject:](self->_peripheralsWithRSSIRead, "addObject:");
  peripheralsPendingRSSI = self->_peripheralsPendingRSSI;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary removeObjectForKey:](peripheralsPendingRSSI, "removeObjectForKey:", v8);

  -[CBCentralManager cancelPeripheralConnection:](self->_cbManager, "cancelPeripheralConnection:", v6);
  group = self->_group;
  if (group) {
    dispatch_group_leave((dispatch_group_t)group);
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = (NSArray *)a3;
  if (-[NSArray isEqual:](v4, "isEqual:", self->_cbManager))
  {
    id v5 = (NSArray *)-[CBCentralManager state](self->_cbManager, "state");
    uint64_t v6 = (uint64_t)-[CBCentralManager state](self->_cbManager, "state");
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v8 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v6 > 4)
    {
      if (v8)
      {
        servicesToScan = self->_servicesToScan;
        int v14 = 136315394;
        id v15 = "-[ADCoreBluetoothManager centralManagerDidUpdateState:]";
        __int16 v16 = 2112;
        v17 = servicesToScan;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s retrieving connected devices on services: %@",  (uint8_t *)&v14,  0x16u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:]( self->_cbManager,  "retrieveConnectedPeripheralsWithServices:allowAll:",  self->_servicesToScan,  1LL));
      -[ADCoreBluetoothManager _connectToPeripherals:](self, "_connectToPeripherals:", v13);
    }

    else
    {
      if (v8)
      {
        int v14 = 136315394;
        id v15 = "-[ADCoreBluetoothManager centralManagerDidUpdateState:]";
        __int16 v16 = 2048;
        v17 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Invalid CBCentral manager state: %ld",  (uint8_t *)&v14,  0x16u);
      }

      self->_invalidated = 1;
      if (self->_group)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_completionWrapper);
        [WeakRetained invoke];
      }
    }
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      cbManager = self->_cbManager;
      int v14 = 136315650;
      id v15 = "-[ADCoreBluetoothManager centralManagerDidUpdateState:]";
      __int16 v16 = 2112;
      v17 = v4;
      __int16 v18 = 2112;
      v19 = cbManager;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Ignoring update from irrelevant CB manager: %@, current manager is %@",  (uint8_t *)&v14,  0x20u);
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = (ADCoreBluetoothManager *)a4;
  if (self->_invalidated)
  {
    BOOL v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[ADCoreBluetoothManager centralManager:didConnectPeripheral:]";
      __int16 v12 = 2112;
      id v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s %@ already invalidated",  (uint8_t *)&v10,  0x16u);
    }
  }

  else if ([v6 isEqual:self->_cbManager])
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      v11 = "-[ADCoreBluetoothManager centralManager:didConnectPeripheral:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s %@ connected, now reading RSSI",  (uint8_t *)&v10,  0x16u);
    }

    -[ADCoreBluetoothManager readRSSI](v7, "readRSSI");
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 isEqual:self->_cbManager])
  {
    peripheralsPendingRSSI = self->_peripheralsPendingRSSI;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](peripheralsPendingRSSI, "objectForKey:", v11));

    if (v12)
    {
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315650;
        id v15 = "-[ADCoreBluetoothManager centralManager:didFailToConnectPeripheral:error:]";
        __int16 v16 = 2112;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s %@: %@", (uint8_t *)&v14, 0x20u);
      }

      -[ADCoreBluetoothManager _didReadRSSI:forPeripheral:](self, "_didReadRSSI:forPeripheral:", 0LL, v8);
    }
  }
}

- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10029AF30;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void).cxx_destruct
{
}

+ (void)retrieveConnectedDevicesInfoWithCompletion:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = -[ADCoreBluetoothManager _init](objc_alloc(&OBJC_CLASS___ADCoreBluetoothManager), "_init");
    [v4 _retrieveConnectedDevicesInfoOnServices:&__NSArray0__struct completion:v3];
  }

+ (void)retrieveConnectedDevicesInfoOnDoAPServiceWithCompletion:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = -[ADCoreBluetoothManager _init](objc_alloc(&OBJC_CLASS___ADCoreBluetoothManager), "_init");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDDoAPServiceString));
    id v7 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    [v4 _retrieveConnectedDevicesInfoOnServices:v6 completion:v3];
  }

+ (void)fetchCBUUIDForConnectedDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___CBController);
  id v8 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  [v8 setIdentifier:v5];
  id v9 = objc_alloc_init(&OBJC_CLASS___CBDeviceRequest);
  [v9 setRequestFlags:64];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10029B8F8;
  v12[3] = &unk_1004F9428;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  [v7 performDeviceRequest:v9 device:v8 completion:v12];
}

@end