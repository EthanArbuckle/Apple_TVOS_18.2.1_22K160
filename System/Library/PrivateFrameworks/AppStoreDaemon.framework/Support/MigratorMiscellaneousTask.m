@interface MigratorMiscellaneousTask
- (MigratorMiscellaneousTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorMiscellaneousTask

- (MigratorMiscellaneousTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MigratorMiscellaneousTask;
  return -[MigratorTask initWithConfiguration:](&v4, "initWithConfiguration:", a3);
}

- (id)copyConfiguration
{
  return sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"Miscellaneous");
}

- (id)migratorType
{
  return @"Miscellaneous";
}

- (void)main
{
  uint64_t v2 = ASDLogHandleForCategory(17LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing miscellaneous migration", v9, 2u);
  }

  sub_1002F991C((uint64_t)&OBJC_CLASS___AppDefaultsManager);
  sub_1002F9AAC((uint64_t)&OBJC_CLASS___AppDefaultsManager, 0);
  sub_10019F528((uint64_t)&OBJC_CLASS___AppPurgeCoordinator);
  objc_super v4 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  id v5 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1001B96EC((uint64_t)v6, v4);

  id v7 = sub_10022D6AC((uint64_t)&OBJC_CLASS___AppLedger);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  sub_10022D7D8((uint64_t)v8);
}

@end