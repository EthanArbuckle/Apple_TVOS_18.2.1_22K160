@interface MSUBrainClientImpl
- (BOOL)calculateUpdateStorageRequirements:(int)a3 attributes:(id)a4 options:(id)a5 info:(id *)a6 error:(id *)a7;
- (BOOL)getUpdateInfo:(id)a3 options:(id)a4 info:(id *)a5 error:(id *)a6;
- (NSString)brainUUID;
- (NSString)brainVersion;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)buildVersion;
- (id)init:(id)a3 version:(id)a4 endpoint:(id)a5 delgate:(id)a6;
- (id)machoUUID;
- (id)timeDateStamp;
- (void)_connectToServerIfNecessary_nolock;
- (void)_invalidateConnection;
- (void)_invalidateConnection_nolock;
- (void)applyUpdate:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)cancelUpdate:(id)a3 purge:(BOOL)a4 completion:(id)a5;
- (void)commitUnlockOnceToken:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)connectToServerIfNecessary;
- (void)dealloc;
- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5;
- (void)noteConnectionDropped;
- (void)preflightUpdate:(int)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)prepareUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation MSUBrainClientImpl

- (id)init:(id)a3 version:(id)a4 endpoint:(id)a5 delgate:(id)a6
{
  v10 = -[MSUBrainClientImpl init](self, "init");
  id result = 0LL;
  if (a5)
  {
    if (v10)
    {
      v10->_brainVersion = (NSString *)a4;
      v10->_brainUUID = (NSString *)a3;
      v10->_serverEndpoint = (NSXPCListenerEndpoint *)a5;
      v10->_delegate = (MSUBrainDelegateNSXPCInterface *)a6;
      id v12 = a3;
      v13 = v10->_brainVersion;
      v14 = v10->_serverEndpoint;
      return v10;
    }
  }

  return result;
}

- (void)dealloc
{
  self->_delegate = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUBrainClientImpl;
  -[MSUBrainClientImpl dealloc](&v3, "dealloc");
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
    -[MSUBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    if (self->_serverEndpoint) {
      self->_serverConnection = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  self->_serverEndpoint);
    }
    dispatch_queue_t v3 = dispatch_queue_create( (const char *)objc_msgSend( objc_msgSend( @"com.apple.MobileSoftwareUpdate.UpdateBrainService2",  "stringByAppendingString:",  @".connectionQueue"),  "UTF8String"),  &_dispatch_queue_attr_concurrent);
    -[NSXPCConnection _setQueue:](self->_serverConnection, "_setQueue:", v3);
    dispatch_release(v3);
    v4 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MSUBrainNSXPCInterface);
    v5 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MSUBrainDelegateNSXPCInterface);
    v6 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MSURemoteableBlockNSXPCInterface);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v4,  "setInterface:forSelector:argumentIndex:ofReply:",  v6,  "_nsxpcPreflightUpdate:options:progress:completion:",  2LL,  0LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v4,  "setInterface:forSelector:argumentIndex:ofReply:",  v6,  "_nsxpcPrepareUpdate:options:progress:completion:",  2LL,  0LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v4,  "setInterface:forSelector:argumentIndex:ofReply:",  v6,  "_nsxpcCommitUnlockOnceToken:progress:completion:",  1LL,  0LL);
    -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:]( v4,  "setInterface:forSelector:argumentIndex:ofReply:",  v6,  "_nsxpcApplyUpdate:progress:completion:",  1LL,  0LL);
    -[NSXPCConnection setRemoteObjectInterface:](self->_serverConnection, "setRemoteObjectInterface:", v4);
    delegate = self->_delegate;
    if (delegate)
    {
      -[NSXPCConnection setExportedInterface:](self->_serverConnection, "setExportedInterface:", v5);
      -[NSXPCConnection setExportedObject:](self->_serverConnection, "setExportedObject:", self->_delegate);
      delegate = self->_delegate;
    }

    v11[0] = 0LL;
    v11[1] = v11;
    v11[2] = 0x3052000000LL;
    v11[3] = __Block_byref_object_copy__4;
    v11[4] = __Block_byref_object_dispose__4;
    v11[5] = self;
    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x3052000000LL;
    v10[3] = __Block_byref_object_copy__4;
    v10[4] = __Block_byref_object_dispose__4;
    v10[5] = delegate;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke;
    v9[3] = &unk_100059CE0;
    v9[4] = v11;
    v9[5] = v10;
    -[NSXPCConnection setInvalidationHandler:]( self->_serverConnection,  "setInvalidationHandler:",  v9,  _NSConcreteStackBlock,  3221225472LL,  __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_91,  &unk_100059CE0,  v11,  v10);
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", &v8);
    -[NSXPCConnection resume](self->_serverConnection, "resume");
    self->_connected = 1;
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v11, 8);
  }

uint64_t __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)msuSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = @"com.apple.MobileSoftwareUpdate.UpdateBrainService2";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "connection to %@ invalidated",  (uint8_t *)&v4,  0xCu);
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

uint64_t __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_91(uint64_t a1)
{
  v2 = (os_log_s *)msuSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_91_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
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
    uint64_t v9 = (os_log_s *)msuSharedLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v10) {
        -[MSUBrainClientImpl handleConnectionError:method:handler:].cold.2((uint64_t)a4, (uint64_t)a3, v9);
      }
    }

    else if (v10)
    {
      -[MSUBrainClientImpl handleConnectionError:method:handler:].cold.1((uint64_t)a3, v9, v11, v12, v13, v14, v15, v16);
    }

    -[MSUBrainClientImpl _invalidateConnection](self, "_invalidateConnection");
    (*((void (**)(id))a5 + 2))(a5);
  }

- (void)preflightUpdate:(int)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100059D30;
  v15[5] = a6;
  v15[6] = "-[MSUBrainClientImpl preflightUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = -[MSUBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100059D58;
  v14[4] = a5;
  uint64_t v11 = -[MSURemoteableBlock initWithProgressBlock:]( objc_alloc(&OBJC_CLASS___MSURemoteableBlock),  "initWithProgressBlock:",  v14);
  uint64_t v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_100059D80;
    v13[4] = a6;
    [v10 _nsxpcPreflightUpdate:v9 options:a4 progress:v11 completion:v13];
  }

  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))( a6,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1364LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL)));
  }

id __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke( void *a1,  uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100059D08;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)prepareUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100059D30;
  v15[5] = a6;
  v15[6] = "-[MSUBrainClientImpl prepareUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = -[MSUBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100059D58;
  v14[4] = a5;
  uint64_t v11 = -[MSURemoteableBlock initWithProgressBlock:]( objc_alloc(&OBJC_CLASS___MSURemoteableBlock),  "initWithProgressBlock:",  v14);
  uint64_t v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_100059D80;
    v13[4] = a6;
    [v10 _nsxpcPrepareUpdate:a3 options:a4 progress:v11 completion:v13];
  }

  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))( a6,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1364LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL)));
  }

id __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100059D08;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)commitUnlockOnceToken:(id)a3 progress:(id)a4 completion:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke;
  v13[3] = &unk_100059D30;
  void v13[5] = a5;
  v13[6] = "-[MSUBrainClientImpl commitUnlockOnceToken:progress:completion:]";
  v13[4] = self;
  id v8 = -[MSUBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_3;
  v12[3] = &unk_100059D58;
  v12[4] = a4;
  uint64_t v9 = -[MSURemoteableBlock initWithProgressBlock:]( objc_alloc(&OBJC_CLASS___MSURemoteableBlock),  "initWithProgressBlock:",  v12);
  id v10 = v9;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_4;
    v11[3] = &unk_100059D80;
    v11[4] = a5;
    [v8 _nsxpcCommitUnlockOnceToken:a3 progress:v9 completion:v11];
  }

  else
  {
    NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
    uint64_t v15 = @"no remote object connection";
    (*((void (**)(id, NSError *))a5 + 2))( a5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1364LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL)));
  }

id __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_2;
  v6[3] = &unk_100059D08;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)applyUpdate:(id)a3 progress:(id)a4 completion:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke;
  v13[3] = &unk_100059D30;
  void v13[5] = a5;
  v13[6] = "-[MSUBrainClientImpl applyUpdate:progress:completion:]";
  v13[4] = self;
  id v8 = -[MSUBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_3;
  v12[3] = &unk_100059D58;
  v12[4] = a4;
  uint64_t v9 = -[MSURemoteableBlock initWithProgressBlock:]( objc_alloc(&OBJC_CLASS___MSURemoteableBlock),  "initWithProgressBlock:",  v12);
  id v10 = v9;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_4;
    v11[3] = &unk_100059D80;
    v11[4] = a5;
    [v8 _nsxpcApplyUpdate:a3 progress:v9 completion:v11];
  }

  else
  {
    NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
    uint64_t v15 = @"no remote object connection";
    (*((void (**)(id, NSError *))a5 + 2))( a5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1364LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL)));
  }

id __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_2;
  v6[3] = &unk_100059D08;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)cancelUpdate:(id)a3 purge:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke;
  v10[3] = &unk_100059D30;
  v10[5] = a5;
  void v10[6] = "-[MSUBrainClientImpl cancelUpdate:purge:completion:]";
  v10[4] = self;
  id v8 = -[MSUBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v10);
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_3;
    v9[3] = &unk_100059D80;
    v9[4] = a5;
    [v8 _nsxpcCancelUpdate:v6 options:a3 completion:v9];
  }

  else
  {
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    uint64_t v12 = @"no remote object connection";
    (*((void (**)(id, NSError *))a5 + 2))( a5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1364LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL)));
  }

id __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke(void *a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_2;
  v6[3] = &unk_100059D08;
  v2 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  v6[4] = a2;
  v6[5] = v4;
  return [v2 handleConnectionError:a2 method:v3 handler:v6];
}

uint64_t __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)calculateUpdateStorageRequirements:(int)a3 attributes:(id)a4 options:(id)a5 info:(id *)a6 error:(id *)a7
{
  uint64_t v11 = *(void *)&a3;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  char v54 = 0;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  char v46 = 0;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3052000000LL;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  uint64_t v42 = 0LL;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3052000000LL;
  v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  uint64_t v36 = 0LL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke;
  v30[3] = &unk_100059DD0;
  v30[7] = &v47;
  v30[8] = "-[MSUBrainClientImpl calculateUpdateStorageRequirements:attributes:options:info:error:]";
  v30[4] = self;
  v30[5] = &v43;
  v30[6] = &v37;
  id v12 = -[MSUBrainClientImpl _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v30);
  if (!v12)
  {
    NSErrorUserInfoKey v58 = NSDebugDescriptionErrorKey;
    __rqtp.tv_sec = (__darwin_time_t)@"no remote object connection";
    v19 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1364LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &__rqtp,  &v58,  1LL));
    goto LABEL_10;
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_96;
  v29[3] = &unk_100059DF8;
  v29[4] = &v43;
  v29[5] = &v51;
  v29[6] = &v31;
  v29[7] = &v37;
  v29[8] = &v47;
  v29[9] = "-[MSUBrainClientImpl calculateUpdateStorageRequirements:attributes:options:info:error:]";
  [v12 _nsxpcCalculateUpdateStorageRequirements:v11 attributes:a4 options:a5 completion:v29];
  v26 = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_98;
  v27 = &unk_100059E20;
  v28 = &v47;
  uint64_t v13 = objc_autoreleasePoolPush();
  NSErrorUserInfoKey v14 = +[NSDate date](&OBJC_CLASS___NSDate, "date", _NSConcreteStackBlock, 3221225472LL);
  do
  {
    uint64_t v15 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    -[NSRunLoop runUntilDate:]( +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"),  "runUntilDate:",  -[NSDate dateByAddingTimeInterval:](v15, "dateByAddingTimeInterval:", 0.02));
    -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v15);
    if (v16 < 0.02)
    {
      double v17 = 0.02 - v16;
      __rqtp.tv_sec = (uint64_t)v17;
      __rqtp.tv_nsec = (uint64_t)((v17 - (double)(uint64_t)v17) * 1000000000.0);
      nanosleep(&__rqtp, 0LL);
    }

    -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v14);
  }

  while (v18 < 10.0);
  objc_autoreleasePoolPop(v13);
  if (!*((_BYTE *)v48 + 24))
  {
    *((_BYTE *)v44 + 24) = 1;
    NSErrorUserInfoKey v55 = NSDebugDescriptionErrorKey;
    v56 = @"timeout waiting for SPI completion";
    v19 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1360LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
LABEL_10:
    id v20 = -[NSError copy](v19, "copy");
    v38[5] = (uint64_t)v20;
  }

  if (a6) {
    *a6 = (id)v32[5];
  }
  if (a7) {
    *a7 = (id)v38[5];
  }
  id v21 = (id)v32[5];
  id v22 = (id)v38[5];
  char v23 = *((_BYTE *)v52 + 24);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  return v23;
}

id __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  uint64_t v7 = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2;
  id v8 = &unk_100059DA8;
  __int128 v10 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = a2;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = v3;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2);
}

void __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2( uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    v2 = (os_log_s *)msuSharedLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2_cold_1( a1,  v2,  v3);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) copy];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

void __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_96( void *a1,  void *a2,  void *a3)
{
  if (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    uint64_t v6 = (os_log_s *)msuSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[9];
      int v10 = 136315650;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = a2;
      __int16 v14 = 2112;
      uint64_t v15 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s: method call already abandoned. info=%@ error=%@",  (uint8_t *)&v10,  0x20u);
    }
  }

  else
  {
    if (a3)
    {
      id v8 = [a3 copy];
      uint64_t v9 = a1[7];
    }

    else
    {
      *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
      id v8 = [a2 copy];
      uint64_t v9 = a1[6];
    }

    *(void *)(*(void *)(v9 + 8) + 40LL) = v8;
    *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 1;
  }

uint64_t __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_98( uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

- (BOOL)getUpdateInfo:(id)a3 options:(id)a4 info:(id *)a5 error:(id *)a6
{
  return 0;
}

- (id)buildVersion
{
  return 0LL;
}

- (id)machoUUID
{
  return 0LL;
}

- (id)timeDateStamp
{
  return 0LL;
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (NSString)brainUUID
{
  return self->_brainUUID;
}

void __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_91_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)handleConnectionError:(uint64_t)a3 method:(uint64_t)a4 handler:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)handleConnectionError:(uint64_t)a1 method:(uint64_t)a2 handler:(os_log_s *)a3 .cold.2( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s - connection error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_2_0( (void *)&_mh_execute_header,  a2,  a3,  "%s: method call already abandoned. error=%@",  (uint8_t *)&v5);
  OUTLINED_FUNCTION_4();
}

@end