@interface NETunnelProviderProtocol
+ (BOOL)isLegacyPluginType:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (NETunnelProviderProtocol)init;
- (NETunnelProviderProtocol)initWithCoder:(id)a3;
- (NETunnelProviderProtocol)initWithPluginType:(id)a3;
- (NSDictionary)providerConfiguration;
- (NSDictionary)vendorInfo;
- (NSString)authenticationPluginType;
- (NSString)designatedRequirement;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)authenticationMethod;
- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setAuthenticationMethod:(int64_t)a3;
- (void)setAuthenticationPluginType:(id)a3;
- (void)setDesignatedRequirement:(id)a3;
- (void)setPluginType:(id)a3;
- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier;
- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration;
- (void)setVendorInfo:(id)a3;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NETunnelProviderProtocol

- (void)setPluginType:(id)a3
{
  id v11 = a3;
  if (!self->_pluginType)
  {
    v4 = (NSString *)[v11 copy];
    pluginType = self->_pluginType;
    self->_pluginType = v4;
  }
  v6 = -[NETunnelProviderProtocol pluginType](self, "pluginType");
  BOOL v7 = +[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v6);

  if (v7)
  {
    self->super._keychainDomain = 0LL;
    v9 = self;
    v10 = 0LL;
  }

  else
  {
    self->super._keychainDomain = 1LL;
    v10 = @"com.apple.managed.vpn.shared";
    v9 = self;
  }

  objc_setProperty_atomic(v9, v8, v10, 88LL);
}

- (NETunnelProviderProtocol)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  result = -[NEVPNProtocol initWithType:](&v3, sel_initWithType_, 4LL);
  if (result) {
    result->super._keychainDomain = 0LL;
  }
  return result;
}

- (NETunnelProviderProtocol)initWithPluginType:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol initWithType:](&v8, sel_initWithType_, 4LL);
  v6 = v5;
  if (v5)
  {
    -[NETunnelProviderProtocol setPluginType:](v5, "setPluginType:", v4);
    v6->_authenticationMethod = 0LL;
  }

  return v6;
}

- (NETunnelProviderProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NETunnelProviderProtocol setPluginType:](v5, "setPluginType:", v6);

    BOOL v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"VendorInfo"];
    vendorInfo = v5->_vendorInfo;
    v5->_vendorInfo = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AuthenticationPluginType"];
    authenticationPluginType = v5->_authenticationPluginType;
    v5->_authenticationPluginType = (NSString *)v15;

    v5->_authenticationMethod = (int)[v4 decodeInt32ForKey:@"AuthenticationMethod"];
    v17 = (void *)MEMORY[0x189604010];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"VendorConfiguration"];
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NEProviderBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DesignatedRequirement"];
    designatedRequirement = v5->_designatedRequirement;
    v5->_designatedRequirement = (NSString *)v27;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  id v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  v5 = -[NETunnelProviderProtocol pluginType](self, "pluginType", v11.receiver, v11.super_class);
  [v4 encodeObject:v5 forKey:@"PluginType"];
  v6 = -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  [v4 encodeObject:v6 forKey:@"VendorInfo"];

  -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"AuthenticationPluginType"];

  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"),  @"AuthenticationMethod");
  -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"VendorConfiguration"];

  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"NEProviderBundleIdentifier"];

  -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"DesignatedRequirement"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  id v4 = -[NEVPNProtocol copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NETunnelProviderProtocol pluginType](self, "pluginType");
  [v4 setPluginType:v5];
  v6 = -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  [v4 setVendorInfo:v6];

  -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setAuthenticationPluginType:v7];

  objc_msgSend( v4,  "setAuthenticationMethod:",  -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"));
  -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setProviderConfiguration:v8];

  if (self) {
    id Property = objc_getProperty(self, v9, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v12 = Property;
  if (v4) {
    objc_setProperty_atomic(v4, v11, v12, 88LL);
  }

  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setProviderBundleIdentifier:v13];
  v14 = -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  [v4 setDesignatedRequirement:v14];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  BOOL v5 = -[NEVPNProtocol checkValidityAndCollectErrors:](&v8, sel_checkValidityAndCollectErrors_, v4);
  v6 = -[NETunnelProviderProtocol pluginType](self, "pluginType");
  if (!v6)
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing plugin type", v4);
    BOOL v5 = 0;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  -[NEVPNProtocol descriptionWithIndent:options:](&v18, sel_descriptionWithIndent_options_, v5, a4);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v7 initWithString:v8];

  unint64_t v10 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  -[NETunnelProviderProtocol pluginType](self, "pluginType");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v11 withName:@"pluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v12 withName:@"vendorInfo" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v13 withName:@"authenticationPluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  objc_msgSend( v9,  "appendPrettyInt:withName:andIndent:options:",  -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"),  @"authenticationMethod",  v5,  a4 & 0xFFFFFFFFFFFFFFF7);
  v14 = -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration");
  a4 |= 8uLL;
  [v9 appendPrettyObject:v14 withName:@"providerConfiguration" andIndent:v5 options:a4];

  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v15 withName:@"providerBundleIdentifier" andIndent:v5 options:a4];

  -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v16 withName:@"designatedRequirement" andIndent:v5 options:v10];

  return v9;
}

- (id)copyLegacyDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  id v3 = -[NEVPNProtocol copyLegacyDictionary](&v12, sel_copyLegacyDictionary);
  int64_t v4 = -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod");
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = (void *)MEMORY[0x18960CBB0];
  }

  else
  {
    uint64_t v5 = (void *)MEMORY[0x18960CBB8];
  }

  [v3 setObject:*v5 forKeyedSubscript:*MEMORY[0x18960C9B8]];
LABEL_6:
  v6 = -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  if (v6)
  {
    -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C9B0]];
  }

  -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    [v3 addEntriesFromDictionary:self->_vendorInfo];
  }
  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v9 forKeyedSubscript:@"NEProviderBundleIdentifier"];

  -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKeyedSubscript:@"DesignatedRequirement"];

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  uint64_t v5 = -[NEVPNProtocol initFromLegacyDictionary:](&v24, sel_initFromLegacyDictionary_, v4);
  if (!v5) {
    goto LABEL_15;
  }
  if (initFromLegacyDictionary__initOurKeys != -1) {
    dispatch_once(&initFromLegacyDictionary__initOurKeys, &__block_literal_global_20967);
  }
  [v4 objectForKeyedSubscript:@"__NEVPNPluginType"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setPluginType:v6];

  [v4 objectForKeyedSubscript:*MEMORY[0x18960C9B8]];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v7))
  {
    if ([v7 isEqualToString:*MEMORY[0x18960CBB8]])
    {
      uint64_t v8 = 0LL;
LABEL_9:
      v5[28] = v8;
      goto LABEL_10;
    }

    if ([v7 isEqualToString:*MEMORY[0x18960CBB0]])
    {
      uint64_t v8 = 1LL;
      goto LABEL_9;
    }
  }

- (__SCNetworkInterface)createInterface
{
  v2 = (const __SCNetworkInterface *)*MEMORY[0x18960C5B8];
  -[NETunnelProviderProtocol pluginType](self, "pluginType");
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v4 = SCNetworkInterfaceCreateWithInterface(v2, v3);

  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = SCNetworkInterfaceCreateWithInterface(v4, (CFStringRef)*MEMORY[0x18960C5D8]);
  CFRelease(v4);
  return v5;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  BOOL v5 = -[NEVPNProtocol setServiceProtocolsInService:](&v14, sel_setServiceProtocolsInService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface
      && (SCNetworkInterfaceRef v7 = SCNetworkInterfaceGetInterface(Interface)) != 0LL
      && (uint64_t v8 = v7,
          -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration"),
          uint64_t v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v8) = SCNetworkInterfaceSetConfiguration(v8, v9),
          v9,
          !(_DWORD)v8))
    {
      ne_log_obj();
      unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = SCError();
        objc_super v12 = SCErrorString(v11);
        *(_DWORD *)buf = 136315394;
        objc_super v16 = "-[NETunnelProviderProtocol setServiceProtocolsInService:]";
        __int16 v17 = 2080;
        uint64_t v18 = v12;
        _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "%s: SCNetworkInterfaceSetConfiguration failed: %s",  buf,  0x16u);
      }

      LOBYTE(v5) = 0;
    }

    else
    {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  BOOL v5 = -[NEVPNProtocol updateWithServiceProtocolsFromService:](&v9, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      SCNetworkInterfaceRef v7 = SCNetworkInterfaceGetInterface(Interface);
      if (v7) {
        -[NETunnelProviderProtocol setProviderConfiguration:]( self,  "setProviderConfiguration:",  SCNetworkInterfaceGetConfiguration(v7));
      }
    }
  }

  return v5;
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  -[NEVPNProtocol copyPasswordsFromKeychainInDomain:](&v16, sel_copyPasswordsFromKeychainInDomain_);
  uint64_t v5 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  if (v5)
  {
    v6 = (void *)v5;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    SCNetworkInterfaceRef v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 domain];

    if (v8 == a3)
    {
      uint64_t v9 = -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
      if (!v9
        || (unint64_t v10 = (void *)v9,
            -[NEVPNProtocol passwordEncryption](self, "passwordEncryption"),
            int v11 = (void *)objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 isEqualToString:*MEMORY[0x18960CBA8]],
            v11,
            v10,
            (v12 & 1) == 0))
      {
        -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v14 = (void *)[v13 copyData];
        -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 setData:v14];
      }
    }
  }

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  if (a3 == 1)
  {
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem", 1LL, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if ([v7 domain] == 1)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 accessGroup];
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6) {
        return;
      }
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      [v7 setIdentifier:0];
    }

    return;
  }

  if (!a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
    -[NEVPNProtocol removeKeychainItemsInDomain:keepIdentity:]( &v8,  sel_removeKeychainItemsInDomain_keepIdentity_,  0LL,  a4);
  }

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NETunnelProviderProtocol;
  -[NEVPNProtocol syncWithKeychainInDomain:configuration:suffix:]( &v14,  sel_syncWithKeychainInDomain_configuration_suffix_,  a3,  a4,  a5);
  if (a3 == 1)
  {
    uint64_t v7 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    if (v7)
    {
      objc_super v8 = (void *)v7;
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v9 domain] == 1)
      {
        -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 persistentReference];
        if (v11)
        {
          char v12 = (void *)v11;
          -[NEVPNProtocol passwordReference](self, "passwordReference");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13) {
            return;
          }
          -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
          objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 persistentReference];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEVPNProtocol setPasswordReference:](self, "setPasswordReference:", v9);
        }

        else
        {
        }
      }
    }
  }

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 192LL, 1);
}

- (NSString)designatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setDesignatedRequirement:(id)a3
{
}

- (NSString)authenticationPluginType
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setAuthenticationPluginType:(id)a3
{
}

- (NSDictionary)vendorInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setVendorInfo:(id)a3
{
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (void).cxx_destruct
{
}

void __53__NETunnelProviderProtocol_initFromLegacyDictionary___block_invoke()
{
  v16[36] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x18960C990];
  v16[0] = *MEMORY[0x18960C988];
  v16[1] = v0;
  uint64_t v1 = *MEMORY[0x18960C9A0];
  v16[2] = *MEMORY[0x18960C998];
  v16[3] = v1;
  uint64_t v2 = *MEMORY[0x18960C9B0];
  v16[4] = *MEMORY[0x18960C9A8];
  v16[5] = v2;
  uint64_t v3 = *MEMORY[0x18960C9C0];
  v16[6] = *MEMORY[0x18960C9B8];
  v16[7] = v3;
  uint64_t v4 = *MEMORY[0x18960C9D0];
  v16[8] = *MEMORY[0x18960C9C8];
  v16[9] = v4;
  uint64_t v5 = *MEMORY[0x18960C9E0];
  v16[10] = *MEMORY[0x18960C9D8];
  v16[11] = v5;
  uint64_t v6 = *MEMORY[0x18960C9F0];
  v16[12] = *MEMORY[0x18960C9E8];
  v16[13] = v6;
  uint64_t v7 = *MEMORY[0x18960CA00];
  v16[14] = *MEMORY[0x18960C9F8];
  v16[15] = v7;
  uint64_t v8 = *MEMORY[0x18960CA10];
  v16[16] = *MEMORY[0x18960CA08];
  v16[17] = v8;
  uint64_t v9 = *MEMORY[0x18960CA20];
  v16[18] = *MEMORY[0x18960CA18];
  v16[19] = v9;
  uint64_t v10 = *MEMORY[0x18960CA38];
  v16[20] = *MEMORY[0x18960CA28];
  v16[21] = v10;
  uint64_t v11 = *MEMORY[0x18960CA98];
  v16[22] = *MEMORY[0x18960CA30];
  v16[23] = v11;
  uint64_t v12 = *MEMORY[0x18960CAA8];
  v16[24] = *MEMORY[0x18960CAA0];
  v16[25] = v12;
  uint64_t v13 = *MEMORY[0x18960CAB8];
  v16[26] = *MEMORY[0x18960CAB0];
  v16[27] = v13;
  v16[28] = *MEMORY[0x18960CAC0];
  v16[29] = @"ReassertionTimer";
  v16[30] = *MEMORY[0x18960C5A8];
  v16[31] = @"__NEVPNProtocolType";
  v16[32] = @"__NEVPNPluginType";
  v16[33] = @"__NEVPNProtocolIdentifier";
  v16[34] = @"NEProviderBundleIdentifier";
  v16[35] = @"DesignatedRequirement";
  uint64_t v14 = [MEMORY[0x189603F18] arrayWithObjects:v16 count:36];
  uint64_t v15 = (void *)initFromLegacyDictionary__nsprotocolkeys;
  initFromLegacyDictionary__nsprotocolkeys = v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isLegacyPluginType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.cisco.anyconnect.applevpn.plugin"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.ac-otc-authen.vpn.plugin"] & 1) != 0
    || ([v3 isEqualToString:@"net.juniper.sslvpn"] & 1) != 0)
  {
    char v4 = 1;
  }

  else
  {
    char v4 = [v3 hasSuffix:@".vpnplugin"];
  }

  return v4;
}

@end