@interface PDSECATailspin
+ (BOOL)didDisableDiagnostics;
+ (BOOL)wantsEnablement;
+ (BOOL)willEnableDiagnostics;
+ (double)timeoutDurationSec;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
@end

@implementation PDSECATailspin

+ (id)prefixForDefaults
{
  return @"PDSECATailspin";
}

+ (BOOL)wantsEnablement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v3 = [v2 pdseCATailspinPeriodDays];
  int v4 = sub_10000B43C(@"PDSECATailspin");
  LOBYTE(v3) = sub_10000B19C(v3, 1, v4);

  return v3;
}

+ (BOOL)willEnableDiagnostics
{
  id v2 = sub_10000AC04();
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = @"PDSECATailspin";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PDSE: Enable HangTracer: set necessary settings with CA's Self-Enablement prefix = %@",  (uint8_t *)&v8,  0xCu);
  }

  int v4 = (const __CFString *)sub_100001F2C((uint64_t)@"CATailspinEnable", (uint64_t)@"PDSECATailspin");
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  id v5 = sub_10000AC04();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000B5C8((uint64_t)@"CATailspinEnable", (uint64_t)@"PDSECATailspin");
  }

  return 1;
}

+ (BOOL)didDisableDiagnostics
{
  id v2 = (const __CFString *)sub_100001F2C((uint64_t)@"CATailspinEnable", (uint64_t)@"PDSECATailspin");
  CFPreferencesSetValue(v2, 0LL, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  id v3 = sub_10000AC04();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000B644((uint64_t)@"CATailspinEnable", (uint64_t)@"PDSECATailspin");
  }

  return 1;
}

+ (tailspin_config)desiredTailspinConfig
{
  uint64_t v2 = tailspin_config_create_with_default_config(a1, a2);
  id v3 = (tailspin_config *)v2;
  if (v2)
  {
    tailspin_enabled_set(v2, 1LL);
    tailspin_buffer_size_set(v3, 25LL);
  }

  else
  {
    id v4 = sub_10000AC04();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed to create tailspin config object",  v7,  2u);
    }
  }

  return v3;
}

+ (double)timeoutDurationSec
{
  return 129600.0;
}

@end