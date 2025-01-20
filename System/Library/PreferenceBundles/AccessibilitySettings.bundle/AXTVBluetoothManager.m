@interface AXTVBluetoothManager
+ (id)sharedInstance;
- (AXTVBluetoothManagerDelegate)delegate;
- (BOOL)filterDeviceScan;
- (NSSet)connectedDevices;
- (NSSet)discoveredDevices;
- (NSSet)pairedDevices;
- (id)__init;
- (id)bluetoothDeviceForBTLEPeripheral:(id)a3;
- (id)bluetoothDeviceForClassicBluetoothDevice:(id)a3;
- (id)bluetoothDeviceWithIdentifier:(id)a3;
- (void)_addBluetoothDevice:(id)a3;
- (void)_bluetoothAvailabilityChanged:(id)a3;
- (void)_bluetoothConnectionFailed:(id)a3;
- (void)_bluetoothConnectionSuccess:(id)a3;
- (void)_bluetoothDeviceRemoved:(id)a3;
- (void)_bluetoothDidUnpair:(id)a3;
- (void)_bluetoothDisconnectFailed:(id)a3;
- (void)_bluetoothDisconnectSuccess:(id)a3;
- (void)_bluetoothNotificationHandler:(id)a3;
- (void)_bluetoothPairingPINRequest:(id)a3;
- (void)_bluetoothPairingPINResultFailed:(id)a3;
- (void)_bluetoothPairingPINResultSuccess:(id)a3;
- (void)_bluetoothPowerStateChanged:(id)a3;
- (void)_checkDeviceStatus;
- (void)_decrementPairingDeviceCounter;
- (void)_discoveredPeripheralsDidChangeNotification:(id)a3;
- (void)_incrementPairingDeviceCounter;
- (void)_peripheralStateDidChangeNotification:(id)a3;
- (void)_removeBluetoothDevice:(id)a3;
- (void)_startBluetoothDeviceDiscovery;
- (void)_stopBluetoothDeviceDiscovery;
- (void)_updateDevicesLists;
- (void)addObserver:(id)a3;
- (void)cancelPINPairing;
- (void)connectDevice:(id)a3;
- (void)continuePINPairing;
- (void)disconnectDevice:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveredDevices:(id)a3;
- (void)setFilterDeviceScan:(BOOL)a3;
- (void)setPairedDevices:(id)a3;
- (void)startScanning;
- (void)startedPINPairing;
- (void)stopScanning;
- (void)unpairDevice:(id)a3;
@end

@implementation AXTVBluetoothManager

- (id)bluetoothDeviceForClassicBluetoothDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  BOOL v6 = v5 > 0xE || ((1 << v5) & 0x7980) == 0;
  if (v6 || (unsigned int v7 = v5, !-[AXTVBluetoothManager filterDeviceScan](self, "filterDeviceScan")))
  {
    -[NSLock lock](self->_lock, "lock");
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    v14 = self->_allBTDevices;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v49;
LABEL_9:
      uint64_t v18 = 0LL;
      while (1)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v48 + 1) + 8 * v18);
        id v20 = (id)objc_claimAutoreleasedReturnValue([v19 bluetoothDeviceObject]);

        if (v20 == v4) {
          break;
        }
        if (v16 == (id)++v18)
        {
          id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
          if (v16) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }

      v13 = v19;

      if (v13) {
        goto LABEL_28;
      }
    }

    else
    {
LABEL_15:
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v43 = self;
    v22 = self->_allBTDevices;
    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v45;
LABEL_19:
      uint64_t v26 = 0LL;
      while (1)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v44 + 1) + 8 * v26);
        if (![v27 transportType])
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bluetoothDeviceObject]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 address]);
          unsigned __int8 v30 = [v21 isEqual:v29];

          if ((v30 & 1) != 0) {
            break;
          }
        }

        if (v24 == (id)++v26)
        {
          id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
          if (v24) {
            goto LABEL_19;
          }
          goto LABEL_26;
        }
      }

      [v27 setBluetoothDeviceObject:v4];
      v13 = v27;
      _AXTVBTLog(0LL, 3LL, @"found AXTVBluetoothDevice (2): %@", v31, v32, v33, v34, v35, (uint64_t)v13);

      self = v43;
      if (!v13) {
        goto LABEL_29;
      }
LABEL_28:
      -[NSLock unlock](self->_lock, "unlock");
    }

    else
    {
LABEL_26:

      self = v43;
LABEL_29:
      v13 = -[AXTVBluetoothDevice initWithClassicBluetoothDevice:]( objc_alloc(&OBJC_CLASS___AXTVBluetoothDevice),  "initWithClassicBluetoothDevice:",  v4);
      _AXTVBTLog(0LL, 3LL, @"making AXTVBluetoothDevice: %@", v36, v37, v38, v39, v40, (uint64_t)v13);
      -[AXTVBluetoothManager _addBluetoothDevice:](self, "_addBluetoothDevice:", v13);
      -[NSLock unlock](self->_lock, "unlock");
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v41 postNotificationName:@"AXTVBluetoothManagerDidAddDeviceNotification" object:v13];
    }
  }

  else
  {
    sub_30C90(v7);
    -[AXTVBluetoothManager filterDeviceScan](self, "filterDeviceScan");
    _AXTVBTLog( 0LL,  3LL,  @"ignoring AXTVCoreBluetoothDevice '%@' with type %s (%ld) and filterDeviceScan is %s",  v8,  v9,  v10,  v11,  v12,  (uint64_t)v4);
    v13 = 0LL;
  }

  return v13;
}

- (id)bluetoothDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  _AXTVBTLog(0LL, 3LL, @"looking up AXTVBluetoothDevice for identifier: %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v10 = self->_allBTDevices;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v32 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
      id v17 = [v4 caseInsensitiveCompare:v16];

      if (!v17) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v23 = v15;
    _AXTVBTLog(0LL, 3LL, @"    found AXTVBluetoothDevice: %@", v24, v25, v26, v27, v28, (uint64_t)v23);

    if (v23) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_9:
  }

  _AXTVBTLog(0LL, 3LL, @"    did not find AXTVBluetoothDevice", v18, v19, v20, v21, v22, v30);
  id v23 = 0LL;
LABEL_12:
  -[NSLock unlock](self->_lock, "unlock");

  return v23;
}

- (id)bluetoothDeviceForBTLEPeripheral:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v5 = self->_allBTDevices;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v40,  v45,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v41 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
      id v11 = (id)objc_claimAutoreleasedReturnValue([v10 bluetoothDeviceObject]);

      if (v11 == v4) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v40,  v45,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v12 = v10;

    if (v12) {
      goto LABEL_22;
    }
  }

  else
  {
LABEL_9:
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v35 = self;
  uint64_t v14 = self->_allBTDevices;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v36,  v44,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v37;
LABEL_13:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v37 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * v18);
      if ([v19 transportType] == (char *)&dword_0 + 1)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bluetoothDeviceObject]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
        unsigned __int8 v22 = [v13 isEqual:v21];

        if ((v22 & 1) != 0) {
          break;
        }
      }

      if (v16 == (id)++v18)
      {
        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v36,  v44,  16LL);
        if (v16) {
          goto LABEL_13;
        }
        goto LABEL_20;
      }
    }

    [v19 setBluetoothDeviceObject:v4];
    id v12 = v19;
    _AXTVBTLog(0LL, 3LL, @"found AXTVBluetoothDevice (2): %@", v23, v24, v25, v26, v27, (uint64_t)v12);

    self = v35;
    if (!v12) {
      goto LABEL_23;
    }
LABEL_22:
    -[NSLock unlock](self->_lock, "unlock");
  }

  else
  {
LABEL_20:

    self = v35;
LABEL_23:
    id v12 = -[AXTVBluetoothDevice initWithBTLEPeripheral:]( objc_alloc(&OBJC_CLASS___AXTVBluetoothDevice),  "initWithBTLEPeripheral:",  v4);
    _AXTVBTLog(0LL, 3LL, @"making AXTVBluetoothDevice: %@", v28, v29, v30, v31, v32, (uint64_t)v12);
    -[AXTVBluetoothManager _addBluetoothDevice:](self, "_addBluetoothDevice:", v12);
    -[NSLock unlock](self->_lock, "unlock");
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v33 postNotificationName:@"AXTVBluetoothManagerDidAddDeviceNotification" object:v12];
  }

  return v12;
}

- (void)_checkDeviceStatus
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  -[NSLock lock](self->_lock, "lock");
  _AXTVBTLog(0LL, 3LL, @"recomputing device sets", v6, v7, v8, v9, v10, v46);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v11 = self->_allBTDevices;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v48,  v52,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
        [v16 _checkStatus];
        else {
          uint64_t v17 = v5;
        }
        -[NSMutableSet addObject:](v17, "addObject:", v16);
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v48,  v52,  16LL);
    }

    while (v13);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager connectedDevices](self, "connectedDevices"));
  unsigned int v19 = objc_msgSend(v18, "tvs_shallowIsEqualToSet:", v3);

  if ((v19 & 1) == 0)
  {
    _AXTVBTLog(0LL, 3LL, @"    changing connected devices: %@", v20, v21, v22, v23, v24, (uint64_t)v3);
    -[AXTVBluetoothManager setConnectedDevices:](self, "setConnectedDevices:", v3);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager pairedDevices](self, "pairedDevices"));
  unsigned __int8 v26 = objc_msgSend(v25, "tvs_shallowIsEqualToSet:", v4);

  if ((v26 & 1) != 0)
  {
    int v32 = v19 ^ 1;
  }

  else
  {
    _AXTVBTLog(0LL, 3LL, @"    changing paired devices: %@", v27, v28, v29, v30, v31, (uint64_t)v4);
    -[AXTVBluetoothManager setPairedDevices:](self, "setPairedDevices:", v4);
    int v32 = 1;
  }

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager discoveredDevices](self, "discoveredDevices"));
  unsigned __int8 v34 = objc_msgSend(v33, "tvs_shallowIsEqualToSet:", v5);

  if ((v34 & 1) == 0)
  {
    _AXTVBTLog(0LL, 3LL, @"    changing discovered devices: %@", v35, v36, v37, v38, v39, (uint64_t)v5);
    -[AXTVBluetoothManager setDiscoveredDevices:](self, "setDiscoveredDevices:", v5);
    int v32 = 1;
  }

  -[NSLock unlock](self->_lock, "unlock");
  if (self->_finishedSetup && v32)
  {
    _AXTVBTLog(0LL, 3LL, @"posting AXTVBluetoothManagerDidUpdateNotification", v40, v41, v42, v43, v44, v47);
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v45 postNotificationName:@"AXTVBluetoothManagerDidUpdateNotification" object:0];
  }
}

+ (id)sharedInstance
{
  if (qword_805B8 != -1) {
    dispatch_once(&qword_805B8, &stru_65F10);
  }
  return (id)qword_805B0;
}

- (id)__init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___AXTVBluetoothManager;
  v2 = -[AXTVBluetoothManager init](&v23, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSSet);
    connectedDevices = v2->_connectedDevices;
    v2->_connectedDevices = v3;

    uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSSet);
    discoveredDevices = v2->_discoveredDevices;
    v2->_discoveredDevices = v5;

    uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSSet);
    pairedDevices = v2->_pairedDevices;
    v2->_pairedDevices = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    id v11 = objc_opt_new(&OBJC_CLASS___NSLock);
    lock = v2->_lock;
    v2->_lock = v11;

    id v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    allBTDevices = v2->_allBTDevices;
    v2->_allBTDevices = v13;

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
    [v15 addObserver:v2 selector:"_discoveredPeripheralsDidChangeNotification:" name:TVSPeripheralManagerDiscoveredPeripheralsDidChangeNotification object:v16];
    [v15 addObserver:v2 selector:"_peripheralStateDidChangeNotification:" name:TVSPeripheralManagerPeripheralStateDidChangeNotification object:v16];
    [v15 addObserver:v2 selector:"_bluetoothAvailabilityChanged:" name:@"AXTVCoreBluetoothAvailabilityChangedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothDeviceRemoved:" name:@"AXTVCoreBluetoothDeviceRemovedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothConnectionSuccess:" name:@"AXTVCoreBluetoothDeviceConnectSuccessNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothConnectionFailed:" name:@"AXTVCoreBluetoothDeviceConnectFailedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothDisconnectSuccess:" name:@"AXTVCoreBluetoothDeviceDisconnectSuccessNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothDisconnectFailed:" name:@"AXTVCoreBluetoothDeviceDisconnectFailedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothDidUnpair:" name:@"AXTVCoreBluetoothDeviceUnpairedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothPairingPINRequest:" name:@"AXTVCoreBluetoothPairingPINRequestNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothPairingPINResultSuccess:" name:@"AXTVCoreBluetoothPairingPINResultSuccessNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothPairingPINResultFailed:" name:@"AXTVCoreBluetoothPairingPINResultFailedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothPowerStateChanged:" name:@"AXTVCoreBluetoothPowerChangedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothConnectabilityChangedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothConnectionStatusChangedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothDeviceBatteryChangedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothDeviceChangedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothDeviceDiscoveredNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothDeviceUpdatedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothDiscoveryStateChangedNotification" object:0];
    [v15 addObserver:v2 selector:"_bluetoothNotificationHandler:" name:@"AXTVCoreBluetoothPairedStatusChangedNotification" object:0];
    -[AXTVBluetoothManager _updateDevicesLists](v2, "_updateDevicesLists");
    v2->_finishedSetup = 1;
    _AXTVBTLog(0LL, 3LL, @"bluetooth manager initialized", v17, v18, v19, v20, v21, (uint64_t)v23.receiver);
  }

  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    -[NSLock lock](self->_lock, "lock");
    _AXTVBTLog(0LL, 3LL, @"adding observer %p", v5, v6, v7, v8, v9, (uint64_t)v11);
    -[NSHashTable addObject:](self->_observers, "addObject:", v11);
    NSUInteger v10 = -[NSHashTable count](self->_observers, "count");
    -[NSLock unlock](self->_lock, "unlock");
    id v4 = v11;
    if (v10 == 1)
    {
      -[AXTVBluetoothManager startScanning](self, "startScanning");
      id v4 = v11;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    -[NSLock lock](self->_lock, "lock");
    _AXTVBTLog(0LL, 3LL, @"removing observer %p", v5, v6, v7, v8, v9, (uint64_t)v11);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v11);
    NSUInteger v10 = -[NSHashTable count](self->_observers, "count");
    -[NSLock unlock](self->_lock, "unlock");
    id v4 = v11;
    if (!v10)
    {
      -[AXTVBluetoothManager stopScanning](self, "stopScanning");
      id v4 = v11;
    }
  }
}

- (void)connectDevice:(id)a3
{
}

- (void)disconnectDevice:(id)a3
{
}

- (void)unpairDevice:(id)a3
{
}

- (void)startedPINPairing
{
  self->_pinRequestPending = 1;
  _AXTVBTLog(0LL, 3LL, @"starting PIN pairing", v2, v3, v4, v5, v6, v7);
}

- (void)cancelPINPairing
{
  self->_pinRequestPending = 0;
  _AXTVBTLog(0LL, 3LL, @"cancelling PIN pairing", v2, v3, v4, v5, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v8 cancelPairing];
}

- (void)continuePINPairing
{
  self->_pinRequestPending = 0;
}

- (void)startScanning
{
  p_scanningCounter = &self->_scanningCounter;
  do
    unint64_t v9 = __ldaxr((unint64_t *)p_scanningCounter);
  while (__stlxr(v9 + 1, (unint64_t *)p_scanningCounter));
  if (!v9)
  {
    if (atomic_load((unint64_t *)&self->_pairingDeviceCounter))
    {
      _AXTVBTLog(0LL, 3LL, @"Will not start scan because pairing counter is > 0", v2, v3, v4, v5, v6, v13);
    }

    else
    {
      _AXTVBTLog(0LL, 3LL, @"starting scanning", v2, v3, v4, v5, v6, v13);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
      [v11 startScanning];

      -[AXTVBluetoothManager _startBluetoothDeviceDiscovery](self, "_startBluetoothDeviceDiscovery");
      -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
    }
  }

  uint64_t v12 = atomic_load((unint64_t *)p_scanningCounter);
  _AXTVBTLog(0LL, 3LL, @"incremented scanning counter to %lld", v2, v3, v4, v5, v6, v12);
}

- (void)stopScanning
{
  p_scanningCounter = &self->_scanningCounter;
  do
  {
    unint64_t v9 = __ldaxr((unint64_t *)p_scanningCounter);
    unint64_t v10 = v9 - 1;
  }

  while (__stlxr(v10, (unint64_t *)p_scanningCounter));
  if (!v10)
  {
    if (atomic_load((unint64_t *)&self->_pairingDeviceCounter))
    {
      _AXTVBTLog(0LL, 3LL, @"Will not stop scanning because pairing counter is not 0", v2, v3, v4, v5, v6, v16);
    }

    else
    {
      _AXTVBTLog(0LL, 3LL, @"stopping scanning", v2, v3, v4, v5, v6, v16);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
      [v12 stopScanning];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance"));
      [v13 cancelPairing];

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance"));
      [v14 setDevicePairingEnabled:0];

      -[AXTVBluetoothManager _stopBluetoothDeviceDiscovery](self, "_stopBluetoothDeviceDiscovery");
    }
  }

  uint64_t v15 = atomic_load((unint64_t *)p_scanningCounter);
  _AXTVBTLog(0LL, 3LL, @"decremented scanning counter to %lld", v2, v3, v4, v5, v6, v15);
}

- (void)_discoveredPeripheralsDidChangeNotification:(id)a3
{
}

- (void)_peripheralStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  _AXTVBTLog(0LL, 3LL, @"got TVSPeripheralManagerPeripheralStateDidChangeNotification", v5, v6, v7, v8, v9, v29);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v30 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:TVSPeripheralManagerUserInfoKeyPeripheral]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:TVSPeripheralManagerUserInfoKeyError]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:TVSPeripheralManagerUserInfoKeyChangeType]);
  uint64_t v15 = (int *)[v14 integerValue];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForBTLEPeripheral:]( self,  "bluetoothDeviceForBTLEPeripheral:",  v30));
  [v16 _noteStateChangeFailure:v12];
  [v16 _checkStatus];
  if (v15 == (int *)((char *)&dword_0 + 2))
  {
    -[NSLock lock](self->_lock, "lock");
    _AXTVBTLog(0LL, 3LL, @"removing bluetooth peripheral: %@", v17, v18, v19, v20, v21, (uint64_t)v16);
    -[AXTVBluetoothManager _removeBluetoothDevice:](self, "_removeBluetoothDevice:", v16);
    -[NSLock unlock](self->_lock, "unlock");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 postNotificationName:@"AXTVBluetoothManagerDidRemoveDeviceNotification" object:v16];

    -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
    goto LABEL_9;
  }

  -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
  if (v15 == &dword_4)
  {
LABEL_9:
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    char v27 = objc_opt_respondsToSelector(v26, "bluetoothManager:didCompleteDeviceDisconnection:error:");

    if ((v27 & 1) != 0)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
      [v28 bluetoothManager:self didCompleteDeviceDisconnection:v16 error:v12];
    }

    goto LABEL_11;
  }

  if (v15 == (int *)((char *)&dword_4 + 1))
  {
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    char v24 = objc_opt_respondsToSelector(v23, "bluetoothManager:didCompleteDeviceConnection:error:");

    if ((v24 & 1) != 0)
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
      [v25 bluetoothManager:self didCompleteDeviceConnection:v16 error:v12];
    }

    if ([v16 isPairing])
    {
      [v16 setPairing:0];
      -[AXTVBluetoothManager _decrementPairingDeviceCounter](self, "_decrementPairingDeviceCounter");
    }
  }

- (void)_bluetoothAvailabilityChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance",  a3));
  unsigned int v5 = [v4 available];

  id v11 = "NO";
  if (v5) {
    id v11 = "YES";
  }
  _AXTVBTLog( 0LL,  3LL,  @"got BluetoothAvailabilityChangedNotification; available: %s",
    v6,
    v7,
    v8,
    v9,
    v10,
    (uint64_t)v11);
  if (v5)
  {
    -[AXTVBluetoothManager _startBluetoothDeviceDiscovery](self, "_startBluetoothDeviceDiscovery");
    -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
  }

- (void)_bluetoothDeviceRemoved:(id)a3
{
  id v19 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:"));
  [v4 _checkStatus];
  _AXTVBTLog(0LL, 3LL, @"got AXTVCoreBluetoothDeviceRemovedNotification; %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  if (([v4 isConnected] & 1) == 0)
  {
    -[NSLock lock](self->_lock, "lock");
    _AXTVBTLog(0LL, 3LL, @"removing bluetooth device: %@", v10, v11, v12, v13, v14, (uint64_t)v4);
    -[AXTVBluetoothManager _removeBluetoothDevice:](self, "_removeBluetoothDevice:", v4);
    -[NSLock unlock](self->_lock, "unlock");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 postNotificationName:@"AXTVBluetoothManagerDidRemoveDeviceNotification" object:v4];

    -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    char v17 = objc_opt_respondsToSelector(v16, "bluetoothManager:didCompleteDeviceDisconnection:error:");

    if ((v17 & 1) != 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
      [v18 bluetoothManager:self didCompleteDeviceDisconnection:v4 error:0];
    }
  }
}

- (void)_bluetoothConnectionSuccess:(id)a3
{
  id v14 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:"));
  [v4 _checkStatus];
  _AXTVBTLog( 0LL,  3LL,  @"got AXTVCoreBluetoothDeviceConnectSuccessNotification; %@",
    v5,
    v6,
    v7,
    v8,
    v9,
    (uint64_t)v4);
  -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "bluetoothManager:didCompleteDeviceConnection:error:");

  if ((v11 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    [v12 bluetoothManager:self didCompleteDeviceConnection:v4 error:0];
  }

  if ([v4 type] == &dword_4)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
    [v13 setBool:1 forKey:AXTVBluetoothDefaultsKeyHasPairedGameController];
  }

  if ([v4 isPairing])
  {
    [v4 setPairing:0];
    -[AXTVBluetoothManager _decrementPairingDeviceCounter](self, "_decrementPairingDeviceCounter");
  }
}

- (void)_bluetoothConnectionFailed:(id)a3
{
  id v4 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"AXTVCoreBluetoothErrorKey"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"BTError",  [v6 integerValue],  0));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:",  v17));
  [v8 _noteConnectionFailure:v7];
  [v8 _checkStatus];
  _AXTVBTLog( 0LL,  3LL,  @"got AXTVCoreBluetoothDeviceConnectFailedNotification; %@; error: %@",
    v9,
    v10,
    v11,
    v12,
    v13,
    (uint64_t)v8);
  if (([v8 isPINPairing] & 1) == 0
    && ([v8 wasPINPairingCancelled] & 1) == 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    char v15 = objc_opt_respondsToSelector(v14, "bluetoothManager:didCompleteDeviceConnection:error:");

    if ((v15 & 1) != 0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
      [v16 bluetoothManager:self didCompleteDeviceConnection:v8 error:v7];
    }

    -[AXTVBluetoothManager cancelPINPairing](self, "cancelPINPairing");
  }

  if ([v8 isPairing])
  {
    [v8 setPairing:0];
    -[AXTVBluetoothManager _decrementPairingDeviceCounter](self, "_decrementPairingDeviceCounter");
  }
}

- (void)_bluetoothDisconnectSuccess:(id)a3
{
  id v13 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:"));
  [v4 _checkStatus];
  _AXTVBTLog( 0LL,  3LL,  @"got AXTVCoreBluetoothDeviceDisconnectSuccessNotification; %@",
    v5,
    v6,
    v7,
    v8,
    v9,
    (uint64_t)v4);
  -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "bluetoothManager:didCompleteDeviceDisconnection:error:");

  if ((v11 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    [v12 bluetoothManager:self didCompleteDeviceDisconnection:v4 error:0];
  }
}

- (void)_bluetoothDisconnectFailed:(id)a3
{
  id v4 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"AXTVCoreBluetoothErrorKey"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"BTError",  [v6 integerValue],  0));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:",  v17));
  [v8 _noteDisconnectionFailure:v7];
  [v8 _checkStatus];
  _AXTVBTLog( 0LL,  3LL,  @"got AXTVCoreBluetoothDeviceDisconnectFailedNotification; %@; error: %@",
    v9,
    v10,
    v11,
    v12,
    v13,
    (uint64_t)v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
  char v15 = objc_opt_respondsToSelector(v14, "bluetoothManager:didCompleteDeviceDisconnection:error:");

  if ((v15 & 1) != 0)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    [v16 bluetoothManager:self didCompleteDeviceDisconnection:v8 error:v7];
  }
}

- (void)_bluetoothDidUnpair:(id)a3
{
  id v19 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:"));
  [v4 _checkStatus];
  _AXTVBTLog(0LL, 3LL, @"got AXTVCoreBluetoothDeviceUnpairedNotification; %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  -[NSLock lock](self->_lock, "lock");
  _AXTVBTLog(0LL, 3LL, @"removing bluetooth device: %@", v10, v11, v12, v13, v14, (uint64_t)v4);
  -[AXTVBluetoothManager _removeBluetoothDevice:](self, "_removeBluetoothDevice:", v4);
  -[NSLock unlock](self->_lock, "unlock");
  char v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 postNotificationName:@"AXTVBluetoothManagerDidRemoveDeviceNotification" object:v4];

  -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
  char v17 = objc_opt_respondsToSelector(v16, "bluetoothManager:didCompleteDeviceDisconnection:error:");

  if ((v17 & 1) != 0)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    [v18 bluetoothManager:self didCompleteDeviceDisconnection:v4 error:0];
  }
}

- (void)_bluetoothPairingPINRequest:(id)a3
{
  id v19 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:"));
  [v4 setPINPairing:1];
  [v4 setPINPairingFailed:0];
  [v4 setPINPairingCancelled:0];
  _AXTVBTLog(0LL, 3LL, @"requesting PIN pairing for device: %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  _AXTVBTLog(0LL, 3LL, @"Using device's own PIN for challenge", v10, v11, v12, v13, v14, v18);
  char v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
  char v16 = objc_opt_respondsToSelector(v15, "bluetoothManager:presentBuiltInPairingPinForDevice:");

  if ((v16 & 1) != 0)
  {
    char v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    [v17 bluetoothManager:self presentBuiltInPairingPinForDevice:v4];
  }
}

- (void)_bluetoothPairingPINResultSuccess:(id)a3
{
  id v15 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:"));
  uint64_t v10 = v4;
  if (v4 && ([v4 isPINPairing] & 1) != 0)
  {
    _AXTVBTLog(0LL, 3LL, @"PIN pairing succeeded for device: %@", v5, v6, v7, v8, v9, (uint64_t)v10);
    [v10 setPINPairing:0];
    [v10 setPINPairingFailed:0];
    [v10 setPINPairingCancelled:0];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
    char v12 = objc_opt_respondsToSelector(v11, "bluetoothManager:didAcceptPairingPINForDevice:");

    if ((v12 & 1) != 0)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
      [v13 bluetoothManager:self didAcceptPairingPINForDevice:v10];
    }
  }

  else
  {
    _AXTVBTLog( 0LL,  3LL,  @"dropping BluetoothPairingPINResultSuccessNotification for unknown device",  v5,  v6,  v7,  v8,  v9,  v14);
  }
}

- (void)_bluetoothPairingPINResultFailed:(id)a3
{
  id v4 = a3;
  if (!self->_pinRequestPending)
  {
    id v20 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:",  v5));
    char v12 = v6;
    if (v6 && ([v6 isPINPairing] & 1) != 0)
    {
      _AXTVBTLog(0LL, 3LL, @"PIN pairing failed for device: %@", v7, v8, v9, v10, v11, (uint64_t)v12);
      [v12 setPINPairing:0];
      [v12 setPINPairingFailed:1];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v20 userInfo]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"AXTVCoreBluetoothErrorKey"]);
      id v15 = (char *)[v14 integerValue];

      [v12 setPINPairingCancelled:v15 == (_BYTE *)&stru_68.reloff + 1];
      if (v15 != (_BYTE *)&stru_68.reloff + 1)
      {
        char v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
        char v17 = objc_opt_respondsToSelector(v16, "bluetoothManager:didRejectPairingPINForDevice:");

        if ((v17 & 1) != 0)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager delegate](self, "delegate"));
          [v18 bluetoothManager:self didRejectPairingPINForDevice:v12];
        }
      }
    }

    else
    {
      _AXTVBTLog( 0LL,  3LL,  @"dropping BluetoothPairingPINResultFailedNotification for unknown device",  v7,  v8,  v9,  v10,  v11,  v19);
    }

    id v4 = v20;
  }
}

- (void)_bluetoothPowerStateChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance",  a3));
  id v5 = [v4 powerState];

  _AXTVBTLog(0LL, 3LL, @"bluetooth power state changed to %d", v6, v7, v8, v9, v10, (uint64_t)v5);
  if ((_DWORD)v5 == 2)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  }

- (void)_bluetoothNotificationHandler:(id)a3
{
  id v16 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v16 object]);
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___AXTVCoreBluetoothDevice);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v16 object]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:",  v8));
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  [v9 _checkStatus];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
  _AXTVBTLog(0LL, 3LL, @"got %@; %@", v11, v12, v13, v14, v15, (uint64_t)v10);

  -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "_AXTVBluetoothDeviceObservationContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", @"name", a4, a5))
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v6 postNotificationName:@"AXTVBluetoothManagerDidUpdateNotification" object:0];
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___AXTVBluetoothManager;
    -[AXTVBluetoothManager observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)setFilterDeviceScan:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
  [v4 setBool:v3 forKey:@"BTFilterDeviceScan"];
}

- (BOOL)filterDeviceScan
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedAppleTVServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedAppleTVServicesPreferences"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"BTFilterDeviceScan" defaultValue:1];

  return v3;
}

- (void)_addBluetoothDevice:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_allBTDevices, "containsObject:") & 1) == 0)
  {
    [v4 addObserver:self forKeyPath:@"name" options:0 context:"_AXTVBluetoothDeviceObservationContext"];
    -[NSMutableArray addObject:](self->_allBTDevices, "addObject:", v4);
  }
}

- (void)_removeBluetoothDevice:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_allBTDevices, "containsObject:"))
  {
    [v4 removeObserver:self forKeyPath:@"name"];
    -[NSMutableArray removeObject:](self->_allBTDevices, "removeObject:", v4);
  }
}

- (void)_updateDevicesLists
{
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 connectedPeripherals]);

  id v10 = [v9 countByEnumeratingWithState:&v82 objects:v92 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v83;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v83 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 =  -[AXTVBluetoothManager bluetoothDeviceForBTLEPeripheral:]( self,  "bluetoothDeviceForBTLEPeripheral:",  *(void *)(*((void *)&v82 + 1) + 8LL * (void)i));
      }

      id v11 = [v9 countByEnumeratingWithState:&v82 objects:v92 count:16];
    }

    while (v11);
  }

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 connectedDevices]);

  id v17 = [v16 countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v79;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v79 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 =  -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:",  *(void *)(*((void *)&v78 + 1) + 8LL * (void)j));
      }

      id v18 = [v16 countByEnumeratingWithState:&v78 objects:v91 count:16];
    }

    while (v18);
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v22 connectingDevices]);

  id v24 = [v23 countByEnumeratingWithState:&v74 objects:v90 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v75;
    do
    {
      for (k = 0LL; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v75 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 =  -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:",  *(void *)(*((void *)&v74 + 1) + 8LL * (void)k));
      }

      id v25 = [v23 countByEnumeratingWithState:&v74 objects:v90 count:16];
    }

    while (v25);
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 pairedPeripherals]);

  id v31 = [v30 countByEnumeratingWithState:&v70 objects:v89 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v71;
    do
    {
      for (m = 0LL; m != v32; m = (char *)m + 1)
      {
        if (*(void *)v71 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 =  -[AXTVBluetoothManager bluetoothDeviceForBTLEPeripheral:]( self,  "bluetoothDeviceForBTLEPeripheral:",  *(void *)(*((void *)&v70 + 1) + 8LL * (void)m));
      }

      id v32 = [v30 countByEnumeratingWithState:&v70 objects:v89 count:16];
    }

    while (v32);
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 pairedDevices]);

  id v38 = [v37 countByEnumeratingWithState:&v66 objects:v88 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v67;
    do
    {
      for (n = 0LL; n != v39; n = (char *)n + 1)
      {
        if (*(void *)v67 != v40) {
          objc_enumerationMutation(v37);
        }
        id v42 =  -[AXTVBluetoothManager bluetoothDeviceForClassicBluetoothDevice:]( self,  "bluetoothDeviceForClassicBluetoothDevice:",  *(void *)(*((void *)&v66 + 1) + 8LL * (void)n));
      }

      id v39 = [v37 countByEnumeratingWithState:&v66 objects:v88 count:16];
    }

    while (v39);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 discoveredPeripherals]);

  id v45 = [v44 countByEnumeratingWithState:&v62 objects:v87 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v63;
    do
    {
      for (ii = 0LL; ii != v46; ii = (char *)ii + 1)
      {
        if (*(void *)v63 != v47) {
          objc_enumerationMutation(v44);
        }
        id v49 =  -[AXTVBluetoothManager bluetoothDeviceForBTLEPeripheral:]( self,  "bluetoothDeviceForBTLEPeripheral:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)ii));
      }

      id v46 = [v44 countByEnumeratingWithState:&v62 objects:v87 count:16];
    }

    while (v46);
  }

  -[AXTVBluetoothManager _checkDeviceStatus](self, "_checkDeviceStatus");
  -[NSLock lock](self->_lock, "lock");
  id v50 = -[NSHashTable copy](self->_observers, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v51 = v50;
  id v52 = [v51 countByEnumeratingWithState:&v58 objects:v86 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v59;
    do
    {
      for (jj = 0LL; jj != v53; jj = (char *)jj + 1)
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)jj);
        if ((objc_opt_respondsToSelector(v56, "bluetoothManagerDidUpdateDiscoveredDevices:") & 1) != 0)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothManager discoveredDevices](self, "discoveredDevices", (void)v58));
          [v56 bluetoothManagerDidUpdateDiscoveredDevices:v57];
        }
      }

      id v53 = [v51 countByEnumeratingWithState:&v58 objects:v86 count:16];
    }

    while (v53);
  }
}

- (void)_incrementPairingDeviceCounter
{
  p_pairingDeviceCounter = &self->_pairingDeviceCounter;
  do
    unint64_t v9 = __ldaxr((unint64_t *)p_pairingDeviceCounter);
  while (__stlxr(v9 + 1, (unint64_t *)p_pairingDeviceCounter));
  uint64_t v10 = atomic_load((unint64_t *)p_pairingDeviceCounter);
  _AXTVBTLog(0LL, 3LL, @"Increment paring device counter to %lld", v2, v3, v4, v5, v6, v10);
  unint64_t v16 = atomic_load((unint64_t *)p_pairingDeviceCounter);
  if (v16 == 1)
  {
    uint64_t v17 = atomic_load((unint64_t *)&self->_scanningCounter);
    if (v17 < 1)
    {
      _AXTVBTLog( 0LL,  3LL,  @"Will not pause the scan because the scan has not started.",  v11,  v12,  v13,  v14,  v15,  v20);
    }

    else
    {
      _AXTVBTLog(0LL, 3LL, @"Suppressing scan", v11, v12, v13, v14, v15, v19);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
      [v18 stopScanning];

      -[AXTVBluetoothManager _stopBluetoothDeviceDiscovery](self, "_stopBluetoothDeviceDiscovery");
    }
  }

- (void)_decrementPairingDeviceCounter
{
  p_pairingDeviceCounter = &self->_pairingDeviceCounter;
  do
    unint64_t v9 = __ldaxr((unint64_t *)p_pairingDeviceCounter);
  while (__stlxr(v9 - 1, (unint64_t *)p_pairingDeviceCounter));
  uint64_t v10 = atomic_load((unint64_t *)p_pairingDeviceCounter);
  _AXTVBTLog(0LL, 3LL, @"Decrement paring device counter to %lld", v2, v3, v4, v5, v6, v10);
  if (atomic_load((unint64_t *)p_pairingDeviceCounter))
  {
    unint64_t v17 = atomic_load((unint64_t *)p_pairingDeviceCounter);
    if ((v17 & 0x8000000000000000LL) != 0)
    {
      _AXTVBTLog(0LL, 3LL, @"Pairing device counter should not be < 0. Reset to 0", v11, v12, v13, v14, v15, v20);
      atomic_store(0LL, (unint64_t *)p_pairingDeviceCounter);
    }
  }

  else
  {
    uint64_t v18 = atomic_load((unint64_t *)&self->_scanningCounter);
    if (v18 < 1)
    {
      _AXTVBTLog( 0LL,  3LL,  @"Will not resume scanning because scanning counter is 0",  v11,  v12,  v13,  v14,  v15,  v21);
    }

    else
    {
      _AXTVBTLog(0LL, 3LL, @"UNsuppressing scan", v11, v12, v13, v14, v15, v20);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
      [v19 startScanning];

      -[AXTVBluetoothManager _startBluetoothDeviceDiscovery](self, "_startBluetoothDeviceDiscovery");
      -[AXTVBluetoothManager _updateDevicesLists](self, "_updateDevicesLists");
    }
  }

- (void)_startBluetoothDeviceDiscovery
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  if ([v7 powered] && (unint64_t v3 = atomic_load((unint64_t *)&self->_scanningCounter)) != 0)
  {
    BOOL discovering = self->_discovering;

    if (!discovering)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance"));
      [v5 setDevicePairingEnabled:1];

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance"));
      [v6 scanForServices:0xFFFFFFFFLL];

      self->_BOOL discovering = 1;
    }
  }

  else
  {
  }

- (void)_stopBluetoothDeviceDiscovery
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v3 setDeviceScanningEnabled:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v4 resetDeviceScanning];

  self->_BOOL discovering = 0;
}

- (NSSet)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
}

- (NSSet)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
}

- (NSSet)discoveredDevices
{
  return self->_discoveredDevices;
}

- (void)setDiscoveredDevices:(id)a3
{
}

- (AXTVBluetoothManagerDelegate)delegate
{
  return (AXTVBluetoothManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end