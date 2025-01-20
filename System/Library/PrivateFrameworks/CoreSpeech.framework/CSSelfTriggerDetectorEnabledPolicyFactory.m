@interface CSSelfTriggerDetectorEnabledPolicyFactory
+ (id)selfTriggerDetectorEnabledPolicy;
+ (id)selfTriggerDetectorEnabledPolicyWithAudioSourceType:(unint64_t)a3;
+ (id)studioDisplaySelfTriggerEnabledPolicy;
@end

@implementation CSSelfTriggerDetectorEnabledPolicyFactory

+ (id)selfTriggerDetectorEnabledPolicy
{
  else {
    return 0LL;
  }
}

+ (id)studioDisplaySelfTriggerEnabledPolicy
{
  return 0LL;
}

+ (id)selfTriggerDetectorEnabledPolicyWithAudioSourceType:(unint64_t)a3
{
  if (a3 == 1)
  {
    +[CSUtils supportAudioTappingSelfTrigger](&OBJC_CLASS___CSUtils, "supportAudioTappingSelfTrigger");
    goto LABEL_5;
  }

  if (a3)
  {
LABEL_5:
    v3 = 0LL;
    return v3;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicy]( &OBJC_CLASS___CSSelfTriggerDetectorEnabledPolicyFactory,  "selfTriggerDetectorEnabledPolicy"));
  return v3;
}

@end