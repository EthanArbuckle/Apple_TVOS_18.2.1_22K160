@interface NeonDomain
+ (BOOL)supportsSecureCoding;
- (NeonDomain)init;
- (NeonDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation NeonDomain

- (unint64_t)domain
{
  return 11LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.neon";
}

- (void)_internal_doInit
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"iPhone"));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);
}

- (NeonDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NeonDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[NeonDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (NeonDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NeonDomain;
  id v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[NeonDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 neonAsset]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCodes]);
  -[EligibilityDomain setLocatedCountriesOfInterest:](self, "setLocatedCountriesOfInterest:", v4);
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end