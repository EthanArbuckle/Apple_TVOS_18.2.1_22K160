@interface DeviceLanguageInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DeviceLanguageInput)init;
- (DeviceLanguageInput)initWithCoder:(id)a3;
- (NSArray)deviceLanguages;
- (NSString)primaryLanguage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DeviceLanguageInput

- (NSArray)deviceLanguages
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 currentUsername]);

  if (v3) {
    v4 = (void *)CFPreferencesCopyValue( @"AppleLanguages",  kCFPreferencesAnyApplication,  v3,  kCFPreferencesAnyHost);
  }
  else {
    v4 = 0LL;
  }

  return (NSArray *)v4;
}

- (NSString)primaryLanguage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale systemLanguages](&OBJC_CLASS___NSLocale, "systemLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLanguageInput deviceLanguages](self, "deviceLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v3,  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  return (NSString *)v6;
}

- (DeviceLanguageInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DeviceLanguageInput;
  return -[EligibilityInput initWithInputType:status:process:]( &v3,  "initWithInputType:status:process:",  7LL,  0LL,  @"eligibilityd");
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DeviceLanguageInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (DeviceLanguageInput)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DeviceLanguageInput;
  return -[EligibilityInput initWithCoder:](&v4, "initWithCoder:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DeviceLanguageInput;
  return -[EligibilityInput copyWithZone:](&v4, "copyWithZone:", a3);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DeviceLanguageInput;
  return -[EligibilityInput hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (DeviceLanguageInput *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DeviceLanguageInput;
  if (-[EligibilityInput isEqual:](&v8, "isEqual:", v4))
  {
    if (v4 == self)
    {
      char isKindOfClass = 1;
    }

    else
    {
      uint64_t v5 = objc_opt_class(self);
      char isKindOfClass = objc_opt_isKindOfClass(v4, v5);
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLanguageInput primaryLanguage](self, "primaryLanguage"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLanguageInput deviceLanguages](self, "deviceLanguages"));
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DeviceLanguageInput;
  id v5 = -[EligibilityInput description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[DeviceLanguageInput deviceLanguages:(%@)%@ %@]",  v3,  v4,  v6));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end