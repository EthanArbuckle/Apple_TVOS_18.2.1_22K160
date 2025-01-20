@interface DIIOClientDelegate
- (BOOL)setupNewConnection:(id)a3;
- (DIIOClientDelegate)initWithIODaemon:(id)a3;
- (DIIODaemonDelegate)weakDaemon;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (void)addToRefCountWithReply:(id)a3;
- (void)createListener;
- (void)setWeakDaemon:(id)a3;
@end

@implementation DIIOClientDelegate

- (DIIOClientDelegate)initWithIODaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DIIOClientDelegate;
  v5 = -[DIBaseServiceDelegate init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakDaemon, v4);
  }

  return v6;
}

- (void)addToRefCountWithReply:(id)a3
{
  v3 = (void (**)(id, void))a3;
  int v4 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v12 = 0LL;
    uint64_t v5 = sub_1000B85DC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v14 = 45;
    __int16 v15 = 2080;
    v16 = "-[DIIOClientDelegate addToRefCountWithReply:]";
    LODWORD(v11) = 18;
    objc_super v8 = (char *)_os_log_send_and_compose_impl( v7,  &v12,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%.*s: Reached, keeping connection alive",  (int)buf,  v11);

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }

  else
  {
    uint64_t v9 = sub_1000B85DC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v14 = 45;
      __int16 v15 = 2080;
      v16 = "-[DIIOClientDelegate addToRefCountWithReply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%.*s: Reached, keeping connection alive",  buf,  0x12u);
    }
  }

  *__error() = v4;
  v3[2](v3, 0LL);
}

- (BOOL)setupNewConnection:(id)a3
{
  id v4 = a3;
  int v5 = *__error();
  if (sub_1000B8654())
  {
    id location = 0LL;
    uint64_t v6 = sub_1000B85DC();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v40 = 41;
    __int16 v41 = 2080;
    v42 = "-[DIIOClientDelegate setupNewConnection:]";
    LODWORD(v28) = 18;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl( v8,  &location,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: A new client has connected to the clients listener",  (int)buf,  v28);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    uint64_t v10 = sub_1000B85DC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v40 = 41;
      __int16 v41 = 2080;
      v42 = "-[DIIOClientDelegate setupNewConnection:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%.*s: A new client has connected to the clients listener",  buf,  0x12u);
    }
  }

  *__error() = v5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIIOClientProtocol));
  [v4 setExportedInterface:v12];

  [v4 setExportedObject:self];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100009050;
  v34[3] = &unk_1001655B8;
  objc_copyWeak(&v35, &location);
  objc_copyWeak(&v36, &from);
  [v4 setInvalidationHandler:v34];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10000921C;
  v31[3] = &unk_1001655B8;
  objc_copyWeak(&v32, &location);
  objc_copyWeak(&v33, &from);
  [v4 setInterruptionHandler:v31];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOClientDelegate weakDaemon](self, "weakDaemon"));
  int v14 = v13;
  if (v13)
  {
    id v15 = v13;
    objc_sync_enter(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeConnections]);
    [v16 addObject:v4];

    HIDWORD(v29) = *__error();
    if (sub_1000B8654())
    {
      uint64_t v30 = 0LL;
      uint64_t v17 = sub_1000B85DC();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v19 = 3LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue([v15 activeConnections]);
      id v21 = [v20 count];
      *(_DWORD *)buf = 68158210;
      int v40 = 41;
      __int16 v41 = 2080;
      v42 = "-[DIIOClientDelegate setupNewConnection:]";
      __int16 v43 = 2048;
      id v44 = v21;
      LODWORD(v28) = 28;
      v22 = (char *)_os_log_send_and_compose_impl( v19,  &v30,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%.*s: # of active connections: %lu",  (int)buf,  v28,  v29);

      if (v22)
      {
        fprintf(__stderrp, "%s\n", v22);
        free(v22);
      }
    }

    else
    {
      uint64_t v23 = sub_1000B85DC();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v15 activeConnections]);
        id v26 = [v25 count];
        *(_DWORD *)buf = 68158210;
        int v40 = 41;
        __int16 v41 = 2080;
        v42 = "-[DIIOClientDelegate setupNewConnection:]";
        __int16 v43 = 2048;
        id v44 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%.*s: # of active connections: %lu",  buf,  0x1Cu);
      }
    }

    *__error() = HIDWORD(v29);
    objc_sync_exit(v15);
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)createListener
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v3);
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](self, "listener"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 endpoint]);

  return (NSXPCListenerEndpoint *)v3;
}

- (DIIODaemonDelegate)weakDaemon
{
  return (DIIODaemonDelegate *)objc_loadWeakRetained((id *)&self->_weakDaemon);
}

- (void)setWeakDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end