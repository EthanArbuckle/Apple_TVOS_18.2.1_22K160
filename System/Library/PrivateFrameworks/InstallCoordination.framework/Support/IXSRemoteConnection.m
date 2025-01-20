@interface IXSRemoteConnection
- (IXSRemoteConnection)initWithRemoteConnection:(id)a3;
- (OS_xpc_remote_connection)remoteConnection;
- (void)activate;
- (void)cancel;
- (void)sendBarrier:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setRemoteConnection:(id)a3;
@end

@implementation IXSRemoteConnection

- (IXSRemoteConnection)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXSRemoteConnection;
  v5 = -[IXSRemoteConnection init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[IXSRemoteConnection setRemoteConnection:](v5, "setRemoteConnection:", v4);
  }

  return v6;
}

- (void)setEventHandler:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));

  if (v6 && v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));
    xpc_remote_connection_set_event_handler(v5, v6);
  }
}

- (void)cancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));
    xpc_remote_connection_cancel();

    -[IXSRemoteConnection setRemoteConnection:](self, "setRemoteConnection:", 0LL);
  }

- (void)sendMessage:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));
    xpc_remote_connection_send_message(v5, v6);
  }
}

- (void)sendBarrier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100012BB0;
    v7[3] = &unk_100020A78;
    id v8 = v4;
    xpc_remote_connection_send_barrier(v6, v7);
  }
}

- (void)activate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[IXSRemoteConnection remoteConnection](self, "remoteConnection"));
    xpc_remote_connection_activate(v4);
  }

- (OS_xpc_remote_connection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end