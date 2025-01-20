@interface NEVPNProtocol
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disconnectOnIdle;
- (BOOL)disconnectOnLogout;
- (BOOL)disconnectOnSleep;
- (BOOL)disconnectOnUserSwitch;
- (BOOL)disconnectOnWake;
- (BOOL)enforceRoutes;
- (BOOL)excludeAPNs;
- (BOOL)excludeCellularServices;
- (BOOL)excludeDeviceCommunication;
- (BOOL)excludeLocalNetworks;
- (BOOL)identityDataImported;
- (BOOL)includeAllNetworks;
- (BOOL)needToUpdateKeychain;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (NEDNSSettings)DNSSettings;
- (NEKeychainItem)identityDataPasswordKeychainItem;
- (NEKeychainItem)passwordKeychainItem;
- (NEProxySettings)proxySettings;
- (NEVPNProtocol)initWithCoder:(id)a3;
- (NEVPNProtocol)initWithProtocolIdentifier:(id)a3;
- (NEVPNProtocol)initWithType:(int64_t)a3;
- (NSData)identityDataHash;
- (NSData)identityDataInternal;
- (NSData)identityReferenceInternal;
- (NSData)passwordReference;
- (NSString)extensibleSSOProvider;
- (NSString)identityDataPassword;
- (NSString)passwordEncryption;
- (NSString)serverAddress;
- (NSString)sliceUUID;
- (NSString)username;
- (NSUUID)identifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int)disconnectOnIdleTimeout;
- (int)disconnectOnWakeTimeout;
- (int64_t)type;
- (void)addDisconnectOptions:(id)a3;
- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initDisconnectOptions:(id)a3;
- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setDNSSettings:(id)a3;
- (void)setDisconnectOnIdle:(BOOL)a3;
- (void)setDisconnectOnIdleTimeout:(int)a3;
- (void)setDisconnectOnLogout:(BOOL)a3;
- (void)setDisconnectOnSleep:(BOOL)disconnectOnSleep;
- (void)setDisconnectOnUserSwitch:(BOOL)a3;
- (void)setDisconnectOnWake:(BOOL)a3;
- (void)setDisconnectOnWakeTimeout:(int)a3;
- (void)setEnforceRoutes:(BOOL)enforceRoutes;
- (void)setExcludeAPNs:(BOOL)excludeAPNs;
- (void)setExcludeCellularServices:(BOOL)excludeCellularServices;
- (void)setExcludeDeviceCommunication:(BOOL)a3;
- (void)setExcludeLocalNetworks:(BOOL)excludeLocalNetworks;
- (void)setExtensibleSSOProvider:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentityData:(NSData *)identityData;
- (void)setIdentityDataHash:(id)a3;
- (void)setIdentityDataImported:(BOOL)a3;
- (void)setIdentityDataInternal:(id)a3;
- (void)setIdentityDataPassword:(NSString *)identityDataPassword;
- (void)setIdentityDataPasswordKeychainItem:(id)a3;
- (void)setIdentityReferenceInternal:(id)a3;
- (void)setIncludeAllNetworks:(BOOL)includeAllNetworks;
- (void)setPasswordEncryption:(id)a3;
- (void)setPasswordKeychainItem:(id)a3;
- (void)setPasswordReference:(NSData *)passwordReference;
- (void)setProxySettings:(NEProxySettings *)proxySettings;
- (void)setServerAddress:(NSString *)serverAddress;
- (void)setSliceUUID:(id)a3;
- (void)setUsername:(NSString *)username;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
- (void)syncWithKeychainInDomainCommon:(int64_t)a3;
@end

@implementation NEVPNProtocol

- (NEVPNProtocol)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEVPNProtocol;
  v4 = -[NEVPNProtocol init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_keychainDomain = 0LL;
    v4->_type = a3;
    uint64_t v6 = [MEMORY[0x189607AB8] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    *(_DWORD *)&v5->_excludeLocalNetworks = 16843009;
  }

  return v5;
}

- (NEVPNProtocol)initWithProtocolIdentifier:(id)a3
{
  id v4 = a3;
  v5 = -[NEVPNProtocol init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    *(_DWORD *)&v5->_excludeLocalNetworks = 16843009;
  }

  return v5;
}

- (NEVPNProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEVPNProtocol init](self, "init");
  if (v5)
  {
    v5->_type = (int)[v4 decodeInt32ForKey:@"Type"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v8;
    }

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PasswordReference"];
    passwordReference = v5->_passwordReference;
    v5->_passwordReference = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAddress"];
    serverAddress = v5->_serverAddress;
    v5->_serverAddress = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Username"];
    username = v5->_username;
    v5->_username = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
    passwordKeychainItem = v5->_passwordKeychainItem;
    v5->_passwordKeychainItem = (NEKeychainItem *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PasswordEncryption"];
    passwordEncryption = v5->_passwordEncryption;
    v5->_passwordEncryption = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
    identity = v5->_identity;
    v5->_identity = (NEIdentityKeychainItem *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityData"];
    identityDataInternal = v5->_identityDataInternal;
    v5->_identityDataInternal = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPassword"];
    identityDataPassword = v5->_identityDataPassword;
    v5->_identityDataPassword = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPasswordKeychainItem"];
    identityDataPasswordKeychainItem = v5->_identityDataPasswordKeychainItem;
    v5->_identityDataPasswordKeychainItem = (NEKeychainItem *)v26;

    v5->_identityDataImported = [v4 decodeBoolForKey:@"IdentityDataImported"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataHash"];
    identityDataHash = v5->_identityDataHash;
    v5->_identityDataHash = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxySettings"];
    proxySettings = v5->_proxySettings;
    v5->_proxySettings = (NEProxySettings *)v30;

    v5->_disconnectOnIdle = [v4 decodeBoolForKey:@"DisconnectOnIdle"];
    v5->_disconnectOnIdleTimeout = [v4 decodeInt32ForKey:@"DisconnectOnIdleTimeout"];
    v5->_disconnectOnSleep = [v4 decodeBoolForKey:@"DisconnectOnSleep"];
    v5->_disconnectOnWake = [v4 decodeBoolForKey:@"DisconnectOnWake"];
    v5->_disconnectOnWakeTimeout = [v4 decodeInt32ForKey:@"DisconnectOnWakeTimeout"];
    v5->_disconnectOnUserSwitch = [v4 decodeBoolForKey:@"DisconnectOnUserSwitch"];
    v5->_disconnectOnLogout = [v4 decodeBoolForKey:@"DisconnectOnLogoutKey"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSSettings"];
    DNSSettings = v5->_DNSSettings;
    v5->_DNSSettings = (NEDNSSettings *)v32;

    v5->_includeAllNetworks = [v4 decodeBoolForKey:@"IncludeAllNetworks"];
    v5->_enforceRoutes = [v4 decodeBoolForKey:@"EnforceRoutes"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExtensibleSSOProvider"];
    extensibleSSOProvider = v5->_extensibleSSOProvider;
    v5->_extensibleSSOProvider = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CellularSliceUUID"];
    sliceUUID = v5->_sliceUUID;
    v5->_sliceUUID = (NSString *)v36;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  objc_msgSend(v20, "encodeInt32:forKey:", -[NEVPNProtocol type](self, "type"), @"Type");
  -[NEVPNProtocol identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v4 forKey:@"Identifier"];
  v5 = -[NEVPNProtocol passwordReference](self, "passwordReference");
  [v20 encodeObject:v5 forKey:@"PasswordReference"];

  -[NEVPNProtocol serverAddress](self, "serverAddress");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v6 forKey:@"ServerAddress"];
  v7 = -[NEVPNProtocol username](self, "username");
  [v20 encodeObject:v7 forKey:@"Username"];

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v8 forKey:@"Password"];

  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v9 forKey:@"PasswordEncryption"];

  if (self) {
    id Property = objc_getProperty(self, v10, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v20 encodeObject:Property forKey:@"Identity"];
  -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v12 forKey:@"IdentityData"];
  v13 = -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
  [v20 encodeObject:v13 forKey:@"IdentityDataPassword"];

  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v14 forKey:@"IdentityDataPasswordKeychainItem"];

  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol identityDataImported](self, "identityDataImported"),  @"IdentityDataImported");
  v15 = -[NEVPNProtocol identityDataHash](self, "identityDataHash");
  [v20 encodeObject:v15 forKey:@"IdentityDataHash"];

  -[NEVPNProtocol proxySettings](self, "proxySettings");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v16 forKey:@"ProxySettings"];

  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"),  @"DisconnectOnIdle");
  objc_msgSend( v20,  "encodeInt32:forKey:",  -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"),  @"DisconnectOnIdleTimeout");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"),  @"DisconnectOnSleep");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"),  @"DisconnectOnWake");
  objc_msgSend( v20,  "encodeInt32:forKey:",  -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"),  @"DisconnectOnWakeTimeout");
  v17 = -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  [v20 encodeObject:v17 forKey:@"DNSSettings"];

  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"),  @"IncludeAllNetworks");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"),  @"ExcludeLocalNetworks");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"),  @"ExcludeCellularServices");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"), @"ExcludeAPNs");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"),  @"ExcludeDeviceCommunication");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"), @"EnforceRoutes");
  -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v18 forKey:@"ExtensibleSSOProvider"];
  v19 = -[NEVPNProtocol sliceUUID](self, "sliceUUID");
  [v20 encodeObject:v19 forKey:@"CellularSliceUUID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = -[NEVPNProtocol identifier](self, "identifier");
  uint64_t v6 = (void *)[v4 initWithProtocolIdentifier:v5];
  v7 = -[NEVPNProtocol serverAddress](self, "serverAddress");
  [v6 setServerAddress:v7];

  -[NEVPNProtocol username](self, "username");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setUsername:v8];

  -[NEVPNProtocol passwordReference](self, "passwordReference");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setPasswordReference:v9];

  if (self)
  {
    id Property = objc_getProperty(self, v10, 96LL, 1);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id Property = 0LL;
  if (v6) {
LABEL_3:
  }
    objc_setProperty_atomic(v6, v10, Property, 96LL);
LABEL_4:
  -[NEVPNProtocol identityDataInternal](self, "identityDataInternal", Property);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setIdentityDataInternal:v12];
  v13 = -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
  [v6 setIdentityDataPassword:v13];

  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setIdentityDataPasswordKeychainItem:v14];

  objc_msgSend(v6, "setIdentityDataImported:", -[NEVPNProtocol identityDataImported](self, "identityDataImported"));
  v15 = -[NEVPNProtocol identityDataHash](self, "identityDataHash");
  [v6 setIdentityDataHash:v15];

  -[NEVPNProtocol proxySettings](self, "proxySettings");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setProxySettings:v16];

  objc_msgSend(v6, "setDisconnectOnIdle:", -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"));
  objc_msgSend( v6,  "setDisconnectOnIdleTimeout:",  -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"));
  objc_msgSend(v6, "setDisconnectOnSleep:", -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"));
  objc_msgSend(v6, "setDisconnectOnWake:", -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"));
  objc_msgSend( v6,  "setDisconnectOnWakeTimeout:",  -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"));
  v17 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  [v6 setPasswordKeychainItem:v17];

  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setPasswordEncryption:v18];

  if (!self)
  {
    int64_t keychainDomain = 0LL;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  int64_t keychainDomain = self->_keychainDomain;
  if (v6) {
LABEL_6:
  }
    v6[10] = keychainDomain;
LABEL_7:
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setDNSSettings:v20];

  objc_msgSend(v6, "setIncludeAllNetworks:", -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"));
  objc_msgSend(v6, "setExcludeLocalNetworks:", -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"));
  objc_msgSend( v6,  "setExcludeCellularServices:",  -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"));
  objc_msgSend(v6, "setExcludeAPNs:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"));
  objc_msgSend( v6,  "setExcludeDeviceCommunication:",  -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"));
  objc_msgSend(v6, "setEnforceRoutes:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"));
  v21 = -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
  [v6 setExtensibleSSOProvider:v21];

  -[NEVPNProtocol sliceUUID](self, "sliceUUID");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setSliceUUID:v22];

  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  if (-[NEVPNProtocol type](self, "type") == 2
    || (-[NEVPNProtocol serverAddress](self, "serverAddress"),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        (id)v5,
        v5))
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing server address", v4);
  }

  uint64_t v6 = -[NEVPNProtocol proxySettings](self, "proxySettings");
  if (v6)
  {
    v7 = (void *)v6;
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 checkValidityAndCollectErrors:v4];

    LOBYTE(v5) = v5 & v9;
  }

  uint64_t v10 = -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  if (v10)
  {
    v11 = (void *)v10;
    -[NEVPNProtocol DNSSettings](self, "DNSSettings");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    LOBYTE(v5) = v5 & v13;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  if (self)
  {
    unint64_t v9 = -[NEVPNProtocol type](self, "type") - 1;
    if (v9 > 5) {
      uint64_t v10 = @"<unknown>";
    }
    else {
      uint64_t v10 = off_18A090530[v9];
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  [v7 appendPrettyObject:v10 withName:@"type" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  v11 = -[NEVPNProtocol identifier](self, "identifier");
  [v7 appendPrettyObject:v11 withName:@"identifier" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEVPNProtocol serverAddress](self, "serverAddress");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = a4 | 9;
  [v7 appendPrettyObject:v12 withName:@"serverAddress" andIndent:v5 options:a4 | 9];

  -[NEVPNProtocol username](self, "username");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"username" andIndent:v5 options:a4 | 9];
  v15 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  [v7 appendPrettyObject:v15 withName:@"password" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v16 withName:@"passwordEncryption" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  v17 = -[NEVPNProtocol passwordReference](self, "passwordReference");
  unint64_t v18 = a4 | 8;
  [v7 appendPrettyObject:v17 withName:@"passwordReference" andIndent:v5 options:v18];

  if (self) {
    id Property = objc_getProperty(self, v19, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"identity" andIndent:v5 options:v8];
  v21 = -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
  if (v21)
  {
    uint64_t v22 = (void *)NSString;
    v23 = -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
    objc_msgSend(v22, "stringWithFormat:", @"%lu bytes", objc_msgSend(v23, "length"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v24 withName:@"identityData" andIndent:v5 options:v18];
  }

  else
  {
    [v7 appendPrettyObject:0 withName:@"identityData" andIndent:v5 options:v18];
  }

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol identityDataImported](self, "identityDataImported"),  @"identityDataImported",  v5,  v8);
  v25 = -[NEVPNProtocol identityDataHash](self, "identityDataHash");
  [v7 appendPrettyObject:v25 withName:@"identityDataHash" andIndent:v5 options:v8];

  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v26 withName:@"identityDataPassword" andIndent:v5 options:v8];
  v27 = -[NEVPNProtocol identityReference](self, "identityReference");
  [v7 appendPrettyObject:v27 withName:@"identityReference" andIndent:v5 options:v18];

  -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v28 withName:@"identityDataPassword" andIndent:v5 options:v13];
  v29 = -[NEVPNProtocol proxySettings](self, "proxySettings");
  [v7 appendPrettyObject:v29 withName:@"proxySettings" andIndent:v5 options:v18];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"),  @"disconnectOnSleep",  v5,  v18);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"),  @"disconnectOnIdle",  v5,  v8);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"),  @"disconnectOnIdleTimeout",  v5,  v8);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"),  @"disconnectOnWake",  v5,  v8);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"),  @"disconnectOnWakeTimeout",  v5,  v8);
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v30 withName:@"DNSSettings" andIndent:v5 options:v8];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"),  @"includeAllNetworks",  v5,  v18);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"),  @"excludeLocalNetworks",  v5,  v18);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"),  @"excludeCellularServices",  v5,  v18);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"),  @"excludeAPNs",  v5,  v18);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"),  @"excludeDeviceCommunication",  v5,  v18);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"),  @"enforceRoutes",  v5,  v18);
  v31 = -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
  [v7 appendPrettyObject:v31 withName:@"extensibleSSOProvider" andIndent:v5 options:v8];

  -[NEVPNProtocol sliceUUID](self, "sliceUUID");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v32 withName:@"cellularSliceUUID" andIndent:v5 options:v13];

  return v7;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEVPNProtocol serverAddress](self, "serverAddress");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEVPNProtocol serverAddress](self, "serverAddress");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960CAB0]];
  }

  -[NEVPNProtocol username](self, "username");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[NEVPNProtocol username](self, "username");
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C998]];
  }

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v9 isEqualToString:*MEMORY[0x18960CBA8]];
    v11 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    uint64_t v12 = v11;
    if (v10) {
      [v11 identifier];
    }
    else {
      [v11 password];
    }
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13) {
      [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x18960C9A0]];
    }
  }

  -[NEVPNProtocol passwordReference](self, "passwordReference");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[NEVPNProtocol passwordReference](self, "passwordReference");
    [v3 setObject:v15 forKeyedSubscript:@"PasswordReference"];
  }

  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x18960C9A8]];
  }

  if (self && objc_getProperty(self, v17, 96LL, 1))
  {
    objc_msgSend(objc_getProperty(self, v19, 96, 1), "persistentReference");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x18960CA00]];
  }

  -[NEVPNProtocol addDisconnectOptions:](self, "addDisconnectOptions:", v3);
  v21 = -[NEVPNProtocol proxySettings](self, "proxySettings");
  if (v21)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)[v22 copyLegacyDictionary];
    [v3 setObject:v23 forKeyedSubscript:*MEMORY[0x18960C5A8]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = isa_nsuuid(v5);

  if (v6)
  {
    [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = -[NEVPNProtocol initWithProtocolIdentifier:](self, "initWithProtocolIdentifier:", v7);

    if (!v8) {
      goto LABEL_27;
    }
  }

  else
  {
    unint64_t v8 = -[NEVPNProtocol init](self, "init");
    if (!v8) {
      goto LABEL_27;
    }
  }

  [v4 objectForKeyedSubscript:@"__NEVPNProtocolType"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = isa_nsnumber(v9);

  if (v10)
  {
    [v4 objectForKeyedSubscript:@"__NEVPNProtocolType"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_type = (int)[v11 intValue];
  }

  [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = isa_nsnumber(v12);

  if (v13)
  {
    [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_int64_t keychainDomain = (int)[v14 intValue];
  }

  uint64_t v15 = *MEMORY[0x18960CAB0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960CAB0]];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = isa_nsstring(v16);

  if (v17)
  {
    [v4 objectForKeyedSubscript:v15];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 copy];
    serverAddress = v8->_serverAddress;
    v8->_serverAddress = (NSString *)v19;
  }

  else
  {
    unint64_t v18 = v8->_serverAddress;
    v8->_serverAddress = (NSString *)&stru_18A0915E8;
  }

  uint64_t v21 = *MEMORY[0x18960C998];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C998]];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = isa_nsstring(v22);

  if (v23)
  {
    [v4 objectForKeyedSubscript:v21];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 copy];
    username = v8->_username;
    v8->_username = (NSString *)v25;
  }

  uint64_t v27 = *MEMORY[0x18960C9A0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C9A0]];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  int v29 = isa_nsstring(v28);

  if (v29)
  {
    uint64_t v30 = *MEMORY[0x18960C9A8];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C9A8]];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    int v32 = isa_nsstring(v31);

    if (v32)
    {
      uint64_t v33 = [v4 objectForKeyedSubscript:v30];
      passwordEncryption = v8->_passwordEncryption;
      v8->_passwordEncryption = (NSString *)v33;

      if (-[NSString isEqualToString:](v8->_passwordEncryption, "isEqualToString:", *MEMORY[0x18960CBA8]))
      {
        v35 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
        [v4 objectForKeyedSubscript:v27];
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:]( v35,  "initWithLegacyIdentifier:domain:accessGroup:",  v36,  v8->_keychainDomain,  v8->_keychainAccessGroup);
        passwordKeychainItem = v8->_passwordKeychainItem;
        v8->_passwordKeychainItem = (NEKeychainItem *)v37;
      }
    }

    if (!v8->_passwordKeychainItem)
    {
      v39 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      [v4 objectForKeyedSubscript:v27];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v39,  "initWithPassword:domain:accessGroup:",  v40,  v8->_keychainDomain,  v8->_keychainAccessGroup);
      v42 = v8->_passwordKeychainItem;
      v8->_passwordKeychainItem = (NEKeychainItem *)v41;
    }
  }

  [v4 objectForKeyedSubscript:@"PasswordReference"];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  int v44 = isa_nsdata(v43);

  if (v44)
  {
    [v4 objectForKeyedSubscript:@"PasswordReference"];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setPasswordReference:](v8, "setPasswordReference:", v45);
  }

  uint64_t v46 = *MEMORY[0x18960CA00];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960CA00]];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  int v48 = isa_nsdata(v47);

  if (v48)
  {
    v49 = objc_alloc(&OBJC_CLASS___NEIdentityKeychainItem);
    [v4 objectForKeyedSubscript:v46];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v49,  "initWithPersistentReference:domain:accessGroup:",  v50,  v8->_keychainDomain,  objc_getProperty(v8, v51, 88LL, 1));
    objc_setProperty_atomic(v8, v53, v52, 96LL);
  }

  -[NEVPNProtocol initDisconnectOptions:](v8, "initDisconnectOptions:", v4);
  uint64_t v54 = *MEMORY[0x18960C5A8];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C5A8]];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  int v56 = isa_nsdictionary(v55);

  if (v56)
  {
    v57 = objc_alloc(&OBJC_CLASS___NEProxySettings);
    [v4 objectForKeyedSubscript:v54];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = -[NEProxySettings initFromLegacyDictionary:](v57, "initFromLegacyDictionary:", v58);
    proxySettings = v8->_proxySettings;
    v8->_proxySettings = (NEProxySettings *)v59;
  }

  v61 = v8;
LABEL_27:

  return v8;
}

- (void)addDisconnectOptions:(id)a3
{
  id v4 = a3;
  if (-[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle")) {
    uint64_t v5 = &unk_18A0CFAE0;
  }
  else {
    uint64_t v5 = &unk_18A0CFAF8;
  }
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x18960C9D0]];
  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x18960C9D8]];

  if (-[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep")) {
    v7 = &unk_18A0CFAE0;
  }
  else {
    v7 = &unk_18A0CFAF8;
  }
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C9E8]];
  if (-[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake")) {
    unint64_t v8 = &unk_18A0CFAE0;
  }
  else {
    unint64_t v8 = &unk_18A0CFAF8;
  }
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x18960C9F0]];
  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x18960C9F8]];
}

- (void)initDisconnectOptions:(id)a3
{
  id v9 = a3;
  [v9 objectForKeyedSubscript:*MEMORY[0x18960C9D0]];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:*MEMORY[0x18960C9D8]];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 objectForKeyedSubscript:*MEMORY[0x18960C9E8]];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 objectForKeyedSubscript:*MEMORY[0x18960C9F0]];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 objectForKeyedSubscript:*MEMORY[0x18960C9F8]];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = (void *)[v6 copyLegacyDictionary];
  }

  int v7 = +[NEConfiguration setConfiguration:forProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  (const __CFDictionary *)v5,  (const __CFString *)*MEMORY[0x18960C5F8],  a3);
  if (v5) {
    CFRelease(v5);
  }
  if (!v7) {
    return 0;
  }
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocol DNSSettings](self, "DNSSettings");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = (const __CFDictionary *)[v9 copyLegacyDictionary];
  }

  else
  {
    int v10 = 0LL;
  }

  char v11 = +[NEConfiguration setConfiguration:forProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  v10,  (const __CFString *)*MEMORY[0x18960C5E0],  a3);
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  CFDictionaryRef v5 = +[NEConfiguration copyConfigurationForProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  (const __CFString *)*MEMORY[0x18960C5F8],  a3);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    id v7 = -[NEProxySettings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEProxySettings),  "initFromLegacyDictionary:",  v5);
    -[NEVPNProtocol setProxySettings:](self, "setProxySettings:", v7);

    CFRelease(v6);
  }

  CFDictionaryRef v8 = +[NEConfiguration copyConfigurationForProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  (const __CFString *)*MEMORY[0x18960C5E0],  a3);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    id v10 = -[NEDNSSettings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEDNSSettings),  "initFromLegacyDictionary:",  v8);
    -[NEVPNProtocol setDNSSettings:](self, "setDNSSettings:", v10);

    CFRelease(v9);
  }

  return 1;
}

- (__SCNetworkInterface)createInterface
{
  return 0LL;
}

- (void)setIdentityReferenceInternal:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v14)
  {
    if (v4 && objc_getProperty(v4, v5, 96LL, 1))
    {
      id v7 = objc_getProperty(v4, v6, 96LL, 1);
      [v7 setPersistentReference:v14];
    }

    else
    {
      CFDictionaryRef v9 = objc_alloc(&OBJC_CLASS___NEIdentityKeychainItem);
      if (v4)
      {
        int64_t keychainDomain = v4->_keychainDomain;
        id Property = objc_getProperty(v4, v8, 88LL, 1);
      }

      else
      {
        int64_t keychainDomain = 0LL;
        id Property = 0LL;
      }

      id v7 = Property;
      int v13 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v9,  "initWithPersistentReference:domain:accessGroup:",  v14,  keychainDomain,  v7);
      if (v4) {
        objc_setProperty_atomic(v4, v12, v13, 96LL);
      }
    }
  }

  else if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0LL, 96LL);
  }

  objc_sync_exit(v4);
}

- (NSData)identityReferenceInternal
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 96LL, 1))
  {
    id v5 = objc_getProperty(v2, v4, 96LL, 1);
    [v5 persistentReference];
    CFDictionaryRef v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    CFDictionaryRef v6 = 0LL;
  }

  objc_sync_exit(v2);

  return (NSData *)v6;
}

- (void)setIdentityData:(NSData *)identityData
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = identityData;
  -[NEVPNProtocol setIdentityDataInternal:](self, "setIdentityDataInternal:", v4);
  if (v4)
  {
    CC_SHA1_Init(&c);
    id v5 = v4;
    CC_SHA1_Update(&c, -[NSData bytes](v5, "bytes"), -[NSData length](v5, "length"));
    CC_SHA1_Final(md, &c);
    [MEMORY[0x189603F48] dataWithBytes:md length:20];
    CFDictionaryRef v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setIdentityDataHash:](self, "setIdentityDataHash:", v6);
  }

  else
  {
    -[NEVPNProtocol setIdentityDataHash:](self, "setIdentityDataHash:", 0LL);
  }
}

- (void)syncWithKeychainInDomainCommon:(int64_t)a3
{
  if (self)
  {
    id v5 = objc_getProperty(self, a2, 96LL, 1);
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = objc_msgSend(objc_getProperty(self, v6, 96, 1), "domain");

      if (v8 == a3) {
        objc_msgSend(objc_getProperty(self, v9, 96, 1), "sync");
      }
    }
  }

  if (!a3)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = v10;
    if (v10)
    {
      [v10 HTTPServer];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v12);

      [v11 HTTPSServer];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v13);

      [v11 FTPServer];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v14);

      [v11 RTSPServer];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v15);

      [v11 gopherServer];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v16);

      [v11 SOCKSServer];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v17);
    }

    -[NEVPNProtocol setIdentityDataPassword:](self, "setIdentityDataPassword:", 0LL);
  }

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v25 = a4;
  id v8 = a5;
  -[NEVPNProtocol syncWithKeychainInDomainCommon:](self, "syncWithKeychainInDomainCommon:", a3);
  uint64_t v9 = -[NEVPNProtocol username](self, "username");
  if (v9)
  {
    id v10 = (void *)v9;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    char v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      uint64_t v12 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      [v25 identifier];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 UUIDString];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        int64_t keychainDomain = self->_keychainDomain;
        id Property = objc_getProperty(self, v14, 88LL, 1);
      }

      else
      {
        int64_t keychainDomain = 0LL;
        id Property = 0LL;
      }

      unint64_t v18 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:]( v12,  "initWithIdentifier:domain:accessGroup:",  v15,  keychainDomain,  Property);
      -[NEVPNProtocol setPasswordKeychainItem:](self, "setPasswordKeychainItem:", v18);
    }
  }

  uint64_t v19 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  if (v19)
  {
    id v20 = (void *)v19;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v21 domain];

    if (v22 == a3)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      int v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocol username](self, "username");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 syncUsingConfiguration:v25 accountName:v24 passwordType:0 identifierSuffix:v8];
    }
  }
}

- (BOOL)needToUpdateKeychain
{
  uint64_t v3 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  if (v3)
  {
    id v4 = (void *)v3;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 password];
    if (v6)
    {
      id v7 = (void *)v6;
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 password];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 length];

      if (v10) {
        return 1;
      }
    }

    else
    {
    }
  }

  -[NEVPNProtocol proxySettings](self, "proxySettings");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = v12;
  if (v12)
  {
    [v12 HTTPServer];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL updated = -[NEProxyServer needToUpdateKeychain](v14);

    if (updated) {
      goto LABEL_12;
    }
    [v13 HTTPSServer];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = -[NEProxyServer needToUpdateKeychain](v16);

    if (v17) {
      goto LABEL_12;
    }
    [v13 FTPServer];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v19 = -[NEProxyServer needToUpdateKeychain](v18);

    if (v19) {
      goto LABEL_12;
    }
    [v13 RTSPServer];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v21 = -[NEProxyServer needToUpdateKeychain](v20);

    if (v21
      || ([v13 gopherServer],
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(),
          BOOL v23 = -[NEProxyServer needToUpdateKeychain](v22),
          v22,
          v23))
    {
LABEL_12:
      BOOL v11 = 1;
    }

    else
    {
      [v13 SOCKSServer];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v11 = -[NEProxyServer needToUpdateKeychain](v25);
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  uint64_t v7 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  if (v7)
  {
    id v8 = (void *)v7;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 domain];

    if (v10 == a3)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setIdentifier:0];
    }
  }

  if (!a3)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = v12;
    if (v12)
    {
      [v12 HTTPServer];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v14);

      [v13 HTTPSServer];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v15);

      [v13 FTPServer];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v16);

      [v13 RTSPServer];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v17);

      [v13 gopherServer];
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v18);

      [v13 SOCKSServer];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v19);
    }
  }

  uint64_t v20 = -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  if (v20)
  {
    uint64_t v22 = (void *)v20;
    -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v23 domain];

    if (v24 == a3)
    {
      -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setIdentifier:0];
    }
  }

  if (!a4 && self)
  {
    if (objc_getProperty(self, v21, 96LL, 1))
    {
      objc_msgSend(objc_getProperty(self, v26, 96, 1), "remove");
      -[NEVPNProtocol setIdentityData:](self, "setIdentityData:", 0LL);
    }
  }

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 migrateFromPreferences:a3];
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  if (!a3)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 copyPasswordsFromKeychain];

    -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = (void *)[v7 copyPassword];
      -[NEVPNProtocol setIdentityDataPassword:](self, "setIdentityDataPassword:", v6);
    }
  }

- (id)description
{
  return -[NEVPNProtocol descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (NSString)serverAddress
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setServerAddress:(NSString *)serverAddress
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPasswordReference:(NSData *)passwordReference
{
}

- (NSString)identityDataPassword
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setIdentityDataPassword:(NSString *)identityDataPassword
{
}

- (BOOL)disconnectOnSleep
{
  return self->_disconnectOnSleep;
}

- (void)setDisconnectOnSleep:(BOOL)disconnectOnSleep
{
  self->_disconnectOnSleep = disconnectOnSleep;
}

- (NEProxySettings)proxySettings
{
  return (NEProxySettings *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setProxySettings:(NEProxySettings *)proxySettings
{
}

- (BOOL)includeAllNetworks
{
  return self->_includeAllNetworks;
}

- (void)setIncludeAllNetworks:(BOOL)includeAllNetworks
{
  self->_includeAllNetworks = includeAllNetworks;
}

- (BOOL)excludeLocalNetworks
{
  return self->_excludeLocalNetworks;
}

- (void)setExcludeLocalNetworks:(BOOL)excludeLocalNetworks
{
  self->_excludeLocalNetworks = excludeLocalNetworks;
}

- (BOOL)excludeCellularServices
{
  return self->_excludeCellularServices;
}

- (void)setExcludeCellularServices:(BOOL)excludeCellularServices
{
  self->_excludeCellularServices = excludeCellularServices;
}

- (BOOL)excludeAPNs
{
  return self->_excludeAPNs;
}

- (void)setExcludeAPNs:(BOOL)excludeAPNs
{
  self->_excludeAPNs = excludeAPNs;
}

- (BOOL)excludeDeviceCommunication
{
  return self->_excludeDeviceCommunication;
}

- (void)setExcludeDeviceCommunication:(BOOL)a3
{
  self->_excludeDeviceCommunication = a3;
}

- (BOOL)enforceRoutes
{
  return self->_enforceRoutes;
}

- (void)setEnforceRoutes:(BOOL)enforceRoutes
{
  self->_enforceRoutes = enforceRoutes;
}

- (NSString)sliceUUID
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSliceUUID:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)disconnectOnWake
{
  return self->_disconnectOnWake;
}

- (void)setDisconnectOnWake:(BOOL)a3
{
  self->_disconnectOnWake = a3;
}

- (int)disconnectOnWakeTimeout
{
  return self->_disconnectOnWakeTimeout;
}

- (void)setDisconnectOnWakeTimeout:(int)a3
{
  self->_disconnectOnWakeTimeout = a3;
}

- (NEKeychainItem)passwordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setPasswordKeychainItem:(id)a3
{
}

- (NSString)passwordEncryption
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setPasswordEncryption:(id)a3
{
}

- (NSData)identityDataInternal
{
  return (NSData *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setIdentityDataInternal:(id)a3
{
}

- (BOOL)identityDataImported
{
  return self->_identityDataImported;
}

- (void)setIdentityDataImported:(BOOL)a3
{
  self->_identityDataImported = a3;
}

- (NSData)identityDataHash
{
  return (NSData *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setIdentityDataHash:(id)a3
{
}

- (NEKeychainItem)identityDataPasswordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setIdentityDataPasswordKeychainItem:(id)a3
{
}

- (NEDNSSettings)DNSSettings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setDNSSettings:(id)a3
{
}

- (NSString)extensibleSSOProvider
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setExtensibleSSOProvider:(id)a3
{
}

- (BOOL)disconnectOnIdle
{
  return self->_disconnectOnIdle;
}

- (void)setDisconnectOnIdle:(BOOL)a3
{
  self->_disconnectOnIdle = a3;
}

- (int)disconnectOnIdleTimeout
{
  return self->_disconnectOnIdleTimeout;
}

- (void)setDisconnectOnIdleTimeout:(int)a3
{
  self->_disconnectOnIdleTimeout = a3;
}

- (BOOL)disconnectOnUserSwitch
{
  return self->_disconnectOnUserSwitch;
}

- (void)setDisconnectOnUserSwitch:(BOOL)a3
{
  self->_disconnectOnUserSwitch = a3;
}

- (BOOL)disconnectOnLogout
{
  return self->_disconnectOnLogout;
}

- (void)setDisconnectOnLogout:(BOOL)a3
{
  self->_disconnectOnLogout = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end