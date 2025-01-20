@interface DebugHierarchyRequestsOSLog
@end

@implementation DebugHierarchyRequestsOSLog

void __DebugHierarchyRequestsOSLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.DebugHierarchy", "Requests");
  v2 = (void *)DebugHierarchyRequestsOSLog___dvt_lazy_init_variable;
  DebugHierarchyRequestsOSLog___dvt_lazy_init_variable = (uint64_t)v1;
}

void __DebugHierarchyRequestsOSLog_block_invoke_0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.DebugHierarchy", "Requests");
  v2 = (void *)DebugHierarchyRequestsOSLog___dvt_lazy_init_variable_0;
  DebugHierarchyRequestsOSLog___dvt_lazy_init_variable_0 = (uint64_t)v1;
}

@end