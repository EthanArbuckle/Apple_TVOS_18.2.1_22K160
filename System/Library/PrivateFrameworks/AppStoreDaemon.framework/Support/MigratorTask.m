@interface MigratorTask
- (MigratorTask)initWithConfiguration:(id)a3;
- (NSString)migratorType;
- (id)copyConfiguration;
- (void)main;
@end

@implementation MigratorTask

- (MigratorTask)initWithConfiguration:(id)a3
{
  return -[Task initWithoutKeepAlive](self, "initWithoutKeepAlive", a3);
}

- (id)copyConfiguration
{
  return 0LL;
}

- (NSString)migratorType
{
  return 0LL;
}

- (void)main
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[KeepAlive keepAliveWithFormat:]( &OBJC_CLASS___KeepAlive,  "keepAliveWithFormat:",  @"com.apple.appstored.%@",  v5));

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MigratorTask;
  -[MigratorTask main](&v7, "main");
}

- (void).cxx_destruct
{
}

@end