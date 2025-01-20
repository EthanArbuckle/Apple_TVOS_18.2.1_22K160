@interface DSPreferences
+ (id)sharedPreferences;
- (DSPreferences)init;
- (void)refreshPreferences;
@end

@implementation DSPreferences

+ (id)sharedPreferences
{
  if (qword_1000667D8 != -1) {
    dispatch_once(&qword_1000667D8, &stru_100060B18);
  }
  return (id)qword_1000667D0;
}

- (DSPreferences)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DSPreferences;
  v2 = -[DSPreferences init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    v11 = sub_1000122E8;
    v12 = &unk_100060B40;
    v14 = &v15;
    v4 = v2;
    v13 = v4;
    v5 = objc_retainBlock(&v9);
    v6 = (int *)(v16 + 3);
    v7 = &_dispatch_main_q;
    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", v6, &_dispatch_main_q, v5);

    -[DSPreferences refreshPreferences](v4, "refreshPreferences", v9, v10, v11, v12);
    _Block_object_dispose(&v15, 8);
  }

  return v3;
}

- (void)refreshPreferences
{
  id v2 = shared_filesystem_metadata_snapshot_service_log_handle();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Refreshing preferences", (uint8_t *)&v11, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/Library/Managed Preferences/mobile/com.apple.FilesystemMetadataSnapshotService.plist"));
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Preferences (profile): %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v7 synchronize];
  id v8 = shared_filesystem_metadata_snapshot_service_log_handle();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);
    int v11 = 138543362;
    v12 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Preferences (defaults): %{public}@",  (uint8_t *)&v11,  0xCu);
  }
}

@end