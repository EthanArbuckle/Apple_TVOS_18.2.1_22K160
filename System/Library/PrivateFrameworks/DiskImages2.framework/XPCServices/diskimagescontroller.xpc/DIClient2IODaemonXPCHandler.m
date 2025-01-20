@interface DIClient2IODaemonXPCHandler
- (BOOL)addToRefCountWithError:(id *)a3;
- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3;
- (NSXPCListenerEndpoint)xpcListenerEndpoint;
- (id)remoteObjectInterface;
- (void)createConnection;
- (void)setXpcListenerEndpoint:(id)a3;
@end

@implementation DIClient2IODaemonXPCHandler

- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIClient2IODaemonXPCHandler;
  v6 = -[DIBaseXPCHandler init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcListenerEndpoint, a3);
  }

  return v7;
}

- (void)createConnection
{
  int v3 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    uint64_t v4 = sub_1000BE278();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v6 = 3LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v20 = 47;
    __int16 v21 = 2080;
    v22 = "-[DIClient2IODaemonXPCHandler createConnection]";
    LODWORD(v17) = 18;
    v7 = (char *)_os_log_send_and_compose_impl( v6,  &v18,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "%.*s: Creating connection to IO daemon clients listener",  (int)buf,  v17);

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }

  else
  {
    uint64_t v8 = sub_1000BE278();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v20 = 47;
      __int16 v21 = 2080;
      v22 = "-[DIClient2IODaemonXPCHandler createConnection]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%.*s: Creating connection to IO daemon clients listener",  buf,  0x12u);
    }
  }

  *__error() = v3;
  v10 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIClient2IODaemonXPCHandler xpcListenerEndpoint](self, "xpcListenerEndpoint"));
  v12 = -[NSXPCConnection initWithListenerEndpoint:](v10, "initWithListenerEndpoint:", v11);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIClient2IODaemonXPCHandler remoteObjectInterface](self, "remoteObjectInterface"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v14 setRemoteObjectInterface:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v15 setInvalidationHandler:&stru_100190128];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v16 setInterruptionHandler:&stru_100190148];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIIOClientProtocol);
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  objc_super v9 = sub_1000EE610;
  v10 = &unk_10017A420;
  objc_copyWeak(&v11, &location);
  [v5 addToRefCountWithReply:&v7];

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (NSXPCListenerEndpoint)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end