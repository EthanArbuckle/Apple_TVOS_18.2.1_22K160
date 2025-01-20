@interface MCCleanupMigrator
- (BOOL)_triggerMigrationWithContext:(int)a3;
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MCCleanupMigrator

- (id)dataClassName
{
  return @"mc_cleanup";
}

- (BOOL)performMigration
{
  if (-[MCCleanupMigrator didRestoreFromBackup](self, "didRestoreFromBackup"))
  {
    unsigned int v4 = -[MCCleanupMigrator didMigrateBackupFromDifferentDevice]( self,  "didMigrateBackupFromDifferentDevice");
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
    id v6 = -[MCCleanupMigrator didUpgrade](self, "didUpgrade");
    v7 = @"Device erasure";
    v8 = @"Software update";
    BOOL v5 = (_DWORD)v6 == 0;
  }

  if (v5) {
    v9 = v7;
  }
  else {
    v9 = v8;
  }
  _DMLogFunc(v2, 5LL);
  if (-[MCCleanupMigrator _triggerMigrationWithContext:](self, "_triggerMigrationWithContext:", v6, v9)) {
    goto LABEL_15;
  }
  uint64_t v10 = -2LL;
  do
  {
    unsigned int v11 = -[MCCleanupMigrator _triggerMigrationWithContext:](self, "_triggerMigrationWithContext:", v6);
    sleep(1u);
    if (!v10) {
      break;
    }
    ++v10;
  }

  while (!v11);
  if (v11)
  {
LABEL_15:
    _DMLogFunc(v2, 5LL);
    return 1;
  }

  else
  {
    _DMLogFunc(v2, 3LL);
    return 0;
  }

- (BOOL)_triggerMigrationWithContext:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_3B00;
  v6[3] = &unk_4058;
  v6[4] = &v7;
  [v4 migrateCleanupMigratorWithContext:v3 completion:v6];

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
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