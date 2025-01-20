@interface AppInstallsDatabaseTransaction
- (AppInstallsDatabaseTransaction)initWithConnection:(id)a3;
@end

@implementation AppInstallsDatabaseTransaction

- (AppInstallsDatabaseTransaction)initWithConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AppInstallsDatabaseTransaction;
  v3 = -[AppInstallsDatabaseSession initWithConnection:](&v7, "initWithConnection:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___AppInstallsDatabaseChangeset);
    changeset = v3->_changeset;
    v3->_changeset = v4;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end