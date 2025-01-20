@interface DALauncherServiceManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DALauncherServiceManager)init;
- (NSMutableSet)remoteClients;
- (NSXPCListener)listener;
- (void)informExitingForReason:(int64_t)a3;
- (void)initListener;
- (void)ping:(id)a3;
- (void)setListener:(id)a3;
- (void)setRemoteClients:(id)a3;
@end

@implementation DALauncherServiceManager

+ (id)sharedInstance
{
  if (qword_10003A650 != -1) {
    dispatch_once(&qword_10003A650, &stru_10002CF20);
  }
  return (id)qword_10003A648;
}

- (DALauncherServiceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DALauncherServiceManager;
  v2 = -[DALauncherServiceManager init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    remoteClients = v2->_remoteClients;
    v2->_remoteClients = v3;

    listener = v2->_listener;
    v2->_listener = 0LL;

    -[DALauncherServiceManager initListener](v2, "initListener");
  }

  return v2;
}

- (void)informExitingForReason:(int64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager remoteClients](self, "remoteClients", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) diagnosticsExitingForReason:a3];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager remoteClients](self, "remoteClients"));
  [v10 removeAllObjects];
}

- (void)initListener
{
  v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.diagnostics.launcher-service");
  -[DALauncherServiceManager setListener:](self, "setListener:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager listener](self, "listener"));
  [v4 setDelegate:self];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager listener](self, "listener"));
  [v5 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticLogHandleForCategory(8LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "New connection %@ requested for remote runner service",  (uint8_t *)&buf,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.diagnostics.launcher-service"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && [v10 BOOLValue])
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DADiagnosticsLauncherServerProtocol));
    [v7 setExportedObject:self];
    [v7 setExportedInterface:v12];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DADiagnosticsLauncherClientProtocol));
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000LL;
    v29 = sub_1000180B0;
    v30 = sub_1000180C0;
    id v31 = 0LL;
    objc_initWeak(&location, v7);
    [v7 setRemoteObjectInterface:v13];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000180C8;
    v22[3] = &unk_10002CF48;
    v22[4] = &buf;
    objc_copyWeak(&v23, &location);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 synchronousRemoteObjectProxyWithErrorHandler:v22]);
    if (v14 && !*(void *)(*((void *)&buf + 1) + 40LL))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager remoteClients](self, "remoteClients"));
      [v18 addObject:v14];

      [v7 resume];
      uint64_t v19 = DiagnosticLogHandleForCategory(8LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 138412290;
        id v26 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Connection %@ established with launcher service",  v25,  0xCu);
      }

      BOOL v15 = 1;
    }

    else
    {
      BOOL v15 = 0;
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    uint64_t v16 = DiagnosticLogHandleForCategory(8LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000194C4((uint64_t)v7, v17);
    }

    [v7 invalidate];
    BOOL v15 = 0;
  }

  return v15;
}

- (void)ping:(id)a3
{
  v3 = (void (**)(void))a3;
  uint64_t v4 = DiagnosticLogHandleForCategory(8LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Launcher service from iOSDiagnostics is pinging to see if we are alive",  v6,  2u);
  }

  v3[2](v3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)remoteClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRemoteClients:(id)a3
{
}

- (void).cxx_destruct
{
}

@end