@interface DMDConfigurationSourceTaskOperation
- (DMDConfigurationSourceController)controller;
- (DMDConfigurationSourceTaskOperation)initWithController:(id)a3;
- (NSString)machServiceName;
- (NSXPCConnection)connection;
- (NSXPCListenerEndpoint)anonymousEndpoint;
- (void)_tryConnectingToNamedService:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchRemoteProxy:(id)a3;
- (void)setAnonymousEndpoint:(id)a3;
- (void)setConnection:(id)a3;
- (void)setController:(id)a3;
- (void)setMachServiceName:(id)a3;
@end

@implementation DMDConfigurationSourceTaskOperation

- (DMDConfigurationSourceTaskOperation)initWithController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DMDConfigurationSourceTaskOperation;
  v5 = -[DMDConfigurationSourceTaskOperation init](&v14, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 source]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 listenerEndpoint]);
    anonymousEndpoint = v5->_anonymousEndpoint;
    v5->_anonymousEndpoint = (NSXPCListenerEndpoint *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 source]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 machServiceName]);
    v11 = (NSString *)[v10 copy];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = v11;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDConfigurationSourceTaskOperation;
  -[DMDConfigurationSourceTaskOperation dealloc](&v3, "dealloc");
}

- (void)fetchRemoteProxy:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002CD5C;
  v4[3] = &unk_10009E7D8;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[DMDConfigurationSourceTaskOperation _tryConnectingToNamedService:completion:]( v5,  "_tryConnectingToNamedService:completion:",  0LL,  v4);
}

- (void)_tryConnectingToNamedService:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation machServiceName](self, "machServiceName"));
    if (v7)
    {
      v8 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation machServiceName](self, "machServiceName"));
      v10 = -[NSXPCConnection initWithMachServiceName:options:](v8, "initWithMachServiceName:options:", v9, 0LL);
LABEL_6:
      v12 = v10;
      -[DMDConfigurationSourceTaskOperation setConnection:](self, "setConnection:", v10);

      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation anonymousEndpoint](self, "anonymousEndpoint"));
    if (v7)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation anonymousEndpoint](self, "anonymousEndpoint"));
      v10 = -[NSXPCConnection initWithListenerEndpoint:](v11, "initWithListenerEndpoint:", v9);
      goto LABEL_6;
    }
  }

  -[DMDConfigurationSourceTaskOperation setConnection:](self, "setConnection:", 0LL);
LABEL_8:

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
  if (v13)
  {
    uint64_t v14 = DMFConfigurationSourceClientXPCInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
    [v16 setRemoteObjectInterface:v15];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
    [v17 resume];

    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    v33 = sub_10002D214;
    v34 = sub_10002D224;
    id v35 = 0LL;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation connection](self, "connection"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10002D22C;
    v27[3] = &unk_10009E800;
    id v19 = v6;
    id v28 = v19;
    v29 = &v30;
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 remoteObjectProxyWithErrorHandler:v27]);
    v21 = (void *)v31[5];
    v31[5] = v20;

    v22 = (void *)v31[5];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10002D26C;
    v24[3] = &unk_10009E828;
    v26 = &v30;
    id v25 = v19;
    [v22 probe:v24];

    _Block_object_dispose(&v30, 8);
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4099LL,  0LL));
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v23);
  }
}

- (DMDConfigurationSourceController)controller
{
  return (DMDConfigurationSourceController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)anonymousEndpoint
{
  return self->_anonymousEndpoint;
}

- (void)setAnonymousEndpoint:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end