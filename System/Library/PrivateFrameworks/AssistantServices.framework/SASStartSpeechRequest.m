@interface SASStartSpeechRequest
- (void)ad_setAFSpeechRequestOptions:(id)a3;
- (void)ad_setCSSiriRecordingInfo:(id)a3;
@end

@implementation SASStartSpeechRequest

- (void)ad_setAFSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  else {
    uint64_t v5 = AFPreferencesAlwaysEyesFreeEnabled();
  }
  -[SASStartSpeechRequest setEyesFree:](self, "setEyesFree:", v5);
  else {
    uint64_t v6 = 0LL;
  }
  -[SASStartSpeechRequest setEnablePartialResults:](self, "setEnablePartialResults:", v6);
  -[SASStartSpeechRequest setWasLaunchedForRequest:]( self,  "setWasLaunchedForRequest:",  [v4 isInitialBringUp]);
  v7.receiver = self;
  v7.super_class = &OBJC_CLASS___SASStartSpeechRequest;
  -[SASStartSpeechRequest ad_setAFSpeechRequestOptions:](&v7, "ad_setAFSpeechRequestOptions:", v4);
}

- (void)ad_setCSSiriRecordingInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = &OBJC_CLASS___SASStartSpeechRequest;
  id v4 = a3;
  -[SASStartSpeechRequest ad_setCSSiriRecordingInfo:](&v6, "ad_setCSSiriRecordingInfo:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "voiceTriggerEventInfo", v6.receiver, v6.super_class));

  -[SASStartSpeechRequest setVoiceTriggerEventInfo:](self, "setVoiceTriggerEventInfo:", v5);
}

@end