@interface AppResolver
- (BOOL)appSupportsDeprecatedCallingIntents:(id)a3;
@end

@implementation AppResolver

- (BOOL)appSupportsDeprecatedCallingIntents:(id)a3
{
  id v3 = a3;
  id v18 = 0LL;
  id v4 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v18];
  id v5 = v18;
  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 compatibilityObject]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 plugInKitPlugins]);
    uint64_t v11 = INSupportedIntentsByExtensions(v10, 0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    unsigned int v13 = [v12 containsObject:INStartCallIntentIdentifier];
    if (v13)
    {
      id v14 = IntentHandlerDefaultLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100020188(v15);
      }
    }

    else if (![v12 containsObject:INStartAudioCallIntentIdentifier])
    {
      unsigned __int8 v17 = [v12 containsObject:INStartVideoCallIntentIdentifier];

      if ((v17 & 1) != 0)
      {
        char v8 = 1;
        goto LABEL_12;
      }

      goto LABEL_5;
    }

    char v8 = v13 ^ 1;

    goto LABEL_12;
  }

  id v6 = IntentHandlerDefaultLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000201C8((uint64_t)v3, (uint64_t)v5, v7);
  }

LABEL_5:
  char v8 = 0;
LABEL_12:

  return v8;
}

@end