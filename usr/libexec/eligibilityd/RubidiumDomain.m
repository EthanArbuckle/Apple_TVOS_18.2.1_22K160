@interface RubidiumDomain
+ (BOOL)supportsSecureCoding;
- (RubidiumDomain)init;
- (RubidiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation RubidiumDomain

- (unint64_t)domain
{
  return 38LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.rubidium";
}

- (unint64_t)defaultAnswer
{
  return 4LL;
}

- (RubidiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RubidiumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[RubidiumDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (RubidiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RubidiumDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[RubidiumDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v6 rubidiumAsset]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 regionSKUs]);
  -[EligibilityDomain setDeviceRegionCodesOfInterest:isInverted:]( self,  "setDeviceRegionCodesOfInterest:isInverted:",  v4,  1LL);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCodes]);
  -[EligibilityDomain setDeviceLocalesOfInterest:](self, "setDeviceLocalesOfInterest:", v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end