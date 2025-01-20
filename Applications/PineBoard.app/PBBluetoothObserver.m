@interface PBBluetoothObserver
+ (id)_connectedDevicesFromDevices:(id)a3;
+ (id)sharedInstance;
- (BOOL)activated;
- (CBCentralManager)coreBluetoothManager;
- (NSArray)connectedDevices;
- (NSArray)currentPairedDevices;
- (NSArray)pairedDevices;
- (OS_dispatch_queue)accessSerialQueue;
- (OS_dispatch_queue)workSerialQueue;
- (OS_dispatch_source)reloadDevicesSource;
- (id)_init;
- (void)_handleBluetoothManagerNotificationHandler:(id)a3;
- (void)_signalReloadDevicesSource;
- (void)_workQueue_activate;
- (void)_workQueue_reloadDevices;
- (void)activate;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)setActivated:(BOOL)a3;
- (void)setCoreBluetoothManager:(id)a3;
- (void)setCurrentPairedDevices:(id)a3;
- (void)setReloadDevicesSource:(id)a3;
@end

@implementation PBBluetoothObserver

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E38C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470250 != -1) {
    dispatch_once(&qword_100470250, block);
  }
  return (id)qword_100470248;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBBluetoothObserver;
  v2 = -[PBBluetoothObserver init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.pineboard.PBBluetoothStatisticsManager.workQueue", 0LL);
    workSerialQueue = v2->_workSerialQueue;
    v2->_workSerialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.pineboard.PBBluetoothStatisticsManager.accessQueue", 0LL);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v5;

    currentPairedDevices = v2->_currentPairedDevices;
    v2->_currentPairedDevices = (NSArray *)&__NSArray0__struct;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver coreBluetoothManager](self, "coreBluetoothManager"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedPairingAgent]);
  [v5 setDelegate:0];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBBluetoothObserver;
  -[PBBluetoothObserver dealloc](&v6, "dealloc");
}

- (void)activate
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver workSerialQueue](self, "workSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E550;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (NSArray)pairedDevices
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10006E64C;
  v11 = sub_10006E65C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver accessSerialQueue](self, "accessSerialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006E674;
  v6[3] = &unk_1003D0210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)connectedDevices
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10006E64C;
  v11 = sub_10006E65C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver accessSerialQueue](self, "accessSerialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006E794;
  v6[3] = &unk_1003D0210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)_handleBluetoothManagerNotificationHandler:(id)a3
{
}

+ (id)_connectedDevicesFromDevices:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bs_filter:", &stru_1003D2BC0));
}

- (void)_workQueue_activate
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver workSerialQueue](self, "workSerialQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[PBBluetoothObserver activated](self, "activated"))
  {
    -[PBBluetoothObserver setActivated:](self, "setActivated:", 1LL);
    id v4 = objc_alloc_init(&OBJC_CLASS___CBCentralManager);
    -[CBCentralManager setDelegate:](v4, "setDelegate:", self);
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager sharedPairingAgent](v4, "sharedPairingAgent"));
    [v5 setDelegate:self];

    -[PBBluetoothObserver setCoreBluetoothManager:](self, "setCoreBluetoothManager:", v4);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothAvailabilityChangedNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothConnectabilityChangedNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothConnectionStatusChangedNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDeviceChangedNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDeviceConnectSuccessNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDeviceDiscoveredNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDeviceRemovedNotification object:0];
    uint64_t v7 = BluetoothDeviceUnpairedNotification;
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDeviceUnpairedNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:v7 object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDeviceUpdatedNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothDiscoveryStateChangedNotification object:0];
    [v6 addObserver:self selector:"_handleBluetoothManagerNotificationHandler:" name:BluetoothPairedStatusChangedNotification object:0];
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver workSerialQueue](self, "workSerialQueue"));
    uint64_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0LL, 0LL, v8);

    -[PBBluetoothObserver setReloadDevicesSource:](self, "setReloadDevicesSource:", v9);
    objc_initWeak(&location, self);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = sub_10006EBE8;
    v13 = &unk_1003D0890;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v9, &v10);
    dispatch_resume(v9);
    -[PBBluetoothObserver _signalReloadDevicesSource](self, "_signalReloadDevicesSource", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

- (void)_workQueue_reloadDevices
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver workSerialQueue](self, "workSerialQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_10006F018();
  dispatch_queue_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Reloading Devices", buf, 2u);
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver coreBluetoothManager](self, "coreBluetoothManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedPairingAgent]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 retrievePairedPeers]);

  uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", &stru_1003D2C00));
  *(void *)buf = 0LL;
  v38 = buf;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_10006E64C;
  v41 = sub_10006E65C;
  id v42 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006F0A4;
  block[3] = &unk_1003D0790;
  block[4] = buf;
  dispatch_sync(&_dispatch_main_q, block);
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v9);
  -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", *((void *)v38 + 5));
  uint64_t v11 = self->_currentPairedDevices;
  id v12 = -[NSMutableArray copy](v10, "copy");
  unsigned int v33 = -[NSArray isEqual:](v11, "isEqual:", v12);
  id v13 = [(id)objc_opt_class(self) _connectedDevicesFromDevices:v11];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [(id)objc_opt_class(self) _connectedDevicesFromDevices:v12];
  v31 = (void *)objc_claimAutoreleasedReturnValue(v15);
  unsigned int v16 = [v14 isEqual:v31];
  char v17 = v16;
  v32 = v12;
  v18 = v11;
  v19 = (void *)v9;
  int v20 = v16 ^ 1;
  int v21 = v33 ^ 1 | v16 ^ 1;
  id v22 = sub_10006F018();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if (v21 == 1)
  {
    v25 = v8;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 67109376;
      int v44 = v33 ^ 1;
      __int16 v45 = 1024;
      int v46 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Devices *did* change. pairedDevicesChanged=%{BOOL}d, connectedDevicesChanged=%{BOOL}d",  v43,  0xEu);
    }

    v27 = v14;
    v26 = v32;
    v28 = v19;
    v29 = v18;
    if ((v17 & 1) == 0) {
      -[PBBluetoothObserver willChangeValueForKey:](self, "willChangeValueForKey:", @"connectedDevices");
    }
    if ((v33 & 1) == 0)
    {
      -[PBBluetoothObserver willChangeValueForKey:](self, "willChangeValueForKey:", @"pairedDevices");
      v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver accessSerialQueue](self, "accessSerialQueue"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10006F160;
      v34[3] = &unk_1003CFEB8;
      v34[4] = self;
      id v35 = v32;
      dispatch_sync(v30, v34);

      -[PBBluetoothObserver didChangeValueForKey:](self, "didChangeValueForKey:", @"pairedDevices");
    }

    if ((v17 & 1) == 0) {
      -[PBBluetoothObserver didChangeValueForKey:](self, "didChangeValueForKey:", @"connectedDevices");
    }
  }

  else
  {
    v25 = v8;
    v28 = v19;
    v29 = v18;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Devices did not change.", v43, 2u);
    }

    v27 = v14;
    v26 = v32;
  }

  _Block_object_dispose(buf, 8);
}

- (void)_signalReloadDevicesSource
{
  v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBBluetoothObserver reloadDevicesSource](self, "reloadDevicesSource"));
  dispatch_source_merge_data(v2, 1uLL);
}

- (OS_dispatch_queue)workSerialQueue
{
  return self->_workSerialQueue;
}

- (OS_dispatch_queue)accessSerialQueue
{
  return self->_accessSerialQueue;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (CBCentralManager)coreBluetoothManager
{
  return self->_coreBluetoothManager;
}

- (void)setCoreBluetoothManager:(id)a3
{
}

- (OS_dispatch_source)reloadDevicesSource
{
  return self->_reloadDevicesSource;
}

- (void)setReloadDevicesSource:(id)a3
{
}

- (NSArray)currentPairedDevices
{
  return self->_currentPairedDevices;
}

- (void)setCurrentPairedDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end