@interface ChromiumDomain
+ (BOOL)supportsSecureCoding;
- (ChromiumDomain)init;
- (ChromiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation ChromiumDomain

- (unint64_t)domain
{
  return 25LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.chromium";
}

- (void)_internal_doInit
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"iPhone"));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);
}

- (ChromiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ChromiumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[ChromiumDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (ChromiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ChromiumDomain;
  id v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[ChromiumDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 chromiumAsset]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCodes]);
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end