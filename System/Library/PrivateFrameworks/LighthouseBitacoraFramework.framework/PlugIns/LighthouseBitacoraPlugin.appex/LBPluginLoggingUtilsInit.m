@interface LBPluginLoggingUtilsInit
@end

@implementation LBPluginLoggingUtilsInit

void __LBPluginLoggingUtilsInit_block_invoke(id a1)
{
  os_log_t v1 = os_log_create(kLBPluginLoggingSubsystem, kLBPluginLoggingCategoryPlugin);
  v2 = (void *)LBFLogContextPlugin;
  LBFLogContextPlugin = (uint64_t)v1;
}

@end