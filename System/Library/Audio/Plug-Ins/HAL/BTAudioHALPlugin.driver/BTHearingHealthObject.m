@interface BTHearingHealthObject
- (BTHearingHealthObject)initWithUUID:(id)a3 productID:(unsigned int)a4 vendorID:(unsigned int)a5 EURegionBit:(unsigned __int8)a6 audioDevice:(void *)a7 readCharacteristics:(id)a8;
- (CBCentralManager)centralManager;
- (CBCharacteristic)dosimetrySensitivityCharacteristic;
- (CBCharacteristic)dosimetryVolumeCurveCharacteristic;
- (CBPeripheral)peripheral;
- (NSMutableArray)characteristics;
- (NSUUID)uuid;
- (float)getRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4;
- (id)centralManagerStateString;
- (void)audioDevice;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connectPeripheral:(id)a3;
- (void)dealloc;
- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readData:(id)a3;
- (void)registerService;
- (void)setAudioDevice:(void *)a3;
- (void)setCentralManager:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setDosimetrySensitivityCharacteristic:(id)a3;
- (void)setDosimetryVolumeCurveCharacteristic:(id)a3;
- (void)setPeripheral:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4 audioDevice:(void *)a5;
- (void)writeData:(id)a3 forCharacteristic:(id)a4;
@end

@implementation BTHearingHealthObject

- (BTHearingHealthObject)initWithUUID:(id)a3 productID:(unsigned int)a4 vendorID:(unsigned int)a5 EURegionBit:(unsigned __int8)a6 audioDevice:(void *)a7 readCharacteristics:(id)a8
{
  uint64_t v10 = a6;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___BTHearingHealthObject;
  v14 = -[BTHearingHealthObject init](&v46, "init");
  v15 = v14;
  if (v14)
  {
    if (a5 == 76)
    {
      unsigned int v20 = a4 - 8194;
      char v17 = 0;
      v18 = (float *)&dword_8AA68;
      float v19 = 98.0;
      switch(v20)
      {
        case 0u:
        case 0xCu:
        case 0xDu:
          break;
        case 1u:
          v18 = -[BTHearingHealthObject getRegionalDosimetryVolumeCurve:productID:]( v14,  "getRegionalDosimetryVolumeCurve:productID:",  v10,  8195LL);
          char v17 = 0;
          *(float *)&int v21 = 99.0;
          goto LABEL_17;
        case 3u:
          v18 = -[BTHearingHealthObject getRegionalDosimetryVolumeCurve:productID:]( v14,  "getRegionalDosimetryVolumeCurve:productID:",  v10,  8197LL);
          char v17 = 0;
          *(float *)&int v21 = 98.0;
          goto LABEL_17;
        case 4u:
          v18 = -[BTHearingHealthObject getRegionalDosimetryVolumeCurve:productID:]( v14,  "getRegionalDosimetryVolumeCurve:productID:",  v10,  8198LL);
          char v17 = 0;
          *(float *)&int v21 = 101.0;
          goto LABEL_17;
        case 7u:
          v18 = -[BTHearingHealthObject getRegionalDosimetryVolumeCurve:productID:]( v14,  "getRegionalDosimetryVolumeCurve:productID:",  v10,  8201LL);
          char v17 = 0;
          *(float *)&int v21 = 102.0;
          goto LABEL_17;
        case 9u:
        case 0xBu:
          char v17 = 0;
          *(float *)&int v21 = 97.5;
          goto LABEL_17;
        case 0xAu:
          char v17 = 0;
          float v19 = 97.75;
          break;
        case 0xEu:
          v18 = -[BTHearingHealthObject getRegionalDosimetryVolumeCurve:productID:]( v14,  "getRegionalDosimetryVolumeCurve:productID:",  v10,  8208LL);
          char v17 = 0;
          float v19 = 98.7;
          break;
        default:
          char v17 = 1;
          v18 = (float *)&dword_8AA68;
          *(float *)&int v21 = 100.0;
          goto LABEL_17;
      }
    }

    else
    {
      if (a5 == 158)
      {
        HIDWORD(v16) = a4;
        LODWORD(v16) = a4 - 16402;
        char v17 = 0;
        v18 = (float *)&dword_8ABBC;
        float v19 = 95.4;
        switch((v16 >> 1))
        {
          case 0u:
          case 3u:
            char v17 = 0;
            goto LABEL_16;
          case 1u:
            char v17 = 0;
            float v19 = 95.7;
            goto LABEL_18;
          case 7u:
            goto LABEL_18;
          case 9u:
            char v17 = 0;
            v18 = (float *)&dword_8AC00;
LABEL_16:
            *(float *)&int v21 = 97.0;
            goto LABEL_17;
          default:
            return v15;
        }
      }

      if (a4 == 4110 && a5 == 259)
      {
        char v17 = 0;
        v18 = (float *)&dword_8AC44;
        *(float *)&int v21 = 92.0;
LABEL_17:
        float v19 = *(float *)&v21;
      }

      else
      {
        if (a4 != 771 || a5 != 474) {
          return v15;
        }
        char v17 = 0;
        v18 = (float *)&dword_8AC88;
        float v19 = 92.8;
      }
    }

- (void)dealloc
{
  self->_audioDevice = 0LL;

  self->_centralManager = 0LL;
  self->_peripheral = 0LL;

  self->_uuid = 0LL;
  self->_dosimetrySensitivityCharacteristic = 0LL;

  self->_dosimetryVolumeCurveCharacteristic = 0LL;
  self->_characteristics = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTHearingHealthObject;
  -[BTHearingHealthObject dealloc](&v3, "dealloc");
}

- (void)registerService
{
  if (-[BTHearingHealthObject centralManager](self, "centralManager"))
  {
    if (-[CBCentralManager state](-[BTHearingHealthObject centralManager](self, "centralManager"), "state") == (char *)&dword_4 + 1)
    {
      v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableArray addObject:]( v3,  "addObject:",  +[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDAppleHeadsetPropertyServiceString));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v3,  CBConnectionEventMatchingOptionServiceUUIDs);
      -[CBCentralManager registerForConnectionEventsWithOptions:]( -[BTHearingHealthObject centralManager](self, "centralManager"),  "registerForConnectionEventsWithOptions:",  v4);
    }
  }

- (void)connectPeripheral:(id)a3
{
  if (-[CBCentralManager state](-[BTHearingHealthObject centralManager](self, "centralManager"), "state") == (char *)&dword_4 + 1) {
    -[CBCentralManager connectPeripheral:options:]( -[BTHearingHealthObject centralManager](self, "centralManager"),  "connectPeripheral:options:",  a3,  0LL);
  }
}

- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[CBCentralManager state](-[BTHearingHealthObject centralManager](self, "centralManager"), "state") == (char *)&dword_4 + 1
    && [a3 state])
  {
    v7 = &__kCFBooleanTrue;
    if (!v4) {
      v7 = &__kCFBooleanFalse;
    }
    v8[0] = CBCancelPeripheralConnectionOptionForce;
    v8[1] = CBCancelPeripheralConnectionOptionDoNotAutoConnectBuiltInServices;
    v9[0] = v7;
    v9[1] = &__kCFBooleanFalse;
    -[CBCentralManager cancelPeripheralConnection:options:]( -[BTHearingHealthObject centralManager](self, "centralManager"),  "cancelPeripheralConnection:options:",  a3,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  }

- (void)centralManagerDidUpdateState:(id)a3
{
  if (-[CBCentralManager state](-[BTHearingHealthObject centralManager](self, "centralManager", a3), "state") == (char *)&dword_4 + 1)
  {
    -[BTHearingHealthObject registerService](self, "registerService");
  }

  else if (-[CBCentralManager state](-[BTHearingHealthObject centralManager](self, "centralManager"), "state") == &dword_4 {
         || -[CBCentralManager state](-[BTHearingHealthObject centralManager](self, "centralManager"), "state") == (char *)&dword_0 + 1)
  }
  {
    -[BTHearingHealthObject setPeripheral:](self, "setPeripheral:", 0LL);
  }

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  if (objc_msgSend( objc_msgSend(a4, "identifier", a3),  "isEqual:",  -[BTHearingHealthObject uuid](self, "uuid")))
  {
    v6 = (os_log_s *)qword_95A88;
    if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = -[BTHearingHealthObject uuid](self, "uuid");
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Connected AHPS peripheral - UUID=%@", (uint8_t *)&v7, 0xCu);
    }

    [a4 setDelegate:self];
    -[CBPeripheral discoverServices:](-[BTHearingHealthObject peripheral](self, "peripheral"), "discoverServices:", 0LL);
  }

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = objc_msgSend(a3, "services", 0);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = CBUUIDAppleHeadsetPropertyServiceString;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(v11, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v9)))
        {
          v12 = (os_log_s *)qword_95A88;
          if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_DEFAULT))
          {
            v13 = -[BTHearingHealthObject uuid](self, "uuid");
            *(_DWORD *)buf = 138412290;
            float v19 = v13;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Discovered AHPS - UUID=%@", buf, 0xCu);
          }

          -[CBPeripheral discoverCharacteristics:forService:]( -[BTHearingHealthObject peripheral](self, "peripheral"),  "discoverCharacteristics:forService:",  0LL,  v11);
          return;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = objc_msgSend(a4, "characteristics", a3, 0);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = CBUUIDDosimetrySensitivityCharacteristicString;
    uint64_t v11 = CBUUIDDosimetryVolumeCurveCharacteristicString;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(v13, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v10)))
        {
          -[BTHearingHealthObject setDosimetrySensitivityCharacteristic:]( self,  "setDosimetrySensitivityCharacteristic:",  v13);
        }

        else if (objc_msgSend( objc_msgSend(v13, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v11)))
        {
          -[BTHearingHealthObject setDosimetryVolumeCurveCharacteristic:]( self,  "setDosimetryVolumeCurveCharacteristic:",  v13);
        }

        if (-[NSMutableArray containsObject:]( -[BTHearingHealthObject characteristics](self, "characteristics"),  "containsObject:",  [v13 UUID])) {
          -[BTHearingHealthObject readData:](self, "readData:", v13);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v6 = (os_log_s *)qword_95A88;
  if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = -[BTHearingHealthObject uuid](self, "uuid");
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Failed to connect AHPS peripheral - UUID=%@", (uint8_t *)&v7, 0xCu);
  }

  -[BTHearingHealthObject setPeripheral:](self, "setPeripheral:", 0LL);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v6 = (os_log_s *)qword_95A88;
  if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = -[BTHearingHealthObject uuid](self, "uuid");
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Disconnected AHPS peripheral - UUID=%@", (uint8_t *)&v7, 0xCu);
  }

  -[BTHearingHealthObject setPeripheral:](self, "setPeripheral:", 0LL);
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  if (a4)
  {
    if (a4 == 1
      && objc_msgSend( objc_msgSend(a5, "identifier", a3),  "isEqual:",  -[BTHearingHealthObject uuid](self, "uuid"))
      && !-[BTHearingHealthObject peripheral](self, "peripheral"))
    {
      -[BTHearingHealthObject setPeripheral:](self, "setPeripheral:", a5);
      -[BTHearingHealthObject connectPeripheral:](self, "connectPeripheral:", a5);
    }
  }

  else
  {
    -[BTHearingHealthObject disconnectPeripheral:force:](self, "disconnectPeripheral:force:", a5);
  }

- (id)centralManagerStateString
{
  v2 = (char *)-[CBCentralManager state](-[BTHearingHealthObject centralManager](self, "centralManager"), "state");
  else {
    return off_82220[(void)(v2 - 1)];
  }
}

- (void)writeData:(id)a3 forCharacteristic:(id)a4
{
}

- (void)readData:(id)a3
{
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  if (-[BTHearingHealthObject audioDevice](self, "audioDevice"))
  {
    id v9 = [a4 UUID];
    if (objc_msgSend( v9,  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  CBUUIDDosimetrySensitivityCharacteristicString)))
    {
      if (a5)
      {
        if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_ERROR)) {
          sub_5C0F8(a3);
        }
      }

      else if ((unint64_t)objc_msgSend(objc_msgSend(a4, "value"), "length") < 4)
      {
        if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_ERROR)) {
          sub_5C074(a3);
        }
      }

      else
      {
        LODWORD(v18) = 0;
        objc_msgSend(objc_msgSend(a4, "value"), "getBytes:length:", &v18, 4);
        uint64_t v11 = -[BTHearingHealthObject audioDevice](self, "audioDevice");
        (*(void (**)(void *, float))(*(void *)v11 + 1344LL))(v11, *(float *)&v18);
      }
    }

    else
    {
      id v10 = [a4 UUID];
      if (objc_msgSend( v10,  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  CBUUIDDosimetryVolumeCurveCharacteristicString)))
      {
        if (a5)
        {
          if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_ERROR)) {
            sub_5C1EC(a3);
          }
        }

        else if ((unint64_t)objc_msgSend(objc_msgSend(a4, "value"), "length") < 0x44)
        {
          if (os_log_type_enabled((os_log_t)qword_95A88, OS_LOG_TYPE_ERROR)) {
            sub_5C168(a3);
          }
        }

        else
        {
          int v28 = 0;
          memset(v27, 0, sizeof(v27));
          v12 = v27;
          objc_msgSend(objc_msgSend(a4, "value"), "getBytes:length:", v27, 68);
          uint64_t v13 = 0LL;
          uint64_t v26 = 0LL;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          do
          {
            *(void *)((char *)&v18 + v13) = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, v12);
            v13 += 8LL;
            v12 = (_OWORD *)((char *)v12 + 4);
          }

          while (v13 != 136);
          CFArrayRef v14 = CFArrayCreate(kCFAllocatorDefault, (const void **)&v18, 17LL, &kCFTypeArrayCallBacks);
          __int128 v15 = -[BTHearingHealthObject audioDevice](self, "audioDevice", v18, v19, v20, v21, v22, v23, v24, v25, v26);
          (*(void (**)(void *, CFArrayRef))(*(void *)v15 + 1352LL))(v15, v14);
          for (uint64_t i = 0LL; i != 136; i += 8LL)
          {
            __int128 v17 = *(const void **)((char *)&v18 + i);
            if (v17) {
              CFRelease(v17);
            }
          }

          if (v14) {
            CFRelease(v14);
          }
        }
      }
    }
  }

- (float)getRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4
{
  result = (float *)&dword_8AA68;
  switch(a4)
  {
    case 0x2003u:
    case 0x2005u:
      id v5 = (float *)&unk_8AB78;
      goto LABEL_10;
    case 0x2004u:
    case 0x2007u:
    case 0x2008u:
      return result;
    case 0x2006u:
      id v5 = (float *)&unk_8AB34;
      goto LABEL_10;
    case 0x2009u:
      id v5 = (float *)&unk_8AAF0;
LABEL_10:
      if (a3) {
        result = v5;
      }
      else {
        result = (float *)&unk_8AAAC;
      }
      break;
    default:
      id v6 = (float *)&unk_8AB78;
      if (!a3) {
        id v6 = (float *)&unk_8AAAC;
      }
      if (a4 == 8208) {
        result = v6;
      }
      break;
  }

  return result;
}

- (void)updateRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4 audioDevice:(void *)a5
{
  if (a5)
  {
    id v6 = -[BTHearingHealthObject getRegionalDosimetryVolumeCurve:productID:]( self,  "getRegionalDosimetryVolumeCurve:productID:",  a3,  *(void *)&a4);
    uint64_t v7 = 0LL;
    uint64_t v12 = 0LL;
    memset(v11, 0, sizeof(v11));
    do
    {
      *(void *)((char *)v11 + v7) = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, v6);
      v7 += 8LL;
      ++v6;
    }

    while (v7 != 136);
    CFArrayRef v8 = CFArrayCreate(kCFAllocatorDefault, (const void **)v11, 17LL, &kCFTypeArrayCallBacks);
    (*(void (**)(void *, CFArrayRef))(*(void *)a5 + 1352LL))(a5, v8);
    for (uint64_t i = 0LL; i != 136; i += 8LL)
    {
      id v10 = *(const void **)((char *)v11 + i);
      if (v10) {
        CFRelease(v10);
      }
    }

    CFRelease(v8);
  }

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (CBCharacteristic)dosimetrySensitivityCharacteristic
{
  return self->_dosimetrySensitivityCharacteristic;
}

- (void)setDosimetrySensitivityCharacteristic:(id)a3
{
}

- (CBCharacteristic)dosimetryVolumeCurveCharacteristic
{
  return self->_dosimetryVolumeCurveCharacteristic;
}

- (void)setDosimetryVolumeCurveCharacteristic:(id)a3
{
}

- (NSMutableArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (void)audioDevice
{
  return self->_audioDevice;
}

- (void)setAudioDevice:(void *)a3
{
  self->_audioDevice = a3;
}

  ;
}

@end