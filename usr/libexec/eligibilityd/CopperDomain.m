@interface CopperDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (CopperDomain)init;
- (CopperDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
@end

@implementation CopperDomain

- (unint64_t)domain
{
  return 30LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.copper";
}

- (CopperDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CopperDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[CopperDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (CopperDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CopperDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[CopperDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (BOOL)computeWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance", a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 copperAsset]);
  else {
    uint64_t v6 = 2LL;
  }
  -[EligibilityDomain setAnswer:](self, "setAnswer:", v6);

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end