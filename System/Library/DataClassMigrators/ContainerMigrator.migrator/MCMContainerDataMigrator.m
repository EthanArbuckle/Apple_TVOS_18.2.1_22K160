@interface MCMContainerDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MCMContainerDataMigrator

- (id)dataClassName
{
  return @"MCMContainerDataMigrator";
}

- (BOOL)performMigration
{
  uint64_t v6 = 1LL;
  char v2 = container_perform_data_migration(&v6, a2);
  if ((v2 & 1) == 0)
  {
    uint64_t v3 = container_log_handle_for_category(0LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = v6;
      _os_log_fault_impl( &dword_0,  v4,  OS_LOG_TYPE_FAULT,  "Migration failed with error %llu. Please include a sysdiagnose in a bug report for MobileContainerManager | all.",  buf,  0xCu);
    }
  }

  return v2;
}

- (float)estimatedDuration
{
  return 2.0;
}

- (float)migrationProgress
{
  return -1.0;
}
@end