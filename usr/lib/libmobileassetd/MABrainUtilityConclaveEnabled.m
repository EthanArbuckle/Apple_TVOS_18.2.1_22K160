@interface MABrainUtilityConclaveEnabled
@end

@implementation MABrainUtilityConclaveEnabled

void __MABrainUtilityConclaveEnabled_block_invoke(id a1)
{
  if (__isPlatformVersionAtLeast(3, 18, 2, 0))
  {
    if (MABrainUtilityDeviceSupportsExclaves_onceToken != -1) {
      dispatch_once(&MABrainUtilityDeviceSupportsExclaves_onceToken, &__block_literal_global_19);
    }
    if (MABrainUtilityDeviceSupportsExclaves_answer) {
      MABrainUtilityConclaveEnabled_answer = _os_feature_enabled_impl("MobileAsset", "com_apple_mobileassetd_conclave");
    }
  }

@end