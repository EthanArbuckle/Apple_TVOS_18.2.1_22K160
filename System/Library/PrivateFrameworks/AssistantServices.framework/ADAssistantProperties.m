@interface ADAssistantProperties
- (BOOL)_getHasHomekitHome;
- (BOOL)_getIsAppleIntelligenceAvailable;
- (BOOL)_getIsAppleIntelligenceEnabled;
- (BOOL)_getIsAppleIntelligenceHardwareCapable;
- (BOOL)_getIsAssistantEnabled;
- (BOOL)_getIsChatGPTConfirmationAlwaysRequired;
- (BOOL)_getIsChatGPTEnabled;
- (BOOL)_getIsChatGPTSetUpPrompts;
- (BOOL)_getIsMteUploadEnabled;
- (BOOL)_getIsPreciseLocationEnabled;
- (id)_getAppleIntelligenceProperties;
- (id)_getGradingOptInStateChanges;
- (id)_getInputLocale;
- (id)_getODDHomeKitProperties;
- (id)_getODDOptInProperties;
- (id)_getODDVoiceProperties;
- (id)_getVoiceAccentWithVoiceInfo:(id)a3;
- (id)_getVoiceTriggerSettings;
- (id)getODDAssistantProperties;
- (int)_getChatGPTAccountType;
- (int)_getListenForSettings;
- (int)_getLocationAccessPermission;
- (int)_getSiriDataSharingOptInStatus;
- (int)_getVoiceGenderWithVoiceInfo:(id)a3;
- (int)_getVoiceNameWithVoiceInfo:(id)a3;
- (uint64_t)_getIsServerUserDataSyncEnabled;
@end

@implementation ADAssistantProperties

- (id)getODDAssistantProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    v12 = "-[ADAssistantProperties getODDAssistantProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v11, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDAssistantProperties);
  objc_msgSend( v4,  "setIsAssistantEnabled:",  -[ADAssistantProperties _getIsAssistantEnabled](self, "_getIsAssistantEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getInputLocale](self, "_getInputLocale"));
  [v4 setInputLocale:v5];

  objc_msgSend(v4, "setListenFor:", -[ADAssistantProperties _getListenForSettings](self, "_getListenForSettings"));
  objc_msgSend( v4,  "setIsPreciseLocationEnabled:",  -[ADAssistantProperties _getIsPreciseLocationEnabled](self, "_getIsPreciseLocationEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getODDVoiceProperties](self, "_getODDVoiceProperties"));
  [v4 setVoice:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getAppleIntelligenceProperties](self, "_getAppleIntelligenceProperties"));
  [v4 setAppleIntelligence:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getODDOptInProperties](self, "_getODDOptInProperties"));
  [v4 setOptIn:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getODDHomeKitProperties](self, "_getODDHomeKitProperties"));
  [v4 setHomeKit:v9];

  objc_msgSend( v4,  "setLocationAccessPermission:",  -[ADAssistantProperties _getLocationAccessPermission](self, "_getLocationAccessPermission"));
  return v4;
}

- (id)_getAppleIntelligenceProperties
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDAppleIntelligenceProperties);
  objc_msgSend( v3,  "setIsAppleIntelligenceEnabled:",  -[ADAssistantProperties _getIsAppleIntelligenceEnabled](self, "_getIsAppleIntelligenceEnabled"));
  objc_msgSend( v3,  "setIsAppleIntelligenceHardwareCapable:",  -[ADAssistantProperties _getIsAppleIntelligenceHardwareCapable](self, "_getIsAppleIntelligenceHardwareCapable"));
  objc_msgSend( v3,  "setIsAppleIntelligenceAvailable:",  -[ADAssistantProperties _getIsAppleIntelligenceAvailable](self, "_getIsAppleIntelligenceAvailable"));
  objc_msgSend(v3, "setIsChatGPTEnabled:", -[ADAssistantProperties _getIsChatGPTEnabled](self, "_getIsChatGPTEnabled"));
  objc_msgSend( v3,  "setIsChatGPTConfirmationAlwaysRequired:",  -[ADAssistantProperties _getIsChatGPTConfirmationAlwaysRequired](self, "_getIsChatGPTConfirmationAlwaysRequired"));
  objc_msgSend( v3,  "setChatGPTAccountType:",  -[ADAssistantProperties _getChatGPTAccountType](self, "_getChatGPTAccountType"));
  objc_msgSend( v3,  "setIsChatGPTSetUpPrompts:",  -[ADAssistantProperties _getIsChatGPTSetUpPrompts](self, "_getIsChatGPTSetUpPrompts"));
  return v3;
}

- (id)_getODDVoiceProperties
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    v10 = "-[ADAssistantProperties _getODDVoiceProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v9, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDVoiceProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 outputVoice]);

  objc_msgSend( v4,  "setGender:",  -[ADAssistantProperties _getVoiceGenderWithVoiceInfo:](self, "_getVoiceGenderWithVoiceInfo:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getVoiceAccentWithVoiceInfo:](self, "_getVoiceAccentWithVoiceInfo:", v6));
  [v4 setAccent:v7];

  objc_msgSend( v4,  "setName:",  -[ADAssistantProperties _getVoiceNameWithVoiceInfo:](self, "_getVoiceNameWithVoiceInfo:", v6));
  return v4;
}

- (id)_getODDOptInProperties
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "-[ADAssistantProperties _getODDOptInProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDOptInProperties);
  objc_msgSend( v4,  "setIsMteUploadEnabled:",  -[ADAssistantProperties _getIsMteUploadEnabled](self, "_getIsMteUploadEnabled"));
  objc_msgSend( v4,  "setDataSharingOptInStatus:",  -[ADAssistantProperties _getSiriDataSharingOptInStatus](self, "_getSiriDataSharingOptInStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getGradingOptInStateChanges](self, "_getGradingOptInStateChanges"));
  [v4 setGradingOptInStateChanges:v5];

  objc_msgSend( v4,  "setIsServerUserDataSyncEnabled:",  -[ADAssistantProperties _getIsServerUserDataSyncEnabled](self, "_getIsServerUserDataSyncEnabled"));
  return v4;
}

- (id)_getODDHomeKitProperties
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    int v7 = "-[ADAssistantProperties _getODDHomeKitProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDHomeKitProperties);
  objc_msgSend(v4, "setHasHomekitHome:", -[ADAssistantProperties _getHasHomekitHome](self, "_getHasHomekitHome"));
  return v4;
}

- (BOOL)_getIsAppleIntelligenceEnabled
{
  v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[ADAssistantProperties _getIsAppleIntelligenceEnabled]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s #ODD: 0 !AF_HAS_CLOUD_SUBSCRIPTION_FEATURES",  (uint8_t *)&v4,  0xCu);
  }

  return 0;
}

- (BOOL)_getIsAppleIntelligenceHardwareCapable
{
  int v2 = AFHasGMSCapabilityUnembargoed(self, a2);
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "-[ADAssistantProperties _getIsAppleIntelligenceHardwareCapable]";
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #ODD: %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

- (BOOL)_getIsAppleIntelligenceAvailable
{
  uint64_t v8 = 2LL;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2050000000LL;
  int v2 = (void *)qword_100577E50;
  uint64_t v12 = qword_100577E50;
  if (!qword_100577E50)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_100118FD8;
    v14 = &unk_1004FDB20;
    v15 = &v9;
    sub_100118FD8((uint64_t)buf);
    int v2 = (void *)v10[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  unsigned int v4 = [v3 shouldBeShownInSettingsReturningAvailabilityStatus:&v8];
  unsigned int v5 = +[AFSystemAssistantExperienceStatusManager isSAEEnabled]( &OBJC_CLASS___AFSystemAssistantExperienceStatusManager,  "isSAEEnabled");
  int v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[ADAssistantProperties _getIsAppleIntelligenceAvailable]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s #ODD: isAvailableInSettings=%d isSAEEnabled=%d",  buf,  0x18u);
  }

  return v4;
}

- (BOOL)_getIsChatGPTEnabled
{
  int v2 = AFMontaraRestricted(self, a2);
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315650;
    int v6 = "-[ADAssistantProperties _getIsChatGPTEnabled]";
    __int16 v7 = 1024;
    int v8 = 0;
    __int16 v9 = 1024;
    int v10 = v2 ^ 1;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s #ODD: enabled=%d allowed=%d",  (uint8_t *)&v5,  0x18u);
  }

  return 0;
}

- (BOOL)_getIsChatGPTConfirmationAlwaysRequired
{
  int v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    int v5 = "-[ADAssistantProperties _getIsChatGPTConfirmationAlwaysRequired]";
    __int16 v6 = 1024;
    int v7 = 1;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s #ODD: confirmation=%d",  (uint8_t *)&v4,  0x12u);
  }

  return 1;
}

- (int)_getChatGPTAccountType
{
  int v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    int v5 = "-[ADAssistantProperties _getChatGPTAccountType]";
    __int16 v6 = 1024;
    int v7 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s #ODD: type=%d", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (BOOL)_getIsChatGPTSetUpPrompts
{
  int v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    int v5 = "-[ADAssistantProperties _getIsChatGPTSetUpPrompts]";
    __int16 v6 = 1024;
    int v7 = 1;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s #ODD: prompt=%d", (uint8_t *)&v4, 0x12u);
  }

  return 1;
}

- (BOOL)_getIsAssistantEnabled
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3;
}

- (id)_getInputLocale
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SISchemaISOLocale);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCode]);

  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[ADAssistantPropertiesUtils SISchemaLocaleToSISchemaISOLocale:]( &OBJC_CLASS___ADAssistantPropertiesUtils,  "SISchemaLocaleToSISchemaISOLocale:",  +[SIUtilities convertLanguageCodeToSchemaLocale:]( &OBJC_CLASS___SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v4)));

    id v2 = (id)v5;
  }

  return v2;
}

- (int)_getVoiceGenderWithVoiceInfo:(id)a3
{
  return +[ADAssistantPropertiesUtils SISchemaVoiceGenderFromAFVoiceGender:]( ADAssistantPropertiesUtils,  "SISchemaVoiceGenderFromAFVoiceGender:",  [a3 gender]);
}

- (id)_getVoiceAccentWithVoiceInfo:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 languageCode]);
  id v4 = +[SIUtilities convertLanguageCodeToSchemaLocale:]( &OBJC_CLASS___SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v3);

  return +[ADAssistantPropertiesUtils SISchemaLocaleToSISchemaISOLocale:]( &OBJC_CLASS___ADAssistantPropertiesUtils,  "SISchemaLocaleToSISchemaISOLocale:",  v4);
}

- (int)_getVoiceNameWithVoiceInfo:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uppercaseString]);
    __int16 v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VOICENAME_%@",  v5));
  }

  else
  {
    __int16 v6 = @"VOICENAME_UNKNOWN";
  }

  int v7 = v6;
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_UNKNOWN") & 1) != 0)
  {
    int v8 = 0;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_AARON") & 1) != 0)
  {
    int v8 = 1;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_AIDAN") & 1) != 0)
  {
    int v8 = 2;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_AKASH") & 1) != 0)
  {
    int v8 = 3;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ALEKSEI") & 1) != 0)
  {
    int v8 = 4;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ALVA") & 1) != 0)
  {
    int v8 = 5;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_AMELIE") & 1) != 0)
  {
    int v8 = 6;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ANGEL") & 1) != 0)
  {
    int v8 = 7;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ARTHUR") & 1) != 0)
  {
    int v8 = 8;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_AXEL") & 1) != 0)
  {
    int v8 = 9;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_BEATRIZ") & 1) != 0)
  {
    int v8 = 10;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_CARMEN") & 1) != 0)
  {
    int v8 = 11;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_CARMIT") & 1) != 0)
  {
    int v8 = 12;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_CATHERINE") & 1) != 0)
  {
    int v8 = 13;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_CHENGHAN") & 1) != 0)
  {
    int v8 = 14;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_DAMAYANTI") & 1) != 0)
  {
    int v8 = 15;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_DAMON") & 1) != 0)
  {
    int v8 = 16;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_DANIEL") & 1) != 0)
  {
    int v8 = 17;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_DEDEC") & 1) != 0)
  {
    int v8 = 18;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_DEDED") & 1) != 0)
  {
    int v8 = 19;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ELIF") & 1) != 0)
  {
    int v8 = 20;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ELLEN") & 1) != 0)
  {
    int v8 = 21;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ELSE") & 1) != 0)
  {
    int v8 = 22;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ENGBC") & 1) != 0)
  {
    int v8 = 23;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ENGBD") & 1) != 0)
  {
    int v8 = 24;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_FRANCESCA") & 1) != 0)
  {
    int v8 = 25;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_GORDON") & 1) != 0)
  {
    int v8 = 26;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_HATTORI") & 1) != 0)
  {
    int v8 = 27;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_HELENA") & 1) != 0)
  {
    int v8 = 28;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_HIRO") & 1) != 0)
  {
    int v8 = 29;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_HOYIN") & 1) != 0)
  {
    int v8 = 30;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_INGRID") & 1) != 0)
  {
    int v8 = 31;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_JENS") & 1) != 0)
  {
    int v8 = 32;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_JINSOO") & 1) != 0)
  {
    int v8 = 33;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_KAAN") & 1) != 0)
  {
    int v8 = 34;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_KANYA") & 1) != 0)
  {
    int v8 = 35;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_KAYAN") & 1) != 0)
  {
    int v8 = 36;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_KLAAR") & 1) != 0)
  {
    int v8 = 37;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_LEONA") & 1) != 0)
  {
    int v8 = 38;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_LIMU") & 1) != 0)
  {
    int v8 = 39;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_LINFEI") & 1) != 0)
  {
    int v8 = 40;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_LUCIANA") & 1) != 0)
  {
    int v8 = 41;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_LUISA") & 1) != 0)
  {
    int v8 = 42;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MAEVE") & 1) != 0)
  {
    int v8 = 43;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MAGED") & 1) != 0)
  {
    int v8 = 44;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MARIE") & 1) != 0)
  {
    int v8 = 45;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MARIUS") & 1) != 0)
  {
    int v8 = 46;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MARTHA") & 1) != 0)
  {
    int v8 = 47;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MARTIN") & 1) != 0)
  {
    int v8 = 48;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MEIJIA") & 1) != 0)
  {
    int v8 = 49;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MINJI") & 1) != 0)
  {
    int v8 = 50;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MOIRA") & 1) != 0)
  {
    int v8 = 51;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_NANDO") & 1) != 0)
  {
    int v8 = 52;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_NICKY") & 1) != 0)
  {
    int v8 = 53;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_NORA") & 1) != 0)
  {
    int v8 = 54;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_OREN") & 1) != 0)
  {
    int v8 = 55;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_PAOLO") & 1) != 0)
  {
    int v8 = 56;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_PAULINA") & 1) != 0)
  {
    int v8 = 57;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_PIERRE") & 1) != 0)
  {
    int v8 = 58;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_PIETER") & 1) != 0)
  {
    int v8 = 59;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_QUINN") & 1) != 0)
  {
    int v8 = 60;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_RIYA") & 1) != 0)
  {
    int v8 = 61;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SAKURA") & 1) != 0)
  {
    int v8 = 62;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SAMER") & 1) != 0)
  {
    int v8 = 63;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SANDRA") & 1) != 0)
  {
    int v8 = 64;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SARA") & 1) != 0)
  {
    int v8 = 65;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SATU") & 1) != 0)
  {
    int v8 = 66;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SHUFEN") & 1) != 0)
  {
    int v8 = 67;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SIMONE") & 1) != 0)
  {
    int v8 = 68;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SINJI") & 1) != 0)
  {
    int v8 = 69;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SOHA") & 1) != 0)
  {
    int v8 = 70;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SOPHIE") & 1) != 0)
  {
    int v8 = 71;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_SUVI") & 1) != 0)
  {
    int v8 = 72;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_TESSA") & 1) != 0)
  {
    int v8 = 73;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_THTHA") & 1) != 0)
  {
    int v8 = 74;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_THTHB") & 1) != 0)
  {
    int v8 = 75;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_TILDE") & 1) != 0)
  {
    int v8 = 76;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_TOPI") & 1) != 0)
  {
    int v8 = 77;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_VINCENT") & 1) != 0)
  {
    int v8 = 78;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_XANDER") & 1) != 0)
  {
    int v8 = 79;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_YASMIN") & 1) != 0)
  {
    int v8 = 80;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_YELDA") & 1) != 0)
  {
    int v8 = 81;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_YELENA") & 1) != 0)
  {
    int v8 = 82;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_YUNA") & 1) != 0)
  {
    int v8 = 83;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_YUSHU") & 1) != 0)
  {
    int v8 = 84;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ZIV") & 1) != 0)
  {
    int v8 = 85;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MSMYA") & 1) != 0)
  {
    int v8 = 86;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_MSMYB") & 1) != 0)
  {
    int v8 = 87;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ZHCNC") & 1) != 0)
  {
    int v8 = 88;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_ZHCND") & 1) != 0)
  {
    int v8 = 89;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_VIVNA") & 1) != 0)
  {
    int v8 = 90;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_VIVNB") & 1) != 0)
  {
    int v8 = 91;
  }

  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_VIVNC") & 1) != 0)
  {
    int v8 = 92;
  }

  else if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"VOICENAME_VIVND"))
  {
    int v8 = 93;
  }

  else
  {
    int v8 = 0;
  }

  return v8;
}

- (BOOL)_getIsMteUploadEnabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriDataSharingSensitivityManager shared]( &OBJC_CLASS___AFSiriDataSharingSensitivityManager,  "shared"));
  char v3 = [v2 isOptedOutOfMTE] ^ 1;

  return v3;
}

- (id)_getGradingOptInStateChanges
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 siriDataSharingOptInStatusHistory]);
  id v4 = [v3 count];
  else {
    uint64_t v5 = (uint64_t)v4;
  }
  __int16 v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "ADGradingOptInStateChangesHistory";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))v2;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Fetching %lu most recent siri data sharing opt-in status change entries from preferences %@",  buf,  0x20u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", 0, v5));
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v12 = sub_1001114C0;
  v13 = sub_1001114D0;
  id v14 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001114D8;
  v10[3] = &unk_1004F1BD8;
  v10[4] = buf;
  v10[5] = v5;
  [v7 enumerateObjectsUsingBlock:v10];
  id v8 = *(id *)(*(void *)&buf[8] + 40LL);
  _Block_object_dispose(buf, 8);

  return v8;
}

- (int)_getListenForSettings
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantProperties _getVoiceTriggerSettings](self, "_getVoiceTriggerSettings"));
  int v3 = +[ADAssistantPropertiesUtils ODDSiriSchemaODDListenForFrom:]( &OBJC_CLASS___ADAssistantPropertiesUtils,  "ODDSiriSchemaODDListenForFrom:",  v2);

  return v3;
}

- (id)_getVoiceTriggerSettings
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SISchemaSiriVoiceTriggerSettings);
  [v2 setIsHeySiriTriggerPhraseEnabled:0];
  [v2 setIsJustSiriTriggerPhraseEnabled:0];
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  unsigned int v4 = [v3 voiceTriggerEnabled];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
    uint64_t v8 = 0LL;
    id v6 = [v5 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:&v8];

    if ((unint64_t)v6 <= 1)
    {
      [v2 setIsHeySiriTriggerPhraseEnabled:1];
      [v2 setIsJustSiriTriggerPhraseEnabled:v6];
    }
  }

  return v2;
}

- (BOOL)_getHasHomekitHome
{
  uint64_t v2 = AFAppleAudioDeviceConnectedInLast24Hours(self, a2);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (int)_getSiriDataSharingOptInStatus
{
  uint64_t v2 = _AFPreferencesSiriDataSharingOptInStatus(self, a2);
  return +[ADAssistantPropertiesUtils SISchemaDataSharingOptInStateFrom:]( &OBJC_CLASS___ADAssistantPropertiesUtils,  "SISchemaDataSharingOptInStateFrom:",  v2);
}

- (BOOL)_getIsPreciseLocationEnabled
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___CLLocationManager);
  uint64_t v3 = AFEffectiveSiriBundleForLocation();
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = -[CLLocationManager initWithEffectiveBundle:](v2, "initWithEffectiveBundle:", v4);

  LOBYTE(v4) = -[CLLocationManager accuracyAuthorization](v5, "accuracyAuthorization") == CLAccuracyAuthorizationFullAccuracy;
  return (char)v4;
}

- (int)_getLocationAccessPermission
{
  if (!+[CLLocationManager locationServicesEnabled](&OBJC_CLASS___CLLocationManager, "locationServicesEnabled")) {
    return 1;
  }
  uint64_t v2 = AFEffectiveSiriBundlePathForLocation();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned int v4 = +[CLLocationManager authorizationStatusForBundlePath:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundlePath:",  v3);

  if (v4 - 1 > 3) {
    return 4;
  }
  else {
    return dword_1003CA330[v4 - 1];
  }
}

- (uint64_t)_getIsServerUserDataSyncEnabled
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if ([v1 dictationIsEnabled])
  {
    id v2 = [v1 siriDataSharingOptInStatus];
    unsigned __int8 v31 = +[AFUtilitiesWrapper deviceSupportsOnDeviceDictation]( &OBJC_CLASS___AFUtilitiesWrapper,  "deviceSupportsOnDeviceDictation");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1 enabledDictationLocales]);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver]( &OBJC_CLASS___ADDictationOfflineStatusObserver,  "sharedDictationOfflineStatusObserver"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 offlineDictationStatus]);

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
    id v7 = [v6 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v7)
    {
      id v8 = v7;
      id v28 = v2;
      v29 = v1;
      v30 = v0;
      uint64_t v9 = *(void *)v33;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v11, v28, v29, v30));
          unsigned int v13 = [v12 BOOLValue];

          if (v13
            && !+[AFUtilitiesWrapper isDictationLanguageInstalledForOnDeviceDictation:offlineDictationStatus:]( &OBJC_CLASS___AFUtilitiesWrapper,  "isDictationLanguageInstalledForOnDeviceDictation:offlineDictationStatus:",  v11,  v5))
          {
            int v14 = 1;
            goto LABEL_14;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v32 objects:v46 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      int v14 = 0;
LABEL_14:
      v1 = v29;
      v0 = v30;
      id v2 = v28;
    }

    else
    {
      int v14 = 0;
    }

    unsigned int v15 = [v1 deviceHasPairedWatches];
    unsigned int v16 = [v1 deviceHasAtvOrHomepodInHome];
    v17 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v37 = "ADShouldAllowDictationOnlySync";
      __int16 v38 = 1024;
      BOOL v39 = v2 != (id)1;
      __int16 v40 = 1024;
      int v41 = v14;
      __int16 v42 = 1024;
      unsigned int v43 = v16;
      __int16 v44 = 1024;
      unsigned int v45 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s optedOut: %d, serverDictationRequired: %d, deviceHasAtvOrHomepodInHome: %d, deviceHasPairedWatch: %d",  buf,  0x24u);
    }

    char v18 = v31 ^ 1;
    if (v2 == (id)1) {
      char v18 = 1;
    }
    char v19 = v14 | v16 | v15 | v18;

    if ((v19 & 1) != 0) {
      goto LABEL_24;
    }
  }

  else
  {
  }

  id v20 = [v0 assistantIsEnabled];
  if ((v20 & 1) != 0
    || AFSupportsRemoraHost(v20, v21) && ([v0 remoraHostEnabled] & 1) != 0)
  {
LABEL_24:
    uint64_t v22 = 1LL;
    goto LABEL_28;
  }

  v23 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    unsigned int v25 = [v0 dictationIsEnabled];
    unsigned int v26 = [v0 assistantIsEnabled];
    *(_DWORD *)v46 = 136316162;
    v47 = "ADIsSyncEnabled";
    __int16 v48 = 1024;
    unsigned int v49 = v25;
    __int16 v50 = 1024;
    int v51 = 0;
    __int16 v52 = 1024;
    unsigned int v53 = v26;
    __int16 v54 = 1024;
    int v55 = 1;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Sync disallowed dictation enabled=%d, dictation only sync allowed=%d, assistant enabled=%d, assistant sync enabled=%d",  v46,  0x24u);
  }

  uint64_t v22 = 0LL;
LABEL_28:

  return v22;
}

@end