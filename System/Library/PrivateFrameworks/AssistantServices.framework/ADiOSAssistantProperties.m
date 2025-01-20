@interface ADiOSAssistantProperties
- (ADiOSAssistantProperties)initWithQueue:(id)a3;
- (BOOL)_getIsAllowSiriWhenLockedEnabled;
- (BOOL)_getIsAlwaysListenForHeySiriEnabled;
- (BOOL)_getIsAlwaysShowSiriCaptionsEnabled;
- (BOOL)_getIsAlwaysShowSpeechEnabled;
- (BOOL)_getIsAnnounceCallsEnabledForAnnounceProperties;
- (BOOL)_getIsAnnounceNotificationsEnabled;
- (BOOL)_getIsAtypicalSpeechEnabled;
- (BOOL)_getIsEnabledForHeadphones;
- (BOOL)_getIsPressSideButtonForSiriEnabled;
- (BOOL)_getIsShowAppsBehindSiriEnabled;
- (BOOL)_getIsSiriCapableDigitalCarKeyAvailable;
- (BOOL)_getIsVoiceOverEnabled;
- (double)_getSiriSpeechRate;
- (id)_getODDAutoSendMessageProperties;
- (id)_getODDCarPlayProperties;
- (id)_getODDHeadGestureProperties;
- (id)_getODDSiriInCallProperties;
- (id)_getODDiOSAccessibilityProperties;
- (id)_getODDiOSResponseProperties;
- (int)_getAnnounceCarPlayStatus;
- (int)_getHeySiriHangupEnablementState;
- (int)_getSiriInCallEnablementState;
- (int)_getSiriPauseTimeState;
- (int)_getVoiceFeedback;
- (int)_headGestureMappingFromGestureType:(int64_t)a3;
- (void)_getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:(id)a3;
- (void)_getODDAnnouncePropertiesWithCompletion:(id)a3;
- (void)getODDiOSAssistantPropertiesWithCompletion:(id)a3;
@end

@implementation ADiOSAssistantProperties

- (ADiOSAssistantProperties)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADiOSAssistantProperties;
  v6 = -[ADiOSAssistantProperties init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)getODDiOSAssistantPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[ADiOSAssistantProperties getODDiOSAssistantPropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  v6 = dispatch_group_create();
  id v7 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDiOSAssistantProperties);
  objc_msgSend( v7,  "setIsPressSideButtonForSiriEnabled:",  -[ADiOSAssistantProperties _getIsPressSideButtonForSiriEnabled](self, "_getIsPressSideButtonForSiriEnabled"));
  objc_msgSend( v7,  "setIsAllowSiriWhenLockedEnabled:",  -[ADiOSAssistantProperties _getIsAllowSiriWhenLockedEnabled](self, "_getIsAllowSiriWhenLockedEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADiOSAssistantProperties _getODDiOSResponseProperties](self, "_getODDiOSResponseProperties"));
  [v7 setResponse:v8];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADiOSAssistantProperties _getODDiOSAccessibilityProperties]( self,  "_getODDiOSAccessibilityProperties"));
  [v7 setAccessibility:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADiOSAssistantProperties _getODDCarPlayProperties](self, "_getODDCarPlayProperties"));
  [v7 setCarPlay:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADiOSAssistantProperties _getODDSiriInCallProperties](self, "_getODDSiriInCallProperties"));
  [v7 setSiriInCall:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADiOSAssistantProperties _getODDAutoSendMessageProperties](self, "_getODDAutoSendMessageProperties"));
  [v7 setAutoSendMessage:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADiOSAssistantProperties _getODDHeadGestureProperties](self, "_getODDHeadGestureProperties"));
  [v7 setHeadGestures:v13];

  dispatch_group_enter(v6);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10011A3DC;
  v28[3] = &unk_1004F1D50;
  id v14 = v7;
  id v29 = v14;
  v15 = v6;
  v30 = v15;
  -[ADiOSAssistantProperties _getODDAnnouncePropertiesWithCompletion:]( self,  "_getODDAnnouncePropertiesWithCompletion:",  v28);
  dispatch_group_enter(v15);
  queue = self->_queue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10011A408;
  v25[3] = &unk_1004F5AF8;
  id v17 = v14;
  id v26 = v17;
  v27 = v15;
  v18 = v15;
  +[ADDevicePropertiesUtils fetchActiveSubscriptionsWithQueue:completion:]( &OBJC_CLASS___ADDevicePropertiesUtils,  "fetchActiveSubscriptionsWithQueue:completion:",  queue,  v25);
  v19 = (dispatch_queue_s *)self->_queue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10011A434;
  v22[3] = &unk_1004FD990;
  id v23 = v17;
  id v24 = v4;
  id v20 = v17;
  id v21 = v4;
  dispatch_group_notify(v18, v19, v22);
}

- (id)_getODDiOSResponseProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDiOSResponseProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDiOSResponseProperties);
  objc_msgSend( v4,  "setIsAlwaysShowSiriCaptionsEnabled:",  -[ADiOSAssistantProperties _getIsAlwaysShowSiriCaptionsEnabled](self, "_getIsAlwaysShowSiriCaptionsEnabled"));
  objc_msgSend( v4,  "setIsAlwaysShowSpeechEnabled:",  -[ADiOSAssistantProperties _getIsAlwaysShowSpeechEnabled](self, "_getIsAlwaysShowSpeechEnabled"));
  return v4;
}

- (id)_getODDiOSAccessibilityProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDiOSAccessibilityProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDiOSAccessibilityProperties);
  objc_msgSend( v4,  "setIsShowAppsBehindSiriEnabled:",  -[ADiOSAssistantProperties _getIsShowAppsBehindSiriEnabled](self, "_getIsShowAppsBehindSiriEnabled"));
  -[ADiOSAssistantProperties _getSiriSpeechRate](self, "_getSiriSpeechRate");
  objc_msgSend(v4, "setSiriSpeechRate:");
  objc_msgSend( v4,  "setIsVoiceOverEnabled:",  -[ADiOSAssistantProperties _getIsVoiceOverEnabled](self, "_getIsVoiceOverEnabled"));
  objc_msgSend( v4,  "setIsTypeToSiriEnabled:",  -[ADiOSAssistantProperties _getIsTypeToSiriEnabled](self, "_getIsTypeToSiriEnabled"));
  objc_msgSend(v4, "setVoiceFeedback:", -[ADiOSAssistantProperties _getVoiceFeedback](self, "_getVoiceFeedback"));
  objc_msgSend( v4,  "setIsAtypicalSpeechEnabled:",  -[ADiOSAssistantProperties _getIsAtypicalSpeechEnabled](self, "_getIsAtypicalSpeechEnabled"));
  objc_msgSend( v4,  "setIsAlwaysListenForHeySiriEnabled:",  -[ADiOSAssistantProperties _getIsAlwaysListenForHeySiriEnabled](self, "_getIsAlwaysListenForHeySiriEnabled"));
  objc_msgSend( v4,  "setSiriPauseTimeState:",  -[ADiOSAssistantProperties _getSiriPauseTimeState](self, "_getSiriPauseTimeState"));
  return v4;
}

- (id)_getODDCarPlayProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDCarPlayProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDCarPlayProperties);
  objc_msgSend( v4,  "setIsShowAppsBehindSiriEnabledOnCarPlay:",  -[ADiOSAssistantProperties _getIsShowAppsBehindSiriEnabledOnCarPlay]( self,  "_getIsShowAppsBehindSiriEnabledOnCarPlay"));
  objc_msgSend( v4,  "setIsSiriCapableDigitalCarKeyAvailable:",  -[ADiOSAssistantProperties _getIsSiriCapableDigitalCarKeyAvailable](self, "_getIsSiriCapableDigitalCarKeyAvailable"));
  return v4;
}

- (id)_getODDSiriInCallProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDSiriInCallProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDSiriInCallProperties);
  objc_msgSend( v4,  "setHeySiriHangupEnablementState:",  -[ADiOSAssistantProperties _getHeySiriHangupEnablementState](self, "_getHeySiriHangupEnablementState"));
  objc_msgSend( v4,  "setSiriInCallEnablementState:",  -[ADiOSAssistantProperties _getSiriInCallEnablementState](self, "_getSiriInCallEnablementState"));
  return v4;
}

- (void)_getODDAnnouncePropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ADiOSAssistantProperties _getODDAnnouncePropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDAnnounceProperties);
  objc_msgSend( v6,  "setIsAnnounceCallsEnabled:",  -[ADiOSAssistantProperties _getIsAnnounceCallsEnabledForAnnounceProperties]( self,  "_getIsAnnounceCallsEnabledForAnnounceProperties"));
  objc_msgSend( v6,  "setIsAnnounceNotificationsEnabled:",  -[ADiOSAssistantProperties _getIsAnnounceNotificationsEnabled](self, "_getIsAnnounceNotificationsEnabled"));
  objc_msgSend( v6,  "setIsEnabledForHeadphones:",  -[ADiOSAssistantProperties _getIsEnabledForHeadphones](self, "_getIsEnabledForHeadphones"));
  objc_msgSend( v6,  "setIsProximityCardSeen:",  -[ADiOSAssistantProperties _getAnnounceIsProximityCardSeen](self, "_getAnnounceIsProximityCardSeen"));
  objc_msgSend( v6,  "setIsReplyWithoutConfirmationEnabled:",  -[ADiOSAssistantProperties _getAnnounceIsReplyWithoutConfirmationEnabled]( self,  "_getAnnounceIsReplyWithoutConfirmationEnabled"));
  objc_msgSend( v6,  "setIsCarPlayMuted:",  -[ADiOSAssistantProperties _getAnnounceIsCarPlayMuted](self, "_getAnnounceIsCarPlayMuted"));
  objc_msgSend( v6,  "setCarPlayStatus:",  -[ADiOSAssistantProperties _getAnnounceCarPlayStatus](self, "_getAnnounceCarPlayStatus"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10011A398;
  v9[3] = &unk_1004FC010;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  -[ADiOSAssistantProperties _getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:]( self,  "_getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:",  v9);
}

- (id)_getODDAutoSendMessageProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDAutoSendMessageProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDAutoSendMessageProperties);
  objc_msgSend( v4,  "setIsAutomaticallySendMessagesEnabled:",  -[ADiOSAssistantProperties _getIsAutomaticallySendMessagesEnabled](self, "_getIsAutomaticallySendMessagesEnabled"));
  objc_msgSend( v4,  "setIsEnabledForHeadphones:",  -[ADiOSAssistantProperties _getIsAutomaticallySendMessagesEnabledForHeadphones]( self,  "_getIsAutomaticallySendMessagesEnabledForHeadphones"));
  objc_msgSend( v4,  "setIsEnabledForCarPlay:",  -[ADiOSAssistantProperties _getIsAutomaticallySendMessagesEnabledForCarPlay]( self,  "_getIsAutomaticallySendMessagesEnabledForCarPlay"));
  return v4;
}

- (int)_headGestureMappingFromGestureType:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (id)_getODDHeadGestureProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    objc_super v9 = "-[ADiOSAssistantProperties _getODDHeadGestureProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v8, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDHeadGestureProperties);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storedHeadGestureConfigurationForDevice]);

  objc_msgSend(v4, "setHeadGesturesSupported:", objc_msgSend(v6, "isSupported"));
  objc_msgSend(v4, "setHeadGesturesEnabled:", objc_msgSend(v6, "isEnabled"));
  objc_msgSend( v4,  "setAcceptProceedGesture:",  -[ADiOSAssistantProperties _headGestureMappingFromGestureType:]( self,  "_headGestureMappingFromGestureType:",  objc_msgSend(v6, "acceptGesture")));
  objc_msgSend( v4,  "setDeclineDismissGesture:",  -[ADiOSAssistantProperties _headGestureMappingFromGestureType:]( self,  "_headGestureMappingFromGestureType:",  objc_msgSend(v6, "rejectGesture")));

  return v4;
}

- (BOOL)_getIsPressSideButtonForSiriEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3;
}

- (BOOL)_getIsAllowSiriWhenLockedEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  char v3 = [v2 disableAssistantWhilePasscodeLocked] ^ 1;

  return v3;
}

- (BOOL)_getIsAlwaysShowSiriCaptionsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 siriResponseShouldAlwaysPrintWithoutOverride];

  return v3;
}

- (BOOL)_getIsAlwaysShowSpeechEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 alwaysShowRecognizedSpeech];

  return v3;
}

- (BOOL)_getIsShowAppsBehindSiriEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  char v3 = [v2 alwaysObscureBackgroundContentWhenActive] ^ 1;

  return v3;
}

- (double)_getSiriSpeechRate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 siriSpeechRate]);
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)_getIsAtypicalSpeechEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 useAtypicalSpeechModel];

  return v3;
}

- (BOOL)_getIsAlwaysListenForHeySiriEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 alwaysAllowVoiceActivation];

  return v3;
}

- (int)_getSiriPauseTimeState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v3 = [v2 accessibleEndpointerThreshold];

  return +[ADiOSAssistantPropertiesUtilities getSiriPauseTimeStateFrom:]( &OBJC_CLASS___ADiOSAssistantPropertiesUtilities,  "getSiriPauseTimeStateFrom:",  v3);
}

- (BOOL)_getIsVoiceOverEnabled
{
  return _AXSVoiceOverTouchEnabled(self, a2) != 0;
}

- (BOOL)_getIsSiriCapableDigitalCarKeyAvailable
{
  v2 = objc_alloc_init(&OBJC_CLASS___PKPassLibrary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassLibrary passesOfType:](v2, "passesOfType:", 1LL));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pk_objectsPassingTest:", &stru_1004F1D90));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "passActivationState", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (int)_getHeySiriHangupEnablementState
{
  return +[ADiOSAssistantPropertiesUtilities getHangUpEnablementState]( &OBJC_CLASS___ADiOSAssistantPropertiesUtilities,  "getHangUpEnablementState");
}

- (int)_getSiriInCallEnablementState
{
  return +[ADiOSAssistantPropertiesUtilities getSiriInCallEnablementState]( &OBJC_CLASS___ADiOSAssistantPropertiesUtilities,  "getSiriInCallEnablementState");
}

- (int)_getAnnounceCarPlayStatus
{
  uint64_t v2 = _AFPreferencesAnnounceNotificationsInCarPlayType(self, a2);
  return +[ADiOSAssistantPropertiesUtilities getODDCarPlayAnnounceStatusFrom:]( &OBJC_CLASS___ADiOSAssistantPropertiesUtilities,  "getODDCarPlayAnnounceStatusFrom:",  v2);
}

- (int)_getVoiceFeedback
{
  return +[ADiOSAssistantPropertiesUtilities getVoiceFeedbackStatus]( &OBJC_CLASS___ADiOSAssistantPropertiesUtilities,  "getVoiceFeedbackStatus");
}

- (BOOL)_getIsAnnounceCallsEnabledForAnnounceProperties
{
  id v2 = objc_alloc_init(&OBJC_CLASS___TUUserConfiguration);
  BOOL v3 = [v2 announceCalls] != 0;

  return v3;
}

- (BOOL)_getIsAnnounceNotificationsEnabled
{
  id v2 = [sub_10011A228() currentNotificationSettingsCenter];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 notificationSystemSettings]);
  BOOL v5 = [v4 announcementSetting] == (id)2;

  return v5;
}

- (BOOL)_getIsEnabledForHeadphones
{
  id v2 = [sub_10011A228() currentNotificationSettingsCenter];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 notificationSystemSettings]);
  BOOL v5 = [v4 announcementHeadphonesSetting] == (id)2;

  return v5;
}

- (void)_getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end