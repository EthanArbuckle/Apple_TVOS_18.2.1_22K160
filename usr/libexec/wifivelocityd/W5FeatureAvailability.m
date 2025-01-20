@interface W5FeatureAvailability
+ (BOOL)diagnosticsModeEnabled;
+ (BOOL)isInternalBuild;
+ (id)_featureAvailabilityDefaults;
@end

@implementation W5FeatureAvailability

+ (id)_featureAvailabilityDefaults
{
  v2 = (void *)qword_1000F75C8;
  if (!qword_1000F75C8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 persistentDomainForName:@"com.apple.wifivelocity.features"]);
    v5 = (void *)qword_1000F75C8;
    qword_1000F75C8 = v4;

    v2 = (void *)qword_1000F75C8;
  }

  return v2;
}

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_content("com.apple.wifivelocity", a2);
}

+ (BOOL)diagnosticsModeEnabled
{
  unsigned __int8 v2 = +[W5FeatureAvailability isInternalBuild](&OBJC_CLASS___W5FeatureAvailability, "isInternalBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[W5FeatureAvailability _featureAvailabilityDefaults]( &OBJC_CLASS___W5FeatureAvailability,  "_featureAvailabilityDefaults"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"diagnostics-mode"]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[W5FeatureAvailability _featureAvailabilityDefaults]( &OBJC_CLASS___W5FeatureAvailability,  "_featureAvailabilityDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"diagnostics-mode"]);

    unsigned __int8 v2 = [v6 BOOLValue];
  }

  return v2;
}

@end