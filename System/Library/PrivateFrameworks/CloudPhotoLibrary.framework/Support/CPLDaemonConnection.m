@interface CPLDaemonConnection
- (CPLDaemonConnection)init;
- (OS_dispatch_queue)queue;
- (id)proxyWithErrorHandler:(id)a3;
- (void)close;
- (void)dealloc;
@end

@implementation CPLDaemonConnection

- (CPLDaemonConnection)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLDaemonConnection;
  v2 = -[CPLDaemonConnection init](&v11, "init");
  if (v2)
  {
    v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.cloudphotod.daemon",  0LL);
    id v4 = sub_100010460();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v5);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.daemon.connection", 0LL);
    -[NSXPCConnection _setQueue:](v3, "_setQueue:", v6);

    connection = v2->_connection;
    v2->_connection = v3;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection _queue](v2->_connection, "_queue"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    -[NSXPCConnection resume](v2->_connection, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLDaemonConnection;
  -[CPLDaemonConnection dealloc](&v3, "dealloc");
}

- (void)close
{
  connection = self->_connection;
  self->_connection = 0LL;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  if (!connection) {
    sub_10018E7E8((uint64_t)self, (uint64_t)a2);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  v5));

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end