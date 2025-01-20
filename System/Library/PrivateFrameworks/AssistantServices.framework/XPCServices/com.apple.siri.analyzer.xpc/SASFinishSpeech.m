@interface SASFinishSpeech
- (void)af_logDiagnostics;
@end

@implementation SASFinishSpeech

- (void)af_logDiagnostics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  [v2 logVoiceSendEnd];
}

@end