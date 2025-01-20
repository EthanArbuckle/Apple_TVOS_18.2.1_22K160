@interface RMMigrationStatusPath
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
@end

@implementation RMMigrationStatusPath

- (NSString)identifier
{
  return (NSString *)@"RMMigrationStatusPath";
}

- (BOOL)executeReturningError:(id *)a3
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationStatusPath](&OBJC_CLASS___RMLog, "migrationStatusPath", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10004B4A8(v3);
  }

  return 1;
}

@end