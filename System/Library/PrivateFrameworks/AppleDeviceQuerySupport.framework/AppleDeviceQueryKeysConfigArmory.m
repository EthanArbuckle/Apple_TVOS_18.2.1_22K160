@interface AppleDeviceQueryKeysConfigArmory
+ (id)getConfig;
@end

@implementation AppleDeviceQueryKeysConfigArmory

+ (id)getConfig
{
  if (getConfigDict_aToken != -1) {
    dispatch_once(&getConfigDict_aToken, &__block_literal_global_2);
  }
  return (id)getConfigDict_aDict;
}

@end