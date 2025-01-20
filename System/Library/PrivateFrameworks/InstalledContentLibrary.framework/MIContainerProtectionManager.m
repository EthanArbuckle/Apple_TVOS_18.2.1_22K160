@interface MIContainerProtectionManager
+ (id)defaultManager;
- (void)setDataProtectionOnDataContainer:(id)a3 forNewBundle:(id)a4 retryIfLocked:(BOOL)a5;
@end

@implementation MIContainerProtectionManager

+ (id)defaultManager
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__MIContainerProtectionManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, block);
  }
  return (id)defaultManager_defaultManager;
}

void __46__MIContainerProtectionManager_defaultManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;
}

- (void)setDataProtectionOnDataContainer:(id)a3 forNewBundle:(id)a4 retryIfLocked:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  [v7 dataProtectionClass];
  [v7 bundleType];
  [v6 containerClass];
  [v7 identifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = v8;
  [v9 UTF8String];
  v11 = v6;
  id v10 = v6;
  container_set_data_protection_for_current_user();
}

uint64_t __92__MIContainerProtectionManager_setDataProtectionOnDataContainer_forNewBundle_retryIfLocked___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2 != 1)
  {
    uint64_t result = gLogHandle;
  }

  return result;
}

@end