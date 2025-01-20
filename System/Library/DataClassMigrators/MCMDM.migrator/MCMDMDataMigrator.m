@interface MCMDMDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MCMDMDataMigrator

- (id)dataClassName
{
  return @"mc_mdm";
}

- (BOOL)performMigration
{
  if (-[MCMDMDataMigrator didRestoreFromBackup](self, "didRestoreFromBackup"))
  {
    unsigned int v4 = -[MCMDMDataMigrator didMigrateBackupFromDifferentDevice]( self,  "didMigrateBackupFromDifferentDevice");
    BOOL v5 = v4 == 0;
    if (v4) {
      id v6 = &dword_0 + 3;
    }
    else {
      id v6 = &dword_0 + 2;
    }
    v7 = @"Restore from the same device";
    v8 = @"Restore from a different device";
  }

  else
  {
    id v6 = -[MCMDMDataMigrator didUpgrade](self, "didUpgrade");
    v7 = @"Device erasure";
    v8 = @"Software update";
    BOOL v5 = (_DWORD)v6 == 0;
  }

  if (!v5) {
    v7 = v8;
  }
  v11 = v7;
  _DMLogFunc(v2, 5LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient", v11));
  [v9 migrateMDMWithContext:v6 completion:&stru_4048];

  return 1;
}

- (float)estimatedDuration
{
  return 1.0;
}

- (float)migrationProgress
{
  return -1.0;
}

@end