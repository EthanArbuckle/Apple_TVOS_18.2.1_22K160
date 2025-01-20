@interface NETunnelNetworkSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEDNSSettings)DNSSettings;
- (NEProxySettings)proxySettings;
- (NETunnelNetworkSettings)initWithCoder:(id)a3;
- (NETunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address;
- (NSString)tunnelRemoteAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDNSSettings:(NEDNSSettings *)DNSSettings;
- (void)setProxySettings:(NEProxySettings *)proxySettings;
@end

@implementation NETunnelNetworkSettings

- (NETunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address
{
  v5 = address;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NETunnelNetworkSettings;
  v6 = -[NETunnelNetworkSettings init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tunnelRemoteAddress, address);
  }

  return v7;
}

- (NETunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NETunnelNetworkSettings;
  v5 = -[NETunnelNetworkSettings init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tunnelRemoteAddress"];
    tunnelRemoteAddress = v5->_tunnelRemoteAddress;
    v5->_tunnelRemoteAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSSettings"];
    DNSSettings = v5->_DNSSettings;
    v5->_DNSSettings = (NEDNSSettings *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxySettings"];
    proxySettings = v5->_proxySettings;
    v5->_proxySettings = (NEProxySettings *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  [v4 encodeObject:v5 forKey:@"tunnelRemoteAddress"];

  -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"DNSSettings"];

  -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"proxySettings"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  uint64_t v6 = (void *)[v4 initWithTunnelRemoteAddress:v5];

  -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setDNSSettings:v7];

  -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setProxySettings:v8];

  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  if (v5)
  {
    -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unsigned int v7 = NEGetAddressFamilyFromString(v6);

    if (v7)
    {
      char v8 = 1;
      goto LABEL_7;
    }

    objc_super v9 = @"Invalid NETunnelNetworkSettings tunnelRemoteAddress";
  }

  else
  {
    objc_super v9 = @"Missing NETunnelNetworkSettings tunnelRemoteAddress";
  }

  +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v9, v4);
  char v8 = 0;
LABEL_7:
  uint64_t v10 = -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    v8 &= v13;
  }

  uint64_t v14 = -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  if (v14)
  {
    v15 = (void *)v14;
    v16 = -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
    char v17 = [v16 checkValidityAndCollectErrors:v4];

    v8 &= v17;
  }

  return v8;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NETunnelNetworkSettings tunnelRemoteAddress](self, "tunnelRemoteAddress");
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"tunnelRemoteAddress" andIndent:v5 options:a4 | 1];

  -[NETunnelNetworkSettings DNSSettings](self, "DNSSettings");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"DNSSettings" andIndent:v5 options:a4];

  -[NETunnelNetworkSettings proxySettings](self, "proxySettings");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"proxySettings" andIndent:v5 options:a4];

  return v7;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = (const __CFDictionary *)a3;
  uint64_t v5 = v4;
  if (!v4 || (uint64_t v6 = CFDICTIONARY_TYPE, CFGetTypeID(v4) != v6))
  {
    ne_log_obj();
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary is not a valid dictionary";
      goto LABEL_23;
    }

    goto LABEL_15;
  }

  unsigned int v7 = (const __CFDictionary *)NEGetValueWithType(v5, (const void *)*MEMORY[0x18960C5B0], CFDICTIONARY_TYPE);
  if (!v7)
  {
    ne_log_obj();
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary is missing a VPN dictionary";
      goto LABEL_23;
    }

- (NSString)tunnelRemoteAddress
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NEDNSSettings)DNSSettings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDNSSettings:(NEDNSSettings *)DNSSettings
{
}

- (NEProxySettings)proxySettings
{
  return (NEProxySettings *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProxySettings:(NEProxySettings *)proxySettings
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