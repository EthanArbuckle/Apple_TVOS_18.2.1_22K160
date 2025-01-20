@interface GKSQLRunner
+ (id)runnerWithConnection:(id)a3;
- (GKDatabaseConnection)connection;
- (GKSQLRunner)initWithConnection:(id)a3;
- (int)runSQL:(id)a3;
- (int)runSQLFromFileAtPath:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation GKSQLRunner

+ (id)runnerWithConnection:(id)a3
{
  id v3 = a3;
  v4 = -[GKSQLRunner initWithConnection:](objc_alloc(&OBJC_CLASS___GKSQLRunner), "initWithConnection:", v3);

  return v4;
}

- (GKSQLRunner)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKSQLRunner;
  v5 = -[GKSQLRunner init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[GKSQLRunner setConnection:](v5, "setConnection:", v4);
  }

  return v6;
}

- (int)runSQLFromFileAtPath:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a3,  4LL,  0LL));
  LODWORD(self) = -[GKSQLRunner runSQL:](self, "runSQL:", v4);

  return (int)self;
}

- (int)runSQL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B7BC4;
  v8[3] = &unk_100270BC0;
  v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  -[GKDatabaseConnection performSync:](connection, "performSync:", v8);
  LODWORD(connection) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)connection;
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end