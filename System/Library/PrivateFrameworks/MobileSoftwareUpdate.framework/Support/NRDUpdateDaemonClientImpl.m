@interface NRDUpdateDaemonClientImpl
- (BOOL)resendOnError:(id)a3;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (void)_invalidateConnection;
- (void)acquireNRDUpdateBrain:(id)a3 reply:(id)a4;
- (void)connectToServerIfNecessary;
- (void)getNRDUpdateBrainEndpoint:(id)a3;
- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5;
- (void)noteConnectionDropped;
- (void)update:(id)a3;
- (void)update:(id)a3 reply:(id)a4;
@end

@implementation NRDUpdateDaemonClientImpl

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  -[NRDUpdateDaemonClientImpl connectToServerIfNecessary](self, "connectToServerIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_serverConnection,  "remoteObjectProxyWithErrorHandler:",  v4));

  return v5;
}

- (void)_invalidateConnection
{
  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    -[NSXPCConnection setInvalidationHandler:](serverConnection, "setInvalidationHandler:", 0LL);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", 0LL);
    -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
    id v4 = self->_serverConnection;
    self->_serverConnection = 0LL;

    self->_connected = 0;
  }

- (void)connectToServerIfNecessary
{
  if (!self->_connected)
  {
    -[NRDUpdateDaemonClientImpl _invalidateConnection](self, "_invalidateConnection");
    v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.mobile.NRDUpdated",  0LL);
    serverConnection = self->_serverConnection;
    self->_serverConnection = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NRDUpdated.serverConnectionQueue", &_dispatch_queue_attr_concurrent);
    -[NSXPCConnection _setQueue:](self->_serverConnection, "_setQueue:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDUpdatedProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](self->_serverConnection, "setRemoteObjectInterface:", v6);
    v11[0] = 0LL;
    v11[1] = v11;
    v11[2] = 0x3032000000LL;
    v11[3] = __Block_byref_object_copy__5;
    v11[4] = __Block_byref_object_dispose__5;
    v12 = 0LL;
    v12 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke;
    v10[3] = &unk_100059E70;
    v10[4] = v11;
    v7 = objc_retainBlock(v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7;
    v9[3] = &unk_100059E70;
    v9[4] = v11;
    v8 = objc_retainBlock(v9);
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:", v7);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", v8);
    -[NSXPCConnection resume](self->_serverConnection, "resume");
    self->_connected = 1;

    _Block_object_dispose(v11, 8);
  }

id __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
}

id __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
}

- (void)noteConnectionDropped
{
  self->_connected = 0;
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  if (v8)
  {
    id v10 = nrdSharedLogger();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v12) {
        -[NRDUpdateDaemonClientImpl handleConnectionError:method:handler:].cold.2((uint64_t)a4, (uint64_t)v8, v11);
      }
    }

    else if (v12)
    {
      -[NRDUpdateDaemonClientImpl handleConnectionError:method:handler:].cold.1( (uint64_t)v8,  v11,  v13,  v14,  v15,  v16,  v17,  v18);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v19 isEqualToString:NSCocoaErrorDomain])
    {
      if ([v8 code] == (id)4097)
      {

LABEL_12:
        -[NRDUpdateDaemonClientImpl _invalidateConnection](self, "_invalidateConnection");
        goto LABEL_13;
      }

      id v20 = [v8 code];

      if (v20 == (id)4099) {
        goto LABEL_12;
      }
    }

    else
    {
    }

- (void)getNRDUpdateBrainEndpoint:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke;
  v6[3] = &unk_100059EC0;
  id v7 = a3;
  id v8 = "-[NRDUpdateDaemonClientImpl getNRDUpdateBrainEndpoint:]";
  v6[4] = self;
  id v4 = v7;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateDaemonClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v6));
  [v5 getNRDUpdateBrainEndpoint:v4];
}

void __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

- (void)acquireNRDUpdateBrain:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke;
  v15[3] = &unk_100059F10;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  id v17 = v7;
  id v9 = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_2;
  v12[3] = &unk_100059F60;
  id v13 = v8;
  uint64_t v14 = objc_retainBlock(v15);
  v12[4] = self;
  id v10 = v8;
  v11 = v14;
  -[NRDUpdateDaemonClientImpl update:reply:](self, "update:reply:", v10, v12);
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (([a1[4] resendOnError:v3] & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:@"__nrd_brain-location_key"]);

    if (!v3 || !v4)
    {
      id v13 = a1[4];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_11;
      v14[3] = &unk_100059EE8;
      id v15 = v3;
      id v16 = a1[6];
      [v13 getNRDUpdateBrainEndpoint:v14];

      goto LABEL_9;
    }

    id v5 = nrdSharedLogger();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_cold_1( (uint64_t)v3,  v6,  v7,  v8,  v9,  v10,  v11,  v12);
    }
  }

  (*((void (**)(void))a1[6] + 2))();
LABEL_9:
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_11( uint64_t a1,  void *a2,  void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (*(void *)(a1 + 32)
      && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]),
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSUnderlyingErrorKey]),
          v8,
          v7,
          !v8))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);

      if (v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
        id v13 = [v12 mutableCopy];
      }

      else
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      }

      [v13 setObject:*(void *)(a1 + 32) forKeyedSubscript:NSUnderlyingErrorKey];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v14,  [v6 code],  v13));

      uint64_t v9 = 0LL;
    }

    else
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v6;
    }
  }

  else
  {
    uint64_t v9 = -[NRDUpdateBrainClientImpl initWithEndpoint:]( objc_alloc(&OBJC_CLASS___NRDUpdateBrainClientImpl),  "initWithEndpoint:",  v15);
    uint64_t v10 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) resendOnError:v3])
  {
    id v4 = objc_autoreleasePoolPush();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    do
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:2.0]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v8 runUntilDate:v7];

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v9 timeIntervalSinceDate:v6];
      double v11 = v10;

      if (v11 < 2.0)
      {
        __rqtp.tv_sec = (uint64_t)(2.0 - v11);
        __rqtp.tv_nsec = (uint64_t)((2.0 - v11 - (double)__rqtp.tv_sec) * 1000000000.0);
        nanosleep(&__rqtp, 0LL);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v12 timeIntervalSinceDate:v5];
      double v14 = v13;
    }

    while (v14 < 2.0);

    objc_autoreleasePoolPop(v4);
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_3;
    v17[3] = &unk_100059F38;
    id v18 = *(id *)(a1 + 48);
    [v15 update:v16 reply:v17];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

uint64_t __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)update:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __36__NRDUpdateDaemonClientImpl_update___block_invoke;
  v6[3] = &unk_100059EC0;
  id v7 = a3;
  uint64_t v8 = "-[NRDUpdateDaemonClientImpl update:]";
  v6[4] = self;
  id v4 = v7;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateDaemonClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v6));
  [v5 update:v4];
}

void __36__NRDUpdateDaemonClientImpl_update___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __36__NRDUpdateDaemonClientImpl_update___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __36__NRDUpdateDaemonClientImpl_update___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)update:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = nrdSharedLogger();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Warning: NRDUpdated options are not supported on this platform. options=%{public}@",  buf,  0xCu);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke;
  v12[3] = &unk_100059EC0;
  id v13 = v7;
  double v14 = "-[NRDUpdateDaemonClientImpl update:reply:]";
  v12[4] = self;
  id v10 = v7;
  double v11 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateDaemonClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v12));
  [v11 update:v10];
}

void __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (BOOL)resendOnError:(id)a3
{
  id v7 = a3;
  id v8 = v7;
  if (!v7)
  {
    BOOL v19 = 0;
    goto LABEL_22;
  }

  id v21 = v7;
  id v9 = v7;
  while (1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo", v21));
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    char isKindOfClass = objc_opt_isKindOfClass(v10, v11);
    if ((isKindOfClass & 1) != 0)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"com.apple.NRD-Resend"]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v5, v13) & 1) != 0) {
        break;
      }
    }

    int v14 = 0;
LABEL_8:
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    else {
      BOOL v16 = 0;
    }

    if (v14)
    {
    }

    if ((isKindOfClass & 1) != 0)
    {
    }

    if (v16) {
      goto LABEL_20;
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v9 = (void *)v18;
    if (!v18)
    {
      BOOL v19 = 0;
      goto LABEL_21;
    }
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"com.apple.NRD-Resend"]);
  if (![v6 BOOLValue])
  {
    int v14 = 1;
    goto LABEL_8;
  }

LABEL_20:
  BOOL v19 = 1;
LABEL_21:
  id v8 = v21;

LABEL_22:
  return v19;
}

- (void).cxx_destruct
{
}

void __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)handleConnectionError:(uint64_t)a3 method:(uint64_t)a4 handler:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)handleConnectionError:(uint64_t)a1 method:(uint64_t)a2 handler:(os_log_t)log .cold.2( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}s - connection error: %{public}@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_4();
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end