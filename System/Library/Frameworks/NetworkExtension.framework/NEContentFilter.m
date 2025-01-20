@interface NEContentFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disableEncryptedDNSSettings;
- (BOOL)enableManualMode;
- (BOOL)isEnabled;
- (NEContentFilter)init;
- (NEContentFilter)initWithCoder:(id)a3;
- (NEFilterProviderConfiguration)provider;
- (NEPerApp)perApp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)grade;
- (void)encodeWithCoder:(id)a3;
- (void)setDisableEncryptedDNSSettings:(BOOL)a3;
- (void)setEnableManualMode:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGrade:(int64_t)a3;
- (void)setPerApp:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation NEContentFilter

- (NEContentFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEContentFilter;
  result = -[NEContentFilter init](&v3, sel_init);
  if (result) {
    result->_grade = 1LL;
  }
  return result;
}

- (NEContentFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEContentFilter init](self, "init");
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v5->_disableEncryptedDNSSettings = [v4 decodeBoolForKey:@"DisableEncryptedDNSSettings"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Provider"];
    provider = v5->_provider;
    v5->_provider = (NEFilterProviderConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PerApp"];
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v8;

    uint64_t v10 = [v4 decodeIntegerForKey:@"FilterGrade"];
    v5->_enableManualMode = [v4 decodeBoolForKey:@"EnableManualMode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEContentFilter isEnabled](self, "isEnabled"), @"Enabled");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"),  @"DisableEncryptedDNSSettings");
  v5 = -[NEContentFilter provider](self, "provider");
  [v4 encodeObject:v5 forKey:@"Provider"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NEContentFilter grade](self, "grade"), @"FilterGrade");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEContentFilter enableManualMode](self, "enableManualMode"),  @"EnableManualMode");
  -[NEContentFilter perApp](self, "perApp");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"PerApp"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEContentFilter init]( +[NEContentFilter allocWithZone:](&OBJC_CLASS___NEContentFilter, "allocWithZone:", a3),  "init");
  -[NEContentFilter setEnabled:](v4, "setEnabled:", -[NEContentFilter isEnabled](self, "isEnabled"));
  -[NEContentFilter setDisableEncryptedDNSSettings:]( v4,  "setDisableEncryptedDNSSettings:",  -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"));
  v5 = -[NEContentFilter provider](self, "provider");
  -[NEContentFilter setProvider:](v4, "setProvider:", v5);

  -[NEContentFilter setGrade:](v4, "setGrade:", -[NEContentFilter grade](self, "grade"));
  -[NEContentFilter setEnableManualMode:]( v4,  "setEnableManualMode:",  -[NEContentFilter enableManualMode](self, "enableManualMode"));
  -[NEContentFilter perApp](self, "perApp");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEContentFilter setPerApp:](v4, "setPerApp:", v6);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NEContentFilter provider](self, "provider");

  if (v5)
  {
    -[NEContentFilter provider](self, "provider");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = [v6 checkValidityAndCollectErrors:v4];
  }

  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing plugin", v4);
  }

  if (-[NEContentFilter grade](self, "grade") < 1 || -[NEContentFilter grade](self, "grade") >= 3)
  {
    id v7 = objc_alloc(NSString);
    NEResourcesCopyLocalizedNSString(@"CONTENT_FILTER_INVALID_GRADE", @"CONTENT_FILTER_INVALID_GRADE");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = objc_msgSend(v7, "initWithFormat:", v8, -[NEContentFilter grade](self, "grade"));
    [v4 addObject:v5];

    LOBYTE(v5) = 0;
  }

  uint64_t v9 = -[NEContentFilter perApp](self, "perApp");
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    v11 = -[NEContentFilter perApp](self, "perApp");
    char v12 = [v11 checkValidityAndCollectErrors:v4];

    LOBYTE(v5) = v12 & v5;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEContentFilter isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  if (-[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"),  @"disableEncryptedDNSSettings",  v5,  a4);
  }
  -[NEContentFilter provider](self, "provider");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"provider" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEContentFilter grade](self, "grade"),  @"filter-grade",  v5,  a4);
  -[NEContentFilter perApp](self, "perApp");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"per-app" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)disableEncryptedDNSSettings
{
  return self->_disableEncryptedDNSSettings;
}

- (void)setDisableEncryptedDNSSettings:(BOOL)a3
{
  self->_disableEncryptedDNSSettings = a3;
}

- (NEFilterProviderConfiguration)provider
{
  return (NEFilterProviderConfiguration *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProvider:(id)a3
{
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPerApp:(id)a3
{
}

- (int64_t)grade
{
  return self->_grade;
}

- (void)setGrade:(int64_t)a3
{
  self->_grade = a3;
}

- (BOOL)enableManualMode
{
  return self->_enableManualMode;
}

- (void)setEnableManualMode:(BOOL)a3
{
  self->_enableManualMode = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end