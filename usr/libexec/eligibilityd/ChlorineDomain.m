@interface ChlorineDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (ChlorineDomain)init;
- (ChlorineDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation ChlorineDomain

- (unint64_t)domain
{
  return 18LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.chlorine";
}

- (void)_internal_doInit
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"iPhone", @"iPad", 0LL));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);
}

- (ChlorineDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ChlorineDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[ChlorineDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (ChlorineDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ChlorineDomain;
  id v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[ChlorineDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (void)updateParameters
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 chlorineAsset]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCodes]);
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);
  -[EligibilityDomain setDeviceLocalesOfInterest:](self, "setDeviceLocalesOfInterest:", v4);
}

- (BOOL)computeWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  objc_super v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"]);
    unsigned int v8 = [v7 unsignedIntValue];

    if (v8 != 3) {
      goto LABEL_5;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"]);
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 == 3)
    {
      v11 = 0LL;
      uint64_t v12 = 4LL;
      goto LABEL_13;
    }

    if (v10 != 2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_LOCALE"]);
      unsigned int v16 = [v15 unsignedIntValue];

      v11 = 0LL;
      if (v16 == 3) {
        uint64_t v12 = 4LL;
      }
      else {
        uint64_t v12 = 2LL;
      }
    }

    else
    {
LABEL_5:
      v11 = 0LL;
      uint64_t v12 = 2LL;
    }
  }

  else
  {
    id v13 = sub_10000C968();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v18 = 136315138;
      v19 = "-[ChlorineDomain computeWithError:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "%s: Failed to get status for Chlorine domain",  (uint8_t *)&v18,  0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  93LL,  0LL));
    uint64_t v12 = 0LL;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end