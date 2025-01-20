@interface DebugHierarchyGzipOSLog
@end

@implementation DebugHierarchyGzipOSLog

void __DebugHierarchyGzipOSLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.DebugHierarchy", "Gzip");
  v2 = (void *)DebugHierarchyGzipOSLog___dvt_lazy_init_variable;
  DebugHierarchyGzipOSLog___dvt_lazy_init_variable = (uint64_t)v1;
}

@end