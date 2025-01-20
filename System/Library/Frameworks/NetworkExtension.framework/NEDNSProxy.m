@interface NEDNSProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (NEDNSProxy)init;
- (NEDNSProxy)initWithCoder:(id)a3;
- (NEDNSProxyProviderProtocol)protocol;
- (NEPerApp)perApp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPerApp:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation NEDNSProxy

- (NEDNSProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEDNSProxy;
  v2 = -[NEDNSProxy init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[NEDNSProxy setEnabled:](v2, "setEnabled:", 0LL);
  }
  return v3;
}

- (NEDNSProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEDNSProxy;
  objc_super v5 = -[NEDNSProxy init](&v11, sel_init);
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Protocol"];
    protocol = v5->_protocol;
    v5->_protocol = (NEDNSProxyProviderProtocol *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PerApp"];
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSProxy isEnabled](self, "isEnabled"), @"Enabled");
  -[NEDNSProxy protocol](self, "protocol");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"Protocol"];

  -[NEDNSProxy perApp](self, "perApp");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"PerApp"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEDNSProxy init](+[NEDNSProxy allocWithZone:](&OBJC_CLASS___NEDNSProxy, "allocWithZone:", a3), "init");
  -[NEDNSProxy setEnabled:](v4, "setEnabled:", -[NEDNSProxy isEnabled](self, "isEnabled"));
  -[NEDNSProxy protocol](self, "protocol");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEDNSProxy setProtocol:](v4, "setProtocol:", v5);

  -[NEDNSProxy perApp](self, "perApp");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEDNSProxy setPerApp:](v4, "setPerApp:", v6);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  -[NEDNSProxy protocol](self, "protocol");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = v5 != 0LL;

  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing protocol", v4);
  }
  uint64_t v7 = -[NEDNSProxy protocol](self, "protocol");
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = -[NEDNSProxy protocol](self, "protocol");
    char v10 = [v9 checkValidityAndCollectErrors:v4];

    if (v5) {
      char v6 = v10;
    }
    else {
      char v6 = 0;
    }
  }

  uint64_t v11 = -[NEDNSProxy perApp](self, "perApp");
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[NEDNSProxy perApp](self, "perApp");
    char v14 = [v13 checkValidityAndCollectErrors:v4];

    v6 &= v14;
  }

  return v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEDNSProxy isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  -[NEDNSProxy protocol](self, "protocol");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"protocol" andIndent:v5 options:a4];
  v9 = -[NEDNSProxy perApp](self, "perApp");
  [v7 appendPrettyObject:v9 withName:@"per-app" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEDNSProxy descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NEDNSProxyProviderProtocol)protocol
{
  return (NEDNSProxyProviderProtocol *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProtocol:(id)a3
{
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPerApp:(id)a3
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