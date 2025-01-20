@interface BKMigrator
- (BOOL)_moveRestoredFileAtPath:(id)a3;
- (void)_migrateBackBoard;
- (void)_removeUnusedFiles;
- (void)migrateIfNecessary;
@end

@implementation BKMigrator

- (void)migrateIfNecessary
{
  double v3 = BSContinuousMachTimeNow(-[BKMigrator _migrateBackBoard](self, "_migrateBackBoard"));
  uint64_t v4 = DMPerformMigrationIfNeeded();
  uint64_t v5 = BKLogCommon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    int v8 = 134217984;
    double v9 = BSContinuousMachTimeNow(v7) - v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Migration complete (if performed). (Elapsed time: %.2f seconds)",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)_migrateBackBoard
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
  [v2 migrateDefaultsIfNecessary];
}

- (void)_removeUnusedFiles
{
  int v3 = open((const char *)[@"/tmp/RestoreRunning" fileSystemRepresentation], 36);
  if (v3 != -1)
  {
    close(v3);
    goto LABEL_6;
  }

  uint64_t v4 = __error();
  if (*v4 != 35)
  {
LABEL_6:
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"~/Library/Calendar/Calendar.sqlitedb.restored",  @"~/Library/AddressBook/AddressBook.sqlitedb.restored",  @"~/Library/AddressBook/AddressBookImages.sqlitedb.restored",  @"~/Library/SpringBoard/IconState.plist.restored",  @"~/Library/Preferences/com.apple.springboard.plist.restored",  0LL));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)i) stringByExpandingTildeInPath]);
          -[BKMigrator _moveRestoredFileAtPath:](self, "_moveRestoredFileAtPath:", v11);
        }

        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v8);
    }

    goto LABEL_13;
  }

  uint64_t v5 = BKLogCommon(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "A restore is currently running. Waiting to move restored preferences into place until later",  buf,  2u);
  }

- (BOOL)_moveRestoredFileAtPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingPathExtension]);
  id v6 = [v4 fileExistsAtPath:v3];
  if ((_DWORD)v6)
  {
    uint64_t v7 = BKLogCommon(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v3;
      __int16 v18 = 2114;
      v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Moving restored file into place from %{public}@ to %{public}@",  buf,  0x16u);
    }

    [v4 removeItemAtPath:v5 error:0];
    id v15 = 0LL;
    unsigned __int8 v9 = [v4 moveItemAtPath:v3 toPath:v5 error:&v15];
    id v10 = v15;
    v11 = v10;
    if ((v9 & 1) == 0)
    {
      uint64_t v12 = BKLogCommon(v10);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v17 = v3;
        __int16 v18 = 2114;
        v19 = v5;
        __int16 v20 = 2114;
        v21 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unable to move file at path %{public}@ to %{public}@: %{public}@",  buf,  0x20u);
      }
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

@end