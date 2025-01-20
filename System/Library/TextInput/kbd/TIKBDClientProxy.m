@interface TIKBDClientProxy
+ (id)KBDClientProxyWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (TIKBDClientProxy)init;
- (TIKBDClientProxy)initWithConnection:(id)a3;
- (void)invalidate;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)pushCandidates:(id)a3 requestToken:(id)a4;
@end

@implementation TIKBDClientProxy

+ (id)KBDClientProxyWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithConnection:v4];

  return v5;
}

- (TIKBDClientProxy)init
{
  return -[TIKBDClientProxy initWithConnection:](self, "initWithConnection:", 0LL);
}

- (TIKBDClientProxy)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TIKBDClientProxy;
  id v5 = -[TIKBDClientProxy init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

- (void)invalidate
{
}

- (void)pushCandidates:(id)a3 requestToken:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKBDClientProxy connection](self, "connection"));
  if (v10 && v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKBDClientProxy connection](self, "connection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxy]);

    [v9 pushAutocorrections:v10 requestToken:v6];
  }
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKBDClientProxy connection](self, "connection"));
  if (v10 && v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKBDClientProxy connection](self, "connection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxy]);

    [v9 pushCandidateResultSet:v10 requestToken:v6];
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void).cxx_destruct
{
}

@end