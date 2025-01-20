@interface SARDStartServerRequest
- (void)ad_setAFSpeechEvent:(int64_t)a3;
- (void)ad_setAFSpeechRequestOptions:(id)a3;
- (void)ad_setCSSiriRecordingInfo:(id)a3;
@end

@implementation SARDStartServerRequest

- (void)ad_setAFSpeechEvent:(int64_t)a3
{
  id v5 = sub_100344298(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[SARDStartServerRequest setOrigin:](self, "setOrigin:", v6);

  id v7 = sub_100344298(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[SARDStartServerRequest setInputOrigin:](self, "setInputOrigin:", v8);
}

- (void)ad_setAFSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4) {
    id v5 = [v4 activationEvent];
  }
  else {
    id v5 = 0LL;
  }
  -[SARDStartServerRequest ad_setAFSpeechEvent:](self, "ad_setAFSpeechEvent:", v5);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v13 turnIdentifier]);
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t String = AFTurnIdentifierGetString(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(String);
    -[SARDStartServerRequest setTurnId:](self, "setTurnId:", v9);
  }

  else
  {
    -[SARDStartServerRequest setTurnId:](self, "setTurnId:", 0LL);
  }

  else {
    uint64_t v10 = AFPreferencesAlwaysEyesFreeEnabled();
  }
  -[SARDStartServerRequest setEyesFree:](self, "setEyesFree:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SARDStartServerRequest voiceTriggerEventInfo](self, "voiceTriggerEventInfo"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v13 voiceTriggerEventInfo]);
    -[SARDStartServerRequest setVoiceTriggerEventInfo:](self, "setVoiceTriggerEventInfo:", v12);
  }
}

- (void)ad_setCSSiriRecordingInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 source]);
  uint64_t v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    v11 = "-[SARDStartServerRequest(ADSAExtensions) ad_setCSSiriRecordingInfo:]";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s audioSource = %@", (uint8_t *)&v10, 0x16u);
  }

  -[SARDStartServerRequest setAudioSource:](self, "setAudioSource:", v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
  id v8 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    v11 = "-[SARDStartServerRequest(ADSAExtensions) ad_setCSSiriRecordingInfo:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s audioDestination = %@", (uint8_t *)&v10, 0x16u);
  }

  -[SARDStartServerRequest setAudioDestination:](self, "setAudioDestination:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 modelName]);
  -[SARDStartServerRequest setDeviceModel:](self, "setDeviceModel:", v9);
}

@end