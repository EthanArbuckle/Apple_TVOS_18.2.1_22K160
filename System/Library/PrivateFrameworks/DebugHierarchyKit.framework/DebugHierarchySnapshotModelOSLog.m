@interface DebugHierarchySnapshotModelOSLog
@end

@implementation DebugHierarchySnapshotModelOSLog

void __DebugHierarchySnapshotModelOSLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.DebugHierarchy", "SnapshotModel");
  v2 = (void *)DebugHierarchySnapshotModelOSLog___dvt_lazy_init_variable;
  DebugHierarchySnapshotModelOSLog___dvt_lazy_init_variable = (uint64_t)v1;
}

@end