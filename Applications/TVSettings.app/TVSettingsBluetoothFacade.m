@interface TVSettingsBluetoothFacade
+ (BOOL)isBTKeyboardConnected;
+ (id)deviceStatusFormatterForDeviceType:(int64_t)a3 headsetType:(int64_t)a4 showConnectedState:(BOOL)a5;
+ (int64_t)numberOfConnectedDevices;
+ (int64_t)numberOfConnectedRemotes;
+ (void)connectDevice:(id)a3;
+ (void)disconnectDevice:(id)a3;
+ (void)unpairDevice:(id)a3;
- (BOOL)filterDeviceScan;
- (BOOL)hasPairedDoAPDevice;
- (BOOL)hasPairedDoAPOnlyDevice;
- (BOOL)hasPairedJSDevice;
- (BOOL)isAirPodsRoutingSuggestionEnabled;
- (BOOL)isCapsLockEnabled;
- (CUBluetoothClient)discoveryClient;
- (NSArray)connectedDevices;
- (NSArray)myDevices;
- (NSArray)otherDevices;
- (NSArray)remotes;
- (NSMutableDictionary)pairedCUDevices;
- (NSUserDefaults)bluetoothUserDefaults;
- (TVSettingsBluetoothFacade)init;
- (id)_deviceSortDescriptors;
- (void)_managerDidUpdate:(id)a3;
- (void)_updateConnectedDevicesWithSet:(id)a3;
- (void)_updateHasPairedDoAPOrJSDeviceWithSet:(id)a3;
- (void)_updateMyDevicesWithSet:(id)a3;
- (void)_updateOtherDevicesWithSet:(id)a3;
- (void)_updateRemotesWithSet:(id)a3;
- (void)dealloc;
- (void)setBluetoothUserDefaults:(id)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setFilterDeviceScan:(BOOL)a3;
- (void)setHasPairedDoAPDevice:(BOOL)a3;
- (void)setHasPairedDoAPOnlyDevice:(BOOL)a3;
- (void)setHasPairedJSDevice:(BOOL)a3;
- (void)setIsAirPodsRoutingSuggestionEnabled:(BOOL)a3;
- (void)setIsCapsLockEnabled:(BOOL)a3;
- (void)setMyDevices:(id)a3;
- (void)setOtherDevices:(id)a3;
- (void)setPairedCUDevices:(id)a3;
- (void)setRemotes:(id)a3;
- (void)startScanning;
- (void)stopScanning;
@end

@implementation TVSettingsBluetoothFacade

+ (id)deviceStatusFormatterForDeviceType:(int64_t)a3 headsetType:(int64_t)a4 showConnectedState:(BOOL)a5
{
  BOOL v5 = a5;
  switch(a3)
  {
    case 1LL:
      if (a5)
      {
        uint64_t v6 = TSKLocString(@"BluetoothRemoteConnectedValue");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
      }

      else
      {
        v7 = &stru_100195DD8;
      }

      v48[0] = v7;
      uint64_t v12 = TSKLocString(@"BluetoothRemoteConnectingValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v48[1] = v13;
      uint64_t v14 = TSKLocString(@"BluetoothRemoteDisconnectedValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v48[2] = v15;
      uint64_t v16 = TSKLocString(@"BluetoothRemoteDisconnectingValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v48[3] = v17;
      v18 = v48;
      goto LABEL_34;
    case 2LL:
      if (a5)
      {
        uint64_t v9 = TSKLocString(@"BluetoothKeyboardConnectedValue");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
      }

      else
      {
        v7 = &stru_100195DD8;
      }

      v47[0] = v7;
      uint64_t v26 = TSKLocString(@"BluetoothKeyboardConnectingValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v47[1] = v13;
      uint64_t v27 = TSKLocString(@"BluetoothKeyboardDisconnectedValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v47[2] = v15;
      uint64_t v28 = TSKLocString(@"BluetoothKeyboardDisconnectingValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v47[3] = v17;
      v18 = v47;
      goto LABEL_34;
    case 3LL:
      if (((1LL << a4) & 0x7676) != 0)
      {
        if (a5)
        {
          uint64_t v10 = TSKLocString(@"BluetoothEarbudsConnectedValue");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
        }

        else
        {
          v7 = &stru_100195DD8;
        }

        v51[0] = v7;
        uint64_t v32 = TSKLocString(@"BluetoothEarbudsConnectingValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v51[1] = v13;
        uint64_t v33 = TSKLocString(@"BluetoothEarbudsDisconnectedValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v51[2] = v15;
        uint64_t v34 = TSKLocString(@"BluetoothEarbudsDisconnectingValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v51[3] = v17;
        v18 = v51;
      }

      else if (((1LL << a4) & 0x988) != 0)
      {
        if (a5)
        {
          uint64_t v35 = TSKLocString(@"BluetoothOverEarHeadphonesConnectedValue");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);
        }

        else
        {
          v7 = &stru_100195DD8;
        }

        v50[0] = v7;
        uint64_t v36 = TSKLocString(@"BluetoothOverEarHeadphonesConnectingValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v50[1] = v13;
        uint64_t v37 = TSKLocString(@"BluetoothOverEarHeadphonesDisconnectedValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v50[2] = v15;
        uint64_t v38 = TSKLocString(@"BluetoothOverEarHeadphonesDisconnectingValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v50[3] = v17;
        v18 = v50;
      }

      else
      {
LABEL_30:
        if (a5)
        {
          uint64_t v39 = TSKLocString(@"BluetoothAudioConnectedValue");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v39);
        }

        else
        {
          v7 = &stru_100195DD8;
        }

        v49[0] = v7;
        uint64_t v40 = TSKLocString(@"BluetoothAudioConnectingValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v49[1] = v13;
        uint64_t v41 = TSKLocString(@"BluetoothAudioDisconnectedValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v49[2] = v15;
        uint64_t v42 = TSKLocString(@"BluetoothAudioDisconnectingValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v49[3] = v17;
        v18 = v49;
      }

- (TVSettingsBluetoothFacade)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothFacade;
  v2 = -[TVSettingsBluetoothFacade init](&v28, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_managerDidUpdate:" name:TVSBluetoothManagerDidUpdateNotification object:0];

    -[TVSettingsBluetoothFacade _managerDidUpdate:](v2, "_managerDidUpdate:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v2 selector:"_didEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    objc_initWeak(&location, v2);
    uint64_t v6 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100009650;
    handler[3] = &unk_10018E540;
    objc_copyWeak(&v26, &location);
    uint32_t v7 = notify_register_dispatch( "com.apple.TVPeripheralAgent.DidStartProximityPairing",  &v2->_derpDidStartNotificationToken,  &_dispatch_main_q,  handler);

    v2->_derpDidStartNotificationTokenIsValid = v7 == 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000096C8;
    v23[3] = &unk_10018E540;
    objc_copyWeak(&v24, &location);
    uint32_t v8 = notify_register_dispatch( "com.apple.TVPeripheralAgent.DidStopProximityPairing",  &v2->_derpDidStopNotificationToken,  &_dispatch_main_q,  v23);

    v2->_derpDidStopNotificationTokenIsValid = v8 == 0;
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pairedCUDevices = v2->_pairedCUDevices;
    v2->_pairedCUDevices = v9;

    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___CUBluetoothClient);
    discoveryClient = v2->_discoveryClient;
    v2->_discoveryClient = v11;

    -[CUBluetoothClient setFlags:](v2->_discoveryClient, "setFlags:", 1LL);
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.TVSettings.TVSettingsBluetoothFacade.CUB");
    cuBluetoothQueue = v2->_cuBluetoothQueue;
    v2->_cuBluetoothQueue = (OS_dispatch_queue *)Serial;

    -[CUBluetoothClient setDispatchQueue:](v2->_discoveryClient, "setDispatchQueue:", v2->_cuBluetoothQueue);
    v15 = v2->_discoveryClient;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100009740;
    v21[3] = &unk_10018E590;
    objc_copyWeak(&v22, &location);
    -[CUBluetoothClient setDevicePairedHandler:](v15, "setDevicePairedHandler:", v21);
    uint64_t v16 = v2->_discoveryClient;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100009898;
    v19[3] = &unk_10018E590;
    objc_copyWeak(&v20, &location);
    -[CUBluetoothClient setDeviceUnpairedHandler:](v16, "setDeviceUnpairedHandler:", v19);
    -[CUBluetoothClient activate](v2->_discoveryClient, "activate");
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[TIPreferencesController sharedPreferencesController]( &OBJC_CLASS___TIPreferencesController,  "sharedPreferencesController"));
    v2->_isCapsLockEnabled = [v17 BOOLForPreferenceKey:TIHWKeyboardCapsLockRomanSwitchPreference];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  if (self->_derpDidStartNotificationTokenIsValid)
  {
    notify_cancel(self->_derpDidStartNotificationToken);
    self->_derpDidStartNotificationToken = 0;
    self->_derpDidStartNotificationTokenIsValid = 0;
  }

  if (self->_derpDidStopNotificationTokenIsValid)
  {
    notify_cancel(self->_derpDidStopNotificationToken);
    self->_derpDidStopNotificationToken = 0;
    self->_derpDidStopNotificationTokenIsValid = 0;
  }

  -[CUBluetoothClient invalidate](self->_discoveryClient, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothFacade;
  -[TVSettingsBluetoothFacade dealloc](&v4, "dealloc");
}

- (void)_updateRemotesWithSet:(id)a3
{
  id v4 = a3;
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  v11[3] = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100009BA4;
  v10[3] = &unk_10018E5B8;
  v10[4] = v11;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsPassingTest:v10]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  uint32_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingDescriptors:v6]);

  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade remotes](self, "remotes"));
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0) {
    -[TVSettingsBluetoothFacade setRemotes:](self, "setRemotes:", v7);
  }

  _Block_object_dispose(v11, 8);
}

- (void)_updateMyDevicesWithSet:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100009CD4;
  v9[3] = &unk_10018E5E0;
  v9[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectsPassingTest:v9]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v5]);

  uint32_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade myDevices](self, "myDevices"));
  unsigned __int8 v8 = objc_msgSend(v6, "tvs_shallowIsEqualToArray:", v7);

  if ((v8 & 1) == 0) {
    -[TVSettingsBluetoothFacade setMyDevices:](self, "setMyDevices:", v6);
  }
}

- (void)_updateHasPairedDoAPOrJSDeviceWithSet:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5)
  {
    char v7 = 0;
    char v8 = 0;
    char v9 = 0;
    goto LABEL_15;
  }

  id v6 = v5;
  char v7 = 0;
  char v8 = 0;
  char v9 = 0;
  uint64_t v10 = *(void *)v15;
  while (2)
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v4);
      }
      uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
      if (objc_msgSend(v12, "supportsJS", (void)v14))
      {
        char v7 = 1;
        char v9 = 1;
      }

      else
      {
        unsigned __int8 v13 = [v12 supportsDoAP];
        v8 |= v13;
        v9 |= v13;
        if ((v7 & 1) == 0) {
          continue;
        }
      }

      if ((v8 & 1) != 0)
      {
        char v7 = 1;
        char v8 = 1;
        goto LABEL_15;
      }
    }

    id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6) {
      continue;
    }
    break;
  }

- (void)_updateOtherDevicesWithSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v5]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade otherDevices](self, "otherDevices"));
  LOBYTE(v5) = [v7 isEqual:v6];

  if ((v5 & 1) == 0) {
    -[TVSettingsBluetoothFacade setOtherDevices:](self, "setOtherDevices:", v7);
  }
}

- (void)_updateConnectedDevicesWithSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v5]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade connectedDevices](self, "connectedDevices"));
  LOBYTE(v5) = [v7 isEqual:v6];

  if ((v5 & 1) == 0) {
    -[TVSettingsBluetoothFacade setConnectedDevices:](self, "setConnectedDevices:", v7);
  }
}

- (void)_managerDidUpdate:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread", a3));
  unsigned int v5 = [v4 isMainThread];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v6 pairedDevices]);

    -[TVSettingsBluetoothFacade _updateRemotesWithSet:](self, "_updateRemotesWithSet:", v12);
    -[TVSettingsBluetoothFacade _updateMyDevicesWithSet:](self, "_updateMyDevicesWithSet:", v12);
    -[TVSettingsBluetoothFacade _updateHasPairedDoAPOrJSDeviceWithSet:]( self,  "_updateHasPairedDoAPOrJSDeviceWithSet:",  v12);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveredDevices]);
    -[TVSettingsBluetoothFacade _updateOtherDevicesWithSet:](self, "_updateOtherDevicesWithSet:", v8);

    char v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 connectedDevices]);
    -[TVSettingsBluetoothFacade _updateConnectedDevicesWithSet:](self, "_updateConnectedDevicesWithSet:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:@"TVSettingsBluetoothDeviceInfoDidUpdateNotification" object:self];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000A1A8;
    block[3] = &unk_10018E440;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)startScanning
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v3 addScanObserver:self];
}

- (void)stopScanning
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v3 removeScanObserver:self];
}

+ (void)connectDevice:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v4 connectDevice:v3];
}

+ (void)disconnectDevice:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v4 disconnectDevice:v3];
}

+ (void)unpairDevice:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v4 unpairDevice:v3];
}

- (BOOL)filterDeviceScan
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 filterDeviceScan];

  return v3;
}

- (void)setFilterDeviceScan:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v4 setFilterDeviceScan:v3];
}

- (void)setIsCapsLockEnabled:(BOOL)a3
{
  if (self->_isCapsLockEnabled != a3)
  {
    BOOL v3 = a3;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[TIPreferencesController sharedPreferencesController]( &OBJC_CLASS___TIPreferencesController,  "sharedPreferencesController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v5 setValue:v6 forPreferenceKey:TIHWKeyboardCapsLockRomanSwitchPreference];

    self->_isCapsLockEnabled = v3;
  }

+ (int64_t)numberOfConnectedRemotes
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance", 0LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pairedDevices]);

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0LL;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        char v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 type] == (id)1) {
          v6 += [v9 isConnected];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  else
  {
    int64_t v6 = 0LL;
  }

  return v6;
}

+ (int64_t)numberOfConnectedDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 connectedDevices]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

+ (BOOL)isBTKeyboardConnected
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance", 0LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 connectedDevices]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 type] == (id)2 && (objc_msgSend(v7, "isConnected") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)isAirPodsRoutingSuggestionEnabled
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade bluetoothUserDefaults](self, "bluetoothUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"routeIndication"]);

  if (!v4) {
    return 1;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade bluetoothUserDefaults](self, "bluetoothUserDefaults"));
  unsigned __int8 v6 = [v5 BOOLForKey:@"routeIndication"];

  return v6;
}

- (void)setIsAirPodsRoutingSuggestionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothFacade bluetoothUserDefaults](self, "bluetoothUserDefaults"));
  [v4 setBool:v3 forKey:@"routeIndication"];

  notify_post("com.apple.bluetooth.prefsChanged");
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  +[TVCSMetrics reportChangeFor:toValue:](&OBJC_CLASS___TVCSMetrics, "reportChangeFor:toValue:", 9LL, v5);
}

- (NSUserDefaults)bluetoothUserDefaults
{
  bluetoothUserDefaults = self->_bluetoothUserDefaults;
  if (!bluetoothUserDefaults)
  {
    id v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.bluetooth");
    id v5 = self->_bluetoothUserDefaults;
    self->_bluetoothUserDefaults = v4;

    bluetoothUserDefaults = self->_bluetoothUserDefaults;
  }

  return bluetoothUserDefaults;
}

- (id)_deviceSortDescriptors
{
  sortDescriptors = self->_sortDescriptors;
  if (!sortDescriptors)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"name",  1LL,  "localizedCaseInsensitiveCompare:"));
    char v8 = v4;
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    unsigned __int8 v6 = self->_sortDescriptors;
    self->_sortDescriptors = v5;

    sortDescriptors = self->_sortDescriptors;
  }

  return sortDescriptors;
}

- (NSArray)remotes
{
  return self->_remotes;
}

- (void)setRemotes:(id)a3
{
}

- (NSArray)myDevices
{
  return self->_myDevices;
}

- (void)setMyDevices:(id)a3
{
}

- (NSArray)otherDevices
{
  return self->_otherDevices;
}

- (void)setOtherDevices:(id)a3
{
}

- (NSArray)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
}

- (BOOL)isCapsLockEnabled
{
  return self->_isCapsLockEnabled;
}

- (BOOL)hasPairedDoAPDevice
{
  return self->_hasPairedDoAPDevice;
}

- (void)setHasPairedDoAPDevice:(BOOL)a3
{
  self->_hasPairedDoAPDevice = a3;
}

- (BOOL)hasPairedJSDevice
{
  return self->_hasPairedJSDevice;
}

- (void)setHasPairedJSDevice:(BOOL)a3
{
  self->_hasPairedJSDevice = a3;
}

- (BOOL)hasPairedDoAPOnlyDevice
{
  return self->_hasPairedDoAPOnlyDevice;
}

- (void)setHasPairedDoAPOnlyDevice:(BOOL)a3
{
  self->_hasPairedDoAPOnlyDevice = a3;
}

- (CUBluetoothClient)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (NSMutableDictionary)pairedCUDevices
{
  return self->_pairedCUDevices;
}

- (void)setPairedCUDevices:(id)a3
{
}

- (void)setBluetoothUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end