@interface AXTVBluetoothFacade
+ (id)deviceStatusFormatterForDeviceType:(int64_t)a3 showConnectedState:(BOOL)a4;
+ (int64_t)numberOfConnectedDevices;
+ (int64_t)numberOfConnectedRemotes;
+ (void)connectDevice:(id)a3;
+ (void)disconnectDevice:(id)a3;
+ (void)unpairDevice:(id)a3;
- (AXTVBluetoothFacade)init;
- (BOOL)filterDeviceScan;
- (NSArray)connectedDevices;
- (NSArray)myDevices;
- (NSArray)otherDevices;
- (NSArray)remotes;
- (id)_deviceSortDescriptors;
- (void)_managerDidUpdate:(id)a3;
- (void)_updateConnectedDevicesWithSet:(id)a3;
- (void)_updateMyDevicesWithSet:(id)a3;
- (void)_updateOtherDevicesWithSet:(id)a3;
- (void)_updateRemotesWithSet:(id)a3;
- (void)dealloc;
- (void)setConnectedDevices:(id)a3;
- (void)setFilterDeviceScan:(BOOL)a3;
- (void)setMyDevices:(id)a3;
- (void)setOtherDevices:(id)a3;
- (void)setRemotes:(id)a3;
- (void)startScanning;
- (void)stopScanning;
@end

@implementation AXTVBluetoothFacade

+ (id)deviceStatusFormatterForDeviceType:(int64_t)a3 showConnectedState:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 1LL:
      if (a4)
      {
        uint64_t v5 = TSKLocString(@"BluetoothRemoteConnectedValue", a2);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
      }

      else
      {
        v6 = &stru_69430;
      }

      v49[0] = v6;
      uint64_t v11 = TSKLocString(@"BluetoothRemoteConnectingValue", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v49[1] = v12;
      uint64_t v14 = TSKLocString(@"BluetoothRemoteDisconnectedValue", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v49[2] = v15;
      uint64_t v17 = TSKLocString(@"BluetoothRemoteDisconnectingValue", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v49[3] = v18;
      v19 = v49;
      goto LABEL_23;
    case 2LL:
      if (a4)
      {
        uint64_t v8 = TSKLocString(@"BluetoothKeyboardConnectedValue", a2);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
      }

      else
      {
        v6 = &stru_69430;
      }

      v48[0] = v6;
      uint64_t v29 = TSKLocString(@"BluetoothKeyboardConnectingValue", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v48[1] = v12;
      uint64_t v31 = TSKLocString(@"BluetoothKeyboardDisconnectedValue", v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v48[2] = v15;
      uint64_t v33 = TSKLocString(@"BluetoothKeyboardDisconnectingValue", v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v48[3] = v18;
      v19 = v48;
      goto LABEL_23;
    case 3LL:
      if (a4)
      {
        uint64_t v9 = TSKLocString(@"BluetoothAudioConnectedValue", a2);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
      }

      else
      {
        v6 = &stru_69430;
      }

      v50[0] = v6;
      uint64_t v34 = TSKLocString(@"BluetoothAudioConnectingValue", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v50[1] = v12;
      uint64_t v36 = TSKLocString(@"BluetoothAudioDisconnectedValue", v35);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v50[2] = v15;
      uint64_t v38 = TSKLocString(@"BluetoothAudioDisconnectingValue", v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v50[3] = v18;
      v19 = v50;
      goto LABEL_23;
    case 4LL:
      if (a4)
      {
        uint64_t v10 = TSKLocString(@"BluetoothGameControllerConnectedValue", a2);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
      }

      else
      {
        v6 = &stru_69430;
      }

      v47[0] = v6;
      uint64_t v39 = TSKLocString(@"BluetoothGameControllerConnectingValue", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v47[1] = v12;
      uint64_t v41 = TSKLocString(@"BluetoothGameControllerDisconnectedValue", v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v47[2] = v15;
      uint64_t v43 = TSKLocString(@"BluetoothGameControllerDisconnectingValue", v42);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v47[3] = v18;
      v19 = v47;
LABEL_23:
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));

      if (v4) {
        goto LABEL_24;
      }
      goto LABEL_25;
    default:
      if (a4)
      {
        uint64_t v7 = TSKLocString(@"BluetoothConnectedValue", a2);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
      }

      else
      {
        v6 = &stru_69430;
      }

      v46[0] = v6;
      uint64_t v20 = TSKLocString(@"BluetoothConnectingValue", a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v46[1] = v21;
      uint64_t v23 = TSKLocString(@"BluetoothDisconnectedValue", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v46[2] = v24;
      uint64_t v26 = TSKLocString(@"BluetoothDisconnectingValue", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v46[3] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 4LL));

      if (!v4) {
        goto LABEL_25;
      }
LABEL_24:

LABEL_25:
      v44 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_70120,  v28);

      return v44;
  }

- (AXTVBluetoothFacade)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AXTVBluetoothFacade;
  v2 = -[AXTVBluetoothFacade init](&v15, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_managerDidUpdate:" name:@"AXTVBluetoothManagerDidUpdateNotification" object:0];

    -[AXTVBluetoothFacade _managerDidUpdate:](v2, "_managerDidUpdate:", 0LL);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v2 selector:"_didEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    objc_initWeak(&location, v2);
    v6 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_34E34;
    handler[3] = &unk_66AC8;
    objc_copyWeak(&v13, &location);
    uint32_t v7 = notify_register_dispatch( "com.apple.TVPeripheralAgent.DidStartProximityPairing",  &v2->_derpDidStartNotificationToken,  &_dispatch_main_q,  handler);

    v2->_derpDidStartNotificationTokenIsValid = v7 == 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_34EAC;
    v10[3] = &unk_66AC8;
    objc_copyWeak(&v11, &location);
    uint32_t v8 = notify_register_dispatch( "com.apple.TVPeripheralAgent.DidStopProximityPairing",  &v2->_derpDidStopNotificationToken,  &_dispatch_main_q,  v10);

    v2->_derpDidStopNotificationTokenIsValid = v8 == 0;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
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

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVBluetoothFacade;
  -[AXTVBluetoothFacade dealloc](&v4, "dealloc");
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
  v10[2] = sub_350E0;
  v10[3] = &unk_66AF0;
  void v10[4] = v11;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsPassingTest:v10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  uint32_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingDescriptors:v6]);

  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade remotes](self, "remotes"));
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0) {
    -[AXTVBluetoothFacade setRemotes:](self, "setRemotes:", v7);
  }

  _Block_object_dispose(v11, 8);
}

- (void)_updateMyDevicesWithSet:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 objectsPassingTest:&stru_66B30]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingDescriptors:v4]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade myDevices](self, "myDevices"));
  unsigned __int8 v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0) {
    -[AXTVBluetoothFacade setMyDevices:](self, "setMyDevices:", v5);
  }
}

- (void)_updateOtherDevicesWithSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v5]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade otherDevices](self, "otherDevices"));
  LOBYTE(v5) = [v7 isEqual:v6];

  if ((v5 & 1) == 0) {
    -[AXTVBluetoothFacade setOtherDevices:](self, "setOtherDevices:", v7);
  }
}

- (void)_updateConnectedDevicesWithSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade _deviceSortDescriptors](self, "_deviceSortDescriptors"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v5]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothFacade connectedDevices](self, "connectedDevices"));
  LOBYTE(v5) = [v7 isEqual:v6];

  if ((v5 & 1) == 0) {
    -[AXTVBluetoothFacade setConnectedDevices:](self, "setConnectedDevices:", v7);
  }
}

- (void)_managerDidUpdate:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance", a3));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 pairedDevices]);

  -[AXTVBluetoothFacade _updateRemotesWithSet:](self, "_updateRemotesWithSet:", v10);
  -[AXTVBluetoothFacade _updateMyDevicesWithSet:](self, "_updateMyDevicesWithSet:", v10);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 discoveredDevices]);
  -[AXTVBluetoothFacade _updateOtherDevicesWithSet:](self, "_updateOtherDevicesWithSet:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 connectedDevices]);
  -[AXTVBluetoothFacade _updateConnectedDevicesWithSet:](self, "_updateConnectedDevicesWithSet:", v8);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 postNotificationName:@"AXTVBluetoothDeviceInfoDidUpdateNotification" object:self];
}

- (void)startScanning
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v2 performSelector:"startScanning"];
}

- (void)stopScanning
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v2 performSelector:"stopScanning"];
}

+ (void)connectDevice:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v4 connectDevice:v3];
}

+ (void)disconnectDevice:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v4 disconnectDevice:v3];
}

+ (void)unpairDevice:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v4 unpairDevice:v3];
}

- (BOOL)filterDeviceScan
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 filterDeviceScan];

  return v3;
}

- (void)setFilterDeviceScan:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v4 setFilterDeviceScan:v3];
}

+ (int64_t)numberOfConnectedRemotes
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance", 0LL));
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
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
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
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 connectedDevices]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)_deviceSortDescriptors
{
  sortDescriptors = self->_sortDescriptors;
  if (!sortDescriptors)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"name",  1LL,  "localizedCaseInsensitiveCompare:"));
    id v8 = v4;
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    int64_t v6 = self->_sortDescriptors;
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

- (void).cxx_destruct
{
}

@end