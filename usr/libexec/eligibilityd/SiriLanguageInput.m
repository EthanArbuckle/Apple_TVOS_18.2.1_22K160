@interface SiriLanguageInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)language;
- (SiriLanguageInput)init;
- (SiriLanguageInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriLanguageInput

- (NSString)language
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 currentUsername]);

  if (v3) {
    v4 = (void *)CFPreferencesCopyValue( @"Session Language",  @"com.apple.assistant.backedup",  v3,  kCFPreferencesAnyHost);
  }
  else {
    v4 = 0LL;
  }

  return (NSString *)v4;
}

- (SiriLanguageInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SiriLanguageInput;
  return -[EligibilityInput initWithInputType:status:process:]( &v3,  "initWithInputType:status:process:",  10LL,  0LL,  @"eligibilityd");
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SiriLanguageInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (SiriLanguageInput)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SiriLanguageInput;
  return -[EligibilityInput initWithCoder:](&v4, "initWithCoder:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SiriLanguageInput;
  return -[EligibilityInput copyWithZone:](&v4, "copyWithZone:", a3);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SiriLanguageInput;
  return -[EligibilityInput hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (SiriLanguageInput *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SiriLanguageInput;
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
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLanguageInput language](self, "language"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SiriLanguageInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[SiriLanguageInput language:%@ %@]",  v3,  v5));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end