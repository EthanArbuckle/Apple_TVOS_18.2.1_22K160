@interface CobaltDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (CobaltDomain)init;
- (CobaltDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation CobaltDomain

- (unint64_t)domain
{
  return 28LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.cobalt";
}

- (unint64_t)defaultAnswer
{
  return 4LL;
}

- (CobaltDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CobaltDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[CobaltDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (CobaltDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CobaltDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[CobaltDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v5 cobaltAsset]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCodes]);
  -[EligibilityDomain setLocatedCountriesOfInterest:isInverted:]( self,  "setLocatedCountriesOfInterest:isInverted:",  v4,  1LL);
  -[EligibilityDomain setBillingCountriesOfInterest:isInverted:]( self,  "setBillingCountriesOfInterest:isInverted:",  v4,  1LL);
}

- (BOOL)computeWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  objc_super v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"]);
    unsigned int v8 = [v7 unsignedIntValue];

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"]);
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 != 3 && v8 == 2) {
      uint64_t v12 = 2LL;
    }
    else {
      uint64_t v12 = 4LL;
    }
    -[EligibilityDomain setAnswer:](self, "setAnswer:", v12);
    id v13 = 0LL;
  }

  else
  {
    id v14 = sub_10000C968();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "-[CobaltDomain computeWithError:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "%s: Failed to get status for Cobalt domain",  (uint8_t *)&v17,  0xCu);
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  93LL,  0LL));
    -[EligibilityDomain setAnswer:](self, "setAnswer:", 0LL);
    if (a3)
    {
      id v13 = v13;
      *a3 = v13;
    }
  }

  return v6 != 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end