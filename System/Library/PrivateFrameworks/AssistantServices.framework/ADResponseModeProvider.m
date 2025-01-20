@interface ADResponseModeProvider
- (ADResponseModeProvider)init;
- (BOOL)_deviceUnlockSignalEnabled;
- (BOOL)_isAudioAccessoryConnected;
- (BOOL)_isDeviceSilent;
- (BOOL)_isDeviceUnlocked;
- (BOOL)_isNavigationActive;
- (BOOL)_isScreenEngaged;
- (BOOL)_isSteveNoteConnected;
- (BOOL)_isThirdPartyBTConnected;
- (BOOL)_overrideModeWhenInAmbient;
- (BOOL)_updateStickiness;
- (id)_computeModeForMacOS;
- (id)_computeModeForVisionOS;
- (id)_computeModeForWatchOS;
- (id)_computeModeForiOS;
- (id)_computeModeFortvOS;
- (id)fetchCurrentMode;
- (id)internalModeOverride:(id)a3;
- (int64_t)_isVoiceOverEnabled;
- (int64_t)_voiceFeedbackSetting;
- (void)_computeMode;
- (void)_connectedOutputDevicesDidChange:(id)a3;
- (void)_fetchConnectedAudioAccessoryState;
- (void)updateModesConfiguration:(id)a3;
@end

@implementation ADResponseModeProvider

- (ADResponseModeProvider)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ADResponseModeProvider;
  v2 = -[ADResponseModeProvider init](&v21, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.siri.mode", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.siri.systemstateaccess", v12);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemAudioContext](&OBJC_CLASS___AVOutputContext, "sharedSystemAudioContext"));
    sharedSystemAudioContext = v2->_sharedSystemAudioContext;
    v2->_sharedSystemAudioContext = (AVOutputContext *)v15;

    *(_WORD *)&v2->_isConnectedToAudioAccessory = 0;
    v2->_isConnectedToAppleBTHeadphones = 0;
    -[ADResponseModeProvider _fetchConnectedAudioAccessoryState](v2, "_fetchConnectedAudioAccessoryState");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v2 selector:"_connectedOutputDevicesDidChange:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

    v18 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  @"com.apple.springboard.ringerstate",  1LL,  v2->_accessQueue,  0LL);
    ringerStateObserver = v2->_ringerStateObserver;
    v2->_ringerStateObserver = v18;

    *(_DWORD *)&v2->_previousScreenOnState = 0;
    v2->_previousDeviceMotion = 0LL;
  }

  return v2;
}

- (void)updateModesConfiguration:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  dispatch_queue_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  dispatch_queue_attr_t v9 = sub_100059C70;
  v10 = &unk_1004FD968;
  dispatch_queue_attr_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(queue, &v7);
  -[ADResponseModeProvider _computeMode](self, "_computeMode", v7, v8, v9, v10, v11);
}

- (id)fetchCurrentMode
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100059B7C;
  dispatch_queue_attr_t v11 = sub_100059B8C;
  id v12 = SAUIResponseModeDisplayForwardValue;
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100059B94;
  v6[3] = &unk_1004FCDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_isDeviceSilent
{
  dispatch_queue_attr_t v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    ringerStateObserver = self->_ringerStateObserver;
    dispatch_queue_attr_t v5 = v3;
    int v7 = 136315394;
    uint64_t v8 = "-[ADResponseModeProvider _isDeviceSilent]";
    __int16 v9 = 2048;
    id v10 = -[AFNotifyObserver state](ringerStateObserver, "state");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s #modes Device RingerSwitchState : %ld",  (uint8_t *)&v7,  0x16u);
  }

  return -[AFNotifyObserver state](self->_ringerStateObserver, "state") == 0LL;
}

- (BOOL)_isSteveNoteConnected
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
  unsigned int v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"TetheredDemoMode");
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v5 = @"notConnected";
    if (v3) {
      dispatch_queue_attr_t v5 = @"Connected";
    }
    int v7 = 136315394;
    uint64_t v8 = "-[ADResponseModeProvider _isSteveNoteConnected]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s #modes Steve Note is = %@",  (uint8_t *)&v7,  0x16u);
  }

  return v3;
}

- (BOOL)_isAudioAccessoryConnected
{
  if (-[ADResponseModeProvider _isSteveNoteConnected](self, "_isSteveNoteConnected"))
  {
    unsigned int v3 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v6 = 136315138;
      int v7 = "-[ADResponseModeProvider _isAudioAccessoryConnected]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s #modes Steve Note is connected, ignoring AudioAccessoryConnected detection for Steve Note",  (uint8_t *)&v6,  0xCu);
      LOBYTE(v4) = 0;
    }
  }

  else
  {
    LOBYTE(v4) = self->_isConnectedToAudioAccessory;
  }

  return v4;
}

- (BOOL)_isThirdPartyBTConnected
{
  return self->_isConnectedToThirdPartyBT;
}

- (BOOL)_overrideModeWhenInAmbient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v3 = [v2 overrideModeWhileInAmbient];

  BOOL v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v5 = @"NO";
    if (v3) {
      dispatch_queue_attr_t v5 = @"YES";
    }
    int v7 = 136315394;
    uint64_t v8 = "-[ADResponseModeProvider _overrideModeWhenInAmbient]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s #modes Override Mode When In Ambient: %@",  (uint8_t *)&v7,  0x16u);
  }

  return v3;
}

- (BOOL)_deviceUnlockSignalEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v3 = [v2 deviceUnlockSignalEnabled];

  BOOL v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_attr_t v5 = @"NO";
    if (v3) {
      dispatch_queue_attr_t v5 = @"YES";
    }
    int v7 = 136315394;
    uint64_t v8 = "-[ADResponseModeProvider _deviceUnlockSignalEnabled]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #modes Turn on Unlock Signal: %@",  (uint8_t *)&v7,  0x16u);
  }

  return v3;
}

- (int64_t)_voiceFeedbackSetting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unint64_t v3 = (unint64_t)[v2 useDeviceSpeakerForTTS];
  if (v3 > 3) {
    int64_t v4 = 2LL;
  }
  else {
    int64_t v4 = qword_1003C9D90[v3];
  }

  return v4;
}

- (BOOL)_isDeviceUnlocked
{
  unsigned int v2 = -[AFModesConfiguration isDeviceUnlocked](self->_currentModesConfiguration, "isDeviceUnlocked");
  unint64_t v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int64_t v4 = @"LOCKED";
    if (v2) {
      int64_t v4 = @"UNLOCKED";
    }
    int v6 = 136315394;
    int v7 = "-[ADResponseModeProvider _isDeviceUnlocked]";
    __int16 v8 = 2112;
    __int16 v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s #modes Unlocked/Lock State: %@",  (uint8_t *)&v6,  0x16u);
  }

  return v2;
}

- (BOOL)_isScreenEngaged
{
  if ((-[AFModesConfiguration isRequestMadeWithPhysicalDeviceInteraction]( self->_currentModesConfiguration,  "isRequestMadeWithPhysicalDeviceInteraction") & 1) != 0 || -[AFModesConfiguration liftToWakeDetected](self->_currentModesConfiguration, "liftToWakeDetected"))
  {
    unint64_t v3 = (void *)AFSiriLogContextConnection;
    LOBYTE(v4) = 1;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      currentModesConfiguration = self->_currentModesConfiguration;
      int v6 = v3;
      if (-[AFModesConfiguration isRequestMadeWithPhysicalDeviceInteraction]( currentModesConfiguration,  "isRequestMadeWithPhysicalDeviceInteraction")) {
        int v7 = @"YES";
      }
      else {
        int v7 = @"NO";
      }
      unsigned int v8 = -[AFModesConfiguration liftToWakeDetected]( self->_currentModesConfiguration,  "liftToWakeDetected");
      int v21 = 136315650;
      v22 = "-[ADResponseModeProvider _isScreenEngaged]";
      if (v8) {
        __int16 v9 = @"YES";
      }
      else {
        __int16 v9 = @"NO";
      }
      __int16 v23 = 2112;
      v24 = v7;
      __int16 v25 = 2112;
      v26 = v9;
      LOBYTE(v4) = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s #modes ScreenEngagement - Device Invocation = %@, liftToWakeDetected = %@",  (uint8_t *)&v21,  0x20u);
    }

    return v4;
  }

  if ((-[AFModesConfiguration isDeviceScreenON](self->_currentModesConfiguration, "isDeviceScreenON") & 1) == 0)
  {
    dispatch_queue_attr_t v11 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      v22 = "-[ADResponseModeProvider _isScreenEngaged]";
      id v12 = "%s #modes ScreenEngagement - Device Screen is off";
LABEL_20:
      dispatch_queue_t v13 = v11;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v21, 0xCu);
    }

- (BOOL)_updateStickiness
{
  if ((-[AFModesConfiguration isSiriAutoPrompt](self->_currentModesConfiguration, "isSiriAutoPrompt") & 1) == 0
    && !-[AFModesConfiguration isFlexibleFollowup](self->_currentModesConfiguration, "isFlexibleFollowup"))
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }

  unint64_t v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    currentModesConfiguration = self->_currentModesConfiguration;
    dispatch_queue_attr_t v5 = v3;
    unsigned int v6 = -[AFModesConfiguration isSiriAutoPrompt](currentModesConfiguration, "isSiriAutoPrompt");
    int v7 = @"FlexibleFollowup";
    if (v6) {
      int v7 = @"SiriAutoPrompt";
    }
    int v13 = 136315394;
    v14 = "-[ADResponseModeProvider _updateStickiness]";
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s #modes Checking screenEngagement stickiness for %@",  (uint8_t *)&v13,  0x16u);
  }

  if ((-[AFModesConfiguration isRequestMadeWithPhysicalDeviceInteraction]( self->_currentModesConfiguration,  "isRequestMadeWithPhysicalDeviceInteraction") & 1) != 0 || (id previousDeviceMotion = (id)self->_previousDeviceMotion,  previousDeviceMotion != -[AFModesConfiguration deviceMotion](self->_currentModesConfiguration, "deviceMotion"))
    || (int previousScreenOnState = self->_previousScreenOnState,
        previousScreenOnState != -[AFModesConfiguration isDeviceScreenON]( self->_currentModesConfiguration,  "isDeviceScreenON")))
  {
    dispatch_queue_attr_t v11 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      v14 = "-[ADResponseModeProvider _updateStickiness]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #modes Will compute new value for screen engagement as we detected ReInvocation OR CoreMotion change OR Wake/ Sleep state change for multiturn or Flexible Followup",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_13;
  }

  BOOL v10 = 1;
LABEL_14:
  self->_id previousDeviceMotion = (int64_t)-[AFModesConfiguration deviceMotion]( self->_currentModesConfiguration,  "deviceMotion");
  self->_int previousScreenOnState = -[AFModesConfiguration isDeviceScreenON]( self->_currentModesConfiguration,  "isDeviceScreenON");
  return v10;
}

- (BOOL)_isNavigationActive
{
  return 0;
}

- (int64_t)_isVoiceOverEnabled
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFAccessibilityObserver sharedObserver](&OBJC_CLASS___AFAccessibilityObserver, "sharedObserver"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);
  id v4 = [v3 isVoiceOverTouchEnabled];

  return (int64_t)v4;
}

- (void)_computeMode
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059A54;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_computeModeForVisionOS
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFModesConfiguration modeOverrideValue](self->_currentModesConfiguration, "modeOverrideValue"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADResponseModeProvider internalModeOverride:](self, "internalModeOverride:", v3));

  if (v4 == @"None")
  {
    if ((id)-[ADResponseModeProvider _isVoiceOverEnabled](self, "_isVoiceOverEnabled") == (id)2)
    {
      unsigned int v8 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315138;
        v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s #modes VoiceOver is Enabled",  (uint8_t *)&v15,  0xCu);
      }

      __int16 v9 = (void **)&SAUIResponseModeVoiceForwardValue;
    }

    else
    {
      int64_t v10 = -[ADResponseModeProvider _voiceFeedbackSetting](self, "_voiceFeedbackSetting");
      dispatch_queue_attr_t v11 = (os_log_s *)AFSiriLogContextConnection;
      BOOL v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
      if (v10 == 3)
      {
        if (v12)
        {
          int v15 = 136315138;
          v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #modes PreferSpokenResponses",  (uint8_t *)&v15,  0xCu);
        }

        __int16 v9 = (void **)&SAUIResponseModeDisplayForwardValue;
      }

      else
      {
        if (v12)
        {
          int v15 = 136315138;
          v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #modes Defaulting to DisplayOnly for Device",  (uint8_t *)&v15,  0xCu);
        }

        __int16 v9 = (void **)&SAUIResponseModeDisplayOnlyValue;
      }
    }

    int v7 = *v9;
  }

  else
  {
    dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    int v7 = v4;
    if (v6)
    {
      int v15 = 136315394;
      v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
      __int16 v17 = 2112;
      v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s #modes Override value being used: %@",  (uint8_t *)&v15,  0x16u);
      int v7 = v4;
    }
  }

  id v13 = v7;

  return v13;
}

- (id)_computeModeForiOS
{
  unsigned int v3 = -[ADResponseModeProvider _updateStickiness](self, "_updateStickiness");
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v5 = @"Not Sticky";
    if (v3) {
      dispatch_queue_attr_t v5 = @"Sticky";
    }
    int v30 = 136315394;
    v31 = "-[ADResponseModeProvider _computeModeForiOS]";
    __int16 v32 = 2112;
    v33 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s #modes Stickiness is %@",  (uint8_t *)&v30,  0x16u);
  }

  if (v3) {
    unsigned int previousScreenEngagement = self->_previousScreenEngagement;
  }
  else {
    unsigned int previousScreenEngagement = -[ADResponseModeProvider _isScreenEngaged](self, "_isScreenEngaged");
  }
  self->_unsigned int previousScreenEngagement = previousScreenEngagement;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFModesConfiguration modeOverrideValue](self->_currentModesConfiguration, "modeOverrideValue"));
  unsigned int v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADResponseModeProvider internalModeOverride:](self, "internalModeOverride:", v7));

  if (v8 == @"None")
  {
    if (-[AFModesConfiguration userTypedInSiri](self->_currentModesConfiguration, "userTypedInSiri"))
    {
      BOOL v12 = (os_log_s *)AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
LABEL_16:
        v16 = (void **)&SAUIResponseModeDisplayOnlyValue;
LABEL_26:
        dispatch_queue_attr_t v11 = *v16;
        goto LABEL_27;
      }

      int v30 = 136315138;
      v31 = "-[ADResponseModeProvider _computeModeForiOS]";
      id v13 = "%s #modes User typed in Siri";
      goto LABEL_14;
    }

    if ((id)-[ADResponseModeProvider _isVoiceOverEnabled](self, "_isVoiceOverEnabled") == (id)2)
    {
      __int16 v17 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        v18 = "%s #modes VoiceOver is Enabled";
LABEL_23:
        unsigned int v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_INFO;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, (uint8_t *)&v30, 0xCu);
        goto LABEL_25;
      }

      goto LABEL_25;
    }

    if (-[AFModesConfiguration isConnectedToCarPlay]( self->_currentModesConfiguration,  "isConnectedToCarPlay"))
    {
      __int16 v17 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        v18 = "%s #modes Connected to Carplay";
        goto LABEL_23;
      }

- (id)_computeModeForWatchOS
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFModesConfiguration modeOverrideValue](self->_currentModesConfiguration, "modeOverrideValue"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADResponseModeProvider internalModeOverride:](self, "internalModeOverride:", v3));

  if (v4 == @"None")
  {
    if (-[AFModesConfiguration isUIFree](self->_currentModesConfiguration, "isUIFree"))
    {
      unsigned int v8 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        __int16 v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
        __int16 v9 = "%s #modes UIFree session (likely Announce)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v22, 0xCu);
        goto LABEL_11;
      }

      goto LABEL_11;
    }

    if (-[ADResponseModeProvider _isAudioAccessoryConnected](self, "_isAudioAccessoryConnected"))
    {
      unsigned int v8 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        __int16 v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
        __int16 v9 = "%s #modes Audio accessory connected";
        goto LABEL_10;
      }

- (id)_computeModeForMacOS
{
  unsigned int v3 = -[ADResponseModeProvider _updateStickiness](self, "_updateStickiness");
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v5 = @"Not Sticky";
    if (v3) {
      dispatch_queue_attr_t v5 = @"Sticky";
    }
    int v22 = 136315394;
    __int16 v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
    __int16 v24 = 2112;
    __int16 v25 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s #modes Stickiness is %@",  (uint8_t *)&v22,  0x16u);
  }

  unsigned int previousIsVoiceTriggerRequest = -[AFModesConfiguration isVoiceTriggerRequest]( self->_currentModesConfiguration,  "isVoiceTriggerRequest");
  int v7 = v3 ^ 1;
  if ((previousIsVoiceTriggerRequest & 1) == 0 && (v7 & 1) == 0) {
    unsigned int previousIsVoiceTriggerRequest = self->_previousIsVoiceTriggerRequest;
  }
  self->_unsigned int previousIsVoiceTriggerRequest = previousIsVoiceTriggerRequest;
  unsigned int previousIsAudioAccessoryButtonActivation = -[AFModesConfiguration isAudioAccessoryButtonActivation]( self->_currentModesConfiguration,  "isAudioAccessoryButtonActivation");
  if (((previousIsAudioAccessoryButtonActivation | v7) & 1) == 0) {
    unsigned int previousIsAudioAccessoryButtonActivation = self->_previousIsAudioAccessoryButtonActivation;
  }
  self->_unsigned int previousIsAudioAccessoryButtonActivation = previousIsAudioAccessoryButtonActivation;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFModesConfiguration modeOverrideValue](self->_currentModesConfiguration, "modeOverrideValue"));
  BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADResponseModeProvider internalModeOverride:](self, "internalModeOverride:", v9));

  if (v10 == @"None")
  {
    if (previousIsVoiceTriggerRequest)
    {
      v14 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        __int16 v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
        os_log_type_t v15 = "%s #modes Hey Siri invocation";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v22, 0xCu);
      }
    }

    else
    {
      if (!previousIsAudioAccessoryButtonActivation)
      {
        int64_t v19 = -[ADResponseModeProvider _voiceFeedbackSetting](self, "_voiceFeedbackSetting");
        int64_t v20 = (os_log_s *)AFSiriLogContextConnection;
        BOOL v21 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
        if (v19 == 3)
        {
          if (v21)
          {
            int v22 = 136315138;
            __int16 v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s #modes VoiceFeedback ON",  (uint8_t *)&v22,  0xCu);
          }

          v16 = (void **)&SAUIResponseModeDisplayForwardValue;
        }

        else
        {
          if (v21)
          {
            int v22 = 136315138;
            __int16 v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s #modes VoiceFeedback OFF",  (uint8_t *)&v22,  0xCu);
          }

          v16 = (void **)&SAUIResponseModeDisplayOnlyValue;
        }

        goto LABEL_21;
      }

      v14 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        __int16 v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
        os_log_type_t v15 = "%s #modes audio accessory button invocation";
        goto LABEL_19;
      }
    }

    v16 = (void **)&SAUIResponseModeVoiceForwardValue;
LABEL_21:
    id v13 = *v16;
    goto LABEL_22;
  }

  id v11 = (os_log_s *)AFSiriLogContextConnection;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  id v13 = v10;
  if (v12)
  {
    int v22 = 136315394;
    __int16 v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
    __int16 v24 = 2112;
    __int16 v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #modes Override value being used: %@",  (uint8_t *)&v22,  0x16u);
    id v13 = v10;
  }

- (id)_computeModeFortvOS
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFModesConfiguration modeOverrideValue](self->_currentModesConfiguration, "modeOverrideValue"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADResponseModeProvider internalModeOverride:](self, "internalModeOverride:", v3));

  if (v4 == @"None")
  {
    uint64_t v10 = AFIsHorseman(v5, v6);
    if ((_DWORD)v10)
    {
      BOOL v12 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        int64_t v19 = "-[ADResponseModeProvider _computeModeFortvOS]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s #modes Computing mode for Homepod as VoiceOnly",  (uint8_t *)&v18,  0xCu);
      }

      id v13 = (void **)&SAUIResponseModeVoiceOnlyValue;
    }

    else if (AFIsATV(v10, v11) {
           && self->_isConnectedToAppleBTHeadphones
    }
           && +[AFFeatureFlags isStateFeedbackEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isStateFeedbackEnabled"))
    {
      v14 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        int64_t v19 = "-[ADResponseModeProvider _computeModeFortvOS]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s #modes Apple TV + Headphones : DisplayForward",  (uint8_t *)&v18,  0xCu);
      }

      id v13 = (void **)&SAUIResponseModeDisplayForwardValue;
    }

    else
    {
      os_log_type_t v15 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        int64_t v19 = "-[ADResponseModeProvider _computeModeFortvOS]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s #modes Computing mode for tvOS as DisplayOnly",  (uint8_t *)&v18,  0xCu);
      }

      id v13 = (void **)&SAUIResponseModeDisplayOnlyValue;
    }

    __int16 v9 = *v13;
  }

  else
  {
    int v7 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v8 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    __int16 v9 = v4;
    if (v8)
    {
      int v18 = 136315394;
      int64_t v19 = "-[ADResponseModeProvider _computeModeFortvOS]";
      __int16 v20 = 2112;
      BOOL v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s #modes Override value being used: %@",  (uint8_t *)&v18,  0x16u);
      __int16 v9 = v4;
    }
  }

  id v16 = v9;

  return v16;
}

- (id)internalModeOverride:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  if (([v3 isEqualToString:@"silent"] & 1) != 0
    || [v3 isEqualToString:@"displayonly"])
  {
    id v4 = (id *)&SAUIResponseModeDisplayOnlyValue;
LABEL_10:
    uint64_t v5 = (__CFString *)*v4;
    goto LABEL_11;
  }

  if (([v3 isEqualToString:@"mixed"] & 1) != 0
    || [v3 isEqualToString:@"displayforward"])
  {
    id v4 = (id *)&SAUIResponseModeDisplayForwardValue;
    goto LABEL_10;
  }

  if (([v3 isEqualToString:@"voice"] & 1) != 0
    || [v3 isEqualToString:@"voiceonly"])
  {
    id v4 = (id *)&SAUIResponseModeVoiceOnlyValue;
    goto LABEL_10;
  }

  if ([v3 isEqualToString:@"voiceforward"])
  {
    id v4 = (id *)&SAUIResponseModeVoiceForwardValue;
    goto LABEL_10;
  }

  if (v3)
  {
    int v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      __int16 v9 = "-[ADResponseModeProvider internalModeOverride:]";
      __int16 v10 = 2112;
      uint64_t v11 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s #modes Invalid mode override value: %@",  (uint8_t *)&v8,  0x16u);
    }
  }

  uint64_t v5 = @"None";
LABEL_11:

  return v5;
}

- (void)_fetchConnectedAudioAccessoryState
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000597BC;
  v4[3] = &unk_1004FAF58;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_connectedOutputDevicesDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ADResponseModeProvider _connectedOutputDevicesDidChange:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s #modes: output devices changed, re-fetching connected audio accessory state",  (uint8_t *)&v5,  0xCu);
  }

  -[ADResponseModeProvider _fetchConnectedAudioAccessoryState](self, "_fetchConnectedAudioAccessoryState");
}

- (void).cxx_destruct
{
}

@end