@interface PDSEHangTracerThirdParty
+ (BOOL)wantsEnablement;
+ (id)prefixForDefaults;
+ (void)writeEnablementSettings;
@end

@implementation PDSEHangTracerThirdParty

+ (id)prefixForDefaults
{
  return @"PDSEHTThirdParty";
}

+ (BOOL)wantsEnablement
{
  unsigned int v3 = +[MXSourceUtilities anyClientsAvailable](&OBJC_CLASS___MXSourceUtilities, "anyClientsAvailable");
  else {
    int v4 = 0;
  }
  id v5 = sub_10000AC04();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000B750(v3, v4, v6);
  }

  id v7 = sub_10000AC04();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      int v18 = 67109120;
      unsigned int v19 = [v10 pdseHTThirdPartyPeriodDays];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDSE: PDSEHTThirdParty: log upload enabled on device, will use pdseHTThirdPartyPeriod=%i to determine wantsEnablement",  (uint8_t *)&v18,  8u);
    }

    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v11 = -[os_log_s pdseHTThirdPartyPeriodDays](v8, "pdseHTThirdPartyPeriodDays");
LABEL_14:
    int v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
    int v15 = sub_10000B43C(v14);
    BOOL v16 = sub_10000B19C(v13, 2, v15);

    goto LABEL_18;
  }

  if (v3)
  {
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      int v18 = 67109120;
      unsigned int v19 = [v12 pdseHTThirdPartyNoLogUploadPeriodDays];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDSE: PDSEHTThirdParty: log upload disabled on device and MetricKit clients enabled, will use pdseHTThirdPartyNo LogUploadPeriodDays=%i to determine wantsEnablement",  (uint8_t *)&v18,  8u);
    }

    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v11 = -[os_log_s pdseHTThirdPartyNoLogUploadPeriodDays](v8, "pdseHTThirdPartyNoLogUploadPeriodDays");
    goto LABEL_14;
  }

  if (v9)
  {
    int v18 = 67109376;
    unsigned int v19 = 0;
    __int16 v20 = 1024;
    int v21 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDSE: PDSEHTThirdParty: not enabling HT 3rd Party mode due to (enableForMetricKit=%{BOOL}d enableForLogUpload=%{BOOL}d",  (uint8_t *)&v18,  0xEu);
  }

  BOOL v16 = 0;
LABEL_18:

  return v16;
}

+ (void)writeEnablementSettings
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  int v4 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerEnabled", (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  id v5 = sub_10000AC04();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000B8F4();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v8 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerReportPeriod", (uint64_t)v7);
  CFPreferencesSetValue( v8,  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 3600.0),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

  id v9 = sub_10000AC04();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10000B980();
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v12 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerEnableTailspin", (uint64_t)v11);
  CFPreferencesSetValue(v12, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  id v13 = sub_10000AC04();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10000B8F4();
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  BOOL v16 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerFenceTrackingEnabled", (uint64_t)v15);
  CFPreferencesSetValue(v16, kCFBooleanFalse, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  id v17 = sub_10000AC04();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10000B868();
  }

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  __int16 v20 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerPercentFullSpinReports", (uint64_t)v19);
  CFPreferencesSetValue( v20,  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

  id v21 = sub_10000AC04();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_10000B7DC();
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v24 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerDailyLogLimit", (uint64_t)v23);
  CFPreferencesSetValue( v24,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

  id v25 = sub_10000AC04();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10000B7DC();
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v28 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerDailyLongLogLimit", (uint64_t)v27);
  CFPreferencesSetValue( v28,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

  id v29 = sub_10000AC04();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    sub_10000B7DC();
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
}

  ;
}

@end