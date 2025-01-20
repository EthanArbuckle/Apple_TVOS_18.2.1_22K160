@interface NEDNSProxyProviderProtocol
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEDNSProxyProviderProtocol)init;
- (NEDNSProxyProviderProtocol)initWithCoder:(id)a3;
- (NEDNSProxyProviderProtocol)initWithPluginType:(id)a3;
- (NSDictionary)providerConfiguration;
- (NSString)designatedRequirement;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDesignatedRequirement:(id)a3;
- (void)setPluginType:(id)a3;
- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier;
- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration;
@end

@implementation NEDNSProxyProviderProtocol

- (NEDNSProxyProviderProtocol)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEDNSProxyProviderProtocol;
  return -[NEVPNProtocol initWithType:](&v3, sel_initWithType_, 6LL);
}

- (NEDNSProxyProviderProtocol)initWithPluginType:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEDNSProxyProviderProtocol;
  v5 = -[NEVPNProtocol initWithType:](&v8, sel_initWithType_, 6LL);
  v6 = v5;
  if (v5) {
    -[NEDNSProxyProviderProtocol setPluginType:](v5, "setPluginType:", v4);
  }

  return v6;
}

- (NEDNSProxyProviderProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NEDNSProxyProviderProtocol;
  v5 = -[NEVPNProtocol initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEDNSProxyProviderProtocol setPluginType:](v5, "setPluginType:", v6);

    v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"ProviderConfiguration"];
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderDesignatedRequirement"];
    designatedRequirement = v5->_designatedRequirement;
    v5->_designatedRequirement = (NSString *)v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEDNSProxyProviderProtocol;
  id v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  v5 = -[NEDNSProxyProviderProtocol pluginType](self, "pluginType", v9.receiver, v9.super_class);
  [v4 encodeObject:v5 forKey:@"PluginType"];
  v6 = -[NEDNSProxyProviderProtocol providerConfiguration](self, "providerConfiguration");
  [v4 encodeObject:v6 forKey:@"ProviderConfiguration"];
  v7 = -[NEDNSProxyProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  [v4 encodeObject:v7 forKey:@"ProviderBundleIdentifier"];

  -[NEDNSProxyProviderProtocol designatedRequirement](self, "designatedRequirement");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"ProviderDesignatedRequirement"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEDNSProxyProviderProtocol;
  id v4 = -[NEVPNProtocol copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NEDNSProxyProviderProtocol pluginType](self, "pluginType");
  [v4 setPluginType:v5];
  v6 = -[NEDNSProxyProviderProtocol providerConfiguration](self, "providerConfiguration");
  [v4 setProviderConfiguration:v6];
  v7 = -[NEDNSProxyProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  [v4 setProviderBundleIdentifier:v7];

  -[NEDNSProxyProviderProtocol designatedRequirement](self, "designatedRequirement");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setDesignatedRequirement:v8];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = -[NEDNSProxyProviderProtocol pluginType](self, "pluginType");
  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing plugin type", v4);
  }

  return v5 != 0LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEDNSProxyProviderProtocol;
  -[NEVPNProtocol descriptionWithIndent:options:](&v15, sel_descriptionWithIndent_options_, v5, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v9 = (void *)[v7 initWithString:v8];

  -[NEDNSProxyProviderProtocol pluginType](self, "pluginType");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v10 withName:@"pluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NEDNSProxyProviderProtocol providerConfiguration](self, "providerConfiguration");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 8uLL;
  [v9 appendPrettyObject:v11 withName:@"providerConfiguration" andIndent:v5 options:a4];
  v12 = -[NEDNSProxyProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  [v9 appendPrettyObject:v12 withName:@"providerBundleIdentifier" andIndent:v5 options:a4];

  -[NEDNSProxyProviderProtocol designatedRequirement](self, "designatedRequirement");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v13 withName:@"designatedRequirement" andIndent:v5 options:a4];

  return v9;
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

- (void)setPluginType:(id)a3
{
}

- (NSString)designatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setDesignatedRequirement:(id)a3
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