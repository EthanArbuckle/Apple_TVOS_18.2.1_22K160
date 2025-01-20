@interface XcodeLLMDomain
+ (BOOL)supportsSecureCoding;
- (XcodeLLMDomain)init;
- (XcodeLLMDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3;
- (unint64_t)domain;
- (void)_internal_doInit;
@end

@implementation XcodeLLMDomain

- (unint64_t)domain
{
  return 123LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.xcode-llm";
}

- (void)_internal_doInit
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"Mac"));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

  -[EligibilityDomain setExternalBootInterest](self, "setExternalBootInterest");
}

- (XcodeLLMDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___XcodeLLMDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[XcodeLLMDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (XcodeLLMDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___XcodeLLMDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[XcodeLLMDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 xcodeLLMAsset]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 countryCodes]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 deviceRegionCode]);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceRegionCode]);
    unsigned int v10 = [v6 containsObject:v9];

    if (v10) {
      unint64_t v11 = 2LL;
    }
    else {
      unint64_t v11 = 3LL;
    }
  }

  else
  {
    unint64_t v11 = 3LL;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end