@interface LSDatabaseMigrator
- (BOOL)performMigration;
- (BOOL)populateLSDatabase;
- (BOOL)removeAppRemovalRestrictionForTVOnUpgradeIfInstalled;
- (BOOL)removeTVAppSystemAppRemovedRestrictionFor12_3;
- (LSDatabaseMigrator)init;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation LSDatabaseMigrator

- (LSDatabaseMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSDatabaseMigrator;
  return -[LSDatabaseMigrator init](&v3, "init");
}

- (id)dataClassName
{
  return @"LSDatabaseMigrator";
}

- (BOOL)populateLSDatabase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v2 _LSPrivateNoteMigratorRunning];
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v4 = objc_autoreleasePoolPush();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) bundleIdentifier]);
        -[NSMutableSet addObject:](v3, "addObject:", v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  objc_autoreleasePoolPop(v4);
  id v11 = -[NSMutableSet count](v3, "count");
  if (!v11)
  {
    uint64_t v12 = _LSDefaultLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_38CC(v13);
    }
  }

  if ([v2 _LSPrivateDatabaseNeedsRebuild])
  {
    uint64_t v14 = _LSDefaultLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "_LSPrivateDatabaseNeedsRebuild = YES, Forcing a database rebuild",  v17,  2u);
    }

    [v2 _LSPrivateRebuildApplicationDatabasesForSystemApps:1 internal:1 user:1];
  }

  [v2 _LSPrivateUpdateAppRemovalRestrictions];

  return v11 != 0LL;
}

- (BOOL)removeTVAppSystemAppRemovedRestrictionFor12_3
{
  return 1;
}

- (BOOL)removeAppRemovalRestrictionForTVOnUpgradeIfInstalled
{
  return 1;
}

- (BOOL)performMigration
{
  unsigned __int8 v3 = -[LSDatabaseMigrator populateLSDatabase](self, "populateLSDatabase");
  char v4 = v3 & -[LSDatabaseMigrator removeTVAppSystemAppRemovedRestrictionFor12]( self,  "removeTVAppSystemAppRemovedRestrictionFor12");
  return v4 & -[LSDatabaseMigrator removeAppRemovalRestrictionForTVOnUpgradeIfInstalled]( self,  "removeAppRemovalRestrictionForTVOnUpgradeIfInstalled");
}

- (float)estimatedDuration
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LSDatabaseMigrator;
  unsigned int v2 = -[LSDatabaseMigrator didUpgrade](&v4, "didUpgrade");
  float result = 120.0;
  if (!v2) {
    return 2.0;
  }
  return result;
}

- (float)migrationProgress
{
  return -1.0;
}

@end