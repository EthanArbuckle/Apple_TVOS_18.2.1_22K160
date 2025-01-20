@interface SUCoreConnectServer
- (BOOL)isConnectionEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)connections;
- (NSMutableSet)observerConnections;
- (NSString)description;
- (OS_dispatch_queue)connectionSendMessageQueue;
- (OS_dispatch_queue)connectionsAccessQueue;
- (SUCoreConnectServer)initWithServerPolicy:(id)a3;
- (SUCoreConnectServerPolicy)connectionPolicy;
- (SUCoreLog)logger;
- (id)_clientIDForConnection:(id)a3;
- (id)_connectionsForClientID:(id)a3;
- (id)_getAllObserverConnections;
- (void)_informObserversOfCompletionReplyWithMessage:(id)a3 error:(id)a4;
- (void)_removeConnection:(id)a3;
- (void)_setConnection:(id)a3 forClientID:(id)a4;
- (void)connectProtocolFromClientSendServerMessage:(id)a3;
- (void)connectProtocolFromClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5;
- (void)connectServerSendClientMessage:(id)a3;
- (void)setupListenerAndResumeConnection;
@end

@implementation SUCoreConnectServer

- (SUCoreConnectServer)initWithServerPolicy:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SUCoreConnectServer;
  v6 = -[SUCoreConnectServer init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionPolicy, a3);
    id v8 = objc_alloc(MEMORY[0x1896127A0]);
    v9 = (void *)NSString;
    [v5 serviceName];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 stringWithFormat:@"SERVER-%@", v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v8 initWithCategory:v11];
    logger = v7->_logger;
    v7->_logger = (SUCoreLog *)v12;

    v14 = (const char *)[@"com.apple.SUCoreConnect.ConnectionsAccessQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    connectionsAccessQueue = v7->_connectionsAccessQueue;
    v7->_connectionsAccessQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    connections = v7->_connections;
    v7->_connections = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    observerConnections = v7->_observerConnections;
    v7->_observerConnections = v20;

    v22 = (const char *)[@"com.apple.SUCoreConnect.ConnectionSendMessageQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    connectionSendMessageQueue = v7->_connectionSendMessageQueue;
    v7->_connectionSendMessageQueue = (OS_dispatch_queue *)v24;
  }

  return v7;
}

- (BOOL)isConnectionEntitled:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SUCoreConnectServer logger](self, "logger");
    dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer isConnectionEntitled:].cold.1();
    }
    goto LABEL_31;
  }
  v6 = -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  uint64_t v7 = [v6 entitlements];
  if (!v7)
  {

LABEL_20:
    v25 = -[SUCoreConnectServer logger](self, "logger");
    [v25 oslog];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer isConnectionEntitled:].cold.2();
    }
LABEL_31:
    BOOL v23 = 0;
    goto LABEL_32;
  }

  id v8 = (void *)v7;
  v9 = -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  [v9 entitlements];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];

  if (!v11) {
    goto LABEL_20;
  }
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 entitlements];
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
  if (!v14)
  {
    BOOL v23 = 1;
    goto LABEL_32;
  }

  uint64_t v16 = v14;
  uint64_t v17 = *(void *)v34;
  *(void *)&__int128 v15 = 138543618LL;
  __int128 v32 = v15;
  while (2)
  {
    for (uint64_t i = 0LL; i != v16; ++i)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
      v20 = -[SUCoreConnectServer logger](self, "logger", v32);
      [v20 oslog];
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        _os_log_impl( &dword_18733E000,  v21,  OS_LOG_TYPE_DEFAULT,  "[EntitlementValidation](%{public}@)(%@) Checking for entitlement",  buf,  0x16u);
      }

      [v4 valueForEntitlement:v19];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v26 = -[SUCoreConnectServer logger](self, "logger");
        [v26 oslog];
        objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = v32;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        v28 = "[EntitlementValidation](%{public}@)(%@) Client process does not have the entitlement";
LABEL_29:
        _os_log_impl(&dword_18733E000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
        goto LABEL_30;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = -[SUCoreConnectServer logger](self, "logger");
        [v29 oslog];
        objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = v32;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        v28 = "[EntitlementValidation](%{public}@)(%@) New connection's entitlement is not a BOOLean";
        goto LABEL_29;
      }

      if (([v22 BOOLValue] & 1) == 0)
      {
        v30 = -[SUCoreConnectServer logger](self, "logger");
        [v30 oslog];
        objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v32;
          id v38 = v4;
          __int16 v39 = 2112;
          uint64_t v40 = v19;
          v28 = "[EntitlementValidation](%{public}@)(%@) New connection's value for entitlement is false";
          goto LABEL_29;
        }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v48[2] = *(id *)MEMORY[0x1895F89C0];
  id v34 = a3;
  id v6 = a4;
  -[SUCoreConnectServer logger](self, "logger");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( &dword_18733E000,  v8,  OS_LOG_TYPE_DEFAULT,  "[ListenerNewConnection](%{public}@) Attempting to connect with new connection",  (uint8_t *)&buf,  0xCu);
  }
  v9 = -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  [v9 serverDelegate];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 serverDelegate];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = [v13 isConnectionAuthorized:v6];

    if ((v14 & 1) == 0)
    {
      -[SUCoreConnectServer logger](self, "logger");
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 oslog];
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SUCoreConnectServer listener:shouldAcceptNewConnection:].cold.1();
      }
LABEL_14:

      [v6 invalidate];
      BOOL v30 = 0;
      goto LABEL_15;
    }
  }

  else if (!-[SUCoreConnectServer isConnectionEntitled:](self, "isConnectionEntitled:", v6))
  {
    v31 = -[SUCoreConnectServer logger](self, "logger");
    [v31 oslog];
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer listener:shouldAcceptNewConnection:].cold.2();
    }
    goto LABEL_14;
  }

  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 connectionQueue];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 _setQueue:v18];

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3042000000LL;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48[0] = 0LL;
  objc_initWeak(v48, self);
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x3042000000LL;
  v40[3] = __Block_byref_object_copy__0;
  v40[4] = __Block_byref_object_dispose__0;
  id v41 = 0LL;
  objc_initWeak(&v41, v6);
  v39[0] = MEMORY[0x1895F87A8];
  v39[1] = 3221225472LL;
  v39[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke;
  v39[3] = &unk_18A02A848;
  v39[4] = &buf;
  v39[5] = v40;
  __int128 v33 = (void *)MEMORY[0x1895A2EF8](v39);
  [v6 setInterruptionHandler:v33];
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v38[3] = &unk_18A02A848;
  v38[4] = &buf;
  v38[5] = v40;
  uint64_t v19 = (void *)MEMORY[0x1895A2EF8](v38);
  [v6 setInvalidationHandler:v19];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D1B48];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D20A8];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setClasses:v22 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:0 ofReply:0];

  [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setClasses:v23 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:1 ofReply:0];

  [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setClasses:v24 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:0 ofReply:1];

  [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setClasses:v25 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:1 ofReply:1];

  [v20 setInterface:v21 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:1 ofReply:0];
  [v6 setExportedInterface:v20];
  [v6 setExportedObject:self];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D2540];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setRemoteObjectInterface:v26];
  [v6 resume];
  -[SUCoreConnectServer logger](self, "logger");
  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 oslog];
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v42 = 138543362;
    id v43 = v6;
    _os_log_impl( &dword_18733E000,  v28,  OS_LOG_TYPE_DEFAULT,  "[ListenerNewConnection](%{public}@) Resumed connection, requesting clientID",  v42,  0xCu);
  }

  -[SUCoreConnectServer connectionSendMessageQueue](self, "connectionSendMessageQueue");
  v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_83;
  block[3] = &unk_18A02A800;
  id v36 = v6;
  v37 = self;
  dispatch_async(v29, block);

  _Block_object_dispose(v40, 8);
  objc_destroyWeak(&v41);
  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(v48);
  BOOL v30 = 1;
LABEL_15:

  return v30;
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  id v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      [WeakRetained logger];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 oslog];
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v15 = v4;
        _os_log_impl( &dword_18733E000,  v6,  OS_LOG_TYPE_DEFAULT,  "[InterruptedHandler](%{public}@) Client connection interrupted, removing from connections list",  buf,  0xCu);
      }

      [WeakRetained connectionsAccessQueue];
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_11;
      v11[3] = &unk_18A02A800;
      uint64_t v12 = (os_log_s *)WeakRetained;
      id v13 = v4;
      dispatch_async(v7, v11);

      id v8 = v12;
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 oslog];
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_2();
      }
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
    }
  }
}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeConnection:*(void *)(a1 + 40)];
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  id v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      [WeakRetained logger];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 oslog];
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v15 = v4;
        _os_log_impl( &dword_18733E000,  v6,  OS_LOG_TYPE_DEFAULT,  "[InvalidatedHandler](%{public}@) Client connection invalidated, removing from connections list",  buf,  0xCu);
      }

      [WeakRetained connectionsAccessQueue];
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_13;
      v11[3] = &unk_18A02A800;
      uint64_t v12 = (os_log_s *)WeakRetained;
      id v13 = v4;
      dispatch_async(v7, v11);

      id v8 = v12;
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 oslog];
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_2();
      }
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_1();
    }
  }
}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeConnection:*(void *)(a1 + 40)];
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_83(int8x16_t *a1)
{
  uint64_t v2 = MEMORY[0x1895F87A8];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84;
  v9[3] = &unk_18A02A870;
  int8x16_t v5 = a1[2];
  int8x16_t v10 = vextq_s8(v5, v5, 8uLL);
  [(id)v5.i64[0] remoteObjectProxyWithErrorHandler:v9];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_86;
  v7[3] = &unk_18A02A8C0;
  int8x16_t v6 = a1[2];
  id v4 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  [v3 connectProtocolFromServerRequestClientID:v7];
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) logger];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int8x16_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84_cold_1(a1, (uint64_t)v3, v5);
  }

  [*(id *)(a1 + 40) invalidate];
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) logger];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int8x16_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)__int128 buf = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl( &dword_18733E000,  v5,  OS_LOG_TYPE_DEFAULT,  "[ListenerNewConnection](%{public}@) Completion successfully received for request of clientID: %{public}@",  buf,  0x16u);
  }

  [*(id *)(a1 + 32) connectionsAccessQueue];
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_87;
  block[3] = &unk_18A02A898;
  int8x16_t v8 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v8;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_87(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setConnection:*(void *)(a1 + 40) forClientID:*(void *)(a1 + 48)];
}

- (void)setupListenerAndResumeConnection
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__SUCoreConnectServer_setupListenerAndResumeConnection__block_invoke;
  block[3] = &unk_18A02A8E8;
  void block[4] = self;
  if (setupListenerAndResumeConnection_onceToken != -1) {
    dispatch_once(&setupListenerAndResumeConnection_onceToken, block);
  }
}

void __55__SUCoreConnectServer_setupListenerAndResumeConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) logger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) connectionPolicy];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = 138543362;
    uint64_t v14 = v4;
    _os_log_impl( &dword_18733E000,  v3,  OS_LOG_TYPE_DEFAULT,  "[ListenerStartup] Setting up listener, enabling transactions, and resuming connection using policy: %{public}@",  (uint8_t *)&v13,  0xCu);
  }

  [MEMORY[0x189607B50] enableTransactions];
  id v5 = objc_alloc(MEMORY[0x189607B50]);
  [*(id *)(a1 + 32) connectionPolicy];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 serviceName];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int8x16_t v8 = (void *)[v5 initWithMachServiceName:v7];

  [v8 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) connectionPolicy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 connectionQueue];
  int8x16_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 _setQueue:v10];

  [v8 resume];
  [*(id *)(a1 + 32) logger];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl( &dword_18733E000,  v12,  OS_LOG_TYPE_DEFAULT,  "[ListenerStartup] Listener connection resumed, setup completed.",  (uint8_t *)&v13,  2u);
  }
}

- (void)connectProtocolFromClientSendServerMessage:(id)a3
{
}

- (void)connectProtocolFromClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  int8x16_t v10 = (void (**)(id, void, void *))a5;
  -[SUCoreConnectServer logger](self, "logger");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = @"YES";
    if (v9) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    *(_DWORD *)__int128 buf = 138543874;
    id v54 = v8;
    v56 = v14;
    __int16 v55 = 2114;
    if (!v10) {
      int v13 = @"NO";
    }
    __int16 v57 = 2114;
    v58 = v13;
    _os_log_impl( &dword_18733E000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage] Received message: %{public}@ (proxyObject:%{public}@, reply:%{public}@)",  buf,  0x20u);
  }

  [MEMORY[0x189607B30] currentConnection];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 clientID];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = [v16 isEqualToString:@"*"];

  if (v17)
  {
    v18 = (void *)[objc_alloc(NSString) initWithFormat:@"[SendServerMessage](%@) Observer clients cannot send messages to server", v15];
    [MEMORY[0x189612760] sharedCore];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 buildError:8906 underlying:0 description:v18];
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConnectServer _informObserversOfCompletionReplyWithMessage:error:]( self,  "_informObserversOfCompletionReplyWithMessage:error:",  v8,  v20);
    v21 = -[SUCoreConnectServer logger](self, "logger");
    [v21 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v23) {
        goto LABEL_17;
      }
      goto LABEL_18;
    }

    if (v23) {
      -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.1();
    }
    goto LABEL_32;
  }

  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 serverDelegate];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  char v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0)
  {
    v18 = (void *)[objc_alloc(NSString) initWithFormat:@"[SendServerMessage](%@) handleMessage selector is not implemented by server delegate", v15];
    [MEMORY[0x189612760] sharedCore];
    objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 buildError:8113 underlying:0 description:v18];
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConnectServer _informObserversOfCompletionReplyWithMessage:error:]( self,  "_informObserversOfCompletionReplyWithMessage:error:",  v8,  v20);
    v28 = -[SUCoreConnectServer logger](self, "logger");
    [v28 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v29 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v29) {
LABEL_17:
      }
        -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.2();
LABEL_18:

      v10[2](v10, 0LL, v20);
LABEL_33:

      goto LABEL_39;
    }

    if (v29) {
      -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.3();
    }
LABEL_32:

    goto LABEL_33;
  }

  if (v15)
  {
    [v15 auditToken];
  }

  else
  {
    __int128 v51 = 0u;
    __int128 v52 = 0u;
  }

  v50[0] = v51;
  v50[1] = v52;
  [v8 setClientConnectionAuditToken:v50];
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 serverDelegate];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  char v32 = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    -[SUCoreConnectServer logger](self, "logger");
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 oslog];
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v54 = v15;
      _os_log_impl( &dword_18733E000,  v34,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage using isConnection:authorizedForMessa ge: via server delegate",  buf,  0xCu);
    }

    -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 serverDelegate];
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    char v37 = [v36 isConnection:v15 authorizedForMessage:v8];

    if ((v37 & 1) == 0)
    {
      id v38 = (void *)[objc_alloc(NSString) initWithFormat:@"[SendServerMessage](%@) client is not entitled for specific message request", v15];
      [MEMORY[0x189612760] sharedCore];
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 buildError:8113 underlying:0 description:v38];
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreConnectServer _informObserversOfCompletionReplyWithMessage:error:]( self,  "_informObserversOfCompletionReplyWithMessage:error:",  v8,  v40);
      -[SUCoreConnectServer logger](self, "logger");
      id v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 oslog];
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
      if (v10)
      {
        if (v43) {
          -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.2();
        }

        v10[2](v10, 0LL, v40);
      }

      else
      {
        if (v43) {
          -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:].cold.3();
        }
      }
    }
  }
  v44 = -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  [v44 serverDelegate];
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 3221225472LL;
  v46[2] = __88__SUCoreConnectServer_connectProtocolFromClientSendServerMessage_proxyObject_withReply___block_invoke;
  v46[3] = &unk_18A02A910;
  v46[4] = self;
  id v47 = v8;
  v49 = v10;
  id v48 = v15;
  [v45 handleMessage:v47 proxyObject:v9 reply:v46];

LABEL_39:
}

void __88__SUCoreConnectServer_connectProtocolFromClientSendServerMessage_proxyObject_withReply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _informObserversOfCompletionReplyWithMessage:*(void *)(a1 + 40) error:v6];
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }

  else
  {
    [*(id *)(a1 + 32) logger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      [v6 checkedDescription];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v5;
      __int16 v16 = 2114;
      int v17 = v11;
      _os_log_impl( &dword_18733E000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage was not provided a reply block, respo nse:%{public}@ error:%{public}@",  (uint8_t *)&v12,  0x20u);
    }
  }
}

- (void)_informObserversOfCompletionReplyWithMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke;
  block[3] = &unk_18A02A898;
  id v12 = v6;
  id v13 = v7;
  __int16 v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v2 setSafeObject:*(void *)(a1 + 32) forKey:@"SUCoreConnectMonitorReplyMessage"];
  [v2 setSafeObject:*(void *)(a1 + 40) forKey:@"SUCoreConnectMonitorReplyError"];
  id v3 = objc_alloc(&OBJC_CLASS___SUCoreConnectMessage);
  uint64_t v4 = [*(id *)(a1 + 32) messageType];
  [*(id *)(a1 + 32) messageName];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) clientID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) version];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[SUCoreConnectMessage initWithType:messageName:clientID:version:message:]( v3,  "initWithType:messageName:clientID:version:message:",  v4,  v5,  v6,  v7,  v2);

  [*(id *)(a1 + 48) _getAllObserverConnections];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9 && [v9 count])
  {
    v20 = v10;
    id v21 = v2;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 48), "logger", v20, v21);
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 oslog];
          int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543362;
            uint64_t v30 = v15;
            _os_log_impl( &dword_18733E000,  v17,  OS_LOG_TYPE_DEFAULT,  "[InformObserversOfReplyCompletion] Attempting to send message (no reply expected) to observer client with connection %{public}@",  buf,  0xCu);
          }

          [*(id *)(a1 + 48) connectionSendMessageQueue];
          uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_107;
          block[3] = &unk_18A02A898;
          uint64_t v19 = *(void *)(a1 + 48);
          void block[4] = v15;
          void block[5] = v19;
          dispatch_queue_t v24 = v8;
          dispatch_async(v18, block);
        }

        uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }

      while (v12);
    }

    id v10 = v20;
    id v2 = v21;
  }
}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_107( int8x16_t *a1)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_2;
  v4[3] = &unk_18A02A870;
  int8x16_t v2 = a1[2];
  int8x16_t v5 = vextq_s8(v2, v2, 8uLL);
  [(id)v2.i64[0] remoteObjectProxyWithErrorHandler:v4];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 connectProtocolFromServerSendClientMessage:a1[3].i64[0]];
}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) logger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int8x16_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    [v3 checkedDescription];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl( &dword_18733E000,  v5,  OS_LOG_TYPE_DEFAULT,  "[InformObserversOfReplyCompletion] ErrorHandler: Connection failed (no completion was expected to be called) for o bserver client connection %{public}@ with error %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  [*(id *)(a1 + 40) invalidate];
}

- (void)connectServerSendClientMessage:(id)a3
{
  id v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  int8x16_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke;
  v7[3] = &unk_18A02A800;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) logger];
  int8x16_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)__int128 buf = 138543362;
    id v54 = v4;
    _os_log_impl( &dword_18733E000,  v3,  OS_LOG_TYPE_DEFAULT,  "[SendClientMessage] Method called to send message: %{public}@",  buf,  0xCu);
  }

  char v37 = (id *)(a1 + 40);
  int8x16_t v5 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) clientID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _connectionsForClientID:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id obj = v7;
    uint64_t v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v57,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      __int128 v35 = v7;
      uint64_t v10 = *(void *)v49;
      uint64_t v11 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          [*(id *)(a1 + 32) logger];
          __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 oslog];
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            [*v37 clientID];
            __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138543618;
            id v54 = v16;
            __int16 v55 = 2114;
            uint64_t v56 = v13;
            _os_log_impl( &dword_18733E000,  v15,  OS_LOG_TYPE_DEFAULT,  "[SendClientMessage] Attempting to send message (no reply expected) to client %{public}@ with connection %{public}@",  buf,  0x16u);
          }

          [*(id *)(a1 + 32) connectionSendMessageQueue];
          int v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          block[0] = v11;
          block[1] = 3221225472LL;
          block[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_108;
          block[3] = &unk_18A02A898;
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void **)(a1 + 40);
          void block[4] = v13;
          void block[5] = v18;
          id v47 = v19;
          dispatch_async(v17, block);
        }

        uint64_t v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v57,  16LL);
      }

      while (v9);
      id v7 = v35;
    }
  }

  else
  {
    [*(id *)(a1 + 32) logger];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    id obj = v21;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_cold_1(v37, v21);
    }
  }

  [*(id *)(a1 + 32) _getAllObserverConnections];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v23 = v22;
  if (v22 && [v22 count])
  {
    id v36 = v7;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id obja = v23;
    uint64_t v24 = [obja countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v43;
      uint64_t v27 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t j = 0LL; j != v25; ++j)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(obja);
          }
          BOOL v29 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          [*(id *)(a1 + 32) logger];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 oslog];
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543362;
            id v54 = v29;
            _os_log_impl( &dword_18733E000,  v31,  OS_LOG_TYPE_DEFAULT,  "[SendClientMessage] Attempting to send message (no reply expected) to observer client with connection %{public}@",  buf,  0xCu);
          }

          [*(id *)(a1 + 32) connectionSendMessageQueue];
          uint64_t v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          v40[0] = v27;
          v40[1] = 3221225472LL;
          v40[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_109;
          v40[3] = &unk_18A02A898;
          uint64_t v33 = *(void *)(a1 + 32);
          id v34 = *(void **)(a1 + 40);
          v40[4] = v29;
          void v40[5] = v33;
          id v41 = v34;
          dispatch_async(v32, v40);
        }

        uint64_t v25 = [obja countByEnumeratingWithState:&v42 objects:v52 count:16];
      }

      while (v25);
    }

    id v7 = v36;
  }
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_108(uint64_t a1)
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2;
  v6[3] = &unk_18A02A938;
  int8x16_t v2 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 remoteObjectProxyWithErrorHandler:v6];
  int8x16_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 connectProtocolFromServerSendClientMessage:*(void *)(a1 + 48)];
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) logger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int8x16_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_cold_1(a1, v3, v5);
  }

  [*(id *)(a1 + 48) invalidate];
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_109(int8x16_t *a1)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110;
  v4[3] = &unk_18A02A870;
  int8x16_t v2 = a1[2];
  int8x16_t v5 = vextq_s8(v2, v2, 8uLL);
  [(id)v2.i64[0] remoteObjectProxyWithErrorHandler:v4];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 connectProtocolFromServerSendClientMessage:a1[3].i64[0]];
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) logger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int8x16_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110_cold_1(a1, v3);
  }

  [*(id *)(a1 + 40) invalidate];
}

- (id)_getAllObserverConnections
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreConnectServer logger](self, "logger");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int8x16_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConnectServer observerConnections](self, "observerConnections");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 134217984;
    uint64_t v9 = [v6 count];
    _os_log_impl( &dword_18733E000,  v5,  OS_LOG_TYPE_DEFAULT,  "[GetAllObserverConnections] Returning %lu observable connections",  (uint8_t *)&v8,  0xCu);
  }

  -[SUCoreConnectServer observerConnections](self, "observerConnections");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setConnection:(id)a3 forClientID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreConnectServer logger](self, "logger");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v34 = 138543618;
    *(void *)&v34[4] = v7;
    __int16 v35 = 2114;
    id v36 = v6;
    _os_log_impl( &dword_18733E000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SetConnection] Attempting to set new clientID: %{public}@, for connection: %{public}@",  v34,  0x16u);
  }

  if (v6)
  {
    if ([v7 isEqualToString:@"*"])
    {
      -[SUCoreConnectServer logger](self, "logger");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 oslog];
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v34 = 138543362;
        *(void *)&v34[4] = v6;
        _os_log_impl( &dword_18733E000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SetConnection] Adding new observable connection: %{public}@",  v34,  0xCu);
      }

      *(void *)id v34 = 0LL;
      objc_initWeak((id *)v34, v6);
      -[SUCoreConnectServer observerConnections](self, "observerConnections");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      id WeakRetained = objc_loadWeakRetained((id *)v34);
      [v13 addObject:WeakRetained];

      objc_destroyWeak((id *)v34);
    }

    else
    {
      -[SUCoreConnectServer connections](self, "connections");
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 safeObjectForKey:v7 ofClass:objc_opt_class()];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreConnectServer logger](self, "logger");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          uint64_t v22 = [v18 count];
          *(_DWORD *)id v34 = 134218242;
          *(void *)&v34[4] = v22;
          __int16 v35 = 2114;
          id v36 = v7;
          _os_log_impl( &dword_18733E000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SetConnection] Found %lu existing connections for clientID: %{public}@",  v34,  0x16u);
        }

        int v23 = [v18 containsObject:v6];
        -[SUCoreConnectServer logger](self, "logger");
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 oslog];
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v26)
          {
            *(_DWORD *)id v34 = 138543362;
            *(void *)&v34[4] = v7;
            _os_log_impl( &dword_18733E000,  v25,  OS_LOG_TYPE_DEFAULT,  "[SetConnection] Same connection already exists for clientID: %{public}@",  v34,  0xCu);
          }
        }

        else
        {
          if (v26)
          {
            *(_DWORD *)id v34 = 138543618;
            *(void *)&v34[4] = v7;
            __int16 v35 = 2114;
            id v36 = v6;
            _os_log_impl( &dword_18733E000,  v25,  OS_LOG_TYPE_DEFAULT,  "[SetConnection] Setting new connection (to existing set) for clientID: %{public}@, newConnection: %{public}@",  v34,  0x16u);
          }

          *(void *)id v34 = 0LL;
          objc_initWeak((id *)v34, v6);
          v31 = -[SUCoreConnectServer connections](self, "connections");
          id v32 = objc_loadWeakRetained((id *)v34);
          [v18 setByAddingObject:v32];
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 setSafeObject:v33 forKey:v7];

          objc_destroyWeak((id *)v34);
        }
      }

      else
      {
        if (v21)
        {
          *(_DWORD *)id v34 = 138543618;
          *(void *)&v34[4] = v7;
          __int16 v35 = 2114;
          id v36 = v6;
          _os_log_impl( &dword_18733E000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SetConnection] Setting new connection (to new set) for clientID: %{public}@, newConnection: %{public}@",  v34,  0x16u);
        }

        *(void *)id v34 = 0LL;
        objc_initWeak((id *)v34, v6);
        -[SUCoreConnectServer connections](self, "connections");
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v28 = (void *)MEMORY[0x189604010];
        id v29 = objc_loadWeakRetained((id *)v34);
        [v28 setWithObject:v29];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 setSafeObject:v30 forKey:v7];

        objc_destroyWeak((id *)v34);
      }
    }
  }

  else
  {
    -[SUCoreConnectServer logger](self, "logger");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer _setConnection:forClientID:].cold.1();
    }
  }
}

- (void)_removeConnection:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  int8x16_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreConnectServer logger](self, "logger");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConnectServer connections](self, "connections");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 134218242;
    uint64_t v34 = [v8 count];
    __int16 v35 = 2114;
    id v36 = v4;
    _os_log_impl( &dword_18733E000,  v7,  OS_LOG_TYPE_DEFAULT,  "[RemoveConnection] From %lu clientIDs currently connected, attempting to remove connection: %{public}@",  buf,  0x16u);
  }

  if (v4)
  {
    -[SUCoreConnectServer observerConnections](self, "observerConnections");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v9 containsObject:v4];

    if (v10)
    {
      -[SUCoreConnectServer logger](self, "logger");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 oslog];
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v34 = (uint64_t)v4;
        _os_log_impl( &dword_18733E000,  v12,  OS_LOG_TYPE_DEFAULT,  "[RemoveConnection] Removing observable connection: %{public}@",  buf,  0xCu);
      }

      -[SUCoreConnectServer observerConnections](self, "observerConnections");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 removeObject:v4];

      LOBYTE(v10) = 1;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  -[SUCoreConnectServer _clientIDForConnection:](self, "_clientIDForConnection:", v4);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SUCoreConnectServer logger](self, "logger");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v34 = (uint64_t)v14;
      __int16 v35 = 2114;
      id v36 = v4;
      _os_log_impl( &dword_18733E000,  v16,  OS_LOG_TYPE_DEFAULT,  "[RemoveConnection] Removing connection for clientID: %{public}@, connection: %{public}@",  buf,  0x16u);
    }

    -[SUCoreConnectServer connections](self, "connections");
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 safeObjectForKey:v14 ofClass:objc_opt_class()];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (void *)[v18 mutableCopy];

    uint64_t v20 = [v19 count];
    -[SUCoreConnectServer logger](self, "logger");
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v23)
      {
        uint64_t v24 = [v19 count];
        *(_DWORD *)__int128 buf = 134218498;
        uint64_t v34 = v24;
        __int16 v35 = 2114;
        id v36 = v14;
        __int16 v37 = 2114;
        id v38 = v19;
        _os_log_impl( &dword_18733E000,  v22,  OS_LOG_TYPE_DEFAULT,  "[RemoveConnection] Set remaining %lu connections for clientID: %{public}@, connections: %{public}@",  buf,  0x20u);
      }

      -[SUCoreConnectServer connections](self, "connections");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setSafeObject:v19 forKey:v14];
    }

    else
    {
      if (v23)
      {
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v34 = (uint64_t)v14;
        _os_log_impl( &dword_18733E000,  v22,  OS_LOG_TYPE_DEFAULT,  "[RemoveConnection] No remaining connections for clientID: %{public}@",  buf,  0xCu);
      }

      -[SUCoreConnectServer connections](self, "connections");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 removeObjectForKey:v14];
    }
  }

  else
  {
    if ((v10 & 1) != 0) {
      goto LABEL_26;
    }
    -[SUCoreConnectServer logger](self, "logger");
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 oslog];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v34 = (uint64_t)v4;
      _os_log_impl( &dword_18733E000,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "[RemoveConnection] Unable to locate the clientID for connection: %{public}@",  buf,  0xCu);
    }
  }

LABEL_26:
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 serverDelegate];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  char v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    -[SUCoreConnectServer connectionSendMessageQueue](self, "connectionSendMessageQueue");
    uint64_t v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __41__SUCoreConnectServer__removeConnection___block_invoke;
    v31[3] = &unk_18A02A800;
    v31[4] = self;
    id v32 = v14;
    dispatch_async(v30, v31);
  }
}

void __41__SUCoreConnectServer__removeConnection___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) logger];
  int8x16_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl( &dword_18733E000,  v3,  OS_LOG_TYPE_DEFAULT,  "[RemoveConnection] Informing server of connection disconnect for clientID: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  [*(id *)(a1 + 32) connectionPolicy];
  int8x16_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 serverDelegate];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 connectionClosedForClientID:*(void *)(a1 + 40)];
}

- (id)_connectionsForClientID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  int8x16_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreConnectServer connections](self, "connections");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 safeObjectForKey:v4 ofClass:objc_opt_class()];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreConnectServer logger](self, "logger");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreConnectServer connections](self, "connections");
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 134218754;
      uint64_t v13 = [v10 count];
      __int16 v14 = 2048;
      uint64_t v15 = [v7 count];
      __int16 v16 = 2114;
      id v17 = v4;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl( &dword_18733E000,  v9,  OS_LOG_TYPE_DEFAULT,  "[ConnectionForClientID] From %lu clientIDs, %lu connections located for clientID: %{public}@, connections: %{public}@",  (uint8_t *)&v12,  0x2Au);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SUCoreConnectServer _connectionsForClientID:].cold.1(self);
  }

  return v7;
}

- (id)_clientIDForConnection:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreConnectServer connectionsAccessQueue](self, "connectionsAccessQueue");
  int8x16_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  BOOL v26 = self;
  -[SUCoreConnectServer connections](self, "connections");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v32;
    id obj = v6;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        -[SUCoreConnectServer connections](v26, "connections", obj);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 safeObjectForKey:v12 ofClass:objc_opt_class()];
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0LL; j != v17; ++j)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              if ([v4 isEqual:*(void *)(*((void *)&v27 + 1) + 8 * j)])
              {
                id v20 = v12;

                uint64_t v9 = v20;
                goto LABEL_16;
              }
            }

            uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

- (NSString)description
{
  int8x16_t v2 = (void *)NSString;
  -[SUCoreConnectServer connectionPolicy](self, "connectionPolicy");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"SUCoreConnectServer(connectionPolicy:%@)", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SUCoreConnectServerPolicy)connectionPolicy
{
  return self->_connectionPolicy;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)connectionsAccessQueue
{
  return self->_connectionsAccessQueue;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (NSMutableSet)observerConnections
{
  return self->_observerConnections;
}

- (OS_dispatch_queue)connectionSendMessageQueue
{
  return self->_connectionSendMessageQueue;
}

- (void).cxx_destruct
{
}

- (void)isConnectionEntitled:.cold.1()
{
}

- (void)isConnectionEntitled:.cold.2()
{
    "always required for new connection",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_2()
{
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_1()
{
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_2()
{
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_84_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_2( &dword_18733E000,  a3,  (uint64_t)a3,  "[ListenerNewConnection](%{public}@) ErrorHandler: Failed to receive clientID when requested for new connection, error: %{public}@",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_2( &dword_18733E000,  v1,  (uint64_t)v1,  "[SendServerMessage](%{public}@) Observer clients cannot send messages to server, error: %{public}@",  v2);
  OUTLINED_FUNCTION_6();
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.2()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0( &dword_18733E000,  v3,  v4,  "[SendServerMessage](%{public}@) Calling completion block with error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_1();
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.3()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0( &dword_18733E000,  v3,  v4,  "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage was not provided a reply block, error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_1();
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_cold_1(id *a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [*a1 clientID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl( &dword_18733E000,  a2,  OS_LOG_TYPE_ERROR,  "[SendClientMessage] Unable to send message, no connection could be located for clientID: %{public}@",  v4,  0xCu);
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_cold_1( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 40) clientID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 48);
  [a2 checkedDescription];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  __int16 v14 = v8;
  _os_log_error_impl( &dword_18733E000,  a3,  OS_LOG_TYPE_ERROR,  "[SendClientMessage] ErrorHandler: Connection failed (no completion was expected to be called) for client with client ID: %{public}@ %{public}@ with error %{public}@",  (uint8_t *)&v9,  0x20u);
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_110_cold_1( uint64_t a1,  void *a2)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0( &dword_18733E000,  v2,  v3,  "[SendClientMessage] ErrorHandler: Connection failed (no completion was expected to be called) for observer client co nnection %{public}@ with error %{public}@",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_1();
}

- (void)_setConnection:forClientID:.cold.1()
{
}

- (void)_connectionsForClientID:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 count];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0( &dword_18733E000,  v2,  v3,  "[ConnectionForClientID] From %lu current clientIDs, no connection was located for clientID: %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_clientIDForConnection:.cold.1()
{
}

@end