@interface UARPObserverUpdate
- (UARPObserverUpdate)initWithRemoteServiceEndpoint:(id)a3;
- (id)remoteObject;
- (id)xpcConnectionToRequestor;
- (void)dealloc;
@end

@implementation UARPObserverUpdate

- (UARPObserverUpdate)initWithRemoteServiceEndpoint:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPObserverUpdate;
  v6 = -[UARPObserverUpdate init](&v12, "init");
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_remoteEndpoint, a3),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(-[UARPObserverUpdate xpcConnectionToRequestor](v7, "xpcConnectionToRequestor")),
        xpcConnection = v7->_xpcConnection,
        v7->_xpcConnection = (NSXPCConnection *)v8,
        xpcConnection,
        !v7->_xpcConnection))
  {
    v10 = 0LL;
  }

  else
  {
    v10 = v7;
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPObserverUpdate;
  -[UARPObserverUpdate dealloc](&v3, "dealloc");
}

- (id)remoteObject
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_100074F28));
  }

  else
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_100047B1C(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    objc_super v3 = 0LL;
  }

  return v3;
}

- (id)xpcConnectionToRequestor
{
  v2 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  self->_remoteEndpoint);
  if (v2)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUObserverXPCClient));
    -[NSXPCConnection setRemoteObjectInterface:](v2, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection resume](v2, "resume");
    BOOL v4 = v2;
  }

  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_100047C1C(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end