@interface SQLiteDatabaseStoreMigrator
- (BOOL)success;
- (NSError)error;
- (SQLiteConnection)connection;
- (SQLiteDatabaseStoreMigrator)initWithConnection:(id)a3;
- (void)_executeQuery:(id)a3 canFailMigration:(BOOL)a4 withResults:(id)a5;
- (void)_executeStatement:(id)a3 canFailMigration:(BOOL)a4 bindings:(id)a5;
- (void)executeOptionalQuery:(id)a3 withResults:(id)a4;
- (void)executeOptionalStatement:(id)a3;
- (void)executeOptionalStatement:(id)a3 bindings:(id)a4;
- (void)executeQuery:(id)a3 withResults:(id)a4;
- (void)executeStatement:(id)a3;
- (void)executeStatement:(id)a3 bindings:(id)a4;
@end

@implementation SQLiteDatabaseStoreMigrator

- (SQLiteDatabaseStoreMigrator)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SQLiteDatabaseStoreMigrator;
  v6 = -[SQLiteDatabaseStoreMigrator init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_success = 1;
  }

  return v7;
}

- (SQLiteConnection)connection
{
  return self->_connection;
}

- (void)executeOptionalStatement:(id)a3
{
}

- (void)executeOptionalStatement:(id)a3 bindings:(id)a4
{
}

- (void)executeStatement:(id)a3
{
}

- (void)executeStatement:(id)a3 bindings:(id)a4
{
}

- (void)executeOptionalQuery:(id)a3 withResults:(id)a4
{
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
}

- (void)_executeStatement:(id)a3 canFailMigration:(BOOL)a4 bindings:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (self->_success)
  {
    connection = self->_connection;
    id v15 = 0LL;
    unsigned __int8 v11 = -[SQLiteConnection executeStatement:error:bindings:]( connection,  "executeStatement:error:bindings:",  v8,  &v15,  v9);
    id v12 = v15;
    id v13 = v15;
    if (v6)
    {
      if (self->_success) {
        BOOL v14 = v11;
      }
      else {
        BOOL v14 = 0;
      }
      self->_success = v14;
    }

    if ((v11 & 1) == 0) {
      objc_storeStrong((id *)&self->_error, v12);
    }
  }

  else
  {
    id v13 = 0LL;
  }
}

- (void)_executeQuery:(id)a3 canFailMigration:(BOOL)a4 withResults:(id)a5
{
  id v8 = a5;
  if (self->_success)
  {
    connection = self->_connection;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000223D8;
    v11[3] = &unk_1002E7A40;
    BOOL v13 = a4;
    v11[4] = self;
    id v10 = v8;
    v11[0] = _NSConcreteStackBlock;
    id v12 = v8;
    -[SQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", a3, v11);

    id v8 = v10;
  }
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
}

@end