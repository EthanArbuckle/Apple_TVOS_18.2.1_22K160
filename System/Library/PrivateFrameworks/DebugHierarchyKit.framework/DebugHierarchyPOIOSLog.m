@interface DebugHierarchyPOIOSLog
@end

@implementation DebugHierarchyPOIOSLog

void __DebugHierarchyPOIOSLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.DebugHierarchy", "PointsOfInterest");
  v2 = (void *)DebugHierarchyPOIOSLog___dvt_lazy_init_variable;
  DebugHierarchyPOIOSLog___dvt_lazy_init_variable = (uint64_t)v1;
}

@end