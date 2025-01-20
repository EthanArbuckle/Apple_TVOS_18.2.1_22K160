@interface MigratorUpdateHistoryTask
- (MigratorUpdateHistoryTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorUpdateHistoryTask

- (MigratorUpdateHistoryTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MigratorUpdateHistoryTask;
  return -[MigratorTask initWithConfiguration:](&v4, "initWithConfiguration:", a3);
}

- (id)copyConfiguration
{
  return sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"UpdateHistory");
}

- (id)migratorType
{
  return @"UpdateHistory";
}

- (void)main
{
  id v3 = sub_100220C24((uint64_t)&OBJC_CLASS___Storage);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"Documents/AppUpdates.sqlitedb"]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v5 path]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LODWORD(v5) = [v6 fileExistsAtPath:v12];

  if ((_DWORD)v5) {
    sub_1002F1584((uint64_t)self, v12, @"app_updates");
  }
  id v7 = sub_100220C24((uint64_t)&OBJC_CLASS___Storage);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"Documents/updates.sqlitedb"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LODWORD(v9) = [v11 fileExistsAtPath:v10];

  if ((_DWORD)v9) {
    sub_1002F1584((uint64_t)self, v10, @"software_update");
  }
}

@end