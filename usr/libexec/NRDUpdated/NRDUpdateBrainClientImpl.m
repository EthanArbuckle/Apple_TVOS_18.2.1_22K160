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
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRDUpdateBrainClientImpl;
  result = -[NRDUpdateBrainClientImpl init](&v3, "init");
  if (result)
  {
    result->_brainProtocol = (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate;
    result->_brainProtocolVersion = 1;
  }

  return result;
}

- (NRDUpdateBrainClientImpl)initWithDelegate:(id)a3
{
  result = -[NRDUpdateBrainClientImpl init](self, "init");
  if (result) {
    result->_delegate = (NRDUpdateBrainDelegateInterface *)a3;
  }
  return result;
}

- (NRDUpdateBrainClientImpl)initWithEndpoint:(id)a3
{
  v4 = -[NRDUpdateBrainClientImpl init](self, "init");
  result = 0LL;
  if (a3)
  {
    if (v4)
    {
      v4->_serverEndpoint = (NSXPCListenerEndpoint *)a3;
      id v6 = a3;
      return v4;
    }
  }

  return result;
}

- (void)dealloc
{
  self->_delegate = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRDUpdateBrainClientImpl;
  -[NRDUpdateBrainClientImpl dealloc](&v3, "dealloc");
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_serverConnection,  "remoteObjectProxyWithErrorHandler:",  a3);
}

- (void)_invalidateConnection_nolock
{
  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    -[NSXPCConnection setInvalidationHandler:](serverConnection, "setInvalidationHandler:", 0LL);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", 0LL);
    -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");

    self->_serverConnection = 0LL;
    self->_connected = 0;
  }

- (void)_invalidateConnection
{
}

- (void)_connectToServerIfNecessary_nolock
{
  if (!self->_connected)
  {
    -[NRDUpdateBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    serverEndpoint = self->_serverEndpoint;
    v4 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
    else {
      v5 = -[NSXPCConnection initWithServiceName:options:]( v4,  "initWithServiceName:options:",  @"com.apple.NRD.UpdateBrainService",  0LL);
    }
    self->_serverConnection = v5;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NRDUpdateBrainClient.serverConnectionQueue", &_dispatch_queue_attr_concurrent);
    -[NSXPCConnection _setQueue:](self->_serverConnection, "_setQueue:", v6);
    dispatch_release(v6);
    v7 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2);
    v8 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDUpdateBrainDelegateInterface);
    v9 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDBackgroundActivitySchedulerInterface);
    v10 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDRemoteableBlockInterface);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v9,  "setInterface:forSelector:argumentIndex:ofReply:",  v10,  "scheduleWithRemoteableBlock:",  0LL,  0LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v9,  "setInterface:forSelector:argumentIndex:ofReply:",  v10,  "setCheckInHandler:",  0LL,  0LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v7,  "setInterface:forSelector:argumentIndex:ofReply:",  v10,  "downloadNeRDUpdate:options:progress:completion:",  2LL,  0LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v7,  "setInterface:forSelector:argumentIndex:ofReply:",  v10,  "installNeRDUpdate:options:progress:completion:",  2LL,  0LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v7,  "setInterface:forSelector:argumentIndex:ofReply:",  v10,  "finishNeRDUpdate:",  0LL,  1LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v8,  "setInterface:forSelector:argumentIndex:ofReply:",  v9,  "newSchedulerWithIdentifier:reply:",  0LL,  1LL);
    -[NSXPCConnection setRemoteObjectInterface:](self->_serverConnection, "setRemoteObjectInterface:", v7);
    delegate = self->_delegate;
    if (delegate)
    {
      -[NSXPCConnection setExportedInterface:](self->_serverConnection, "setExportedInterface:", v8);
      -[NSXPCConnection setExportedObject:](self->_serverConnection, "setExportedObject:", self->_delegate);
      delegate = self->_delegate;
    }

    v15[0] = 0LL;
    v15[1] = v15;
    v15[2] = 0x3052000000LL;
    v15[3] = __Block_byref_object_copy_;
    v15[4] = __Block_byref_object_dispose_;
    v15[5] = self;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x3052000000LL;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    v14[5] = delegate;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke;
    v13[3] = &unk_1000144A8;
    v13[4] = v15;
    v13[5] = v14;
    -[NSXPCConnection setInvalidationHandler:]( self->_serverConnection,  "setInvalidationHandler:",  v13,  _NSConcreteStackBlock,  3221225472LL,  __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_136,  &unk_1000144A8,  v15,  v14);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", &v12);
    -[NSXPCConnection resume](self->_serverConnection, "resume");
    self->_connected = 1;
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v15, 8);
  }

uint64_t __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = @"com.apple.NRD.UpdateBrainService";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "connection to %{public}@ invalidated",  (uint8_t *)&v4,  0xCu);
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
  v2 = (os_log_s *)nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = @"com.apple.NRD.UpdateBrainService";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "connection to %{public}@ interrupted",  (uint8_t *)&v4,  0xCu);
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
}

- (void)noteConnectionDropped
{
  self->_connected = 0;
  objc_sync_exit(self);
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  if (a3)
  {
    v9 = (os_log_s *)nrdSharedLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v10) {
        -[NRDUpdateBrainClientImpl handleConnectionError:method:handler:].cold.2((uint64_t)a4, (uint64_t)a3, v9);
      }
    }

    else if (v10)
    {
      -[NRDUpdateBrainClientImpl handleConnectionError:method:handler:].cold.1( (uint64_t)a3,  v9,  v11,  v12,  v13,  v14,  v15,  v16);
    }

    -[NRDUpdateBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    (*((void (**)(id))a5 + 2))(a5);
  }

- (void)ping:(id)a3
{
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  v5 = (os_log_s *)nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Pinging NeRD update brain...",  (uint8_t *)&buf,  2u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke;
  v25[3] = &unk_1000144F8;
  v25[4] = self;
  v25[5] = a3;
  v25[6] = &v26;
  v25[7] = "-[NRDUpdateBrainClientImpl ping:]";
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_139;
  v24[3] = &unk_100014570;
  v24[4] = self;
  v24[5] = a3;
  v24[6] = &v26;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v25),  "ping:",  v24);
  v21 = __33__NRDUpdateBrainClientImpl_ping___block_invoke_160;
  v22 = &unk_100014598;
  v23 = &v26;
  dispatch_queue_t v6 = objc_autoreleasePoolPush();
  v7 = +[NSDate date](&OBJC_CLASS___NSDate, "date", _NSConcreteStackBlock, 3221225472LL);
  do
  {
    v8 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    -[NSRunLoop runUntilDate:]( +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"),  "runUntilDate:",  -[NSDate dateByAddingTimeInterval:](v8, "dateByAddingTimeInterval:", 0.125));
    -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v8);
    if (v9 < 0.125)
    {
      double v10 = 0.125 - v9;
      buf.tv_sec = (uint64_t)v10;
      buf.tv_nsec = (uint64_t)((v10 - (double)(uint64_t)v10) * 1000000000.0);
      nanosleep(&buf, 0LL);
    }

    -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v7);
  }

  while (v11 < 30.0);
  objc_autoreleasePoolPop(v6);
  if (!*((_BYTE *)v27 + 24))
  {
    uint64_t v12 = (os_log_s *)nrdSharedLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
    v32 = @"timeout connecting to brain endpoint";
    (*((void (**)(id, NSError *))a3 + 2))( a3,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  101LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL)));
  }

  _Block_object_dispose(&v26, 8);
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_2;
  v5[3] = &unk_1000144D0;
  v5[4] = a2;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  return [v2 handleConnectionError:a2 method:v3 handler:v5];
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_2(uint64_t a1)
{
  v2 = (os_log_s *)nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __33__NRDUpdateBrainClientImpl_ping___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  return result;
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke_139(void *a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)nrdSharedLogger();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __33__NRDUpdateBrainClientImpl_ping___block_invoke_139_cold_1(a2, v5, v6, v7, v8, v9, v10, v11);
    }
    id result = (id)(*(uint64_t (**)(void))(a1[5] + 16LL))();
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timespec buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain succeeded", buf, 2u);
    }

    uint64_t v13 = (void *)a1[4];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_140;
    v14[3] = &unk_100014548;
    v14[4] = v13;
    v14[5] = 0LL;
    __int128 v15 = *(_OWORD *)(a1 + 5);
    return [v13 getListenerEndpoint:v14];
  }

  return result;
}

NRDUpdateBrainClientImpl *__33__NRDUpdateBrainClientImpl_ping___block_invoke_140( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = (os_log_s *)nrdSharedLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Could not probe for NRDUpdateBrainInterfacePrivate2.",  v8,  2u);
    }

    id result = (NRDUpdateBrainClientImpl *)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v6 = -[NRDUpdateBrainClientImpl initWithEndpoint:]( objc_alloc(&OBJC_CLASS___NRDUpdateBrainClientImpl),  "initWithEndpoint:",  a2);
    v9[1] = 3221225472LL;
    __int128 v7 = *(_OWORD *)(a1 + 48);
    __int128 v10 = *(_OWORD *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_146;
    v9[3] = &unk_100014520;
    __int128 v12 = v7;
    uint64_t v11 = v6;
    -[NRDUpdateBrainClientImpl ping:reply:](v6, "ping:reply:", &off_1000159A8, v9);
    return v6;
  }

  return result;
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke_146(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (os_log_s *)nrdSharedLogger();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "NeRD update brain does not support NRDUpdateBrainInterfacePrivate2.",  v11,  2u);
    }
  }

  else
  {
    if (v7)
    {
      *(_WORD *)timespec buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "NeRD update brain supports NRDUpdateBrainInterfacePrivate2.",  buf,  2u);
    }

    *(void *)(*(void *)(a1 + 32) + 8) = [a2 objectForKeyedSubscript:@"BrainVersion"];
    *(void *)(*(void *)(a1 + 32) + 16) = [a2 objectForKeyedSubscript:@"BrainTimeStamp"];
    *(void *)(*(void *)(a1 + 32) + 24) = [a2 objectForKeyedSubscript:@"BrainUUID"];
    *(void *)(*(void *)(a1 + 32) + 32) = [a2 objectForKeyedSubscript:@"DylibUUID"];
    *(void *)(*(void *)(a1 + 32) + 72LL) = &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2;
    id v8 = [a2 objectForKeyedSubscript:@"__BrainProtocolVersion"];
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
      *(_DWORD *)(*(void *)(a1 + 32) + 80) = objc_msgSend( objc_msgSend( a2,  "objectForKeyedSubscript:",  @"__BrainProtocolVersion"),  "unsignedIntValue");
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  return [*(id *)(a1 + 48) _invalidateConnection];
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_160(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

- (void)ping:(id)a3 reply:(id)a4
{
  uint64_t v28 = 0LL;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  BOOL v7 = (os_log_s *)nrdSharedLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Probing NeRD update brain for NRDUpdateBrainInterfacePrivate2...",  (uint8_t *)&buf,  2u);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke;
  v27[3] = &unk_1000144F8;
  v27[4] = self;
  v27[5] = a4;
  v27[6] = &v28;
  v27[7] = "-[NRDUpdateBrainClientImpl ping:reply:]";
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3;
  v26[3] = &unk_1000145C0;
  v26[4] = a4;
  v26[5] = &v28;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v27),  "ping:reply:",  a3,  v26);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v23 = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4;
  v24 = &unk_100014598;
  v25 = &v28;
  id v8 = objc_autoreleasePoolPush();
  uint64_t v9 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  do
  {
    __int128 v10 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    -[NSRunLoop runUntilDate:]( +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"),  "runUntilDate:",  -[NSDate dateByAddingTimeInterval:](v10, "dateByAddingTimeInterval:", 0.125));
    -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v10);
    if (v11 < 0.125)
    {
      double v12 = 0.125 - v11;
      buf.tv_sec = (uint64_t)v12;
      buf.tv_nsec = (uint64_t)((v12 - (double)(uint64_t)v12) * 1000000000.0);
      nanosleep(&buf, 0LL);
    }

    -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v9);
  }

  while (v13 < 30.0);
  objc_autoreleasePoolPop(v8);
  if (!*((_BYTE *)v29 + 24))
  {
    uint64_t v14 = (os_log_s *)nrdSharedLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v33[0] = NSDebugDescriptionErrorKey;
    v33[1] = @"Protocol";
    v34[0] = @"timeout connecting to brain endpoint";
    v34[1] = @"NRDUpdateBrainInterfacePrivate2";
    v33[2] = @"Non-fatal";
    v34[2] = &__kCFBooleanTrue;
    (*((void (**)(id, void, NSError *))a4 + 2))( a4,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  101LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL)));
  }

  _Block_object_dispose(&v28, 8);
}

id __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2;
  v5[3] = &unk_1000144D0;
  v5[4] = a2;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  return [v2 handleConnectionError:a2 method:v3 handler:v5];
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
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke;
  v10[3] = &unk_100014610;
  v10[5] = a5;
  v10[6] = "-[NRDUpdateBrainClientImpl run:options:callback:]";
  v10[4] = self;
  id v9 = -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v10);
  if (protocol_isEqual(self->_brainProtocol, (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2)) {
    [v9 run:a3 options:a4 callback:a5];
  }
  else {
    [v9 run:a3 callback:a5];
  }
}

id __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)getListenerEndpoint:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke;
  v3[3] = &unk_100014610;
  v3[5] = a3;
  v3[6] = "-[NRDUpdateBrainClientImpl getListenerEndpoint:]";
  v3[4] = self;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v3),  "getListenerEndpoint:",  a3);
}

id __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

- (void)queryNeRDUpdate:(id)a3 build:(id)a4 options:(id)a5 callback:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke;
  v6[3] = &unk_100014610;
  v6[5] = a6;
  void v6[6] = "-[NRDUpdateBrainClientImpl queryNeRDUpdate:build:options:callback:]";
  v6[4] = self;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v6),  "queryNeRDUpdate:build:options:callback:",  a3,  a4,  a5,  a6);
}

id __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke( void *a1,  uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)downloadNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100014610;
  v15[5] = a6;
  void v15[6] = "-[NRDUpdateBrainClientImpl downloadNeRDUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100014638;
  v14[4] = a5;
  double v11 = -[NRDRemoteableBlock initWithProgressBlock:]( objc_alloc(&OBJC_CLASS___NRDRemoteableBlock),  "initWithProgressBlock:",  v14);
  double v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_100014660;
    v13[4] = a6;
    [v10 downloadNeRDUpdate:a3 options:a4 progress:v11 completion:v13];
  }

  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    uint64_t v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))( a6,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  105LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL)));
  }

id __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke( void *a1,  uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
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
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100014610;
  v15[5] = a6;
  void v15[6] = "-[NRDUpdateBrainClientImpl installNeRDUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100014638;
  v14[4] = a5;
  double v11 = -[NRDRemoteableBlock initWithProgressBlock:]( objc_alloc(&OBJC_CLASS___NRDRemoteableBlock),  "initWithProgressBlock:",  v14);
  double v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_100014660;
    v13[4] = a6;
    [v10 installNeRDUpdate:a3 options:a4 progress:v11 completion:v13];
  }

  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    uint64_t v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))( a6,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  105LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL)));
  }

id __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke( void *a1,  uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
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
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke;
  v3[3] = &unk_100014610;
  v3[5] = a3;
  v3[6] = "-[NRDUpdateBrainClientImpl purgeNeRDUpdate:]";
  v3[4] = self;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v3),  "purgeNeRDUpdate:",  a3);
}

id __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)finishNeRDUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke;
  v4[3] = &unk_100014610;
  v4[5] = a3;
  v4[6] = "-[NRDUpdateBrainClientImpl finishNeRDUpdate:]";
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3;
  v3[3] = &unk_1000146F0;
  v3[4] = a3;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v4),  "finishNeRDUpdate:",  v3);
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472LL;
  uint64_t v5 = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4;
  __int128 v6 = &unk_1000146C8;
  uint64_t v7 = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute:&__block_literal_global_0];
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_5(id a1, int a2)
{
  v2 = (os_log_s *)nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "sending NRD update brain the all-clear.",  v3,  2u);
  }

- (void)calculateCurrentRequiredSpace:(id)a3 callback:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke;
  v4[3] = &unk_100014610;
  v4[5] = a4;
  v4[6] = "-[NRDUpdateBrainClientImpl calculateCurrentRequiredSpace:callback:]";
  v4[4] = self;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v4),  "calculateCurrentRequiredSpace:callback:",  a3,  a4);
}

id __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke( void *a1,  uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

- (void)cancelNeRDUpdate:(BOOL)a3 callback:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke;
  v4[3] = &unk_100014610;
  v4[5] = a4;
  v4[6] = "-[NRDUpdateBrainClientImpl cancelNeRDUpdate:callback:]";
  v4[4] = self;
  objc_msgSend( -[NRDUpdateBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v4),  "cancelNeRDUpdate:callback:",  a3,  a4);
}

id __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2;
  v6[3] = &unk_1000145E8;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (NSString)brainTimeStamp
{
  return self->_brainTimeStamp;
}

- (NSString)brainUUID
{
  return self->_brainUUID;
}

- (NSString)dylibUUID
{
  return self->_dylibUUID;
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
  OUTLINED_FUNCTION_3();
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