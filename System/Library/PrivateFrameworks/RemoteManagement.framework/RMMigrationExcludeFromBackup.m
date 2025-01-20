@interface RMMigrationExcludeFromBackup
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
@end

@implementation RMMigrationExcludeFromBackup

- (NSString)identifier
{
  return (NSString *)@"RMMigrationExcludeFromBackup";
}

- (BOOL)executeReturningError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations baseDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "baseDirectoryURLCreateIfNeeded:",  0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationExcludeFromBackup](&OBJC_CLASS___RMLog, "migrationExcludeFromBackup"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10004B3AC(v11, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_7;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  char v9 = DMCSetSkipBackupAttributeToItemAtPath(v8, 1LL);

  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationExcludeFromBackup](&OBJC_CLASS___RMLog, "migrationExcludeFromBackup"));
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10004B2E4(v11, v12, v13, v14, v15, v16, v17, v18);
    }
LABEL_7:
    BOOL v26 = 1;
    goto LABEL_8;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10004B318(v4, v11);
  }

  if (!a3)
  {
    BOOL v26 = 0;
    goto LABEL_9;
  }

  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
  v11 = v28;
  if (v28)
  {
    v11 = v28;
    BOOL v26 = 0;
    *a3 = v11;
  }

  else
  {
    BOOL v26 = 0;
  }

@end