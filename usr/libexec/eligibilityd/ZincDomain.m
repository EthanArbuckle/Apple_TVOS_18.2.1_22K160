@interface ZincDomain
+ (BOOL)supportsSecureCoding;
- (ZincDomain)init;
- (ZincDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation ZincDomain

- (unint64_t)domain
{
  return 31LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.zinc";
}

- (ZincDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ZincDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[ZincDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (ZincDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ZincDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[ZincDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"ko"));
  -[EligibilityDomain setDeviceLanguagesOfInterest:](self, "setDeviceLanguagesOfInterest:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"KR"));
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end