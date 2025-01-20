@interface RPCompanionLinkDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)changed;
- (BOOL)daemon;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isEqualToDeviceBasic:(id)a3;
- (BOOL)isPersonal;
- (BOOL)uiTriggered;
- (NSDictionary)siriInfo;
- (NSString)activeUserAltDSID;
- (NSString)deviceColor;
- (NSString)effectiveIdentifier;
- (NSString)idsPersonalDeviceIdentifier;
- (NSString)mediaSystemName;
- (NSString)password;
- (NSString)publicIdentifier;
- (NSString)role;
- (NSString)roomName;
- (NSUUID)homeKitIdentifier;
- (NSUUID)launchInstanceID;
- (NSUUID)mediaSystemIdentifier;
- (NSUUID)mediaSystemIdentifierEffective;
- (NSUUID)pairingIdentifier;
- (RPCompanionLinkDevice)init;
- (RPCompanionLinkDevice)initWithCoder:(id)a3;
- (char)standaloneWatch;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)listeningPort;
- (int)mediaAccessControlSetting;
- (int)mediaSystemRole;
- (int)mediaSystemRoleEffective;
- (int)mediaSystemState;
- (int)personalDeviceState;
- (int)personalRequestsState;
- (int)serversChangedState;
- (unsigned)deviceCapabilityFlags;
- (unsigned)deviceFlags;
- (unsigned)flags;
- (unsigned)updateWithBonjourDevice:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveUserAltDSID:(id)a3;
- (void)setChanged:(BOOL)a3;
- (void)setDaemon:(BOOL)a3;
- (void)setDeviceCapabilityFlags:(unsigned int)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceFlags:(unsigned __int8)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHomeKitIdentifier:(id)a3;
- (void)setIdsPersonalDeviceIdentifier:(id)a3;
- (void)setLaunchInstanceID:(id)a3;
- (void)setListeningPort:(int)a3;
- (void)setMediaAccessControlSetting:(int)a3;
- (void)setMediaSystemIdentifier:(id)a3;
- (void)setMediaSystemIdentifierEffective:(id)a3;
- (void)setMediaSystemName:(id)a3;
- (void)setMediaSystemRole:(int)a3;
- (void)setMediaSystemRoleEffective:(int)a3;
- (void)setMediaSystemState:(int)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPersonal:(BOOL)a3;
- (void)setPersonalDeviceState:(int)a3;
- (void)setPersonalRequestsState:(int)a3;
- (void)setPublicIdentifier:(id)a3;
- (void)setRole:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setServersChangedState:(int)a3;
- (void)setSiriInfo:(id)a3;
- (void)setStandaloneWatch:(char)a3;
- (void)setUiTriggered:(BOOL)a3;
@end

@implementation RPCompanionLinkDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPCompanionLinkDevice)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  v2 = -[RPCompanionLinkDevice init](&v4, sel_init);
  return v2;
}

- (RPCompanionLinkDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  v5 = -[RPEndpoint initWithCoder:](&v20, sel_initWithCoder_, v4);
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
    NSDecodeStandardContainerIfPresent();

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  -[RPEndpoint encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  activeUserAltDSID = self->_activeUserAltDSID;
  if (activeUserAltDSID) {
    [v4 encodeObject:activeUserAltDSID forKey:@"altDSID"];
  }
  uint64_t deviceCapabilityFlags = self->_deviceCapabilityFlags;
  if ((_DWORD)deviceCapabilityFlags) {
    [v4 encodeInt64:deviceCapabilityFlags forKey:@"dCapF"];
  }
  deviceColor = self->_deviceColor;
  if (deviceColor) {
    [v4 encodeObject:deviceColor forKey:@"dCl"];
  }
  if (self->_deviceFlags) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
  uint64_t flags = self->_flags;
  if ((_DWORD)flags) {
    [v4 encodeInt64:flags forKey:@"flags"];
  }
  homeKitIdentifier = self->_homeKitIdentifier;
  if (homeKitIdentifier) {
    [v4 encodeObject:homeKitIdentifier forKey:@"hkID"];
  }
  idsCorrelationIdentifier = self->super._idsCorrelationIdentifier;
  if (idsCorrelationIdentifier) {
    [v4 encodeObject:idsCorrelationIdentifier forKey:@"idsCID"];
  }
  idsPersonalDeviceIdentifier = self->_idsPersonalDeviceIdentifier;
  if (idsPersonalDeviceIdentifier) {
    [v4 encodeObject:idsPersonalDeviceIdentifier forKey:@"idsP"];
  }
  uint64_t listeningPort = self->_listeningPort;
  if ((_DWORD)listeningPort) {
    [v4 encodeInteger:listeningPort forKey:@"lP"];
  }
  uint64_t mediaAccessControlSetting = self->_mediaAccessControlSetting;
  if ((_DWORD)mediaAccessControlSetting) {
    [v4 encodeInteger:mediaAccessControlSetting forKey:@"MAc"];
  }
  mediaSystemIdentifier = self->_mediaSystemIdentifier;
  if (mediaSystemIdentifier) {
    [v4 encodeObject:mediaSystemIdentifier forKey:@"MSi"];
  }
  mediaSystemName = self->_mediaSystemName;
  if (mediaSystemName) {
    [v4 encodeObject:mediaSystemName forKey:@"MSn"];
  }
  uint64_t mediaSystemRole = self->_mediaSystemRole;
  if ((_DWORD)mediaSystemRole) {
    [v4 encodeInteger:mediaSystemRole forKey:@"MSr"];
  }
  uint64_t mediaSystemState = self->_mediaSystemState;
  if ((_DWORD)mediaSystemState) {
    [v4 encodeInteger:mediaSystemState forKey:@"MSs"];
  }
  if (self->_personal) {
    [v4 encodeBool:1 forKey:@"pers"];
  }
  uint64_t personalDeviceState = self->_personalDeviceState;
  if ((_DWORD)personalDeviceState) {
    [v4 encodeInteger:personalDeviceState forKey:@"pds"];
  }
  uint64_t personalRequestsState = self->_personalRequestsState;
  if ((_DWORD)personalRequestsState) {
    [v4 encodeInteger:personalRequestsState forKey:@"prs"];
  }
  publicIdentifier = self->_publicIdentifier;
  if (publicIdentifier) {
    [v4 encodeObject:publicIdentifier forKey:@"pubID"];
  }
  role = self->_role;
  if (role) {
    [v4 encodeObject:role forKey:@"role"];
  }
  roomName = self->_roomName;
  if (roomName) {
    [v4 encodeObject:roomName forKey:@"rn"];
  }
  siriInfo = self->_siriInfo;
  if (siriInfo) {
    [v4 encodeObject:siriInfo forKey:@"siriInfo"];
  }
  if (self->_standaloneWatch) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
}

- (id)description
{
  return -[RPCompanionLinkDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v94 = *MEMORY[0x1895F89C0];
  if (a3 <= 49) {
    unsigned int v5 = 100;
  }
  else {
    unsigned int v5 = 8;
  }
  BOOL v6 = shouldPrintSensitiveData();
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 8LL;
  }
  uint64_t v71 = v7;
  id v8 = self->super._identifier;
  id v9 = self->super._idsDeviceIdentifier;
  if (-[NSString isEqual:](v9, "isEqual:", v8))
  {

    id v8 = 0LL;
  }

  id v10 = self->_publicIdentifier;
  if (-[NSString isEqual:](v10, "isEqual:", v8))
  {

    id v8 = 0LL;
    goto LABEL_14;
  }

  if (!v8)
  {
LABEL_14:
    id v11 = 0LL;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  uint64_t v92 = 0LL;
  formatSensitiveData((uint64_t)"%sID ", v6);
  [0 length];
  NSAppendPrintF();
  id v11 = 0LL;
  if (v9)
  {
LABEL_15:
    id v91 = v11;
    formatSensitiveData((uint64_t)"%sIDS ", v6);
    [v11 length];
    NSAppendPrintF();
    id v12 = v11;

    id v11 = v12;
  }

- (NSString)effectiveIdentifier
{
  identifier = (__CFString *)self->super._identifier;
  if (!identifier)
  {
    identifier = (__CFString *)self->_publicIdentifier;
    if (!identifier) {
      identifier = &stru_18A035BB8;
    }
  }

  return (NSString *)identifier;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  id v4 = a3;
  unsigned int v5 = -[RPEndpoint updateWithBonjourDevice:](&v19, sel_updateWithBonjourDevice_, v4);
  [v4 txtDictionary];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  unsigned int Int64 = CFDictionaryGetInt64();
  unsigned int flags = self->_flags;
  RPCompanionLinkFlagsWithUpdateBonjourFlags(&flags, Int64);
  if (flags != self->_flags)
  {
    self->_unsigned int flags = flags;
    v5 |= 2u;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    publicIdentifier = self->_publicIdentifier;
    id v11 = v8;
    id v12 = publicIdentifier;
    if (v11 == v12)
    {

      goto LABEL_11;
    }

    id v13 = v12;
    if (v12)
    {
      char v14 = -[NSString isEqual:](v11, "isEqual:", v12);

      if ((v14 & 1) != 0) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_publicIdentifier, v9);
    v5 |= 2u;
  }

- (unsigned)updateWithSFDevice:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  unsigned int v4 = -[RPEndpoint updateWithSFDevice:](&v9, sel_updateWithSFDevice_, a3);
  unsigned int flags = self->_flags;
  BOOL v6 = self->super._model;
  if (-[NSString hasPrefix:](v6, "hasPrefix:", @"AudioAccessory1,")
    || -[NSString hasPrefix:](v6, "hasPrefix:", @"AudioAccessory5,")
    || -[NSString hasPrefix:](v6, "hasPrefix:", @"AudioAccessory6,")
    || -[NSString hasPrefix:](v6, "hasPrefix:", @"HomePod"))
  {

    unsigned int v7 = flags | 2;
  }

  else
  {

    unsigned int v7 = flags;
  }

  if ((self->super._statusFlags & 0x10000) != 0) {
    v7 |= 0x1D00u;
  }
  if (v7 != flags)
  {
    self->_unsigned int flags = v7;
    v4 |= 2u;
  }

  return v4;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    [v4 identifier];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31.receiver = self;
    v31.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
    unsigned __int8 v8 = -[RPEndpoint compareWithDeviceIdentifier:](&v31, sel_compareWithDeviceIdentifier_, v7);

    if ((v8 & 1) != 0) {
      goto LABEL_11;
    }
  }

  uint64_t v9 = [v4 idsDeviceIdentifier];
  if (v9)
  {
    id v10 = (void *)v9;
    [v4 idsDeviceIdentifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
    unsigned __int8 v12 = -[RPEndpoint compareWithDeviceIdentifier:](&v30, sel_compareWithDeviceIdentifier_, v11);

    if ((v12 & 1) != 0) {
      goto LABEL_11;
    }
  }

  if (([v4 statusFlags] & 0x2000) == 0 && (self->super._statusFlags & 0x2000) == 0)
  {
    uint64_t v13 = [v4 verifiedIdentity];
    if (v13)
    {
      char v14 = (void *)v13;
      [v4 verifiedIdentity];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29.receiver = self;
      v29.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
      unsigned __int8 v16 = -[RPEndpoint compareWithDeviceIdentifier:](&v29, sel_compareWithDeviceIdentifier_, v15);

      if ((v16 & 1) != 0) {
        goto LABEL_11;
      }
    }
  }

  uint64_t v17 = [v4 publicIdentifier];
  if (!v17) {
    goto LABEL_12;
  }
  id v18 = (void *)v17;
  [v4 publicIdentifier];
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  unsigned __int8 v20 = -[RPEndpoint compareWithDeviceIdentifier:](&v28, sel_compareWithDeviceIdentifier_, v19);

  if ((v20 & 1) != 0)
  {
LABEL_11:
    BOOL v21 = 1;
  }

  else
  {
LABEL_12:
    [v4 bleDevice];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 rapportIdentifier];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      [v4 bleDevice];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 rapportIdentifier];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27.receiver = self;
      v27.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
      BOOL v21 = -[RPEndpoint compareWithDeviceIdentifier:](&v27, sel_compareWithDeviceIdentifier_, v25);
    }

    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (BOOL)isEqualToDeviceBasic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->super._idsDeviceIdentifier
    && ([v4 idsDeviceIdentifier], BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    idsDeviceIdentifier = self->super._idsDeviceIdentifier;
    uint64_t v8 = [v5 idsDeviceIdentifier];
  }

  else if (self->super._identifier {
         && ([v5 identifier], uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  }
  {
    idsDeviceIdentifier = self->super._identifier;
    uint64_t v8 = [v5 identifier];
  }

  else
  {
    idsDeviceIdentifier = self->_publicIdentifier;
    uint64_t v8 = [v5 publicIdentifier];
  }

  id v10 = (void *)v8;
  id v11 = idsDeviceIdentifier;
  unsigned __int8 v12 = v10;
  uint64_t v13 = v12;
  if (v11 == v12)
  {
    char v14 = 1;
  }

  else if ((v11 == 0LL) == (v12 != 0LL))
  {
    char v14 = 0;
  }

  else
  {
    char v14 = -[NSString isEqual:](v11, "isEqual:", v12);
  }

  return v14;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (NSUUID)homeKitIdentifier
{
  return self->_homeKitIdentifier;
}

- (void)setHomeKitIdentifier:(id)a3
{
}

- (NSString)idsPersonalDeviceIdentifier
{
  return self->_idsPersonalDeviceIdentifier;
}

- (void)setIdsPersonalDeviceIdentifier:(id)a3
{
}

- (int)listeningPort
{
  return self->_listeningPort;
}

- (void)setListeningPort:(int)a3
{
  self->_uint64_t listeningPort = a3;
}

- (int)mediaAccessControlSetting
{
  return self->_mediaAccessControlSetting;
}

- (void)setMediaAccessControlSetting:(int)a3
{
  self->_uint64_t mediaAccessControlSetting = a3;
}

- (NSUUID)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (void)setMediaSystemIdentifier:(id)a3
{
}

- (NSString)mediaSystemName
{
  return self->_mediaSystemName;
}

- (void)setMediaSystemName:(id)a3
{
}

- (int)mediaSystemRole
{
  return self->_mediaSystemRole;
}

- (void)setMediaSystemRole:(int)a3
{
  self->_uint64_t mediaSystemRole = a3;
}

- (int)mediaSystemState
{
  return self->_mediaSystemState;
}

- (void)setMediaSystemState:(int)a3
{
  self->_uint64_t mediaSystemState = a3;
}

- (BOOL)isPersonal
{
  return self->_personal;
}

- (void)setPersonal:(BOOL)a3
{
  self->_personal = a3;
}

- (int)personalDeviceState
{
  return self->_personalDeviceState;
}

- (void)setPersonalDeviceState:(int)a3
{
  self->_uint64_t personalDeviceState = a3;
}

- (int)personalRequestsState
{
  return self->_personalRequestsState;
}

- (void)setPersonalRequestsState:(int)a3
{
  self->_uint64_t personalRequestsState = a3;
}

- (NSString)publicIdentifier
{
  return self->_publicIdentifier;
}

- (void)setPublicIdentifier:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (NSDictionary)siriInfo
{
  return self->_siriInfo;
}

- (void)setSiriInfo:(id)a3
{
}

- (unsigned)deviceCapabilityFlags
{
  return self->_deviceCapabilityFlags;
}

- (void)setDeviceCapabilityFlags:(unsigned int)a3
{
  self->_uint64_t deviceCapabilityFlags = a3;
}

- (NSString)activeUserAltDSID
{
  return self->_activeUserAltDSID;
}

- (void)setActiveUserAltDSID:(id)a3
{
}

- (char)standaloneWatch
{
  return self->_standaloneWatch;
}

- (void)setStandaloneWatch:(char)a3
{
  self->_int standaloneWatch = a3;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (BOOL)changed
{
  return self->_changed;
}

- (void)setChanged:(BOOL)a3
{
  self->_changed = a3;
}

- (BOOL)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(BOOL)a3
{
  self->_daemon = a3;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unsigned __int8)a3
{
  self->_deviceFlags = a3;
}

- (NSUUID)launchInstanceID
{
  return self->_launchInstanceID;
}

- (void)setLaunchInstanceID:(id)a3
{
}

- (NSUUID)mediaSystemIdentifierEffective
{
  return self->_mediaSystemIdentifierEffective;
}

- (void)setMediaSystemIdentifierEffective:(id)a3
{
}

- (int)mediaSystemRoleEffective
{
  return self->_mediaSystemRoleEffective;
}

- (void)setMediaSystemRoleEffective:(int)a3
{
  self->_mediaSystemRoleEffective = a3;
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int)serversChangedState
{
  return self->_serversChangedState;
}

- (void)setServersChangedState:(int)a3
{
  self->_serversChangedState = a3;
}

- (BOOL)uiTriggered
{
  return self->_uiTriggered;
}

- (void)setUiTriggered:(BOOL)a3
{
  self->_uiTriggered = a3;
}

- (void).cxx_destruct
{
}

@end