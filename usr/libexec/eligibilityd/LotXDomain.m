@interface LotXDomain
+ (BOOL)supportsSecureCoding;
- (LotXDomain)init;
- (LotXDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation LotXDomain

- (unint64_t)domain
{
  return 1LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.lotx";
}

- (LotXDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LotXDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[LotXDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (LotXDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LotXDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[LotXDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v5 lotXAsset]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCodes]);
  -[EligibilityDomain setLocatedCountriesOfInterest:](self, "setLocatedCountriesOfInterest:", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end