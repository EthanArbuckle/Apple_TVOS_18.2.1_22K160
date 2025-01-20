@interface CUBLEDevice
- ($7EB1B296D1955B59A85A052388D5D5F9)proximityPairingLastConnectedHost;
- (NSData)addressData;
- (NSData)appleManufacturerData;
- (NSData)lgBTAddress;
- (NSData)lgDeviceID;
- (NSData)manufacturerData;
- (NSData)nearbyAuthTag;
- (NSData)objectDiscoveryNearOwnerID;
- (NSData)objectDiscoveryPublicKeyData;
- (NSString)identifier;
- (NSString)objectSetupFontCode;
- (NSString)objectSetupMessage;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)nearbyActionType;
- (int)objectDiscoveryMode;
- (int)objectSetupBatteryPerformance;
- (int)proximityPairingSubType;
- (int)rawRSSI;
- (unsigned)changeFlags;
- (unsigned)deviceFlags;
- (unsigned)lgFlags;
- (unsigned)nearbyActivityLevel;
- (unsigned)nearbyFlags;
- (unsigned)objectDiscoveryBatteryState;
- (unsigned)objectDiscoveryProductID;
- (unsigned)objectSetupBatteryState;
- (unsigned)objectSetupColorCode;
- (unsigned)objectSetupFlags;
- (unsigned)proximityPairingAudioSourceCount;
- (unsigned)proximityPairingProductID;
- (unsigned)scanFlags;
- (unsigned)updateWithAdvertisementData:(id)a3 rssi:(int)a4 oldDevice:(id)a5;
- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4 data:(id)a5;
- (void)_parseAppleNearbyActionPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleNearbyInfoPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleProximityPairingPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleProximityPairingStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseLGManufacturerPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5;
- (void)_parseManufacturerData:(id)a3 advertisementFields:(id)a4;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceFlags:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CUBLEDevice

- (id)description
{
  return -[CUBLEDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v57 = 0LL;
  identifier = self->_identifier;
  NSAppendPrintF(&v57);
  v5 = v57;
  v6 = self->_addressData;
  v7 = v6;
  if (v6)
  {
    CFMutableStringRef v56 = v5;
    if (-[NSData length](v6, "length", identifier) == 6) {
      -[NSData bytes](v7, "bytes");
    }
    NSAppendPrintF(&v56);
    v8 = v56;

    v5 = v8;
  }

  CFMutableStringRef v55 = v5;
  uint64_t rawRSSI = self->_rawRSSI;
  NSAppendPrintF(&v55);
  v9 = v55;

  if (a3 < 50)
  {
    v10 = self->_appleManufacturerData;
    v11 = v10;
    if (v10)
    {
      CFMutableStringRef v54 = v9;
      v12 = v10;
      -[NSData bytes](v12, "bytes", rawRSSI);
      -[NSData length](v12, "length");
      NSAppendPrintF(&v54);
      v13 = v54;
    }

    else
    {
      manufacturerData = self->_manufacturerData;
      if (!manufacturerData)
      {
LABEL_11:

        goto LABEL_12;
      }

      CFMutableStringRef v53 = v9;
      v15 = manufacturerData;
      -[NSData bytes](v15, "bytes", rawRSSI);
      -[NSData length](v15, "length");
      NSAppendPrintF(&v53);
      v13 = v53;

      v9 = (__CFString *)v15;
    }

    v9 = v13;
    goto LABEL_11;
  }

- (unsigned)updateWithAdvertisementData:(id)a3 rssi:(int)a4 oldDevice:(id)a5
{
  v8 = (const __CFDictionary *)a3;
  id v9 = a5;
  id v10 = (id)getCBAdvertisementDataDeviceAddress[0]();
  CFDictionaryGetCFDataOfLength(v8, v10, 6LL, 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v9 addressData];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v11;
    id v14 = v12;
    v15 = v14;
    if (v13 == v14)
    {
      unsigned int v16 = 0;
    }

    else
    {
      unsigned int v16 = 2;
      if (v14)
      {
        else {
          unsigned int v16 = 2;
        }
      }
    }

    objc_storeStrong((id *)&self->_addressData, v11);
  }

  else
  {
    unsigned int v16 = 0;
  }

  id CBAdvertisementDataManufacturerDataKey = getCBAdvertisementDataManufacturerDataKey();
  CFTypeID TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v8, CBAdvertisementDataManufacturerDataKey, TypeID, 0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    [v9 manufacturerData];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = v19;
    id v22 = v20;
    v23 = v22;
    if (v21 == v22)
    {
      int v24 = 0;
    }

    else if (v22)
    {
      int v24 = [v21 isEqual:v22] ^ 1;
    }

    else
    {
      int v24 = 1;
    }

    v16 |= v24;
    objc_storeStrong((id *)&self->_manufacturerData, v19);
    -[CUBLEDevice _parseManufacturerData:advertisementFields:]( self,  "_parseManufacturerData:advertisementFields:",  v21,  v8);
  }

  else {
    int v25 = a4 - 126;
  }
  if (v25 != self->_rawRSSI)
  {
    v16 |= 8u;
    self->_uint64_t rawRSSI = v25;
  }

  return v16;
}

- (void)_parseManufacturerData:(id)a3 advertisementFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = v6;
  v8 = (unsigned __int16 *)[v14 bytes];
  uint64_t v9 = [v14 length];
  if (v9 >= 2)
  {
    id v10 = (char *)v8 + v9;
    int v13 = *v8;
    v12 = v8 + 1;
    int v11 = v13;
    if (v13 == 196)
    {
      -[CUBLEDevice _parseLGManufacturerPtr:end:fields:](self, "_parseLGManufacturerPtr:end:fields:", v12, v10, v7);
    }

    else if (v11 == 76)
    {
      -[CUBLEDevice _parseAppleManufacturerPtr:end:data:](self, "_parseAppleManufacturerPtr:end:data:", v12, v10, v14);
    }
  }
}

- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4 data:(id)a5
{
  id v11 = a5;
  if (a4 - a3 < 2)
  {
LABEL_13:
    objc_storeStrong((id *)&self->_appleManufacturerData, a5);
  }

  else
  {
    while (1)
    {
      int64_t v9 = a3[1] & 0x1F;
      if (a4 - (a3 + 2) < v9) {
        break;
      }
      int v10 = *(unsigned __int8 *)a3;
      a3 += v9 + 2;
      if (v10 > 15)
      {
        if (v10 == 16)
        {
          -[CUBLEDevice _parseAppleNearbyInfoPtr:end:](self, "_parseAppleNearbyInfoPtr:end:");
        }

        else if (v10 == 18)
        {
          -[CUBLEDevice _parseAppleObjectDiscoveryPtr:end:](self, "_parseAppleObjectDiscoveryPtr:end:");
        }
      }

      else if (v10 == 7)
      {
        -[CUBLEDevice _parseAppleProximityPairingPtr:end:](self, "_parseAppleProximityPairingPtr:end:");
      }

      else if (v10 == 15)
      {
        -[CUBLEDevice _parseAppleNearbyActionPtr:end:](self, "_parseAppleNearbyActionPtr:end:");
      }

      if (a4 - a3 <= 1) {
        goto LABEL_13;
      }
    }
  }
}

- (void)_parseAppleNearbyActionPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1)
  {
    unsigned int v5 = *(unsigned __int8 *)a3;
    int v6 = (v5 >> 4) & 8;
    self->_nearbyFlags |= (4 * v5) & 0x100 | (16 * v5) & 0x200 | v6;
    if ((uint64_t)&a4[~(unint64_t)a3] >= 1)
    {
      self->_nearbyActionType = *((unsigned __int8 *)a3 + 1);
      if (v6)
      {
        if (a4 - (a3 + 2) >= 3)
        {
          id v7 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 2 length:3];
          nearbyAuthTag = self->_nearbyAuthTag;
          self->_nearbyAuthTag = v7;
        }
      }
    }
  }

  self->_scanFlags |= 2u;
}

- (void)_parseAppleNearbyInfoPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v6 = 0;
  }

  else
  {
    int v5 = *(unsigned __int8 *)a3;
    self->_nearbyActivityLevel = v5 & 0xF;
    int v6 = (4 * v5) & 0xC0;
    if ((uint64_t)&a4[~(unint64_t)a3] >= 1)
    {
      unsigned int v7 = *((unsigned __int8 *)a3 + 1);
      v6 |= (8 * v7) & 0x20 | (16 * ((v7 >> 3) & 1)) | (v7 >> 3) & 4 | (v7 >> 1) & 8 | (v7 >> 5) & 2 | (v7 >> 7);
      if (((v7 >> 1) & 8) != 0 && a4 - (a3 + 2) >= 3)
      {
        v8 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 2 length:3];
        nearbyAuthTag = self->_nearbyAuthTag;
        self->_nearbyAuthTag = v8;
      }
    }
  }

  self->_nearbyFlags |= v6;
  self->_scanFlags |= 4u;
}

- (void)_parseAppleObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a4 - a3 >= 1)
  {
    v8 = a3 + 1;
    unsigned int v7 = *(unsigned __int8 *)a3;
    if ((v7 & 0x10) != 0) {
      unsigned __int16 v9 = 21760;
    }
    else {
      unsigned __int16 v9 = -26215;
    }
    int v10 = self->_addressData;
    if (-[NSData length](v10, "length") != 6) {
      goto LABEL_17;
    }
    if (a4 - v8 < 22)
    {
      uint64_t v15 = -[NSData bytes](v10, "bytes");
      __int16 v16 = *(_WORD *)(v15 + 4);
      int v18 = *(_DWORD *)v15;
      __int16 v19 = v16;
      if (a4 - v8 >= 1) {
        LOBYTE(v18) = v18 & 0x3F | (*v8 << 6);
      }
      int v13 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v18 length:6];
      self->_objectDiscoveryBatteryState = v7 >> 5;
      self->_objectDiscoveryMode = 1;
      self->_objectDiscoveryProductID = v9;
      if (!v13) {
        goto LABEL_16;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
      self->_objectDiscoveryNearOwnerID = v13;
    }

    else
    {
      uint64_t v11 = -[NSData bytes](v10, "bytes");
      __int16 v12 = *(_WORD *)(v11 + 4);
      int v18 = *(_DWORD *)v11;
      __int16 v19 = v12;
      *(_OWORD *)v20 = *(_OWORD *)v8;
      *(void *)&v20[14] = *(void *)(v8 + 14);
      if (a4 - (a3 + 23) >= 1) {
        LOBYTE(v18) = v18 & 0x3F | (a3[23] << 6);
      }
      int v13 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v18 length:28];
      self->_objectDiscoveryBatteryState = v7 >> 5;
      self->_objectDiscoveryMode = 2;
      self->_objectDiscoveryProductID = v9;
      if (!v13) {
        goto LABEL_16;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryPublicKeyData;
      self->_objectDiscoveryPublicKeyData = v13;
    }

    v17 = v13;

LABEL_16:
    self->_scanFlags |= 0x20u;
LABEL_17:
  }

- (void)_parseAppleProximityPairingPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    self->_proximityPairingProductID = 0;
    self->_proximityPairingSubType = 255;
    self->_scanFlags |= 0x10u;
  }

  else
  {
    int v7 = *(unsigned __int8 *)a3;
    int v5 = a3 + 1;
    int v6 = v7;
    if (a4 - v5 <= 1)
    {
      unsigned __int16 v8 = 0;
    }

    else
    {
      unsigned __int16 v8 = *(_WORD *)(a3 + 1);
      int v5 = a3 + 3;
    }

    self->_proximityPairingProductID = v8;
    self->_proximityPairingSubType = v6;
    self->_scanFlags |= 0x10u;
    if (v6 == 5)
    {
      -[CUBLEDevice _parseAppleProximityPairingObjectSetupPtr:end:]( self,  "_parseAppleProximityPairingObjectSetupPtr:end:",  v5);
    }

    else if (v6 == 1)
    {
      -[CUBLEDevice _parseAppleProximityPairingStatusPtr:end:](self, "_parseAppleProximityPairingStatusPtr:end:", v5);
    }
  }

- (void)_parseAppleProximityPairingStatusPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 6)
  {
    self->_proximityPairingAudioSourceCount = 0;
  }

  else
  {
    self->_proximityPairingAudioSourceCount = (a3[6] >> 2) & 3;
    if ((unint64_t)(a4 - a3) >= 0xD)
    {
      __int16 v4 = *((_WORD *)a3 + 5);
      self->_proximityPairingLastConnectedHost.bytes[2] = a3[12];
      *(_WORD *)self->_proximityPairingLastConnectedHost.bytes = v4;
      return;
    }
  }

  self->_proximityPairingLastConnectedHost.bytes[2] = 0;
  *(_WORD *)self->_proximityPairingLastConnectedHost.bytes = 0;
}

- (void)_parseAppleProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4
{
  self->_scanFlags |= 0x80u;
  if (a4 - a3 <= 0)
  {
    self->_objectSetupFlags = 0;
LABEL_8:
    objectSetupFontCode = self->_objectSetupFontCode;
    self->_objectSetupFontCode = 0LL;

    id v11 = 0LL;
    int v13 = 0LL;
    goto LABEL_9;
  }

  unsigned int v7 = *(unsigned __int8 *)a3;
  self->_objectSetupFlags = v7;
  unsigned int v8 = *((unsigned __int8 *)a3 + 1);
  self->_objectSetupBatteryState = v8 & 7;
  self->_objectSetupBatteryPerformance = (v8 >> 3) & 3;
  if (a4 - a3 - 2 <= 0) {
    goto LABEL_8;
  }
  unsigned __int16 v9 = a3 + 3;
  self->_objectSetupColorCode = a3[2];
  int64_t v10 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v10 >= 7)
  {
    id v18 = (id)[objc_alloc(NSString) initWithBytes:a3 + 3 length:7 encoding:4];
    unsigned __int16 v9 = a3 + 10;
    objc_storeStrong((id *)&self->_objectSetupFontCode, v18);
    id v11 = v18;
    int64_t v10 = a4 - (a3 + 10);
  }

  else
  {
    uint64_t v15 = self->_objectSetupFontCode;
    self->_objectSetupFontCode = 0LL;

    id v11 = 0LL;
    int v13 = 0LL;
    if ((v7 & 0x10) == 0) {
      goto LABEL_9;
    }
  }

  id v20 = v11;
  if (v10 < 1)
  {
    int v13 = 0LL;
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 12LL;
    while (v9[v16])
    {
      if (v17 == ++v16)
      {
        uint64_t v16 = v17;
        break;
      }
    }

    int v13 = (NSString *)[objc_alloc(NSString) initWithBytes:v9 length:v16 encoding:4];
  }

  id v11 = v20;
LABEL_9:
  id v19 = v11;
  objectSetupMessage = self->_objectSetupMessage;
  self->_objectSetupMessage = v13;
}

- (void)_parseLGManufacturerPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  self->_scanFlags |= 0x40u;
  self->_lgFlags = 0;
  if (a4 - a3 >= 4 && (a3[3] & 1) != 0) {
    self->_lgFlags = 3;
  }
  int v6 = (const __CFDictionary *)a5;
  CFTypeID TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v6, @"kCBAdvDataLeBluetoothDeviceAddress", TypeID, 0LL);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v11 length] >= 7)
  {
    uint64_t v8 = [v11 bytes];
    unsigned __int16 v9 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v8 + 1 length:6];
    lgBTAddress = self->_lgBTAddress;
    self->_lgBTAddress = v9;
  }
}

- (NSData)addressData
{
  return self->_addressData;
}

- (NSData)appleManufacturerData
{
  return self->_appleManufacturerData;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_deviceFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)lgBTAddress
{
  return self->_lgBTAddress;
}

- (NSData)lgDeviceID
{
  return self->_lgDeviceID;
}

- (unsigned)lgFlags
{
  return self->_lgFlags;
}

- (NSData)manufacturerData
{
  return self->_manufacturerData;
}

- (unsigned)nearbyActivityLevel
{
  return self->_nearbyActivityLevel;
}

- (int)nearbyActionType
{
  return self->_nearbyActionType;
}

- (NSData)nearbyAuthTag
{
  return self->_nearbyAuthTag;
}

- (unsigned)nearbyFlags
{
  return self->_nearbyFlags;
}

- (unsigned)objectDiscoveryBatteryState
{
  return self->_objectDiscoveryBatteryState;
}

- (int)objectDiscoveryMode
{
  return self->_objectDiscoveryMode;
}

- (NSData)objectDiscoveryNearOwnerID
{
  return self->_objectDiscoveryNearOwnerID;
}

- (unsigned)objectDiscoveryProductID
{
  return self->_objectDiscoveryProductID;
}

- (NSData)objectDiscoveryPublicKeyData
{
  return self->_objectDiscoveryPublicKeyData;
}

- (int)objectSetupBatteryPerformance
{
  return self->_objectSetupBatteryPerformance;
}

- (unsigned)objectSetupBatteryState
{
  return self->_objectSetupBatteryState;
}

- (unsigned)objectSetupColorCode
{
  return self->_objectSetupColorCode;
}

- (unsigned)objectSetupFlags
{
  return self->_objectSetupFlags;
}

- (NSString)objectSetupFontCode
{
  return self->_objectSetupFontCode;
}

- (NSString)objectSetupMessage
{
  return self->_objectSetupMessage;
}

- ($7EB1B296D1955B59A85A052388D5D5F9)proximityPairingLastConnectedHost
{
  return ($7EB1B296D1955B59A85A052388D5D5F9)(*(unsigned __int16 *)self->_proximityPairingLastConnectedHost.bytes | (self->_proximityPairingLastConnectedHost.bytes[2] << 16));
}

- (unsigned)proximityPairingProductID
{
  return self->_proximityPairingProductID;
}

- (int)proximityPairingSubType
{
  return self->_proximityPairingSubType;
}

- (unsigned)proximityPairingAudioSourceCount
{
  return self->_proximityPairingAudioSourceCount;
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (void).cxx_destruct
{
}

@end