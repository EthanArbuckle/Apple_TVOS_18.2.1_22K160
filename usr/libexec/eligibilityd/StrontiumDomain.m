@interface StrontiumDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (StrontiumDomain)init;
- (StrontiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation StrontiumDomain

- (unint64_t)domain
{
  return 39LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.strontium";
}

- (void)_internal_doInit
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"iPhone",  @"iPad",  @"Mac",  0LL));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);
}

- (StrontiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___StrontiumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[StrontiumDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (StrontiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StrontiumDomain;
  id v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[StrontiumDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 strontiumAsset]);
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
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE"]);
    unsigned int v8 = [v7 unsignedIntValue];

    if (v8 != 3) {
      goto LABEL_6;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"]);
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 != 3) {
      goto LABEL_6;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"]);
    unsigned int v12 = [v11 unsignedIntValue];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"]);
    unsigned int v14 = [v13 unsignedIntValue];

    if (v12 != 2 || v14 != 2)
    {
      if (v14 != 3 && v12 == 2) {
        uint64_t v15 = 2LL;
      }
      else {
        uint64_t v15 = 4LL;
      }
    }

    else
    {
LABEL_6:
      uint64_t v15 = 2LL;
    }

    -[EligibilityDomain setAnswer:](self, "setAnswer:", v15);
    id v16 = 0LL;
  }

  else
  {
    id v17 = sub_10000C968();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      int v21 = 136315138;
      v22 = "-[StrontiumDomain computeWithError:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "%s: Failed to get status for Strontium domain",  (uint8_t *)&v21,  0xCu);
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  93LL,  0LL));
    -[EligibilityDomain setAnswer:](self, "setAnswer:", 0LL);
    if (a3)
    {
      id v16 = v16;
      *a3 = v16;
    }
  }

  return v6 != 0LL;
}

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  else {
    return 3LL;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end