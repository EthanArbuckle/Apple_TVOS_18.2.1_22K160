@interface NEFilterProviderConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disableDefaultDrop;
- (BOOL)filterBrowsers;
- (BOOL)filterPackets;
- (BOOL)filterSockets;
- (BOOL)preserveExistingConnections;
- (NEFilterProviderConfiguration)initWithCoder:(id)a3;
- (NSData)identityReference;
- (NSData)passwordReference;
- (NSDictionary)vendorConfiguration;
- (NSString)dataProviderDesignatedRequirement;
- (NSString)filterDataProviderBundleIdentifier;
- (NSString)filterPacketProviderBundleIdentifier;
- (NSString)organization;
- (NSString)packetProviderDesignatedRequirement;
- (NSString)pluginType;
- (NSString)serverAddress;
- (NSString)username;
- (NSURL)dataProviderURL;
- (NSURL)packetProviderURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProviderDesignatedRequirement:(id)a3;
- (void)setDataProviderURL:(id)a3;
- (void)setDisableDefaultDrop:(BOOL)a3;
- (void)setFilterBrowsers:(BOOL)filterBrowsers;
- (void)setFilterDataProviderBundleIdentifier:(NSString *)filterDataProviderBundleIdentifier;
- (void)setFilterPacketProviderBundleIdentifier:(NSString *)filterPacketProviderBundleIdentifier;
- (void)setFilterPackets:(BOOL)filterPackets;
- (void)setFilterSockets:(BOOL)filterSockets;
- (void)setIdentityReference:(NSData *)identityReference;
- (void)setOrganization:(NSString *)organization;
- (void)setPacketProviderDesignatedRequirement:(id)a3;
- (void)setPacketProviderURL:(id)a3;
- (void)setPasswordReference:(NSData *)passwordReference;
- (void)setPluginType:(id)a3;
- (void)setPreserveExistingConnections:(BOOL)a3;
- (void)setServerAddress:(NSString *)serverAddress;
- (void)setUsername:(NSString *)username;
- (void)setVendorConfiguration:(NSDictionary *)vendorConfiguration;
@end

@implementation NEFilterProviderConfiguration

- (NEFilterProviderConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___NEFilterProviderConfiguration;
  v5 = -[NEFilterProviderConfiguration init](&v41, sel_init);
  if (v5)
  {
    v5->_filterBrowsers = [v4 decodeBoolForKey:@"FilterBrowsers"];
    v5->_filterPackets = [v4 decodeBoolForKey:@"FilterPackets"];
    v5->_filterSockets = [v4 decodeBoolForKey:@"FilterSockets"];
    v5->_disableDefaultDrop = [v4 decodeBoolForKey:@"DisableDefaultDrop"];
    v5->_preserveExistingConnections = [v4 decodeBoolForKey:@"PreserveExistingConnections"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"VendorConfiguration"];
    vendorConfiguration = v5->_vendorConfiguration;
    v5->_vendorConfiguration = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAddress"];
    serverAddress = v5->_serverAddress;
    v5->_serverAddress = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Username"];
    username = v5->_username;
    v5->_username = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Organization"];
    organization = v5->_organization;
    v5->_organization = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
    passwordReference = v5->_passwordReference;
    v5->_passwordReference = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataProviderDesignatedRequirement"];
    dataProviderDesignatedRequirement = v5->_dataProviderDesignatedRequirement;
    v5->_dataProviderDesignatedRequirement = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PacketProviderDesignatedRequirement"];
    packetProviderDesignatedRequirement = v5->_packetProviderDesignatedRequirement;
    v5->_packetProviderDesignatedRequirement = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataProviderURL"];
    dataProviderURL = v5->_dataProviderURL;
    v5->_dataProviderURL = (NSURL *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PacketProviderURL"];
    packetProviderURL = v5->_packetProviderURL;
    v5->_packetProviderURL = (NSURL *)v32;

    v5->_controlProviderInitialized = [v4 decodeBoolForKey:@"ControlProviderInitialized"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeychainAccessGroup"];
    keychainAccessGroup = v5->_keychainAccessGroup;
    v5->_keychainAccessGroup = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataProviderBundleIdentifier"];
    filterDataProviderBundleIdentifier = v5->_filterDataProviderBundleIdentifier;
    v5->_filterDataProviderBundleIdentifier = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PacketProviderBundleIdentifier"];
    filterPacketProviderBundleIdentifier = v5->_filterPacketProviderBundleIdentifier;
    v5->_filterPacketProviderBundleIdentifier = (NSString *)v38;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  objc_msgSend( v19,  "encodeBool:forKey:",  -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"),  @"FilterBrowsers");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"),  @"FilterPackets");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"),  @"FilterSockets");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"),  @"DisableDefaultDrop");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"),  @"PreserveExistingConnections");
  -[NEFilterProviderConfiguration vendorConfiguration](self, "vendorConfiguration");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v4 forKey:@"VendorConfiguration"];
  v5 = -[NEFilterProviderConfiguration serverAddress](self, "serverAddress");
  [v19 encodeObject:v5 forKey:@"ServerAddress"];
  v6 = -[NEFilterProviderConfiguration username](self, "username");
  [v19 encodeObject:v6 forKey:@"Username"];

  -[NEFilterProviderConfiguration organization](self, "organization");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v7 forKey:@"Organization"];

  -[NEFilterProviderConfiguration passwordReference](self, "passwordReference");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v8 forKey:@"Password"];

  -[NEFilterProviderConfiguration identityReference](self, "identityReference");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v9 forKey:@"Identity"];

  -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v10 forKey:@"PluginType"];
  v11 = -[NEFilterProviderConfiguration dataProviderDesignatedRequirement](self, "dataProviderDesignatedRequirement");
  [v19 encodeObject:v11 forKey:@"DataProviderDesignatedRequirement"];

  -[NEFilterProviderConfiguration packetProviderDesignatedRequirement](self, "packetProviderDesignatedRequirement");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v12 forKey:@"PacketProviderDesignatedRequirement"];
  v13 = -[NEFilterProviderConfiguration dataProviderURL](self, "dataProviderURL");
  [v19 encodeObject:v13 forKey:@"DataProviderURL"];

  -[NEFilterProviderConfiguration packetProviderURL](self, "packetProviderURL");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v14 forKey:@"PacketProviderURL"];

  if (self)
  {
    [v19 encodeBool:self->_controlProviderInitialized forKey:@"ControlProviderInitialized"];
    id Property = objc_getProperty(self, v15, 96LL, 1);
  }

  else
  {
    [v19 encodeBool:0 forKey:@"ControlProviderInitialized"];
    id Property = 0LL;
  }

  [v19 encodeObject:Property forKey:@"KeychainAccessGroup"];
  v17 = -[NEFilterProviderConfiguration filterDataProviderBundleIdentifier](self, "filterDataProviderBundleIdentifier");
  [v19 encodeObject:v17 forKey:@"DataProviderBundleIdentifier"];

  -[NEFilterProviderConfiguration filterPacketProviderBundleIdentifier](self, "filterPacketProviderBundleIdentifier");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 encodeObject:v18 forKey:@"PacketProviderBundleIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEFilterProviderConfiguration init]( +[NEFilterProviderConfiguration allocWithZone:]( &OBJC_CLASS___NEFilterProviderConfiguration,  "allocWithZone:",  a3),  "init");
  -[NEFilterProviderConfiguration setFilterBrowsers:]( v4,  "setFilterBrowsers:",  -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"));
  -[NEFilterProviderConfiguration setFilterPackets:]( v4,  "setFilterPackets:",  -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"));
  -[NEFilterProviderConfiguration setFilterSockets:]( v4,  "setFilterSockets:",  -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"));
  -[NEFilterProviderConfiguration setDisableDefaultDrop:]( v4,  "setDisableDefaultDrop:",  -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"));
  -[NEFilterProviderConfiguration setPreserveExistingConnections:]( v4,  "setPreserveExistingConnections:",  -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"));
  v5 = -[NEFilterProviderConfiguration vendorConfiguration](self, "vendorConfiguration");
  -[NEFilterProviderConfiguration setVendorConfiguration:](v4, "setVendorConfiguration:", v5);
  v6 = -[NEFilterProviderConfiguration serverAddress](self, "serverAddress");
  -[NEFilterProviderConfiguration setServerAddress:](v4, "setServerAddress:", v6);

  -[NEFilterProviderConfiguration username](self, "username");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setUsername:](v4, "setUsername:", v7);

  -[NEFilterProviderConfiguration organization](self, "organization");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setOrganization:](v4, "setOrganization:", v8);

  -[NEFilterProviderConfiguration passwordReference](self, "passwordReference");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setPasswordReference:](v4, "setPasswordReference:", v9);

  -[NEFilterProviderConfiguration identityReference](self, "identityReference");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setIdentityReference:](v4, "setIdentityReference:", v10);
  v11 = -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  -[NEFilterProviderConfiguration setPluginType:](v4, "setPluginType:", v11);

  -[NEFilterProviderConfiguration dataProviderDesignatedRequirement](self, "dataProviderDesignatedRequirement");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setDataProviderDesignatedRequirement:]( v4,  "setDataProviderDesignatedRequirement:",  v12);
  v13 = -[NEFilterProviderConfiguration packetProviderDesignatedRequirement](self, "packetProviderDesignatedRequirement");
  -[NEFilterProviderConfiguration setPacketProviderDesignatedRequirement:]( v4,  "setPacketProviderDesignatedRequirement:",  v13);

  -[NEFilterProviderConfiguration dataProviderURL](self, "dataProviderURL");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setDataProviderURL:](v4, "setDataProviderURL:", v14);

  -[NEFilterProviderConfiguration packetProviderURL](self, "packetProviderURL");
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setPacketProviderURL:](v4, "setPacketProviderURL:", v15);

  if (self)
  {
    BOOL controlProviderInitialized = self->_controlProviderInitialized;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  BOOL controlProviderInitialized = 0;
  if (v4) {
LABEL_3:
  }
    v4->_BOOL controlProviderInitialized = controlProviderInitialized;
LABEL_4:
  if (!self)
  {
    id Property = 0LL;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  id Property = objc_getProperty(self, v16, 96LL, 1);
  if (v4) {
LABEL_6:
  }
    objc_setProperty_atomic_copy(v4, v16, Property, 96LL);
LABEL_7:
  -[NEFilterProviderConfiguration filterDataProviderBundleIdentifier]( self,  "filterDataProviderBundleIdentifier",  Property);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setFilterDataProviderBundleIdentifier:]( v4,  "setFilterDataProviderBundleIdentifier:",  v19);

  -[NEFilterProviderConfiguration filterPacketProviderBundleIdentifier](self, "filterPacketProviderBundleIdentifier");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setFilterPacketProviderBundleIdentifier:]( v4,  "setFilterPacketProviderBundleIdentifier:",  v20);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  BOOL v6 = v5 != 0LL;

  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing plugin type", v4);
  }
  if (!-[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers")
    && !-[NEFilterProviderConfiguration filterSockets](self, "filterSockets")
    && !-[NEFilterProviderConfiguration filterPackets](self, "filterPackets"))
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"At least one of filterBrowsers, filterSockets, or filterPackets must be enabled",  v4);
    BOOL v6 = 0;
  }

  return v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"pluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEFilterProviderConfiguration dataProviderDesignatedRequirement](self, "dataProviderDesignatedRequirement");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"dataProviderDesignatedRequirement" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEFilterProviderConfiguration packetProviderDesignatedRequirement](self, "packetProviderDesignatedRequirement");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"packetProviderDesignatedRequirement" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  v11 = -[NEFilterProviderConfiguration filterDataProviderBundleIdentifier](self, "filterDataProviderBundleIdentifier");
  [v7 appendPrettyObject:v11 withName:@"dataProviderBundleIdentifier" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEFilterProviderConfiguration filterPacketProviderBundleIdentifier](self, "filterPacketProviderBundleIdentifier");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"packetProviderBundleIdentifier" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  v13 = -[NEFilterProviderConfiguration dataProviderURL](self, "dataProviderURL");
  [v7 appendPrettyObject:v13 withName:@"dataProviderURL" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEFilterProviderConfiguration packetProviderURL](self, "packetProviderURL");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"packetProviderURL" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEFilterProviderConfiguration vendorConfiguration](self, "vendorConfiguration");
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = a4 | 8;
  [v7 appendPrettyObject:v15 withName:@"vendorConfiguration" andIndent:v5 options:a4 | 8];
  v17 = -[NEFilterProviderConfiguration serverAddress](self, "serverAddress");
  a4 |= 9uLL;
  [v7 appendPrettyObject:v17 withName:@"serverAddress" andIndent:v5 options:a4];

  -[NEFilterProviderConfiguration username](self, "username");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v18 withName:@"username" andIndent:v5 options:a4];

  -[NEFilterProviderConfiguration organization](self, "organization");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v19 withName:@"organization" andIndent:v5 options:a4];

  -[NEFilterProviderConfiguration passwordReference](self, "passwordReference");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v20 withName:@"passwordReference" andIndent:v5 options:v16];
  v21 = -[NEFilterProviderConfiguration identityReference](self, "identityReference");
  [v7 appendPrettyObject:v21 withName:@"identityReference" andIndent:v5 options:v16];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"),  @"filterBrowsers",  v5,  v16);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"),  @"filterPackets",  v5,  v16);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"),  @"filterSockets",  v5,  v16);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"),  @"disableDefaultDrop",  v5,  v16);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"),  @"preserveExistingConnections",  v5,  v16);
  return v7;
}

- (BOOL)filterBrowsers
{
  return self->_filterBrowsers;
}

- (void)setFilterBrowsers:(BOOL)filterBrowsers
{
  self->_filterBrowsers = filterBrowsers;
}

- (BOOL)filterSockets
{
  return self->_filterSockets;
}

- (void)setFilterSockets:(BOOL)filterSockets
{
  self->_filterSockets = filterSockets;
}

- (BOOL)filterPackets
{
  return self->_filterPackets;
}

- (void)setFilterPackets:(BOOL)filterPackets
{
  self->_filterPackets = filterPackets;
}

- (NSDictionary)vendorConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setVendorConfiguration:(NSDictionary *)vendorConfiguration
{
}

- (NSString)serverAddress
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setServerAddress:(NSString *)serverAddress
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSString)organization
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOrganization:(NSString *)organization
{
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPasswordReference:(NSData *)passwordReference
{
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setIdentityReference:(NSData *)identityReference
{
}

- (NSString)filterDataProviderBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setFilterDataProviderBundleIdentifier:(NSString *)filterDataProviderBundleIdentifier
{
}

- (NSString)filterPacketProviderBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFilterPacketProviderBundleIdentifier:(NSString *)filterPacketProviderBundleIdentifier
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPluginType:(id)a3
{
}

- (NSString)packetProviderDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setPacketProviderDesignatedRequirement:(id)a3
{
}

- (BOOL)disableDefaultDrop
{
  return self->_disableDefaultDrop;
}

- (void)setDisableDefaultDrop:(BOOL)a3
{
  self->_disableDefaultDrop = a3;
}

- (BOOL)preserveExistingConnections
{
  return self->_preserveExistingConnections;
}

- (void)setPreserveExistingConnections:(BOOL)a3
{
  self->_preserveExistingConnections = a3;
}

- (NSURL)dataProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDataProviderURL:(id)a3
{
}

- (NSURL)packetProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setPacketProviderURL:(id)a3
{
}

- (NSString)dataProviderDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDataProviderDesignatedRequirement:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end