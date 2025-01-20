@interface PDSEHangTracer
+ (BOOL)didDisableDiagnostics;
+ (BOOL)wantsEnablement;
+ (BOOL)willEnableDiagnostics;
+ (double)timeoutDurationSec;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
+ (void)writeEnablementSettings;
@end

@implementation PDSEHangTracer

+ (id)prefixForDefaults
{
  return @"PDSEHangTracer";
}

+ (BOOL)wantsEnablement
{
  v3 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  if ([v3 isEqualToString:@"AudioAccessory"])
  {
    id v4 = sub_10000AC04();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PDSE: Enable HangTracer: TARGET_OS_TV: Excluding HomePod",  v12,  2u);
    }

    BOOL v6 = 0;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    int v8 = [v7 pdseHTPeriodDays];
    v9 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
    int v10 = sub_10000B43C(v9);
    BOOL v6 = sub_10000B19C(v8, 2, v10);
  }

  return v6;
}

+ (BOOL)willEnableDiagnostics
{
  id v3 = sub_10000AC04();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
    int v9 = 138412290;
    int v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDSE: Enable HangTracer: set necessary settings with HT's Self-Enablement prefix = %@",  (uint8_t *)&v9,  0xCu);
  }

  id v6 = sub_100009E40();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "HTSelfEnable.DisableToEnable",  " enableTelemetry=YES ",  (uint8_t *)&v9,  2u);
  }

  [a1 writeEnablementSettings];

  return 1;
}

+ (void)writeEnablementSettings
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  id v4 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerEnabled", (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  id v5 = sub_10000AC04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000C004();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  int v8 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerReportPeriod", (uint64_t)v7);
  CFPreferencesSetValue( v8,  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 3600.0),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

  id v9 = sub_10000AC04();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10000C11C();
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v12 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerDailyThirdPartyLogLimit", (uint64_t)v11);
  CFPreferencesSetValue( v12,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

  id v13 = sub_10000AC04();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10000C090();
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v16 = [v15 pdseAllowEnableTailspin];

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
    v18 = (const __CFString *)sub_100001F2C((uint64_t)@"HangTracerEnableTailspin", (uint64_t)v17);
    CFPreferencesSetValue(v18, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

    id v19 = sub_10000AC04();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10000C004();
    }
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
}

+ (BOOL)didDisableDiagnostics
{
  id v3 = sub_10000AC04();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "HTSE: Disable HTSE: disable tailspin and delete all settings with Self-Enablement prefix = %@",  buf,  0xCu);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v26 = a1;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 prefixForDefaults]);
  v7 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)v6);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(const __CFString **)(*((void *)&v27 + 1) + 8LL * (void)i);
        CFPreferencesSetValue(v13, 0LL, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        id v14 = sub_10000AC04();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v13;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "HTSE: Disable HTSE: delete setting %@",  buf,  0xCu);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v10);
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v26 prefixForDefaults]);
  v17 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = [v18 count];

  id v20 = sub_10000AC04();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v26 prefixForDefaults]);
      *(_DWORD *)buf = 138412290;
      v33 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "HTSE: Disable HTSE: some HTSE prefs with prefix %@ remain",  buf,  0xCu);
    }
  }

  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "HTSE: Disable HTSE: All prefix'ed settings were successfully deleted",  buf,  2u);
    }

    id v24 = sub_100009E40();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "HTSelfEnable.EnableToDisable",  " enableTelemetry=YES ",  buf,  2u);
    }
  }

  return v19 == 0LL;
}

+ (tailspin_config)desiredTailspinConfig
{
  uint64_t v2 = tailspin_config_create_with_default_config(a1, a2);
  id v3 = (tailspin_config *)v2;
  if (v2)
  {
    tailspin_enabled_set(v2, 1LL);
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
  return 216000.0;
}

@end