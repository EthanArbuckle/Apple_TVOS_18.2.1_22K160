@interface DebugHierarchyJSONProcessingOSLog
@end

@implementation DebugHierarchyJSONProcessingOSLog

void __DebugHierarchyJSONProcessingOSLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.DebugHierarchy", "JSONProcessing");
  v2 = (void *)DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_variable;
  DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_variable = (uint64_t)v1;
}

@end