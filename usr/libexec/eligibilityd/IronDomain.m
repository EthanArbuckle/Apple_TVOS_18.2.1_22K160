@interface IronDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (IronDomain)init;
- (IronDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation IronDomain

- (unint64_t)domain
{
  return 27LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.iron";
}

- (void)_internal_doInit
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"iPhone", @"Mac", 0LL));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);
}

- (IronDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IronDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[IronDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (IronDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IronDomain;
  id v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[IronDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 ironAsset]);
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
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"]);
    unsigned int v8 = [v7 unsignedIntValue];

    if (v8 != 3
      || (v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"]),
          unsigned int v10 = [v9 unsignedIntValue],
          v9,
          v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"]),
          unsigned int v12 = [v11 unsignedIntValue],
          v11,
          v10 == 2)
      && v12 == 2)
    {
      uint64_t v13 = 2LL;
    }

    else if (v12 != 3 && v10 == 2)
    {
      uint64_t v13 = 2LL;
    }

    else
    {
      uint64_t v13 = 4LL;
    }

    -[EligibilityDomain setAnswer:](self, "setAnswer:", v13);
    id v16 = 0LL;
  }

  else
  {
    id v14 = sub_10000C968();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v19 = 136315138;
      v20 = "-[IronDomain computeWithError:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "%s: Failed to get status for Iron domain",  (uint8_t *)&v19,  0xCu);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end