@interface AXTVBluetoothDevice
+ (BOOL)supportsSecureCoding;
- (AXTVBluetoothDevice)initWithBTLEPeripheral:(id)a3;
- (AXTVBluetoothDevice)initWithClassicBluetoothDevice:(id)a3;
- (AXTVBluetoothDevice)initWithCoder:(id)a3;
- (AXTVCoreBluetoothDevice)bluetoothDeviceObject;
- (BOOL)didPINPairingFail;
- (BOOL)isCharging;
- (BOOL)isCloudPaired;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMagicPaired;
- (BOOL)isPINPairing;
- (BOOL)isPaired;
- (BOOL)isPairing;
- (BOOL)supportsBatteryLevel;
- (BOOL)supportsIsCharging;
- (BOOL)tvset_supportsIAP;
- (BOOL)wasPINPairingCancelled;
- (NSArray)registryIDs;
- (NSString)firmwareVersion;
- (NSString)hardwareVersion;
- (NSString)identifier;
- (NSString)macAddress;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)multitouchFirmwareVersion;
- (NSString)name;
- (NSString)physicalDeviceUniqueID;
- (NSString)serialNumber;
- (NSURL)tvset_lookupURL;
- (double)lastConnectTime;
- (double)lastDisconnectTime;
- (double)lastPairTime;
- (double)lastUnpairTime;
- (id)__accessory;
- (id)_accessory;
- (id)description;
- (int64_t)batteryLevel;
- (int64_t)state;
- (int64_t)transportType;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)lastActivityTimeStamp;
- (void)__updateDeviceBatteryLevel;
- (void)__updateDeviceConnected;
- (void)__updateDeviceIdentifiers;
- (void)__updateDevicePaired;
- (void)__updateDeviceState;
- (void)__updateRemoteConnected;
- (void)__updateRemoteIdentifiers;
- (void)__updateRemotePaired;
- (void)__updateRemotePowerState;
- (void)__updateRemoteState;
- (void)_checkStatus;
- (void)_invokeConnectBlockIfNeeded;
- (void)_invokeDisconnectBlockIfNeeded;
- (void)_invokeUnpairBlockIfNeeded;
- (void)_noteConnectionFailure:(id)a3;
- (void)_noteDisconnectionFailure:(id)a3;
- (void)_notePairingFailure:(id)a3;
- (void)_noteStateChangeFailure:(id)a3;
- (void)_peripheralBatteryLevelChanged:(id)a3;
- (void)_peripheralStateChanged:(id)a3;
- (void)_remoteBatteryLevelChanged:(id)a3;
- (void)_remoteChargingChanged:(id)a3;
- (void)_remoteConnectedChanged:(id)a3;
- (void)connectWithCompletion:(id)a3;
- (void)dealloc;
- (void)disconnectWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setBluetoothDeviceObject:(id)a3;
- (void)setCharging:(BOOL)a3;
- (void)setConnected:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastConnectTime:(double)a3;
- (void)setLastDisconnectTime:(double)a3;
- (void)setLastPairTime:(double)a3;
- (void)setLastUnpairTime:(double)a3;
- (void)setName:(id)a3;
- (void)setPINPairing:(BOOL)a3;
- (void)setPINPairingCancelled:(BOOL)a3;
- (void)setPINPairingFailed:(BOOL)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPairing:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)unpairWithCompletion:(id)a3;
@end

@implementation AXTVBluetoothDevice

- (AXTVBluetoothDevice)initWithBTLEPeripheral:(id)a3
{
  id v5 = a3;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___AXTVBluetoothDevice;
  v6 = -[AXTVBluetoothDevice init](&v59, "init");
  uint64_t v12 = (uint64_t)v6;
  if (!v5)
  {
    v52 = v6;
    uint64_t v12 = 0LL;
    goto LABEL_28;
  }

  if (v6)
  {
    objc_storeStrong((id *)&v6->_bluetoothDeviceObject, a3);
    *(void *)(v12 + 80) = 1LL;
    *(void *)(v12 + 72) = objc_msgSend(v5, "tvs_isBluetoothRemote");
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    id v15 = [v14 copy];
    v16 = *(void **)(v12 + 112);
    *(void *)(v12 + 112) = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    id v18 = [v17 copy];
    v19 = *(void **)(v12 + 104);
    *(void *)(v12 + 104) = v18;

    *(_WORD *)(v12 + 56) = 0;
    v20 = sub_2D9F4(*(void **)(v12 + 104));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = [v21 copy];
    v23 = *(void **)(v12 + 88);
    *(void *)(v12 + 88) = v22;

    id v29 = *(id *)(v12 + 104);
    if (v29)
    {
      v30 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorSystemDefault);
      v62 = @"SerialNumber";
      id v60 = v29;
      IOHIDEventSystemClientSetMatching( v30,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v62,  1LL));
      v31 = IOHIDEventSystemClientCopyServices(v30);
      if (v31)
      {
        v32 = v31;
        if (CFArrayGetCount(v31) >= 1)
        {
          for (CFIndex i = 0LL; i < CFArrayGetCount(v32); ++i)
          {
            ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v32, i);
            CFTypeRef v35 = IOHIDServiceClientCopyProperty(ValueAtIndex, @"PhysicalDeviceUniqueID");
            if (v35)
            {
              v36 = (void *)v35;
              CFTypeID v37 = CFGetTypeID(v35);
              if (v37 == CFStringGetTypeID())
              {
                CFRelease(v32);
                CFRelease(v30);
                _AXTVBTLog( 0LL,  4LL,  @"device with serialNumber %@ has unique ID '%@'",  v54,  v55,  v56,  v57,  v58,  (uint64_t)v29);
LABEL_14:

                id v38 = [v36 copy];
                v39 = *(void **)(v12 + 96);
                *(void *)(v12 + 96) = v38;

                v40 = (char *)[v5 state];
                else {
                  v41 = v40;
                }
                *(void *)(v12 + 120) = v41;
                v42 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPeripheralManager sharedInstance]( &OBJC_CLASS___TVSPeripheralManager,  "sharedInstance"));
                *(_BYTE *)(v12 + 58) = [v42 isPeerPaired:v5];

                unsigned int v43 = [v5 isConnectedToSystem];
                *(_BYTE *)(v12 + 60) = v43;
                *(void *)(v12 + 160) = -1LL;
                *(_BYTE *)(v12 + 61) = 0;
                *(_OWORD *)(v12 + 128) = 0u;
                *(_OWORD *)(v12 + 144) = 0u;
                if (v43 && !*(void *)(v12 + 120))
                {
                  *(void *)(v12 + 120) = 2LL;
                  *(_BYTE *)(v12 + 58) = 1;
                }

                if (*(void *)(v12 + 72) == 1LL)
                {
                  sub_2DB34(*(void **)(v12 + 104), &v60);
                  id v44 = v60;
                  if (v60 != (id)-1LL)
                  {
                    *(_BYTE *)(v12 + 56) = 1;
                    *(void *)(v12 + 160) = v44;
                  }

                  uint64_t v45 = v61;
                  if (v61 != -1)
                  {
                    *(_BYTE *)(v12 + 57) = 1;
                    *(_BYTE *)(v12 + 61) = v45 != 0;
                  }

                  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                  [v46 addObserver:v12 selector:"_remoteBatteryLevelChanged:" name:TVSBluetoothRemotePowerSourceInfoDidChangeNotification object:0];

                  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                  [v47 addObserver:v12 selector:"_remoteChargingChanged:" name:TVSBluetoothRemotePowerSourceLimitedSourceDidChangeNotification object:0];

                  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                  [v48 addObserver:v12 selector:"_remoteConnectedChanged:" name:TVSBluetoothRemoteDidConnectNotification object:0];

                  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                  [v49 addObserver:v12 selector:"_remoteConnectedChanged:" name:TVSBluetoothRemoteDidDisconnectNotification object:0];
                }

                v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                [v50 addObserver:v12 selector:"_peripheralStateChanged:" name:TVSPeripheralManagerPeripheralStateDidChangeNotification object:0];

                v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                [v51 addObserver:v12 selector:"_peripheralBatteryLevelChanged:" name:TVSPeripheralManagerPeripheralBatteryLevelDidChangeNotification object:0];

                v52 = (AXTVBluetoothDevice *)objc_claimAutoreleasedReturnValue( +[TVSPeripheralManager sharedInstance]( &OBJC_CLASS___TVSPeripheralManager,  "sharedInstance"));
                -[AXTVBluetoothDevice readBatteryLevelForPeripheral:](v52, "readBatteryLevelForPeripheral:", v5);
LABEL_28:

                goto LABEL_29;
              }

              CFRelease(v36);
            }
          }
        }

        CFRelease(v32);
      }

      CFRelease(v30);
    }

    _AXTVBTLog(0LL, 4LL, @"device with serialNumber %@ has no unique ID", v24, v25, v26, v27, v28, (uint64_t)v29);
    v36 = 0LL;
    goto LABEL_14;
  }

- (AXTVBluetoothDevice)initWithClassicBluetoothDevice:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___AXTVBluetoothDevice;
  v6 = -[AXTVBluetoothDevice init](&v33, "init");
  uint64_t v12 = (uint64_t)v6;
  if (!v5)
  {

    uint64_t v12 = 0LL;
    goto LABEL_14;
  }

  if (v6)
  {
    objc_storeStrong((id *)&v6->_bluetoothDeviceObject, a3);
    *(void *)(v12 + 80) = 0LL;
    unsigned int v13 = [v5 type];
    if (v13 <= 0x2F)
    {
      if (((1LL << v13) & 0x8000009B0008LL) != 0)
      {
        uint64_t v14 = 3LL;
LABEL_6:
        *(void *)(v12 + 72) = v14;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 address]);
        id v16 = [v15 copy];
        v17 = *(void **)(v12 + 112);
        *(void *)(v12 + 112) = v16;

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
        id v19 = [v18 copy];
        v20 = *(void **)(v12 + 104);
        *(void *)(v12 + 104) = v19;

        *(_BYTE *)(v12 + 56) = [v5 supportsBatteryLevel];
        *(_BYTE *)(v12 + 57) = 0;
        v21 = (void *)objc_claimAutoreleasedReturnValue([(id)v12 serialNumber]);
        id v22 = sub_2D9F4(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v24 = [v23 copy];
        uint64_t v25 = *(void **)(v12 + 88);
        *(void *)(v12 + 88) = v24;

        uint64_t v26 = *(void **)(v12 + 96);
        *(void *)(v12 + 96) = 0LL;

        unsigned int v27 = [v5 connected];
        uint64_t v28 = 2LL;
        if (!v27) {
          uint64_t v28 = 0LL;
        }
        *(void *)(v12 + 120) = v28;
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 connectingDevices]);
        else {
          uint64_t v31 = *(void *)(v12 + 120);
        }
        *(void *)(v12 + 120) = v31;

        *(_BYTE *)(v12 + 58) = [v5 paired];
        *(_BYTE *)(v12 + 60) = [v5 connected];
        *(void *)(v12 + 160) = -1LL;
        *(_BYTE *)(v12 + 61) = 0;
        *(_OWORD *)(v12 + 128) = 0u;
        *(_OWORD *)(v12 + 144) = 0u;
        if (*(_BYTE *)(v12 + 56)) {
          *(void *)(v12 + 160) = (int)[v5 batteryLevel];
        }
        goto LABEL_14;
      }

      if (v13 == 24LL)
      {
        uint64_t v14 = 2LL;
        goto LABEL_6;
      }

      if (v13 == 26LL)
      {
        uint64_t v14 = 4LL;
        goto LABEL_6;
      }
    }

    uint64_t v14 = 0LL;
    goto LABEL_6;
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVBluetoothDevice;
  -[AXTVBluetoothDevice dealloc](&v4, "dealloc");
}

- (void)_invokeConnectBlockIfNeeded
{
  id v12 = objc_retainBlock(self->_connectDoneBlock);
  id connectDoneBlock = self->_connectDoneBlock;
  self->_id connectDoneBlock = 0LL;

  objc_super v4 = self->_connectionFailure;
  connectionFailure = self->_connectionFailure;
  self->_connectionFailure = 0LL;

  if (v12)
  {
    id v6 = objc_retainBlock(v12);
    _AXTVBTLog( 0LL,  4LL,  @"invoking connectWithCompletion: completion block %p for %@",  v7,  v8,  v9,  v10,  v11,  (uint64_t)v6);

    (*((void (**)(id, AXTVBluetoothDevice *, NSError *))v12 + 2))(v12, self, v4);
  }
}

- (void)_invokeDisconnectBlockIfNeeded
{
  id v12 = objc_retainBlock(self->_disconnectDoneBlock);
  disid connectDoneBlock = self->_disconnectDoneBlock;
  self->_disid connectDoneBlock = 0LL;

  objc_super v4 = self->_disconnectionFailure;
  disconnectionFailure = self->_disconnectionFailure;
  self->_disconnectionFailure = 0LL;

  if (v12)
  {
    id v6 = objc_retainBlock(v12);
    _AXTVBTLog( 0LL,  4LL,  @"invoking disconnectWithCompletion: completion block %p for %@",  v7,  v8,  v9,  v10,  v11,  (uint64_t)v6);

    (*((void (**)(id, AXTVBluetoothDevice *, NSError *))v12 + 2))(v12, self, v4);
  }
}

- (void)_invokeUnpairBlockIfNeeded
{
  id v12 = objc_retainBlock(self->_unpairDoneBlock);
  id unpairDoneBlock = self->_unpairDoneBlock;
  self->_id unpairDoneBlock = 0LL;

  objc_super v4 = self->_unpairingFailure;
  unpairingFailure = self->_unpairingFailure;
  self->_unpairingFailure = 0LL;

  if (v12)
  {
    id v6 = objc_retainBlock(v12);
    _AXTVBTLog( 0LL,  4LL,  @"invoking unpairWithCompletion: completion block %p for %@",  v7,  v8,  v9,  v10,  v11,  (uint64_t)v6);

    (*((void (**)(id, AXTVBluetoothDevice *, NSError *))v12 + 2))(v12, self, v4);
  }
}

- (void)setBluetoothDeviceObject:(id)a3
{
  id v18 = a3;
  int64_t v5 = -[AXTVBluetoothDevice transportType](self, "transportType");
  if (v5 == 1)
  {
    uint64_t v15 = objc_opt_self(&OBJC_CLASS___CBPeripheral);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_isKindOfClass(v18, v16) & 1) == 0) {
      sub_3CE24();
    }

    unsigned int v17 = objc_msgSend(v18, "tvs_isBluetoothRemote");
    if ((id)-[AXTVBluetoothDevice type](self, "type") != (id)v17) {
      sub_3CDF8(self, v17);
    }
    goto LABEL_11;
  }

  if (!v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___AXTVCoreBluetoothDevice);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if ((objc_opt_isKindOfClass(v18, v7) & 1) == 0) {
      sub_3CDD0();
    }

    unsigned int v8 = [v18 type];
    if (v8 <= 0x2F)
    {
      if (((1LL << v8) & 0x8000009B0008LL) != 0)
      {
        uint64_t v9 = &dword_0 + 3;
        goto LABEL_7;
      }

      if (v8 == 24LL)
      {
        uint64_t v9 = &dword_0 + 2;
        goto LABEL_7;
      }

      if (v8 == 26LL)
      {
        uint64_t v9 = &dword_4;
        goto LABEL_7;
      }
    }

    uint64_t v9 = 0LL;
LABEL_7:
LABEL_11:
    _AXTVBTLog(0LL, 4LL, @"resetting internal device to %p '%@' for %@", v10, v11, v12, v13, v14, (uint64_t)v18);
    objc_storeStrong((id *)&self->_bluetoothDeviceObject, a3);
  }

  -[AXTVBluetoothDevice _checkStatus](self, "_checkStatus");
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if ([v9 allowsKeyedCoding])
  {
    objc_msgSend( v9,  "encodeInteger:forKey:",  -[AXTVBluetoothDevice transportType](self, "transportType"),  @"AXTVBluetoothDevice.transportType");
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    [v9 encodeObject:v4 forKey:@"AXTVBluetoothDevice.identifier"];
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"*** AXTVBluetoothDevice cannot be encoded by non-keyed archivers",  0LL));
    objc_exception_throw(v5);
    -[AXTVBluetoothDevice initWithCoder:](v6, v7, v8);
  }

- (AXTVBluetoothDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    id v32 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"*** AXTVBluetoothDevice cannot be decoded by non-keyed archivers",  0LL));
    objc_exception_throw(v32);
  }

  id v5 = (char *)[v4 decodeIntegerForKey:@"AXTVBluetoothDevice.transportType"];
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSString);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClass:v7 forKey:@"AXTVBluetoothDevice.identifier"]);

  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    v20 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 connectedPeripherals]);
    -[NSMutableSet addObjectsFromArray:](v20, "addObjectsFromArray:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pairedPeripherals]);
    -[NSMutableSet addObjectsFromArray:](v20, "addObjectsFromArray:", v24);

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v14 = v20;
    id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
    if (v15)
    {
      uint64_t v25 = *(void *)v34;
      while (2)
      {
        for (CFIndex i = 0LL; i != v15; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v14);
          }
          unsigned int v27 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier", (void)v33));
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);

          if ([v29 isEqualToString:v8])
          {
            id v15 = v27;

            goto LABEL_25;
          }
        }

        id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
        if (v15) {
          continue;
        }
        break;
      }
    }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCloudPaired
{
  int64_t v3 = -[AXTVBluetoothDevice transportType](self, "transportType");
  if (!v3)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
    unsigned int v14 = [v13 cloudPaired];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    if (v14) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_9;
  }

  if (v3 != 1)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    goto LABEL_8;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned __int8 v6 = [v4 isPeerCloudPaired:v5];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
  if ((v6 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v15 = 1;
LABEL_9:
  _AXTVBTLog(0LL, 4LL, @"device '%@' is%s cloud paired", v7, v8, v9, v10, v11, (uint64_t)v12);

  return v15;
}

- (BOOL)isMagicPaired
{
  if (-[AXTVBluetoothDevice transportType](self, "transportType"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    unsigned __int8 v9 = 0;
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
    unsigned __int8 v9 = [v10 magicPaired];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
  }

  _AXTVBTLog(0LL, 4LL, @"device '%@' is%s magic paired", v3, v4, v5, v6, v7, (uint64_t)v8);

  return v9;
}

- (id)__accessory
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](self->_identifier, "uppercaseString"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v4 = -[objc_class sharedAccessoryManager]( NSClassFromString(@"EAAccessoryManager"),  "sharedAccessoryManager");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 availableAccessories]);

  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (CFIndex i = 0LL; i != v8; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 macAddress]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uppercaseString]);
        unsigned __int8 v14 = [v13 isEqual:v3];

        if ((v14 & 1) != 0)
        {
          id v20 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
  _AXTVBTLog(0LL, 4LL, @"found no accessory for device '%@'", v15, v16, v17, v18, v19, (uint64_t)v6);
  id v20 = 0LL;
LABEL_11:

  return v20;
}

- (NSString)manufacturer
{
  if (-[AXTVBluetoothDevice transportType](self, "transportType"))
  {
    id v3 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice __accessory](self, "__accessory"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 manufacturer]);
    id v3 = [v5 copy];
  }

  return (NSString *)v3;
}

- (NSString)modelNumber
{
  if (-[AXTVBluetoothDevice transportType](self, "transportType"))
  {
    id v3 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice __accessory](self, "__accessory"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
    id v3 = [v5 copy];
  }

  return (NSString *)v3;
}

- (NSString)serialNumber
{
  int64_t v3 = -[AXTVBluetoothDevice transportType](self, "transportType");
  if (v3 == 1)
  {
    if (self->_type == 1) {
      name = self->_name;
    }
    else {
      name = 0LL;
    }
    uint64_t v6 = name;
  }

  else if (v3)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice __accessory](self, "__accessory"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
    uint64_t v6 = (NSString *)[v5 copy];
  }

  return v6;
}

- (NSString)firmwareVersion
{
  int64_t v3 = -[AXTVBluetoothDevice transportType](self, "transportType");
  if (v3 == 1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_firmwareVersion"));
  }

  else
  {
    if (v3)
    {
      id v7 = 0LL;
      return (NSString *)v7;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice __accessory](self, "__accessory"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firmwareRevision]);
  }

  uint64_t v6 = v5;
  id v7 = [v5 copy];

  return (NSString *)v7;
}

- (NSString)multitouchFirmwareVersion
{
  if ((char *)-[AXTVBluetoothDevice transportType](self, "transportType") == (char *)&dword_0 + 1)
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_multiTouchFirmwareVersion"));
    id v5 = [v4 copy];
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (NSString)hardwareVersion
{
  int64_t v3 = -[AXTVBluetoothDevice transportType](self, "transportType");
  if (v3 == 1)
  {
    if ((+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild") & 1) != 0
      || self->_type != 1)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_hardwareVersion"));
      goto LABEL_8;
    }
  }

  else if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice __accessory](self, "__accessory"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareRevision]);
LABEL_8:
    id v7 = v5;
    id v6 = [v5 copy];

    return (NSString *)v6;
  }

  id v6 = 0LL;
  return (NSString *)v6;
}

- (NSString)macAddress
{
  if (!-[AXTVBluetoothDevice transportType](self, "transportType"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice __accessory](self, "__accessory"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 macAddress]);
    id v3 = [v5 copy];

    if (v3) {
      return (NSString *)v3;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    id v7 = [v6 copy];

    id v8 = v7;
    id v9 = v8;
    if ([v9 length])
    {
      unsigned int v10 = [v9 characterAtIndex:0];
      if (v10)
      {
        if (v10 - 48 < 0xA || v10 - 65 <= 5)
        {
        }

        else
        {
          unsigned int v11 = v10 - 97;

          if (v11 > 5) {
            goto LABEL_35;
          }
        }

        id v12 = v9;
        if ((unint64_t)[v12 length] >= 2)
        {
          unsigned int v13 = [v12 characterAtIndex:1];
          if (v13)
          {
            if (v13 - 48 < 0xA || v13 - 65 <= 5)
            {
            }

            else
            {
              unsigned int v14 = v13 - 97;

              if (v14 > 5) {
                goto LABEL_35;
              }
            }

            id v15 = v12;
            if ((unint64_t)[v15 length] >= 3)
            {
              unsigned int v16 = [v15 characterAtIndex:2];

              if (v16 != 58) {
                goto LABEL_35;
              }
              id v17 = v15;
              if ((unint64_t)[v17 length] >= 4)
              {
                unsigned int v18 = [v17 characterAtIndex:3];
                if (v18)
                {
                  if (v18 - 48 < 0xA || v18 - 65 <= 5)
                  {
                  }

                  else
                  {
                    unsigned int v19 = v18 - 97;

                    if (v19 > 5) {
                      goto LABEL_35;
                    }
                  }

                  id v20 = v17;
                  if ((unint64_t)[v20 length] >= 5)
                  {
                    unsigned int v21 = [v20 characterAtIndex:4];
                    if (v21)
                    {
                      if (v21 - 48 < 0xA || v21 - 65 <= 5)
                      {
                      }

                      else
                      {
                        unsigned int v22 = v21 - 97;

                        if (v22 > 5) {
                          goto LABEL_35;
                        }
                      }

                      if (sub_316E8(v20, 5uLL)
                        && sub_3166C(v20, 6uLL)
                        && sub_3166C(v20, 7uLL)
                        && sub_316E8(v20, 8uLL)
                        && sub_3166C(v20, 9uLL)
                        && sub_3166C(v20, 0xAuLL)
                        && sub_316E8(v20, 0xBuLL)
                        && sub_3166C(v20, 0xCuLL)
                        && sub_3166C(v20, 0xDuLL)
                        && sub_316E8(v20, 0xEuLL)
                        && (sub_3166C(v20, 0xFuLL) & 1) != 0)
                      {
                        int v24 = sub_3166C(v20, 0x10uLL);

                        if (v24)
                        {
                          id v3 = v20;
                          goto LABEL_37;
                        }

- (unint64_t)lastActivityTimeStamp
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice serialNumber](self, "serialNumber"));
  if (v7)
  {
    id v8 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorSystemDefault);
    int v24 = @"SerialNumber";
    id v25 = v7;
    IOHIDEventSystemClientSetMatching( v8,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    id v9 = IOHIDEventSystemClientCopyServices(v8);
    if (v9)
    {
      unsigned int v10 = v9;
      if (CFArrayGetCount(v9) >= 1)
      {
        for (CFIndex i = 0LL; i < CFArrayGetCount(v10); ++i)
        {
          ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v10, i);
          unsigned int v13 = (const __CFNumber *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"LastActivityTimestamp");
          if (v13)
          {
            unsigned int v14 = v13;
            CFTypeID v15 = CFGetTypeID(v13);
            if (v15 == CFNumberGetTypeID())
            {
              unint64_t valuePtr = 0LL;
              CFNumberGetValue(v14, kCFNumberSInt64Type, &valuePtr);
              CFRelease(v14);
              CFRelease(v10);
              CFRelease(v8);
              _AXTVBTLog( 0LL,  4LL,  @"device with serialNumber %@ has an activity timestamp of %llu",  v18,  v19,  v20,  v21,  v22,  (uint64_t)v7);
              unint64_t v16 = valuePtr;
              goto LABEL_12;
            }

            CFRelease(v14);
          }
        }
      }

      CFRelease(v10);
    }

    CFRelease(v8);
  }

  _AXTVBTLog(0LL, 4LL, @"device with serialNumber %@ has no activity timestamp", v2, v3, v4, v5, v6, (uint64_t)v7);
  unint64_t v16 = 0LL;
LABEL_12:

  return v16;
}

- (void)__updateDeviceIdentifiers
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 address]);
  id v27 = [v4 copy];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
  if (v27 == v5)
  {
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    unsigned __int8 v7 = [v27 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"device '%@' identifier changing to '%@'", v9, v10, v11, v12, v13, (uint64_t)v8);

      -[AXTVBluetoothDevice setIdentifier:](self, "setIdentifier:", v27);
    }
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  CFTypeID v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
  id v16 = [v15 copy];

  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
  if (v16 == (id)v17)
  {
  }

  else
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
    unsigned __int8 v20 = [v16 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"device '%@' name changing to '%@'", v22, v23, v24, v25, v26, (uint64_t)v21);

      -[AXTVBluetoothDevice setName:](self, "setName:", v16);
    }
  }
}

- (void)__updateDeviceState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v4 = [v3 connected];

  if (v4)
  {
    else {
      uint64_t v5 = 2LL;
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 connectingDevices]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
    unsigned int v9 = [v7 containsObject:v8];

    uint64_t v5 = v9;
  }

  if (-[AXTVBluetoothDevice state](self, "state") != v5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    -[AXTVBluetoothDevice state](self, "state");
    _AXTVBTLog(0LL, 4LL, @"device '%@' state changing to %s, was %s", v11, v12, v13, v14, v15, (uint64_t)v10);

    -[AXTVBluetoothDevice setState:](self, "setState:", v5);
  }

- (void)__updateDevicePaired
{
  unsigned int v3 = -[AXTVBluetoothDevice isPaired](self, "isPaired");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v5 = [v4 paired];

  if ((v3 & 1) != 0 || !v5)
  {
    if (((v3 ^ 1 | v5) & 1) == 0)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"device '%@' paired changing to NO", v13, v14, v15, v16, v17, (uint64_t)v12);

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[AXTVBluetoothDevice setLastUnpairTime:](self, "setLastUnpairTime:");
      if (-[AXTVBluetoothDevice state](self, "state"))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
        _AXTVBTLog(0LL, 4LL, @"device '%@' changing state to Disconnected", v19, v20, v21, v22, v23, (uint64_t)v18);

        -[AXTVBluetoothDevice setState:](self, "setState:", 0LL);
      }

      -[AXTVBluetoothDevice setPaired:](self, "setPaired:", 0LL);
      -[AXTVBluetoothDevice _invokeUnpairBlockIfNeeded](self, "_invokeUnpairBlockIfNeeded");
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"device '%@' paired changing to YES", v7, v8, v9, v10, v11, (uint64_t)v6);

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    -[AXTVBluetoothDevice setLastPairTime:](self, "setLastPairTime:");
    -[AXTVBluetoothDevice setPaired:](self, "setPaired:", 1LL);
  }

- (void)__updateDeviceConnected
{
  unsigned int v3 = -[AXTVBluetoothDevice isConnected](self, "isConnected");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v5 = [v4 connected];

  if ((v3 & 1) != 0 || !v5)
  {
    if (((v3 ^ 1 | v5) & 1) == 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"device '%@' connected changing to NO", v19, v20, v21, v22, v23, (uint64_t)v18);

      if (-[AXTVBluetoothDevice state](self, "state"))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
        _AXTVBTLog(0LL, 4LL, @"device '%@' changing state to Disconnected", v25, v26, v27, v28, v29, (uint64_t)v24);

        -[AXTVBluetoothDevice setState:](self, "setState:", 0LL);
      }

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[AXTVBluetoothDevice setLastDisconnectTime:](self, "setLastDisconnectTime:");
      -[AXTVBluetoothDevice setConnected:](self, "setConnected:", 0LL);
      -[AXTVBluetoothDevice _invokeDisconnectBlockIfNeeded](self, "_invokeDisconnectBlockIfNeeded");
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"device '%@' connected changing to YES", v7, v8, v9, v10, v11, (uint64_t)v6);

    if ((char *)-[AXTVBluetoothDevice state](self, "state") != (char *)&dword_0 + 2)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"device '%@' changing state to Connected", v13, v14, v15, v16, v17, (uint64_t)v12);

      -[AXTVBluetoothDevice setState:](self, "setState:", 2LL);
    }

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    -[AXTVBluetoothDevice setLastConnectTime:](self, "setLastConnectTime:");
    -[AXTVBluetoothDevice setConnected:](self, "setConnected:", 1LL);
    -[AXTVBluetoothDevice _invokeConnectBlockIfNeeded](self, "_invokeConnectBlockIfNeeded");
  }

- (void)__updateDeviceBatteryLevel
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  signed int v3 = [v10 batteryLevel];
  if ((id)-[AXTVBluetoothDevice batteryLevel](self, "batteryLevel") != (id)v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"device '%@' battery level changing to %ld", v5, v6, v7, v8, v9, (uint64_t)v4);

    -[AXTVBluetoothDevice setBatteryLevel:](self, "setBatteryLevel:", v3);
  }
}

- (void)__updateRemoteIdentifiers
{
  signed int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v28 = [v5 copy];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
  if (v28 == v6)
  {
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    unsigned __int8 v8 = [v28 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"peripheral '%@' identifier changing to '%@'", v10, v11, v12, v13, v14, (uint64_t)v9);

      -[AXTVBluetoothDevice setIdentifier:](self, "setIdentifier:", v28);
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
  id v17 = [v16 copy];

  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
  if (v17 == (id)v18)
  {
  }

  else
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
    unsigned __int8 v21 = [v17 isEqual:v20];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"peripheral '%@' name changing to '%@'", v23, v24, v25, v26, v27, (uint64_t)v22);

      -[AXTVBluetoothDevice setName:](self, "setName:", v17);
    }
  }
}

- (void)__updateRemoteState
{
  signed int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v4 = (char *)[v3 state];

  uint64_t v5 = v4 == (_BYTE *)&dword_0 + 1;
  BOOL v6 = v4 != (_BYTE *)&dword_0 + 2 && v4 != (_BYTE *)&dword_0 + 1;
  if (v4 == (_BYTE *)&dword_0 + 2) {
    uint64_t v5 = 2LL;
  }
  BOOL v7 = v4 != (_BYTE *)&dword_0 + 3 && v6;
  if (v4 == (_BYTE *)&dword_0 + 3) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = v5;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v10 = [v9 isConnectedToSystem];

  if ((v7 & v10) != 0) {
    uint64_t v11 = &dword_0 + 2;
  }
  else {
    uint64_t v11 = (void *)v8;
  }
  if ((void *)-[AXTVBluetoothDevice state](self, "state") != v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    -[AXTVBluetoothDevice state](self, "state");
    _AXTVBTLog(0LL, 4LL, @"peripheral '%@' state changing to %s, was %s", v13, v14, v15, v16, v17, (uint64_t)v12);

    -[AXTVBluetoothDevice setState:](self, "setState:", v11);
  }

- (void)__updateRemotePaired
{
  unsigned int v3 = -[AXTVBluetoothDevice isPaired](self, "isPaired");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v6 = [v4 isPeerPaired:v5];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  LODWORD(v5) = [v7 isConnectedToSystem];

  int v8 = v5 | v6;
  if ((v3 & 1) != 0 || !v8)
  {
    if (((v3 ^ 1 | v8) & 1) == 0)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"peripheral '%@' paired changing to NO", v16, v17, v18, v19, v20, (uint64_t)v15);

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[AXTVBluetoothDevice setLastUnpairTime:](self, "setLastUnpairTime:");
      if (-[AXTVBluetoothDevice state](self, "state"))
      {
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
        _AXTVBTLog( 0LL,  4LL,  @"peripheral '%@' state changing to Disconnected",  v22,  v23,  v24,  v25,  v26,  (uint64_t)v21);

        -[AXTVBluetoothDevice setState:](self, "setState:", 0LL);
      }

      -[AXTVBluetoothDevice setPaired:](self, "setPaired:", 0LL);
      -[AXTVBluetoothDevice _invokeUnpairBlockIfNeeded](self, "_invokeUnpairBlockIfNeeded");
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"peripheral '%@' paired changing to YES", v10, v11, v12, v13, v14, (uint64_t)v9);

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    -[AXTVBluetoothDevice setLastPairTime:](self, "setLastPairTime:");
    -[AXTVBluetoothDevice setPaired:](self, "setPaired:", 1LL);
  }

- (void)__updateRemoteConnected
{
  unsigned int v3 = -[AXTVBluetoothDevice isConnected](self, "isConnected");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  unsigned int v5 = [v4 isConnectedToSystem];

  if ((v3 & 1) != 0 || !v5)
  {
    if (((v3 ^ 1 | v5) & 1) == 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"peripheral '%@' connected changing to NO", v19, v20, v21, v22, v23, (uint64_t)v18);

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[AXTVBluetoothDevice setLastDisconnectTime:](self, "setLastDisconnectTime:");
      if (-[AXTVBluetoothDevice state](self, "state"))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
        _AXTVBTLog( 0LL,  4LL,  @"peripheral '%@' state changing to Disconnected",  v25,  v26,  v27,  v28,  v29,  (uint64_t)v24);

        -[AXTVBluetoothDevice setState:](self, "setState:", 0LL);
      }

      -[AXTVBluetoothDevice setConnected:](self, "setConnected:", 0LL);
      -[AXTVBluetoothDevice _invokeDisconnectBlockIfNeeded](self, "_invokeDisconnectBlockIfNeeded");
    }
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"peripheral '%@' connected changing to YES", v7, v8, v9, v10, v11, (uint64_t)v6);

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    -[AXTVBluetoothDevice setLastConnectTime:](self, "setLastConnectTime:");
    if ((char *)-[AXTVBluetoothDevice state](self, "state") != (char *)&dword_0 + 2)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      _AXTVBTLog(0LL, 4LL, @"peripheral '%@' state changing to Connected", v13, v14, v15, v16, v17, (uint64_t)v12);

      -[AXTVBluetoothDevice setState:](self, "setState:", 2LL);
    }

    -[AXTVBluetoothDevice setConnected:](self, "setConnected:", 1LL);
    -[AXTVBluetoothDevice _invokeConnectBlockIfNeeded](self, "_invokeConnectBlockIfNeeded");
  }

- (void)__updateRemotePowerState
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
  sub_2DB34(v3, &v18);

  unsigned int v4 = v18;
  if (v18 != (void *)-1LL && (void *)-[AXTVBluetoothDevice batteryLevel](self, "batteryLevel") != v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"peripheral '%@' battery level changing to %ld", v6, v7, v8, v9, v10, (uint64_t)v5);

    -[AXTVBluetoothDevice setBatteryLevel:](self, "setBatteryLevel:", v4);
  }

  uint64_t v11 = v19;
  if (v19 != -1 && v11 != -[AXTVBluetoothDevice isCharging](self, "isCharging"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"peripheral '%@' charging changing to %s", v13, v14, v15, v16, v17, (uint64_t)v12);

    -[AXTVBluetoothDevice setCharging:](self, "setCharging:", v11 != 0);
  }

- (void)_remoteConnectedChanged:(id)a3
{
  id v16 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVSBluetoothRemoteUserInfoRemoteObject]);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
    unsigned int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
      _AXTVBTLog(0LL, 4LL, @"got %@ for %@", v11, v12, v13, v14, v15, (uint64_t)v10);

      -[AXTVBluetoothDevice __updateRemoteConnected](self, "__updateRemoteConnected");
    }
  }
}

- (void)_remoteBatteryLevelChanged:(id)a3
{
  id v16 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVSBluetoothRemoteUserInfoRemoteObject]);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
    unsigned int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
      _AXTVBTLog(0LL, 4LL, @"got %@ for %@", v11, v12, v13, v14, v15, (uint64_t)v10);

      -[AXTVBluetoothDevice __updateRemotePowerState](self, "__updateRemotePowerState");
    }
  }
}

- (void)_remoteChargingChanged:(id)a3
{
  id v16 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVSBluetoothRemoteUserInfoRemoteObject]);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
    unsigned int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
      _AXTVBTLog(0LL, 4LL, @"got %@ for %@", v11, v12, v13, v14, v15, (uint64_t)v10);

      -[AXTVBluetoothDevice __updateRemotePowerState](self, "__updateRemotePowerState");
    }
  }
}

- (void)_peripheralStateChanged:(id)a3
{
  id v16 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVSPeripheralManagerUserInfoKeyPeripheral]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  if (v5 == v6
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]),
        unsigned int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
    _AXTVBTLog(0LL, 4LL, @"got %@ for (%s) %@", v11, v12, v13, v14, v15, (uint64_t)v10);

    -[AXTVBluetoothDevice __updateRemoteIdentifiers](self, "__updateRemoteIdentifiers");
    -[AXTVBluetoothDevice __updateRemoteState](self, "__updateRemoteState");
    -[AXTVBluetoothDevice __updateRemotePaired](self, "__updateRemotePaired");
    -[AXTVBluetoothDevice __updateRemoteConnected](self, "__updateRemoteConnected");
  }
}

- (void)_peripheralBatteryLevelChanged:(id)a3
{
  id v29 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v29 userInfo]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVSPeripheralManagerUserInfoKeyPeripheral]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  if (v5 == v6
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]),
        unsigned int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v29 name]);
    _AXTVBTLog(0LL, 4LL, @"got %@ for (%s) %@", v11, v12, v13, v14, v15, (uint64_t)v10);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVSPeripheralManagerUserInfoKeyBatteryLevel]);
    if (v16)
    {
      if (!self->_supportsBatteryLevel)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
        _AXTVBTLog( 0LL,  4LL,  @"peripheral '%@' now supports battery level changes",  v18,  v19,  v20,  v21,  v22,  (uint64_t)v17);

        self->_supportsBatteryLevel = 1;
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
      [v16 integerValue];
      _AXTVBTLog( 0LL,  4LL,  @"peripheral '%@' battery level changing to %ld",  v24,  v25,  v26,  v27,  v28,  (uint64_t)v23);

      -[AXTVBluetoothDevice setBatteryLevel:](self, "setBatteryLevel:", [v16 integerValue]);
    }
  }
}

- (void)_checkStatus
{
  int64_t v3 = -[AXTVBluetoothDevice transportType](self, "transportType");
  if (v3 == 1)
  {
    -[AXTVBluetoothDevice __updateRemoteIdentifiers](self, "__updateRemoteIdentifiers");
    -[AXTVBluetoothDevice __updateRemoteState](self, "__updateRemoteState");
    -[AXTVBluetoothDevice __updateRemotePaired](self, "__updateRemotePaired");
    -[AXTVBluetoothDevice __updateRemoteConnected](self, "__updateRemoteConnected");
    -[AXTVBluetoothDevice __updateRemotePowerState](self, "__updateRemotePowerState");
  }

  else if (!v3)
  {
    -[AXTVBluetoothDevice __updateDeviceIdentifiers](self, "__updateDeviceIdentifiers");
    -[AXTVBluetoothDevice __updateDeviceState](self, "__updateDeviceState");
    -[AXTVBluetoothDevice __updateDevicePaired](self, "__updateDevicePaired");
    -[AXTVBluetoothDevice __updateDeviceConnected](self, "__updateDeviceConnected");
    -[AXTVBluetoothDevice __updateDeviceBatteryLevel](self, "__updateDeviceBatteryLevel");
  }

  if (self->_connectionFailure) {
    -[AXTVBluetoothDevice _invokeConnectBlockIfNeeded](self, "_invokeConnectBlockIfNeeded");
  }
  if (self->_disconnectionFailure) {
    -[AXTVBluetoothDevice _invokeDisconnectBlockIfNeeded](self, "_invokeDisconnectBlockIfNeeded");
  }
  if (self->_unpairingFailure) {
    -[AXTVBluetoothDevice _invokeUnpairBlockIfNeeded](self, "_invokeUnpairBlockIfNeeded");
  }
}

- (void)_noteConnectionFailure:(id)a3
{
}

- (void)_noteDisconnectionFailure:(id)a3
{
}

- (void)_notePairingFailure:(id)a3
{
}

- (void)_noteStateChangeFailure:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (self->_connectDoneBlock)
  {
    uint64_t v6 = 4LL;
LABEL_7:
    objc_storeStrong((id *)&(&self->super.isa)[v6], a3);
    id v5 = v7;
    goto LABEL_8;
  }

  if (self->_disconnectDoneBlock)
  {
    uint64_t v6 = 5LL;
    goto LABEL_7;
  }

  if (self->_unpairDoneBlock)
  {
    uint64_t v6 = 6LL;
    goto LABEL_7;
  }

- (void)connectWithCompletion:(id)a3
{
  id v24 = [a3 copy];
  id v4 = objc_retainBlock(v24);
  _AXTVBTLog( 0LL,  4LL,  @"connectWithCompletion: with completion block %p starting for %@",  v5,  v6,  v7,  v8,  v9,  (uint64_t)v4);

  int64_t v10 = -[AXTVBluetoothDevice state](self, "state");
  uint64_t v11 = v24;
  if (!v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"device '%@' changing state to Connecting", v13, v14, v15, v16, v17, (uint64_t)v12);

    -[AXTVBluetoothDevice setState:](self, "setState:", 1LL);
    if (!-[AXTVBluetoothDevice isPaired](self, "isPaired"))
    {
      -[AXTVBluetoothDevice setPairing:](self, "setPairing:", 1LL);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
      [v18 _incrementPairingDeviceCounter];
    }

    id v19 = objc_retainBlock(v24);
    id connectDoneBlock = self->_connectDoneBlock;
    self->_id connectDoneBlock = v19;

    int64_t v21 = -[AXTVBluetoothDevice transportType](self, "transportType");
    if (v21 == 1)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
      [v22 connectPeripheral:v23];
      goto LABEL_8;
    }

    uint64_t v11 = v24;
    if (!v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
      [v22 connectDevice:v23];
LABEL_8:

      uint64_t v11 = v24;
    }
  }
}

- (void)disconnectWithCompletion:(id)a3
{
  id v23 = [a3 copy];
  id v4 = objc_retainBlock(v23);
  _AXTVBTLog( 0LL,  4LL,  @"disconnectWithCompletion: with completion block %p starting for %@",  v5,  v6,  v7,  v8,  v9,  (uint64_t)v4);

  int64_t v10 = -[AXTVBluetoothDevice state](self, "state");
  uint64_t v11 = v23;
  if (v10 == 2)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"device '%@' changing state to Disconnecting", v13, v14, v15, v16, v17, (uint64_t)v12);

    -[AXTVBluetoothDevice setState:](self, "setState:", 3LL);
    id v18 = objc_retainBlock(v23);
    disid connectDoneBlock = self->_disconnectDoneBlock;
    self->_disid connectDoneBlock = v18;

    int64_t v20 = -[AXTVBluetoothDevice transportType](self, "transportType");
    if (v20 == 1)
    {
      if ((char *)-[AXTVBluetoothDevice type](self, "type") == (char *)&dword_0 + 1)
      {
        int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
        +[TVSBluetoothRemoteUtilities disconnectRemoteWithName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "disconnectRemoteWithName:",  v21);
LABEL_9:

        uint64_t v11 = v23;
        goto LABEL_10;
      }

      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
      [v21 disconnectPeripheral:v22];
LABEL_8:

      goto LABEL_9;
    }

    uint64_t v11 = v23;
    if (!v20)
    {
      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCoreBluetoothManager sharedInstance]( &OBJC_CLASS___AXTVCoreBluetoothManager,  "sharedInstance"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
      [v21 disconnectDevice:v22];
      goto LABEL_8;
    }
  }

- (void)unpairWithCompletion:(id)a3
{
  id v21 = [a3 copy];
  id v4 = objc_retainBlock(v21);
  _AXTVBTLog( 0LL,  4LL,  @"unpairWithCompletion: with completion block %p starting for %@",  v5,  v6,  v7,  v8,  v9,  (uint64_t)v4);

  if (-[AXTVBluetoothDevice state](self, "state"))
  {
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    _AXTVBTLog(0LL, 4LL, @"device '%@' changing state to Disconnecting", v11, v12, v13, v14, v15, (uint64_t)v10);

    -[AXTVBluetoothDevice setState:](self, "setState:", 3LL);
  }

  id v16 = objc_retainBlock(v21);
  id unpairDoneBlock = self->_unpairDoneBlock;
  self->_id unpairDoneBlock = v16;

  int64_t v18 = -[AXTVBluetoothDevice transportType](self, "transportType");
  if (v18 == 1)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPeripheralManager sharedInstance](&OBJC_CLASS___TVSPeripheralManager, "sharedInstance"));
    int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
    [v19 unpairPeripheral:v20];
    goto LABEL_7;
  }

  if (!v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
    int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
    [v19 unpairDevice:v20];
LABEL_7:
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXTVBluetoothDevice *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }

  else if (v4 {
         && (uint64_t v6 = objc_opt_self(&OBJC_CLASS___AXTVBluetoothDevice),
  }
             uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6),
             char isKindOfClass = objc_opt_isKindOfClass(v5, v7),
             v7,
             (isKindOfClass & 1) != 0))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](v5, "identifier"));
    unsigned __int8 v11 = [v9 isEqualToString:v10];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice bluetoothDeviceObject](self, "bluetoothDeviceObject"));
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___AXTVCoreBluetoothDevice);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    uint64_t v22 = sub_30C90([v3 type]);
  }
  else {
    uint64_t v22 = "n/a";
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___AXTVBluetoothDevice;
  id v6 = -[AXTVBluetoothDevice description](&v24, "description");
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](self, "name"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v21 displayableString]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
  int64_t v20 = -[AXTVBluetoothDevice state](self, "state");
  unsigned int v9 = -[AXTVBluetoothDevice isPaired](self, "isPaired");
  unsigned int v10 = -[AXTVBluetoothDevice isConnected](self, "isConnected");
  int64_t v11 = -[AXTVBluetoothDevice type](self, "type");
  int64_t v12 = -[AXTVBluetoothDevice transportType](self, "transportType");
  uint64_t v13 = "AppleTVRemote";
  switch(v11)
  {
    case 0LL:
      if (v12) {
        uint64_t v13 = "Generic-BTLE";
      }
      else {
        uint64_t v13 = "Generic-Classic";
      }
      break;
    case 1LL:
      break;
    case 2LL:
      uint64_t v13 = "Keyboard";
      break;
    case 3LL:
      uint64_t v13 = "Audio";
      break;
    case 4LL:
      uint64_t v13 = "GameController";
      break;
    default:
      uint64_t v13 = "Unknown";
      break;
  }

  if (v10) {
    uint64_t v14 = "YES";
  }
  else {
    uint64_t v14 = "NO";
  }
  if (v9) {
    uint64_t v15 = "YES";
  }
  else {
    uint64_t v15 = "NO";
  }
  int64_t v16 = -[AXTVBluetoothDevice batteryLevel](self, "batteryLevel");
  if (-[AXTVBluetoothDevice isCharging](self, "isCharging")) {
    uint64_t v17 = "YES";
  }
  else {
    uint64_t v17 = "NO";
  }
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{name:'%@', identifier:'%@', state:%ld, paired:%s, connected:%s, type:%s, batteryLevel:%ld, charging:%s, underlying:'%@', underlying type:%s}",  v23,  v7,  v8,  v20,  v15,  v14,  v13,  v16,  v17,  v3,  v22));

  return v18;
}

- (NSURL)tvset_lookupURL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice _accessory](self, "_accessory"));
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"action",  @"accessory-lookup"));
  uint64_t v5 = v3;
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  uint64_t v31 = v2;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v2 allPublicProtocolStrings]);
  id v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    uint64_t v9 = 1LL;
    do
    {
      unsigned int v10 = 0LL;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v10);
        int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"id%d",  (char *)v10 + v9));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v12,  v11));
        -[NSMutableArray addObject:](v5, "addObject:", v13);

        unsigned int v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v9 = (v9 + (_DWORD)v10);
    }

    while (v7);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v31 preferredApp]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"bid",  v14));
  -[NSMutableArray addObject:](v5, "addObject:", v15);

  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v31 name]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"accessoryName",  v16));
  -[NSMutableArray addObject:](v5, "addObject:", v17);

  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v31 manufacturer]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"manufacturer",  v18));
  -[NSMutableArray addObject:](v5, "addObject:", v19);

  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v31 modelNumber]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"modelNumber",  v20));
  -[NSMutableArray addObject:](v5, "addObject:", v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v31 firmwareRevision]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"firmwareVersion",  v22));
  -[NSMutableArray addObject:](v5, "addObject:", v23);

  objc_super v24 = (void *)objc_claimAutoreleasedReturnValue([v31 hardwareRevision]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"hardwareVersion",  v24));
  -[NSMutableArray addObject:](v5, "addObject:", v25);

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v31 serialNumber]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"serialNumber",  v26));
  -[NSMutableArray addObject:](v5, "addObject:", v27);

  uint64_t v28 = -[NSURLComponents initWithString:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithString:",  @"itms-apps://?");
  -[NSURLComponents setQueryItems:](v28, "setQueryItems:", v5);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v28, "URL"));

  return (NSURL *)v29;
}

- (BOOL)tvset_supportsIAP
{
  if (-[AXTVBluetoothDevice transportType](self, "transportType")) {
    return 0;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice _accessory](self, "_accessory"));
  unsigned __int8 v5 = [v4 supportsPublicIap];

  return v5;
}

- (id)_accessory
{
  if (-[AXTVBluetoothDevice transportType](self, "transportType")) {
    return 0LL;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[EAAccessoryManager sharedAccessoryManager]( &OBJC_CLASS___EAAccessoryManager,  "sharedAccessoryManager"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 availableAccessories]);

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (CFIndex i = 0LL; i != v7; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned int v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 macAddress]);
        int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uppercaseString]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice identifier](self, "identifier"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uppercaseString]);
        unsigned int v15 = [v12 isEqual:v14];

        if (v15)
        {
          id v16 = v10;
          goto LABEL_13;
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_13:

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (BOOL)supportsBatteryLevel
{
  return self->_supportsBatteryLevel;
}

- (BOOL)supportsIsCharging
{
  return self->_supportsIsCharging;
}

- (NSArray)registryIDs
{
  return self->_registryIDs;
}

- (NSString)physicalDeviceUniqueID
{
  return self->_physicalDeviceUniqueID;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)isPairing
{
  return self->_pairing;
}

- (void)setPairing:(BOOL)a3
{
  self->_pairing = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isCharging
{
  return self->_charging;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)lastPairTime
{
  return self->_lastPairTime;
}

- (void)setLastPairTime:(double)a3
{
  self->_lastPairTime = a3;
}

- (double)lastUnpairTime
{
  return self->_lastUnpairTime;
}

- (void)setLastUnpairTime:(double)a3
{
  self->_lastUnpairTime = a3;
}

- (double)lastConnectTime
{
  return self->_lastConnectTime;
}

- (void)setLastConnectTime:(double)a3
{
  self->_lastConnectTime = a3;
}

- (double)lastDisconnectTime
{
  return self->_lastDisconnectTime;
}

- (void)setLastDisconnectTime:(double)a3
{
  self->_lastDisconnectTime = a3;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (AXTVCoreBluetoothDevice)bluetoothDeviceObject
{
  return self->_bluetoothDeviceObject;
}

- (BOOL)isPINPairing
{
  return self->_PINPairing;
}

- (void)setPINPairing:(BOOL)a3
{
  self->_PINPairing = a3;
}

- (BOOL)didPINPairingFail
{
  return self->_PINPairingFailed;
}

- (void)setPINPairingFailed:(BOOL)a3
{
  self->_PINPairingFailed = a3;
}

- (BOOL)wasPINPairingCancelled
{
  return self->_PINPairingCancelled;
}

- (void)setPINPairingCancelled:(BOOL)a3
{
  self->_PINPairingCancelled = a3;
}

- (void).cxx_destruct
{
}

@end