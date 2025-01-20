@interface MigratorArcadeTask
- (MigratorArcadeTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorArcadeTask

- (MigratorArcadeTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MigratorArcadeTask;
  return -[MigratorTask initWithConfiguration:](&v4, "initWithConfiguration:", a3);
}

- (id)copyConfiguration
{
  return sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"Arcade");
}

- (id)migratorType
{
  return @"Arcade";
}

- (void)main
{
  v2 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v3 = ASDLogHandleForCategory(17LL);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412290;
    v30 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%@] Performing arcade migration",  (uint8_t *)&v29,  0xCu);
  }

  id v5 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1002A9094((uint64_t)v6, @"Migration");

  id v7 = sub_100196040((uint64_t)&OBJC_CLASS___ActivityManager);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  if (v8) {
    sub_100197418(v8, 5LL, @"Migration", 1, 0LL);
  }

  id v10 = sub_100196040((uint64_t)&OBJC_CLASS___ActivityManager);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)v11;
  if (v11) {
    sub_100197418(v11, 1LL, @"Migration", 1, 0LL);
  }

  id v13 = sub_100196040((uint64_t)&OBJC_CLASS___ActivityManager);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)v14;
  if (v14) {
    sub_100197418(v14, 2LL, @"Migration", 1, 0LL);
  }

  id v16 = sub_100196040((uint64_t)&OBJC_CLASS___ActivityManager);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)v17;
  if (v17) {
    sub_100197418(v17, 7LL, @"Migration", 1, 0LL);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ams_activeiTunesAccount"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[KatanaSubscriptionCoordinator shared]( &OBJC_CLASS____TtC9appstored29KatanaSubscriptionCoordinator,  "shared"));
    unsigned int v22 = [v21 migrateSubscriptionStateWithAccount:v20 logKey:v2];

    uint64_t v23 = ASDLogHandleForCategory(17LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412546;
      v30 = v2;
      __int16 v31 = 1024;
      unsigned int v32 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "[%@] Migrated arcade subscription state with result: %{BOOL}d",  (uint8_t *)&v29,  0x12u);
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[KatanaSubscriptionCoordinator shared]( &OBJC_CLASS____TtC9appstored29KatanaSubscriptionCoordinator,  "shared"));
  unsigned int v26 = [v25 removeStaleSubscriptionInfoWithLogKey:v2];

  uint64_t v27 = ASDLogHandleForCategory(17LL);
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    int v29 = 138412546;
    v30 = v2;
    __int16 v31 = 1024;
    unsigned int v32 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "[%@] Cleaned up subscription state with result: %{BOOL}d",  (uint8_t *)&v29,  0x12u);
  }
}

@end