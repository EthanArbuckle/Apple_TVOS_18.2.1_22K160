@interface CSBuiltInVoiceTriggerEnabledPolicy
+ (id)builtInVoiceTriggerEnabledPolicy;
@end

@implementation CSBuiltInVoiceTriggerEnabledPolicy

+ (id)builtInVoiceTriggerEnabledPolicy
{
  id v2 = +[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS");
  if ((v2 & 1) != 0)
  {
    v4 = off_100228A68;
  }

  else if ((CSIsHorseman(v2, v3) & 1) != 0)
  {
    v4 = off_100228A70;
  }

  else
  {
    int v5 = CSHasAOP();
    v4 = &off_100228A78;
    if (v5) {
      v4 = off_100228A60;
    }
  }

  return objc_alloc_init(*v4);
}

@end