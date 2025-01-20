@interface RMModelPayloadBase
+ (id)rm_payloadTypeName;
@end

@implementation RMModelPayloadBase

+ (id)rm_payloadTypeName
{
  if ((id)objc_opt_class(&OBJC_CLASS___RMModelActivationBase, a2) == a1)
  {
    v7 = @"com.apple.activation";
  }

  else if ((id)objc_opt_class(&OBJC_CLASS___RMModelAssetBase, v3) == a1)
  {
    v7 = @"com.apple.asset";
  }

  else if ((id)objc_opt_class(&OBJC_CLASS___RMModelConfigurationBase, v4) == a1)
  {
    v7 = @"com.apple.configuration";
  }

  else if ((id)objc_opt_class(&OBJC_CLASS___RMModelCommandBase, v5) == a1)
  {
    v7 = @"com.apple.command";
  }

  else
  {
    v6 = NSStringFromClass((Class)a1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v7;
}

@end