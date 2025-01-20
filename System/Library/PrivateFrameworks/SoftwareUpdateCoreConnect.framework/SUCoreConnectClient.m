@interface SUCoreConnectClient
+ (id)_sharedClientLogger;
- (NSXPCConnection)serverConnection;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_dispatch_queue)clientConnectionStateAccessQueue;
- (OS_dispatch_queue)clientDelegateCallbackQueue;
- (OS_dispatch_queue)clientMessageQueue;
- (OS_dispatch_queue)clientReplyCompletionQueue;
- (SUCoreConnectClient)initWithClientPolicy:(id)a3;
- (SUCoreConnectClientPolicy)policy;
- (SUCoreLog)logger;
- (void)_droppedConnection:(id)a3;
- (void)_internalConnectToServerWithCompletion:(id)a3;
- (void)_invalidateConnection:(id)a3;
- (void)connectClientSendServerMessage:(id)a3;
- (void)connectClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5;
- (void)connectProtocolFromServerRequestClientID:(id)a3;
- (void)connectProtocolFromServerSendClientMessage:(id)a3;
- (void)connectProtocolFromServerSendClientMessage:(id)a3 reply:(id)a4;
- (void)connectToServerWithCompletion:(id)a3;
- (void)dealloc;
- (void)forceCloseConnection;
- (void)setLogger:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setServerConnection:(id)a3;
@end

@implementation SUCoreConnectClient

- (SUCoreConnectClient)initWithClientPolicy:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SUCoreConnectClient;
  v6 = -[SUCoreConnectClient init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_policy, a3);
    uint64_t v8 = +[SUCoreConnectClient _sharedClientLogger](&OBJC_CLASS___SUCoreConnectClient, "_sharedClientLogger");
    logger = v7->_logger;
    v7->_logger = (SUCoreLog *)v8;

    v10 = (const char *)[@"com.apple.SUCoreConnect.ClientConnectionStateAccessQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    clientConnectionStateAccessQueue = v7->_clientConnectionStateAccessQueue;
    v7->_clientConnectionStateAccessQueue = (OS_dispatch_queue *)v12;

    v14 = (const char *)[@"com.apple.SUCoreConnect.ClientDelegateCallbackQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    clientDelegateCallbackQueue = v7->_clientDelegateCallbackQueue;
    v7->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v16;

    v18 = (const char *)[@"com.apple.SUCoreConnect.ClientCompletionQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    clientCompletionQueue = v7->_clientCompletionQueue;
    v7->_clientCompletionQueue = (OS_dispatch_queue *)v20;

    v22 = (const char *)[@"com.apple.SUCoreConnect.ClientMessageQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    clientMessageQueue = v7->_clientMessageQueue;
    v7->_clientMessageQueue = (OS_dispatch_queue *)v24;

    v26 = (const char *)[@"com.apple.SUCoreConnect.ClientReplyCompletionQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v28 = dispatch_queue_create(v26, v27);
    clientReplyCompletionQueue = v7->_clientReplyCompletionQueue;
    v7->_clientReplyCompletionQueue = (OS_dispatch_queue *)v28;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = -[SUCoreConnectClient serverConnection](self, "serverConnection");
  if (v3)
  {
    v4 = -[SUCoreConnectClient logger](self, "logger");
    [v4 oslog];
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[SUCoreConnectClient policy](self, "policy");
      [v6 serviceName];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreConnectClient serverConnection](self, "serverConnection");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      __int16 v15 = 2114;
      dispatch_queue_t v16 = v8;
      _os_log_impl( &dword_18733E000,  v5,  OS_LOG_TYPE_DEFAULT,  "[InvalidateConnection](%{public}@) Invalidating the persistent server connection %{public}@",  buf,  0x16u);
    }
    v9 = -[SUCoreConnectClient serverConnection](self, "serverConnection");
    [v9 setInvalidationHandler:0];
    v10 = -[SUCoreConnectClient serverConnection](self, "serverConnection");
    [v10 setInterruptionHandler:0];
    v11 = -[SUCoreConnectClient serverConnection](self, "serverConnection");
    [v11 invalidate];

    -[SUCoreConnectClient setServerConnection:](self, "setServerConnection:", 0LL);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SUCoreConnectClient;
  -[SUCoreConnectClient dealloc](&v12, sel_dealloc);
}

+ (id)_sharedClientLogger
{
  if (_sharedClientLogger_oneClientLoggerToken != -1) {
    dispatch_once(&_sharedClientLogger_oneClientLoggerToken, &__block_literal_global_1);
  }
  return (id)_sharedClientLogger___sharedLogger;
}

void __42__SUCoreConnectClient__sharedClientLogger__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1896127A0]) initWithCategory:@"CLIENT"];
  v1 = (void *)_sharedClientLogger___sharedLogger;
  _sharedClientLogger___sharedLogger = v0;
}

- (void)_invalidateConnection:(id)a3
{
  id v4 = a3;
  -[SUCoreConnectClient clientConnectionStateAccessQueue](self, "clientConnectionStateAccessQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __45__SUCoreConnectClient__invalidateConnection___block_invoke;
  v7[3] = &unk_18A02A800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__SUCoreConnectClient__invalidateConnection___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) policy];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 usesPersistentXPCConnections])
  {
    [*(id *)(a1 + 32) serverConnection];
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      [*(id *)(a1 + 32) logger];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 oslog];
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(a1 + 32) policy];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 serviceName];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = *(void *)(a1 + 40);
        int v14 = 138543618;
        __int16 v15 = v7;
        __int16 v16 = 2114;
        uint64_t v17 = v8;
        _os_log_impl( &dword_18733E000,  v5,  OS_LOG_TYPE_DEFAULT,  "[InvalidateConnection](%{public}@) Not invalidating server connection %{public}@ as client usesPersistentXPCConnections",  (uint8_t *)&v14,  0x16u);
      }

      return;
    }
  }

  else
  {
  }

  [*(id *)(a1 + 32) logger];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) policy];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 serviceName];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    __int16 v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_impl( &dword_18733E000,  v10,  OS_LOG_TYPE_DEFAULT,  "[InvalidateConnection](%{public}@) Invalidating the server connection %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  [*(id *)(a1 + 40) setInvalidationHandler:0];
  [*(id *)(a1 + 40) setInterruptionHandler:0];
  [*(id *)(a1 + 40) invalidate];
}

- (void)_droppedConnection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = v5;
  if (v5)
  {
    -[SUCoreConnectClient clientConnectionStateAccessQueue](v5, "clientConnectionStateAccessQueue");
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __42__SUCoreConnectClient__droppedConnection___block_invoke;
    block[3] = &unk_18A02A898;
    v11 = v6;
    id v12 = v4;
    uint64_t v13 = v11;
    dispatch_async(v7, block);

    uint64_t v8 = v11;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClient _droppedConnection:].cold.1(v8);
    }
  }
}

uint64_t __42__SUCoreConnectClient__droppedConnection___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  [a1[4] policy];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientDelegate];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = objc_opt_respondsToSelector();

  id v5 = a1[4];
  if ((v4 & 1) != 0)
  {
    [v5 clientDelegateCallbackQueue];
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __42__SUCoreConnectClient__droppedConnection___block_invoke_2;
    v13[3] = &unk_18A02A800;
    int v14 = (os_log_s *)a1[4];
    id v15 = a1[5];
    dispatch_async(v6, v13);

    v7 = v14;
  }

  else
  {
    [v5 logger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [a1[4] policy];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 serviceName];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl( &dword_18733E000,  v7,  OS_LOG_TYPE_DEFAULT,  "[ConnectionDropped](%{public}@) Client connection dropped from XPC server, no delegate callback provided for con nection %{public}@",  buf,  0x16u);
    }
  }

  [a1[6] setServerConnection:0];
  return [a1[5] invalidate];
}

void __42__SUCoreConnectClient__droppedConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) logger];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) policy];
    char v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 serviceName];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543618;
    v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl( &dword_18733E000,  v3,  OS_LOG_TYPE_DEFAULT,  "[ConnectionDropped](%{public}@) Client connection dropped to XPC server, calling connectionClosed delegate callbac k for connection %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  [*(id *)(a1 + 32) policy];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 clientDelegate];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 connectionClosed];
}

- (void)_internalConnectToServerWithCompletion:(id)a3
{
  id v4 = a3;
  -[SUCoreConnectClient clientConnectionStateAccessQueue](self, "clientConnectionStateAccessQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke;
  v7[3] = &unk_18A02A9E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke(uint64_t a1)
{
  v64[2] = *(id *)MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) policy];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v2 usesPersistentXPCConnections] & 1) == 0)
  {

    goto LABEL_8;
  }

  [*(id *)(a1 + 32) serverConnection];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_8:
    [*(id *)(a1 + 32) logger];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) policy];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 serviceName];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl( &dword_18733E000,  v12,  OS_LOG_TYPE_DEFAULT,  "[ConnectToServer](%{public}@) Attempting to connect to server",  buf,  0xCu);
    }

    id v15 = objc_alloc(MEMORY[0x189607B30]);
    [*(id *)(a1 + 32) policy];
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 serviceName];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v18 = (void *)[v15 initWithMachServiceName:v17 options:0];

    id v19 = (const char *)[@"com.apple.SUCoreConnect.ServerConnectionQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);

    [v18 _setQueue:v21];
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D2540];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D1B48];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D20A8];
    dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3042000000LL;
    v62 = __Block_byref_object_copy__2;
    v63 = __Block_byref_object_dispose__2;
    v64[0] = 0LL;
    location = v64;
    objc_initWeak(v64, *(id *)(a1 + 32));
    uint64_t v25 = MEMORY[0x1895F87A8];
    v54[0] = MEMORY[0x1895F87A8];
    v54[1] = 3221225472LL;
    v54[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_84;
    v54[3] = &unk_18A02A7D8;
    v56 = buf;
    id v26 = v18;
    id v55 = v26;
    v50 = (void *)MEMORY[0x1895A2EF8](v54);
    [v26 setInvalidationHandler:v50];
    v51[0] = v25;
    v51[1] = 3221225472LL;
    v51[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_85;
    v51[3] = &unk_18A02A7D8;
    v53 = buf;
    id v10 = v26;
    id v52 = v10;
    v27 = (void *)MEMORY[0x1895A2EF8](v51);
    [v10 setInterruptionHandler:v27];
    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    dispatch_queue_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setClasses:v28 forSelector:sel_connectProtocolFromServerSendClientMessage_reply_ argumentIndex:0 ofReply:0];

    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setClasses:v29 forSelector:sel_connectProtocolFromServerSendClientMessage_reply_ argumentIndex:0 ofReply:1];

    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setClasses:v30 forSelector:sel_connectProtocolFromServerSendClientMessage_reply_ argumentIndex:1 ofReply:1];

    [*(id *)(a1 + 32) policy];
    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 proxyObjectClasses];
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(*(id *)(a1 + 32), "policy", v64);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 proxyObjectClasses];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setClasses:v34 forSelector:sel_executeGenericBlock_ argumentIndex:0 ofReply:0];

      [*(id *)(a1 + 32) policy];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 proxyObjectClasses];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setClasses:v36 forSelector:sel_executeGenericBlock_disableVerboseLogging_ argumentIndex:0 ofReply:0];
    }

    objc_msgSend( v23,  "setInterface:forSelector:argumentIndex:ofReply:",  v24,  sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_,  1,  0,  location);
    [v10 setExportedInterface:v22];
    [v10 setRemoteObjectInterface:v23];
    [v10 setExportedObject:*(void *)(a1 + 32)];
    [v10 resume];
    [*(id *)(a1 + 32) policy];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    int v38 = [v37 usesPersistentXPCConnections];

    if (v38)
    {
      [*(id *)(a1 + 32) logger];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 oslog];
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(a1 + 32) policy];
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 serviceName];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v57 = 138543362;
        v58 = v42;
        _os_log_impl( &dword_18733E000,  v40,  OS_LOG_TYPE_DEFAULT,  "[ConnectToServer](%{public}@) Client usesPersistentXPCConnections, assigning serverConnection",  v57,  0xCu);
      }

      [*(id *)(a1 + 32) setServerConnection:v10];
    }

    [*(id *)(a1 + 32) logger];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 oslog];
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) policy];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 serviceName];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138543618;
      v58 = v46;
      __int16 v59 = 2114;
      id v60 = v10;
      _os_log_impl( &dword_18733E000,  v44,  OS_LOG_TYPE_DEFAULT,  "[ConnectToServer](%{public}@) Successfully connected to server with connection %{public}@",  v57,  0x16u);
    }

    uint64_t v47 = *(void *)(a1 + 40);
    if (v47) {
      (*(void (**)(uint64_t, id))(v47 + 16))(v47, v10);
    }

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(locationa);

    goto LABEL_21;
  }

  [*(id *)(a1 + 32) logger];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) policy];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 serviceName];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) serverConnection];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl( &dword_18733E000,  v5,  OS_LOG_TYPE_DEFAULT,  "[ConnectToServer](%{public}@) Already connected to server, not reconnecting for client that usesPersistentXPCConne ctions for connection %{public}@",  buf,  0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    [*(id *)(a1 + 32) serverConnection];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
LABEL_21:
  }

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_84(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    [WeakRetained policy];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 clientID];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    [v7 policy];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 serviceName];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    int v14 = v9;
    _os_log_impl( &dword_18733E000,  v3,  OS_LOG_TYPE_DEFAULT,  "[CLIENT-%{public}@][InvalidatedHandler](%{public}@) Connection invalidated",  (uint8_t *)&v11,  0x16u);
  }

  id v10 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  [v10 _droppedConnection:*(void *)(a1 + 32)];
}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_85(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    [WeakRetained policy];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 clientID];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    [v7 policy];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 serviceName];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    int v14 = v9;
    _os_log_impl( &dword_18733E000,  v3,  OS_LOG_TYPE_DEFAULT,  "[CLIENT-%{public}@][InterruptedHandler](%{public}@) Connection interrupted",  (uint8_t *)&v11,  0x16u);
  }

  id v10 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  [v10 _droppedConnection:*(void *)(a1 + 32)];
}

- (void)connectToServerWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke;
  v6[3] = &unk_18A02AA30;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[SUCoreConnectClient _internalConnectToServerWithCompletion:](self, "_internalConnectToServerWithCompletion:", v6);
}

void __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) clientCompletionQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke_2;
  block[3] = &unk_18A02AA08;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  void block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) _invalidateConnection:*(void *)(a1 + 40)];
}

- (void)connectClientSendServerMessage:(id)a3
{
}

- (void)connectClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x189612760];
  [v8 clientID];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectClient policy](self, "policy");
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 clientID];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = [v11 stringIsEqual:v12 to:v14];

  if ((v11 & 1) != 0)
  {
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101;
    v31[3] = &unk_18A02AAF8;
    v31[4] = self;
    id v34 = v10;
    id v32 = v8;
    id v33 = v9;
    -[SUCoreConnectClient _internalConnectToServerWithCompletion:](self, "_internalConnectToServerWithCompletion:", v31);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v16 = (void *)NSString;
    [v8 clientID];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConnectClient policy](self, "policy");
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 clientID];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringWithFormat:@"ClientID of message (%@) does not align with policy clientID (%@)", v17, v19];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 buildError:8907 underlying:0 description:v20];
    dispatch_queue_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189612778] sharedDiag];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 description];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v22,  "trackAnomaly:forReason:withResult:withError:",  @"connectClientSendServerMessage",  v23,  objc_msgSend(v21, "code"),  v21);

    -[SUCoreConnectClient logger](self, "logger");
    dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClient connectClientSendServerMessage:proxyObject:withReply:].cold.1(self, (uint64_t)v21, v25);
    }

    if (v10)
    {
      -[SUCoreConnectClient clientCompletionQueue](self, "clientCompletionQueue");
      id v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke;
      block[3] = &unk_18A02AA58;
      v37 = (os_log_s *)v10;
      id v36 = v21;
      dispatch_async(v26, block);

      v27 = v37;
    }

    else
    {
      -[SUCoreConnectClient logger](self, "logger");
      dispatch_queue_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 oslog];
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = -[SUCoreConnectClient policy](self, "policy");
        [v29 serviceName];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v30;
        _os_log_impl( &dword_18733E000,  v27,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) Validation Error: No reply completion was provided",  buf,  0xCu);
      }
    }
  }
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101( uint64_t a1,  void *a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) logger];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) policy];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 serviceName];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v29 = v8;
      __int16 v30 = 2114;
      uint64_t v31 = v9;
      __int16 v32 = 2114;
      id v33 = v3;
      _os_log_impl( &dword_18733E000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) Connected to server and calling sendMessage %{public}@ for connection %{public}@",  buf,  0x20u);
    }

    uint64_t v10 = MEMORY[0x1895F87A8];
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_105;
    v23[3] = &unk_18A02AAA8;
    v23[4] = *(void *)(a1 + 32);
    id v11 = v3;
    id v24 = v11;
    id v25 = *(id *)(a1 + 56);
    [v11 remoteObjectProxyWithErrorHandler:v23];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472LL;
    v20[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_108;
    v20[3] = &unk_18A02AAD0;
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v11;
    id v22 = *(id *)(a1 + 56);
    [v12 connectProtocolFromClientSendServerMessage:v14 proxyObject:v13 withReply:v20];

    uint64_t v15 = v24;
    goto LABEL_9;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_2((id *)(a1 + 32));
  }

  __int16 v16 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 56))
  {
    [v16 clientCompletionQueue];
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_102;
    block[3] = &unk_18A02AA80;
    id v27 = *(id *)(a1 + 56);
    dispatch_async(v17, block);

    uint64_t v15 = v27;
LABEL_9:

    goto LABEL_10;
  }

  [v16 logger];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 oslog];
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_1(v4);
  }

LABEL_10:
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_102( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189612760] sharedCore];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 buildError:8909 underlying:0 description:@"No server connection present to send client->server message"];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0LL, v2);
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_105( uint64_t a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) logger];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [*(id *)(a1 + 32) policy];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 serviceName];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    id v22 = v3;
    __int16 v23 = 2114;
    uint64_t v24 = v15;
    _os_log_error_impl( &dword_18733E000,  v5,  OS_LOG_TYPE_ERROR,  "[SendServerMessage](%{public}@) ErrorHandler: Calling provided reply completion on connection error %{public}@ for connection %{public}@",  buf,  0x20u);
  }

  id v6 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    [v6 clientCompletionQueue];
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_106;
    v16[3] = &unk_18A02AA58;
    __int16 v18 = (os_log_s *)*(id *)(a1 + 48);
    id v17 = v3;
    dispatch_async(v7, v16);

    id v8 = v18;
  }

  else
  {
    [v6 logger];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) policy];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 serviceName];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      id v22 = v12;
      _os_log_impl( &dword_18733E000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) ErrorHandler: No reply completion was provided for connection %{public}@",  buf,  0x16u);
    }
  }

  [*(id *)(a1 + 32) _invalidateConnection:*(void *)(a1 + 40)];
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_106( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_108( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) logger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) policy];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 serviceName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v40 = v10;
    __int16 v41 = 2114;
    id v42 = v5;
    __int16 v43 = 2114;
    id v44 = v6;
    __int16 v45 = 2114;
    uint64_t v46 = v11;
    _os_log_impl( &dword_18733E000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) sendMessage response received from server with response %{public}@ error %{public} @ for connection %{public}@",  buf,  0x2Au);
  }

  uint64_t v12 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    [v12 clientCompletionQueue];
    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109;
    block[3] = &unk_18A02AA08;
    id v38 = *(id *)(a1 + 48);
    id v36 = v5;
    id v37 = v6;
    dispatch_async(v13, block);

    uint64_t v14 = v38;
LABEL_9:

    goto LABEL_10;
  }

  [v12 policy];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 clientDelegate];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = objc_opt_respondsToSelector();

  [*(id *)(a1 + 32) logger];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 oslog];
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if ((v17 & 1) != 0)
  {
    if (v20)
    {
      [*(id *)(a1 + 32) policy];
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 serviceName];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v22;
      __int16 v41 = 2114;
      id v42 = v23;
      _os_log_impl( &dword_18733E000,  v19,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) Calling reply delegate callback 'handleResponse:error:' for connection %{public}@",  buf,  0x16u);
    }

    [*(id *)(a1 + 32) clientDelegateCallbackQueue];
    uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = MEMORY[0x1895F87A8];
    uint64_t v29 = 3221225472LL;
    __int16 v30 = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_112;
    uint64_t v31 = &unk_18A02A898;
    uint64_t v32 = *(void *)(a1 + 32);
    id v33 = v5;
    id v34 = v6;
    dispatch_async(v24, &v28);

    uint64_t v14 = v33;
    goto LABEL_9;
  }

  if (v20)
  {
    [*(id *)(a1 + 32) policy];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 serviceName];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v26;
    __int16 v41 = 2114;
    id v42 = v27;
    _os_log_impl( &dword_18733E000,  v19,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) Client does not respond to the handleMessage:reply: delegate callback and no reply completion was provided for connection %{public}@",  buf,  0x16u);
  }

LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection:", *(void *)(a1 + 40), v28, v29, v30, v31, v32);
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_112( uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 clientDelegate];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 handleResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)forceCloseConnection
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  -[SUCoreConnectClient logger](self, "logger");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConnectClient policy](self, "policy");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 serviceName];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl( &dword_18733E000,  v4,  OS_LOG_TYPE_DEFAULT,  "[ForceCloseConnection](%{public}@) Incoming client request to force close connection",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)connectProtocolFromServerRequestClientID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    -[SUCoreConnectClient clientReplyCompletionQueue](self, "clientReplyCompletionQueue");
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __64__SUCoreConnectClient_connectProtocolFromServerRequestClientID___block_invoke;
    v12[3] = &unk_18A02A9E0;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v5, v12);
  }

  else
  {
    -[SUCoreConnectClient logger](self, "logger");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreConnectClient policy](self, "policy");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 serviceName];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreConnectClient policy](self, "policy");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 clientID];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      char v17 = v11;
      _os_log_impl( &dword_18733E000,  v7,  OS_LOG_TYPE_DEFAULT,  "[RequestClientID](%{public}@) Replying to server for clientID request: %{public}@, no reply block provided",  buf,  0x16u);
    }
  }
}

void __64__SUCoreConnectClient_connectProtocolFromServerRequestClientID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) logger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) policy];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 serviceName];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) policy];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 clientID];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl( &dword_18733E000,  v3,  OS_LOG_TYPE_DEFAULT,  "[RequestClientID](%{public}@) Replying to server for clientID request: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) policy];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 clientID];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);
}

- (void)connectProtocolFromServerSendClientMessage:(id)a3
{
}

- (void)connectProtocolFromServerSendClientMessage:(id)a3 reply:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SUCoreConnectClient policy](self, "policy");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 clientDelegate];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SUCoreConnectClient logger](self, "logger");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreConnectClient policy](self, "policy");
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 serviceName];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v33 = v14;
      _os_log_impl( &dword_18733E000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SendClientMessage](%{public}@) Calling client delegate method handleMessage",  buf,  0xCu);
    }

    -[SUCoreConnectClient clientMessageQueue](self, "clientMessageQueue");
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke;
    block[3] = &unk_18A02AB20;
    void block[4] = self;
    id v30 = v6;
    id v31 = v7;
    dispatch_async(v15, block);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 buildError:8900 underlying:0 description:@"Client does not respond to messages"];
    char v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConnectClient logger](self, "logger");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v20)
      {
        -[SUCoreConnectClient policy](self, "policy");
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 serviceName];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v33 = v22;
        __int16 v34 = 2114;
        id v35 = v6;
        __int16 v36 = 2114;
        id v37 = v17;
        _os_log_impl( &dword_18733E000,  v19,  OS_LOG_TYPE_DEFAULT,  "[SendClientMessage](%{public}@) Client does not respond to handleMessage:%{public}@, error:%{public}@, calling reply block",  buf,  0x20u);
      }

      -[SUCoreConnectClient clientReplyCompletionQueue](self, "clientReplyCompletionQueue");
      __int16 v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke_118;
      v26[3] = &unk_18A02AA58;
      uint64_t v28 = (os_log_s *)v7;
      id v27 = v17;
      dispatch_async(v23, v26);

      id v19 = v28;
    }

    else if (v20)
    {
      -[SUCoreConnectClient policy](self, "policy");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 serviceName];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v33 = v25;
      __int16 v34 = 2114;
      id v35 = v6;
      __int16 v36 = 2114;
      id v37 = v17;
      _os_log_impl( &dword_18733E000,  v19,  OS_LOG_TYPE_DEFAULT,  "[SendClientMessage](%{public}@) Client does not respond to handleMessage:%{public}@, error: %{public}@, and no r eply block provided",  buf,  0x20u);
    }
  }
}

void __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 clientDelegate];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 handleMessage:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

uint64_t __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke_118( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (SUCoreConnectClientPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (OS_dispatch_queue)clientConnectionStateAccessQueue
{
  return self->_clientConnectionStateAccessQueue;
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (OS_dispatch_queue)clientMessageQueue
{
  return self->_clientMessageQueue;
}

- (OS_dispatch_queue)clientReplyCompletionQueue
{
  return self->_clientReplyCompletionQueue;
}

- (void).cxx_destruct
{
}

- (void)_droppedConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_18733E000,  log,  OS_LOG_TYPE_ERROR,  "[ConnectionDropped] Client connection dropped to XPC server, found no retained client object available during cleanup",  v1,  2u);
}

- (void)connectClientSendServerMessage:(void *)a1 proxyObject:(uint64_t)a2 withReply:(os_log_s *)a3 .cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [a1 policy];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 serviceName];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_18733E000,  a3,  OS_LOG_TYPE_ERROR,  "[SendServerMessage](%{public}@) Validation Error: Calling provided reply completion with error %{public}@",  (uint8_t *)&v7,  0x16u);

  OUTLINED_FUNCTION_1();
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_1( id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 serviceName];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1( &dword_18733E000,  v3,  v4,  "[SendServerMessage](%{public}@) No reply completion provided",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_1();
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_101_cold_2( id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 serviceName];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1( &dword_18733E000,  v3,  v4,  "[SendServerMessage](%{public}@) No server connection present to send client->server message",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_1();
}

@end