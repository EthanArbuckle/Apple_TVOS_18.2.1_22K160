@interface PDSESentry
+ (BOOL)didDisableDiagnostics;
+ (BOOL)wantsEnablement;
+ (BOOL)willEnableDiagnostics;
+ (double)timeoutDurationSec;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
@end

@implementation PDSESentry

+ (id)prefixForDefaults
{
  return @"PDSESentry";
}

+ (BOOL)wantsEnablement
{
  return 0;
}

+ (BOOL)willEnableDiagnostics
{
  id v2 = sub_10000AC04();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = @"PDSESentry";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "HTSTYE: Enable HTSTYE: enable tailspin and set necessary settings with Sentry-Enablement prefix = %@",  (uint8_t *)&v8,  0xCu);
  }

  v4 = (const __CFString *)sub_100001F2C( (uint64_t)@"HangTracerEnableSignpostMonitoring",  (uint64_t)@"PDSESentry");
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  id v5 = sub_10000AC04();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000C1A8((uint64_t)@"HangTracerEnableSignpostMonitoring", (uint64_t)@"PDSESentry", v6);
  }

  return 1;
}

+ (BOOL)didDisableDiagnostics
{
  id v2 = sub_10000AC04();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = @"PDSESentry";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "HTSTYE: Disable HTSTYE: disable tailspin and delete all settings with Sentry-Enablement prefix = %@",  buf,  0xCu);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v4 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)@"PDSESentry");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(const __CFString **)(*((void *)&v23 + 1) + 8LL * (void)i);
        CFPreferencesSetValue(v10, 0LL, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        id v11 = sub_10000AC04();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v10;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "HTSTYE: Disable HTSTYE: delete setting %@",  buf,  0xCu);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v7);
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  v13 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)@"PDSESentry");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v14 count];

  id v16 = sub_10000AC04();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v29 = @"PDSESentry";
      v19 = "HTSTYE: Disable HTSTYE: some HTSTYE prefs with prefix %@ remain";
      v20 = v17;
      uint32_t v21 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
  }

  else if (v18)
  {
    *(_WORD *)buf = 0;
    v19 = "HTSTYE: Disable HTSTYE: All prefix'ed settings were successfully deleted";
    v20 = v17;
    uint32_t v21 = 2;
    goto LABEL_17;
  }

  return 1;
}

+ (tailspin_config)desiredTailspinConfig
{
  uint64_t v2 = tailspin_config_create_with_default_config(a1, a2);
  v3 = (tailspin_config *)v2;
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
      *(_WORD *)id v7 = 0;
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