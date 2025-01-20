@interface PBUserProfileArchiveController
- (BOOL)isArchiveAvailable;
- (BOOL)removeArchiveWithError:(id *)a3;
- (id)loadArchiveWithError:(id *)a3;
@end

@implementation PBUserProfileArchiveController

- (BOOL)isArchiveAvailable
{
  return sub_10017E7CC();
}

- (id)loadArchiveWithError:(id *)a3
{
  id v10 = 0LL;
  id v4 = sub_10017E87C((uint64_t)&v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v10;
  if (!v5)
  {
    id v7 = sub_10008E3B0();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100278B78();
    }
  }

  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (BOOL)removeArchiveWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v5 = [v4 BOOLForKey:@"PreserveUserProfilesArchive"];

  if (!v5) {
    return sub_10017E938((uint64_t)a3);
  }
  id v6 = sub_10008E3B0();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_100278BE4(v7);
  }

  return 1;
}

@end