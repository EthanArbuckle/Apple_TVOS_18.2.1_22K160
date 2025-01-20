@interface NEConfiguration
+ (BOOL)supportsSecureCoding;
+ (CFDictionaryRef)copyConfigurationForProtocol:(const __SCNetworkService *)a3 inService:;
+ (NEConfiguration)configurationWithProfilePayload:(id)a3;
+ (NEConfiguration)configurationWithProfilePayload:(id)a3 grade:(int64_t)a4;
+ (uint64_t)setConfiguration:(const __CFString *)a3 forProtocol:(const __SCNetworkService *)a4 inService:;
+ (void)addError:(void *)a3 toList:;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)configureVpnOnDemand:(void *)a3 vpnType:;
- (BOOL)configureVpnOnDemandRules:(void *)a1;
- (BOOL)ingestDisconnectOptions:(void *)a1;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedBySC;
- (BOOL)isTransparentProxy;
- (BOOL)setAppLayerVPNUUID:(id)a3 andSafariDomains:(id)a4;
- (BOOL)setAssociatedDomains:(id)a3;
- (BOOL)setCalendarDomains:(id)a3;
- (BOOL)setCalendarDomains:(id)a3 accountIdentifiers:(id)a4;
- (BOOL)setCertificates:(id)a3;
- (BOOL)setCertificates:(id)a3 keyRefs:(id)a4 specs:(id)a5;
- (BOOL)setConfigurationVPNPassword:(void *)a1;
- (BOOL)setContactsDomains:(id)a3;
- (BOOL)setContactsDomains:(id)a3 accountIdentifiers:(id)a4;
- (BOOL)setExcludedDomains:(id)a3;
- (BOOL)setMailDomains:(id)a3;
- (BOOL)setMailDomains:(id)a3 accountIdentifiers:(id)a4;
- (BOOL)setPayloadInfoCommon:(id)a3 payloadOrganization:(id)a4;
- (BOOL)setPayloadInfoIdentity:(id)a3;
- (BOOL)setPerAppRuleSettings:(id)a3 withAppIdentifier:(id)a4;
- (BOOL)setPerAppUUID:(id)a3 andSafariDomains:(id)a4;
- (BOOL)setProfileInfo:(id)a3;
- (BOOL)setRestrictDomains:(BOOL)a3;
- (BOOL)setSMBDomains:(id)a3;
- (BOOL)usesPolicyBasedRouting;
- (NEAOVPN)alwaysOnVPN;
- (NEAppPush)appPush;
- (NEConfiguration)initWithCoder:(id)a3;
- (NEConfiguration)initWithName:(id)a3 grade:(int64_t)a4;
- (NEContentFilter)contentFilter;
- (NEDNSProxy)dnsProxy;
- (NEDNSSettingsBundle)dnsSettings;
- (NEPathController)pathController;
- (NEProfileIngestionPayloadInfo)payloadInfo;
- (NERelayConfiguration)relay;
- (NEVPN)VPN;
- (NEVPNApp)appVPN;
- (NSString)application;
- (NSString)applicationIdentifier;
- (NSString)applicationName;
- (NSString)externalIdentifier;
- (NSString)name;
- (NSString)pluginType;
- (NSUUID)identifier;
- (__CFString)initWithAlwaysOnVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)copyMachOUUIDsFromBundleIdentifier:(uint64_t)a1;
- (id)copyProviderMachOUUIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithOptions:(unint64_t)a3;
- (id)generateSignature;
- (id)getCertificates;
- (id)getConfigurationIdentifier;
- (id)getConfigurationProtocol;
- (id)getPendingCertificateInfo:(id)a3;
- (id)getPendingCertificateUUIDs:(id)a3;
- (id)getPendingCertificateUUIDsDNSSettings:(void *)a1;
- (id)getPendingCertificateUUIDsInternal:(void *)a1;
- (id)getPendingCertificateUUIDsRelay:(void *)a1;
- (id)initWithContentFilterPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithDNSProxyPayload:(id)a1 configurationName:(void *)a2 grade:(void *)a3;
- (id)initWithDNSSettingsPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithIdentifier:(id *)a1;
- (id)initWithPathControllerPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithRelayPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)mergeArray:(void *)a3 withArray:;
- (int64_t)grade;
- (uint64_t)applyChangesToSCServiceInPreferences:(void *)a1;
- (uint64_t)configureIKE:(void *)a3 vpnType:(void *)a4 payloadBase:(void *)a5 vpn:;
- (uint64_t)configurePPPWithVPNOptions:(void *)a3 payloadBase:;
- (uint64_t)configurePluginWithPayload:(void *)a3 pluginType:(void *)a4 payloadType:(void *)a5 vpnType:;
- (uint64_t)ingestDNSOptions:(void *)a1;
- (uint64_t)ingestIPSecDict:(void *)a3 vpnType:(void *)a4 vpn:;
- (uint64_t)ingestProxyOptions:(void *)a1;
- (uint64_t)setCertificateContentFilter:(void *)a1;
- (uint64_t)setCertificateDNSSettings:(void *)a1;
- (uint64_t)setCertificatesRelay:(void *)a3 keyRefs:(void *)a4 specs:;
- (uint64_t)updateFromSCService:(void *)a1;
- (uint64_t)validateStrings:(uint64_t)a1;
- (unint64_t)hash;
- (void)applyOverrides;
- (void)clearKeychainInDomain:(void *)a1;
- (void)clearSystemKeychain;
- (void)copyPasswordsFromSystemKeychain;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysOnVPN:(id)a3;
- (void)setAppPush:(id)a3;
- (void)setAppVPN:(id)a3;
- (void)setApplication:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setContentFilter:(id)a3;
- (void)setDnsProxy:(id)a3;
- (void)setDnsSettings:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPathController:(id)a3;
- (void)setPayloadInfo:(id)a3;
- (void)setRelay:(id)a3;
- (void)setVPN:(id)a3;
- (void)syncWithKeychainInDomain:(void *)a1;
@end

@implementation NEConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    [v4 identifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NEConfiguration identifier](self, "identifier");
    char v6 = [v7 isEqual:v8];
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NEConfiguration)initWithName:(id)a3 grade:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEConfiguration;
  v8 = -[NEConfiguration init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_grade = a4;
    objc_storeStrong((id *)&v8->_name, a3);
    uint64_t v10 = [MEMORY[0x189607AB8] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;
  }

  return v9;
}

- (NEConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NEConfiguration;
  uint64_t v5 = -[NEConfiguration init](&v37, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExternalIdentifierString"];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Application"];
    application = v5->_application;
    v5->_application = (NSString *)v10;

    v5->_grade = (int)[v4 decodeInt32ForKey:@"Grade"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VPN"];
    VPN = v5->_VPN;
    v5->_VPN = (NEVPN *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlwaysOnVPN"];
    alwaysOnVPN = v5->_alwaysOnVPN;
    v5->_alwaysOnVPN = (NEAOVPN *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppVPN"];
    appVPN = v5->_appVPN;
    v5->_appVPN = (NEVPNApp *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContentFilter"];
    contentFilter = v5->_contentFilter;
    v5->_contentFilter = (NEContentFilter *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v5->_name;
    v5->_name = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileInfo"];
    payloadInfo = v5->_payloadInfo;
    v5->_payloadInfo = (NEProfileIngestionPayloadInfo *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v24;

    objc_storeStrong((id *)&v5->_applicationIdentifier, v5->_application);
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PathController"];
    pathController = v5->_pathController;
    v5->_pathController = (NEPathController *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSProxy"];
    dnsProxy = v5->_dnsProxy;
    v5->_dnsProxy = (NEDNSProxy *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSSettings"];
    dnsSettings = v5->_dnsSettings;
    v5->_dnsSettings = (NEDNSSettingsBundle *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppPush"];
    appPush = v5->_appPush;
    v5->_appPush = (NEAppPush *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Relay"];
    relay = v5->_relay;
    v5->_relay = (NERelayConfiguration *)v34;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[NEConfiguration identifier](self, "identifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"Identifier"];

  -[NEConfiguration externalIdentifier](self, "externalIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"ExternalIdentifierString"];

  -[NEConfiguration application](self, "application");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"Application"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEConfiguration grade](self, "grade"), @"Grade");
  -[NEConfiguration VPN](self, "VPN");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"VPN"];
  v9 = -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  [v4 encodeObject:v9 forKey:@"AlwaysOnVPN"];

  -[NEConfiguration appVPN](self, "appVPN");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"AppVPN"];
  v11 = -[NEConfiguration contentFilter](self, "contentFilter");
  [v4 encodeObject:v11 forKey:@"ContentFilter"];

  -[NEConfiguration name](self, "name");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"Name"];

  -[NEConfiguration payloadInfo](self, "payloadInfo");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"ProfileInfo"];

  -[NEConfiguration applicationName](self, "applicationName");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"ApplicationName"];
  v15 = -[NEConfiguration pathController](self, "pathController");
  [v4 encodeObject:v15 forKey:@"PathController"];

  -[NEConfiguration dnsProxy](self, "dnsProxy");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v16 forKey:@"DNSProxy"];
  v17 = -[NEConfiguration dnsSettings](self, "dnsSettings");
  [v4 encodeObject:v17 forKey:@"DNSSettings"];

  -[NEConfiguration appPush](self, "appPush");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v18 forKey:@"AppPush"];

  -[NEConfiguration relay](self, "relay");
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v19 forKey:@"Relay"];
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  -[NEConfiguration identifier](self, "identifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = v5 != 0LL;

  if (!v5) {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing configuration identifier",  v4);
  }
  -[NEConfiguration name](self, "name");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing name", v4);
    char v6 = 0;
  }

  if (-[NEConfiguration grade](self, "grade") < 1 || -[NEConfiguration grade](self, "grade") >= 4)
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid configuration grade",  v4);
    char v6 = 0;
  }

  uint64_t v8 = -[NEConfiguration VPN](self, "VPN");
  if (v8)
  {
    v9 = (void *)v8;
    -[NEConfiguration VPN](self, "VPN");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v10 checkValidityAndCollectErrors:v4];

    v6 &= v11;
  }

  uint64_t v12 = -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  if (v12)
  {
    objc_super v13 = (void *)v12;
    -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = [v14 checkValidityAndCollectErrors:v4];

    v6 &= v15;
  }

  uint64_t v16 = -[NEConfiguration appVPN](self, "appVPN");
  if (v16)
  {
    v17 = (void *)v16;
    -[NEConfiguration appVPN](self, "appVPN");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = [v18 checkValidityAndCollectErrors:v4];

    v6 &= v19;
  }

  uint64_t v20 = -[NEConfiguration contentFilter](self, "contentFilter");
  if (v20)
  {
    v21 = (void *)v20;
    -[NEConfiguration contentFilter](self, "contentFilter");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    char v23 = [v22 checkValidityAndCollectErrors:v4];

    v6 &= v23;
  }

  uint64_t v24 = -[NEConfiguration pathController](self, "pathController");
  if (v24)
  {
    v25 = (void *)v24;
    -[NEConfiguration pathController](self, "pathController");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    char v27 = [v26 checkValidityAndCollectErrors:v4];

    v6 &= v27;
  }

  uint64_t v28 = -[NEConfiguration dnsProxy](self, "dnsProxy");
  if (v28)
  {
    v29 = (void *)v28;
    -[NEConfiguration dnsProxy](self, "dnsProxy");
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    char v31 = [v30 checkValidityAndCollectErrors:v4];

    v6 &= v31;
  }

  uint64_t v32 = -[NEConfiguration dnsSettings](self, "dnsSettings");
  if (v32)
  {
    v33 = (void *)v32;
    -[NEConfiguration dnsSettings](self, "dnsSettings");
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    char v35 = [v34 checkValidityAndCollectErrors:v4];

    v6 &= v35;
  }

  uint64_t v36 = -[NEConfiguration appPush](self, "appPush");
  if (v36)
  {
    objc_super v37 = (void *)v36;
    v38 = -[NEConfiguration appPush](self, "appPush");
    char v39 = [v38 checkValidityAndCollectErrors:v4];

    v6 &= v39;
  }

  uint64_t v40 = -[NEConfiguration relay](self, "relay");
  if (v40)
  {
    v41 = (void *)v40;
    v42 = -[NEConfiguration relay](self, "relay");
    char v43 = [v42 checkValidityAndCollectErrors:v4];

    v6 &= v43;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEConfiguration allocWithZone:](&OBJC_CLASS___NEConfiguration, "allocWithZone:", a3);
  uint64_t v5 = self;
  if (v4)
  {
    v28.receiver = v4;
    v28.super_class = (Class)&OBJC_CLASS___NEConfiguration;
    id v4 = -[NEConfiguration init](&v28, sel_init);
    if (v4)
    {
      v4->_grade = -[NEConfiguration grade](v5, "grade");
      uint64_t v6 = -[NEConfiguration name](v5, "name");
      name = v4->_name;
      v4->_name = (NSString *)v6;

      -[NEConfiguration identifier](v5, "identifier");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 copy];
      identifier = v4->_identifier;
      v4->_identifier = (NSUUID *)v9;

      uint64_t v11 = -[NEConfiguration externalIdentifier](v5, "externalIdentifier");
      externalIdentifier = v4->_externalIdentifier;
      v4->_externalIdentifier = (NSString *)v11;

      uint64_t v13 = -[NEConfiguration application](v5, "application");
      application = v4->_application;
      v4->_application = (NSString *)v13;

      uint64_t v15 = -[NEConfiguration applicationName](v5, "applicationName");
      applicationName = v4->_applicationName;
      v4->_applicationName = (NSString *)v15;

      objc_storeStrong((id *)&v4->_applicationIdentifier, v4->_application);
    }
  }
  v17 = -[NEConfiguration VPN](v5, "VPN");
  -[NEConfiguration setVPN:](v4, "setVPN:", v17);

  -[NEConfiguration alwaysOnVPN](v5, "alwaysOnVPN");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setAlwaysOnVPN:](v4, "setAlwaysOnVPN:", v18);

  -[NEConfiguration appVPN](v5, "appVPN");
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setAppVPN:](v4, "setAppVPN:", v19);

  -[NEConfiguration contentFilter](v5, "contentFilter");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setContentFilter:](v4, "setContentFilter:", v20);
  v21 = -[NEConfiguration payloadInfo](v5, "payloadInfo");
  -[NEConfiguration setPayloadInfo:](v4, "setPayloadInfo:", v21);

  -[NEConfiguration pathController](v5, "pathController");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setPathController:](v4, "setPathController:", v22);

  -[NEConfiguration dnsProxy](v5, "dnsProxy");
  char v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setDnsProxy:](v4, "setDnsProxy:", v23);

  -[NEConfiguration dnsSettings](v5, "dnsSettings");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setDnsSettings:](v4, "setDnsSettings:", v24);
  v25 = -[NEConfiguration appPush](v5, "appPush");
  -[NEConfiguration setAppPush:](v4, "setAppPush:", v25);

  -[NEConfiguration relay](v5, "relay");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setRelay:](v4, "setRelay:", v26);

  return v4;
}

- (id)copyProviderMachOUUIDs
{
  if (self->_resolvedProviderMachOUUIDs) {
    return self->_providerMachOUUIDs;
  }
  -[NEConfiguration VPN](self, "VPN");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEConfiguration VPN](self, "VPN");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 protocol];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEConfiguration VPN](self, "VPN");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[NEConfiguration appVPN](self, "appVPN");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6) {
      goto LABEL_31;
    }
    -[NEConfiguration appVPN](self, "appVPN");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 protocol];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEConfiguration appVPN](self, "appVPN");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v9 = v7;
  uint64_t v10 = [v7 tunnelType];

  id v11 = 0LL;
  if (v6 && (unint64_t)(v10 - 1) <= 1)
  {
    if (v10 != 2) {
      uint64_t v10 = 5LL;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
      [v6 providerBundleIdentifier];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfiguration pluginType](self, "pluginType");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  v12,  v13,  v10,  0LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v14 machOUUIDs];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 count];

      if (v16)
      {
        [v14 machOUUIDs];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 addObjectsFromArray:v17];
      }

      [v6 authenticationPluginType];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  v18,  0LL,  v10,  0LL);
      char v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 machOUUIDs];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 count];

      if (v21)
      {
        [v19 machOUUIDs];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 addObjectsFromArray:v22];
      }

      goto LABEL_32;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  @"com.apple.NetworkExtension.IKEv2Provider",  0LL,  v10,  0LL);
      char v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 machOUUIDs];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_32;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v24 = "com.apple.racoon";
LABEL_30:
      id v11 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)v24);
      goto LABEL_32;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
      char v23 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)"com.apple.pppd");
      if ([v23 count]) {
        [v11 addObjectsFromArray:v23];
      }
      id v25 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)"com.apple.racoon");
      if ([v25 count]) {
        [v11 addObjectsFromArray:v25];
      }

      goto LABEL_19;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v24 = "com.apple.pppd";
      goto LABEL_30;
    }

- (id)generateSignature
{
  return +[NEHasher hashObject:](&OBJC_CLASS___NEHasher, "hashObject:", self);
}

- (id)description
{
  return -[NEConfiguration descriptionWithOptions:](self, "descriptionWithOptions:", 0LL);
}

- (id)descriptionWithOptions:(unint64_t)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  [v5 appendString:@"{"];
  -[NEConfiguration name](self, "name");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v6 withName:@"name" andIndent:0 options:a3 | 1];

  -[NEConfiguration identifier](self, "identifier");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v7 withName:@"identifier" andIndent:0 options:a3];

  -[NEConfiguration externalIdentifier](self, "externalIdentifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v8 withName:@"externalIdentifier" andIndent:0 options:a3 | 1];

  -[NEConfiguration applicationName](self, "applicationName");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v9 withName:@"applicationName" andIndent:0 options:a3];

  -[NEConfiguration application](self, "application");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v10 withName:@"application" andIndent:0 options:a3];

  objc_msgSend( v5,  "appendPrettyInt:withName:andIndent:options:",  -[NEConfiguration grade](self, "grade"),  @"grade",  0,  a3);
  -[NEConfiguration VPN](self, "VPN");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v11 withName:@"VPN" andIndent:0 options:a3];

  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v12 withName:@"alwaysOnVPN" andIndent:0 options:a3];

  -[NEConfiguration appVPN](self, "appVPN");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v13 withName:@"appVPN" andIndent:0 options:a3];

  -[NEConfiguration contentFilter](self, "contentFilter");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v14 withName:@"contentFilter" andIndent:0 options:a3];

  -[NEConfiguration pathController](self, "pathController");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v15 withName:@"pathController" andIndent:0 options:a3];

  -[NEConfiguration payloadInfo](self, "payloadInfo");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v16 withName:@"payloadInfo" andIndent:0 options:a3];
  v17 = -[NEConfiguration dnsProxy](self, "dnsProxy");
  [v5 appendPrettyObject:v17 withName:@"dnsProxy" andIndent:0 options:a3];

  -[NEConfiguration dnsSettings](self, "dnsSettings");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v18 withName:@"dnsSettings" andIndent:0 options:a3];

  -[NEConfiguration appPush](self, "appPush");
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v19 withName:@"appPush" andIndent:0 options:a3];

  -[NEConfiguration relay](self, "relay");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendPrettyObject:v20 withName:@"relay" andIndent:0 options:a3];

  [v5 appendString:@"\n}"];
  return v5;
}

- (void)clearSystemKeychain
{
}

- (NSString)pluginType
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEConfiguration VPN](self, "VPN");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 protocol];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 type];

    if (v6 == 4)
    {
      -[NEConfiguration VPN](self, "VPN");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 protocol];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 pluginType];
      unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unint64_t v3 = 0LL;
    }
  }

  uint64_t v9 = -[NEConfiguration appVPN](self, "appVPN");
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    -[NEConfiguration appVPN](self, "appVPN");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 protocol];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 type];

    if (v13 == 4)
    {
      -[NEConfiguration appVPN](self, "appVPN");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 protocol];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 pluginType];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        char v17 = [v3 isEqualToString:v16];

        if ((v17 & 1) != 0) {
          goto LABEL_12;
        }
        uint64_t v16 = 0LL;
        uint64_t v14 = v3;
      }

      else
      {
      }

      unint64_t v3 = v16;
    }
  }

- (BOOL)isTransparentProxy
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEConfiguration VPN](self, "VPN");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 tunnelType] == 2)
    {
      -[NEConfiguration VPN](self, "VPN");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 protocol];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[NEConfiguration VPN](self, "VPN");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 protocol];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v9 = [v8 type] == 4;
      }

      else
      {
        BOOL v9 = 0;
      }
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEnabled
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEConfiguration VPN](self, "VPN");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    uint64_t v13 = v4;
    char v14 = [v4 isEnabled];

    return v14;
  }

  -[NEConfiguration appVPN](self, "appVPN");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEConfiguration appVPN](self, "appVPN");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  -[NEConfiguration pathController](self, "pathController");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEConfiguration pathController](self, "pathController");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  -[NEConfiguration appPush](self, "appPush");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEConfiguration appPush](self, "appPush");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  -[NEConfiguration contentFilter](self, "contentFilter");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEConfiguration contentFilter](self, "contentFilter");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  -[NEConfiguration dnsProxy](self, "dnsProxy");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NEConfiguration dnsProxy](self, "dnsProxy");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  -[NEConfiguration dnsSettings](self, "dnsSettings");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEConfiguration dnsSettings](self, "dnsSettings");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  -[NEConfiguration relay](self, "relay");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NEConfiguration relay](self, "relay");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  return 0;
}

- (void)copyPasswordsFromSystemKeychain
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[NEConfiguration VPN](self, "VPN");
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 protocol];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[NEConfiguration appVPN](self, "appVPN"),
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(),
        [v5 protocol],
        id v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    [v4 copyPasswordsFromKeychainInDomain:0];
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  -[NEConfiguration relay](self, "relay", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 relays];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) copyPasswordsFromKeychainInDomain:0];
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)applyOverrides
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  unint64_t v3 = SCPreferencesCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"NEHelper control settings",  @"/Library/Preferences/com.apple.networkextension.control.plist");
  if (v3)
  {
    id v4 = v3;
    CFPropertyListRef Value = SCPreferencesGetValue(v3, @"ConfigurationOverrides");
    uint64_t v6 = (void *)Value;
    if (NEInitCFTypes_onceToken == -1)
    {
      if (Value)
      {
LABEL_6:
        uint64_t v7 = CFDICTIONARY_TYPE;
        if (CFGetTypeID(v6) == v7 && CFDictionaryGetCount((CFDictionaryRef)v6) >= 1) {
          uint64_t v6 = (void *)[v6 copy];
        }
        else {
          uint64_t v6 = 0LL;
        }
      }
    }

    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
      if (v6) {
        goto LABEL_6;
      }
    }

    CFRelease(v4);
    goto LABEL_12;
  }

  uint64_t v6 = 0LL;
LABEL_12:
  if (isa_nsdictionary(v6))
  {
    uint64_t v20 = v6;
    -[NEConfiguration name](self, "name");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 objectForKeyedSubscript:v8];
    char v19 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = v19;
    if (isa_nsdictionary(v19))
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v10 = v19;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v10);
            }
            __int128 v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (isa_nsstring(v14))
            {
              [v10 objectForKeyedSubscript:v14];
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (isa_nsstring(v15) && [v15 isEqualToString:@"nil"])
              {

                __int128 v15 = 0LL;
              }

              -[NEConfiguration setValue:forKeyPath:](self, "setValue:forKeyPath:", v15, v14);
              ne_log_obj();
              uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                -[NEConfiguration name](self, "name");
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                uint64_t v26 = v17;
                __int16 v27 = 2112;
                objc_super v28 = v14;
                __int16 v29 = 2112;
                uint64_t v30 = v15;
                _os_log_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: configuration overrides set %@ to %@",  buf,  0x20u);
              }
            }

            else
            {
              ne_log_obj();
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
              {
                -[NEConfiguration name](self, "name");
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                uint64_t v26 = v18;
                __int16 v27 = 2112;
                objc_super v28 = v14;
                _os_log_error_impl( &dword_1876B1000,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "%@: Key path in overrides is not a string: %@",  buf,  0x16u);
              }
            }
          }

          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
        }

        while (v11);
      }

      uint64_t v9 = v19;
    }

    uint64_t v6 = v20;
  }
}

- (BOOL)usesPolicyBasedRouting
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[NEConfiguration appVPN](self, "appVPN"), (unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
    || (-[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN"), (unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
  }

  else
  {
    -[NEConfiguration relay](self, "relay");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12) {
      return 0;
    }
  }

  uint64_t v4 = -[NEConfiguration VPN](self, "VPN");
  if (!v4) {
    return 1;
  }
  uint64_t v5 = (void *)v4;
  -[NEConfiguration VPN](self, "VPN");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 protocol];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 includeAllNetworks])
  {
    char v8 = 1;
  }

  else
  {
    -[NEConfiguration VPN](self, "VPN");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 protocol];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v10 enforceRoutes];
  }

  return v8;
}

- (int64_t)grade
{
  return self->_grade;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)applicationName
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)externalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NEProfileIngestionPayloadInfo)payloadInfo
{
  return (NEProfileIngestionPayloadInfo *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setPayloadInfo:(id)a3
{
}

- (NEVPN)VPN
{
  return (NEVPN *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setVPN:(id)a3
{
}

- (NEAOVPN)alwaysOnVPN
{
  return (NEAOVPN *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setAlwaysOnVPN:(id)a3
{
}

- (NEVPNApp)appVPN
{
  return (NEVPNApp *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setAppVPN:(id)a3
{
}

- (NEContentFilter)contentFilter
{
  return (NEContentFilter *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setContentFilter:(id)a3
{
}

- (NEPathController)pathController
{
  return (NEPathController *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setPathController:(id)a3
{
}

- (NEDNSProxy)dnsProxy
{
  return (NEDNSProxy *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDnsProxy:(id)a3
{
}

- (NEDNSSettingsBundle)dnsSettings
{
  return (NEDNSSettingsBundle *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setDnsSettings:(id)a3
{
}

- (NEAppPush)appPush
{
  return (NEAppPush *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setAppPush:(id)a3
{
}

- (NERelayConfiguration)relay
{
  return (NERelayConfiguration *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setRelay:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)clearKeychainInDomain:(void *)a1
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  if ([a1 grade] == 2)
  {
    [a1 VPN];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 protocol];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 type] == 1)
    {
      BOOL v6 = 1;
    }

    else
    {
      [a1 VPN];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 protocol];
      char v8 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v6 = [v8 type] == 5;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  BOOL v9 = !v6;
  uint64_t v10 = [a1 VPN];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    [a1 VPN];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 protocol];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      [a1 VPN];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      char v19 = v14;
      [v14 protocol];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 removeKeychainItemsInDomain:a2 keepIdentity:!v6];

      goto LABEL_15;
    }
  }

  uint64_t v15 = [a1 appVPN];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    [a1 appVPN];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 protocol];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [a1 appVPN];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }

  [a1 alwaysOnVPN];
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29) {
    goto LABEL_16;
  }
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  [a1 alwaysOnVPN];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 interfaceProtocolMapping];
  char v19 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v31 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v32; ++i)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v19);
        }
        uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        [a1 alwaysOnVPN];
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 interfaceProtocolMapping];
        objc_super v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 objectForKeyedSubscript:v35];
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        [v38 removeKeychainItemsInDomain:a2 keepIdentity:v9];
      }

      uint64_t v32 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v32);
  }

- (void)syncWithKeychainInDomain:(void *)a1
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a1 VPN];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    [a1 VPN];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 protocol];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [a1 VPN];
      char v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 protocol];
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 syncWithKeychainInDomain:a2 configuration:a1 suffix:0];
    }
  }

  uint64_t v10 = [a1 appVPN];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    [a1 appVPN];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 protocol];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      [a1 appVPN];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 protocol];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 syncWithKeychainInDomain:a2 configuration:a1 suffix:0];
    }
  }

  [a1 alwaysOnVPN];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    [a1 alwaysOnVPN];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 interfaceProtocolMapping];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        uint64_t v22 = 0LL;
        do
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * v22);
          [a1 alwaysOnVPN];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 interfaceProtocolMapping];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 objectForKeyedSubscript:v23];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

          [v26 syncWithKeychainInDomain:a2 configuration:a1 suffix:v23];
          ++v22;
        }

        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }

      while (v20);
    }
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  objc_msgSend(a1, "relay", 0);
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 relays];
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v34;
    do
    {
      uint64_t v32 = 0LL;
      do
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v32++) syncWithKeychainInDomain:a2 configuration:a1 suffix:0];
      }

      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v30);
  }
}

- (id)copyMachOUUIDsFromBundleIdentifier:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!a2)
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]";
      _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, "%s called with null bundleIdentifier", buf, 0xCu);
    }

    return 0LL;
  }

  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v3 = NEHelperCacheCopyAppUUIDMapping();
  uint64_t v4 = (void *)v3;
  if (v3 && MEMORY[0x1895ADD58](v3) == MEMORY[0x1895F9220])
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __54__NEConfiguration_copyMachOUUIDsFromBundleIdentifier___block_invoke;
    applier[3] = &unk_18A08E400;
    id v9 = v2;
    xpc_array_apply(v4, applier);
  }

  if ([v2 count]) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

uint64_t __54__NEConfiguration_copyMachOUUIDsFromBundleIdentifier___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1895ADD58](v4) == MEMORY[0x1895F92F8])
  {
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:xpc_uuid_get_bytes(v5)];
    [v6 addObject:v7];
  }

  return 1LL;
}

+ (void)addError:(void *)a3 toList:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  [v4 addObject:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEConfiguration)configurationWithProfilePayload:(id)a3 grade:(int64_t)a4
{
  v153[3] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  BOOL v6 = -[NEProfilePayloadBase initWithPayload:](objc_alloc(&OBJC_CLASS___NEProfilePayloadBase), "initWithPayload:", v5);
  [v5 objectForKeyedSubscript:@"PayloadType"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"UserDefinedName"];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isa_nsstring(v8) & 1) == 0)
  {
    [v5 objectForKeyedSubscript:@"PayloadDisplayName"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((isa_nsstring(v9) & 1) != 0)
    {
      char v8 = v9;
    }

    else
    {
      else {
        uint64_t v10 = @"VPNType";
      }
      [v5 objectForKeyedSubscript:v10];
      char v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  if ([v7 isEqualToString:@"com.apple.vpn.managed"])
  {
    uint64_t v11 = (NEConfiguration *)-[NEConfiguration initWithVPNPayload:configurationName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v8,  a4);
LABEL_12:
    uint64_t v12 = v11;
    goto LABEL_13;
  }

  if ([v7 isEqualToString:@"com.apple.vpn.managed.alwayson"])
  {
    uint64_t v11 = (NEConfiguration *)-[NEConfiguration initWithAlwaysOnVPNPayload:configurationName:grade:]( (__CFString *)objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v8,  a4);
    goto LABEL_12;
  }

  if ([v7 isEqualToString:@"com.apple.vpn.managed.applayer"])
  {
    __int128 v14 = objc_alloc(&OBJC_CLASS___NEConfiguration);
    uint64_t v15 = v6;
    id v16 = v8;
    if (!v14)
    {
      uint64_t v12 = 0LL;
      goto LABEL_66;
    }

    v134 = v15;
    -[NEProfilePayloadBase payloadAtom](v134, "payloadAtom");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    ne_log_large_obj();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v150 = (id)objc_opt_class();
      id v126 = v16;
      id v51 = v150;
      _os_log_debug_impl(&dword_1876B1000, v18, OS_LOG_TYPE_DEBUG, "%@ initWithAppLayerVPNPayload", buf, 0xCu);

      id v16 = v126;
    }

    v135 = v17;
    if (v17)
    {
      uint64_t v19 = [v17 objectForKeyedSubscript:@"VPNType"];
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        v153[0] = @"IPSec";
        v153[1] = @"IKEv2";
        v153[2] = @"VPN";
        [MEMORY[0x189603F18] arrayWithObjects:v153 count:3];
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v20;
        if ([v129 containsObject:v20])
        {
          uint64_t v21 = -[NEConfiguration initWithName:grade:](v14, "initWithName:grade:", v16, a4);
          if (!v21)
          {
            ne_log_obj();
            uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              v91 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v150 = v91;
              __int16 v151 = 2112;
              id v152 = v16;
              id v92 = v16;
              id v93 = v91;
              _os_log_error_impl( &dword_1876B1000,  v49,  OS_LOG_TYPE_ERROR,  "%@ initWithAppLayerVPNPayload: initWithName failed for '%@'",  buf,  0x16u);

              id v16 = v92;
            }

            uint64_t v26 = 0LL;
            __int128 v14 = 0LL;
            goto LABEL_60;
          }

          __int128 v14 = (NEConfiguration *)v21;
          id v125 = v16;
          uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NEVPNApp);
          -[NEConfiguration setAppVPN:](v14, "setAppVPN:", v22);

          -[NEConfiguration appVPN](v14, "appVPN");
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            -[NEConfiguration appVPN](v14, "appVPN");
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 setEnabled:1];

            -[NEConfiguration appVPN](v14, "appVPN");
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v25 setNoRestriction:1];

            [v17 objectForKeyedSubscript:@"Enabled"];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (isa_nsnumber(v26))
            {
              uint64_t v27 = [v26 BOOLValue];
              -[NEConfiguration appVPN](v14, "appVPN");
              objc_super v28 = (void *)objc_claimAutoreleasedReturnValue();
              [v28 setEnabled:v27];
            }

            uint64_t v29 = v133;
            [v135 objectForKeyedSubscript:v133];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              if (([v133 isEqualToString:@"IPSec"] & 1) == 0
                && ![v133 isEqualToString:@"IKEv2"])
              {
                goto LABEL_31;
              }

              -[NEConfiguration appVPN](v14, "appVPN");
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v31 setTunnelType:1];

              -[NEConfiguration appVPN](v14, "appVPN");
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              int v33 = -[NEConfiguration ingestIPSecDict:vpnType:vpn:](v14, v134, v133, v32);

              if (v33)
              {
                [v135 objectForKeyedSubscript:@"VPNSubType"];
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
                [v135 objectForKeyedSubscript:@"IKEv2"];
                __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[NEConfiguration appVPN](v14, "appVPN");
                v120 = v15;
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
                [v36 protocol];
                v118 = v7;
                __int128 v37 = v8;
                __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
                int v130 = ingestIKEv2Dict(v34, v35, v38);

                char v8 = v37;
                uint64_t v7 = v118;

                uint64_t v15 = v120;
                if (v130)
                {
LABEL_31:
                  v121 = v15;
                  if ([v133 isEqualToString:@"VPN"])
                  {
                    [v135 objectForKeyedSubscript:v133];
                    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
                    [v39 objectForKeyedSubscript:@"ProviderType"];
                    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();

                    if (isa_nsstring(v40)
                      && [v40 isEqualToString:@"packet-tunnel"])
                    {
                      -[NEConfiguration appVPN](v14, "appVPN");
                      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue();
                      __int128 v42 = v41;
                      uint64_t v43 = 1LL;
                    }

                    else
                    {
                      -[NEConfiguration appVPN](v14, "appVPN");
                      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue();
                      __int128 v42 = v41;
                      uint64_t v43 = 2LL;
                    }

                    [v41 setTunnelType:v43];

                    [v135 objectForKeyedSubscript:@"VPNSubType"];
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v29 = v133;
                    int v63 = -[NEConfiguration configurePluginWithPayload:pluginType:payloadType:vpnType:]( v14,  v134,  v62,  @"com.apple.vpn.managed.applayer",  v133);

                    if (!v63) {
                      goto LABEL_115;
                    }
                  }

                  if (!-[NEConfiguration configureVpnOnDemand:vpnType:](v14, v135, v29))
                  {
LABEL_115:
                    v52 = v26;
                    uint64_t v15 = v121;
                    goto LABEL_116;
                  }

                  uint64_t v15 = v121;
                  if (-[NEConfiguration ingestProxyOptions:](v14, v135))
                  {
                    [v135 objectForKeyedSubscript:v133];
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    [v64 objectForKeyedSubscript:@"OnDemandMatchAppEnabled"];
                    v52 = (void *)objc_claimAutoreleasedReturnValue();

                    if (isa_nsnumber(v52))
                    {
                      uint64_t v65 = [v52 BOOLValue];
                      v66 = -[NEConfiguration appVPN](v14, "appVPN");
                      [v66 setOnDemandEnabled:v65];
                    }

                    v117 = v8;
                    v119 = v7;
                    id v16 = v125;
                    if (ne_session_disable_restrictions())
                    {
                      [v135 objectForKeyedSubscript:@"AppRules"];
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      if (isa_nsdictionary(v67))
                      {
                        v114 = v52;
                        v115 = v6;
                        id v116 = v5;
                        __int128 v142 = 0u;
                        __int128 v143 = 0u;
                        __int128 v140 = 0u;
                        __int128 v141 = 0u;
                        v113 = v67;
                        id v68 = v67;
                        uint64_t v69 = [v68 countByEnumeratingWithState:&v140 objects:buf count:16];
                        if (v69)
                        {
                          uint64_t v70 = v69;
                          uint64_t v71 = *(void *)v141;
                          uint64_t v122 = *(void *)v141;
                          id v123 = v68;
                          do
                          {
                            uint64_t v72 = 0LL;
                            uint64_t v124 = v70;
                            do
                            {
                              if (*(void *)v141 != v71) {
                                objc_enumerationMutation(v68);
                              }
                              [v68 objectForKeyedSubscript:*(void *)(*((void *)&v140 + 1) + 8 * v72)];
                              v73 = (void *)objc_claimAutoreleasedReturnValue();
                              if (isa_nsdictionary(v73))
                              {
                                uint64_t v127 = v72;
                                [v73 objectForKeyedSubscript:@"ExecutableMatch"];
                                v74 = (void *)objc_claimAutoreleasedReturnValue();
                                if (isa_nsarray(v74))
                                {
                                  __int128 v138 = 0u;
                                  __int128 v139 = 0u;
                                  __int128 v136 = 0u;
                                  __int128 v137 = 0u;
                                  id v75 = v74;
                                  uint64_t v76 = [v75 countByEnumeratingWithState:&v136 objects:v148 count:16];
                                  if (v76)
                                  {
                                    uint64_t v77 = v76;
                                    uint64_t v78 = *(void *)v137;
                                    do
                                    {
                                      for (uint64_t i = 0LL; i != v77; ++i)
                                      {
                                        if (*(void *)v137 != v78) {
                                          objc_enumerationMutation(v75);
                                        }
                                        v80 = *(void **)(*((void *)&v136 + 1) + 8 * i);
                                        if (isa_nsdictionary(v80))
                                        {
                                          [v80 objectForKeyedSubscript:@"SigningIdentifier"];
                                          v81 = (void *)objc_claimAutoreleasedReturnValue();
                                          if (isa_nsstring(v81))
                                          {
                                            v82 = -[NEConfiguration appVPN](v14, "appVPN");
                                            [v82 removeAppRuleByID:v81];

                                            if (!-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( v14,  "setPerAppRuleSettings:withAppIdentifier:",  v73,  v81))
                                            {
                                              ne_log_obj();
                                              v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                                              {
                                                *(_DWORD *)v144 = 138412290;
                                                v145 = v81;
                                                _os_log_error_impl( &dword_1876B1000,  v83,  OS_LOG_TYPE_ERROR,  "initWithAppLayerVPNPayload: Could not set App-layer VPN rule for identifier %@",  v144,  0xCu);
                                              }
                                            }
                                          }
                                        }
                                      }

                                      uint64_t v77 = [v75 countByEnumeratingWithState:&v136 objects:v148 count:16];
                                    }

                                    while (v77);
                                  }

                                  uint64_t v70 = v124;
                                  id v16 = v125;
                                  uint64_t v71 = v122;
                                  id v68 = v123;
                                }

                                uint64_t v72 = v127;
                              }

                              ++v72;
                            }

                            while (v72 != v70);
                            uint64_t v70 = [v68 countByEnumeratingWithState:&v140 objects:buf count:16];
                          }

                          while (v70);
                        }

                        BOOL v6 = v115;
                        id v5 = v116;
                        v67 = v113;
                        v52 = v114;
                      }
                    }
                    v84 = -[NEConfiguration appVPN](v14, "appVPN");
                    [v84 protocol];
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v86 = [v85 sliceUUID];
                    if (v86)
                    {
                      v87 = (void *)v86;
                      v88 = -[NEConfiguration appVPN](v14, "appVPN");
                      [v88 protocol];
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      if (([v89 disconnectOnIdle] & 1) == 0)
                      {
                        v97 = -[NEConfiguration appVPN](v14, "appVPN");
                        int v131 = [v97 isOnDemandEnabled];

                        id v16 = v125;
                        char v8 = v117;
                        uint64_t v7 = v119;
                        uint64_t v15 = v121;
                        __int128 v44 = v133;
                        if (!v131) {
                          goto LABEL_111;
                        }
                        v98 = -[NEConfiguration appVPN](v14, "appVPN");
                        [v98 protocol];
                        v99 = (void *)objc_claimAutoreleasedReturnValue();
                        [v99 setDisconnectOnIdle:1];
                        v100 = -[NEConfiguration appVPN](v14, "appVPN");
                        [v100 protocol];
                        v101 = (void *)objc_claimAutoreleasedReturnValue();
                        [v101 setDisconnectOnIdleTimeout:60];

                        ne_log_obj();
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled((os_log_t)v84, OS_LOG_TYPE_INFO))
                        {
                          v102 = (void *)objc_opt_class();
                          id v132 = v102;
                          v128 = -[NEConfiguration appVPN](v14, "appVPN");
                          [v128 protocol];
                          v103 = (void *)objc_claimAutoreleasedReturnValue();
                          int v104 = [v103 disconnectOnIdle];
                          v105 = -[NEConfiguration appVPN](v14, "appVPN");
                          [v105 protocol];
                          v106 = (void *)objc_claimAutoreleasedReturnValue();
                          int v107 = [v106 disconnectOnIdleTimeout];
                          *(_DWORD *)v144 = 138412802;
                          v145 = v102;
                          __int16 v146 = 1024;
                          *(_DWORD *)v147 = v104;
                          *(_WORD *)&v147[4] = 1024;
                          *(_DWORD *)&v147[6] = v107;
                          _os_log_impl( &dword_1876B1000,  (os_log_t)v84,  OS_LOG_TYPE_INFO,  "%@ VPN Slice: onDemand on slice - disconnectOnIdle %d disconnectOnIdleTimeout %d",  v144,  0x18u);
                        }

                        id v16 = v125;
LABEL_110:

                        char v8 = v117;
                        uint64_t v7 = v119;
                        uint64_t v15 = v121;
                        __int128 v44 = v133;
LABEL_111:
                        ne_log_obj();
                        v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                        {
                          v108 = (void *)objc_opt_class();
                          id v109 = v108;
                          v110 = -[NEConfiguration appVPN](v14, "appVPN");
                          [v110 protocol];
                          v111 = (void *)objc_claimAutoreleasedReturnValue();
                          [v111 serverAddress];
                          v112 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v144 = 138412546;
                          v145 = v108;
                          id v16 = v125;
                          __int16 v146 = 2112;
                          *(void *)v147 = v112;
                          _os_log_debug_impl( &dword_1876B1000,  v90,  OS_LOG_TYPE_DEBUG,  "%@ initWithAppLayerVPNPayload: done, serverAddress %@",  v144,  0x16u);

                          char v8 = v117;
                          uint64_t v7 = v119;

                          uint64_t v15 = v121;
                          __int128 v44 = v133;
                        }

                        __int128 v14 = v14;
                        uint64_t v12 = v14;
LABEL_64:

                        goto LABEL_65;
                      }
                    }

                    goto LABEL_110;
                  }
                }
              }

              v52 = v26;
LABEL_116:
              id v16 = v125;
              goto LABEL_61;
            }

            ne_log_obj();
            uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              v95 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v150 = v95;
              __int16 v151 = 2112;
              id v152 = v133;
              id v96 = v95;
              _os_log_error_impl( &dword_1876B1000,  v49,  OS_LOG_TYPE_ERROR,  "%@ initWithAppLayerVPNPayload failed, missing %@ configuration",  buf,  0x16u);
            }

            goto LABEL_59;
          }

          ne_log_obj();
          uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = 0LL;
LABEL_59:
            id v16 = v125;
            goto LABEL_60;
          }

          v94 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v150 = v94;
          __int16 v151 = 2112;
          id v59 = v125;
          id v152 = v125;
          id v60 = v94;
          v61 = "%@ initWithAppLayerVPNPayload failed, can't create VPN for config '%@'";
        }

        else
        {
          ne_log_obj();
          uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
LABEL_46:
            uint64_t v26 = 0LL;
LABEL_60:

            v52 = v26;
LABEL_61:
            ne_log_obj();
            v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            __int128 v44 = v133;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              v54 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              id v150 = v54;
              id v55 = v16;
              id v56 = v54;
              _os_log_debug_impl( &dword_1876B1000,  v53,  OS_LOG_TYPE_DEBUG,  "%@ initWithAppLayerVPNPayload: failed",  buf,  0xCu);

              id v16 = v55;
              __int128 v44 = v133;
            }

            uint64_t v12 = 0LL;
            goto LABEL_64;
          }

          v58 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v150 = v58;
          __int16 v151 = 2112;
          id v152 = v133;
          id v59 = v16;
          id v60 = v58;
          v61 = "%@ initWithVPNPayload : VPN type '%@' not supported";
        }

        _os_log_error_impl(&dword_1876B1000, v49, OS_LOG_TYPE_ERROR, v61, buf, 0x16u);

        id v16 = v59;
        goto LABEL_46;
      }

      ne_log_obj();
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
      {
LABEL_44:
        uint64_t v12 = 0LL;
LABEL_65:

LABEL_66:
        goto LABEL_13;
      }

      v57 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v150 = v57;
      id v46 = v16;
      id v47 = v57;
      v48 = "%@ initWithAppLayerVPNPayload: VPN type missing";
    }

    else
    {
      ne_log_obj();
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      __int128 v45 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v150 = v45;
      id v46 = v16;
      id v47 = v45;
      v48 = "%@ initWithAppLayerVPNPayload: empty payload atom";
    }

    _os_log_error_impl(&dword_1876B1000, (os_log_t)v44, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);

    id v16 = v46;
    goto LABEL_44;
  }

  if ([v7 isEqualToString:@"com.apple.webcontent-filter"])
  {
    uint64_t v11 = (NEConfiguration *)-[NEConfiguration initWithContentFilterPayload:configurationName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v8,  a4);
    goto LABEL_12;
  }

  if ([v7 isEqualToString:@"com.apple.networkusagerules"])
  {
    uint64_t v11 = (NEConfiguration *)-[NEConfiguration initWithPathControllerPayload:configurationName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v8,  a4);
    goto LABEL_12;
  }

  if ([v7 isEqualToString:@"com.apple.dnsSettings.managed"])
  {
    uint64_t v11 = (NEConfiguration *)-[NEConfiguration initWithDNSSettingsPayload:configurationName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v8,  a4);
    goto LABEL_12;
  }

  if ([v7 isEqualToString:@"com.apple.relay.managed"])
  {
    uint64_t v11 = (NEConfiguration *)-[NEConfiguration initWithRelayPayload:configurationName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v8,  a4);
    goto LABEL_12;
  }

  ne_log_obj();
  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v150 = v7;
    _os_log_error_impl( &dword_1876B1000,  v50,  OS_LOG_TYPE_ERROR,  "Failed to create a NEConfiguration from profile payload with type '%@'",  buf,  0xCu);
  }

  uint64_t v12 = 0LL;
LABEL_13:

  return v12;
}

+ (NEConfiguration)configurationWithProfilePayload:(id)a3
{
  return +[NEConfiguration configurationWithProfilePayload:grade:]( &OBJC_CLASS___NEConfiguration,  "configurationWithProfilePayload:grade:",  a3,  1LL);
}

- (id)initWithIdentifier:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___NEConfiguration;
    id v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[2] = (id)1;
      objc_storeStrong(v5 + 3, a2);
    }
  }

  return a1;
}

- (BOOL)setCertificates:(id)a3 keyRefs:(id)a4 specs:(id)a5
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && (isa_nsdictionary(v8) & 1) != 0)
  {
    -[NEConfiguration VPN](self, "VPN");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      id v12 = v8;
      id v13 = v9;
      id v14 = v10;
      if (self)
      {
        -[NEConfiguration getConfigurationProtocol](self);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEConfiguration VPN](self, "VPN");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(self) = 0;
        if (v16 && v15)
        {
          v62 = v13;
          uint64_t v17 = 0LL;
          LODWORD(self) = 0;
          int v63 = 0LL;
          uint64_t v18 = 0LL;
          switch([v15 type])
          {
            case 1LL:
            case 4LL:
              goto LABEL_35;
            case 2LL:
              [v12 objectForKeyedSubscript:@"_PayloadMachineCertificateRef"];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v17 = v19;
              goto LABEL_11;
            case 3LL:
              break;
            case 5LL:
LABEL_11:
              [v12 objectForKeyedSubscript:@"_PayloadCertificateRef"];
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

              [v62 objectForKeyedSubscript:@"_PayloadCertificateRef"];
              int v63 = (void *)objc_claimAutoreleasedReturnValue();
              [v14 objectForKeyedSubscript:@"_PayloadCertificateRef"];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              ne_log_obj();
              uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v65 = (const char *)v17;
                __int16 v66 = 1024;
                LODWORD(v67) = [v17 BOOLValue];
                _os_log_debug_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_DEBUG,  "NEConfiguration setCertificatesVPN: isModernSystem %@ (%d)",  buf,  0x12u);
              }

              if (v18 && isa_nsdata(v18) && v63 && isa_nsdata(v63))
              {
                v61 = objc_alloc(&OBJC_CLASS___NEIdentityKeychainItem);
                unsigned int v60 = [v17 BOOLValue];
                uint64_t v59 = v15[10];
                LODWORD(self) = 1;
                id v58 = objc_getProperty(v15, v21, 88LL, 1);
                uint64_t v22 = -[NEKeychainItem initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:]( v61,  "initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:",  v18,  v63,  v60,  v59,  v58);
                objc_setProperty_atomic(v15, v23, v22, 96LL);
              }

              else
              {
LABEL_35:
                uint64_t v32 = v18;
                [v12 objectForKeyedSubscript:@"_PayloadCertificateRef"];
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

                LODWORD(self) = 1;
              }

              break;
            default:
              int v63 = 0LL;
              uint64_t v18 = 0LL;
              break;
          }

          ne_log_obj();
          int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v65) = (_DWORD)self;
            _os_log_debug_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_DEBUG,  "NEConfiguration setCertificatesVPN: done (OK %d)",  buf,  8u);
          }

          id v13 = v62;
        }
      }

      goto LABEL_85;
    }

    -[NEConfiguration appVPN](self, "appVPN");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      id v12 = v8;
      if (self)
      {
        -[NEConfiguration getConfigurationProtocol](self);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEConfiguration appVPN](self, "appVPN");
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(self) = 0;
        if (v27 && v26)
        {
          unint64_t v28 = [v26 type];
          uint64_t v29 = 0LL;
          LODWORD(self) = 0;
          if (v28 <= 5 && ((1LL << v28) & 0x32) != 0)
          {
            [v12 objectForKeyedSubscript:@"_PayloadCertificateRef"];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v29 = v30;
            LODWORD(self) = 1;
          }

          ne_log_obj();
          uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v65) = (_DWORD)self;
            _os_log_debug_impl( &dword_1876B1000,  v31,  OS_LOG_TYPE_DEBUG,  "NEConfiguration setCertificatesAppVPN: done (OK %d)",  buf,  8u);
          }
        }

        goto LABEL_84;
      }

- (BOOL)setCertificates:(id)a3
{
  return -[NEConfiguration setCertificates:keyRefs:specs:](self, "setCertificates:keyRefs:specs:", a3, 0LL, 0LL);
}

- (id)getCertificates
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[NEConfiguration getConfigurationProtocol](self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v4;
  if (v4)
  {
    id v7 = objc_getProperty(v4, v5, 96LL, 1);

    if (v7)
    {
      id v9 = objc_getProperty(v6, v8, 96LL, 1);
      uint64_t v10 = [v9 persistentReference];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        [v9 accessGroup];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          [v9 persistentReference];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 addObject:v13];
        }
      }
    }
  }

  return v3;
}

- (id)getPendingCertificateUUIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NEConfiguration getPendingCertificateUUIDsInternal:](self, a3);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  [v3 allKeys];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        [v3 objectForKeyedSubscript:v8];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v9 objectForKeyedSubscript:@"PayloadUUID"];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          [v9 objectForKeyedSubscript:@"PayloadUUID"];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          int v13 = isa_nsstring(v12);

          if (v13)
          {
            [v9 objectForKeyedSubscript:@"PayloadUUID"];
            id v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v3 setObject:v14 forKeyedSubscript:v8];
          }
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  return v3;
}

- (id)getPendingCertificateInfo:(id)a3
{
  return -[NEConfiguration getPendingCertificateUUIDsInternal:](self, a3);
}

- (id)getConfigurationIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 UUIDString];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)setPayloadInfoIdentity:(id)a3
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ne_log_obj();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "setPayloadInfoIdentity called for AlwaysOn, not applicable",  buf,  2u);
    }

    goto LABEL_70;
  }

  ne_log_large_obj();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEBUG, "setPayloadInfoIdentity", buf, 2u);
  }

  uint64_t v8 = v4;
  id v9 = v8;
  if (!self)
  {

    v83 = v9;
    uint64_t v6 = v83;
    goto LABEL_70;
  }

  -[NEConfiguration getConfigurationProtocol](self);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    ne_log_obj();
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v80 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v91 = v80;
      id v81 = v80;
      _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "%@ setPayloadInfoIdentityUserNameAndPassword: missing protocol info",  buf,  0xCu);
    }

    goto LABEL_22;
  }

  if (v9) {
    uint64_t v11 = (void *)v9[5];
  }
  else {
    uint64_t v11 = 0LL;
  }
  id v12 = v11;

  if (v12)
  {
    if (v9) {
      int v13 = (void *)v9[5];
    }
    else {
      int v13 = 0LL;
    }
    id v14 = v13;
    [v10 setUsername:v14];
  }

  if (v9) {
    uint64_t v15 = (void *)v9[6];
  }
  else {
    uint64_t v15 = 0LL;
  }
  id v16 = v15;

  if (v16)
  {
    if (v9) {
      __int128 v17 = (void *)v9[6];
    }
    else {
      __int128 v17 = 0LL;
    }
    __int128 v18 = v17;
    -[NEConfiguration setConfigurationVPNPassword:](self, v18);
LABEL_22:
  }

  __int128 v19 = v9;
  -[NEConfiguration getConfigurationProtocol](self);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    id v21 = (id)v19[7];
    if (v21)
    {

      goto LABEL_28;
    }

    uint64_t v22 = (void *)v19[8];
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  id v23 = v22;

  if (!v23)
  {
    ne_log_obj();
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_38;
    }
    v82 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v91 = v82;
    id v40 = v82;
    _os_log_debug_impl( &dword_1876B1000,  v39,  OS_LOG_TYPE_DEBUG,  "%@ setPayloadInfoIdentityProxy: skipped, not in payload.",  buf,  0xCu);
    goto LABEL_34;
  }

- (BOOL)setPayloadInfoCommon:(id)a3 payloadOrganization:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 v17 = 138412802;
    *(void *)&v17[4] = objc_opt_class();
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = v6;
    *(_WORD *)&v17[22] = 2112;
    id v18 = v7;
    id v16 = *(id *)&v17[4];
    _os_log_debug_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEBUG,  "%@ setPayloadInfoCommon payload UUID '%@', organization '%@'",  v17,  0x20u);
  }

  -[NEConfiguration payloadInfo](self, "payloadInfo");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NEProfileIngestionPayloadInfo),
        -[NEConfiguration setPayloadInfo:](self, "setPayloadInfo:", v10),
        v10,
        -[NEConfiguration payloadInfo](self, "payloadInfo"),
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    -[NEConfiguration payloadInfo](self, "payloadInfo", *(_OWORD *)v17, *(void *)&v17[16], v18);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setPayloadUUID:v6];

    -[NEConfiguration payloadInfo](self, "payloadInfo");
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setPayloadOrganization:v7];

    if (-[NEConfiguration grade](self, "grade") == 2) {
      -[NEConfiguration setApplicationName:](self, "setApplicationName:", v7);
    }
    BOOL v14 = 1;
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)setProfileInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_large_obj();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v23 = 138412546;
    *(void *)&v23[4] = objc_opt_class();
    *(_WORD *)&v23[12] = 2112;
    *(void *)&v23[14] = v4;
    id v22 = *(id *)&v23[4];
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@ setProfileInfo %@", v23, 0x16u);
  }

  -[NEConfiguration payloadInfo](self, "payloadInfo");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (id v7 = objc_alloc_init(&OBJC_CLASS___NEProfileIngestionPayloadInfo),
        -[NEConfiguration setPayloadInfo:](self, "setPayloadInfo:", v7),
        v7,
        -[NEConfiguration payloadInfo](self, "payloadInfo"),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", @"PayloadOrganization", *(_OWORD *)v23, *(void *)&v23[16], v24);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      [v4 objectForKeyedSubscript:@"PayloadOrganization"];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfiguration payloadInfo](self, "payloadInfo");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setProfileOrganization:v10];
    }

    [v4 objectForKeyedSubscript:@"PayloadUUID"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfiguration payloadInfo](self, "payloadInfo");
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setProfileUUID:v12];

    [v4 objectForKeyedSubscript:@"PayloadIdentifier"];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfiguration payloadInfo](self, "payloadInfo");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setProfileIdentifier:v14];

    -[NEConfiguration payloadInfo](self, "payloadInfo");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setProfileSource:1];

    [v4 objectForKeyedSubscript:@"isInstalledByMDM"];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsnumber(v17))
    {
      else {
        uint64_t v18 = 1LL;
      }
      -[NEConfiguration payloadInfo](self, "payloadInfo");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setProfileSource:v18];
    }

    BOOL v20 = 1;
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)setPerAppRuleSettings:(id)a3 withAppIdentifier:(id)a4
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = -[NEConfiguration appVPN](self, "appVPN");
  -[NEConfiguration contentFilter](self, "contentFilter");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 perApp];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEConfiguration contentFilter](self, "contentFilter");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    id v16 = v11;
    uint64_t v17 = [v11 perApp];

    goto LABEL_8;
  }

  -[NEConfiguration dnsProxy](self, "dnsProxy");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 perApp];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NEConfiguration dnsProxy](self, "dnsProxy");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  -[NEConfiguration relay](self, "relay");
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 perApp];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NEConfiguration relay](self, "relay");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  uint64_t v17 = 0LL;
LABEL_8:
  ne_log_obj();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v82 = (id)objc_opt_class();
    __int16 v83 = 2112;
    v84 = v7;
    id v31 = v82;
    _os_log_debug_impl(&dword_1876B1000, v18, OS_LOG_TYPE_DEBUG, "%@ setPerAppRuleSettings: appID %@", buf, 0x16u);
  }

  if (!(v8 | v17))
  {
    ne_log_obj();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      BOOL v22 = 0;
      goto LABEL_68;
    }

    v50 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v82 = v50;
    uint64_t v19 = v50;
    _os_log_error_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_ERROR,  "%@ setPerAppRuleSettings: perApp not initialized",  buf,  0xCu);
LABEL_55:

    goto LABEL_16;
  }

  if (!v6 || !v7)
  {
    ne_log_large_obj();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v53 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v82 = v53;
      __int16 v83 = 2112;
      v84 = v7;
      __int16 v85 = 2112;
      id v86 = v6;
      id v54 = v53;
      _os_log_debug_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_DEBUG,  "%@ setPerAppRuleSettings: skip rule setting for empty ID or rules %@, %@",  buf,  0x20u);
    }

    BOOL v22 = 1;
    goto LABEL_68;
  }

  uint64_t v19 = -[NEAppRule initWithSigningIdentifier:](objc_alloc(&OBJC_CLASS___NEAppRule), "initWithSigningIdentifier:", v7);
  if (v8) {
    BOOL v20 = (void *)v8;
  }
  else {
    BOOL v20 = (void *)v17;
  }
  -[NEAppRule setNoRestriction:](v19, "setNoRestriction:", [v20 noRestriction]);
  [v6 objectForKeyedSubscript:@"AccountIdentifierMatch"];
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = v23;
  if (v23)
  {
    if (!isa_nsarray(v23))
    {
      ne_log_obj();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v58 = (void *)objc_opt_class();
        id v71 = v58;
        [v6 objectForKeyedSubscript:@"AccountIdentifierMatch"];
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
        id v60 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v82 = v58;
        __int16 v83 = 2112;
        v84 = @"AccountIdentifierMatch";
        __int16 v85 = 2112;
        id v86 = v60;
        id v61 = v60;
        _os_log_error_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_ERROR,  "%@ setPerAppRuleSettings: failed to set %@, unsupported type %@",  buf,  0x20u);
      }

      BOOL v22 = 0;
      id v21 = v24;
      goto LABEL_68;
    }

    -[NEAppRule setMatchAccountIdentifiers:](v19, "setMatchAccountIdentifiers:", v24);
  }

  [v6 objectForKeyedSubscript:@"DNSDomainMatch"];
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (isa_nsarray(v21))
    {
      -[NEAppRule setMatchDomains:](v19, "setMatchDomains:", v21);
      goto LABEL_27;
    }

    ne_log_obj();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v62 = (void *)objc_opt_class();
      id v69 = v62;
      [v6 objectForKeyedSubscript:@"DNSDomainMatch"];
      int v63 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v64 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v82 = v62;
      __int16 v83 = 2112;
      v84 = @"DNSDomainMatch";
      __int16 v85 = 2112;
      id v86 = v64;
      id v65 = v64;
      _os_log_error_impl( &dword_1876B1000,  v32,  OS_LOG_TYPE_ERROR,  "%@ setPerAppRuleSettings: failed to set %@, unsupported type %@",  buf,  0x20u);
    }

    goto LABEL_55;
  }

- (BOOL)setPerAppUUID:(id)a3 andSafariDomains:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[NEConfiguration(NEProfileIngestionMethods) setPerAppUUID:andSafariDomains:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEBUG, "%s: perAppUUID %@", buf, 0x16u);
  }

  if (v6)
  {
    id v9 = (void *)[objc_alloc(NSString) initWithString:v6];
    -[NEConfiguration setExternalIdentifier:](self, "setExternalIdentifier:", v9);
  }

  if ([v7 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v10 setObject:v7 forKeyedSubscript:@"DNSDomainMatch"];
    if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v10,  @"com.apple.mobilesafari"))
    {
      id v16 = @"DNSDomainMatch";
      id v17 = v7;
      BOOL v11 = 1;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = -[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v12,  @"com.apple.webapp");

      if (v13)
      {
LABEL_13:

        goto LABEL_14;
      }

      ne_log_obj();
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
LABEL_16:
        _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "setPerAppUUID could not add Safari perApp rules",  buf,  2u);
      }
    }

    else
    {
      ne_log_obj();
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        goto LABEL_16;
      }
    }

    BOOL v11 = 0;
    goto LABEL_13;
  }

  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)setAppLayerVPNUUID:(id)a3 andSafariDomains:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    id v12 = "-[NEConfiguration(NEProfileIngestionMethods) setAppLayerVPNUUID:andSafariDomains:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEBUG, "%s: vpnUUID %@", (uint8_t *)&v11, 0x16u);
  }

  BOOL v9 = -[NEConfiguration setPerAppUUID:andSafariDomains:](self, "setPerAppUUID:andSafariDomains:", v6, v7);
  return v9;
}

- (BOOL)setSMBDomains:(id)a3
{
  v12[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 count])
  {
    v11[0] = @"DNSDomainMatch";
    v11[1] = @"Path";
    v12[0] = v4;
    v12[1] = @"/System/Library/PrivateFrameworks/SMBClientProvider.framework/smbclientd";
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = -[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v5,  @"com.apple.smbclientd");
    if (!v6)
    {
      ne_log_obj();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to add an app rule for SMB domains (%@)",  (uint8_t *)&v9,  0xCu);
      }
    }
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)setMailDomains:(id)a3
{
  return -[NEConfiguration setMailDomains:accountIdentifiers:](self, "setMailDomains:accountIdentifiers:", a3, 0LL);
}

- (BOOL)setMailDomains:(id)a3 accountIdentifiers:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if ([v6 count] || objc_msgSend(v7, "count"))
    {
      id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v8 setObject:@"identifier com.apple.mail and anchor apple" forKeyedSubscript:@"DesignatedRequirement"];
      if ([v6 count]) {
        [v8 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
      }
      if ([v7 count]) {
        [v8 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
      }
      if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v8,  @"com.apple.mobilemail"))
      {
        [v8 setObject:@"/System/Library/PrivateFrameworks/EmailDaemon.framework/maild" forKeyedSubscript:@"Path"];
        if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v8,  @"com.apple.email.maild"))
        {
          [v8 setObject:@"/System/Library/PrivateFrameworks/ExchangeSync.framework/Support/exchangesyncd" forKeyedSubscript:@"Path"];
          if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v8,  @"com.apple.datausage.dataaccess.activesync"))
          {
            [v8 removeObjectForKey:@"Path"];
            if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v8,  @"com.apple.mobilenotes"))
            {
              BOOL v9 = 1;
LABEL_26:

              goto LABEL_27;
            }

            ne_log_obj();
            id v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
            {
LABEL_25:

              BOOL v9 = 0;
              goto LABEL_26;
            }

            int v15 = 138412290;
            id v16 = @"com.apple.mobilenotes";
            int v11 = "Failed to add an app rule for %@";
            id v12 = (os_log_s *)v10;
            uint32_t v13 = 12;
LABEL_23:
            _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
            goto LABEL_25;
          }

          ne_log_obj();
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          LOWORD(v15) = 0;
          int v11 = "Failed to add an app rule for exchangesyncd";
        }

        else
        {
          ne_log_obj();
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          LOWORD(v15) = 0;
          int v11 = "Failed to add an app rule for maild";
        }
      }

      else
      {
        ne_log_obj();
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        LOWORD(v15) = 0;
        int v11 = "Failed to add an app rule for Mail";
      }

      id v12 = (os_log_s *)v10;
      uint32_t v13 = 2;
      goto LABEL_23;
    }

    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = 0;
  }

- (BOOL)setCalendarDomains:(id)a3
{
  return -[NEConfiguration setCalendarDomains:accountIdentifiers:]( self,  "setCalendarDomains:accountIdentifiers:",  a3,  0LL);
}

- (BOOL)setCalendarDomains:(id)a3 accountIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if ([v6 count] || objc_msgSend(v7, "count"))
    {
      id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
      if ([v6 count]) {
        [v8 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
      }
      if ([v7 count]) {
        [v8 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
      }
      if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v8,  @"com.apple.mobilecal"))
      {
        if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v8,  @"com.apple.reminders"))
        {
          id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
          [v9 setObject:@"/System/Library/PrivateFrameworks/DataAccess.framework/Support/dataaccessd" forKeyedSubscript:@"Path"];
          if ([v6 count]) {
            [v9 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
          }
          if ([v7 count]) {
            [v9 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
          }
          if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v9,  @"com.apple.dataaccessd"))
          {
            BOOL v10 = 1;
LABEL_28:

            goto LABEL_29;
          }

          ne_log_obj();
          uint32_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)int v15 = 0;
            _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to add an app rule for dataaccessd",  v15,  2u);
          }

LABEL_27:
          BOOL v10 = 0;
          goto LABEL_28;
        }

        ne_log_obj();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        int v11 = "Failed to add an app rule for Reminders";
        id v12 = buf;
      }

      else
      {
        ne_log_obj();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        __int16 v17 = 0;
        int v11 = "Failed to add an app rule for Calendar";
        id v12 = (uint8_t *)&v17;
      }

      _os_log_error_impl(&dword_1876B1000, (os_log_t)v9, OS_LOG_TYPE_ERROR, v11, v12, 2u);
      goto LABEL_27;
    }

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

- (BOOL)setContactsDomains:(id)a3
{
  return -[NEConfiguration setContactsDomains:accountIdentifiers:]( self,  "setContactsDomains:accountIdentifiers:",  a3,  0LL);
}

- (BOOL)setContactsDomains:(id)a3 accountIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if (![v6 count] && !objc_msgSend(v7, "count"))
    {
      BOOL v10 = 1;
      goto LABEL_24;
    }

    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v8 setObject:@"identifier com.apple.AddressBook and anchor apple" forKeyedSubscript:@"DesignatedRequirement"];
    if ([v6 count]) {
      [v8 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
    }
    if ([v7 count]) {
      [v8 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
    }
    if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v8,  @"com.apple.MobileAddressBook"))
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v9 setObject:@"/System/Library/PrivateFrameworks/DataAccess.framework/Support/dataaccessd" forKeyedSubscript:@"Path"];
      if ([v6 count]) {
        [v9 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
      }
      if ([v7 count]) {
        [v9 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
      }
      if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v9,  @"com.apple.dataaccessd"))
      {
        BOOL v10 = 1;
LABEL_23:

        goto LABEL_24;
      }

      ne_log_obj();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint32_t v13 = 0;
        _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to add an app rule for dataaccessd",  v13,  2u);
      }
    }

    else
    {
      ne_log_obj();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  (os_log_t)v9,  OS_LOG_TYPE_ERROR,  "Failed to add an app rule for Contacts",  buf,  2u);
      }
    }

    BOOL v10 = 0;
    goto LABEL_23;
  }

  BOOL v10 = 0;
LABEL_24:

  return v10;
}

- (BOOL)setRestrictDomains:(BOOL)a3
{
  BOOL v3 = a3;
  -[NEConfiguration appVPN](self, "appVPN");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEConfiguration appVPN](self, "appVPN");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setRestrictDomains:v3];
LABEL_8:

    return 1;
  }

  -[NEConfiguration relay](self, "relay");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v3)
    {
      -[NEConfiguration relay](self, "relay");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 perApp];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        BOOL v10 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
        -[NEConfiguration relay](self, "relay");
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 setPerApp:v10];
      }
    }

    -[NEConfiguration relay](self, "relay");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 perApp];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setRestrictDomains:v3];

    goto LABEL_8;
  }

  ne_log_obj();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v15 = 0;
    _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "Cannot restrict domains, configuration is not a per-app VPN or relay configuration",  v15,  2u);
  }

  return 0;
}

- (BOOL)setExcludedDomains:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    -[NEConfiguration appVPN](self, "appVPN");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NEConfiguration appVPN](self, "appVPN");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setExcludedDomains:v4];

      goto LABEL_5;
    }

    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Cannot set excluded domains on a non-per-app VPN configuration",  v10,  2u);
    }

LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }

- (BOOL)setAssociatedDomains:(id)a3
{
  id v4 = a3;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v4))
  {
    if ([v4 count])
    {
      id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v5 setObject:@"identifier com.apple.swcd and anchor apple" forKeyedSubscript:@"DesignatedRequirement"];
      [v5 setObject:@"/usr/libexec/swcd" forKeyedSubscript:@"Path"];
      [v5 setObject:v4 forKeyedSubscript:@"DNSDomainMatch"];
      BOOL v6 = -[NEConfiguration setPerAppRuleSettings:withAppIdentifier:]( self,  "setPerAppRuleSettings:withAppIdentifier:",  v5,  @"com.apple.swcd");
      if (!v6)
      {
        ne_log_obj();
        BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v9 = 0;
          _os_log_error_impl(&dword_1876B1000, v7, OS_LOG_TYPE_ERROR, "Failed to add an app rule for swcd", v9, 2u);
        }
      }
    }

    else
    {
      BOOL v6 = 1;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)validateStrings:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!isa_nsstring(*(void **)(*((void *)&v12 + 1) + 8 * v9)))
          {
            uint64_t v10 = 0LL;
            goto LABEL_12;
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v10 = 1LL;
LABEL_12:
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)mergeArray:(void *)a3 withArray:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)[a2 mutableCopy];
    if ([v6 count])
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            if ((objc_msgSend(v6, "containsObject:", v12, (void)v15) & 1) == 0) {
              [v6 addObject:v12];
            }
          }

          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }

        while (v9);
      }

      id v13 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithArray:v6];
    }

    else
    {
      id v13 = v5;
    }

    a1 = v13;
  }

  return a1;
}

- (BOOL)setConfigurationVPNPassword:(void *)a1
{
  id v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    [v4 passwordKeychainItem];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      uint64_t v8 = v5[10];
      uint64_t v9 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      id v11 = objc_getProperty(v5, v10, 88LL, 1);
      uint64_t v12 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v9,  "initWithPassword:domain:accessGroup:",  v3,  v8,  v11);
      [v5 setPasswordKeychainItem:v12];

      goto LABEL_8;
    }

    [v5 passwordKeychainItem];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setPassword:v3];
  }

  else
  {
    ne_log_obj();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 v14 = 0;
      _os_log_error_impl( &dword_1876B1000,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "setConfigurationVPNPassword failed: VPN not allocated",  v14,  2u);
    }
  }

LABEL_8:
  return v5 != 0LL;
}

- (id)getConfigurationProtocol
{
  id v1 = a1;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return v1;
  }
  [a1 VPN];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 protocol];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    [v1 VPN];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    id v7 = v4;
    [v4 protocol];
    id v1 = (id)objc_claimAutoreleasedReturnValue();

    return v1;
  }

  [v1 appVPN];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 protocol];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v1 appVPN];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  ne_log_obj();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = (id)objc_opt_class();
    id v10 = v12;
    _os_log_debug_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEBUG,  "%@ getConfigurationProtocol: protocol info to be initialized",  (uint8_t *)&v11,  0xCu);
  }

  return 0LL;
}

- (id)getPendingCertificateUUIDsInternal:(void *)a1
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    [a1 VPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      id v7 = v5;
      -[NEConfiguration getConfigurationProtocol](a1);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 VPN];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      a1 = 0LL;
      if (!v9 || !v8) {
        goto LABEL_61;
      }
      switch([v8 type])
      {
        case 1LL:
        case 4LL:
          if ([v8 authenticationMethod] == 1) {
            goto LABEL_36;
          }
          goto LABEL_48;
        case 2LL:
          uint64_t v27 = [v8 machineAuthenticationMethod];
          if (v27 == 2)
          {
            [v8 machineIdentityReference];
            a1 = (void *)objc_claimAutoreleasedReturnValue();
            if (!a1)
            {
              BOOL v14 = 1;
              goto LABEL_56;
            }

            if ([v8 authenticationMethod] != 3)
            {
LABEL_44:
              BOOL v14 = 0;
              goto LABEL_56;
            }
          }

          else if ([v8 authenticationMethod] != 3)
          {
LABEL_48:
            BOOL v14 = 0;
            goto LABEL_57;
          }

          [v8 identityReferenceInternal];
          id v30 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v14 = v30 == 0LL;

          if (v27 != 2) {
            goto LABEL_57;
          }
LABEL_56:

LABEL_57:
          ne_log_obj();
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_58;
          }
          [v7 pendingCertificates];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v38) = 67109378;
          HIDWORD(v38) = v14;
          LOWORD(v39) = 2112;
          *(void *)((char *)&v39 + 2) = v34;
          uint64_t v35 = "NEConfiguration getPendingCertificateUUIDsVPN: pending %d, cert UUIDs %@";
          break;
        case 3LL:
          if ([v8 authenticationMethod] != 3) {
            goto LABEL_48;
          }
LABEL_36:
          [v8 identityReferenceInternal];
          a1 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v14 = a1 == 0LL;
          goto LABEL_56;
        case 5LL:
          [v7 pendingCertificates];
          a1 = (void *)objc_claimAutoreleasedReturnValue();
          if (!a1) {
            goto LABEL_44;
          }
          [v8 identityReferenceInternal];
          unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v14 = v28 == 0LL;

          goto LABEL_56;
        default:
          goto LABEL_48;
      }

      goto LABEL_65;
    }

    [a1 appVPN];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      id v7 = v5;
      -[NEConfiguration getConfigurationProtocol](a1);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 appVPN];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();

      a1 = 0LL;
      if (!v11 || !v8) {
        goto LABEL_61;
      }
      uint64_t v12 = [v8 type];
      switch(v12)
      {
        case 1LL:
          goto LABEL_14;
        case 5LL:
          [v7 pendingCertificates];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            [v8 identityReferenceInternal];
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v14 = v29 == 0LL;
          }

          else
          {
            BOOL v14 = 0;
          }

          goto LABEL_52;
        case 4LL:
LABEL_14:
          if ([v8 authenticationMethod] == 1)
          {
            [v8 identityReferenceInternal];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v14 = v13 == 0LL;
LABEL_52:

            goto LABEL_53;
          }

          break;
      }

      BOOL v14 = 0;
LABEL_53:
      ne_log_obj();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_58;
      }
      [v7 pendingCertificates];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = 67109378;
      HIDWORD(v38) = v14;
      LOWORD(v39) = 2112;
      *(void *)((char *)&v39 + 2) = v34;
      uint64_t v35 = "NEConfiguration getPendingCertificateUUIDsAppVPN: pending %d, cert UUIDs %@";
LABEL_65:
      _os_log_debug_impl(&dword_1876B1000, v33, OS_LOG_TYPE_DEBUG, v35, (uint8_t *)&v38, 0x12u);

LABEL_58:
      if (v14)
      {
LABEL_59:
        objc_msgSend(v7, "pendingCertificates", v38, v39, v40);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }

      goto LABEL_60;
    }

    [a1 alwaysOnVPN];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      [a1 contentFilter];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        [a1 dnsSettings];
        id v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          uint64_t v32 = -[NEConfiguration getPendingCertificateUUIDsDNSSettings:](a1, v5);
        }

        else
        {
          [a1 relay];
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v37)
          {
            a1 = 0LL;
            goto LABEL_62;
          }

          uint64_t v32 = -[NEConfiguration getPendingCertificateUUIDsRelay:](a1, v5);
        }

        a1 = (void *)v32;
LABEL_62:

        goto LABEL_63;
      }

      id v7 = v5;
      [a1 contentFilter];
      int v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = v26;
      if (v26)
      {
        [v26 provider];
        a1 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a1) {
          goto LABEL_61;
        }
        goto LABEL_59;
      }

- (id)getPendingCertificateUUIDsDNSSettings:(void *)a1
{
  id v3 = a2;
  [a1 dnsSettings];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 settings];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v3 pendingCertificates];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)getPendingCertificateUUIDsRelay:(void *)a1
{
  id v3 = a2;
  [a1 relay];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v3 pendingCertificates];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (uint64_t)setCertificateContentFilter:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [a1 contentFilter];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 provider];

      if (v6)
      {
        if (isa_nsdata(v3))
        {
          [v5 provider];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 setIdentityReference:v3];
        }

        ne_log_obj();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v10 = 0;
          _os_log_debug_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEBUG,  "NEConfiguration setCertificateContentFilter: done",  v10,  2u);
        }

        uint64_t v6 = 1LL;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (uint64_t)setCertificateDNSSettings:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [a1 dnsSettings];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 settings];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && isa_nsdata(v3) && ([v5 dnsProtocol] & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [v5 setIdentityReference:v3];
      ne_log_obj();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "NEConfiguration setCertificateDNSSettings: done",  v9,  2u);
      }

      uint64_t v7 = 1LL;
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (uint64_t)setCertificatesRelay:(void *)a3 keyRefs:(void *)a4 specs:
{
  id v7 = a2;
  id v33 = a3;
  id v32 = a4;
  if (!a1) {
    goto LABEL_27;
  }
  uint64_t v8 = [a1 relay];
  if (!v8) {
    goto LABEL_28;
  }
  [a1 relay];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 relays];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];

  if (!v11)
  {
LABEL_27:
    uint64_t v8 = 0LL;
    goto LABEL_28;
  }

  [a1 relay];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 relays];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v14 = [v13 count];

  uint64_t v31 = v14;
  if (v14)
  {
    uint64_t v15 = 0LL;
    id v30 = a1;
    do
    {
      [a1 relay];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 relays];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 objectAtIndexedSubscript:v15];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18) {
        break;
      }
      [NSString stringWithFormat:@"%@%u", @"_PayloadCertificateRef", v15];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:v19];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 objectForKeyedSubscript:v19];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v32 objectForKeyedSubscript:v19];
      uint64_t v36 = v21;
      __int128 v37 = v19;
      uint64_t v35 = (void *)v22;
      if (v21 && (uint64_t v23 = v22, isa_nsdata(v21)))
      {
        if (!v23)
        {
          ne_log_obj();
          unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_ERROR,  "NEConfiguration setCertificatesRelay: Key not in system keychain",  buf,  2u);
          }

          goto LABEL_27;
        }

        [v18 setIdentityWithKey:v20 keyRef:v21];
      }

      else if (isa_nsdata(v20))
      {
        [v18 setIdentityReference:v20];
      }

      uint64_t v34 = v18;
      uint64_t v24 = 0LL;
      id v25 = 0LL;
      while (1)
      {
        [NSString stringWithFormat:@"%@%u-%u", @"_PayloadCertificateRef", v15, v24];
        int v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 objectForKeyedSubscript:v26];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25) {
          id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
        }
        [v25 addObject:v27];

        uint64_t v24 = (v24 + 1);
        if ((_DWORD)v24 == 4) {
          goto LABEL_20;
        }
      }

LABEL_20:
      if (v25) {
        [v34 setCertificateReferences:v25];
      }

      ++v15;
      a1 = v30;
    }

    while (v15 != v31);
  }

  uint64_t v8 = 1LL;
LABEL_28:

  return v8;
}

- (uint64_t)configurePluginWithPayload:(void *)a3 pluginType:(void *)a4 payloadType:(void *)a5 vpnType:
{
  uint64_t v107 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = a4;
  id v12 = a5;
  [v9 payloadAtom];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:@"VPN"];
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if ([v12 isEqualToString:@"TransparentProxy"])
    {
      [v13 objectForKeyedSubscript:@"TransparentProxy"];
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unsigned int v14 = 0LL;
    }
  }

  ne_log_large_obj();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v104 = v11;
    _os_log_debug_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_DEBUG,  "configurePluginWithPayload: start with type %@",  buf,  0xCu);
  }

  if (!v14)
  {
    ne_log_obj();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v25 = "configurePluginWithPayload: plugin info missing";
      int v26 = v24;
      uint32_t v27 = 2;
LABEL_76:
      _os_log_error_impl(&dword_1876B1000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
      goto LABEL_77;
    }

    goto LABEL_77;
  }

  if (!v10)
  {
    ne_log_obj();
    unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_ERROR,  "configurePluginWithPayload: pluginType missing",  buf,  2u);
    }

    id v10 = 0LL;
    goto LABEL_78;
  }

  if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"com.apple.vpn.managed"))
  {
    [v9 pluginUpgradeInfo];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      [v9 pluginUpgradeInfo];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v17 objectForKeyedSubscript:@"PluginType"];

      id v10 = (id)v18;
    }

    [a1 VPN];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 protocol];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20) {
      goto LABEL_36;
    }
    if (([v12 isEqualToString:@"TransparentProxy"] & 1) != 0
      || ([a1 VPN],
          id v21 = (void *)objc_claimAutoreleasedReturnValue(),
          uint64_t v22 = [v21 tunnelType],
          v21,
          v22 == 2))
    {
      uint64_t v23 = &OBJC_CLASS___NETransparentProxyProviderProtocol;
    }

    else
    {
      uint64_t v23 = &OBJC_CLASS___NETunnelProviderProtocol;
    }

    id v46 = (void *)[[v23 alloc] initWithPluginType:v10];
    [a1 VPN];
    id v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 setProtocol:v46];

    [a1 VPN];
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 protocol];
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
LABEL_36:
      [a1 VPN];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 protocol];
      char v45 = (void *)objc_claimAutoreleasedReturnValue();

      [v45 setServerAddress:&stru_18A0915E8];
      goto LABEL_37;
    }

    ne_log_obj();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    *(_DWORD *)buf = 138412290;
    int v104 = @"com.apple.vpn.managed";
    id v25 = "configurePluginWithPayload: failed to allocate for %@ protocol";
    goto LABEL_75;
  }

  if (!-[__CFString isEqualToString:](v11, "isEqualToString:", @"com.apple.vpn.managed.applayer"))
  {
    ne_log_obj();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v104 = v11;
      id v25 = "configurePluginWithPayload: unsupported payload type %@";
LABEL_75:
      int v26 = v24;
      uint32_t v27 = 12;
      goto LABEL_76;
    }

- (BOOL)ingestDisconnectOptions:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 v16 = 138412290;
    *(void *)&v16[4] = objc_opt_class();
    id v13 = *(id *)&v16[4];
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@ ingestDisconnectOptions start", v16, 0xCu);
  }

  if (v4)
  {
    [v3 objectForKeyedSubscript:@"DisconnectOnIdle"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", @"DisconnectOnIdleTimer", *(_OWORD *)v16);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 objectForKeyedSubscript:@"DisconnectOnSleep"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 objectForKeyedSubscript:@"DisconnectOnWake"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 objectForKeyedSubscript:@"DisconnectOnWakeTimer"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    ne_log_obj();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = (void *)objc_opt_class();
      *(_DWORD *)__int128 v16 = 138412290;
      *(void *)&v16[4] = v14;
      id v15 = v14;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "%@ ingestDisconnectOptions failed: protocol not allocated",  v16,  0xCu);
    }

    id v10 = 0LL;
  }

  return v4 != 0LL;
}

- (uint64_t)ingestDNSOptions:(void *)a1
{
  id v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"DNS"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!isa_nsdictionary(v5))
    {
      uint64_t v7 = 0LL;
      goto LABEL_7;
    }

    if ([v5 count])
    {
      id v6 = -[NEDNSSettings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEDNSSettings),  "initFromLegacyDictionary:",  v5);
      [v4 setDNSSettings:v6];
    }
  }

  uint64_t v7 = 1LL;
LABEL_7:

  return v7;
}

- (uint64_t)configurePPPWithVPNOptions:(void *)a3 payloadBase:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [a2 objectForKeyedSubscript:@"VPN"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration getConfigurationProtocol](a1);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v21) = 0;
    _os_log_debug_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEBUG, "configurePPPWithVPNOptions", (uint8_t *)&v21, 2u);
  }

  [a1 appVPN];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    [a1 VPN];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12) {
      BOOL v13 = v7 == 0LL;
    }
    else {
      BOOL v13 = 1;
    }
    uint64_t v11 = !v13;

    if ((v11 & 1) != 0)
    {
      if (v6)
      {
        if ((isa_nsdictionary(v6) & 1) != 0)
        {
          [v6 objectForKeyedSubscript:@"AuthenticationMethod"];
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 objectForKeyedSubscript:@"AuthPassword"];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();

          [v7 identityReferenceInternal];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15) {
            goto LABEL_5;
          }
          [v6 objectForKeyedSubscript:@"LocalCertificate"];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            [v6 objectForKeyedSubscript:@"LocalCertificate"];
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            setLocalCertificate(v17);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v7 setIdentityReferenceInternal:v18];
          }

          else
          {
            [v6 objectForKeyedSubscript:@"PayloadCertificateUUID"];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20) {
              goto LABEL_5;
            }
            [v6 objectForKeyedSubscript:@"PayloadCertificateUUID"];
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 addCertificatePending:v17 certificateTag:@"_PayloadCertificateRef"];
          }

- (uint64_t)ingestProxyOptions:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = (id)objc_opt_class();
      id v8 = v18;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@ ingestProxyOptions: missing protocol info",  (uint8_t *)&v17,  0xCu);
    }

    goto LABEL_14;
  }

  [v3 objectForKeyedSubscript:@"Proxies"];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    id v18 = (id)objc_opt_class();
    id v12 = v18;
    _os_log_debug_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEBUG, "%@ ingestProxyOptions", (uint8_t *)&v17, 0xCu);
  }

  if (!v5)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NEProxySettings);
    [v4 setProxySettings:v5];
    goto LABEL_10;
  }

  if (!isa_nsdictionary(v5))
  {
    ne_log_obj();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = (void *)objc_opt_class();
      id v14 = v13;
      id v15 = (void *)objc_opt_class();
      int v17 = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      id v16 = v15;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "%@ ingestProxyOptions: unsupported proxy data type %@",  (uint8_t *)&v17,  0x16u);
    }

LABEL_14:
    uint64_t v9 = 0LL;
    goto LABEL_15;
  }

  id v7 = -[NEProxySettings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEProxySettings),  "initFromLegacyDictionary:",  v5);
  [v4 setProxySettings:v7];

LABEL_10:
  uint64_t v9 = 1LL;
LABEL_15:

  return v9;
}

- (uint64_t)configureIKE:(void *)a3 vpnType:(void *)a4 payloadBase:(void *)a5 vpn:
{
  uint64_t v172 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  ne_log_large_obj();
  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v18 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v168 = v18;
    _os_log_debug_impl(&dword_1876B1000, v13, OS_LOG_TYPE_DEBUG, "%@ configureIKE", buf, 0xCu);
  }

  if (!v12)
  {
    ne_log_obj();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v16, OS_LOG_TYPE_ERROR, "configureIKE: protocol not initialized", buf, 2u);
    }

    goto LABEL_195;
  }

  [v12 protocol];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if ([v10 isEqualToString:@"IPSec"])
    {
      id v15 = &OBJC_CLASS___NEVPNProtocolIPSec;
    }

    else
    {
      if (![v10 isEqualToString:@"L2TP"])
      {
        [v11 payloadAtom];
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        [v17 objectForKeyedSubscript:@"VPNSubType"];
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = isa_nsstring(v19);

        if (v20)
        {
          uint64_t v21 = objc_alloc(&OBJC_CLASS___NEVPNProtocolIKEv2);
          [v17 objectForKeyedSubscript:@"VPNSubType"];
          uint64_t v22 = (NEVPNProtocolIKEv2 *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = -[NEVPNProtocolIKEv2 initWithPluginType:](v21, v22);
          [v12 setProtocol:v23];
        }

        else
        {
          uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NEVPNProtocolIKEv2);
          [v12 setProtocol:v22];
        }

        goto LABEL_16;
      }

      id v15 = &OBJC_CLASS___NEVPNProtocolL2TP;
    }

    id v17 = objc_alloc_init(v15);
    [v12 setProtocol:v17];
LABEL_16:
  }

  v157 = a1;
  uint64_t v24 = [v12 protocol];
  if (!v24)
  {
    ne_log_obj();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_195;
    }
    uint32_t v27 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v168 = v27;
    unint64_t v28 = v27;
    _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%@ configureIKE failed to locate protocol for ipsec",  buf,  0xCu);
    goto LABEL_111;
  }

  id v16 = (os_log_s *)v24;
  [v12 protocol];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v25 type];

  if (v26 == 5)
  {
    [v12 protocol];
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = 0LL;
LABEL_26:
    v160 = 0LL;
    goto LABEL_27;
  }

  if (v26 == 2)
  {
    [v12 protocol];
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = 0LL;
    goto LABEL_26;
  }

  if (v26 != 1)
  {
    ne_log_obj();
    unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int128 v142 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v168 = v142;
      id v143 = v142;
      _os_log_error_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_ERROR,  "%@ configureIKE failed to find protocol object for ipsec",  buf,  0xCu);
    }

- (BOOL)configureVpnOnDemandRules:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [a1 VPN];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [a1 VPN];
  }
  else {
    [a1 appVPN];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  ne_log_large_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v21 = 138412290;
    *(void *)&v21[4] = objc_opt_class();
    id v18 = *(id *)&v21[4];
    _os_log_debug_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEBUG, "%@ configureVpnOnDemandRules: start", v21, 0xCu);
  }

  if (v5)
  {
    [v5 onDemandRules];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = (void *)objc_opt_class();
        *(_DWORD *)uint64_t v21 = 138412290;
        *(void *)&v21[4] = v9;
        id v10 = v9;
        id v11 = "%@ configureVpnOnDemandRules: VPN OnDemand rules already ingested. Skip current dictionary.";
LABEL_12:
        _os_log_error_impl(&dword_1876B1000, v8, OS_LOG_TYPE_ERROR, v11, v21, 0xCu);
      }
    }

    else
    {
      +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)&OBJC_CLASS___NEOnDemandRule, v3);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setOnDemandRules:v13];

      [v3 objectForKeyedSubscript:@"OnDemandEnabled"];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", @"DisconnectOnDemandEnabled", *(_OWORD *)v21);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      [v3 objectForKeyedSubscript:@"OnDemandUserOverrideDisabled"];
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      ne_log_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = (void *)objc_opt_class();
        *(_DWORD *)uint64_t v21 = 138412546;
        *(void *)&v21[4] = v19;
        *(_WORD *)&v21[12] = 2112;
        *(void *)&v21[14] = v5;
        id v20 = v19;
        _os_log_debug_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEBUG,  "%@ configureVpnOnDemandRules done: onDemand rules %@",  v21,  0x16u);
      }
    }
  }

  else
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = (void *)objc_opt_class();
      *(_DWORD *)uint64_t v21 = 138412290;
      *(void *)&v21[4] = v12;
      id v10 = v12;
      id v11 = "%@ configureVpnOnDemandRules failed: VPN not initialized";
      goto LABEL_12;
    }
  }

  return v5 != 0LL;
}

- (BOOL)configureVpnOnDemand:(void *)a3 vpnType:
{
  id v5 = a2;
  id v6 = a3;
  [v5 objectForKeyedSubscript:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqualToString:@"L2TP"])
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"PPP"];

    id v7 = (void *)v8;
  }

  if (!v7 || !-[NEConfiguration configureVpnOnDemandRules:](a1, v7)) {
    goto LABEL_8;
  }

  if (![v6 isEqualToString:@"L2TP"])
  {
    id v7 = 0LL;
LABEL_10:
    BOOL v9 = -[NEConfiguration configureVpnOnDemandRules:](a1, v5);
    goto LABEL_11;
  }

  [v5 objectForKeyedSubscript:@"IPSec"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || -[NEConfiguration configureVpnOnDemandRules:](a1, v7)) {
    goto LABEL_10;
  }
LABEL_8:
  BOOL v9 = 0LL;
LABEL_11:

  return v9;
}

- (uint64_t)ingestIPSecDict:(void *)a3 vpnType:(void *)a4 vpn:
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  uint64_t v8 = a3;
  id v9 = a4;
  [v7 payloadAtom];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", @"IKEv2");
  id v12 = @"IPSec";
  if (v11) {
    id v12 = @"IKEv2";
  }
  BOOL v13 = v12;
  [v10 objectForKeyedSubscript:v13];
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v58 = (id)objc_opt_class();
    __int16 v59 = 2112;
    id v60 = v8;
    id v35 = v58;
    _os_log_debug_impl(&dword_1876B1000, v15, OS_LOG_TYPE_DEBUG, "%@ ingestIPSecDict for type %@", buf, 0x16u);
  }

  if (!v14)
  {
    char v16 = -[__CFString isEqualToString:](v8, "isEqualToString:", @"L2TP");
    ne_log_obj();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((v16 & 1) == 0)
    {
      if (v17)
      {
        uint64_t v43 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v58 = v43;
        __int16 v59 = 2112;
        id v60 = v13;
        id v44 = v43;
        _os_log_error_impl(&dword_1876B1000, v14, OS_LOG_TYPE_ERROR, "%@ ingestIPSecDict: empty %@ dict", buf, 0x16u);
      }

      goto LABEL_31;
    }

    if (v17)
    {
      uint64_t v41 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v41;
      id v42 = v41;
      _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "%@ ingestIPSecDict: empty IPSec dict for L2TP. Apply defaults.",  buf,  0xCu);
    }

    id v14 = (os_log_s *)MEMORY[0x189604A60];
  }

  uint64_t v18 = [objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v14];
  if (!v18)
  {
    ne_log_obj();
    unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v29;
      id v30 = v29;
      _os_log_impl(&dword_1876B1000, v28, OS_LOG_TYPE_INFO, "%@ ingestIPSecDict: can't alloc dictionary", buf, 0xCu);
    }

LABEL_31:
    uint64_t v33 = 0LL;
    goto LABEL_46;
  }

  __int16 v19 = (void *)v18;
  uint64_t v56 = v9;
  uint64_t v20 = [v10 objectForKeyedSubscript:@"_certificateData"];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    uint64_t v22 = v13;
    uint64_t v23 = a1;
    [v10 objectForKeyedSubscript:@"_certificatePassphrase"];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      +[NEIdentityKeychainItem importPKCS12Data:passphrase:]( &OBJC_CLASS___NEIdentityKeychainItem,  "importPKCS12Data:passphrase:",  v21,  v24);
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = v25;
      if (v25 && [v25 count])
      {
        [v26 objectAtIndex:0];
        uint32_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          id v55 = v27;
          [v19 setObject:v27 forKey:@"LocalCertificate"];
          if (!-[__CFString isEqualToString:](v8, "isEqualToString:", @"IKEv2")
            || ([v19 objectForKeyedSubscript:@"AuthenticationMethod"],
                id v54 = (void *)objc_claimAutoreleasedReturnValue(),
                v54,
                uint32_t v27 = v55,
                !v54))
          {
            [v19 setObject:@"Certificate" forKey:@"AuthenticationMethod"];
            uint32_t v27 = v55;
          }
        }
      }
    }

    a1 = v23;
    BOOL v13 = v22;
    goto LABEL_39;
  }

  uint64_t v31 = -[os_log_s objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", @"LocalCertificate");
  if (v31)
  {
    uint64_t v21 = (void *)v31;
    if (!-[__CFString isEqualToString:](v8, "isEqualToString:", @"IKEv2")
      || ([v19 objectForKeyedSubscript:@"AuthenticationMethod"],
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v32,
          !v32))
    {
      [v19 setObject:@"Certificate" forKey:@"AuthenticationMethod"];
    }

    goto LABEL_39;
  }

  -[os_log_s objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", @"PayloadCertificateUUID");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {

LABEL_35:
    if (!-[__CFString isEqualToString:](v8, "isEqualToString:", @"IKEv2")
      || ([v19 objectForKeyedSubscript:@"AuthenticationMethod"],
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v37,
          !v37))
    {
      [v19 setObject:@"Certificate" forKey:@"AuthenticationMethod"];
    }

    goto LABEL_38;
  }

  [v10 objectForKeyedSubscript:@"PayloadCertificateUUID"];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36) {
    goto LABEL_35;
  }
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", @"IKEv2")
    && (-[os_log_s objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", @"ExtensibleSSOProvider"),
        char v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v45,
        v45))
  {
    ne_log_obj();
    id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      id v47 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v47;
      id v48 = v47;
      _os_log_impl( &dword_1876B1000,  v46,  OS_LOG_TYPE_INFO,  "%@ ingestIPSecDict: assuming authentication by certificate",  buf,  0xCu);
    }

    uint64_t v49 = @"Certificate";
  }

  else
  {
    ne_log_obj();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      id v51 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v51;
      id v52 = v51;
      _os_log_impl( &dword_1876B1000,  v50,  OS_LOG_TYPE_INFO,  "%@ ingestIPSecDict: assuming authentication by sharedsecret",  buf,  0xCu);
    }

    if (-[__CFString isEqualToString:](v8, "isEqualToString:", @"IKEv2"))
    {
      [v19 objectForKeyedSubscript:@"AuthenticationMethod"];
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53) {
        goto LABEL_58;
      }
    }

    uint64_t v49 = @"SharedSecret";
  }

  [v19 setObject:v49 forKey:@"AuthenticationMethod"];
LABEL_58:
  [v19 removeObjectForKey:@"ExportedSharedSecret"];
  [v19 removeObjectForKey:@"IPSecSharedSecretObf"];
LABEL_38:
  uint64_t v21 = 0LL;
LABEL_39:
  [v19 objectForKeyedSubscript:@"AuthenticationMethod"];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 && (-[__CFString isEqualToString:](v8, "isEqualToString:", @"IKEv2") & 1) == 0)
  {
    if ([v38 isEqualToString:@"Certificate"])
    {
      [v19 removeObjectForKey:@"LocalIdentifier"];
      __int128 v39 = @"LocalIdentifierType";
    }

    else
    {
      __int128 v39 = @"LocalCertificate";
    }

    [v19 removeObjectForKey:v39];
  }

  uint64_t v33 = -[NEConfiguration configureIKE:vpnType:payloadBase:vpn:](a1, v19, v8, v7, v56);

  id v9 = v56;
LABEL_46:

  return v33;
}

- (id)initWithVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v161 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  uint64_t v8 = a3;
  if (!a1)
  {
    id v34 = 0LL;
    goto LABEL_44;
  }

  id v9 = v7;
  [v9 payloadAtom];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v156 = (id)objc_opt_class();
    id v37 = v156;
    _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithVPNPayload", buf, 0xCu);
  }

  if (!v10)
  {
    ne_log_obj();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v31 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v156 = v31;
    id v32 = v31;
    uint64_t v33 = "%@ initWithVPNPayload: empty payload atom";
LABEL_65:
    _os_log_error_impl(&dword_1876B1000, v13, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);

    goto LABEL_32;
  }

  uint64_t v12 = [v10 objectForKeyedSubscript:@"VPNType"];
  if (v12)
  {
    BOOL v13 = (os_log_s *)v12;
    v154[0] = @"IKEv2";
    v154[1] = @"VPN";
    [MEMORY[0x189603F18] arrayWithObjects:v154 count:2];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v14 containsObject:v13])
    {
      uint64_t v15 = [a1 initWithName:v8 grade:a4];
      if (!v15)
      {
        ne_log_obj();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v68 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v156 = v68;
          __int16 v157 = 2112;
          id v158 = v8;
          id v69 = v68;
          _os_log_error_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_ERROR,  "%@ initWithVPNPayload failed for config '%@'",  buf,  0x16u);
        }

        __int16 v19 = 0LL;
        a1 = 0LL;
        goto LABEL_38;
      }

      a1 = (id)v15;
      char v16 = objc_alloc_init(&OBJC_CLASS___NEVPN);
      [a1 setVPN:v16];

      [a1 VPN];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        [a1 VPN];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 setEnabled:1];

        [v10 objectForKeyedSubscript:@"Enabled"];
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (isa_nsnumber(v19))
        {
          uint64_t v20 = [v19 BOOLValue];
          [a1 VPN];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 setEnabled:v20];
        }

        id v153 = v14;
        if (!-[os_log_s isEqualToString:](v13, "isEqualToString:", @"L2TP"))
        {
          if ((-[os_log_s isEqualToString:](v13, "isEqualToString:", @"IPSec") & 1) != 0
            || -[os_log_s isEqualToString:](v13, "isEqualToString:", @"IKEv2"))
          {
            ne_log_obj();
            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v72 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v156 = v72;
              __int16 v157 = 2112;
              id v158 = (const __CFString *)v13;
              id v73 = v72;
              _os_log_debug_impl( &dword_1876B1000,  v41,  OS_LOG_TYPE_DEBUG,  "%@ initWithVPNPayload: ingest %@",  buf,  0x16u);
            }
          }

- (__CFString)initWithAlwaysOnVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v269 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    __int128 v165 = 0LL;
    goto LABEL_228;
  }

  id v9 = v7;
  [v9 payloadAtom];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v262 = (id)objc_opt_class();
    uint64_t v172 = a1;
    id v173 = v262;
    _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithAlwaysOnVPNPayload", buf, 0xCu);

    a1 = v172;
  }

  if (!v10)
  {
    ne_log_obj();
    __int128 v164 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
    {
      v176 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v262 = v176;
      id v177 = v176;
      _os_log_error_impl( &dword_1876B1000,  v164,  OS_LOG_TYPE_ERROR,  "%@ initWithAlwaysOnVPNPayload: empty payload atom",  buf,  0xCu);
    }

    __int128 v165 = 0LL;
    goto LABEL_227;
  }

  [v10 objectForKeyedSubscript:@"AlwaysOn"];
  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((isa_nsdictionary(v12) & 1) == 0)
  {
    ne_log_obj();
    __int128 v166 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      v178 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v262 = v178;
      __int16 v263 = 2112;
      v264 = @"AlwaysOn";
      id v168 = v178;
      __int16 v169 = "%@ initWithAlwaysOnVPNPayload: missing %@ dictionary";
      v170 = v166;
      uint32_t v171 = 22;
      goto LABEL_202;
    }

- (id)initWithContentFilterPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  if (!a1)
  {
    id v23 = 0LL;
    goto LABEL_20;
  }

  id v10 = v8;
  [v10 payloadAtom];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v106 = (id)objc_opt_class();
    id v4 = v106;
    _os_log_debug_impl(&dword_1876B1000, v12, OS_LOG_TYPE_DEBUG, "%@ initWithContentFilterPayload", buf, 0xCu);
  }

  if (!v11) {
    goto LABEL_16;
  }
  [v11 objectForKeyedSubscript:@"FilterType"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    [v11 objectForKeyedSubscript:@"FilterType"];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (([@"Plugin" isEqualToString:v4] & 1) == 0)
    {

LABEL_16:
      ne_log_obj();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v29 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v106 = v29;
      id v27 = v29;
      unint64_t v28 = "%@ initWithContentFilterPayload: empty payload atom or plugin type, or wrong filter type";
LABEL_26:
      _os_log_error_impl(&dword_1876B1000, v22, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);

      goto LABEL_17;
    }
  }

  [v11 objectForKeyedSubscript:@"PluginBundleID"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
  }

  if (!v14) {
    goto LABEL_16;
  }
  uint64_t v15 = [a1 initWithName:v9 grade:a4];
  if (v15)
  {
    a1 = (void *)v15;
    char v16 = objc_alloc_init(&OBJC_CLASS___NEContentFilter);
    [a1 setContentFilter:v16];

    [a1 contentFilter];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      ne_log_obj();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v106 = v26;
      id v27 = v26;
      unint64_t v28 = "%@ initWithContentFilterPayload failed, can't create content filter";
      goto LABEL_26;
    }

    [v11 objectForKeyedSubscript:@"FilterGrade"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v18))
    {
      if ([v18 isEqualToString:@"firewall"])
      {
        [a1 contentFilter];
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = v19;
        uint64_t v21 = 1LL;
      }

      else
      {
        if (![v18 isEqualToString:@"inspector"])
        {
          ne_log_obj();
          uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v106 = v18;
            _os_log_error_impl(&dword_1876B1000, v50, OS_LOG_TYPE_ERROR, "Invalid filter grade: %@", buf, 0xCu);
          }

          goto LABEL_71;
        }

        [a1 contentFilter];
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = v19;
        uint64_t v21 = 2LL;
      }

      [v19 setGrade:v21];
    }

    id v30 = objc_alloc_init(&OBJC_CLASS___NEFilterProviderConfiguration);
    [a1 contentFilter];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setProvider:v30];

    [a1 contentFilter];
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 provider];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      [v11 objectForKeyedSubscript:@"PluginBundleID"];
      id v34 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 contentFilter];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 provider];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 setPluginType:v34];

      [a1 contentFilter];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 provider];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = v38;
      if (v38) {
        objc_setProperty_atomic_copy(v38, v39, @"com.apple.managed.vpn.shared", 96LL);
      }

      [a1 contentFilter];
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 provider];
      id v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 pluginType];
      id v43 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 setApplication:v43];

      [a1 contentFilter];
      id v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v44 provider];
      char v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 pluginType];
      id v46 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 setApplicationIdentifier:v46];

      [v11 objectForKeyedSubscript:@"Enabled"];
      id v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isa_nsnumber(v47) & 1) != 0)
      {
        [v11 objectForKeyedSubscript:@"Enabled"];
        id v48 = (void *)objc_claimAutoreleasedReturnValue();
        int v49 = [v48 BOOLValue];

        if (!v49)
        {
LABEL_40:
          [a1 contentFilter];
          id v54 = (void *)objc_claimAutoreleasedReturnValue();
          [v54 provider];
          uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          [v11 objectForKeyedSubscript:@"VendorConfig"];
          id v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setVendorConfiguration:](v50, "setVendorConfiguration:", v55);

          [v11 objectForKeyedSubscript:@"ServerAddress"];
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setServerAddress:](v50, "setServerAddress:", v56);

          [v11 objectForKeyedSubscript:@"UserName"];
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setUsername:](v50, "setUsername:", v57);

          [v11 objectForKeyedSubscript:@"Organization"];
          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setOrganization:](v50, "setOrganization:", v58);

          [v11 objectForKeyedSubscript:@"FilterDataProviderDesignatedRequirement"];
          __int16 v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setDataProviderDesignatedRequirement:](v50, "setDataProviderDesignatedRequirement:", v59);

          [v11 objectForKeyedSubscript:@"FilterDataProviderBundleIdentifier"];
          int v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setFilterDataProviderBundleIdentifier:](v50, "setFilterDataProviderBundleIdentifier:", v60);

          [v11 objectForKeyedSubscript:@"FilterPacketProviderDesignatedRequirement"];
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setPacketProviderDesignatedRequirement:](v50, "setPacketProviderDesignatedRequirement:", v61);

          [v11 objectForKeyedSubscript:@"FilterPacketProviderBundleIdentifier"];
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s setFilterPacketProviderBundleIdentifier:](v50, "setFilterPacketProviderBundleIdentifier:", v62);

          [v11 objectForKeyedSubscript:@"FilterSockets"];
          id v63 = (void *)objc_claimAutoreleasedReturnValue();
          int v64 = isa_nsnumber(v63);

          if (v64)
          {
            [v11 objectForKeyedSubscript:@"FilterSockets"];
            uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[os_log_s setFilterSockets:](v50, "setFilterSockets:", [v65 BOOLValue]);
          }

          [v11 objectForKeyedSubscript:@"FilterPackets"];
          uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
          int v67 = isa_nsnumber(v66);

          if (v67)
          {
            [v11 objectForKeyedSubscript:@"FilterPackets"];
            int v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[os_log_s setFilterPackets:](v50, "setFilterPackets:", [v68 BOOLValue]);
          }

          [v11 objectForKeyedSubscript:@"DisableDefaultDrop"];
          id v69 = (void *)objc_claimAutoreleasedReturnValue();
          int v70 = isa_nsnumber(v69);

          if (v70)
          {
            [v11 objectForKeyedSubscript:@"DisableDefaultDrop"];
            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[os_log_s setDisableDefaultDrop:](v50, "setDisableDefaultDrop:", [v71 BOOLValue]);
          }

          [v11 objectForKeyedSubscript:@"FilterBrowsers"];
          uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
          int v73 = isa_nsnumber(v72);

          if (v73)
          {
            [v11 objectForKeyedSubscript:@"FilterBrowsers"];
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[os_log_s setFilterBrowsers:](v50, "setFilterBrowsers:", [v74 BOOLValue]);
          }

          if ((-[os_log_s filterSockets](v50, "filterSockets") & 1) == 0
            && (-[os_log_s filterBrowsers](v50, "filterBrowsers") & 1) == 0
            && (-[os_log_s filterPackets](v50, "filterPackets") & 1) == 0)
          {
            [a1 contentFilter];
            uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
            [v75 setEnabled:0];
          }

          uint64_t v76 = [v11 objectForKeyedSubscript:@"Password"];
          if (v76)
          {
            uint64_t v77 = (void *)v76;
            -[os_log_s username](v50, "username");
            uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v18;
            if (isa_nsdata(v77))
            {
              uint64_t v79 = [objc_alloc(NSString) initWithData:v77 encoding:4];

              uint64_t v77 = (void *)v79;
            }

            else if ((isa_nsstring(v77) & 1) == 0)
            {
              ne_log_obj();
              uint64_t v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                char v98 = (void *)objc_opt_class();
                id v100 = v98;
                v99 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                id v106 = v98;
                __int16 v107 = 2112;
                v108 = v99;
                id v102 = v99;
                _os_log_error_impl( &dword_1876B1000,  v94,  OS_LOG_TYPE_ERROR,  "%@ initWithContentFilterPayload: unsupported password data type %@",  buf,  0x16u);
              }

              id v23 = 0LL;
              uint64_t v18 = v103;
              goto LABEL_72;
            }

            id v80 = v77;
            id v82 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
            if (v50) {
              id Property = objc_getProperty(v50, v81, 96LL, 1);
            }
            else {
              id Property = 0LL;
            }
            id v84 = Property;
            int v85 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v82,  "initWithPassword:domain:accessGroup:",  v80,  1LL,  v84);

            -[NEKeychainItem syncUsingConfiguration:accountName:passwordType:identifierSuffix:]( v85,  "syncUsingConfiguration:accountName:passwordType:identifierSuffix:",  a1,  v78,  0LL,  0LL);
            -[NEKeychainItem persistentReference](v85, "persistentReference");
            uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[os_log_s setPasswordReference:](v50, "setPasswordReference:", v86);

            uint64_t v18 = v103;
          }

          -[os_log_s setIdentityReference:](v50, "setIdentityReference:", 0LL);
          [v11 objectForKeyedSubscript:@"PayloadCertificateUUID"];
          SEL v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (v87)
          {
            [v11 objectForKeyedSubscript:@"PayloadCertificateUUID"];
            SEL v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50) {
              id v90 = objc_getProperty(v50, v88, 96LL, 1);
            }
            else {
              id v90 = 0LL;
            }
            id v91 = v90;
            [v10 addCertificatePending:v89 certificateTag:@"_PayloadCertificateRef" accessGroup:v91];
          }

          else
          {
            [v11 objectForKeyedSubscript:@"LocalCertificate"];
            uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v92)
            {
LABEL_66:
              ne_log_obj();
              uint64_t v93 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                v95 = (void *)objc_opt_class();
                id v101 = v95;
                [a1 contentFilter];
                int v104 = v18;
                int v96 = (void *)objc_claimAutoreleasedReturnValue();
                [v96 provider];
                id v97 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                id v106 = v95;
                __int16 v107 = 2112;
                v108 = v97;
                _os_log_debug_impl( &dword_1876B1000,  v93,  OS_LOG_TYPE_DEBUG,  "%@ initWithContentFilterPayload: provider %@",  buf,  0x16u);

                uint64_t v18 = v104;
              }

              id v23 = a1;
              goto LABEL_72;
            }

            [v11 objectForKeyedSubscript:@"LocalCertificate"];
            SEL v89 = (void *)objc_claimAutoreleasedReturnValue();
            setLocalCertificate(v89);
            id v91 = (id)objc_claimAutoreleasedReturnValue();
            -[os_log_s setIdentityReference:](v50, "setIdentityReference:", v91);
          }

          goto LABEL_66;
        }
      }

      else
      {
      }

      [a1 contentFilter];
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
      [v53 setEnabled:1];

      goto LABEL_40;
    }

    ne_log_obj();
    uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      id v51 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v106 = v51;
      id v52 = v51;
      _os_log_error_impl( &dword_1876B1000,  v50,  OS_LOG_TYPE_ERROR,  "%@ initWithContentFilterPayload failed, can't create provider",  buf,  0xCu);
    }

- (id)initWithPathControllerPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v35 = 0LL;
    goto LABEL_47;
  }

  [v7 payloadAtom];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v78 = (id)objc_opt_class();
    id v41 = v78;
    _os_log_debug_impl(&dword_1876B1000, v10, OS_LOG_TYPE_DEBUG, "%@ initWithPathControllerPayload", buf, 0xCu);
  }

  if ((isa_nsdictionary(v9) & 1) == 0)
  {
    ne_log_obj();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v78 = v36;
      id v37 = v36;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "%@ initWithPathControllerPayload: empty payload atom",  buf,  0xCu);
    }

    goto LABEL_45;
  }

  [v9 objectForKeyedSubscript:@"ApplicationRules"];
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if ((isa_nsarray(v11) & 1) == 0)
  {
    ne_log_obj();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v48 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v78 = v48;
      id v47 = v48;
      _os_log_error_impl( &dword_1876B1000,  v38,  OS_LOG_TYPE_ERROR,  "%@ initWithPathControllerPayload: ApplicationRules missing",  buf,  0xCu);
      goto LABEL_54;
    }

- (id)initWithDNSProxyPayload:(id)a1 configurationName:(void *)a2 grade:(void *)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    id v28 = 0LL;
    goto LABEL_20;
  }

  [v5 payloadAtom];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v44 = 138412290;
    id v45 = (id)objc_opt_class();
    id v39 = v45;
    _os_log_debug_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEBUG, "%@ initWithDNSProxyPayload", (uint8_t *)&v44, 0xCu);
  }

  if (v7)
  {
    a1 = (id)[a1 initWithName:v6 grade:1];
    if (a1)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___NEDNSProxy);
      [a1 setDnsProxy:v9];

      [a1 dnsProxy];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        [a1 dnsProxy];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 setEnabled:1];

        uint64_t v12 = objc_alloc(&OBJC_CLASS___NEDNSProxyProviderProtocol);
        [v7 objectForKeyedSubscript:@"AppBundleIdentifier"];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = -[NEDNSProxyProviderProtocol initWithPluginType:](v12, "initWithPluginType:", v13);
        [a1 dnsProxy];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 setProtocol:v14];

        [a1 dnsProxy];
        char v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 protocol];
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          [v7 objectForKeyedSubscript:@"ProviderBundleIdentifier"];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 dnsProxy];
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 protocol];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 setProviderBundleIdentifier:v18];

          [v7 objectForKeyedSubscript:@"ProviderConfiguration"];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 dnsProxy];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 protocol];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 setProviderConfiguration:v21];

          [v7 objectForKeyedSubscript:@"ProviderDesignatedRequirement"];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 dnsProxy];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 protocol];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 setDesignatedRequirement:v24];

          ne_log_obj();
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            id v41 = (void *)objc_opt_class();
            int v44 = 138412290;
            id v45 = v41;
            id v42 = v41;
            _os_log_debug_impl( &dword_1876B1000,  v27,  OS_LOG_TYPE_DEBUG,  "%@ initWithDNSProxyPayload: done",  (uint8_t *)&v44,  0xCu);
          }

          a1 = a1;
          id v28 = a1;
          goto LABEL_19;
        }

        ne_log_obj();
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = (void *)objc_opt_class();
          int v44 = 138412290;
          id v45 = v38;
          id v31 = v38;
          id v32 = "%@ initWithDNSProxyPayload failed to allocate protocol";
          goto LABEL_13;
        }

        goto LABEL_18;
      }

      ne_log_obj();
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        ne_log_obj();
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v40 = (void *)objc_opt_class();
          int v44 = 138412290;
          id v45 = v40;
          id v31 = v40;
          _os_log_debug_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_DEBUG,  "%@ initWithDNSProxyPayload: failed",  (uint8_t *)&v44,  0xCu);
          goto LABEL_24;
        }

        goto LABEL_18;
      }

      id v43 = (void *)objc_opt_class();
      int v44 = 138412546;
      id v45 = v43;
      __int16 v46 = 2112;
      id v47 = v6;
      id v35 = v43;
      uint64_t v36 = "%@ initWithDNSProxyPayload failed, can't create dnsProxy for config '%@'";
    }

    else
    {
      ne_log_obj();
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      id v34 = (void *)objc_opt_class();
      int v44 = 138412546;
      id v45 = v34;
      __int16 v46 = 2112;
      id v47 = v6;
      id v35 = v34;
      uint64_t v36 = "%@ initWithDNSProxyPayload: initWithName failed for '%@'";
    }

    _os_log_error_impl(&dword_1876B1000, (os_log_t)v33, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v44, 0x16u);

    goto LABEL_17;
  }

  ne_log_obj();
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = (void *)objc_opt_class();
    int v44 = 138412290;
    id v45 = v30;
    id v31 = v30;
    id v32 = "%@ initWithDNSProxyPayload: empty payload atom";
LABEL_13:
    _os_log_error_impl(&dword_1876B1000, v29, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v44, 0xCu);
LABEL_24:
  }

- (id)initWithDNSSettingsPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v20 = 0LL;
    goto LABEL_46;
  }

  id v9 = v7;
  [v9 payloadAtom];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = (id)objc_opt_class();
    id v32 = v56;
    _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithDNSSettingsPayload", buf, 0xCu);
  }

  if ((isa_nsdictionary(v10) & 1) == 0)
  {
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v45 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v56 = v45;
      id v46 = v45;
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "%@ initWithDNSSettingsPayload: empty payload atom",  buf,  0xCu);
    }

    id v20 = 0LL;
    goto LABEL_45;
  }

  [v10 objectForKeyedSubscript:@"DNSSettings"];
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if ((isa_nsdictionary(v12) & 1) != 0)
  {
    [v10 objectForKeyedSubscript:@"ProhibitDisablement"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = isa_nsnumber(v13);

    if (v14)
    {
      [v10 objectForKeyedSubscript:@"ProhibitDisablement"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 BOOLValue];

      if (v16) {
        a4 = 1LL;
      }
    }

    BOOL v17 = v12;
    objc_opt_self();
    -[os_log_s objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", @"DNSProtocol");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v18))
    {
      if ([v18 isEqualToString:@"HTTPS"])
      {
        __int16 v19 = off_18A0877A8;
      }

      else
      {
        if (![v18 isEqualToString:@"TLS"])
        {
          uint64_t v21 = 0LL;
LABEL_19:

          if (!v21)
          {
            ne_log_obj();
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            id v27 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            id v56 = v27;
            id v28 = v27;
            uint64_t v29 = "%@ initWithDNSSettingsPayload: failed to parse DNSSettings";
            id v30 = v26;
            uint32_t v31 = 12;
LABEL_49:
            _os_log_error_impl(&dword_1876B1000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);

LABEL_40:
            ne_log_obj();
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              id v47 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              id v56 = v47;
              id v48 = v47;
              _os_log_debug_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_DEBUG,  "%@ initWithDNSSettingsPayload: failed",  buf,  0xCu);
            }

            goto LABEL_42;
          }

          -[os_log_s objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", @"PayloadCertificateUUID");
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            -[os_log_s objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", @"PayloadCertificateUUID");
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 addCertificatePending:v25 certificateTag:@"_PayloadCertificateRef"];
          }

          else
          {
            -[os_log_s objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", @"LocalCertificate");
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33) {
              goto LABEL_31;
            }
            uint64_t v34 = [v21 dnsProtocol];
            if (v34 != 3 && v34 != 2) {
              goto LABEL_31;
            }
            id v35 = v21;
            -[os_log_s objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", @"LocalCertificate");
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            setLocalCertificate(v25);
            id v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v35 setIdentityReference:v54];
          }

LABEL_31:
          uint64_t v36 = [a1 initWithName:v8 grade:a4];
          if (!v36)
          {
            ne_log_obj();
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v51 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v56 = v51;
              __int16 v57 = 2112;
              id v58 = v8;
              id v52 = v51;
              _os_log_error_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_ERROR,  "%@ initWithDNSSettingsPayload: initWithName failed for '%@'",  buf,  0x16u);
            }

            a1 = 0LL;
            goto LABEL_40;
          }

          a1 = (id)v36;
          id v37 = objc_alloc_init(&OBJC_CLASS___NEDNSSettingsBundle);
          [a1 setDnsSettings:v37];

          [a1 dnsSettings];
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            [a1 dnsSettings];
            id v39 = (void *)objc_claimAutoreleasedReturnValue();
            [v39 setSettings:v21];

            +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)&OBJC_CLASS___NEOnDemandRule, v10);
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
            [a1 dnsSettings];
            id v41 = (void *)objc_claimAutoreleasedReturnValue();
            [v41 setOnDemandRules:v40];

            [a1 dnsSettings];
            id v42 = (void *)objc_claimAutoreleasedReturnValue();
            [v42 setEnabled:1];

            ne_log_obj();
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              int v49 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              id v56 = v49;
              id v50 = v49;
              _os_log_debug_impl( &dword_1876B1000,  v43,  OS_LOG_TYPE_DEBUG,  "%@ initWithDNSSettingsPayload: done",  buf,  0xCu);
            }

            a1 = a1;
            id v20 = a1;
            goto LABEL_44;
          }

          ne_log_obj();
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_40;
          }
          uint64_t v53 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v56 = v53;
          __int16 v57 = 2112;
          id v58 = v8;
          id v28 = v53;
          uint64_t v29 = "%@ initWithDNSSettingsPayload failed, could not create DNS Settings for config '%@'";
          id v30 = v26;
          uint32_t v31 = 22;
          goto LABEL_49;
        }

        __int16 v19 = off_18A0877B0;
      }
    }

    else
    {
      __int16 v19 = off_18A0877E8;
    }

    uint64_t v21 = (void *)[objc_alloc(*v19) initFromLegacyDictionary:v17];
    goto LABEL_19;
  }

  ne_log_obj();
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v56 = v22;
    id v23 = v22;
    _os_log_error_impl( &dword_1876B1000,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "%@ initWithDNSSettingsPayload: DNSSettings missing",  buf,  0xCu);
LABEL_42:
  }

  id v20 = 0LL;
LABEL_44:

LABEL_45:
LABEL_46:

  return v20;
}

- (id)initWithRelayPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v140 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v74 = 0LL;
    goto LABEL_110;
  }

  id v9 = v7;
  [v9 payloadAtom];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v139 = (id)objc_opt_class();
    id v78 = v139;
    _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithRelayPayload", buf, 0xCu);
  }

  if ((isa_nsdictionary(v10) & 1) == 0)
  {
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v81 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v139 = v81;
      id v82 = v81;
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "%@ initWithRelayPayload failed, empty payload atom",  buf,  0xCu);
    }

    id v74 = 0LL;
    goto LABEL_109;
  }

  [v10 objectForKeyedSubscript:@"Relays"];
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if ((isa_nsarray(v12) & 1) == 0)
  {
    ne_log_obj();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_107:
      id v74 = 0LL;
      goto LABEL_108;
    }

    __int128 v75 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v139 = v75;
    id v76 = v75;
    uint64_t v77 = "%@ initWithRelayPayload failed, relays missing";
LABEL_102:
    _os_log_error_impl(&dword_1876B1000, v16, OS_LOG_TYPE_ERROR, v77, buf, 0xCu);

    goto LABEL_107;
  }

  uint64_t v13 = [a1 initWithName:v8 grade:a4];
  if (!v13)
  {
    ne_log_obj();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      SEL v87 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v139 = v87;
      id v88 = v87;
      _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%@ initWithRelayPayload failed, cannot initialize",  buf,  0xCu);
    }

    a1 = 0LL;
    goto LABEL_107;
  }

  a1 = (void *)v13;
  int v14 = objc_alloc_init(&OBJC_CLASS___NERelayConfiguration);
  [a1 setRelay:v14];

  [a1 relay];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    ne_log_obj();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_107;
    }
    SEL v89 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v139 = v89;
    id v76 = v89;
    uint64_t v77 = "%@ initWithRelayPayload failed, cannot create relay";
    goto LABEL_102;
  }

  id v95 = v8;
  id v96 = v7;
  int v16 = (os_log_s *)objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v98 = -[os_log_s count](v12, "count");
  if (!v98)
  {
LABEL_72:
    [a1 relay];
    id v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v55 setRelays:v16];

    [v10 objectForKeyedSubscript:@"MatchDomains"];
    id v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v56))
    {
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      id v57 = v56;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v112 objects:v133 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v113;
LABEL_75:
        uint64_t v61 = 0LL;
        while (1)
        {
          if (*(void *)v113 != v60) {
            objc_enumerationMutation(v57);
          }
          if (v59 == ++v61)
          {
            uint64_t v59 = [v57 countByEnumeratingWithState:&v112 objects:v133 count:16];
            if (v59) {
              goto LABEL_75;
            }
            goto LABEL_81;
          }
        }
      }

      else
      {
LABEL_81:

        [a1 relay];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 setMatchDomains:v57];
        id v57 = v62;
      }
    }

    id v102 = v56;
    [v10 objectForKeyedSubscript:@"ExcludedDomains"];
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v96;
    if (isa_nsarray(v103))
    {
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      id v63 = v103;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v108 objects:v132 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)v109;
LABEL_86:
        uint64_t v67 = 0LL;
        while (1)
        {
          if (*(void *)v109 != v66) {
            objc_enumerationMutation(v63);
          }
          if (v65 == ++v67)
          {
            uint64_t v65 = [v63 countByEnumeratingWithState:&v108 objects:v132 count:16];
            if (v65) {
              goto LABEL_86;
            }
            goto LABEL_92;
          }
        }
      }

      else
      {
LABEL_92:

        [a1 relay];
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
        [v68 setExcludedDomains:v63];
        id v63 = v68;
      }
    }

    +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)&OBJC_CLASS___NEOnDemandRule, v10);
    __int128 v69 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 relay];
    __int128 v70 = (void *)objc_claimAutoreleasedReturnValue();
    [v70 setOnDemandRules:v69];

    [v10 objectForKeyedSubscript:@"Enabled"];
    __int128 v71 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isa_nsnumber(v71) & 1) != 0)
    {
      [v10 objectForKeyedSubscript:@"Enabled"];
      __int128 v72 = (void *)objc_claimAutoreleasedReturnValue();
      int v73 = [v72 BOOLValue];

      id v8 = v95;
      if (!v73) {
        goto LABEL_113;
      }
    }

    else
    {

      id v8 = v95;
    }

    [a1 relay];
    id v80 = (void *)objc_claimAutoreleasedReturnValue();
    [v80 setEnabled:1];

LABEL_113:
    id v74 = a1;
    goto LABEL_120;
  }

  uint64_t v17 = 0LL;
  uint64_t v93 = v12;
  uint64_t v94 = a1;
  uint64_t v92 = v16;
  while (1)
  {
    -[os_log_s objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v102 = v18;
    if ((isa_nsdictionary(v18) & 1) == 0) {
      break;
    }
    uint64_t v104 = v17;
    [v18 objectForKeyedSubscript:@"HTTP3RelayURL"];
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 objectForKeyedSubscript:@"HTTP2RelayURL"];
    id v106 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v19;
    if ((isa_nsstring(v19) & 1) == 0 && (isa_nsstring(v106) & 1) == 0)
    {
      ne_log_obj();
      uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        id v90 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v139 = v90;
        id v91 = v90;
        _os_log_error_impl( &dword_1876B1000,  v86,  OS_LOG_TYPE_ERROR,  "%@ initWithRelayPayload failed, relay dictionary has no URL",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    __int16 v107 = objc_alloc_init(&OBJC_CLASS___NERelay);
    if (isa_nsstring(v19))
    {
      [MEMORY[0x189604030] URLWithString:v19];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP3RelayURL:](v107, "setHTTP3RelayURL:", v20);
    }

    if (isa_nsstring(v106))
    {
      [MEMORY[0x189604030] URLWithString:v106];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP2RelayURL:](v107, "setHTTP2RelayURL:", v21);
    }

    [v18 objectForKeyedSubscript:@"DNSOverHTTPSURL"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v22))
    {
      [MEMORY[0x189604030] URLWithString:v22];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setDnsOverHTTPSURL:](v107, "setDnsOverHTTPSURL:", v23);
    }

    [v18 objectForKeyedSubscript:@"SyntheticDNSAnswerIPv4Prefix"];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v100 = v24;
    id v101 = v22;
    [v18 objectForKeyedSubscript:@"SyntheticDNSAnswerIPv6Prefix"];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v25;
    [v18 objectForKeyedSubscript:@"AdditionalHTTPHeaderFields"];
    __int16 v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsdictionary(v105))
    {
      __int128 v130 = 0u;
      __int128 v131 = 0u;
      __int128 v128 = 0u;
      __int128 v129 = 0u;
      [v105 allKeys];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v26 countByEnumeratingWithState:&v128 objects:v137 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v129;
        while (2)
        {
          for (uint64_t i = 0LL; i != v28; ++i)
          {
            if (*(void *)v129 != v29) {
              objc_enumerationMutation(v26);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v128 + 1) + 8 * i)))
            {
              int v31 = 0;
              goto LABEL_34;
            }
          }

          uint64_t v28 = [v26 countByEnumeratingWithState:&v128 objects:v137 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }

      int v31 = 1;
LABEL_34:

      __int128 v126 = 0u;
      __int128 v127 = 0u;
      __int128 v124 = 0u;
      __int128 v125 = 0u;
      [v105 allValues];
      id v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = [v32 countByEnumeratingWithState:&v124 objects:v136 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v125;
        while (2)
        {
          for (uint64_t j = 0LL; j != v34; ++j)
          {
            if (*(void *)v125 != v35) {
              objc_enumerationMutation(v32);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v124 + 1) + 8 * j)))
            {

              uint64_t v18 = v102;
              __int16 v19 = v103;
              goto LABEL_45;
            }
          }

          uint64_t v34 = [v32 countByEnumeratingWithState:&v124 objects:v136 count:16];
          __int16 v19 = v103;
          if (v34) {
            continue;
          }
          break;
        }
      }

      uint64_t v18 = v102;
      if (v31) {
        -[NERelay setAdditionalHTTPHeaderFields:](v107, "setAdditionalHTTPHeaderFields:", v105);
      }
    }

- (BOOL)isSupportedBySC
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    [a1 VPN];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      [(id)v1 VPN];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 protocol];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        [(id)v1 VPN];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 protocol];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v6 type] == 5)
        {
          BOOL v1 = 0LL;
        }

        else
        {
          [(id)v1 VPN];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v1 = [v7 tunnelType] != 2 && objc_msgSend((id)v1, "grade") != 2;
        }
      }

      else
      {
        BOOL v1 = 0LL;
      }
    }

    else
    {
      BOOL v1 = 0LL;
    }
  }

  return v1;
}

- (uint64_t)applyChangesToSCServiceInPreferences:(void *)a1
{
  uint64_t v2 = (uint64_t)a1;
  uint64_t v79 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return v2;
  }
  if (!-[NEConfiguration isSupportedBySC](a1)) {
    return 1LL;
  }
  [(id)v2 pluginType];
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [(id)v2 identifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = SCNetworkServiceCopy(a2, (CFStringRef)[v5 UUIDString]);

    if (v6)
    {
      Interface = SCNetworkServiceGetInterface(v6);
      if (Interface)
      {
        id v8 = Interface;
        InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
        if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x18960C5D8], 0LL) == kCFCompareEqualTo)
        {
          uint64_t v26 = SCNetworkInterfaceGetInterface(v8);
          if (v26)
          {
            uint64_t v27 = SCNetworkInterfaceGetInterfaceType(v26);
            if (v27)
            {
              if (CFStringCompare(v27, v4, 0LL) && !SCNetworkServiceRemove(v6))
              {
                ne_log_obj();
                uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  CFErrorRef Error = SCCopyLastError();
                  int v75 = 138412546;
                  id v76 = v6;
                  __int16 v77 = 2112;
                  id v78 = Error;
                  _os_log_error_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to remove SCNetworkService %@: %@",  (uint8_t *)&v75,  0x16u);
                }
              }
            }
          }
        }
      }

      CFRelease(v6);
    }
  }

  [(id)v2 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = SCNetworkServiceCopy(a2, (CFStringRef)[v10 UUIDString]);

  if (v11)
  {
    Name = SCNetworkServiceGetName(v11);
    [(id)v2 name];
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (Name && v13 && !CFStringHasPrefix(Name, v13))
    {
      [(id)v2 name];
      for (uint64_t i = (const __CFString *)objc_claimAutoreleasedReturnValue(); ; uint64_t i = v15)
      {
        if (SCNetworkServiceSetName(v11, i))
        {
          uint64_t v33 = i;
          goto LABEL_36;
        }

        if (SCError() != 1005) {
          break;
        }
        CFStringRef v15 = copyNextName(i);
        CFRelease(i);
      }

      ne_log_obj();
      uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        [(id)v2 name];
        __int128 v71 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
        int v72 = SCError();
        int v73 = SCErrorString(v72);
        int v75 = 138412546;
        id v76 = v71;
        __int16 v77 = 2080;
        id v78 = (void *)v73;
        _os_log_error_impl( &dword_1876B1000,  v53,  OS_LOG_TYPE_ERROR,  "Failed to set the serve name for configuration %@: %s",  (uint8_t *)&v75,  0x16u);
      }

      CFRelease(i);
      goto LABEL_85;
    }
  }

  else
  {
    [(id)v2 VPN];
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 protocol];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = (const __SCNetworkInterface *)[v17 createInterface];

    if (!v18)
    {
      ne_log_obj();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        [(id)v2 name];
        __int128 v70 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
        int v75 = 138412290;
        id v76 = v70;
        _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to create interface for configuration \"%@\"",  (uint8_t *)&v75,  0xCu);
      }

      int v11 = 0LL;
      goto LABEL_84;
    }

    int v11 = SCNetworkServiceCreate(a2, v18);
    CFRelease(v18);
    [(id)v2 identifier];
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 UUIDString];
    int v20 = _SCNetworkServiceSetServiceID();

    if (!v20)
    {
      ne_log_obj();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_84:

LABEL_85:
        uint64_t v2 = 0LL;
        goto LABEL_86;
      }

      [(id)v2 name];
      uint64_t v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      int v30 = SCError();
      int v31 = SCErrorString(v30);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v31;
      id v32 = "Failed to re-set the service ID for configuration %@: %s";
LABEL_78:
      _os_log_error_impl(&dword_1876B1000, v25, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v75, 0x16u);

      goto LABEL_84;
    }

    [(id)v2 name];
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v22 = SCNetworkServiceSetName(v11, v21);

    if (!v22)
    {
      ne_log_obj();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      [(id)v2 name];
      uint64_t v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      int v54 = SCError();
      id v55 = SCErrorString(v54);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v55;
      id v32 = "Failed to set the service name for configuration %@: %s";
      goto LABEL_78;
    }

    if (!SCNetworkServiceEstablishDefaultConfiguration(v11))
    {
      ne_log_obj();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      [(id)v2 name];
      uint64_t v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      int v58 = SCError();
      uint64_t v59 = SCErrorString(v58);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v59;
      id v32 = "Failed to set up default service configuration for configuration %@: %s";
      goto LABEL_78;
    }

    CFStringRef v23 = SCNetworkServiceGetName(v11);
    if (v23) {
      uint64_t v24 = (const __CFString *)CFRetain(v23);
    }
    else {
      uint64_t v24 = 0LL;
    }
    SCNetworkSetRef v60 = SCNetworkSetCopyCurrent(a2);
    if (!v60)
    {
LABEL_74:
      if (v24) {
        CFRelease(v24);
      }
      ne_log_obj();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      [(id)v2 name];
      uint64_t v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      int v64 = SCError();
      uint64_t v65 = SCErrorString(v64);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v65;
      id v32 = "Failed to add the network service for configuration %@ to the current network set: %s";
      goto LABEL_78;
    }

    SCNetworkSetRef v61 = v60;
    while (!SCNetworkSetAddService(v61, v11))
    {
      if (SCError() != 1005)
      {
        v62 = v24;
LABEL_73:
        CFRelease(v61);
        uint64_t v24 = v62;
        goto LABEL_74;
      }

      v62 = copyNextName(v24);
      int v63 = SCNetworkServiceSetName(v11, v62);
      CFRelease(v24);
      uint64_t v24 = v62;
      if (!v63) {
        goto LABEL_73;
      }
    }

    CFRelease(v61);
    if (v24)
    {
      uint64_t v33 = v24;
LABEL_36:
      CFRelease(v33);
    }
  }

  [(id)v2 VPN];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  int v35 = SCNetworkServiceSetEnabled(v11, [v34 isEnabled]);

  if (!v35)
  {
    ne_log_obj();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_84;
    }
    [(id)v2 name];
    uint64_t v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
    int v45 = SCError();
    id v46 = SCErrorString(v45);
    int v75 = 138412546;
    id v76 = v29;
    __int16 v77 = 2080;
    id v78 = (void *)v46;
    id v32 = "SCNetworkServiceSetEnabled failed for configuration %@: %s";
    goto LABEL_78;
  }

  SCNetworkInterfaceRef v36 = SCNetworkServiceGetInterface(v11);
  if (!v36)
  {
    ne_log_obj();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_84;
    }
    [(id)v2 name];
    uint64_t v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
    int v47 = SCError();
    id v48 = SCErrorString(v47);
    int v75 = 138412546;
    id v76 = v29;
    __int16 v77 = 2080;
    id v78 = (void *)v48;
    id v32 = "SCNetworkInterface for configuration %@ is NULL: %s";
    goto LABEL_78;
  }

  id v37 = v36;
  [(id)v2 VPN];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = (os_log_s *)[v38 copyLegacyDictionary];

  if (!v25)
  {
    ne_log_obj();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      [(id)v2 name];
      int v49 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      int v75 = 138412290;
      id v76 = v49;
      id v50 = "Failed to create a legacy dictionary for configuration \"%@\"";
      uint64_t v51 = v44;
      uint32_t v52 = 12;
LABEL_60:
      _os_log_error_impl(&dword_1876B1000, v51, OS_LOG_TYPE_ERROR, v50, (uint8_t *)&v75, v52);
    }

+ (uint64_t)setConfiguration:(const __CFString *)a3 forProtocol:(const __SCNetworkService *)a4 inService:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  SCNetworkProtocolRef v7 = SCNetworkServiceCopyProtocol(a4, a3);
  SCNetworkProtocolRef v8 = v7;
  if (a2 && !v7)
  {
    if (!SCNetworkServiceAddProtocolType(a4, a3))
    {
      ne_log_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = SCError();
        int v17 = 138412546;
        uint64_t v18 = a3;
        __int16 v19 = 2080;
        int v20 = SCErrorString(v15);
        _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "SCNetworkServiceAddProtocolType(%@) failed: %s",  (uint8_t *)&v17,  0x16u);
      }

      return 0LL;
    }

    SCNetworkProtocolRef v8 = SCNetworkServiceCopyProtocol(a4, a3);
  }

  if (v8)
  {
    if (a2 && !SCNetworkProtocolSetConfiguration(v8, a2))
    {
      ne_log_obj();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = SCError();
        int v17 = 138412546;
        uint64_t v18 = a3;
        __int16 v19 = 2080;
        int v20 = SCErrorString(v16);
        uint64_t v13 = "SCNetworkProtocolSetConfiguration(%@) failed: %s";
        goto LABEL_21;
      }
    }

    else
    {
      if (SCNetworkProtocolSetEnabled(v8, a2 != 0LL))
      {
        uint64_t v9 = 1LL;
LABEL_18:
        CFRelease(v8);
        return v9;
      }

      ne_log_obj();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = SCError();
        int v17 = 138412546;
        uint64_t v18 = a3;
        __int16 v19 = 2080;
        int v20 = SCErrorString(v12);
        uint64_t v13 = "SCNetworkProtocolSetEnabled(%@) failed: %s";
LABEL_21:
        _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, 0x16u);
      }
    }

    uint64_t v9 = 0LL;
    goto LABEL_18;
  }

  return 1LL;
}

- (uint64_t)updateFromSCService:(void *)a1
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  Interface = SCNetworkServiceGetInterface(service);
  id v5 = (void *)[objc_alloc(NSString) initWithString:SCNetworkServiceGetName(service)];
  [a1 setName:v5];

  if (Interface)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:SCNetworkInterfaceGetConfiguration(Interface)];
    InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
    SCNetworkProtocolRef v8 = (void *)SCNetworkServiceCopyExternalID();
    [v6 objectForKeyedSubscript:*MEMORY[0x18960C988]];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isa_nsarray(v9) & 1) != 0)
    {
      int v10 = 1;
    }

    else
    {
      [v6 objectForKeyedSubscript:*MEMORY[0x18960CA20]];
      int v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = isa_nsnumber(v12);
      if (v8) {
        int v10 = 1;
      }
      else {
        int v10 = v13;
      }
    }

    [a1 setExternalIdentifier:v8];
    if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x18960C5C0], 0LL))
    {
      if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x18960C5D0], 0LL))
      {
        if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x18960C5D8], 0LL) == kCFCompareEqualTo)
        {
          int v14 = SCNetworkInterfaceGetInterface(Interface);
          if (v14)
          {
            CFStringRef v15 = SCNetworkInterfaceGetInterfaceType(v14);
            if (v15)
            {
              int v16 = (void *)[objc_alloc(NSString) initWithString:v15];
              [v6 setObject:v16 forKeyedSubscript:@"__NEVPNPluginType"];

              uint64_t v17 = 4LL;
              goto LABEL_16;
            }
          }
        }

+ (CFDictionaryRef)copyConfigurationForProtocol:(const __SCNetworkService *)a3 inService:
{
  id v5 = SCNetworkServiceCopyProtocol(a3, a2);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  CFDictionaryRef Configuration = SCNetworkProtocolGetConfiguration(v5);
  CFDictionaryRef v8 = Configuration;
  if (Configuration) {
    CFRetain(Configuration);
  }
  CFRelease(v6);
  return v8;
}

@end