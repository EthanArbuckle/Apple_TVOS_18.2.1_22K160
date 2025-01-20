@interface TKTokenClientConnection
- (BOOL)isCaller:(id)a3 allowedForToken:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (TKHostTokenConnection)tokenConnection;
- (TKTokenClientConnection)initWithConnection:(id)a3 server:(id)a4;
- (TKTokenServer)server;
- (id)accessRegistry;
- (void)ensureSlotWatcherRunningWithReply:(id)a3;
- (void)getConfigurationEndpoint:(id)a3;
- (void)getEndpoint:(id)a3;
- (void)getSEPKeyEndpoint:(id)a3;
- (void)getTokenEndpointForTokenID:(id)a3 reply:(id)a4;
- (void)getWatcherEndpoint:(id)a3;
- (void)terminate;
@end

@implementation TKTokenClientConnection

- (TKTokenClientConnection)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKTokenClientConnection;
  v8 = -[TKTokenClientConnection init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_server, a4);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000C06C;
    v12[3] = &unk_10001C5E8;
    v13 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_connection);
    [WeakRetained setInvalidationHandler:v12];
  }

  return v9;
}

- (void)getEndpoint:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  v4 = self->_server;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenServerListener](self->_server, "tokenServerListener"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endpoint]);
  v7[2](v7, v6);

  objc_sync_exit(v4);
}

- (BOOL)isCaller:(id)a3 allowedForToken:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc(&OBJC_CLASS___TKTokenAccessRequest);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenID]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 driver]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 extension]);
  id v14 = [v10 initWithCaller:v9 tokenID:v11 extension:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenClientConnection accessRegistry](self, "accessRegistry"));
  unsigned __int8 v16 = [v15 evaluateRequest:v14 error:a5];

  id v17 = sub_10000C30C();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v14 clientBundleID]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenID]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringRepresentation]);
    if ((v16 & 1) != 0) {
      v23 = @"granted";
    }
    else {
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"denied with error: %@",  *a5));
    }
    *(_DWORD *)buf = 138412802;
    v25 = v20;
    __int16 v26 = 2112;
    v27 = v22;
    __int16 v28 = 2112;
    v29 = v23;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Request from: '%@' to access '%@' was %@",  buf,  0x20u);
    if ((v16 & 1) == 0) {
  }
    }

  return v16;
}

- (id)accessRegistry
{
  accessRegistry = self->_accessRegistry;
  if (!accessRegistry)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TKTokenAccessRegistry);
    v5 = self->_accessRegistry;
    self->_accessRegistry = v4;

    accessRegistry = self->_accessRegistry;
  }

  return accessRegistry;
}

- (void)getTokenEndpointForTokenID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TKTokenServer waitForRegistry](self->_server, "waitForRegistry"))
  {
    id v8 = -[TKTokenID initWithTokenID:](objc_alloc(&OBJC_CLASS___TKTokenID), "initWithTokenID:", v6);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenClientConnection server](self, "server"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 tokenRegistry]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 tokenWithTokenID:v8]);

      if (v12)
      {
        v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 queue]);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10000C600;
        v19[3] = &unk_10001C920;
        v19[4] = self;
        id v20 = v12;
        id v22 = v7;
        id v21 = v9;
        dispatch_async(v13, v19);
      }

      else
      {
        id v16 = sub_10000C30C();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100011208((uint64_t)v8, v17);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TKErrorDomain,  -7LL,  0LL));
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v18);
      }
    }

    else
    {
      id v14 = sub_10000C30C();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        sub_100011198((uint64_t)v6, v15);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TKErrorDomain,  -7LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
    }
  }

  else
  {
    id v8 = (TKTokenID *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TKErrorDomain,  -2LL,  0LL));
    (*((void (**)(id, void, TKTokenID *))v7 + 2))(v7, 0LL, v8);
  }
}

- (void)getConfigurationEndpoint:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  if (-[TKTokenServer waitForRegistry](self->_server, "waitForRegistry"))
  {
    v4 = self->_server;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenRegistry](self->_server, "tokenRegistry"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 listener]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
    v8[2](v8, v7);

    objc_sync_exit(v4);
  }

  else
  {
    v8[2](v8, 0LL);
  }
}

- (void)getWatcherEndpoint:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  if (-[TKTokenServer waitForRegistry](self->_server, "waitForRegistry"))
  {
    v4 = self->_server;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenWatcherListener](self->_server, "tokenWatcherListener"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endpoint]);
    v7[2](v7, v6);

    objc_sync_exit(v4);
  }

  else
  {
    v7[2](v7, 0LL);
  }
}

- (void)getSEPKeyEndpoint:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  v4 = self->_server;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer SEPKeyListener](self->_server, "SEPKeyListener"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endpoint]);
  v7[2](v7, v6);

  objc_sync_exit(v4);
}

- (void)ensureSlotWatcherRunningWithReply:(id)a3
{
  id v6 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer ensureSlotWatcherIsRunning](self->_server, "ensureSlotWatcherIsRunning"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TKTokenServer ensureSlotWatcherIsRunning](self->_server, "ensureSlotWatcherIsRunning"));
    v5[2]();
  }

  v6[2]();
}

- (void)terminate
{
  tokenConnection = self->_tokenConnection;
  self->_tokenConnection = 0LL;
}

- (TKHostTokenConnection)tokenConnection
{
  return (TKHostTokenConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (TKTokenServer)server
{
  return (TKTokenServer *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end