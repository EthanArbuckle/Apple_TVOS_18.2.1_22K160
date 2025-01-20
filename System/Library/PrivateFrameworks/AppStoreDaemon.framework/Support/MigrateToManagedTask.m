@interface MigrateToManagedTask
- (MigrateToManagedTask)init;
- (void)main;
@end

@implementation MigrateToManagedTask

- (MigrateToManagedTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MigrateToManagedTask;
  v2 = -[Task init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    v4 = *(void **)&v2->super._success;
    *(void *)&v2->super._success = v3;
  }

  return v2;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSDatabaseContext sharedDatabaseContext](&OBJC_CLASS___LSDatabaseContext, "sharedDatabaseContext"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001EF0D4;
  v5[3] = &unk_1003EA180;
  v5[4] = self;
  [v3 accessUsingBlock:v5];

  if (self)
  {
    LOBYTE(self->super._keepAlive) = 1;
    objc_setProperty_atomic_copy(self, v4, 0LL, 32LL);
  }

- (void).cxx_destruct
{
}

@end