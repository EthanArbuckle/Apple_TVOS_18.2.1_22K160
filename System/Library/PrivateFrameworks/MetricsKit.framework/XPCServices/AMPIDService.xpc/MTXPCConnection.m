@interface MTXPCConnection
- (MTIDSecretStore)secretStore;
- (MTXPCConnection)initWithXPCConnection:(id)a3 secretStore:(id)a4;
- (NSXPCConnection)connection;
- (void)doClearLocalData;
- (void)doMaintainSchemes:(id)a3 options:(id)a4;
- (void)doResetSchemes:(id)a3 options:(id)a4 completion:(id)a5;
- (void)secretForScheme:(id)a3 options:(id)a4 completion:(id)a5;
- (void)syncForSchemes:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation MTXPCConnection

- (MTXPCConnection)initWithXPCConnection:(id)a3 secretStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTXPCConnection;
  v8 = -[MTXPCConnection init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_secretStore, a4);
  }

  return v9;
}

- (void)secretForScheme:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTXPCConnection secretStore](self, "secretStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 secretForScheme:v10 options:v9]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100005588;
  v14[3] = &unk_100020508;
  id v15 = v8;
  id v13 = v8;
  [v12 addFinishBlock:v14];
}

- (void)doResetSchemes:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTXPCConnection secretStore](self, "secretStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resetSchemes:v10 options:v9]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000566C;
  v14[3] = &unk_100020530;
  id v15 = v8;
  id v13 = v8;
  [v12 addFinishBlock:v14];
}

- (void)doMaintainSchemes:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTXPCConnection secretStore](self, "secretStore"));
  char v8 = objc_opt_respondsToSelector(v7, "maintainSchemes:options:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTXPCConnection secretStore](self, "secretStore"));
    id v10 = [v9 maintainSchemes:v11 options:v6];
  }
}

- (void)doClearLocalData
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTXPCConnection secretStore](self, "secretStore"));
  [v2 clearLocalData];
}

- (void)syncForSchemes:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTXPCConnection secretStore](self, "secretStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 syncForSchemes:v10 options:v9]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100005818;
  v14[3] = &unk_100020530;
  id v15 = v8;
  id v13 = v8;
  [v12 addFinishBlock:v14];
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (MTIDSecretStore)secretStore
{
  return self->_secretStore;
}

- (void).cxx_destruct
{
}

@end