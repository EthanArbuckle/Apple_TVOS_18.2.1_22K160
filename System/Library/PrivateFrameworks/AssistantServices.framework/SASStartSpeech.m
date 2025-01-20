@interface SASStartSpeech
- (id)ad_deferredMetricsContext;
- (id)ad_languageModel;
- (void)ad_setAFSpeechEvent:(int64_t)a3;
- (void)ad_setAFSpeechRequestOptions:(id)a3;
- (void)ad_setCSSiriRecordingInfo:(id)a3;
- (void)af_logDiagnostics;
@end

@implementation SASStartSpeech

- (void)af_logDiagnostics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  [v2 logVoiceSendStart];
}

- (id)ad_languageModel
{
  return 0LL;
}

- (void)ad_setAFSpeechEvent:(int64_t)a3
{
  id v4 = sub_100344298(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SASStartSpeech setOrigin:](self, "setOrigin:", v5);
}

- (void)ad_setAFSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4) {
    id v5 = [v4 activationEvent];
  }
  else {
    id v5 = 0LL;
  }
  -[SASStartSpeech ad_setAFSpeechEvent:](self, "ad_setAFSpeechEvent:", v5);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v12 turnIdentifier]);
  v7 = (void *)v6;
  if (v6)
  {
    uint64_t String = AFTurnIdentifierGetString(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(String);
    -[SASStartSpeech setTurnId:](self, "setTurnId:", v9);
  }

  else
  {
    -[SASStartSpeech setTurnId:](self, "setTurnId:", 0LL);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech voiceTriggerEventInfo](self, "voiceTriggerEventInfo"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v12 voiceTriggerEventInfo]);
    -[SASStartSpeech setVoiceTriggerEventInfo:](self, "setVoiceTriggerEventInfo:", v11);
  }
}

- (void)ad_setCSSiriRecordingInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 source]);
  uint64_t v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    v16 = "-[SASStartSpeech(ADSAExtensions) ad_setCSSiriRecordingInfo:]";
    __int16 v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s audioSource = %@", (uint8_t *)&v15, 0x16u);
  }

  -[SASStartSpeech setAudioSource:](self, "setAudioSource:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
  v8 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    v16 = "-[SASStartSpeech(ADSAExtensions) ad_setCSSiriRecordingInfo:]";
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s audioDestination = %@", (uint8_t *)&v15, 0x16u);
  }

  -[SASStartSpeech setAudioDestination:](self, "setAudioDestination:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 codec]);
  -[SASStartSpeech setCodec:](self, "setCodec:", SASCodecForString());

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
  -[SASStartSpeech setDeviceIdentifier:](self, "setDeviceIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 modelName]);
  -[SASStartSpeech setDeviceModel:](self, "setDeviceModel:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 dspStatus]);
  -[SASStartSpeech setDspStatus:](self, "setDspStatus:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 headsetAddress]);
  -[SASStartSpeech setHeadsetAddress:](self, "setHeadsetAddress:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 headsetName]);
  -[SASStartSpeech setHeadsetName:](self, "setHeadsetName:", v14);
}

- (id)ad_deferredMetricsContext
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SASStartSpeech;
  id v3 = -[SASStartSpeech ad_deferredMetricsContext](&v13, "ad_deferredMetricsContext");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech audioSource](self, "audioSource"));
  if (v5) {
    [v4 setObject:v5 forKey:SASStartSpeechAudioSourcePListKey];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech origin](self, "origin"));
  if (v6) {
    [v4 setObject:v6 forKey:SASStartSpeechOriginPListKey];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech motionActivity](self, "motionActivity"));
  if (v7) {
    [v4 setObject:v7 forKey:SASStartSpeechMotionActivityPListKey];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech motionConfidence](self, "motionConfidence"));
  if (v8) {
    [v4 setObject:v8 forKey:SASStartSpeechMotionConfidencePListKey];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech headsetAddress](self, "headsetAddress"));
  if (v9) {
    [v4 setObject:v9 forKey:SASStartSpeechHeadsetAddressPListKey];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech headsetId](self, "headsetId"));
  if (v10) {
    [v4 setObject:v10 forKey:SASStartSpeechHeadsetIdPListKey];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech headsetName](self, "headsetName"));
  if (v11) {
    [v4 setObject:v11 forKey:SASStartSpeechHeadsetNamePListKey];
  }

  return v4;
}

@end