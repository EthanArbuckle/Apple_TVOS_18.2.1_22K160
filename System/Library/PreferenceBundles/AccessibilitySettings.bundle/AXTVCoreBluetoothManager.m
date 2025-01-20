@interface AXTVCoreBluetoothManager
+ (id)sharedInstance;
+ (int)lastInitError;
+ (void)setSharedInstanceQueue:(id)a3;
- (AXTVCoreBluetoothManager)init;
- (BOOL)_attach;
- (BOOL)_isValidBrailleDevice:(id)a3;
- (BOOL)_setup:(BTSessionImpl *)a3;
- (BOOL)audioConnected;
- (BOOL)available;
- (BOOL)connectable;
- (BOOL)connected;
- (BOOL)devicePairingEnabled;
- (BOOL)deviceScanningEnabled;
- (BOOL)deviceScanningInProgress;
- (BOOL)isAnyoneAdvertising;
- (BOOL)isAnyoneScanning;
- (BOOL)isDiscoverable;
- (BOOL)isServiceSupported:(unsigned int)a3;
- (BOOL)powered;
- (BOOL)setEnabled:(BOOL)a3;
- (BOOL)setPowered:(BOOL)a3;
- (BOOL)wasDeviceDiscovered:(id)a3;
- (BTAccessoryManagerImpl)_accessoryManager;
- (NSDictionary)brailleDriverDeviceDetectionInfo;
- (id)addDeviceIfNeeded:(BTDeviceImpl *)a3;
- (id)connectedDevices;
- (id)connectingDevices;
- (id)localAddress;
- (id)pairedDevices;
- (int)powerState;
- (void)_advertisingChanged;
- (void)_cleanup:(BOOL)a3;
- (void)_connectabilityChanged;
- (void)_connectedStatusChanged;
- (void)_discoveryStateChanged;
- (void)_pairedStatusChanged;
- (void)_postNotification:(id)a3;
- (void)_postNotificationWithArray:(id)a3;
- (void)_powerChanged;
- (void)_removeDevice:(id)a3;
- (void)_restartScan;
- (void)_scanForServices:(unsigned int)a3 withMode:(int)a4;
- (void)_setScanState:(int)a3;
- (void)acceptSSP:(int64_t)a3 forDevice:(id)a4;
- (void)cancelPairing;
- (void)connectDevice:(id)a3;
- (void)connectDevice:(id)a3 withServices:(unsigned int)a4;
- (void)dealloc;
- (void)disconnectDevice:(id)a3;
- (void)enableTestMode;
- (void)endVoiceCommand:(id)a3;
- (void)postNotification:(id)a3;
- (void)postNotificationName:(id)a3 object:(id)a4;
- (void)postNotificationName:(id)a3 object:(id)a4 error:(id)a5;
- (void)resetDeviceScanning;
- (void)scanForConnectableDevices:(unsigned int)a3;
- (void)scanForServices:(unsigned int)a3;
- (void)setAudioConnected:(BOOL)a3;
- (void)setBrailleDriverDeviceDetectionInfo:(id)a3;
- (void)setConnectable:(BOOL)a3;
- (void)setDevicePairingEnabled:(BOOL)a3;
- (void)setDeviceScanningEnabled:(BOOL)a3;
- (void)setDiscoverable:(BOOL)a3;
- (void)setPincode:(id)a3 forDevice:(id)a4;
- (void)showPowerPrompt;
- (void)startVoiceCommand:(id)a3;
- (void)unpairDevice:(id)a3;
@end

@implementation AXTVCoreBluetoothManager

- (BTAccessoryManagerImpl)_accessoryManager
{
  return self->_accessoryManager;
}

+ (void)setSharedInstanceQueue:(id)a3
{
}

+ (id)sharedInstance
{
  v2 = (void *)qword_80570;
  if (!qword_80570)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___AXTVCoreBluetoothManager);
    v4 = (void *)qword_80570;
    qword_80570 = (uint64_t)v3;

    v2 = (void *)qword_80570;
  }

  return v2;
}

+ (int)lastInitError
{
  return dword_80578;
}

- (BOOL)available
{
  return self->_available == 2;
}

- (AXTVCoreBluetoothManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVCoreBluetoothManager;
  v2 = -[AXTVCoreBluetoothManager init](&v6, "init");
  v3 = v2;
  if (v2 && !-[AXTVCoreBluetoothManager _attach](v2, "_attach")) {
    v4 = 0LL;
  }
  else {
    v4 = v3;
  }

  return v4;
}

- (BOOL)_attach
{
  if (!qword_80568) {
    objc_storeStrong((id *)&qword_80568, &_dispatch_main_q);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v5 = v4;
  if (!v4)
  {
    objc_super v6 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", getprogname());
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u-BrailleService",  v5,  getpid());
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v4) {

  }
  _AXTVBTLog(2LL, 1LL, @"Attaching to BTServer with sessionID: %@", v9, v10, v11, v12, v13, (uint64_t)v8);
  id v14 = v8;
  id v15 = [v14 UTF8String];
  uint64_t v16 = BTSessionAttachWithQueue(v15, &off_65D90, self, qword_80568);
  BOOL v22 = (_DWORD)v16 == 0;
  if ((_DWORD)v16)
  {
    int v23 = v16;
    _AXTVBTLog(16LL, 1LL, @"failed to attach with error %d", v17, v18, v19, v20, v21, v16);
    dword_80578 = v23;
  }

  else
  {
    self->_available = 1;
  }

  return v22;
}

- (BOOL)_setup:(BTSessionImpl *)a3
{
  self->_session = a3;
  uint64_t v4 = BTServiceAddCallbacks(a3, sub_19768, self);
  if ((_DWORD)v4)
  {
    int v10 = v4;
    _AXTVBTLog(16LL, 1LL, @"BTServiceAddCallbacks failed with error %d", v5, v6, v7, v8, v9, v4);
LABEL_11:
    BOOL result = 0;
    dword_80578 = v10;
    return result;
  }

  uint64_t Default = BTLocalDeviceGetDefault(self->_session, &self->_localDevice);
  if ((_DWORD)Default)
  {
    int v10 = Default;
    _AXTVBTLog(16LL, 1LL, @"BTLocalDeviceGetDefault failed with error %d", v12, v13, v14, v15, v16, Default);
    goto LABEL_11;
  }

  uint64_t v17 = BTLocalDeviceAddCallbacks(self->_localDevice, &off_801A0, self);
  if ((_DWORD)v17)
  {
    int v10 = v17;
    _AXTVBTLog(16LL, 1LL, @"BTLocalDeviceAddCallbacks failed with %d", v18, v19, v20, v21, v22, v17);
    goto LABEL_11;
  }

  self->_discoveryAgent = 0LL;
  self->_pairingAgent = 0LL;
  uint64_t v23 = BTAccessoryManagerGetDefault(self->_session, &self->_accessoryManager);
  if ((_DWORD)v23)
  {
    int v10 = v23;
    _AXTVBTLog(16LL, 1LL, @"BTAccessoryManagerGetDefault failed with error %d", v24, v25, v26, v27, v28, v23);
    goto LABEL_11;
  }

  uint64_t v29 = BTAccessoryManagerAddCallbacks(self->_accessoryManager, &off_801B8, self);
  if ((_DWORD)v29)
  {
    int v10 = v29;
    _AXTVBTLog(16LL, 1LL, @"BTAccessoryManagerAddCallbacks failed with error %d", v30, v31, v32, v33, v34, v29);
    goto LABEL_11;
  }

  v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  btAddrDict = self->_btAddrDict;
  self->_btAddrDict = v36;

  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  btDeviceDict = self->_btDeviceDict;
  self->_btDeviceDict = v38;

  dword_80578 = 0;
  self->_available = 2;
  return 1;
}

- (void)_cleanup:(BOOL)a3
{
  self->_available = 0;
  if (a3)
  {
    discoveryAgent = self->_discoveryAgent;
    if (discoveryAgent)
    {
      BTDiscoveryAgentStopScan(discoveryAgent, a2);
      BTDiscoveryAgentDestroy(&self->_discoveryAgent, v5);
    }

    pairingAgent = self->_pairingAgent;
    if (pairingAgent)
    {
      BTPairingAgentStop(pairingAgent, a2);
      BTPairingAgentDestroy(&self->_pairingAgent);
    }

    accessoryManager = self->_accessoryManager;
    if (accessoryManager) {
      BTAccessoryManagerRemoveCallbacks(accessoryManager, &off_801B8);
    }
    localDevice = self->_localDevice;
    if (localDevice) {
      BTLocalDeviceRemoveCallbacks(localDevice, &off_801A0);
    }
    session = self->_session;
    if (session)
    {
      BTServiceRemoveCallbacks(session, sub_19768);
      BTSessionDetachWithQueue(&self->_session);
    }
  }

  *(_WORD *)&self->_audioConnected = 0;
  self->_localDevice = 0LL;
  self->_session = 0LL;
  self->_discoveryAgent = 0LL;
  self->_pairingAgent = 0LL;
  btAddrDict = self->_btAddrDict;
  self->_accessoryManager = 0LL;
  self->_btAddrDict = 0LL;

  btDeviceDict = self->_btDeviceDict;
  self->_btDeviceDict = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVCoreBluetoothManager;
  -[AXTVCoreBluetoothManager dealloc](&v3, "dealloc");
}

- (void)_postNotificationWithArray:(id)a3
{
  id v8 = a3;
  objc_super v3 = (char *)[v8 count];
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
    if (v3 == (_BYTE *)&dword_0 + 1)
    {
      uint64_t v5 = 0LL;
LABEL_7:
      objc_super v3 = 0LL;
      goto LABEL_8;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:2]);
    objc_super v3 = (char *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v6,  @"AXTVCoreBluetoothErrorKey",  v4,  @"AXTVCoreBluetoothNotificationNameKey",  0LL));
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v4 = 0LL;
  }

- (void)_postNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:v4 object:self];
}

- (void)postNotification:(id)a3
{
}

- (void)postNotificationName:(id)a3 object:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", a3, a4, 0LL));
  -[AXTVCoreBluetoothManager performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_postNotificationWithArray:",  v5,  0LL);
}

- (void)postNotificationName:(id)a3 object:(id)a4 error:(id)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", a3, a4, a5, 0LL));
  -[AXTVCoreBluetoothManager performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_postNotificationWithArray:",  v6,  0LL);
}

- (void)showPowerPrompt
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v4 = objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    int v5 = BTLocalDeviceShowPowerPrompt(localDevice, [v4 UTF8String]);

    if (v5)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
      _AXTVBTLog( 16LL,  1LL,  @"failed to show power prompt for application %@ with error %d",  v7,  v8,  v9,  v10,  v11,  (uint64_t)v6);
    }
  }

- (int)powerState
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int v4 = 0;
    BTLocalDeviceGetModulePower(localDevice, 1LL, &v4);
    if (v4 == -1) {
      LODWORD(localDevice) = 2;
    }
    else {
      LODWORD(localDevice) = v4 == -889275714;
    }
  }

  return (int)localDevice;
}

- (BOOL)powered
{
  return -[AXTVCoreBluetoothManager powerState](self, "powerState") == 2;
}

- (BOOL)setPowered:(BOOL)a3
{
  localDevice = self->_localDevice;
  if (!localDevice) {
    return 0;
  }
  BOOL v4 = a3;
  BOOL v5 = 1;
  if (BTLocalDeviceSetModulePower(localDevice, 1LL, (a3 << 31 >> 31)))
  {
    uint64_t v11 = @"off";
    if (v4) {
      uint64_t v11 = @"on";
    }
    _AXTVBTLog(16LL, 1LL, @"failed to set power %@ with error %d", v6, v7, v8, v9, v10, (uint64_t)v11);
    return 0;
  }

  return v5;
}

- (BOOL)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    -[AXTVCoreBluetoothManager setDeviceScanningEnabled:](self, "setDeviceScanningEnabled:", 0LL);
  }
  return -[AXTVCoreBluetoothManager setPowered:](self, "setPowered:", v3);
}

- (void)_powerChanged
{
  unsigned int v3 = -[AXTVCoreBluetoothManager powerState](self, "powerState");
  if (v3 != 1)
  {
    uint64_t v9 = "off";
    if (v3 == 2) {
      uint64_t v9 = "on";
    }
    _AXTVBTLog(0LL, 1LL, @"power is now %s", v4, v5, v6, v7, v8, (uint64_t)v9);
    -[AXTVCoreBluetoothManager postNotification:]( self,  "postNotification:",  @"AXTVCoreBluetoothPowerChangedNotification");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.bluetooth.power-changed", 0LL, 0LL, 1u);
  }

- (BOOL)isAnyoneScanning
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int v10 = 0;
    uint64_t Scanning = BTLocalDeviceGetScanning(localDevice, &v10);
    if ((_DWORD)Scanning) {
      _AXTVBTLog(16LL, 1LL, @"failed to get scanning state with error %d", v4, v5, v6, v7, v8, Scanning);
    }
    LOBYTE(localDevice) = v10 != 0;
  }

  return (char)localDevice;
}

- (BOOL)isAnyoneAdvertising
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int v10 = 0;
    uint64_t AdvertisingStatus = BTLocalDeviceGetAdvertisingStatus(localDevice, &v10);
    if ((_DWORD)AdvertisingStatus) {
      _AXTVBTLog( 16LL,  1LL,  @"failed to get advertising state with error %d",  v4,  v5,  v6,  v7,  v8,  AdvertisingStatus);
    }
    LOBYTE(localDevice) = v10 != 0;
  }

  return (char)localDevice;
}

- (id)addDeviceIfNeeded:(BTDeviceImpl *)a3
{
  btDeviceDict = self->_btDeviceDict;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:"));
  uint64_t v7 = (AXTVCoreBluetoothDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](btDeviceDict, "objectForKey:", v6));

  if (v7)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    id v10 = AddressForBTDevice((uint64_t)a3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v11 = (AXTVCoreBluetoothDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_btAddrDict, "objectForKey:", v8));
    if (v11)
    {
      uint64_t v7 = v11;
      if (-[AXTVCoreBluetoothDevice device](v11, "device") != a3) {
        -[AXTVCoreBluetoothDevice setDevice:](v7, "setDevice:", a3);
      }
    }

    else if (v8)
    {
      int v25 = 0;
      BTDeviceGetDeviceType(a3, &v25);
      uint64_t v7 = -[AXTVCoreBluetoothDevice initWithDevice:address:]( objc_alloc(&OBJC_CLASS___AXTVCoreBluetoothDevice),  "initWithDevice:address:",  a3,  v8);
      if (-[AXTVCoreBluetoothManager _isValidBrailleDevice:](self, "_isValidBrailleDevice:", v7)) {
        uint64_t v22 = @"Device is valid braille device. will add. %@";
      }
      else {
        uint64_t v22 = @"Device is not a valid braille device. will ignore. %@";
      }
      _AXTVBTLog(0LL, 1LL, v22, v17, v18, v19, v20, v21, (uint64_t)v7);
      -[NSMutableDictionary setObject:forKey:](self->_btAddrDict, "setObject:forKey:", v7, v8);
      uint64_t v23 = self->_btDeviceDict;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", a3));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v7, v24);
    }

    else
    {
      _AXTVBTLog( 16LL,  1LL,  @"Failed to retrieve address for BTDevice %p. BluetoothManager may be thoroughly confused.",  v12,  v13,  v14,  v15,  v16,  (uint64_t)a3);
      uint64_t v7 = 0LL;
    }
  }

  return v7;
}

- (void)_removeDevice:(id)a3
{
  id v8 = a3;
  if (([v8 paired] & 1) == 0)
  {
    btAddrDict = self->_btAddrDict;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 address]);
    -[NSMutableDictionary removeObjectForKey:](btAddrDict, "removeObjectForKey:", v5);

    btDeviceDict = self->_btDeviceDict;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", [v8 device]));
    -[NSMutableDictionary removeObjectForKey:](btDeviceDict, "removeObjectForKey:", v7);
  }
}

- (BOOL)wasDeviceDiscovered:(id)a3
{
  id v4 = a3;
  unint64_t v16 = 0LL;
  uint64_t Devices = BTDiscoveryAgentGetDevices(self->_discoveryAgent, v17, &v16, 256LL);
  if ((_DWORD)Devices)
  {
    _AXTVBTLog(16LL, 1LL, @"failed to get discovered devices with error %d", v6, v7, v8, v9, v10, Devices);
LABEL_3:
    BOOL v11 = 0;
    goto LABEL_4;
  }

  if (!v16) {
    goto LABEL_3;
  }
  for (unint64_t i = 0LL; i < v16; ++i)
  {
    id v14 = [v4 device];
    id v15 = (id)v17[i];
    BOOL v11 = v14 == v15;
    if (v14 == v15) {
      break;
    }
  }

- (BOOL)deviceScanningEnabled
{
  return self->_scanningEnabled;
}

- (BOOL)deviceScanningInProgress
{
  return self->_scanningInProgress;
}

- (void)resetDeviceScanning
{
  p_discoveryAgent = &self->_discoveryAgent;
  if (self->_discoveryAgent)
  {
    BTDiscoveryAgentDestroy(&self->_discoveryAgent, a2);
    *p_discoveryAgent = 0LL;
  }

- (void)_scanForServices:(unsigned int)a3 withMode:(int)a4
{
  if (self->_session)
  {
    uint64_t v5 = *(void *)&a4;
    uint64_t v6 = *(void *)&a3;
    p_discoveryAgent = &self->_discoveryAgent;
    discoveryAgent = self->_discoveryAgent;
    if (!discoveryAgent)
    {
      uint64_t v15 = BTDiscoveryAgentCreate();
      if ((_DWORD)v15)
      {
        _AXTVBTLog(16LL, 1LL, @"failed to create discovery agent with error %d", v16, v17, v18, v19, v20, v15);
        return;
      }

      discoveryAgent = *p_discoveryAgent;
    }

    uint64_t started = BTDiscoveryAgentStartScan(discoveryAgent, v5, v6);
    if ((_DWORD)started)
    {
      _AXTVBTLog(16LL, 1LL, @"failed to start scanning with error %d", v10, v11, v12, v13, v14, started);
    }

    else if ((_DWORD)v5 != 4)
    {
      self->_scanningEnabled = 1;
      self->_scanningServiceMask = v6;
    }
  }

- (void)scanForServices:(unsigned int)a3
{
}

- (void)scanForConnectableDevices:(unsigned int)a3
{
}

- (void)setDeviceScanningEnabled:(BOOL)a3
{
  if (self->_session)
  {
    BOOL v8 = a3;
    if (self->_scanningEnabled != a3)
    {
      uint64_t v10 = "disabling";
      if (a3) {
        uint64_t v10 = "enabling";
      }
      _AXTVBTLog(2LL, 1LL, @"%s device scanning", v3, v4, v5, v6, v7, (uint64_t)v10);
      if (v8)
      {
        -[AXTVCoreBluetoothManager scanForServices:](self, "scanForServices:", 0xFFFFFFFFLL);
      }

      else
      {
        self->_scanningEnabled = 0;
        discoveryAgent = self->_discoveryAgent;
        if (discoveryAgent) {
          BTDiscoveryAgentStopScan(discoveryAgent, v11);
        }
      }
    }
  }

- (void)_restartScan
{
  if (self->_scanningEnabled && (discoveryAgent = self->_discoveryAgent) != 0LL)
  {
    uint64_t started = BTDiscoveryAgentStartScan(discoveryAgent, 0LL, self->_scanningServiceMask);
    if ((_DWORD)started)
    {
      _AXTVBTLog(16LL, 1LL, @"failed to restart scanning with error %d", v5, v6, v7, v8, v9, started);
      self->_scanningEnabled = 0;
    }
  }

  else
  {
    -[AXTVCoreBluetoothManager postNotification:]( self,  "postNotification:",  @"AXTVCoreBluetoothDiscoveryStoppedNotification");
  }

- (void)_setScanState:(int)a3
{
  self->_scanningInProgress = a3 == 0;
}

- (void)_discoveryStateChanged
{
}

- (void)_advertisingChanged
{
}

- (BOOL)isDiscoverable
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int v10 = 0;
    uint64_t Discoverable = BTLocalDeviceGetDiscoverable(localDevice, &v10);
    if ((_DWORD)Discoverable) {
      _AXTVBTLog(16LL, 1LL, @"failed to get discoverable status with error %d", v4, v5, v6, v7, v8, Discoverable);
    }
    LOBYTE(localDevice) = v10 != 0;
  }

  return (char)localDevice;
}

- (void)setDiscoverable:(BOOL)a3
{
  if (self->_localDevice)
  {
    BOOL v8 = a3;
    int v10 = "disabled";
    if (a3) {
      int v10 = "enabled";
    }
    _AXTVBTLog(1LL, 1LL, @"setting discoverable status %s", v3, v4, v5, v6, v7, (uint64_t)v10);
  }

- (BOOL)devicePairingEnabled
{
  return self->_pairingAgent != 0LL;
}

- (void)setDevicePairingEnabled:(BOOL)a3
{
  if (self->_session)
  {
    BOOL v3 = a3;
    if (-[AXTVCoreBluetoothManager devicePairingEnabled](self, "devicePairingEnabled") != a3)
    {
      int v10 = "disabled";
      if (v3) {
        int v10 = "enabled";
      }
      _AXTVBTLog(1LL, 1LL, @"setting pairing %s", v5, v6, v7, v8, v9, (uint64_t)v10);
      pairingAgent = self->_pairingAgent;
      if (!v3)
      {
        if (!pairingAgent) {
          return;
        }
        BTPairingAgentStop(pairingAgent, v11);
        goto LABEL_11;
      }

      if (!pairingAgent)
      {
        uint64_t v19 = BTPairingAgentCreate(self->_session, off_801E8, self, &self->_pairingAgent);
        if ((_DWORD)v19)
        {
          _AXTVBTLog(16LL, 1LL, @"pairing agent creation failed with error %d", v20, v21, v22, v23, v24, v19);
          return;
        }
      }

      uint64_t v13 = BTPairingAgentStart();
      if ((_DWORD)v13)
      {
        _AXTVBTLog(16LL, 1LL, @"failed to start pairing agent with error %d", v14, v15, v16, v17, v18, v13);
LABEL_11:
        BTPairingAgentDestroy(&self->_pairingAgent);
        self->_pairingAgent = 0LL;
      }
    }
  }

- (void)cancelPairing
{
  pairingAgent = self->_pairingAgent;
  if (pairingAgent)
  {
    uint64_t v3 = BTPairingAgentCancelPairing(pairingAgent, a2);
    if ((_DWORD)v3) {
      _AXTVBTLog(16LL, 1LL, @"failed to cancel pairing with error %d", v4, v5, v6, v7, v8, v3);
    }
  }

- (void)unpairDevice:(id)a3
{
  id v21 = a3;
  -[AXTVCoreBluetoothManager cancelPairing](self, "cancelPairing");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
  _AXTVBTLog(1LL, 1LL, @"unpairing device %@", v5, v6, v7, v8, v9, (uint64_t)v4);

  if (BTPairingAgentDeletePairedDevice(self->_pairingAgent, [v21 device]))
  {
    _AXTVBTLog(16LL, 1LL, @"failed to unpair from device %@ with error %d", v10, v11, v12, v13, v14, (uint64_t)v21);
  }

  else
  {
    -[AXTVCoreBluetoothManager postNotificationName:object:]( self,  "postNotificationName:object:",  @"AXTVCoreBluetoothDeviceUnpairedNotification",  v21);
    _AXTVBTLog(1LL, 1LL, @"Since we're unpairing, clear cached name", v15, v16, v17, v18, v19, v20);
    [v21 _clearName];
  }
}

- (id)pairedDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (self->_localDevice)
  {
    unint64_t v14 = 0LL;
    Paireduint64_t Devices = BTLocalDeviceGetPairedDevices(self->_localDevice, v13, &v14, 256LL);
    if ((_DWORD)PairedDevices)
    {
      _AXTVBTLog(16LL, 1LL, @"failed to get paired devices with error %d", v5, v6, v7, v8, v9, PairedDevices);
    }

    else if (v14)
    {
      for (unint64_t i = 0LL; i < v14; ++i)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothManager addDeviceIfNeeded:](self, "addDeviceIfNeeded:", v13[i]));
        if (v11) {
          [v3 addObject:v11];
        }
      }
    }
  }

  return v3;
}

- (void)setPincode:(id)a3 forDevice:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  _AXTVBTLog(2LL, 1LL, @"setting pincode '%@' for device %@", v7, v8, v9, v10, v11, (uint64_t)v14);
  pairingAgent = self->_pairingAgent;
  if (v14) {
    BTPairingAgentSetPincode( pairingAgent, [v6 device], objc_msgSend(v14, "UTF8String"));
  }
  else {
    BTPairingAgentCancelPairing(pairingAgent, v12);
  }
}

- (void)acceptSSP:(int64_t)a3 forDevice:(id)a4
{
  id v19 = a4;
  _AXTVBTLog(1LL, 1LL, @"accepting SSP with error code %ld for device %@", v6, v7, v8, v9, v10, a3);
  pairingAgent = self->_pairingAgent;
  id v12 = [v19 device];

  uint64_t v13 = BTPairingAgentAcceptSSP(pairingAgent, v12, a3);
  if ((_DWORD)v13) {
    _AXTVBTLog(16LL, 1LL, @"failed to accept SSP with error %d", v14, v15, v16, v17, v18, v13);
  }
}

- (void)_pairedStatusChanged
{
}

- (id)localAddress
{
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v3));
  }
}

- (void)connectDevice:(id)a3 withServices:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v16 = a3;
  _AXTVBTLog(1LL, 1LL, @"connecting to device %@", v5, v6, v7, v8, v9, (uint64_t)v16);
  if ((([v16 isServiceSupported:16] & 1) != 0
     || [v16 isServiceSupported:1])
    && ([v16 isAppleAudioDevice] & 1) == 0)
  {
    uint64_t v10 = objc_opt_new(&OBJC_CLASS___AXTVCoreRemoteDeviceManager);
    -[AXTVCoreRemoteDeviceManager disconnectDevice:](v10, "disconnectDevice:", v16);
  }
}

- (void)connectDevice:(id)a3
{
}

- (void)disconnectDevice:(id)a3
{
  id v13 = a3;
  _AXTVBTLog(1LL, 1LL, @"disconnecting device %@", v3, v4, v5, v6, v7, (uint64_t)v13);
}

- (BOOL)connectable
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int v10 = 0;
    uint64_t Connectable = BTLocalDeviceGetConnectable(localDevice, &v10);
    if ((_DWORD)Connectable) {
      _AXTVBTLog(16LL, 1LL, @"failed to get connectable state with error %d", v4, v5, v6, v7, v8, Connectable);
    }
    LOBYTE(localDevice) = v10 != 0;
  }

  return (char)localDevice;
}

- (void)setConnectable:(BOOL)a3
{
  if (self->_localDevice)
  {
    int v8 = a3;
    int v10 = "disabled";
    if (a3) {
      int v10 = "enabled";
    }
    _AXTVBTLog(1LL, 1LL, @"setting connectable %s", v3, v4, v5, v6, v7, (uint64_t)v10);
    BTLocalDeviceSetConnectable(self->_localDevice, (v8 << 31 >> 31));
  }

- (id)connectingDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (self->_localDevice)
  {
    unint64_t v14 = 0LL;
    Connectinguint64_t Devices = BTLocalDeviceGetConnectingDevices(self->_localDevice, v13, &v14, 256LL);
    if ((_DWORD)ConnectingDevices)
    {
      _AXTVBTLog( 16LL,  1LL,  @"failed to get connecting devices with error %d",  v5,  v6,  v7,  v8,  v9,  ConnectingDevices);
    }

    else if (v14)
    {
      for (unint64_t i = 0LL; i < v14; ++i)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothManager addDeviceIfNeeded:](self, "addDeviceIfNeeded:", v13[i]));
        if (v11) {
          [v3 addObject:v11];
        }
      }
    }
  }

  return v3;
}

- (id)connectedDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (self->_localDevice)
  {
    unint64_t v14 = 0LL;
    Connecteduint64_t Devices = BTLocalDeviceGetConnectedDevices(self->_localDevice, v13, &v14, 256LL);
    if ((_DWORD)ConnectedDevices)
    {
      _AXTVBTLog( 16LL,  1LL,  @"failed to get connected devices with error %d",  v5,  v6,  v7,  v8,  v9,  ConnectedDevices);
    }

    else if (v14)
    {
      for (unint64_t i = 0LL; i < v14; ++i)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothManager addDeviceIfNeeded:](self, "addDeviceIfNeeded:", v13[i]));
        if (v11) {
          [v3 addObject:v11];
        }
      }
    }
  }

  return v3;
}

- (BOOL)connected
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int v10 = 0;
    uint64_t ConnectionStatus = BTLocalDeviceGetConnectionStatus(localDevice, &v10);
    if ((_DWORD)ConnectionStatus) {
      _AXTVBTLog( 16LL,  1LL,  @"failed to get connection status with error %d",  v4,  v5,  v6,  v7,  v8,  ConnectionStatus);
    }
    LOBYTE(localDevice) = v10 == -1;
  }

  return (char)localDevice;
}

- (void)_connectedStatusChanged
{
}

- (void)_connectabilityChanged
{
}

- (BOOL)audioConnected
{
  return self->_audioConnected;
}

- (void)setAudioConnected:(BOOL)a3
{
  if (self->_audioConnected != a3) {
    self->_audioConnected = a3;
  }
}

- (void)startVoiceCommand:(id)a3
{
  id v8 = a3;
  if (BTDeviceSetServiceSettings( [v8 device],  1,  "com.apple.BT.VoiceCommand.State",  "true")) {
    _AXTVBTLog( 16LL,  1LL,  @"failed to start voice command for device %@ with error %d",  v3,  v4,  v5,  v6,  v7,  (uint64_t)v8);
  }
}

- (void)endVoiceCommand:(id)a3
{
  id v8 = a3;
  if (BTDeviceSetServiceSettings( [v8 device],  1,  "com.apple.BT.VoiceCommand.State",  "false")) {
    _AXTVBTLog( 16LL,  1LL,  @"failed to end voice command for device %@ with error %d",  v3,  v4,  v5,  v6,  v7,  (uint64_t)v8);
  }
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int v6 = 0;
    else {
      BOOL v4 = v6 == 0;
    }
    LOBYTE(localDevice) = !v4;
  }

  return (char)localDevice;
}

- (void)enableTestMode
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    uint64_t v3 = BTLocalDeviceEnableDUTMode(localDevice, a2);
    if ((_DWORD)v3) {
      _AXTVBTLog(16LL, 1LL, @"enabling test mode failed with %d", v4, v5, v6, v7, v8, v3);
    }
    else {
      _AXTVBTLog(1LL, 1LL, @"BT Test Mode enabled.", v4, v5, v6, v7, v8, v9);
    }
  }

- (BOOL)_isValidBrailleDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  if ([v5 length])
  {
    if (!self->_brailleDriverDeviceDetectionInfo)
    {
      uint64_t v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSBundle brailleDriverDeviceDetectionInfo]( &OBJC_CLASS___NSBundle,  "brailleDriverDeviceDetectionInfo"));
      brailleDriverDeviceDetectionInfo = self->_brailleDriverDeviceDetectionInfo;
      self->_brailleDriverDeviceDetectionInfo = v6;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForEvaluatedObject]( &OBJC_CLASS___NSExpression,  "expressionForEvaluatedObject"));
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v8 = self->_brailleDriverDeviceDetectionInfo;
    id v9 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v51,  v56,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v52;
      uint64_t v12 = &AFPreferencesAssistantEnabled_ptr;
      id v42 = v4;
      v43 = v8;
      uint64_t v39 = *(void *)v52;
      v40 = self;
      do
      {
        id v13 = 0LL;
        id v41 = v10;
        do
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)v13);
          LOBYTE(v46) = 0;
          uint64_t v15 = objc_opt_class(v12[266]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleDriverDeviceDetectionInfo, "objectForKey:", v14));
          uint64_t v17 = __UIAccessibilityCastAsClass(v15, v16, 1LL, &v46);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

          if ((_BYTE)v46) {
            abort();
          }
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:kSCROBrailleDriverBluetoothSearchDictionary]);

          if (v19)
          {
            uint64_t v20 = objc_opt_class(v12[266]);
            if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:kSCROBrailleDriverBluetoothDeviceNameRegexPatterns]);
              __int128 v47 = 0u;
              __int128 v48 = 0u;
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              id v22 = v21;
              id v23 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
              if (v23)
              {
                id v24 = v23;
                uint64_t v25 = *(void *)v48;
                while (2)
                {
                  for (unint64_t i = 0LL; i != v24; unint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v48 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    id v27 = [objc_allocWithZone(NSConstantValueExpression) initWithObject:*(void *)(*((void *)&v47 + 1) + 8 * (void)i)];
                    id v28 = [objc_allocWithZone(NSComparisonPredicate) initWithLeftExpression:v44 rightExpression:v27 modifier:0 type:6 options:0];
                    unsigned int v29 = [v28 evaluateWithObject:v5];

                    if (v29)
                    {

                      LOBYTE(v36) = 1;
                      id v4 = v42;
                      goto LABEL_31;
                    }
                  }

                  id v24 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
                  if (v24) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v11 = v39;
              self = v40;
              uint64_t v8 = v43;
              uint64_t v12 = &AFPreferencesAssistantEnabled_ptr;
              id v10 = v41;
            }
          }

          id v13 = (char *)v13 + 1;
        }

        while (v13 != v10);
        id v10 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v51,  v56,  16LL);
        id v4 = v42;
      }

      while (v10);
    }

    int v46 = 0;
    BTDeviceGetSupportedServices([v4 device], &v46);
    int v45 = 0;
    BTDeviceGetDeviceType([v4 device], &v45);
    int v35 = (v45 != 25) & (v46 >> 5);
    if (v45 == 26) {
      int v35 = 0;
    }
    if (v45 == 16) {
      BOOL v36 = 0;
    }
    else {
      BOOL v36 = v35;
    }
    if (v36) {
      _AXTVBTLog( 1LL,  1LL,  @"Device invalid by classic check, but valid for HID bluetooth braille device",  v30,  v31,  v32,  v33,  v34,  v38);
    }
LABEL_31:
  }

  else
  {
    LOBYTE(v36) = 0;
  }

  return v36;
}

- (NSDictionary)brailleDriverDeviceDetectionInfo
{
  return self->_brailleDriverDeviceDetectionInfo;
}

- (void)setBrailleDriverDeviceDetectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end