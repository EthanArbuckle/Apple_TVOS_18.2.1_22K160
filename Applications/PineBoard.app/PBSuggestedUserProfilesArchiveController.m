@interface PBSuggestedUserProfilesArchiveController
- (BOOL)isArchiveAvailable;
- (BOOL)removeArchiveWithError:(id *)a3;
- (id)loadArchiveWithError:(id *)a3;
@end

@implementation PBSuggestedUserProfilesArchiveController

- (BOOL)isArchiveAvailable
{
  return sub_1000239B4();
}

- (id)loadArchiveWithError:(id *)a3
{
  id v10 = 0LL;
  id v4 = sub_100023A20((uint64_t)&v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v10;
  if (!v5)
  {
    id v7 = sub_100083FF0();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1002745B4();
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
  unsigned int v5 = [v4 BOOLForKey:@"PreserveSuggestedUserProfilesArchive"];

  if (!v5) {
    return sub_100023ADC((uint64_t)a3);
  }
  id v6 = sub_100083FF0();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_100274620(v7);
  }

  return 1;
}

@end