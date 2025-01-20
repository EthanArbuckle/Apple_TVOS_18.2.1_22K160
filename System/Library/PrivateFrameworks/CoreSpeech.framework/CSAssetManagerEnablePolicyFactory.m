@interface CSAssetManagerEnablePolicyFactory
+ (id)assetManagerEnabledPolicy;
@end

@implementation CSAssetManagerEnablePolicyFactory

+ (id)assetManagerEnabledPolicy
{
  return objc_alloc_init(&OBJC_CLASS___CSAssetManagerEnablePolicy);
}

@end