@interface RMMigrationSystemContainer
- (BOOL)_directoryExistsAtURL:(id)a3;
- (BOOL)_migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)_moveDirectory:(id)a3 fromURL:(id)a4 toURL:(id)a5 error:(id *)a6;
- (BOOL)_okToMigrateFromURL:(id)a3 toURL:(id)a4;
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
@end

@implementation RMMigrationSystemContainer

- (NSString)identifier
{
  return (NSString *)@"RMMigrationSystemContainer";
}

- (BOOL)executeReturningError:(id *)a3
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSystemContainer](&OBJC_CLASS___RMLog, "migrationSystemContainer", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10004C188();
  }

  return 1;
}

- (BOOL)_okToMigrateFromURL:(id)a3 toURL:(id)a4
{
  uint64_t v6 = DatabaseDirectoryName;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a3 URLByAppendingPathComponent:v6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v6]);

  unsigned __int8 v10 = -[RMMigrationSystemContainer _directoryExistsAtURL:](self, "_directoryExistsAtURL:", v8);
  unsigned int v11 = -[RMMigrationSystemContainer _directoryExistsAtURL:](self, "_directoryExistsAtURL:", v9);
  if ((v10 & 1) == 0)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSystemContainer](&OBJC_CLASS___RMLog, "migrationSystemContainer"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10004C1E0();
    }
  }

  if (v11)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSystemContainer](&OBJC_CLASS___RMLog, "migrationSystemContainer"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10004C1B4();
    }
  }

  return v10 & ~(_BYTE)v11;
}

- (BOOL)_directoryExistsAtURL:(id)a3
{
  char v8 = 0;
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  unsigned __int8 v6 = [v4 fileExistsAtPath:v5 isDirectory:&v8];
  if (v8) {
    return v6;
  }
  else {
    return 0;
  }
}

- (BOOL)_migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSystemContainer](&OBJC_CLASS___RMLog, "migrationSystemContainer"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10004C20C();
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v22[0] = DatabaseDirectoryName;
  v22[1] = StatusDirectoryName;
  v22[2] = IdentitiesDirectoryName;
  v22[3] = HTTPLogsDirectoryName;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL, 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        if (!-[RMMigrationSystemContainer _moveDirectory:fromURL:toURL:error:]( self,  "_moveDirectory:fromURL:toURL:error:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  v8,  v9,  a5))
        {
          BOOL v16 = 0;
          goto LABEL_13;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (BOOL)_moveDirectory:(id)a3 fromURL:(id)a4 toURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([a4 URLByAppendingPathComponent:v9]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v9]);

  char v43 = 0;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
  unsigned __int8 v15 = [v13 fileExistsAtPath:v14 isDirectory:&v43];

  if ((v15 & 1) == 0)
  {
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSystemContainer](&OBJC_CLASS___RMLog, "migrationSystemContainer"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_10004C35C((uint64_t)v9, v32, v33, v34, v35, v36, v37, v38);
    }

    id v30 = 0LL;
    goto LABEL_12;
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
  id v42 = 0LL;
  int v18 = DMCSafelyCopyItemAtPathToDestinationPath(v16, v17, &v42);
  id v19 = v42;

  __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSystemContainer](&OBJC_CLASS___RMLog, "migrationSystemContainer"));
  __int128 v21 = v20;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10004C298((uint64_t)v9, v21, v22, v23, v24, v25, v26, v27);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v41 = v19;
    unsigned __int8 v29 = [v28 removeItemAtURL:v11 error:&v41];
    id v30 = v41;

    if ((v29 & 1) == 0)
    {
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSystemContainer](&OBJC_CLASS___RMLog, "migrationSystemContainer"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10004C238();
      }
    }

@end