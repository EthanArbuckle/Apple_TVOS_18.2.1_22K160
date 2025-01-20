@interface NEDNSSettingsBundle
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (NEDNSSettings)settings;
- (NEDNSSettingsBundle)init;
- (NEDNSSettingsBundle)initWithCoder:(id)a3;
- (NSArray)onDemandRules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation NEDNSSettingsBundle

- (NEDNSSettingsBundle)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEDNSSettingsBundle;
  v2 = -[NEDNSSettingsBundle init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[NEDNSSettingsBundle setEnabled:](v2, "setEnabled:", 0LL);
  }
  return v3;
}

- (NEDNSSettingsBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEDNSSettingsBundle;
  objc_super v5 = -[NEDNSSettingsBundle init](&v15, sel_init);
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"OnDemandRules"];
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v9;

    objc_msgSend(MEMORY[0x189604010], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"Settings"];
    settings = v5->_settings;
    v5->_settings = (NEDNSSettings *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSSettingsBundle isEnabled](self, "isEnabled"), @"Enabled");
  -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"OnDemandRules"];

  -[NEDNSSettingsBundle settings](self, "settings");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"Settings"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEDNSSettingsBundle init]( +[NEDNSSettingsBundle allocWithZone:](&OBJC_CLASS___NEDNSSettingsBundle, "allocWithZone:", a3),  "init");
  -[NEDNSSettingsBundle setEnabled:](v4, "setEnabled:", -[NEDNSSettingsBundle isEnabled](self, "isEnabled"));
  -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    -[NEDNSSettingsBundle setOnDemandRules:](v4, "setOnDemandRules:", v8);
  }

  -[NEDNSSettingsBundle settings](self, "settings");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEDNSSettingsBundle setSettings:](v4, "setSettings:", v9);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = -[NEDNSSettingsBundle settings](self, "settings");

  if (v5)
  {
    -[NEDNSSettingsBundle settings](self, "settings");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = [v6 checkValidityAndCollectErrors:v4];
  }

  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing settings", v4);
  }

  -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v8 = -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules", 0LL);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = [v13 checkValidityAndCollectErrors:v4] & v5;
          }

          else
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid on demand rule object",  v4);
            LODWORD(v5) = 0;
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEDNSSettingsBundle isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  v8 = -[NEDNSSettingsBundle onDemandRules](self, "onDemandRules");
  [v7 appendPrettyObject:v8 withName:@"onDemandRules" andIndent:v5 options:a4];

  -[NEDNSSettingsBundle settings](self, "settings");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"settings" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEDNSSettingsBundle descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOnDemandRules:(id)a3
{
}

- (NEDNSSettings)settings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSettings:(id)a3
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