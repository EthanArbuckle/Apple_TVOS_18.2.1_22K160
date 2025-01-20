@interface AUServiceManager
+ (int)startServiceInSandbox;
+ (void)startService;
@end

@implementation AUServiceManager

+ (void)startService
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)[MEMORY[0x189607B50] serviceListener];
  [v3 setDelegate:v2];
  [v3 resume];
}

+ (int)startServiceInSandbox
{
  int v2 = AUSandboxPlatformInit(0LL, 0LL);
  if (!v2) {
    +[AUServiceManager startService](&OBJC_CLASS___AUServiceManager, "startService");
  }
  return v2;
}

@end