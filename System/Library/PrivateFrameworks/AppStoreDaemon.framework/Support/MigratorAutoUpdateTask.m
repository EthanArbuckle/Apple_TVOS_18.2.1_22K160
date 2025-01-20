@interface MigratorAutoUpdateTask
- (MigratorAutoUpdateTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorAutoUpdateTask

- (MigratorAutoUpdateTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MigratorAutoUpdateTask;
  return -[MigratorTask initWithConfiguration:](&v4, "initWithConfiguration:", a3);
}

- (id)copyConfiguration
{
  return sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"AutomaticUpdates");
}

- (id)migratorType
{
  return @"AutomaticUpdates";
}

- (void)main
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v2 setupFollowingMigration];
}

@end