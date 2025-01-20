@interface PDSEHangTracerRateOnly
+ (BOOL)wantsEnablement;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
+ (void)writeEnablementSettings;
@end

@implementation PDSEHangTracerRateOnly

+ (id)prefixForDefaults
{
  return @"PDSEHTRateOnly";
}

+ (BOOL)wantsEnablement
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v4 = [v3 pdseHTRateOnlyPeriodDays];
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  int v6 = sub_10000B43C(v5);
  LOBYTE(v4) = sub_10000B19C(v4, 2, v6);

  return v4;
}

+ (void)writeEnablementSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  unsigned int v4 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerEnabled", (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  id v5 = sub_10000AC04();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000BBB0(a1);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v8 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerReportPeriod", (uint64_t)v7);
  CFPreferencesSetValue( v8,  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 3600.0),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

  id v9 = sub_10000AC04();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10000BB1C(a1);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v12 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerEnableTailspin", (uint64_t)v11);
  CFPreferencesSetValue(v12, kCFBooleanFalse, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  id v13 = sub_10000AC04();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10000BA88(a1);
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
}

+ (tailspin_config)desiredTailspinConfig
{
  return 0LL;
}

@end