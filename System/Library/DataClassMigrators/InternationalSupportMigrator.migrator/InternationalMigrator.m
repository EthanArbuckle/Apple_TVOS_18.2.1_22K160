@interface InternationalMigrator
- (BOOL)performMigration;
- (id)dataClassName;
@end

@implementation InternationalMigrator

- (BOOL)performMigration
{
  uint64_t v3 = DMGetPreviousBuildVersion(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)DMCopyCurrentBuildVersion();
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[ISRootMigrator migratorFromVersion:toVersion:]( &OBJC_CLASS___ISRootMigrator,  "migratorFromVersion:toVersion:",  v4,  v5));
  unsigned __int8 v7 = -[InternationalMigrator userDataDisposition](self, "userDataDisposition");
  if ((v7 & 1) != 0) {
    [v6 setIsErase:1];
  }
  if ((v7 & 4) != 0) {
    [v6 setIsRestoreFromBackup:1];
  }
  unsigned __int8 v8 = [v6 performMigration];

  return v8;
}

- (id)dataClassName
{
  return @"InternationalSupportMigrator";
}

@end