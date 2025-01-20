@interface MolybdenumDomain
+ (BOOL)supportsSecureCoding;
- (MolybdenumDomain)init;
- (MolybdenumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation MolybdenumDomain

- (unint64_t)domain
{
  return 43LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.molybdenum";
}

- (void)_internal_doInit
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"iPhone", @"iPad", 0LL));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);
}

- (MolybdenumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MolybdenumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[MolybdenumDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (MolybdenumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MolybdenumDomain;
  id v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[MolybdenumDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"US-UT"));
  -[EligibilityDomain setInitialSetupLocationsOfInterest:isInverted:]( self,  "setInitialSetupLocationsOfInterest:isInverted:",  v3,  0LL);

  -[EligibilityDomain setAgeLimitOfInterest:isInverted:](self, "setAgeLimitOfInterest:isInverted:", &off_1000382A8, 1LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end