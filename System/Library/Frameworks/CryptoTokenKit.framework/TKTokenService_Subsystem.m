@interface TKTokenService_Subsystem
+ (id)initForPlugInKit;
+ (void)initForPlugInKit;
@end

@implementation TKTokenService_Subsystem

+ (id)initForPlugInKit
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[TKTokenService_Subsystem initForPlugInKit].cold.1();
  }

  [MEMORY[0x189607B60] _startListening];
  return objc_alloc_init((Class)a1);
}

+ (void)initForPlugInKit
{
}

@end