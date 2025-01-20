@interface RPCompanionLinkClientDaemonConnection_XPC
- (NSXPCConnection)cnx;
- (RPCompanionLinkClientDaemonConnection_XPC)initWithConnection:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)invalidate;
- (void)setCnx:(id)a3;
@end

@implementation RPCompanionLinkClientDaemonConnection_XPC

- (RPCompanionLinkClientDaemonConnection_XPC)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPCompanionLinkClientDaemonConnection_XPC;
  v6 = -[RPCompanionLinkClientDaemonConnection_XPC init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cnx, a3);
  }

  return v7;
}

- (void)invalidate
{
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_cnx, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)remoteObjectProxy
{
  return -[NSXPCConnection remoteObjectProxy](self->_cnx, "remoteObjectProxy");
}

- (NSXPCConnection)cnx
{
  return self->_cnx;
}

- (void)setCnx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end