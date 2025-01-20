@interface RPEndpoint
+ (BOOL)supportsSecureCoding;
+ (id)nullEndpoint;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)cameraCapabilityRequestIsActive;
- (BOOL)compareWithDeviceIdentifier:(id)a3;
- (BOOL)encodeSensitiveProperties;
- (BOOL)inDiscoverySession;
- (BOOL)present;
- (BOOL)removeBonjourDevice:(id)a3;
- (BOOL)removeCBDevice:(id)a3;
- (BOOL)removeSFDevice:(id)a3;
- (CBDevice)cbDevice;
- (CUBonjourDevice)bonjourDevice;
- (IDSDevice)idsDevice;
- (NSArray)homeKitUserIdentifiers;
- (NSArray)serviceTypes;
- (NSData)encodedBLETargetData;
- (NSDate)activityLevelTimeStamp;
- (NSDictionary)serviceInfo;
- (NSDictionary)verifiedAcl;
- (NSString)accountAltDSID;
- (NSString)accountID;
- (NSString)contactID;
- (NSString)identifier;
- (NSString)idsCorrelationIdentifier;
- (NSString)idsDeviceIdentifier;
- (NSString)ipAddress;
- (NSString)mediaRemoteIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)serviceType;
- (NSString)sourceVersion;
- (NSString)verifiedIdentity;
- (RPEndpoint)initWithCoder:(id)a3;
- (SFDevice)bleDevice;
- (id)bleTargetData;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)activityLevel;
- (int)linkType;
- (int)proximity;
- (unint64_t)statusFlags;
- (unsigned)cameraState;
- (unsigned)hotspotInfo;
- (unsigned)nearbyActionV2Type;
- (unsigned)removeIDSDevice;
- (unsigned)updateTrustStatusFlagsWithIdentity:(id)a3;
- (unsigned)updateWithBonjourDevice:(id)a3;
- (unsigned)updateWithCBDevice:(id)a3;
- (unsigned)updateWithEndpoint:(id)a3;
- (unsigned)updateWithFamilyEndpoint:(id)a3;
- (unsigned)updateWithIDSDevice:(id)a3;
- (unsigned)updateWithIdentity:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountAltDSID:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setActivityLevel:(int)a3;
- (void)setBleDevice:(id)a3;
- (void)setBonjourDevice:(id)a3;
- (void)setCameraCapabilityRequestIsActive:(BOOL)a3;
- (void)setCbDevice:(id)a3;
- (void)setEncodeSensitiveProperties:(BOOL)a3;
- (void)setEncodedBLETargetData:(id)a3;
- (void)setHomeKitUserIdentifiers:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsCorrelationIdentifier:(id)a3;
- (void)setIdsDevice:(id)a3;
- (void)setIdsDeviceIdentifier:(id)a3;
- (void)setInDiscoverySession:(BOOL)a3;
- (void)setIpAddress:(id)a3;
- (void)setLinkType:(int)a3;
- (void)setMediaRemoteIdentifier:(id)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNearbyActionV2Type:(unsigned __int8)a3;
- (void)setOperatingSystemVersion:(id *)a3;
- (void)setPresent:(BOOL)a3;
- (void)setServiceTypes:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)setStatusFlags:(unint64_t)a3;
- (void)setVerifiedAcl:(id)a3;
- (void)setVerifiedIdentity:(id)a3;
@end

@implementation RPEndpoint

+ (id)nullEndpoint
{
  return (id)nullEndpoint_sObj;
}

void __26__RPEndpoint_nullEndpoint__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___RPEndpoint);
  v1 = (void *)nullEndpoint_sObj;
  nullEndpoint_sObj = (uint64_t)v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___RPEndpoint;
  v5 = -[RPEndpoint init](&v29, sel_init);
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

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v19 = v18;
    id v20 = v19;

    id v21 = v20;
    id v22 = v21;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    id v23 = v22;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v24 = v23;

    id v25 = v24;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v26 = v25;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    objc_opt_class();
    NSDecodeNSDictionaryOfClassesIfPresent();
    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID) {
    [v30 encodeObject:accountAltDSID forKey:@"altDSID"];
  }
  accountID = self->_accountID;
  if (accountID) {
    [v30 encodeObject:accountID forKey:@"aID"];
  }
  uint64_t activityLevel = self->_activityLevel;
  if ((_DWORD)activityLevel) {
    [v30 encodeInteger:activityLevel forKey:@"acl"];
  }
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  if (activityLevelTimeStamp) {
    [v30 encodeObject:activityLevelTimeStamp forKey:@"aclTS"];
  }
  if (self->_cameraState) {
    objc_msgSend(v30, "encodeInteger:forKey:");
  }
  homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
  if (homeKitUserIdentifiers) {
    [v30 encodeObject:homeKitUserIdentifiers forKey:@"hkUI"];
  }
  uint64_t hotspotInfo = self->_hotspotInfo;
  if ((_DWORD)hotspotInfo) {
    [v30 encodeInt64:hotspotInfo forKey:@"hsI"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v30 encodeObject:identifier forKey:@"id"];
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  if (idsDeviceIdentifier) {
    [v30 encodeObject:idsDeviceIdentifier forKey:@"idsD"];
  }
  contactID = self->_contactID;
  if (contactID) {
    [v30 encodeObject:contactID forKey:@"cnID"];
  }
  if (self->_inDiscoverySession) {
    [v30 encodeBool:1 forKey:@"iLagS"];
  }
  ipAddress = self->_ipAddress;
  if (ipAddress) {
    [v30 encodeObject:ipAddress forKey:@"ipAdd"];
  }
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier) {
    [v30 encodeObject:mediaRemoteIdentifier forKey:@"MRI"];
  }
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier) {
    [v30 encodeObject:mediaRouteIdentifier forKey:@"MRtI"];
  }
  model = self->_model;
  if (model) {
    [v30 encodeObject:model forKey:@"md"];
  }
  name = self->_name;
  if (name) {
    [v30 encodeObject:name forKey:@"nm"];
  }
  int64_t majorVersion = self->_operatingSystemVersion.majorVersion;
  if (majorVersion) {
    [v30 encodeInteger:majorVersion forKey:@"osma"];
  }
  int64_t minorVersion = self->_operatingSystemVersion.minorVersion;
  if (minorVersion) {
    [v30 encodeInteger:minorVersion forKey:@"osmi"];
  }
  int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
  if (patchVersion) {
    [v30 encodeInteger:patchVersion forKey:@"osp"];
  }
  uint64_t proximity = self->_proximity;
  if ((_DWORD)proximity) {
    [v30 encodeInteger:proximity forKey:@"px"];
  }
  serviceInfo = self->_serviceInfo;
  if (serviceInfo) {
    [v30 encodeObject:serviceInfo forKey:@"si"];
  }
  serviceType = self->_serviceType;
  if (serviceType) {
    [v30 encodeObject:serviceType forKey:@"st"];
  }
  serviceTypes = self->_serviceTypes;
  if (serviceTypes) {
    [v30 encodeObject:serviceTypes forKey:@"stA"];
  }
  unint64_t statusFlags = self->_statusFlags;
  if (statusFlags) {
    [v30 encodeInt64:statusFlags forKey:@"sf"];
  }
  sourceVersion = self->_sourceVersion;
  if (sourceVersion) {
    [v30 encodeObject:sourceVersion forKey:@"sv"];
  }
  verifiedIdentity = self->_verifiedIdentity;
  if (verifiedIdentity) {
    [v30 encodeObject:verifiedIdentity forKey:@"vi"];
  }
  verifiedAcl = self->_verifiedAcl;
  if (verifiedAcl) {
    [v30 encodeObject:verifiedAcl forKey:@"vAcl"];
  }
  if (self->_encodeSensitiveProperties)
  {
    -[RPEndpoint bleTargetData](self, "bleTargetData");
    objc_super v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29) {
      [v30 encodeObject:v29 forKey:@"bleTD"];
    }
  }
}

- (id)description
{
  return -[RPEndpoint descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v72 = 0LL;
  NSAppendPrintF();
  id v5 = 0LL;
  id v6 = v5;
  identifier = self->_identifier;
  if (identifier)
  {
    id v71 = v5;
    v42 = identifier;
    NSAppendPrintF();
    id v8 = v71;

    id v6 = v8;
  }

  if (shouldPrintSensitiveData())
  {
    name = self->_name;
    if (name)
    {
      v70 = v6;
      v43 = name;
      NSAppendPrintF();
      id v10 = v6;

      id v6 = v10;
    }

    model = self->_model;
    if (model)
    {
      v69 = v6;
      v44 = model;
      NSAppendPrintF();
      id v12 = v6;

      id v6 = v12;
    }

    accountAltDSID = self->_accountAltDSID;
    if (accountAltDSID)
    {
      v68 = v6;
      v50 = accountAltDSID;
      NSAppendPrintF();
      id v14 = v6;

      id v6 = v14;
    }

    accountID = self->_accountID;
    if (accountID)
    {
      v67 = v6;
      v51 = accountID;
      NSAppendPrintF();
      id v16 = v6;

      id v6 = v16;
    }

    if (self->_activityLevel)
    {
      v66 = v6;
      NSAppendPrintF();
      id v17 = v6;

      id v6 = v17;
    }

    if (self->_cameraState)
    {
      v65 = v6;
      NSAppendPrintF();
      id v18 = v6;

      id v6 = v18;
    }

    homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
    if (homeKitUserIdentifiers)
    {
      v64 = v6;
      v52 = homeKitUserIdentifiers;
      NSAppendPrintF();
      id v20 = v6;

      id v6 = v20;
    }

    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    if (idsDeviceIdentifier)
    {
      v63 = v6;
      v53 = idsDeviceIdentifier;
      NSAppendPrintF();
      id v22 = v6;

      id v6 = v22;
    }

    contactID = self->_contactID;
    if (contactID)
    {
      v62 = v6;
      v54 = contactID;
      NSAppendPrintF();
      id v24 = v6;

      id v6 = v24;
    }

    mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
    if (mediaRemoteIdentifier)
    {
      v61 = v6;
      v55 = mediaRemoteIdentifier;
      NSAppendPrintF();
      id v26 = v6;

      id v6 = v26;
    }

    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    if (mediaRouteIdentifier)
    {
      v60 = v6;
      v56 = mediaRouteIdentifier;
      NSAppendPrintF();
      id v28 = v6;

      id v6 = v28;
    }

    if (self->_operatingSystemVersion.majorVersion)
    {
      id v59 = v6;
      __int128 v57 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
      int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
      RPNSOperatingSystemVersionToString((uint64_t *)&v57);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF();
      id v29 = v59;

      id v6 = v29;
    }

    verifiedIdentity = self->_verifiedIdentity;
    if (verifiedIdentity)
    {
      v46 = verifiedIdentity;
      NSAppendPrintF();
      id v31 = v6;

      id v6 = v31;
    }

    sourceVersion = self->_sourceVersion;
    if (sourceVersion)
    {
      v47 = sourceVersion;
      NSAppendPrintF();
      id v33 = v6;

      id v6 = v33;
    }

    if (self->_proximity)
    {
      NSAppendPrintF();
      id v35 = v6;

      id v6 = v35;
    }
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    v48 = serviceType;
    NSAppendPrintF();
    id v37 = v6;

    id v6 = v37;
  }

  if (self->_statusFlags)
  {
    NSAppendPrintF();
    id v38 = v6;

    id v6 = v38;
  }

  if (a3 >= 20)
  {
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      v49 = activityLevelTimeStamp;
      NSAppendPrintF();
      id v40 = v6;

      id v6 = v40;
    }
  }

  return v6;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 txtDictionary];
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
  [v5 deviceInfo];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char Int64Ranged = CFDictionaryGetInt64Ranged();

  id v9 = self->_idsDevice;
  id v10 = self->_model;
  char v37 = Int64Ranged;
  if (v10)
  {
    id v11 = v10;
LABEL_3:
    unsigned int v12 = 0;
    goto LABEL_7;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[IDSDevice modelIdentifier](v9, "modelIdentifier");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11) {
      goto LABEL_3;
    }
  }

  objc_storeStrong((id *)&self->_model, v11);
  unsigned int v12 = 2;
LABEL_7:
  [v5 name];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v13;
  id v38 = (void *)v6;
  if (v13)
  {
    name = self->_name;
    id v16 = v13;
    id v17 = name;
    if (v16 == v17)
    {
    }

    else
    {
      id v18 = v17;
      if (v17)
      {
        char v19 = -[NSString isEqual:](v16, "isEqual:", v17);

        if ((v19 & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_name, v14);
      v12 |= 0x10u;
    }
  }

- (BOOL)removeBonjourDevice:(id)a3
{
  bonjourDevice = self->_bonjourDevice;
  self->_bonjourDevice = 0LL;
  id v5 = a3;

  self->_statusFlags &= ~4uLL;
  [v5 deviceInfo];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = CFDictionaryGetInt64Ranged();
  unint64_t statusFlags = self->_statusFlags;
  if ((v5 & 0x18) != 0)
  {
    statusFlags &= ~0x1000000uLL;
    self->_unint64_t statusFlags = statusFlags;
  }

  return (statusFlags & 0x10001F) == 0;
}

- (unsigned)updateWithFamilyEndpoint:(id)a3
{
  id v4 = a3;
  [v4 deviceUniqueID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v8 = v5;
  id v9 = idsDeviceIdentifier;
  if (v8 == v9)
  {

    goto LABEL_7;
  }

  id v10 = v9;
  if (v9)
  {
    char v11 = -[NSString isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v12 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, v6);
  unsigned int v12 = 2;
LABEL_10:

  [v4 deviceName];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v13;
  if (!v13) {
    goto LABEL_18;
  }
  name = self->_name;
  id v16 = v13;
  id v17 = name;
  if (v16 == v17)
  {

    goto LABEL_18;
  }

  id v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }

  char v19 = -[NSString isEqual:](v16, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_name, v14);
    v12 |= 0x10u;
  }

- (unsigned)updateWithIDSDevice:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_idsDevice, a3);
  [v5 uniqueIDOverride];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v9 = v6;
  id v10 = idsDeviceIdentifier;
  if (v9 == v10)
  {

    goto LABEL_7;
  }

  char v11 = v10;
  if (v10)
  {
    char v12 = -[NSString isEqual:](v9, "isEqual:", v10);

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v13 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, v7);
  unsigned int v13 = 2;
LABEL_10:

  [v5 modelIdentifier];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  id v16 = v15;
  if (!v14) {
    goto LABEL_18;
  }
  model = self->_model;
  id v18 = (NSString *)v15;
  char v19 = model;
  if (v18 == v19)
  {

    goto LABEL_18;
  }

  id v20 = v19;
  if (!v19)
  {

    goto LABEL_17;
  }

  char v21 = -[NSString isEqual:](v18, "isEqual:", v19);

  if ((v21 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_model, v14);
    unsigned int v13 = 2;
  }

- (unsigned)removeIDSDevice
{
  idsDevice = self->_idsDevice;
  self->_idsDevice = 0LL;

  unint64_t statusFlags = self->_statusFlags;
  if ((statusFlags & 0xFFFFFFFFFFEFFFFFLL) == statusFlags)
  {
    unsigned int v5 = 0;
  }

  else
  {
    self->_unint64_t statusFlags = statusFlags & 0xFFFFFFFFFFEFFFFFLL;
    unsigned int v5 = 2;
    LODWORD(statusFlags) = statusFlags & 0xFFEFFFFF;
  }

  if ((statusFlags & 0x10001F) != 0) {
    return v5;
  }
  else {
    return v5 | 0x200;
  }
}

- (unsigned)updateWithSFDevice:(id)a3
{
  id v5 = a3;
  int v133 = 0;
  uint64_t v6 = self->_bleDevice;
  objc_storeStrong((id *)&self->_bleDevice, a3);
  v129 = self->_idsDevice;
  unsigned int v7 = [v5 deviceFlags];
  int v8 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 accountAltDSID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v9;
    if (!v9)
    {
      int v8 = 0;
LABEL_13:

      goto LABEL_14;
    }

    unsigned int v11 = v7;
    accountAltDSID = self->_accountAltDSID;
    unsigned int v13 = v9;
    id v14 = accountAltDSID;
    if (v13 == v14)
    {
    }

    else
    {
      id v15 = v14;
      if (!v14)
      {

LABEL_11:
        objc_storeStrong((id *)&self->_accountAltDSID, v10);
        int v8 = 2;
        goto LABEL_12;
      }

      char v16 = -[NSString isEqual:](v13, "isEqual:", v14);

      if ((v16 & 1) == 0) {
        goto LABEL_11;
      }
    }

    int v8 = 0;
LABEL_12:
    unsigned int v7 = v11;
    goto LABEL_13;
  }

- (BOOL)removeSFDevice:(id)a3
{
  bleDevice = self->_bleDevice;
  self->_bleDevice = 0LL;

  self->_uint64_t activityLevel = 0;
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  self->_activityLevelTimeStamp = 0LL;

  unint64_t statusFlags = self->_statusFlags;
  self->_unint64_t statusFlags = statusFlags & 0xFFFFFFFFBFDFFCFDLL;
  return (statusFlags & 0x10001D) == 0;
}

- (unsigned)updateTrustStatusFlagsWithIdentity:(id)a3
{
  unint64_t statusFlags = self->_statusFlags;
  unsigned int v5 = [a3 type] - 1;
  if (v5 > 0xE) {
    return 0;
  }
  if (((0x59ABu >> v5) & 1) == 0) {
    return 0;
  }
  unint64_t v6 = statusFlags | qword_1873E74D0[v5];
  if (v6 == statusFlags) {
    return 0;
  }
  self->_unint64_t statusFlags = v6;
  return 2;
}

- (unsigned)updateWithIdentity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_identifier)
  {
    unsigned int v6 = 0;
  }

  else
  {
    [v4 identifier];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_storeStrong((id *)&self->_identifier, v7);
      unsigned int v6 = 2;
    }

    else
    {
      unsigned int v6 = 0;
    }
  }

  if (!self->_idsDeviceIdentifier)
  {
    [v5 idsDeviceID];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v8);
      unsigned int v6 = 2;
    }
  }

  if (!self->_accountAltDSID)
  {
    [v5 accountAltDSID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&self->_accountAltDSID, v9);
      v6 |= 2u;
    }
  }

  if (!self->_accountID)
  {
    [v5 accountID];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      v6 |= 2u;
    }
  }

  if (!self->_contactID)
  {
    [v5 contactID];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_storeStrong((id *)&self->_contactID, v11);
      v6 |= 2u;
    }
  }

  if (!self->_model)
  {
    [v5 model];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_storeStrong((id *)&self->_model, v12);
      v6 |= 2u;
    }
  }

  unint64_t statusFlags = self->_statusFlags;
  uint64_t v14 = statusFlags | 2;
  switch([v5 type])
  {
    case 1u:
    case 2u:
      uint64_t v15 = 524290LL;
      goto LABEL_36;
    case 3u:
    case 4u:
      uint64_t v15 = 16386LL;
      goto LABEL_36;
    case 5u:
    case 6u:
      uint64_t v15 = 131074LL;
      goto LABEL_36;
    case 7u:
    case 8u:
      uint64_t v15 = 32770LL;
      goto LABEL_36;
    case 9u:
      uint64_t v15 = 8194LL;
      goto LABEL_36;
    case 0xCu:
      uint64_t v15 = 0x1000000002LL;
      goto LABEL_36;
    case 0xDu:
      uint64_t v15 = 0x2000000002LL;
      goto LABEL_36;
    case 0xFu:
      uint64_t v15 = 0x4000000002LL;
LABEL_36:
      uint64_t v14 = statusFlags | v15;
      break;
    default:
      break;
  }

  BOOL v16 = -[NSString hasPrefix:](self->_model, "hasPrefix:", @"AppleTV");
  unint64_t v17 = v14 | 0x50800;
  if (!v16) {
    unint64_t v17 = v14;
  }
  if (v17 != statusFlags)
  {
    self->_unint64_t statusFlags = v17;
    v6 |= 2u;
  }

  if (!self->_idsDeviceIdentifier)
  {
    [v5 idsDeviceID];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v18);
      v6 |= 2u;
    }
  }

  if (!self->_mediaRemoteIdentifier)
  {
    [v5 mediaRemoteID];
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v19);
      v6 |= 2u;
    }
  }

  if (!self->_mediaRouteIdentifier)
  {
    [v5 mediaRouteID];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v20);
      v6 |= 2u;
    }
  }

  [v5 name];
  char v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v21;
  if (v21)
  {
    name = self->_name;
    p_name = &self->_name;
    id v25 = v21;
    id v26 = name;
    if (v25 == v26)
    {
    }

    else
    {
      char v27 = v26;
      if (v26)
      {
        char v28 = -[NSString isEqual:](v25, "isEqual:", v26);

        if ((v28 & 1) != 0) {
          goto LABEL_61;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)p_name, v22);
      v6 |= 0x10u;
    }
  }

- (unsigned)updateWithCBDevice:(id)a3
{
  id v5 = a3;
  unsigned int v6 = self->_cbDevice;
  objc_storeStrong((id *)&self->_cbDevice, a3);
  [v5 bleAdvertisementData];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBDevice bleAdvertisementData](v6, "bleAdvertisementData");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  id v10 = v8;
  unsigned int v11 = v10;
  if (v9 == v10)
  {
    int v12 = 0;
  }

  else if ((v9 == 0LL) == (v10 != 0LL))
  {
    int v12 = 1;
  }

  else
  {
    int v12 = [v9 isEqual:v10] ^ 1;
  }

  int v13 = [v5 rssi];
  else {
    unsigned int v15 = v12 | 0x20;
  }

  return v15;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  id v4 = a3;
  [v4 accountAltDSID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  accountAltDSID = self->_accountAltDSID;
  int v8 = v5;
  id v9 = accountAltDSID;
  if (v8 == v9)
  {

    goto LABEL_7;
  }

  id v10 = v9;
  if (v9)
  {
    char v11 = -[NSString isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    int v12 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_accountAltDSID, v6);
  int v12 = 2;
LABEL_10:
  [v4 identifier];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  int v48 = v12;
  if (!v13) {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  BOOL v16 = v13;
  unint64_t v17 = identifier;
  if (v16 == v17)
  {

    goto LABEL_18;
  }

  id v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }

  char v19 = -[NSString isEqual:](v16, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_identifier, v14);
    int v48 = 2;
  }

- (BOOL)removeCBDevice:(id)a3
{
  cbDevice = self->_cbDevice;
  self->_cbDevice = 0LL;

  unint64_t statusFlags = self->_statusFlags;
  self->_unint64_t statusFlags = statusFlags & 0xFFFFFFFFFFFFFFFDLL;
  return (statusFlags & 0x10001D) == 0;
}

- (BOOL)compareWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  unsigned int v6 = (NSString *)v4;
  unsigned int v7 = identifier;
  if (v7 == v6)
  {
    char v10 = 1;
    char v11 = v6;
LABEL_24:

    goto LABEL_25;
  }

  int v8 = v7;
  if ((v6 == 0LL) != (v7 != 0LL))
  {
    char v9 = -[NSString isEqual:](v6, "isEqual:", v7);

    if ((v9 & 1) != 0) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  char v11 = v6;
  int v13 = idsDeviceIdentifier;
  if (v13 == v11) {
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  if ((v6 == 0LL) != (v13 != 0LL))
  {
    char v15 = -[NSString isEqual:](v11, "isEqual:", v13);

    if ((v15 & 1) != 0) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  verifiedIdentity = self->_verifiedIdentity;
  char v11 = v11;
  unint64_t v17 = verifiedIdentity;
  if (v17 == v11)
  {
LABEL_16:
    char v10 = 1;
    goto LABEL_24;
  }

  id v18 = v17;
  if ((v6 == 0LL) == (v17 != 0LL))
  {

    goto LABEL_18;
  }

  char v19 = -[NSString isEqual:](v11, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_18:
    -[SFDevice rapportIdentifier](self->_bleDevice, "rapportIdentifier");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    char v21 = v11;
    id v22 = v20;
    char v11 = v22;
    if (v22 == v21)
    {
      char v10 = 1;
    }

    else if ((v6 == 0LL) == (v22 != 0LL))
    {
      char v10 = 0;
    }

    else
    {
      char v10 = -[NSString isEqual:](v21, "isEqual:", v22);
    }

    goto LABEL_24;
  }

- (id)bleTargetData
{
  v3 = self->_encodedBLETargetData;
  if (!v3)
  {
    -[RPEndpoint bleDevice](self, "bleDevice");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 bleDevice];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPEndpoint cbDevice](self, "cbDevice");
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 advertisementFields];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();

    if (!v3 && v6)
    {
      [v6 nearbyInfoV2TempAuthTagData];
      v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v3;
}

- (void)setActivityLevel:(int)a3
{
  self->_uint64_t activityLevel = a3;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (int)activityLevel
{
  return self->_activityLevel;
}

- (NSDate)activityLevelTimeStamp
{
  return self->_activityLevelTimeStamp;
}

- (unsigned)cameraState
{
  return self->_cameraState;
}

- (NSArray)homeKitUserIdentifiers
{
  return self->_homeKitUserIdentifiers;
}

- (void)setHomeKitUserIdentifiers:(id)a3
{
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)idsCorrelationIdentifier
{
  return self->_idsCorrelationIdentifier;
}

- (void)setIdsCorrelationIdentifier:(id)a3
{
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (void)setInDiscoverySession:(BOOL)a3
{
  self->_inDiscoverySession = a3;
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)mediaRemoteIdentifier
{
  return self->_mediaRemoteIdentifier;
}

- (void)setMediaRemoteIdentifier:(id)a3
{
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void)setMediaRouteIdentifier:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 128);
  return self;
}

- (void)setOperatingSystemVersion:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_operatingSystemVersion.int64_t patchVersion = a3->var2;
  *(_OWORD *)&self->_operatingSystemVersion.int64_t majorVersion = v3;
}

- (int)proximity
{
  return self->_proximity;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusFlags:(unint64_t)a3
{
  self->_unint64_t statusFlags = a3;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
}

- (NSString)verifiedIdentity
{
  return self->_verifiedIdentity;
}

- (void)setVerifiedIdentity:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSData)encodedBLETargetData
{
  return self->_encodedBLETargetData;
}

- (void)setEncodedBLETargetData:(id)a3
{
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (CBDevice)cbDevice
{
  return self->_cbDevice;
}

- (void)setCbDevice:(id)a3
{
}

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
}

- (BOOL)cameraCapabilityRequestIsActive
{
  return self->_cameraCapabilityRequestIsActive;
}

- (void)setCameraCapabilityRequestIsActive:(BOOL)a3
{
  self->_cameraCapabilityRequestIsActive = a3;
}

- (BOOL)encodeSensitiveProperties
{
  return self->_encodeSensitiveProperties;
}

- (void)setEncodeSensitiveProperties:(BOOL)a3
{
  self->_encodeSensitiveProperties = a3;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_linkType = a3;
}

- (unsigned)nearbyActionV2Type
{
  return self->_nearbyActionV2Type;
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  self->_nearbyActionV2Type = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (NSDictionary)verifiedAcl
{
  return self->_verifiedAcl;
}

- (void)setVerifiedAcl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end