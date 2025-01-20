@interface SecureMobileAssetExclaveManager
+ (id)sharedInstance;
@end

@implementation SecureMobileAssetExclaveManager

+ (id)sharedInstance
{
  id v2 = (id)sharedInstance_manager;
  objc_sync_enter(v2);
  if (!sharedInstance_manager)
  {
    v3 = -[MobileAssetExclaveServicesManager initWithConclave:]( objc_alloc(&OBJC_CLASS____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager),  "initWithConclave:",  1LL);
    v4 = (void *)sharedInstance_manager;
    sharedInstance_manager = (uint64_t)v3;
  }

  objc_sync_exit(v2);

  return (id)sharedInstance_manager;
}

@end