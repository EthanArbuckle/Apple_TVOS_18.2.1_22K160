@interface CSAdBlockerEnabledPolicyFactory
+ (id)adBlockerEnabledPolicy;
@end

@implementation CSAdBlockerEnabledPolicyFactory

+ (id)adBlockerEnabledPolicy
{
  return objc_alloc_init(&OBJC_CLASS___CSAdBlockerEnabledPolicyHomePod);
}

@end