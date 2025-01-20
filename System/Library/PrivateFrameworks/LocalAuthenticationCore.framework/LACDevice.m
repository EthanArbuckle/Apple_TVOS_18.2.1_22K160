@interface LACDevice
+ (LACDevice)sharedInstance;
- (BOOL)isClarityBoardRunning;
- (BOOL)isDynamicIslandAvailable;
@end

@implementation LACDevice

+ (LACDevice)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_6);
  }
  return (LACDevice *)(id)sharedInstance_sharedInstance_2;
}

void __27__LACDevice_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = v0;
}

- (BOOL)isClarityBoardRunning
{
  return 0;
}

- (BOOL)isDynamicIslandAvailable
{
  return 0;
}

@end