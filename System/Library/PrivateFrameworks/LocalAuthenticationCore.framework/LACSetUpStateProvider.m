@interface LACSetUpStateProvider
+ (LACSetUpStateProvider)sharedInstance;
- (BOOL)hasCompletedSetup;
- (void)hasCompletedSetup;
@end

@implementation LACSetUpStateProvider

+ (LACSetUpStateProvider)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_15);
  }
  return (LACSetUpStateProvider *)(id)sharedInstance_sharedInstance_7;
}

void __39__LACSetUpStateProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LACSetUpStateProvider);
  v1 = (void *)sharedInstance_sharedInstance_7;
  sharedInstance_sharedInstance_7 = (uint64_t)v0;
}

- (BOOL)hasCompletedSetup
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[LACSetUpStateProvider hasCompletedSetup].cold.1(v2);
  }

  return 0;
}

- (void)hasCompletedSetup
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_189219000, log, OS_LOG_TYPE_ERROR, "Setup checks not available in this platform", v1, 2u);
}

@end