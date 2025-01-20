@interface AppInstallsDatabaseSession
- (AppInstallsDatabaseSession)initWithConnection:(id)a3;
- (SQLiteConnection)connection;
@end

@implementation AppInstallsDatabaseSession

- (AppInstallsDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AppInstallsDatabaseSession;
  v6 = -[AppInstallsDatabaseSession init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end