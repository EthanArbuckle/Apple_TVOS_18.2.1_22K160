@interface CSRemoteXPCVoiceTriggerEnabledPolicy
+ (id)remoteDarwinVoiceTriggerEnabledPolicy;
@end

@implementation CSRemoteXPCVoiceTriggerEnabledPolicy

+ (id)remoteDarwinVoiceTriggerEnabledPolicy
{
  if (+[CSUtils supportRemoteDarwinVoiceTrigger]( &OBJC_CLASS___CSUtils,  "supportRemoteDarwinVoiceTrigger")) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy]( &OBJC_CLASS___CSBuiltInVoiceTriggerEnabledPolicy,  "builtInVoiceTriggerEnabledPolicy"));
  }
  else {
    v3 = 0LL;
  }
  return v3;
}

@end