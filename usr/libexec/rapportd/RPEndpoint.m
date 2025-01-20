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
  if (qword_1001332D0 != -1) {
    dispatch_once(&qword_1001332D0, &stru_100112870);
  }
  return (id)qword_1001332C8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v89.receiver = self;
  v89.super_class = (Class)&OBJC_CLASS___RPEndpoint;
  v5 = -[RPEndpoint init](&v89, "init");
  if (v5)
  {
    id v6 = v4;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v7, v8);
    NSDecodeObjectIfPresent(v6, @"altDSID", v9, &v5->_accountAltDSID);

    id v10 = v6;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v11, v12);
    NSDecodeObjectIfPresent(v10, @"aID", v13, &v5->_accountID);

    id v14 = v10;
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDate, v15, v16);
    NSDecodeObjectIfPresent(v14, @"aclTS", v17, &v5->_activityLevelTimeStamp);

    id v18 = v14;
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSData, v19, v20);
    NSDecodeObjectIfPresent(v18, @"bleTD", v21, &v5->_encodedBLETargetData);

    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSUUID, v22, v23);
    NSDecodeNSArrayOfClassIfPresent(v18, @"hkUI", v24, &v5->_homeKitUserIdentifiers);
    id v25 = v18;
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v26, v27);
    NSDecodeObjectIfPresent(v25, @"id", v28, &v5->_identifier);

    id v29 = v25;
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v30, v31);
    NSDecodeObjectIfPresent(v29, @"idsD", v32, &v5->_idsDeviceIdentifier);

    id v33 = v29;
    uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString, v34, v35);
    NSDecodeObjectIfPresent(v33, @"cnID", v36, &v5->_contactID);

    id v37 = v33;
    id v38 = v37;
    uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSString, v39, v40);
    NSDecodeObjectIfPresent(v38, @"ipAdd", v41, &v5->_ipAddress);

    id v42 = v38;
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString, v43, v44);
    NSDecodeObjectIfPresent(v42, @"MRI", v45, &v5->_mediaRemoteIdentifier);

    id v46 = v42;
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString, v47, v48);
    NSDecodeObjectIfPresent(v46, @"MRtI", v49, &v5->_mediaRouteIdentifier);

    id v50 = v46;
    uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString, v51, v52);
    NSDecodeObjectIfPresent(v50, @"md", v53, &v5->_model);

    id v54 = v50;
    uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSString, v55, v56);
    NSDecodeObjectIfPresent(v54, @"nm", v57, &v5->_name);

    id v58 = v54;
    if ([v58 containsValueForKey:@"osma"]) {
      v5->_operatingSystemVersion.majorVersion = (int64_t)[v58 decodeIntegerForKey:@"osma"];
    }

    id v59 = v58;
    if ([v59 containsValueForKey:@"osmi"]) {
      v5->_operatingSystemVersion.minorVersion = (int64_t)[v59 decodeIntegerForKey:@"osmi"];
    }

    id v60 = v59;
    id v61 = v60;
    uint64_t v64 = objc_opt_class(&OBJC_CLASS___NSDictionary, v62, v63);
    NSDecodeStandardContainerIfPresent(v61, @"si", v64, &v5->_serviceInfo);

    id v65 = v61;
    uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSString, v66, v67);
    NSDecodeObjectIfPresent(v65, @"st", v68, &v5->_serviceType);

    uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSString, v69, v70);
    NSDecodeNSArrayOfClassIfPresent(v65, @"stA", v71, &v5->_serviceTypes);
    id v72 = v65;

    id v73 = v72;
    uint64_t v76 = objc_opt_class(&OBJC_CLASS___NSString, v74, v75);
    NSDecodeObjectIfPresent(v73, @"sv", v76, &v5->_sourceVersion);

    id v77 = v73;
    uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSString, v78, v79);
    NSDecodeObjectIfPresent(v77, @"vi", v80, &v5->_verifiedIdentity);

    uint64_t v83 = objc_opt_class(&OBJC_CLASS___NSString, v81, v82);
    uint64_t v86 = objc_opt_class(&OBJC_CLASS___NSNumber, v84, v85);
    NSDecodeNSDictionaryOfClassesIfPresent(v77, @"vAcl", v83, v86, &v5->_verifiedAcl);
    v87 = v5;
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
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPEndpoint bleTargetData](self, "bleTargetData"));
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
  id v87 = 0LL;
  NSAppendPrintF(&v87, "RPEndpoint");
  id v5 = v87;
  id v6 = v5;
  identifier = self->_identifier;
  if (identifier)
  {
    id v86 = v5;
    uint64_t v8 = identifier;
    NSAppendPrintF(&v86, ", ID %@", v8);
    id v9 = v86;

    id v6 = v9;
  }

  if (a3 <= 49) {
    uint64_t v10 = 100LL;
  }
  else {
    uint64_t v10 = 8LL;
  }
  if (sub_10000AA20())
  {
    name = self->_name;
    if (name)
    {
      id v85 = v6;
      uint64_t v12 = name;
      NSAppendPrintF(&v85, ", Nm '%@'", v12);
      id v13 = v85;

      id v6 = v13;
    }

    model = self->_model;
    if (model)
    {
      id v84 = v6;
      uint64_t v15 = model;
      NSAppendPrintF(&v84, ", Md '%@'", v15);
      id v16 = v84;

      id v6 = v16;
    }

    accountAltDSID = self->_accountAltDSID;
    if (accountAltDSID)
    {
      id v83 = v6;
      id v18 = accountAltDSID;
      NSAppendPrintF(&v83, ", AccountAltDSID '%.*@'", v10, v18);
      id v19 = v83;

      id v6 = v19;
    }

    accountID = self->_accountID;
    if (accountID)
    {
      id v82 = v6;
      uint64_t v21 = accountID;
      NSAppendPrintF(&v82, ", AID '%.*@'", v10, v21);
      id v22 = v82;

      id v6 = v22;
    }

    unsigned int activityLevel = self->_activityLevel;
    if (activityLevel)
    {
      id v81 = v6;
      if (activityLevel > 0xE) {
        uint64_t v24 = "?";
      }
      else {
        uint64_t v24 = (&off_100112890)[activityLevel - 1];
      }
      NSAppendPrintF(&v81, ", AcLv '%s'", v24);
      id v25 = v81;

      id v6 = v25;
    }

    int cameraState = self->_cameraState;
    if (self->_cameraState)
    {
      uint64_t v27 = "?";
      if (cameraState == 1) {
        uint64_t v27 = "Usable";
      }
      if (cameraState == 2) {
        uint64_t v28 = "Magic";
      }
      else {
        uint64_t v28 = v27;
      }
      id v80 = v6;
      NSAppendPrintF(&v80, ", CS '%s'", v28);
      id v29 = v80;

      id v6 = v29;
    }

    homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
    if (homeKitUserIdentifiers)
    {
      id v79 = v6;
      uint64_t v31 = homeKitUserIdentifiers;
      NSAppendPrintF(&v79, ", HKUID '%.*@'", v10, v31);
      id v32 = v79;

      id v6 = v32;
    }

    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    if (idsDeviceIdentifier)
    {
      id v78 = v6;
      uint64_t v34 = idsDeviceIdentifier;
      NSAppendPrintF(&v78, ", IDS '%.*@'", v10, v34);
      id v35 = v78;

      id v6 = v35;
    }

    contactID = self->_contactID;
    if (contactID)
    {
      id v77 = v6;
      id v37 = contactID;
      NSAppendPrintF(&v77, ", CNID '%.*@'", v10, v37);
      id v38 = v77;

      id v6 = v38;
    }

    mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
    if (mediaRemoteIdentifier)
    {
      id v76 = v6;
      uint64_t v40 = mediaRemoteIdentifier;
      NSAppendPrintF(&v76, ", MRI '%.*@'", v10, v40);
      id v41 = v76;

      id v6 = v41;
    }

    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    if (mediaRouteIdentifier)
    {
      id v75 = v6;
      uint64_t v43 = mediaRouteIdentifier;
      NSAppendPrintF(&v75, ", MRtI '%.*@'", v10, v43);
      id v44 = v75;

      id v6 = v44;
    }

    if (self->_operatingSystemVersion.majorVersion)
    {
      id v74 = v6;
      __int128 v72 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
      int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
      id v45 = sub_10000A85C((uint64_t *)&v72);
      id v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      NSAppendPrintF(&v74, ", OSV %@", v46);
      id v47 = v74;

      id v6 = v47;
    }

    verifiedIdentity = self->_verifiedIdentity;
    if (verifiedIdentity)
    {
      id v71 = v6;
      uint64_t v49 = verifiedIdentity;
      NSAppendPrintF(&v71, ", VI %@", v49);
      id v50 = v71;

      id v6 = v50;
    }

    sourceVersion = self->_sourceVersion;
    if (sourceVersion)
    {
      id v70 = v6;
      uint64_t v52 = sourceVersion;
      NSAppendPrintF(&v70, ", SV %@", v52);
      id v53 = v70;

      id v6 = v53;
    }

    int proximity = self->_proximity;
    if (proximity)
    {
      id v69 = v6;
      switch(proximity)
      {
        case 10:
          uint64_t v55 = "Immed";
          break;
        case 30:
          uint64_t v55 = "Far";
          break;
        case 20:
          uint64_t v55 = "Near";
          break;
        default:
          uint64_t v55 = "?";
          break;
      }

      NSAppendPrintF(&v69, ", Px %s", v55);
      id v56 = v69;

      id v6 = v56;
    }
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    id v68 = v6;
    id v58 = serviceType;
    NSAppendPrintF(&v68, ", ST %@", v58);
    id v59 = v68;

    id v6 = v59;
  }

  unint64_t statusFlags = self->_statusFlags;
  if (statusFlags)
  {
    id v67 = v6;
    NSAppendPrintF(&v67, ", SF %#ll{flags}", statusFlags, &algn_100109D7F);
    id v61 = v67;

    id v6 = v61;
  }

  if (a3 >= 20)
  {
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      id v66 = v6;
      uint64_t v63 = activityLevelTimeStamp;
      NSAppendPrintF(&v66, ", ACLTS %@", v63);
      id v64 = v66;

      id v6 = v64;
    }
  }

  return v6;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 txtDictionary]);
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInfo]);
  char Int64Ranged = CFDictionaryGetInt64Ranged(v7, @"TrTy", 0LL, 0xFFFFFFFFLL, 0LL);

  id v9 = self->_idsDevice;
  uint64_t v10 = self->_model;
  char v44 = Int64Ranged;
  if (v10)
  {
    uint64_t v11 = v10;
LABEL_3:
    unsigned int v12 = 0;
    goto LABEL_7;
  }

  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"rpMd", TypeID, 0LL);
  uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v11)
  {
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](v9, "modelIdentifier"));
    if (!v11) {
      goto LABEL_3;
    }
  }

  objc_storeStrong((id *)&self->_model, v11);
  unsigned int v12 = 2;
LABEL_7:
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  id v16 = v15;
  id v45 = (void *)v6;
  if (v15)
  {
    name = self->_name;
    id v18 = v15;
    id v19 = name;
    if (v18 == v19)
    {
    }

    else
    {
      uint64_t v20 = v19;
      if (v19)
      {
        unsigned __int8 v21 = -[NSString isEqual:](v18, "isEqual:", v19);

        if ((v21 & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_name, v16);
      v12 |= 0x10u;
    }

- (BOOL)removeBonjourDevice:(id)a3
{
  bonjourDevice = self->_bonjourDevice;
  self->_bonjourDevice = 0LL;
  id v5 = a3;

  self->_statusFlags &= ~4uLL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInfo]);

  LOBYTE(v5) = CFDictionaryGetInt64Ranged(v6, @"TrTy", 0LL, 0xFFFFFFFFLL, 0LL);
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
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceUniqueID]);
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  uint64_t v8 = v5;
  id v9 = idsDeviceIdentifier;
  if (v8 == v9)
  {

    goto LABEL_7;
  }

  uint64_t v10 = v9;
  if (v9)
  {
    unsigned __int8 v11 = -[NSString isEqual:](v8, "isEqual:", v9);

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

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceName]);
  id v14 = v13;
  if (!v13) {
    goto LABEL_18;
  }
  name = self->_name;
  id v16 = v13;
  uint64_t v17 = name;
  if (v16 == v17)
  {

    goto LABEL_18;
  }

  id v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }

  unsigned __int8 v19 = -[NSString isEqual:](v16, "isEqual:", v17);

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
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIDOverride]);
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v9 = v6;
  uint64_t v10 = idsDeviceIdentifier;
  if (v9 == v10)
  {

    goto LABEL_7;
  }

  unsigned __int8 v11 = v10;
  if (v10)
  {
    unsigned __int8 v12 = -[NSString isEqual:](v9, "isEqual:", v10);

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

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 modelIdentifier]);
  id v15 = v14;
  id v16 = v15;
  if (!v14) {
    goto LABEL_18;
  }
  model = self->_model;
  id v18 = (NSString *)v15;
  unsigned __int8 v19 = model;
  if (v18 == v19)
  {

    goto LABEL_18;
  }

  id v20 = v19;
  if (!v19)
  {

    goto LABEL_17;
  }

  unsigned __int8 v21 = -[NSString isEqual:](v18, "isEqual:", v19);

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
  v137[0] = 0;
  uint64_t v6 = self->_bleDevice;
  objc_storeStrong((id *)&self->_bleDevice, a3);
  v132 = self->_idsDevice;
  unsigned int v7 = [v5 deviceFlags];
  int v8 = 0;
  if ((objc_opt_respondsToSelector(v5, "accountAltDSID") & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accountAltDSID]);
    uint64_t v10 = v9;
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

      unsigned __int8 v16 = -[NSString isEqual:](v13, "isEqual:", v14);

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

  self->_unsigned int activityLevel = 0;
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
  unint64_t v6 = statusFlags | qword_100109F40[v5];
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
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
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
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
    if (v8)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v8);
      unsigned int v6 = 2;
    }
  }

  if (!self->_accountAltDSID)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accountAltDSID]);
    if (v9)
    {
      objc_storeStrong((id *)&self->_accountAltDSID, v9);
      v6 |= 2u;
    }
  }

  if (!self->_accountID)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 accountID]);
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      v6 |= 2u;
    }
  }

  if (!self->_contactID)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 contactID]);
    if (v11)
    {
      objc_storeStrong((id *)&self->_contactID, v11);
      v6 |= 2u;
    }
  }

  if (!self->_model)
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
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

  unsigned int v16 = -[NSString hasPrefix:](self->_model, "hasPrefix:", @"AppleTV");
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
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
    if (v18)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v18);
      v6 |= 2u;
    }
  }

  if (!self->_mediaRemoteIdentifier)
  {
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaRemoteID]);
    if (v19)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v19);
      v6 |= 2u;
    }
  }

  if (!self->_mediaRouteIdentifier)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaRouteID]);
    if (v20)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v20);
      v6 |= 2u;
    }
  }

  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  uint64_t v22 = v21;
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
      id v27 = v26;
      if (v26)
      {
        unsigned __int8 v28 = -[NSString isEqual:](v25, "isEqual:", v26);

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
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bleAdvertisementData]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice bleAdvertisementData](v6, "bleAdvertisementData"));
  id v9 = v7;
  id v10 = v8;
  unsigned int v11 = v10;
  if (v9 == v10)
  {
    unsigned int v12 = 0;
  }

  else if ((v9 == 0LL) == (v10 != 0LL))
  {
    unsigned int v12 = 1;
  }

  else
  {
    unsigned int v12 = [v9 isEqual:v10] ^ 1;
  }

  unsigned int v13 = [v5 rssi];
  else {
    unsigned int v15 = v12 | 0x20;
  }

  return v15;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountAltDSID]);
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
    unsigned __int8 v11 = -[NSString isEqual:](v8, "isEqual:", v9);

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
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v14 = v13;
  int v48 = v12;
  if (!v13) {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  unsigned int v16 = v13;
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

  unsigned __int8 v19 = -[NSString isEqual:](v16, "isEqual:", v17);

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
    unsigned __int8 v10 = 1;
    unsigned __int8 v11 = v6;
LABEL_24:

    goto LABEL_25;
  }

  int v8 = v7;
  if ((v6 == 0LL) != (v7 != 0LL))
  {
    unsigned __int8 v9 = -[NSString isEqual:](v6, "isEqual:", v7);

    if ((v9 & 1) != 0) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  unsigned __int8 v11 = v6;
  unsigned int v13 = idsDeviceIdentifier;
  if (v13 == v11) {
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  if ((v6 == 0LL) != (v13 != 0LL))
  {
    unsigned __int8 v15 = -[NSString isEqual:](v11, "isEqual:", v13);

    if ((v15 & 1) != 0) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  verifiedIdentity = self->_verifiedIdentity;
  unsigned __int8 v11 = v11;
  unint64_t v17 = verifiedIdentity;
  if (v17 == v11)
  {
LABEL_16:
    unsigned __int8 v10 = 1;
    goto LABEL_24;
  }

  id v18 = v17;
  if ((v6 == 0LL) == (v17 != 0LL))
  {

    goto LABEL_18;
  }

  unsigned __int8 v19 = -[NSString isEqual:](v11, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_18:
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice rapportIdentifier](self->_bleDevice, "rapportIdentifier"));
    unsigned __int8 v21 = v11;
    uint64_t v22 = v20;
    unsigned __int8 v11 = v22;
    if (v22 == v21)
    {
      unsigned __int8 v10 = 1;
    }

    else if ((v6 == 0LL) == (v22 != 0LL))
    {
      unsigned __int8 v10 = 0;
    }

    else
    {
      unsigned __int8 v10 = -[NSString isEqual:](v21, "isEqual:", v22);
    }

    goto LABEL_24;
  }

- (id)bleTargetData
{
  v3 = self->_encodedBLETargetData;
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPEndpoint bleDevice](self, "bleDevice"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);

    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPEndpoint cbDevice](self, "cbDevice"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 advertisementFields]);
    CFTypeID TypeID = CFDataGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"at", TypeID, 0LL);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (!v3 && v6) {
      v3 = (NSData *)objc_claimAutoreleasedReturnValue([v6 nearbyInfoV2TempAuthTagData]);
    }
  }

  return v3;
}

- (void)setActivityLevel:(int)a3
{
  self->_unsigned int activityLevel = a3;
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