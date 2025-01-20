@interface CSAttSiriMagusSupportedPolicy
+ (BOOL)_isInputOriginSupportedByContinuousConversation:(id)a3;
+ (BOOL)isCurrentlyInActiveCall;
+ (BOOL)isCurrentlyInSplitterState;
+ (CSAttSiriMagusSupportedPolicy)sharedInstance;
+ (void)initialize;
- (BOOL)_isMagusSupportedWithRecordRoute:(id)a3 playbackRoute:(id)a4 isInSplitterMode:(BOOL)a5 isInActiveCall:(BOOL)a6 isSupportedRequestType:(BOOL)a7 audioSessionId:(unsigned int)a8 recordDeviceInfo:(id)a9;
- (BOOL)_isRouteValidForEchoCancellationWithAppleSiliconMac:(id)a3;
- (BOOL)getIsAssetMagusSupported;
- (BOOL)isAssetMagusSupported;
- (BOOL)isMagusSupportedWithAudioRecordContext:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 audioSessionId:(unsigned int)a6 recordDeviceInfo:(id)a7;
- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5;
- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 isInSplitterMode:(BOOL)a6 isInActiveCall:(BOOL)a7;
- (void)_updateWithAsset:(id)a3;
- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
- (void)setIsAssetMagusSupported:(BOOL)a3;
- (void)start;
@end

@implementation CSAttSiriMagusSupportedPolicy

- (BOOL)getIsAssetMagusSupported
{
  return self->_isAssetMagusSupported;
}

- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 isInSplitterMode:(BOOL)a6 isInActiveCall:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  LOBYTE(v7) = -[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]( self,  "_isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:a udioSessionId:recordDeviceInfo:",  v13,  v12,  v8,  v7,  +[CSAttSiriMagusSupportedPolicy _isInputOriginSupportedByContinuousConversation:]( &OBJC_CLASS___CSAttSiriMagusSupportedPolicy,  "_isInputOriginSupportedByContinuousConversation:",  a3),  0LL,  0LL);

  return v7;
}

- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  LOBYTE(a3) = -[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]( self,  "_isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:a udioSessionId:recordDeviceInfo:",  v9,  v8,  +[CSAttSiriMagusSupportedPolicy isCurrentlyInSplitterState]( &OBJC_CLASS___CSAttSiriMagusSupportedPolicy,  "isCurrentlyInSplitterState"),  +[CSAttSiriMagusSupportedPolicy isCurrentlyInActiveCall]( &OBJC_CLASS___CSAttSiriMagusSupportedPolicy,  "isCurrentlyInActiveCall"),  +[CSAttSiriMagusSupportedPolicy _isInputOriginSupportedByContinuousConversation:]( &OBJC_CLASS___CSAttSiriMagusSupportedPolicy,  "_isInputOriginSupportedByContinuousConversation:",  a3),  0LL,  0LL);

  return (char)a3;
}

- (BOOL)isMagusSupportedWithAudioRecordContext:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 audioSessionId:(unsigned int)a6 recordDeviceInfo:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  LOBYTE(v7) = -[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]( self,  "_isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:a udioSessionId:recordDeviceInfo:",  v14,  v13,  +[CSAttSiriMagusSupportedPolicy isCurrentlyInSplitterState]( CSAttSiriMagusSupportedPolicy,  "isCurrentlyInSplitterState"),  +[CSAttSiriMagusSupportedPolicy isCurrentlyInActiveCall]( CSAttSiriMagusSupportedPolicy,  "isCurrentlyInActiveCall"),  [a3 isAudioRecordTypeSupportedByContinuousConversation],  v7,  v12);

  return v7;
}

- (BOOL)_isRouteValidForEchoCancellationWithAppleSiliconMac:(id)a3
{
  return 1;
}

- (BOOL)_isMagusSupportedWithRecordRoute:(id)a3 playbackRoute:(id)a4 isInSplitterMode:(BOOL)a5 isInActiveCall:(BOOL)a6 isSupportedRequestType:(BOOL)a7 audioSessionId:(unsigned int)a8 recordDeviceInfo:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  BOOL v56 = a7;
  BOOL v53 = a5;
  BOOL v54 = a6;
  v11 = (__CFString *)a3;
  id v12 = (__CFString *)a4;
  id v13 = a9;
  if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware")
    && (+[CSUtils isSiriDSPTurnedOn](&OBJC_CLASS___CSUtils, "isSiriDSPTurnedOn") & 1) == 0)
  {
    v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    LOBYTE(v20) = 0;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Disable FF since this is Exclave hardware without Siri DSP",  buf,  0xCu);
      LOBYTE(v20) = 0;
    }

    goto LABEL_73;
  }

  if (+[CSUtils isJarvisAudioRouteWithRecordRoute:]( &OBJC_CLASS___CSUtils,  "isJarvisAudioRouteWithRecordRoute:",  v11))
  {
    unsigned int v14 = +[CSUtils isCarplayWithFlexibleFollowupEnabled]( &OBJC_CLASS___CSUtils,  "isCarplayWithFlexibleFollowupEnabled");
    v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v16 = @"NO";
      if (v14) {
        v16 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      __int16 v59 = 2114;
      v60 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Jarvis route supports FF? %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v18 = [v17 programmableAudioInjectionEnabled];

    if (v18)
    {
      unsigned int v14 = 1;
      if ((+[CSUtils isBuiltInRouteWithRecordRoute:playbackRoute:]( &OBJC_CLASS___CSUtils,  "isBuiltInRouteWithRecordRoute:playbackRoute:",  v11,  v12) & 1) != 0) {
        goto LABEL_22;
      }
    }

    else
    {
      int v21 = CSIsAppleSiliconMac();
      unsigned int v22 = +[CSUtils isBuiltInRecordRoute:](&OBJC_CLASS___CSUtils, "isBuiltInRecordRoute:", v11);
      char v23 = v22;
      if (v21)
      {
        unsigned int v14 = -[CSAttSiriMagusSupportedPolicy _isRouteValidForEchoCancellationWithAppleSiliconMac:]( self,  "_isRouteValidForEchoCancellationWithAppleSiliconMac:",  v13);
        if ((v23 & 1) != 0) {
          goto LABEL_22;
        }
      }

      else if (v22)
      {
        unsigned int v14 = 1;
        if (+[CSUtils fetchHypotheticalRouteTypeFromAudioSessionId:]( &OBJC_CLASS___CSUtils,  "fetchHypotheticalRouteTypeFromAudioSessionId:",  v9) == (id)1) {
          goto LABEL_22;
        }
      }

      else
      {
        unsigned int v14 = 1;
      }
    }

    if (!+[CSUtils isOutOfBandAudioRouteWithRecordRoute:]( &OBJC_CLASS___CSUtils,  "isOutOfBandAudioRouteWithRecordRoute:",  v11)) {
      unsigned int v14 = 0;
    }
  }

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  [v3 addObserver:self];

  self->_BOOL isAssetMagusSupported = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSBluetoothWirelessSplitterMonitor sharedInstance]( &OBJC_CLASS___CSBluetoothWirelessSplitterMonitor,  "sharedInstance"));
  [v4 addObserver:self];

  if (+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled"))
  {
    if (+[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandlerDisabledOnDeviceCompilation]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandlerDisabledOnDeviceCompilation"));
      [v5 registerObserver:self];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10007DB0C;
      v6[3] = &unk_10022E340;
      v6[4] = self;
      [v5 getMitigationAssetWithEndpointId:0 completion:v6];
    }
  }

- (void)_updateWithAsset:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported");
  unsigned int v6 = [v4 isMagusSupported];

  self->_BOOL isAssetMagusSupported = v5 & v6;
  uint64_t v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[CSAttSiriMagusSupportedPolicy _updateWithAsset:]";
    __int16 v10 = 1024;
    unsigned int v11 = v5;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s DeviceSupport %d AssetSupport %d",  (uint8_t *)&v8,  0x18u);
  }

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
}

- (BOOL)isAssetMagusSupported
{
  return self->_isAssetMagusSupported;
}

- (void)setIsAssetMagusSupported:(BOOL)a3
{
  self->_BOOL isAssetMagusSupported = a3;
}

+ (CSAttSiriMagusSupportedPolicy)sharedInstance
{
  if (qword_10027FE18 != -1) {
    dispatch_once(&qword_10027FE18, &stru_10022B8F8);
  }
  return (CSAttSiriMagusSupportedPolicy *)(id)qword_10027FE10;
}

+ (void)initialize
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    unsigned int v5 = "+[CSAttSiriMagusSupportedPolicy initialize]";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }

  id v3 = +[CSCarKitUtils sharedInstance](&OBJC_CLASS___CSCarKitUtils, "sharedInstance");
}

+ (BOOL)isCurrentlyInSplitterState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSBluetoothWirelessSplitterMonitor sharedInstance]( &OBJC_CLASS___CSBluetoothWirelessSplitterMonitor,  "sharedInstance"));
  id v3 = [v2 splitterState];

  return (unint64_t)v3 > 1;
}

+ (BOOL)isCurrentlyInActiveCall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  id v3 = (char *)[v2 phoneCallState];

  return (unint64_t)(v3 - 2) < 3;
}

+ (BOOL)_isInputOriginSupportedByContinuousConversation:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:SAInputOriginHomeButtonValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginRemoteButtonValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginAssistantSpeechButtonValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginVoiceTriggerValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginServerGeneratedValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginMagusFollowupValue] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:SAInputOriginClientGeneratedValue];
  }

  return v4;
}

@end