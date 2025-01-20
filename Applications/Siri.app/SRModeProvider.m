@interface SRModeProvider
- (BOOL)displayOnlyModeForInterstitialsAndErrors;
- (BOOL)userTouchedSnippet;
- (SASRequestOptions)requestOptions;
- (SRModeProvider)init;
- (unint64_t)_modeForSiriSettings;
- (unint64_t)currentMode;
- (unint64_t)internalModeOverride;
- (void)_setSystemState:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setUserTouchedSnippet:(BOOL)a3;
@end

@implementation SRModeProvider

- (SRModeProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRModeProvider;
  v2 = -[SRModeProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SRModeSystemState);
    systemState = v2->_systemState;
    v2->_systemState = v3;
  }

  return v2;
}

- (unint64_t)currentMode
{
  v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    systemState = self->_systemState;
    int v13 = 136315394;
    v14 = "-[SRModeProvider currentMode]";
    __int16 v15 = 2112;
    v16 = systemState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #modes %@", (uint8_t *)&v13, 0x16u);
  }

  unint64_t v5 = -[SRModeProvider internalModeOverride](self, "internalModeOverride");
  if (v5 == -1LL)
  {
    if (-[SRModeSystemState isVoiceTriggerRequest](self->_systemState, "isVoiceTriggerRequest")
      || !-[SRModeSystemState userTypedInSiri](self->_systemState, "userTypedInSiri")
      && !-[SRModeSystemState userTouchedSnippet](self->_systemState, "userTouchedSnippet")
      && (-[SRModeSystemState isConnectedToCarPlay](self->_systemState, "isConnectedToCarPlay")
       || -[SRModeSystemState isForCarDND](self->_systemState, "isForCarDND")
       || -[SRModeSystemState isEyesFree](self->_systemState, "isEyesFree")
       || -[SRModeSystemState isConnectedToAudioAccessory](self->_systemState, "isConnectedToAudioAccessory")
       || -[SRModeSystemState isScreenOffBeforeRequest](self->_systemState, "isScreenOffBeforeRequest")))
    {
      return 0LL;
    }

    else
    {
      return -[SRModeProvider _modeForSiriSettings](self, "_modeForSiriSettings");
    }
  }

  else
  {
    unint64_t v6 = v5;
    v7 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v8 = @"Voice";
      if (v6 == 1) {
        v8 = @"Mixed";
      }
      if (v6 == 2) {
        v9 = @"Silent";
      }
      else {
        v9 = v8;
      }
      v10 = v7;
      v11 = (SRModeSystemState *)objc_claimAutoreleasedReturnValue([@"SRMode" stringByAppendingString:v9]);
      int v13 = 136315394;
      v14 = "-[SRModeProvider currentMode]";
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s #modes Override value being used: %@",  (uint8_t *)&v13,  0x16u);
    }
  }

  return v6;
}

- (unint64_t)_modeForSiriSettings
{
  if (-[SRModeSystemState isRequestEmergencyCall](self->_systemState, "isRequestEmergencyCall")) {
    return 0LL;
  }
  unint64_t v4 = -[SRModeSystemState voiceFeedbackSetting](self->_systemState, "voiceFeedbackSetting");
  if (v4 != 1)
  {
    if (v4
      || -[SRModeSystemState isScreenOffBeforeRequest](self->_systemState, "isScreenOffBeforeRequest")
      && -[SRModeSystemState isConnectedToAudioAccessory](self->_systemState, "isConnectedToAudioAccessory"))
    {
      return 1LL;
    }

    return 2LL;
  }

  if (-[SRModeSystemState isDeviceSilentMode](self->_systemState, "isDeviceSilentMode")) {
    return 2LL;
  }
  if (-[SRModeSystemState isRequestMadeWithPhysicalDeviceInteraction]( self->_systemState,  "isRequestMadeWithPhysicalDeviceInteraction"))
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (BOOL)displayOnlyModeForInterstitialsAndErrors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFAccessibilityObserver sharedObserver](&OBJC_CLASS___AFAccessibilityObserver, "sharedObserver"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 state]);
  id v5 = [v4 isVoiceOverTouchEnabled];

  if (v5 == (id)2)
  {
    unint64_t v6 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v7 = 0;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for voiceover";
LABEL_9:
      v9 = v6;
      goto LABEL_10;
    }
  }

  else if (-[SRModeSystemState isConnectedToCarPlay](self->_systemState, "isConnectedToCarPlay") {
         || -[SRModeSystemState isForCarDND](self->_systemState, "isForCarDND")
  }
         || -[SRModeSystemState isEyesFree](self->_systemState, "isEyesFree"))
  {
    unint64_t v6 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v7 = 0;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for automotive config";
      goto LABEL_9;
    }
  }

  else
  {
    if (!-[SRModeSystemState isRequestMadeWithPhysicalDeviceInteraction]( self->_systemState,  "isRequestMadeWithPhysicalDeviceInteraction"))
    {
      unint64_t v6 = (os_log_s *)AFSiriLogContextConnection;
      BOOL v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for no screen engagement";
      goto LABEL_9;
    }

    if ((id)-[SRModeSystemState voiceFeedbackSetting](self->_systemState, "voiceFeedbackSetting") == (id)2)
    {
      unint64_t v6 = (os_log_s *)AFSiriLogContextConnection;
      BOOL v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for PreferSpokenResponses";
      goto LABEL_9;
    }

    if (-[SRModeSystemState isConnectedToAudioAccessory](self->_systemState, "isConnectedToAudioAccessory"))
    {
      unint64_t v6 = (os_log_s *)AFSiriLogContextConnection;
      BOOL v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for audio accessory connected";
      goto LABEL_9;
    }

    unsigned __int8 v11 = -[SRModeSystemState isDeviceSilentMode](self->_systemState, "isDeviceSilentMode");
    v12 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v13 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) == 0)
    {
      if (!v13) {
        goto LABEL_11;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for device not in silent mode";
      v9 = v12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
LABEL_11:
      BOOL v7 = 0;
      goto LABEL_12;
    }

    if (v13)
    {
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s #errorHandling #modes Suppressing interstitial and error TTS for DisplayOnly mode",  (uint8_t *)&v14,  0xCu);
    }

    BOOL v7 = 1;
  }

- (BOOL)userTouchedSnippet
{
  return -[SRModeSystemState userTouchedSnippet](self->_systemState, "userTouchedSnippet");
}

- (void)setUserTouchedSnippet:(BOOL)a3
{
}

- (SASRequestOptions)requestOptions
{
  return -[SRModeSystemState requestOptions](self->_systemState, "requestOptions");
}

- (void)setRequestOptions:(id)a3
{
}

- (void)_setSystemState:(id)a3
{
}

- (unint64_t)internalModeOverride
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.siri.internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v2, "stringForKey:", @"ModeOverride"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lowercaseString]);

  if (([v4 isEqualToString:@"silent"] & 1) != 0
    || ([v4 isEqualToString:@"displayonly"] & 1) != 0)
  {
    unint64_t v5 = 2LL;
  }

  else if (([v4 isEqualToString:@"mixed"] & 1) != 0 {
         || ([v4 isEqualToString:@"displayforward"] & 1) != 0)
  }
  {
    unint64_t v5 = 1LL;
  }

  else if (([v4 isEqualToString:@"voice"] & 1) != 0 {
         || ([v4 isEqualToString:@"voiceonly"] & 1) != 0
  }
         || ([v4 isEqualToString:@"voiceforward"] & 1) != 0)
  {
    unint64_t v5 = 0LL;
  }

  else
  {
    if (v4)
    {
      BOOL v7 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006A0F8((uint64_t)v4, v7);
      }
    }

    unint64_t v5 = -1LL;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end