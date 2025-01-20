@interface NRDUpdateBrainClientImpl
- (NRDUpdateBrainClientImpl)init;
- (NRDUpdateBrainClientImpl)initWithDelegate:(id)a3;
- (NRDUpdateBrainClientImpl)initWithEndpoint:(id)a3;
- (NSString)brainTimeStamp;
- (NSString)brainUUID;
- (NSString)brainVersion;
- (NSString)dylibUUID;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (void)_connectToServerIfNecessary_nolock;
- (void)_invalidateConnection;
- (void)_invalidateConnection_nolock;
- (void)calculateCurrentRequiredSpace:(id)a3 callback:(id)a4;
- (void)cancelNeRDUpdate:(BOOL)a3 callback:(id)a4;
- (void)connectToServerIfNecessary;
- (void)dealloc;
- (void)downloadNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)finishNeRDUpdate:(id)a3;
- (void)getListenerEndpoint:(id)a3;
- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5;
- (void)installNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)noteConnectionDropped;
- (void)ping:(id)a3;
- (void)ping:(id)a3 reply:(id)a4;
- (void)purgeNeRDUpdate:(id)a3;
- (void)queryNeRDUpdate:(id)a3 build:(id)a4 options:(id)a5 callback:(id)a6;
- (void)run:(unint64_t)a3 callback:(id)a4;
- (void)run:(unint64_t)a3 options:(id)a4 callback:(id)a5;
@end

@implementation NRDUpdateBrainClientImpl

- (NRDUpdateBrainClientImpl)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRDUpdateBrainClientImpl;
  v2 = -[NRDUpdateBrainClientImpl init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_brainProtocol, &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate);
    v3->_brainProtocolVersion = 1;
  }

  return v3;
}

- (NRDUpdateBrainClientImpl)initWithDelegate:(id)a3
{
  id v5 = a3;
  v6 = -[NRDUpdateBrainClientImpl init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (NRDUpdateBrainClientImpl)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v6 = -[NRDUpdateBrainClientImpl init](self, "init");
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_serverEndpoint, a3);
    }

    else
    {

      v7 = 0LL;
    }
  }

  return v7;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRDUpdateBrainClientImpl;
  -[NRDUpdateBrainClientImpl dealloc](&v4, "dealloc");
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  -[NRDUpdateBrainClientImpl connectToServerIfNecessary](self, "connectToServerIfNecessary");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_serverConnection,  "remoteObjectProxyWithErrorHandler:",  v4));

  return v5;
}

- (void)_invalidateConnection_nolock
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

- (void)_invalidateConnection
{
  obj = self;
  objc_sync_enter(obj);
  -[NRDUpdateBrainClientImpl _invalidateConnection_nolock](obj, "_invalidateConnection_nolock");
  objc_sync_exit(obj);
}

- (void)_connectToServerIfNecessary_nolock
{
  if (!self->_connected)
  {
    -[NRDUpdateBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    serverEndpoint = self->_serverEndpoint;
    id v4 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
    else {
      id v5 = -[NSXPCConnection initWithServiceName:options:]( v4,  "initWithServiceName:options:",  @"com.apple.NRD.UpdateBrainService",  0LL);
    }
    serverConnection = self->_serverConnection;
    self->_serverConnection = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NRDUpdateBrainClient.serverConnectionQueue", &_dispatch_queue_attr_concurrent);
    -[NSXPCConnection _setQueue:](self->_serverConnection, "_setQueue:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDUpdateBrainDelegateInterface));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDBackgroundActivitySchedulerInterface));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDRemoteableBlockInterface));
    [v10 setInterface:v11 forSelector:"scheduleWithRemoteableBlock:" argumentIndex:0 ofReply:0];
    [v10 setInterface:v11 forSelector:"setCheckInHandler:" argumentIndex:0 ofReply:0];
    [v8 setInterface:v11 forSelector:"downloadNeRDUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [v8 setInterface:v11 forSelector:"installNeRDUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [v8 setInterface:v11 forSelector:"finishNeRDUpdate:" argumentIndex:0 ofReply:1];
    [v9 setInterface:v10 forSelector:"newSchedulerWithIdentifier:reply:" argumentIndex:0 ofReply:1];
    -[NSXPCConnection setRemoteObjectInterface:](self->_serverConnection, "setRemoteObjectInterface:", v8);
    if (self->_delegate)
    {
      -[NSXPCConnection setExportedInterface:](self->_serverConnection, "setExportedInterface:", v9);
      -[NSXPCConnection setExportedObject:](self->_serverConnection, "setExportedObject:", self->_delegate);
    }

    v18[0] = 0LL;
    v18[1] = v18;
    v18[2] = 0x3032000000LL;
    v18[3] = __Block_byref_object_copy__6;
    v18[4] = __Block_byref_object_dispose__6;
    v19 = 0LL;
    v19 = self;
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x3032000000LL;
    v16[3] = __Block_byref_object_copy__6;
    v16[4] = __Block_byref_object_dispose__6;
    v17 = 0LL;
    v17 = self->_delegate;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke;
    v15[3] = &unk_100059CE0;
    v15[4] = v18;
    v15[5] = v16;
    v12 = objc_retainBlock(v15);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_136;
    v14[3] = &unk_100059CE0;
    v14[4] = v18;
    v14[5] = v16;
    v13 = objc_retainBlock(v14);
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:", v12);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", v13);
    -[NSXPCConnection resume](self->_serverConnection, "resume");
    self->_connected = 1;

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v18, 8);
  }

uint64_t __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = @"com.apple.NRD.UpdateBrainService";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "connection to %{public}@ invalidated",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector(result, "connectionInvalidated");
    if ((result & 1) != 0) {
      return (uint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connectionInvalidated];
    }
  }

  return result;
}

uint64_t __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_136(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = @"com.apple.NRD.UpdateBrainService";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "connection to %{public}@ interrupted",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector(result, "connectionInterrupted");
    if ((result & 1) != 0) {
      return (uint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connectionInterrupted];
    }
  }

  return result;
}

- (void)connectToServerIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  -[NRDUpdateBrainClientImpl _connectToServerIfNecessary_nolock](obj, "_connectToServerIfNecessary_nolock");
  objc_sync_exit(obj);
}

- (void)noteConnectionDropped
{
  obj = self;
  objc_sync_enter(obj);
  obj->_connected = 0;
  objc_sync_exit(obj);
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a5;
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

    -[NRDUpdateBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    v9[2](v9);
  }
}

- (void)ping:(id)a3
{
  id v4 = a3;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  id v5 = nrdSharedLogger();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Pinging NeRD update brain...",  (uint8_t *)&buf,  2u);
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke;
  v40[3] = &unk_100059FD0;
  v40[4] = self;
  v43 = "-[NRDUpdateBrainClientImpl ping:]";
  id v7 = v4;
  id v41 = v7;
  v42 = &v44;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v40));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_139;
  v37[3] = &unk_10005A048;
  v37[4] = self;
  id v9 = v7;
  id v38 = v9;
  v39 = &v44;
  [v8 ping:v37];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v34 = __33__NRDUpdateBrainClientImpl_ping___block_invoke_160;
  v35 = &unk_100059E20;
  v36 = &v44;
  id v10 = v33;
  v11 = objc_autoreleasePoolPush();
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  do
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:0.125]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v15 runUntilDate:v14];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v16 timeIntervalSinceDate:v13];
    double v18 = v17;

    if (v18 < 0.125)
    {
      buf.tv_sec = (uint64_t)(0.125 - v18);
      buf.tv_nsec = (uint64_t)((0.125 - v18 - (double)buf.tv_sec) * 1000000000.0);
      nanosleep(&buf, 0LL);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v19 timeIntervalSinceDate:v12];
    BOOL v21 = v20 < 30.0;
  }

  while (v21);

  objc_autoreleasePoolPop(v11);
  if (!*((_BYTE *)v45 + 24))
  {
    id v22 = nrdSharedLogger();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    NSErrorUserInfoKey v49 = NSDebugDescriptionErrorKey;
    v50 = @"timeout connecting to brain endpoint";
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  101LL,  v31));
    (*((void (**)(id, void *))v9 + 2))(v9, v32);
  }

  _Block_object_dispose(&v44, 8);
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_2;
  v8[3] = &unk_100059FA8;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 48);
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_2(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __33__NRDUpdateBrainClientImpl_ping___block_invoke_2_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  return result;
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_139(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __33__NRDUpdateBrainClientImpl_ping___block_invoke_139_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }

    (*(void (**)(void))(a1[5] + 16LL))();
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timespec buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain succeeded", buf, 2u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_140;
    v14[3] = &unk_10005A020;
    uint64_t v13 = (void *)a1[5];
    id v15 = (id)a1[4];
    id v16 = 0LL;
    id v17 = v13;
    uint64_t v18 = a1[6];
    [v15 getListenerEndpoint:v14];
  }
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_140(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = nrdSharedLogger();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Could not probe for NRDUpdateBrainInterfacePrivate2.",  v11,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v8 = -[NRDUpdateBrainClientImpl initWithEndpoint:]( objc_alloc(&OBJC_CLASS___NRDUpdateBrainClientImpl),  "initWithEndpoint:",  v5);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_146;
    v12[3] = &unk_100059FF8;
    v12[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 56);
    id v13 = v9;
    uint64_t v14 = v8;
    uint64_t v10 = v8;
    -[NRDUpdateBrainClientImpl ping:reply:](v10, "ping:reply:", &off_100063CA0, v12);
  }
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_146(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = nrdSharedLogger();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v8)
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "NeRD update brain does not support NRDUpdateBrainInterfacePrivate2.",  v24,  2u);
    }

    goto LABEL_8;
  }

  if (v8)
  {
    *(_WORD *)timespec buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "NeRD update brain supports NRDUpdateBrainInterfacePrivate2.",  buf,  2u);
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"BrainVersion"]);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v9;

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"BrainTimeStamp"]);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = v12;

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"BrainUUID"]);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 24);
  *(void *)(v16 + 24) = v15;

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DylibUUID"]);
  uint64_t v19 = *(void *)(a1 + 32);
  double v20 = *(void **)(v19 + 32);
  *(void *)(v19 + 32) = v18;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72LL), &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2);
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"__BrainProtocolVersion"]);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char isKindOfClass = objc_opt_isKindOfClass(v21, v22);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"__BrainProtocolVersion"]);
    *(_DWORD *)(*(void *)(a1 + 32) + 80LL) = -[os_log_s unsignedIntValue](v7, "unsignedIntValue");
LABEL_8:
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  [*(id *)(a1 + 48) _invalidateConnection];
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_160(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

- (void)ping:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  id v8 = nrdSharedLogger();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Probing NeRD update brain for NRDUpdateBrainInterfacePrivate2...",  (uint8_t *)&buf,  2u);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke;
  v43[3] = &unk_100059FD0;
  v43[4] = self;
  uint64_t v46 = "-[NRDUpdateBrainClientImpl ping:reply:]";
  id v10 = v7;
  id v44 = v10;
  v45 = &v47;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v43));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3;
  v40[3] = &unk_10005A070;
  id v12 = v10;
  id v41 = v12;
  v42 = &v47;
  [v11 ping:v6 reply:v40];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v37 = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4;
  id v38 = &unk_100059E20;
  v39 = &v47;
  uint64_t v13 = v36;
  uint64_t v14 = objc_autoreleasePoolPush();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  do
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dateByAddingTimeInterval:0.125]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v18 runUntilDate:v17];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v19 timeIntervalSinceDate:v16];
    double v21 = v20;

    if (v21 < 0.125)
    {
      buf.tv_sec = (uint64_t)(0.125 - v21);
      buf.tv_nsec = (uint64_t)((0.125 - v21 - (double)buf.tv_sec) * 1000000000.0);
      nanosleep(&buf, 0LL);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v22 timeIntervalSinceDate:v15];
    BOOL v24 = v23 < 30.0;
  }

  while (v24);

  objc_autoreleasePoolPop(v14);
  if (!*((_BYTE *)v48 + 24))
  {
    id v25 = nrdSharedLogger();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:reply:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    }

    v52[0] = NSDebugDescriptionErrorKey;
    v52[1] = @"Protocol";
    v53[0] = @"timeout connecting to brain endpoint";
    v53[1] = @"NRDUpdateBrainInterfacePrivate2";
    v52[2] = @"Non-fatal";
    v53[2] = &__kCFBooleanTrue;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  3LL));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  101LL,  v34));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v35);
  }

  _Block_object_dispose(&v47, 8);
}

void __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2;
  v8[3] = &unk_100059FA8;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 48);
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  return result;
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return result;
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

- (void)run:(unint64_t)a3 callback:(id)a4
{
}

- (void)run:(unint64_t)a3 options:(id)a4 callback:(id)a5
{
  id v8 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke;
  v11[3] = &unk_100059EC0;
  v11[4] = self;
  uint64_t v13 = "-[NRDUpdateBrainClientImpl run:options:callback:]";
  id v9 = a5;
  id v12 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v11));
  if (protocol_isEqual(self->_brainProtocol, (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2)) {
    [v10 run:a3 options:v8 callback:v9];
  }
  else {
    [v10 run:a3 callback:v9];
  }
}

void __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2;
  v8[3] = &unk_100059E98;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)getListenerEndpoint:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke;
  v6[3] = &unk_100059EC0;
  id v7 = a3;
  id v8 = "-[NRDUpdateBrainClientImpl getListenerEndpoint:]";
  v6[4] = self;
  id v4 = v7;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v6));
  [v5 getListenerEndpoint:v4];
}

void __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

- (void)queryNeRDUpdate:(id)a3 build:(id)a4 options:(id)a5 callback:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke;
  v15[3] = &unk_100059EC0;
  id v16 = a6;
  id v17 = "-[NRDUpdateBrainClientImpl queryNeRDUpdate:build:options:callback:]";
  v15[4] = self;
  id v10 = v16;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v15));
  [v14 queryNeRDUpdate:v13 build:v12 options:v11 callback:v10];
}

void __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)downloadNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke;
  v24[3] = &unk_100059EC0;
  v24[4] = self;
  uint64_t v26 = "-[NRDUpdateBrainClientImpl downloadNeRDUpdate:options:progress:completion:]";
  id v13 = a6;
  id v25 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v24));
  uint64_t v15 = objc_alloc(&OBJC_CLASS___NRDRemoteableBlock);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3;
  v22[3] = &unk_10005A098;
  id v16 = v12;
  id v23 = v16;
  id v17 = -[NRDRemoteableBlock initWithProgressBlock:](v15, "initWithProgressBlock:", v22);
  if (v14)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4;
    v20[3] = &unk_100059F38;
    id v21 = v13;
    [v14 downloadNeRDUpdate:v10 options:v11 progress:v17 completion:v20];
    uint64_t v18 = v21;
  }

  else
  {
    NSErrorUserInfoKey v27 = NSDebugDescriptionErrorKey;
    uint64_t v28 = @"no remote object connection";
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  105LL,  v18));
    (*((void (**)(id, void *))v13 + 2))(v13, v19);
  }
}

void __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  (double)(unint64_t)[a2 unsignedIntegerValue] / 100.0);
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)installNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke;
  v24[3] = &unk_100059EC0;
  v24[4] = self;
  uint64_t v26 = "-[NRDUpdateBrainClientImpl installNeRDUpdate:options:progress:completion:]";
  id v13 = a6;
  id v25 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v24));
  uint64_t v15 = objc_alloc(&OBJC_CLASS___NRDRemoteableBlock);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3;
  v22[3] = &unk_10005A098;
  id v16 = v12;
  id v23 = v16;
  id v17 = -[NRDRemoteableBlock initWithProgressBlock:](v15, "initWithProgressBlock:", v22);
  if (v14)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4;
    v20[3] = &unk_100059F38;
    id v21 = v13;
    [v14 installNeRDUpdate:v10 options:v11 progress:v17 completion:v20];
    uint64_t v18 = v21;
  }

  else
  {
    NSErrorUserInfoKey v27 = NSDebugDescriptionErrorKey;
    uint64_t v28 = @"no remote object connection";
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  105LL,  v18));
    (*((void (**)(id, void *))v13 + 2))(v13, v19);
  }
}

void __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  (double)(unint64_t)[a2 unsignedIntegerValue] / 100.0);
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)purgeNeRDUpdate:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke;
  v6[3] = &unk_100059EC0;
  id v7 = a3;
  id v8 = "-[NRDUpdateBrainClientImpl purgeNeRDUpdate:]";
  v6[4] = self;
  id v4 = v7;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v6));
  [v5 purgeNeRDUpdate:v4];
}

void __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)finishNeRDUpdate:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke;
  v8[3] = &unk_100059EC0;
  id v9 = self;
  id v11 = "-[NRDUpdateBrainClientImpl finishNeRDUpdate:]";
  id v3 = a3;
  id v10 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( v9,  "_remoteInterfaceWithErrorHandler:",  v8));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3;
  v6[3] = &unk_10005A100;
  id v7 = v3;
  id v5 = v3;
  [v4 finishNeRDUpdate:v6];
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4;
  v8[3] = &unk_1000590B0;
  id v9 = a2;
  id v5 = v9;
  id v6 = a3;
  id v7 = objc_retainBlock(v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute:&__block_literal_global_12];
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_5(id a1, int a2)
{
  id v2 = nrdSharedLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "sending NRD update brain the all-clear.",  v4,  2u);
  }
}

- (void)calculateCurrentRequiredSpace:(id)a3 callback:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke;
  v9[3] = &unk_100059EC0;
  id v10 = a4;
  id v11 = "-[NRDUpdateBrainClientImpl calculateCurrentRequiredSpace:callback:]";
  v9[4] = self;
  id v6 = v10;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v9));
  [v8 calculateCurrentRequiredSpace:v7 callback:v6];
}

void __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2;
  v8[3] = &unk_100059E98;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

- (void)cancelNeRDUpdate:(BOOL)a3 callback:(id)a4
{
  BOOL v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke;
  v8[3] = &unk_100059EC0;
  id v9 = a4;
  id v10 = "-[NRDUpdateBrainClientImpl cancelNeRDUpdate:callback:]";
  void v8[4] = self;
  id v6 = v9;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:]( self,  "_remoteInterfaceWithErrorHandler:",  v8));
  [v7 cancelNeRDUpdate:v4 callback:v6];
}

void __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2;
  v8[3] = &unk_100059E98;
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 handleConnectionError:v7 method:v5 handler:v8];
}

uint64_t __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (NSString)brainVersion
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)brainTimeStamp
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)brainUUID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)dylibUUID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

  ;
}

- (void)ping:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_2_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_139_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)ping:(uint64_t)a3 reply:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end