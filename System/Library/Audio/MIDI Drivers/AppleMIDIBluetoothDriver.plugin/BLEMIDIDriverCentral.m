@interface BLEMIDIDriverCentral
- (BLEMIDIDriverCentral)init;
- (BLEMIDIDriverCentral)initWithDriver:(MIDIDriverInterface *)a3;
- (BOOL)isAlreadyConnectedAsCentral:(id)a3;
- (BOOL)isLECapableHardware;
- (BOOL)verifyBLEDevice:(id)a3;
- (CBCentralManager)centralManager;
- (MIDIDriverInterface)driver;
- (id)deviceForEP:(unsigned int)a3;
- (id)deviceForMIDIDevice:(unsigned int)a3;
- (id)deviceForPeripheral:(id)a3;
- (id)deviceForUUID:(id)a3;
- (id)midiCharacteristicForPeripheral:(id)a3;
- (id)peripheralWithUUID:(id)a3;
- (id)validatePeripheral:(void *)a3;
- (id)verifyUUIDDiscovery:(id)a3;
- (unsigned)createDevice:(id)a3;
- (void)activateConnectedUUIDs;
- (void)activateUUID:(id)a3 withName:(id)a4;
- (void)cancelAllConnections;
- (void)cancelConnectionForPeripheral:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdateConnectionParameters:(id)a4 interval:(id)a5 latency:(id)a6 supervisionTimeout:(id)a7;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkChangeDeviceName:(unsigned int)a3 withName:(id)a4;
- (void)connectDevice:(unsigned int)a3 withMTU:(unsigned int)a4;
- (void)dealloc;
- (void)disconnectDevice:(unsigned int)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)removeDeviceForPeripheral:(id)a3;
- (void)removeDeviceForUUID:(id)a3;
- (void)resetAllConnectedDevices;
- (void)resetDevice:(unsigned int)a3;
- (void)startScan;
- (void)stopScan;
- (void)xpcReceiveUUID:(id)a3 withName:(id)a4;
@end

@implementation BLEMIDIDriverCentral

- (BLEMIDIDriverCentral)init
{
  v2 = (os_log_s *)qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "BTLEMIDIDriverCentral.mm";
    __int16 v6 = 1024;
    int v7 = 40;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: Do not use init. Use initWitDriver instead.",  (uint8_t *)&v4,  0x12u);
  }

  return 0LL;
}

- (BLEMIDIDriverCentral)initWithDriver:(MIDIDriverInterface *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BLEMIDIDriverCentral;
  int v4 = -[BLEMIDIDriverCentral init](&v8, "init");
  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___CBCentralManager);
    __int16 v6 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    v4->centralManager = -[CBCentralManager initWithDelegate:queue:options:]( v5,  "initWithDelegate:queue:options:",  v4,  0LL,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v6,  CBCentralManagerOptionReceiveSystemEvents,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL),  CBCentralManagerOptionShowPowerAlertKey,  0LL));
    v4->connectedDevices = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
    v4->connectedPeripherals = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
    v4->peripheralsToConnect = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
    v4->xpcUUIDs = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
    v4->xpcNames = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
    v4->driver = a3;
    v4->connectionIntervalNanos = 11250000LL;
  }

  return v4;
}

- (void)dealloc
{
  self->centralManager = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BLEMIDIDriverCentral;
  -[BLEMIDIDriverCentral dealloc](&v3, "dealloc");
}

- (BOOL)isLECapableHardware
{
  unint64_t v2 = (unint64_t)-[CBCentralManager state](self->centralManager, "state");
  return v2 < 6 && (v2 & 0x3F) == 5;
}

- (void)startScan
{
  objc_super v3 = (os_log_s *)qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v6 = "BTLEMIDIDriverCentral.mm";
    __int16 v7 = 1024;
    int v8 = 117;
    __int16 v9 = 2080;
    v10 = "03B80E5A-EDE8-4B33-A751-6CE34EC4C700";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%25s:%-5d Driver scanning for service %s", buf, 0x1Cu);
  }

  int v4 = +[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700");
  -[CBCentralManager scanForPeripheralsWithServices:options:]( self->centralManager,  "scanForPeripheralsWithServices:options:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL),  0LL);
}

- (void)stopScan
{
}

- (void)activateConnectedUUIDs
{
  objc_super v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  centralManager = self->centralManager;
  v27 = +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700");
  v5 = -[CBCentralManager retrieveConnectedPeripheralsWithServices:]( centralManager,  "retrieveConnectedPeripheralsWithServices:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (!+[BLEMIDIAccessor midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:]( BLEMIDIAccessor,  "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:",  objc_msgSend(objc_msgSend(v10, "identifier"), "UUIDString"),  1,  0)) {
          objc_msgSend(v3, "addObject:", objc_msgSend(objc_msgSend(v10, "identifier"), "UUIDString"));
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    }

    while (v7);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v3);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)j);
        if (-[NSMutableArray containsObject:](self->xpcUUIDs, "containsObject:", v15)) {
          id v16 = -[NSMutableArray objectAtIndex:]( self->xpcNames,  "objectAtIndex:",  -[NSMutableArray indexOfObject:](self->xpcUUIDs, "indexOfObject:", v15));
        }
        else {
          id v16 = 0LL;
        }
        -[BLEMIDIDriverCentral activateUUID:withName:](self, "activateUUID:withName:", v15, v16);
      }

      id v12 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->xpcUUIDs, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->xpcNames, "removeAllObjects");
}

- (void)activateUUID:(id)a3 withName:(id)a4
{
  id v7 = (os_log_s *)qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v42 = "BTLEMIDIDriverCentral.mm";
    __int16 v43 = 1024;
    int v44 = 162;
    __int16 v45 = 2112;
    id v46 = a3;
    __int16 v47 = 2112;
    id v48 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d activateUUID: %@ withName: %@", buf, 0x26u);
  }

  id v8 = +[BLEMIDIAccessor midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:]( &OBJC_CLASS___BLEMIDIAccessor,  "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:",  a3,  0LL,  1LL);
  sub_5DB0();
  __int16 v9 = (os_log_s *)qword_1DDB8;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO);
  if ((_DWORD)v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315650;
      v42 = "BTLEMIDIDriverCentral.mm";
      __int16 v43 = 1024;
      int v44 = 165;
      __int16 v45 = 1024;
      LODWORD(v46) = (_DWORD)v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%25s:%-5d found device: %d", buf, 0x18u);
    }

    -[BLEMIDIDriverCentral checkChangeDeviceName:withName:](self, "checkChangeDeviceName:withName:", v8, a4);
    goto LABEL_14;
  }

  if (v10)
  {
    *(_DWORD *)buf = 136315394;
    v42 = "BTLEMIDIDriverCentral.mm";
    __int16 v43 = 1024;
    int v44 = 170;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d No remote device found. Checking local devices ...",  buf,  0x12u);
  }

  id v8 = +[BLEMIDIAccessor midiDeviceForUUID:](&OBJC_CLASS___BLEMIDIAccessor, "midiDeviceForUUID:", a3);
  sub_5DB0();
  id v11 = (os_log_s *)qword_1DDB8;
  BOOL v12 = os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO);
  if ((_DWORD)v8)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315650;
      v42 = "BTLEMIDIDriverCentral.mm";
      __int16 v43 = 1024;
      int v44 = 173;
      __int16 v45 = 1024;
      LODWORD(v46) = (_DWORD)v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%25s:%-5d Resetting local device: %d", buf, 0x18u);
    }

    -[BLEMIDIDriverCentral resetDevice:](self, "resetDevice:", v8);
LABEL_14:
    -[BLEMIDIDriverCentral checkChangeDeviceName:withName:](self, "checkChangeDeviceName:withName:", v8, a4);
    id v13 = -[BLEMIDIDriverCentral verifyUUIDDiscovery:](self, "verifyUUIDDiscovery:", a3);
    if (v13)
    {
      -[BLEMIDIDriverCentral connectDevice:withMTU:]( self,  "connectDevice:withMTU:",  v8,  [v13 mtuLength] - 3);
      return;
    }

    sub_5DB0();
    v14 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "BTLEMIDIDriverCentral.mm";
      __int16 v43 = 1024;
      int v44 = 182;
      __int16 v45 = 2112;
      id v46 = a3;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%25s:%-5d Will perform discovery for UUID %@", buf, 0x1Cu);
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    connectedPeripherals = self->connectedPeripherals;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedPeripherals,  "countByEnumeratingWithState:objects:count:",  &v36,  v40,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v37;
LABEL_20:
      uint64_t v19 = 0LL;
      while (1)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(connectedPeripherals);
        }
        __int128 v20 = *(void **)(*((void *)&v36 + 1) + 8 * v19);
        if (objc_msgSend( objc_msgSend(objc_msgSend(v20, "identifier"), "UUIDString"),  "isEqualToString:",  a3)) {
          break;
        }
        if (v17 == (id)++v19)
        {
          id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedPeripherals,  "countByEnumeratingWithState:objects:count:",  &v36,  v40,  16LL);
          if (v17) {
            goto LABEL_20;
          }
          goto LABEL_38;
        }
      }

      sub_5DB0();
      v27 = (os_log_s *)qword_1DDB8;
      if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "BTLEMIDIDriverCentral.mm";
        __int16 v43 = 1024;
        int v44 = 188;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "%25s:%-5d Peripheral is already in connectedPeripherals",  buf,  0x12u);
      }

      sub_5DB0();
      v30 = (os_log_s *)qword_1DDB8;
      if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v42 = "BTLEMIDIDriverCentral.mm";
        __int16 v43 = 1024;
        int v44 = 194;
        __int16 v45 = 2112;
        id v46 = v20;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%25s:%-5d %@ needs to be reconnected.", buf, 0x1Cu);
      }

      id v28 = v20;
      -[NSMutableArray removeObject:](self->connectedPeripherals, "removeObject:", v20);
      if (v28) {
        goto LABEL_39;
      }
      goto LABEL_46;
    }

- (void)cancelAllConnections
{
  centralManager = self->centralManager;
  id v13 = +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700");
  int v4 = -[CBCentralManager retrieveConnectedPeripheralsWithServices:]( centralManager,  "retrieveConnectedPeripheralsWithServices:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[BLEMIDIDriverCentral cancelConnectionForPeripheral:]( self,  "cancelConnectionForPeripheral:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

- (void)checkChangeDeviceName:(unsigned int)a3 withName:(id)a4
{
  if (a3)
  {
    if (a4) {
      MIDIObjectSetStringProperty(a3, kMIDIPropertyName, (CFStringRef)a4);
    }
  }

- (unsigned)createDevice:(id)a3
{
  MIDIDeviceRef outDevice = 0;
  driver = self->driver;
  id v5 = sub_10518();
  uint64_t v6 = sub_10524();
  id v7 = sub_10530();
  OSStatus v8 = MIDIDeviceCreate(driver, v5, v6, v7, &outDevice);
  if (v8)
  {
    OSStatus v9 = v8;
    sub_5DB0();
    __int128 v10 = (os_log_s *)qword_1DDB8;
    unsigned int result = os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "BTLEMIDIDriverCentral.mm";
      __int16 v16 = 1024;
      int v17 = 265;
      __int16 v18 = 1024;
      LODWORD(v19) = v9;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: MIDIDeviceCreate failed with error %d",  buf,  0x18u);
      return 0;
    }
  }

  else
  {
    MIDIObjectSetIntegerProperty(outDevice, @"MIDI Input Supported", 0);
    MIDIObjectSetIntegerProperty(outDevice, @"MIDI Output Supported", 0);
    MIDIObjectSetStringProperty(outDevice, @"BLE MIDI Device UUID", (CFStringRef)a3);
    MIDIObjectSetIntegerProperty(outDevice, @"MIDI Local Peripheral", 0);
    MIDIObjectSetIntegerProperty(outDevice, @"MIDI Remote Peripheral", 1);
    MIDIObjectSetIntegerProperty(outDevice, kMIDIPropertyOffline, 1);
    MIDISetupAddDevice(outDevice);
    sub_5DB0();
    BOOL v12 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "BTLEMIDIDriverCentral.mm";
      __int16 v16 = 1024;
      int v17 = 284;
      __int16 v18 = 2112;
      id v19 = a3;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%25s:%-5d Created device with Bluetooth UUID %@", buf, 0x1Cu);
    }

    return outDevice;
  }

  return result;
}

- (void)connectDevice:(unsigned int)a3 withMTU:(unsigned int)a4
{
  LODWORD(v4) = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = +[BLEMIDIAccessor uuidForMIDIDevice:](&OBJC_CLASS___BLEMIDIAccessor, "uuidForMIDIDevice:");
  id v8 = -[BLEMIDIDriverCentral peripheralWithUUID:](self, "peripheralWithUUID:", v7);
  if ((-[NSMutableArray containsObject:](self->connectedPeripherals, "containsObject:", v8) & 1) == 0)
  {
    sub_5DB0();
    uint64_t v15 = qword_1DDB8;
    if (!os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    id v28 = "BTLEMIDIDriverCentral.mm";
    __int16 v29 = 1024;
    int v30 = 296;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v16 = "%25s:%-5d ERROR: Can't call connectDevice on on MIDIDevice with UUID %@ because the peripheral is not connected.";
    int v17 = (os_log_s *)v15;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_12:
    _os_log_impl(&dword_0, v17, v18, v16, buf, 0x1Cu);
    return;
  }

  if (!v8)
  {
    sub_5DB0();
    uint64_t v19 = qword_1DDB8;
    if (!os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    id v28 = "BTLEMIDIDriverCentral.mm";
    __int16 v29 = 1024;
    int v30 = 371;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v16 = "%25s:%-5d connectDevice peripheral with UUID %@ not found!";
    int v17 = (os_log_s *)v19;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    goto LABEL_12;
  }

  id v9 = -[BLEMIDIDriverCentral midiCharacteristicForPeripheral:](self, "midiCharacteristicForPeripheral:", v8);
  __int128 v10 = v9;
  if (v9)
  {
    id v11 = [v9 properties];
    sub_5DB0();
    BOOL v12 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      id v28 = "BTLEMIDIDriverCentral.mm";
      __int16 v29 = 1024;
      int v30 = 307;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2048;
      id v34 = v11;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d Found a MIDI I/O characteristic for peripheral: %@, props: 0x%lX)",  buf,  0x26u);
    }

    unsigned int v13 = (v11 >> 4) & 1;
    unsigned int v14 = (v11 >> 2) & 1;
    if (v13 | v14) {
      goto LABEL_17;
    }
  }

  else
  {
    unsigned int v13 = 0;
    unsigned int v14 = 0;
  }

  sub_5DB0();
  __int128 v20 = (os_log_s *)qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v28 = "BTLEMIDIDriverCentral.mm";
    __int16 v29 = 1024;
    int v30 = 314;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "%25s:%-5d Could not locate a usable MIDI I/O characteristic on peripheral with UUID %@. Canceling connection.",  buf,  0x1Cu);
  }

  -[BLEMIDIDriverCentral cancelConnectionForPeripheral:](self, "cancelConnectionForPeripheral:", v8);
LABEL_17:
  MIDIObjectSetIntegerProperty(v5, @"MIDI Output Supported", v13);
  MIDIObjectSetIntegerProperty(v5, @"MIDI Input Supported", v14);
  id v21 = -[BLEMIDIDriverCentral deviceForPeripheral:](self, "deviceForPeripheral:", v8);
  if (v21) {
    -[NSMutableArray removeObject:](self->connectedDevices, "removeObject:", v21);
  }
  if ((_DWORD)v4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 20LL;
  }
  id v22 =  -[BLEMIDIDevice initWithPeripheral:mtu:]( objc_alloc(&OBJC_CLASS___BLEMIDIDevice),  "initWithPeripheral:mtu:",  v8,  v4);
  -[BLEMIDIDevice setDev:](v22, "setDev:", v5);
  -[BLEMIDIDevice setUuid:](v22, "setUuid:", v7);
  -[BLEMIDIDevice setPeripheral:](v22, "setPeripheral:", v8);
  -[BLEMIDIDevice setUsage:](v22, "setUsage:", 0LL);
  -[NSMutableArray addObject:](self->connectedDevices, "addObject:", v22);
  MIDIEntityRef Entity = MIDIDeviceGetEntity(v5, 0LL);
  newMIDIEntityRef Entity = Entity;
  if (Entity)
  {
    MIDIEntityAddOrRemoveEndpoints(Entity, v13, v14);
  }

  else
  {
    __int128 v24 = sub_10548();
    if (MIDIDeviceAddEntity(v5, v24, 1u, v13, v14, &newEntity))
    {
      sub_5DB0();
      v25 = (os_log_s *)qword_1DDB8;
      if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v28 = "BTLEMIDIDriverCentral.mm";
        __int16 v29 = 1024;
        int v30 = 339;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Unable to create an entity for this MIDI device. Please try again.",  buf,  0x12u);
      }

      -[BLEMIDIDevice setDev:](v22, "setDev:", 0LL);
      -[BLEMIDIDriverCentral cancelConnectionForPeripheral:](self, "cancelConnectionForPeripheral:", v8);
    }
  }

  if (v13)
  {
    -[BLEMIDIDevice setOutEndpoint:](v22, "setOutEndpoint:", MIDIEntityGetSource(newEntity, 0LL));
    -[BLEMIDIDevice setDataReceiver:]( v22,  "setDataReceiver:",   -[BLEMIDIDataReceiver initWithEndpoint:owner:]( objc_alloc(&OBJC_CLASS___BLEMIDIDataReceiver),  "initWithEndpoint:owner:",  -[BLEMIDIDevice outEndpoint](v22, "outEndpoint"),  self->driver));
    [v8 setNotifyValue:1 forCharacteristic:v10];
  }

  if (v14)
  {
    -[BLEMIDIDevice setInEndpoint:](v22, "setInEndpoint:", MIDIEntityGetDestination(newEntity, 0LL));
    MIDIEndpointSetRefCons(-[BLEMIDIDevice inEndpoint](v22, "inEndpoint"), v8, v10);
  }

  if (objc_msgSend( +[BLEMIDIAccessor nameForMIDIDevice:](BLEMIDIAccessor, "nameForMIDIDevice:", v5),  "isEqualToString:",  sub_10518())
    && [v8 name]
    && (objc_msgSend(objc_msgSend(v8, "name"), "isEqualToString:", &stru_18AD0) & 1) == 0)
  {
    MIDIObjectSetStringProperty(v5, kMIDIPropertyName, (CFStringRef)[v8 name]);
  }

  MIDIObjectSetIntegerProperty(v5, kMIDIPropertyOffline, 0);
}

- (void)disconnectDevice:(unsigned int)a3
{
  if (!a3)
  {
    sub_5DB0();
    uint64_t v6 = qword_1DDB8;
    if (!os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v11 = 136315394;
    BOOL v12 = "BTLEMIDIDriverCentral.mm";
    __int16 v13 = 1024;
    int v14 = 378;
    id v7 = "%25s:%-5d Called disconnectDevice with a 0 MIDIDeviceRef. Please file a bug report for CoreMIDI.";
    id v8 = (os_log_s *)v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

  id v4 = -[BLEMIDIDriverCentral deviceForMIDIDevice:](self, "deviceForMIDIDevice:");
  if (v4)
  {
    uint64_t v5 = v4;
    MIDIObjectSetIntegerProperty((MIDIObjectRef)[v4 dev], kMIDIPropertyOffline, 1);
    -[BLEMIDIDriverCentral removeDeviceForPeripheral:]( self,  "removeDeviceForPeripheral:",  [v5 peripheral]);
    return;
  }

  sub_5DB0();
  uint64_t v10 = qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    BOOL v12 = "BTLEMIDIDriverCentral.mm";
    __int16 v13 = 1024;
    int v14 = 388;
    id v7 = "%25s:%-5d The central doesn't know anything about this device (was connectDevice called?).";
    id v8 = (os_log_s *)v10;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
LABEL_8:
    _os_log_impl(&dword_0, v8, v9, v7, (uint8_t *)&v11, 0x12u);
  }

- (void)resetDevice:(unsigned int)a3
{
}

- (id)verifyUUIDDiscovery:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  connectedPeripherals = self->connectedPeripherals;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedPeripherals,  "countByEnumeratingWithState:objects:count:",  &v14,  v27,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(connectedPeripherals);
        }
        os_log_type_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(objc_msgSend(v9, "identifier"), "UUIDString"),  "isEqualToString:",  a3))
        {
          if (v9 && [v9 state] == (char *)&dword_0 + 2)
          {
            sub_5DB0();
            uint64_t v10 = (os_log_s *)qword_1DDB8;
            if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_DEBUG))
            {
              id v11 = [v9 services];
              *(_DWORD *)buf = 136315906;
              __int128 v20 = "BTLEMIDIDriverCentral.mm";
              __int16 v21 = 1024;
              int v22 = 417;
              __int16 v23 = 2112;
              __int128 v24 = v9;
              __int16 v25 = 2112;
              id v26 = v11;
              _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d Attempting to verify discovery for %@, services = %@",  buf,  0x26u);
            }

            memset(v13, 0, sizeof(v13));
            if (objc_msgSend( objc_msgSend(v9, "services", 0),  "countByEnumeratingWithState:objects:count:",  v13,  v18,  16))
            {
              objc_msgSend( objc_msgSend(**((id **)&v13[0] + 1), "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  @"7772E5DB-3868-4112-A1A9-F2669D106BF3"));
            }
          }

          return 0LL;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedPeripherals,  "countByEnumeratingWithState:objects:count:",  &v14,  v27,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  return 0LL;
}

- (id)validatePeripheral:(void *)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  connectedPeripherals = self->connectedPeripherals;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedPeripherals,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v11;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v11 != v7) {
      objc_enumerationMutation(connectedPeripherals);
    }
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedPeripherals,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (BOOL)verifyBLEDevice:(id)a3
{
  id v3 = -[BLEMIDIDriverCentral deviceForPeripheral:]( self,  "deviceForPeripheral:",  -[BLEMIDIDriverCentral peripheralWithUUID:](self, "peripheralWithUUID:", a3));
  if (v3)
  {
    id v4 = v3;
    LODWORD(v3) = [v3 dev];
    if ((_DWORD)v3)
    {
      id v3 = [v4 uuid];
      if (v3)
      {
        if ([v4 usage])
        {
          LOBYTE(v3) = 0;
        }

        else
        {
          *(void *)outValue = 0LL;
          MIDIObjectGetIntegerProperty((MIDIObjectRef)[v4 dev], @"MIDI Output Supported", outValue);
          MIDIObjectGetIntegerProperty( (MIDIObjectRef)[v4 dev],  @"MIDI Input Supported",  &outValue[1]);
          if (!outValue[0]
            || (LODWORD(v3) = [v4 outEndpoint], (_DWORD)v3)
            && (id v3 = [v4 dataReceiver]) != 0)
          {
          }
        }
      }
    }
  }

  return (char)v3;
}

- (id)midiCharacteristicForPeripheral:(id)a3
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v3 = [a3 services];
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v26;
  uint64_t v7 = @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700";
  while (2)
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v26 != v6) {
        objc_enumerationMutation(v3);
      }
      os_log_type_t v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
      if (objc_msgSend(objc_msgSend(objc_msgSend(v9, "UUID"), "UUIDString"), "isEqualToString:", v7))
      {
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v10 = [v9 characteristics];
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v22;
          id v20 = v5;
LABEL_9:
          id v14 = v3;
          uint64_t v15 = v6;
          __int128 v16 = v7;
          uint64_t v17 = 0LL;
          while (1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            os_log_type_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
            if (objc_msgSend( objc_msgSend(objc_msgSend(v18, "UUID"), "UUIDString"),  "isEqualToString:",  @"7772E5DB-3868-4112-A1A9-F2669D106BF3")) {
              return v18;
            }
            if (v12 == (id)++v17)
            {
              id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
              uint64_t v7 = v16;
              uint64_t v6 = v15;
              id v3 = v14;
              id v5 = v20;
              if (v12) {
                goto LABEL_9;
              }
              break;
            }
          }
        }
      }
    }

    id v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    os_log_type_t v18 = 0LL;
    if (v5) {
      continue;
    }
    return v18;
  }

- (void)cancelConnectionForPeripheral:(id)a3
{
  id v5 = -[BLEMIDIDriverCentral midiCharacteristicForPeripheral:](self, "midiCharacteristicForPeripheral:");
  else {
    -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
  }
}

- (void)xpcReceiveUUID:(id)a3 withName:(id)a4
{
  if ((-[NSMutableArray containsObject:](self->xpcUUIDs, "containsObject:") & 1) != 0)
  {
    sub_5DB0();
    uint64_t v7 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315906;
      os_log_type_t v9 = "BTLEMIDIDriverCentral.mm";
      __int16 v10 = 1024;
      int v11 = 510;
      __int16 v12 = 2112;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = a4;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d xpcReceiveUUID:%@ withName:%@ already contains UUID (skipping)",  (uint8_t *)&v8,  0x26u);
    }
  }

  else
  {
    -[NSMutableArray addObject:](self->xpcUUIDs, "addObject:", a3);
    -[NSMutableArray addObject:](self->xpcNames, "addObject:", a4);
    if (-[BLEMIDIDriverCentral isLECapableHardware](self, "isLECapableHardware")) {
      -[BLEMIDIDriverCentral activateConnectedUUIDs](self, "activateConnectedUUIDs");
    }
  }

- (void)centralManagerDidUpdateState:(id)a3
{
  unsigned int v5 = -[BLEMIDIDriverCentral isLECapableHardware](self, "isLECapableHardware");
  if (self->leCapable != v5)
  {
    BOOL v6 = v5;
    sub_5DB0();
    uint64_t v7 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      int v8 = "YES";
      BOOL leCapable = self->leCapable;
      *(void *)&v12[4] = "BTLEMIDIDriverCentral.mm";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 523;
      if (leCapable) {
        __int16 v10 = "YES";
      }
      else {
        __int16 v10 = "NO";
      }
      *(_DWORD *)__int16 v12 = 136315906;
      if (!v6) {
        int v8 = "NO";
      }
      *(_WORD *)&v12[18] = 2080;
      *(void *)&v12[20] = v10;
      __int16 v13 = 2080;
      __int16 v14 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Central Manager LE Available State: %s -> %s", v12, 0x26u);
    }

    self->BOOL leCapable = v6;
    if (v6)
    {
      -[BLEMIDIDriverCentral activateConnectedUUIDs](self, "activateConnectedUUIDs");
    }

    else if ([a3 state] == (char *)&dword_0 + 1 || objc_msgSend(a3, "state") == &dword_4)
    {
      sub_5DB0();
      int v11 = (os_log_s *)qword_1DDB8;
      if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v12 = 136315394;
        *(void *)&v12[4] = "BTLEMIDIDriverCentral.mm";
        *(_WORD *)&v12[12] = 1024;
        *(_DWORD *)&v12[14] = 531;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%25s:%-5d   Setting all BLE MIDI devices to offline.",  v12,  0x12u);
      }

      -[BLEMIDIDriverCentral resetAllConnectedDevices]( self,  "resetAllConnectedDevices",  *(_OWORD *)v12,  *(void *)&v12[16]);
    }
  }

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  if (self->centralManager == a3)
  {
    sub_5DB0();
    uint64_t v7 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      int v11 = "BTLEMIDIDriverCentral.mm";
      __int16 v12 = 1024;
      int v13 = 562;
      __int16 v14 = 2112;
      id v15 = a3;
      __int16 v16 = 2112;
      id v17 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d centralManager: %@ didConnectPeripheral: %@", buf, 0x26u);
    }

    -[NSMutableArray addObject:](self->connectedPeripherals, "addObject:", a4);
    -[NSMutableArray removeObject:](self->peripheralsToConnect, "removeObject:", a4);
    if (-[BLEMIDIDriverCentral isAlreadyConnectedAsCentral:]( self,  "isAlreadyConnectedAsCentral:",  objc_msgSend(objc_msgSend(a4, "identifier"), "UUIDString")))
    {
      sub_5DB0();
      int v8 = (os_log_s *)qword_1DDB8;
      if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        int v11 = "BTLEMIDIDriverCentral.mm";
        __int16 v12 = 1024;
        int v13 = 568;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "%25s:%-5d Already connected as central. Canceling this connection.",  buf,  0x12u);
      }

      -[BLEMIDIDriverCentral cancelConnectionForPeripheral:](self, "cancelConnectionForPeripheral:", a4);
    }

    [a4 setDelegate:self];
    v9[1] = +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"180A",  +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700"));
    objc_msgSend( a4,  "discoverServices:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  }

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  if (self->centralManager == a3)
  {
    sub_5DB0();
    os_log_type_t v9 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136316162;
      int v11 = "BTLEMIDIDriverCentral.mm";
      __int16 v12 = 1024;
      int v13 = 586;
      __int16 v14 = 2112;
      id v15 = a3;
      __int16 v16 = 2112;
      id v17 = a4;
      __int16 v18 = 2112;
      id v19 = a5;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d centralManager: %@ didDisconnectPeripheral: %@ error: %@",  (uint8_t *)&v10,  0x30u);
    }

    sub_E7D0((uint64_t)(self->driver + 15), (uint64_t)a4);
    -[NSMutableArray removeObject:](self->connectedPeripherals, "removeObject:", a4);
    [a4 setDelegate:0];
    -[BLEMIDIDriverCentral disconnectDevice:]( self,  "disconnectDevice:",  +[BLEMIDIAccessor midiDeviceForUUID:]( BLEMIDIAccessor,  "midiDeviceForUUID:",  objc_msgSend(objc_msgSend(a4, "identifier"), "UUIDString")));
  }

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  if (self->centralManager == a3)
  {
    sub_5DB0();
    int v8 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      int v10 = "BTLEMIDIDriverCentral.mm";
      __int16 v11 = 1024;
      int v12 = 601;
      __int16 v13 = 2112;
      id v14 = a4;
      __int16 v15 = 2112;
      id v16 = a5;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: Failed to connect to peripheral: %@ with error = %@",  (uint8_t *)&v9,  0x26u);
    }

    -[NSMutableArray removeObject:](self->peripheralsToConnect, "removeObject:", a4);
    if (a4) {
      [a4 setDelegate:0];
    }
  }

- (void)centralManager:(id)a3 didUpdateConnectionParameters:(id)a4 interval:(id)a5 latency:(id)a6 supervisionTimeout:(id)a7
{
  if (self->centralManager == a3 && -[BLEMIDIDriverCentral deviceForPeripheral:](self, "deviceForPeripheral:", a4))
  {
    sub_5DB0();
    int v9 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      [a5 doubleValue];
      int v14 = 136315650;
      __int16 v15 = "BTLEMIDIDriverCentral.mm";
      __int16 v16 = 1024;
      int v17 = 617;
      __int16 v18 = 2048;
      unint64_t v19 = v10;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d Updated connection parameters: interval = %f ms",  (uint8_t *)&v14,  0x1Cu);
    }

    [a5 doubleValue];
    unint64_t v12 = (unint64_t)(v11 * 1000000.0);
    sub_5DB0();
    __int16 v13 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315650;
      __int16 v15 = "BTLEMIDIDriverCentral.mm";
      __int16 v16 = 1024;
      int v17 = 620;
      __int16 v18 = 2048;
      unint64_t v19 = v12;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "%25s:%-5d Changing connection interval = %llu ns",  (uint8_t *)&v14,  0x1Cu);
    }

    *((void *)self->driver + 32) = v12;
  }

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = [a3 services];
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (!v7) {
    goto LABEL_17;
  }
  id v8 = v7;
  id v15 = a4;
  __int16 v16 = self;
  int v9 = 0LL;
  char v17 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(obj);
      }
      unint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
      if (objc_msgSend( objc_msgSend(v12, "UUID", v15, v16),  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700")))
      {
        [a3 discoverCharacteristics:0 forService:v12];
        char v17 = 1;
      }

      if (objc_msgSend( objc_msgSend(v12, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"180A")))
      {
        sub_5DB0();
        __int16 v13 = (os_log_s *)qword_1DDB8;
        if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          __int128 v24 = "BTLEMIDIDriverCentral.mm";
          __int16 v25 = 1024;
          int v26 = 650;
          __int16 v27 = 2112;
          id v28 = a3;
          _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d Discovered device information service for peripheral: %@",  buf,  0x1Cu);
        }

        int v9 = v12;
      }
    }

    id v8 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
  }

  while (v8);
  a4 = v15;
  self = v16;
  if ((v17 & 1) != 0)
  {
    if (v9) {
      [a3 discoverCharacteristics:0 forService:v9];
    }
  }

  else
  {
LABEL_17:
    sub_5DB0();
    int v14 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      __int128 v24 = "BTLEMIDIDriverCentral.mm";
      __int16 v25 = 1024;
      int v26 = 654;
      __int16 v27 = 2112;
      id v28 = a3;
      __int16 v29 = 2112;
      id v30 = a4;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "%25s:%-5d MIDI service not discovered on peripheral: %@ (error: %@). Disconnecting ...",  buf,  0x26u);
    }

    -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
  }

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  if (-[BLEMIDIDriverCentral deviceForPeripheral:](self, "deviceForPeripheral:"))
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = [a4 countByEnumeratingWithState:&v12 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(a4);
          }
          if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700")))
          {
            sub_5DB0();
            double v11 = (os_log_s *)qword_1DDB8;
            if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              char v17 = "BTLEMIDIDriverCentral.mm";
              __int16 v18 = 1024;
              int v19 = 668;
              __int16 v20 = 2112;
              id v21 = a3;
              _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%25s:%-5d NOTICE: %@ has invalidated the MIDI service. Disconnecting ...",  buf,  0x1Cu);
            }

            -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
            return;
          }
        }

        id v8 = [a4 countByEnumeratingWithState:&v12 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  if (!objc_msgSend( objc_msgSend(a4, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700")))
  {
    if (!objc_msgSend( objc_msgSend(a4, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"180A"))) {
      return;
    }
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v14 = [a4 characteristics];
    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (!v15) {
      return;
    }
    id v17 = v15;
    uint64_t v18 = *(void *)v33;
    *(void *)&__int128 v16 = 136315650LL;
    __int128 v31 = v16;
LABEL_16:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v33 != v18) {
        objc_enumerationMutation(v14);
      }
      __int16 v20 = *(void **)(*((void *)&v32 + 1) + 8 * v19);
      if (!objc_msgSend( objc_msgSend(v20, "UUID", v31),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A29"))) {
        break;
      }
      [a3 readValueForCharacteristic:v20];
      sub_5DB0();
      uint64_t v21 = qword_1DDB8;
      if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v31;
        v42 = "BTLEMIDIDriverCentral.mm";
        __int16 v43 = 1024;
        int v44 = 730;
        __int16 v45 = 2112;
        *(void *)id v46 = a3;
        __int128 v22 = (os_log_s *)v21;
        __int128 v23 = "%25s:%-5d Discovered manufacturer name for %@";
LABEL_25:
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, v23, buf, 0x1Cu);
      }

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  if (objc_msgSend( objc_msgSend(a4, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  @"7772E5DB-3868-4112-A1A9-F2669D106BF3")))
  {
    id v9 = [a4 value];
    if (!a5 || v9)
    {
      id v10 = -[BLEMIDIDriverCentral deviceForPeripheral:](self, "deviceForPeripheral:", a3);
      if (v10 && (uint64_t v11 = v10, [v10 outEndpoint]))
      {
        if ([v11 dataReceiver]) {
          objc_msgSend(objc_msgSend(v11, "dataReceiver"), "unpackValue:", objc_msgSend(a4, "value"));
        }
      }

      else
      {
        sub_5DB0();
        uint64_t v21 = (os_log_s *)qword_1DDB8;
        if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315394;
          __int128 v23 = "BTLEMIDIDriverCentral.mm";
          __int16 v24 = 1024;
          int v25 = 752;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: No endpoint found for MIDI output!",  (uint8_t *)&v22,  0x12u);
        }
      }
    }

    return;
  }

  if (objc_msgSend( objc_msgSend(a4, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A29")))
  {
    __int128 v12 =  -[NSString initWithData:encoding:]( [NSString alloc],  "initWithData:encoding:",  [a4 value],  4);
    sub_5DB0();
    __int128 v13 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315650;
      __int128 v23 = "BTLEMIDIDriverCentral.mm";
      __int16 v24 = 1024;
      int v25 = 772;
      __int16 v26 = 2112;
      BOOL v27 = v12;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "%25s:%-5d Discovered manufacturer name: %@",  (uint8_t *)&v22,  0x1Cu);
    }

    id v14 = -[BLEMIDIDriverCentral deviceForPeripheral:](self, "deviceForPeripheral:", a3);
    if (v14)
    {
      id v15 = v14;
      if ([v14 dev])
      {
        MIDIObjectRef v16 = [v15 dev];
        id v17 = (CFStringRef *)&kMIDIPropertyManufacturer;
LABEL_20:
        MIDIObjectSetStringProperty(v16, *v17, v12);
      }
    }
  }

  else if (objc_msgSend( objc_msgSend(a4, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A24")))
  {
    __int128 v12 =  -[NSString initWithData:encoding:]( [NSString alloc],  "initWithData:encoding:",  [a4 value],  4);
    sub_5DB0();
    uint64_t v18 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315650;
      __int128 v23 = "BTLEMIDIDriverCentral.mm";
      __int16 v24 = 1024;
      int v25 = 781;
      __int16 v26 = 2112;
      BOOL v27 = v12;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "%25s:%-5d Discovered model number: %@", (uint8_t *)&v22, 0x1Cu);
    }

    id v19 = -[BLEMIDIDriverCentral deviceForPeripheral:](self, "deviceForPeripheral:", a3);
    if (v19)
    {
      __int16 v20 = v19;
      if ([v19 dev])
      {
        MIDIObjectRef v16 = [v20 dev];
        id v17 = (CFStringRef *)&kMIDIPropertyModel;
        goto LABEL_20;
      }
    }
  }

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  if (a5)
  {
    sub_5DB0();
    id v8 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      id v10 = "BTLEMIDIDriverCentral.mm";
      __int16 v11 = 1024;
      int v12 = 804;
      __int16 v13 = 2112;
      id v14 = a3;
      __int16 v15 = 2112;
      id v16 = a4;
      __int16 v17 = 2112;
      id v18 = a5;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d peripheral: %@ didWriteValueForCharacteristic: %@ error:%@",  (uint8_t *)&v9,  0x30u);
    }
  }

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  int v9 = (os_log_s *)qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136316162;
    id v14 = "BTLEMIDIDriverCentral.mm";
    __int16 v15 = 1024;
    int v16 = 809;
    __int16 v17 = 2112;
    id v18 = a3;
    __int16 v19 = 2112;
    id v20 = a4;
    __int16 v21 = 2112;
    id v22 = a5;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d peripheral:%@ didUpdateNotificationStateForCharacteristic:%@ error:%@",  (uint8_t *)&v13,  0x30u);
  }

  if (a5)
  {
    sub_5DB0();
    id v10 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      id v14 = "BTLEMIDIDriverCentral.mm";
      __int16 v15 = 1024;
      int v16 = 811;
      __int16 v17 = 2112;
      id v18 = a5;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v13, 0x1Cu);
    }
  }

  else
  {
    id v11 = -[BLEMIDIDriverCentral midiCharacteristicForPeripheral:](self, "midiCharacteristicForPeripheral:", a3);
    if (v11 && ([v11 isNotifying] & 1) == 0)
    {
      sub_5DB0();
      int v12 = (os_log_s *)qword_1DDB8;
      if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 136315394;
        id v14 = "BTLEMIDIDriverCentral.mm";
        __int16 v15 = 1024;
        int v16 = 815;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      canceling peripheral connection since notify was removed.",  (uint8_t *)&v13,  0x12u);
      }

      -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
    }
  }

- (id)deviceForMIDIDevice:(unsigned int)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  connectedDevices = self->connectedDevices;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(connectedDevices);
    }
    int v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)deviceForUUID:(id)a3
{
  if (a3
    && (__int128 v14 = 0u,
        __int128 v15 = 0u,
        __int128 v12 = 0u,
        __int128 v13 = 0u,
        connectedDevices = self->connectedDevices,
        (id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v12,  v22,  16LL)) != 0LL))
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_4:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(connectedDevices);
      }
      int v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      if (v6 == (id)++v8)
      {
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v12,  v22,  16LL);
        if (v6) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    sub_5DB0();
    id v10 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "BTLEMIDIDriverCentral.mm";
      __int16 v18 = 1024;
      int v19 = 840;
      __int16 v20 = 2112;
      id v21 = a3;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d no device found with UUID %@", buf, 0x1Cu);
    }

    return 0LL;
  }

  return v9;
}

- (id)deviceForPeripheral:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  connectedDevices = self->connectedDevices;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(connectedDevices);
    }
    int v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 peripheral] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)deviceForEP:(unsigned int)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  connectedDevices = self->connectedDevices;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(connectedDevices);
    }
    int v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      int v9 = 0LL;
      if (v6) {
        goto LABEL_3;
      }
      return v9;
    }
  }

- (void)removeDeviceForPeripheral:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  connectedDevices = self->connectedDevices;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(connectedDevices);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v10 peripheral] == a3)
        {
          -[NSMutableArray removeObject:](self->connectedDevices, "removeObject:", v10);
          return;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)removeDeviceForUUID:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  connectedDevices = self->connectedDevices;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v12,  v22,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(connectedDevices);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v10, "uuid"), "isEqualToString:", a3))
        {
          -[NSMutableArray removeObject:](self->connectedDevices, "removeObject:", v10);
          return;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v12,  v22,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  sub_5DB0();
  __int128 v11 = (os_log_s *)qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "BTLEMIDIDriverCentral.mm";
    __int16 v18 = 1024;
    int v19 = 880;
    __int16 v20 = 2112;
    id v21 = a3;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%25s:%-5d removeDeviceForPeripheral: no device found with UUID %@",  buf,  0x1Cu);
  }

- (void)resetAllConnectedDevices
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  connectedDevices = self->connectedDevices;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(connectedDevices);
        }
        MIDIObjectSetIntegerProperty( (MIDIObjectRef)[*(id *)(*((void *)&v8 + 1) + 8 * (void)i) dev],  kMIDIPropertyOffline,  1);
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( connectedDevices,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->connectedPeripherals, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->connectedDevices, "removeAllObjects");
}

- (id)peripheralWithUUID:(id)a3
{
  id v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", a3);
  centralManager = self->centralManager;
  id v21 = v5;
  id v7 = -[CBCentralManager retrievePeripheralsWithIdentifiers:]( centralManager,  "retrievePeripheralsWithIdentifiers:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  if (v7)
  {
    __int128 v8 = v7;
    sub_5DB0();
    uint64_t v14 = qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315650;
      int v16 = "BTLEMIDIDriverCentral.mm";
      __int16 v17 = 1024;
      int v18 = 904;
      __int16 v19 = 2048;
      id v20 = -[NSArray count](v8, "count");
      __int128 v11 = "%25s:%-5d Unexpected peripheral count (%lu)";
      __int128 v12 = (os_log_s *)v14;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
  }

  else
  {
    sub_5DB0();
    uint64_t v10 = qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315650;
      int v16 = "BTLEMIDIDriverCentral.mm";
      __int16 v17 = 1024;
      int v18 = 902;
      __int16 v19 = 2112;
      id v20 = a3;
      __int128 v11 = "%25s:%-5d No peripheral with UUID %@";
      __int128 v12 = (os_log_s *)v10;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_0, v12, v13, v11, (uint8_t *)&v15, 0x1Cu);
    }
  }

  return 0LL;
}

- (BOOL)isAlreadyConnectedAsCentral:(id)a3
{
  id v3 = +[BLEMIDIAccessor midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:]( &OBJC_CLASS___BLEMIDIAccessor,  "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:",  a3,  1LL,  0LL);
  if ((_DWORD)v3) {
    LOBYTE(v3) = +[BLEMIDIAccessor deviceIsOnline:]( &OBJC_CLASS___BLEMIDIAccessor,  "deviceIsOnline:",  v3);
  }
  return (char)v3;
}

- (CBCentralManager)centralManager
{
  return self->centralManager;
}

- (MIDIDriverInterface)driver
{
  return self->driver;
}

@end