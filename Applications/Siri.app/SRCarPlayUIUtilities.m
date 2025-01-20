@interface SRCarPlayUIUtilities
+ (BOOL)deviceSupportsAI;
+ (BOOL)flexibleFollowupEnabled;
+ (BOOL)isJarvis;
+ (double)flexibleFollowupAdditonalDelay;
+ (id)carPlayBluetoothMACAddress;
@end

@implementation SRCarPlayUIUtilities

+ (BOOL)deviceSupportsAI
{
  return +[AFSystemAssistantExperienceStatusManager isSAEEnabled]( &OBJC_CLASS___AFSystemAssistantExperienceStatusManager,  "isSAEEnabled");
}

+ (BOOL)flexibleFollowupEnabled
{
  int v2 = _os_feature_enabled_impl("Siri", "continuous_conversation");
  if (v2) {
    LOBYTE(v2) = _os_feature_enabled_impl("CoreSpeech", "support_carplay_with_flexible_followup");
  }
  return v2;
}

+ (double)flexibleFollowupAdditonalDelay
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v2 autoDismissalIdleTimeout];
  double v4 = v3;

  return v4;
}

+ (BOOL)isJarvis
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributeForKey:AVSystemController_CarPlayAuxStreamSupportAttribute]);
  double v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (id)carPlayBluetoothMACAddress
{
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v2 = (void *)qword_1000D9AE0;
  uint64_t v27 = qword_1000D9AE0;
  if (!qword_1000D9AE0)
  {
    double v3 = (void *)sub_10000EFC0();
    int v2 = dlsym(v3, "AVSystemController_PickableRoutesAttribute");
    v25[3] = (uint64_t)v2;
    qword_1000D9AE0 = (uint64_t)v2;
  }

  _Block_object_dispose(&v24, 8);
  if (!v2)
  {
    sub_10006A058();
    goto LABEL_25;
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue([v19 attributeForKey:*v2]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v6)
  {
    v18 = &stru_1000BC638;
    goto LABEL_21;
  }

  uint64_t v7 = *(void *)v21;
  v18 = &stru_1000BC638;
LABEL_6:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v21 != v7) {
      objc_enumerationMutation(v5);
    }
    v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
    uint64_t v24 = 0LL;
    v25 = &v24;
    uint64_t v26 = 0x2020000000LL;
    v10 = (void *)qword_1000D9AF0;
    uint64_t v27 = qword_1000D9AF0;
    if (!qword_1000D9AF0)
    {
      v11 = (void *)sub_10000EFC0();
      v10 = dlsym(v11, "AVSystemController_RouteDescriptionKey_RouteName");
      v25[3] = (uint64_t)v10;
      qword_1000D9AF0 = (uint64_t)v10;
    }

    _Block_object_dispose(&v24, 8);
    if (!v10) {
      goto LABEL_24;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:*v10]);
    if ([v12 rangeOfString:@"CarPlay"] != (id)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }

    if (v6 == (id)++v8)
    {
      id v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16, v18);
      if (!v6) {
        goto LABEL_21;
      }
      goto LABEL_6;
    }
  }

  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  v13 = (void *)qword_1000D9AF8;
  uint64_t v27 = qword_1000D9AF8;
  if (!qword_1000D9AF8)
  {
    v14 = (void *)sub_10000EFC0();
    v13 = dlsym(v14, "AVSystemController_RouteDescriptionKey_RouteUID");
    v25[3] = (uint64_t)v13;
    qword_1000D9AF8 = (uint64_t)v13;
  }

  _Block_object_dispose(&v24, 8);
  if (!v13)
  {
LABEL_24:
    sub_10006A058();
LABEL_25:
    __break(1u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", *v13, v18));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsSeparatedByString:@"-"]);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:0]);

LABEL_21:
  return v18;
}

@end