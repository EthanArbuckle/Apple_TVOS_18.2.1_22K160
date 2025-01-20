@interface TestDomain
+ (BOOL)supportsSecureCoding;
- (TestDomain)init;
- (TestDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (id)expectedCountryCode;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation TestDomain

- (unint64_t)domain
{
  return 120LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.test";
}

- (TestDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TestDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[TestDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (TestDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TestDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[TestDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (id)expectedCountryCode
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.eligibilityd");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v2, "stringForKey:", @"ExpectedCountryCode"));

  return v3;
}

- (void)updateParameters
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TestDomain expectedCountryCode](self, "expectedCountryCode"));
  if (v3)
  {
    objc_super v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));
    -[EligibilityDomain setLocatedCountriesOfInterest:](self, "setLocatedCountriesOfInterest:", v4);
    -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);

    v3 = v5;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end