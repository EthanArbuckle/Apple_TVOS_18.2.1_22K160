@interface RPDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)idsDeviceIdentifierConflict;
- (BOOL)needsSetup;
- (CUMobileDevice)mobileDevice;
- (CUPairedPeer)pairedPeer;
- (CURangingMeasurement)relativeLocation;
- (NSData)authTag;
- (NSData)bleAdvertisementData;
- (NSData)bleAuthTag;
- (NSData)bleDeviceAddress;
- (NSData)txtData;
- (NSData)wifiAddress;
- (NSData)wifiBSSID;
- (NSData)wifiDeviceIEDeviceID;
- (NSData)wifiDeviceIEName;
- (NSData)wifiIEData;
- (NSDate)activityLevelTimeStamp;
- (NSDictionary)txtDictionary;
- (NSString)accountID;
- (NSString)contactID;
- (NSString)identifier;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)udid;
- (NSString)wifiSSID;
- (NSUUID)identifierUUID;
- (NSUUID)pairingIdentifier;
- (RPDevice)init;
- (RPDevice)initWithCoder:(id)a3;
- (SFDevice)bleDevice;
- (double)timeSinceLastActivityLevelChange;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)wifiPlatformObject;
- (int)activityLevel;
- (int)proximity;
- (int)rawRSSI;
- (int)smoothedRSSI;
- (unsigned)blePairState;
- (unsigned)deviceActionType;
- (unsigned)flags;
- (unsigned)systemPairState;
- (unsigned)updateWithBonjourDevice:(id)a3;
- (unsigned)updateWithMobileDevice:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3 changes:(unsigned int)a4;
- (unsigned)wifiDeviceIEFlags;
- (void)_updateTXTDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBleDevice:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierUUID:(id)a3;
- (void)setMobileDevice:(id)a3;
- (void)setName:(id)a3;
- (void)setPairedPeer:(id)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setRelativeLocation:(id)a3;
- (void)setSystemPairState:(unsigned int)a3;
- (void)setUdid:(id)a3;
- (void)setWifiAddress:(id)a3;
- (void)setWifiBSSID:(id)a3;
- (void)setWifiDeviceIEDeviceID:(id)a3;
- (void)setWifiDeviceIEName:(id)a3;
- (void)setWifiIEData:(id)a3;
- (void)setWifiPlatformObject:(id)a3;
- (void)setWifiSSID:(id)a3;
- (void)updateWithSystemInfo:(id)a3;
- (void)updateWithWiFiDevice:(id)a3 changes:(unsigned int)a4;
@end

@implementation RPDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPDevice;
  v2 = -[RPDevice init](&v6, sel_init);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (RPDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___RPDevice;
  v5 = -[RPDevice init](&v17, sel_init);
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    id v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t activityLevel = self->_activityLevel;
  id v17 = v4;
  if ((_DWORD)activityLevel)
  {
    [v4 encodeInteger:activityLevel forKey:@"al"];
    id v4 = v17;
  }

  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  if (activityLevelTimeStamp)
  {
    [v17 encodeObject:activityLevelTimeStamp forKey:@"alts"];
    id v4 = v17;
  }

  accountID = self->_accountID;
  if (accountID)
  {
    [v17 encodeObject:accountID forKey:@"aid"];
    id v4 = v17;
  }

  bleAuthTag = self->_bleAuthTag;
  if (bleAuthTag)
  {
    [v17 encodeObject:bleAuthTag forKey:@"atag"];
    id v4 = v17;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    [v17 encodeObject:contactID forKey:@"cnid"];
    id v4 = v17;
  }

  uint64_t flags = self->_flags;
  if ((_DWORD)flags)
  {
    [v17 encodeInt64:flags forKey:@"fl"];
    id v4 = v17;
  }

  identifier = self->_identifier;
  if (identifier)
  {
    [v17 encodeObject:identifier forKey:@"id"];
    id v4 = v17;
  }

  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  if (idsDeviceIdentifier)
  {
    [v17 encodeObject:idsDeviceIdentifier forKey:@"ids"];
    id v4 = v17;
  }

  if (self->_idsDeviceIdentifierConflict)
  {
    [v17 encodeBool:1 forKey:@"idsc"];
    id v4 = v17;
  }

  model = self->_model;
  if (model)
  {
    [v17 encodeObject:model forKey:@"md"];
    id v4 = v17;
  }

  name = self->_name;
  if (name)
  {
    [v17 encodeObject:name forKey:@"nm"];
    id v4 = v17;
  }

  uint64_t proximity = self->_proximity;
  if ((_DWORD)proximity)
  {
    [v17 encodeInteger:proximity forKey:@"px"];
    id v4 = v17;
  }

  relativeLocation = self->_relativeLocation;
  if (relativeLocation)
  {
    [v17 encodeObject:relativeLocation forKey:@"rl"];
    id v4 = v17;
  }
}

- (id)description
{
  return -[RPDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4 = 0LL;
  v5 = self->_identifier;
  id v6 = self->_idsDeviceIdentifier;
  BOOL idsDeviceIdentifierConflict = self->_idsDeviceIdentifierConflict;
  if (-[NSString isEqual:](v6, "isEqual:", v5))
  {

    BOOL v8 = shouldPrintSensitiveData();
    v5 = 0LL;
  }

  else
  {
    BOOL v8 = shouldPrintSensitiveData();
    if (v5)
    {
      formatSensitiveData((uint64_t)", ID ", v8);
      NSAppendPrintF();
      id v9 = v4;

      id v4 = v9;
    }
  }

  if (v6)
  {
    formatSensitiveData((uint64_t)", IDS ", v8);
    NSAppendPrintF();
    id v10 = v4;

    if (idsDeviceIdentifierConflict)
    {
      NSAppendPrintF();
      id v4 = v10;
    }

    else
    {
      id v4 = v10;
    }
  }

  name = self->_name;
  if (name)
  {
    id v12 = name;
    formatSensitiveData((uint64_t)", Nm ", v8);
    NSAppendPrintF();
    id v13 = v4;

    id v4 = v13;
  }

  model = self->_model;
  if (model)
  {
    v15 = model;
    formatSensitiveData((uint64_t)", Md ", v8);
    NSAppendPrintF();
    id v16 = v4;

    id v4 = v16;
  }

  accountID = self->_accountID;
  if (accountID)
  {
    uint64_t v18 = accountID;
    formatSensitiveData((uint64_t)", AID ", v8);
    NSAppendPrintF();
    id v19 = v4;

    id v4 = v19;
  }

  udid = self->_udid;
  if (udid)
  {
    v21 = udid;
    formatSensitiveData((uint64_t)", UDID ", v8);
    NSAppendPrintF();
    id v22 = v4;

    id v4 = v22;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    v24 = contactID;
    formatSensitiveData((uint64_t)", CNID ", v8);
    NSAppendPrintF();
    id v25 = v4;

    id v4 = v25;
  }

  if (v8)
  {
    v26 = self->_wifiAddress;
    if (-[NSData length](v26, "length") == 6)
    {
      -[NSData bytes](v26, "bytes");
      NSAppendPrintF();
      id v27 = v4;

      id v4 = v27;
    }

    bleAuthTag = self->_bleAuthTag;
    if (bleAuthTag)
    {
      v45 = bleAuthTag;
      NSAppendPrintF();
      id v29 = v4;

      id v4 = v29;
    }

    bleDeviceAddress = self->_bleDeviceAddress;
    if (bleDeviceAddress)
    {
      v42 = bleDeviceAddress;
      NSAppendPrintF();
      id v31 = v4;

      id v4 = v31;
    }

    if (self->_proximity)
    {
      NSAppendPrintF();
      id v33 = v4;

      id v4 = v33;
    }

    relativeLocation = self->_relativeLocation;
    if (relativeLocation)
    {
      v43 = relativeLocation;
      NSAppendPrintF();
      id v35 = v4;

      id v4 = v35;
    }

    if (self->_activityLevel)
    {
      NSAppendPrintF();
      id v36 = v4;

      id v4 = v36;
    }

    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      v44 = activityLevelTimeStamp;
      NSAppendPrintF();
      id v38 = v4;

      id v4 = v38;
    }
  }

  if (self->_flags)
  {
    NSAppendPrintF();
    id v39 = v4;

    id v4 = v39;
  }

  id v40 = v4;

  return v40;
}

- (double)timeSinceLastActivityLevelChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 timeIntervalSinceDate:self->_activityLevelTimeStamp];
  double v5 = v4;

  return v5;
}

- (void)_updateTXTDictionary:(id)a3
{
  id v4 = a3;
  [v4 bytes];
  [v4 length];
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  while (TXTRecordGetNextItem())
  {
    id v6 = (void *)[objc_alloc(NSString) initWithBytes:v13 length:v12 encoding:4];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(NSString) initWithBytes:v11 length:v10 encoding:4];
      if (v7) {
        [v5 setObject:v7 forKeyedSubscript:v6];
      }
    }
  }

  BOOL v8 = (NSDictionary *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v5];
  txtDictionary = self->_txtDictionary;
  self->_txtDictionary = v8;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v4 = a3;
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  if (v22 || self->_deviceActionType == Int64Ranged)
  {
    unsigned int v6 = 0;
  }

  else
  {
    self->_deviceActionType = Int64Ranged;
    unsigned int v6 = 2;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v7;
  if (v7)
  {
    name = self->_name;
    uint64_t v10 = v7;
    uint64_t v11 = name;
    if (v10 == v11)
    {

      goto LABEL_13;
    }

    uint64_t v12 = v11;
    if (v11)
    {
      char v13 = -[NSString isEqual:](v10, "isEqual:", v11);

      if ((v13 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_name, v8);
    unsigned int v6 = 2;
  }

- (unsigned)updateWithMobileDevice:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mobileDevice, a3);
  [v5 internalModel];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6 && ([v6 isEqual:self->_model] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_model, v7);
    unsigned int v8 = 2;
  }

  else
  {
    unsigned int v8 = 0;
  }

  [v5 name];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && ([v9 isEqual:self->_name] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_name, v9);
    unsigned int v8 = 2;
  }

  else {
    unsigned int v10 = 10;
  }
  if (v10 != self->_systemPairState)
  {
    self->_systemPairState = v10;
    unsigned int v8 = 2;
  }

  [v5 udid];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && ([v11 isEqual:self->_udid] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_udid, v11);
    unsigned int v8 = 2;
  }

  [v5 wifiAddress];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    CFGetHardwareAddress();
    if (v18)
    {

      char v13 = 0LL;
    }

    else
    {
      char v13 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v17 length:6];

      if (v13)
      {
        wifiAddress = self->_wifiAddress;
        p_wifiAddress = &self->_wifiAddress;
        if (([v13 isEqual:wifiAddress] & 1) == 0)
        {
          objc_storeStrong((id *)p_wifiAddress, v13);
          unsigned int v8 = 2;
        }
      }
    }
  }

  return v8;
}

- (unsigned)updateWithSFDevice:(id)a3 changes:(unsigned int)a4
{
  char v4 = a4;
  id v7 = a3;
  [v7 bleDevice];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_bleDevice, a3);
  if ((v4 & 9) == 0)
  {
    unsigned int v9 = 0;
    if ((v4 & 2) == 0) {
      goto LABEL_104;
    }
    goto LABEL_94;
  }

  [v8 advertisementFields];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accountID)
  {
    unsigned int v9 = 0;
  }

  else
  {
    [v7 accountID];
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      unsigned int v9 = 2;
    }

    else
    {
      unsigned int v9 = 0;
    }
  }

  [v7 bleDevice];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 decryptedActivityLevel];
  if (v12 != 16 && self->_activityLevel != v12)
  {
    self->_uint64_t activityLevel = v12;
    [MEMORY[0x189603F50] date];
    char v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    self->_activityLevelTimeStamp = v13;

    unsigned int v9 = 2;
  }

  [v8 advertisementData];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v15;
  v68 = v11;
  if (v15)
  {
    bleAdvertisementData = self->_bleAdvertisementData;
    int v18 = v15;
    id v19 = bleAdvertisementData;
    if (v18 == v19)
    {

      goto LABEL_21;
    }

    char v20 = v19;
    if (v19)
    {
      char v21 = -[NSData isEqual:](v18, "isEqual:", v19, v68);

      if ((v21 & 1) != 0) {
        goto LABEL_21;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_bleAdvertisementData, v16);
    v9 |= 1u;
  }

- (void)updateWithSystemInfo:(id)a3
{
  id v7 = a3;
  NSDictionaryGetNSUUID();
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    objc_storeStrong((id *)&self->_pairingIdentifier, v4);
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    objc_storeStrong((id *)&self->_name, v5);
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    objc_storeStrong((id *)&self->_model, v6);
  }
}

- (void)updateWithWiFiDevice:(id)a3 changes:(unsigned int)a4
{
  id v11 = a3;
  [v11 bssid];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    objc_storeStrong((id *)&self->_wifiBSSID, v5);
  }
  [v11 deviceIEDeviceID];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    objc_storeStrong((id *)&self->_wifiDeviceIEDeviceID, v6);
  }
  self->_wifiDeviceIEFlags = [v11 deviceIEFlags];
  [v11 deviceIEName];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    objc_storeStrong((id *)&self->_wifiDeviceIEName, v7);
  }
  [v11 ieData];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    objc_storeStrong((id *)&self->_wifiIEData, v8);
  }
  [v11 platformObject];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    objc_storeStrong(&self->_wifiPlatformObject, v9);
  }
  [v11 ssid];
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    objc_storeStrong((id *)&self->_wifiSSID, v10);
  }
}

- (NSString)accountID
{
  return self->_accountID;
}

- (int)activityLevel
{
  return self->_activityLevel;
}

- (NSDate)activityLevelTimeStamp
{
  return self->_activityLevelTimeStamp;
}

- (NSData)bleAuthTag
{
  return self->_bleAuthTag;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (BOOL)idsDeviceIdentifierConflict
{
  return self->_idsDeviceIdentifierConflict;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)proximity
{
  return self->_proximity;
}

- (CURangingMeasurement)relativeLocation
{
  return (CURangingMeasurement *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setRelativeLocation:(id)a3
{
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (CUMobileDevice)mobileDevice
{
  return self->_mobileDevice;
}

- (void)setMobileDevice:(id)a3
{
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)bleAdvertisementData
{
  return self->_bleAdvertisementData;
}

- (NSData)bleDeviceAddress
{
  return self->_bleDeviceAddress;
}

- (unsigned)blePairState
{
  return self->_blePairState;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (void)setIdentifierUUID:(id)a3
{
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (int)smoothedRSSI
{
  return self->_smoothedRSSI;
}

- (unsigned)systemPairState
{
  return self->_systemPairState;
}

- (void)setSystemPairState:(unsigned int)a3
{
  self->_systemPairState = a3;
}

- (NSData)txtData
{
  return self->_txtData;
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
}

- (NSData)wifiAddress
{
  return self->_wifiAddress;
}

- (void)setWifiAddress:(id)a3
{
}

- (NSData)wifiBSSID
{
  return self->_wifiBSSID;
}

- (void)setWifiBSSID:(id)a3
{
}

- (NSData)wifiDeviceIEDeviceID
{
  return self->_wifiDeviceIEDeviceID;
}

- (void)setWifiDeviceIEDeviceID:(id)a3
{
}

- (unsigned)wifiDeviceIEFlags
{
  return self->_wifiDeviceIEFlags;
}

- (NSData)wifiDeviceIEName
{
  return self->_wifiDeviceIEName;
}

- (void)setWifiDeviceIEName:(id)a3
{
}

- (NSData)wifiIEData
{
  return self->_wifiIEData;
}

- (void)setWifiIEData:(id)a3
{
}

- (id)wifiPlatformObject
{
  return self->_wifiPlatformObject;
}

- (void)setWifiPlatformObject:(id)a3
{
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end