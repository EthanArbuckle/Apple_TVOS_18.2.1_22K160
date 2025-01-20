@interface LAClient
+ (id)_queue;
+ (id)createConnection:(const unsigned int *)a3 legacyService:(BOOL)a4;
+ (void)_performInvalidationBlocks:(id)a3;
- (BOOL)_setPermanentError:(id)a3;
- (BOOL)setServerPropertyForOption:(int64_t)a3 value:(id)a4 error:(id *)a5;
- (BOOL)shouldRecoverConnection;
- (BOOL)willRetryOnInterruptedConnection;
- (LACachedExternalizedContext)cachedExternalizedContext;
- (LAClient)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4 context:(id)a5;
- (LAClient)initWithUUID:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 context:(id)a6;
- (LAContext)context;
- (LAContextXPC)remoteContext;
- (LAContextXPC)synchronousRemoteContext;
- (LAUIDelegate)uiDelegate;
- (NSData)existingContext;
- (NSData)externalizedContext;
- (NSError)permanentError;
- (NSMutableArray)invalidations;
- (NSNumber)userSession;
- (NSString)proxyId;
- (NSUUID)uuid;
- (NSXPCConnection)serverConnection;
- (id)_updateOptions:(id)a3;
- (id)serverPropertyForOption:(int64_t)a3 error:(id *)a4;
- (id)synchronousExternalizedContextWithError:(id *)a3;
- (void)_checkIdResultForTCC:(id)a3 synchronous:(BOOL)a4 error:(id)a5 retryBlock:(id)a6 finally:(id)a7;
- (void)_connectToServerWithRecovery:(BOOL)a3 userSession:(const unsigned int *)a4 legacyService:(BOOL)a5;
- (void)_handleConnectionResult:(id)a3 uuid:(id)a4 proxyId:(id)a5 error:(id)a6;
- (void)_invalidateCachedExternalizedContextWithError:(id)a3;
- (void)_performCallBool:(id)a3 finally:(id)a4;
- (void)_performCallId:(id)a3 finally:(id)a4;
- (void)_performSynchronous:(BOOL)a3 callBool:(id)a4 finally:(id)a5;
- (void)_performSynchronous:(BOOL)a3 callId:(id)a4 finally:(id)a5;
- (void)_recoverConnectionIfNeeded;
- (void)_scheduleRecovery;
- (void)_serializedInvalidateWithMessage:(id)a3;
- (void)_synchronousRemoteObjectProxy:(const unsigned int *)a3 performCall:(id)a4;
- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5;
- (void)authMethodWithReply:(id)a3;
- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4;
- (void)credentialOfType:(int64_t)a3 reply:(id)a4;
- (void)dealloc;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 reply:(id)a6;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 synchronous:(BOOL)a7 reply:(id)a8;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 synchronous:(BOOL)a6 reply:(id)a7;
- (void)externalizedContext;
- (void)externalizedContextWithReply:(id)a3;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4;
- (void)getDomainStateWithOptions:(id)a3 synchronous:(BOOL)a4 reply:(id)a5;
- (void)invalidateWithMessage:(id)a3;
- (void)invalidateWithReply:(id)a3;
- (void)invalidatedWithError:(id)a3;
- (void)isCredentialSet:(int64_t)a3 reply:(id)a4;
- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)prearmTouchIdWithReply:(id)a3;
- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)resetWithReply:(id)a3;
- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4;
- (void)setCachedExternalizedContext:(id)a3;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5;
- (void)setExistingContext:(id)a3;
- (void)setPermanentError:(id)a3;
- (void)setProxyId:(id)a3;
- (void)setRemoteContext:(id)a3;
- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setShouldRecoverConnection:(BOOL)a3;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5;
- (void)setUiDelegate:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWillRetryOnInterruptedConnection:(BOOL)a3;
- (void)tokenForTransferToUnknownProcess:(id)a3;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation LAClient

- (LAClient)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___LAClient;
  v11 = -[LAClient init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_existingContext, a3);
    objc_storeWeak((id *)&v12->_context, v10);
    id v13 = objc_alloc(MEMORY[0x189608790]);
    if (v9) {
      uint64_t v14 = [v13 initWithExternalizedContext:v9];
    }
    else {
      uint64_t v14 = [v13 initWithExternalizationDelegate:v12];
    }
    cachedExternalizedContext = v12->_cachedExternalizedContext;
    v12->_cachedExternalizedContext = (LACachedExternalizedContext *)v14;

    uint64_t v16 = objc_opt_new();
    invalidations = v12->_invalidations;
    v12->_invalidations = (NSMutableArray *)v16;

    if (a4)
    {
      uint64_t v18 = [MEMORY[0x189607968] numberWithUnsignedInt:*a4];
      userSession = v12->_userSession;
      v12->_userSession = (NSNumber *)v18;
    }

    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke;
    v21[3] = &unk_189F99138;
    id v22 = v9;
    v23 = v12;
    -[LAClient _synchronousRemoteObjectProxy:performCall:](v23, "_synchronousRemoteObjectProxy:performCall:", a4, v21);
  }

  return v12;
}

void __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  [v4 context];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 instanceId];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke_2;
  v8[3] = &unk_189F99110;
  id v9 = *(id *)(a1 + 40);
  [v5 connectToExistingContext:v3 callback:v4 clientId:v7 reply:v8];
}

uint64_t __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:a2 uuid:a3 proxyId:a4 error:a5];
}

- (LAClient)initWithUUID:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___LAClient;
  v15 = -[LAClient init](&v26, sel_init);
  if (v15)
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x189608790]) initWithExternalizationDelegate:v15];
    cachedExternalizedContext = v15->_cachedExternalizedContext;
    v15->_cachedExternalizedContext = (LACachedExternalizedContext *)v16;

    uint64_t v18 = objc_opt_new();
    invalidations = v15->_invalidations;
    v15->_invalidations = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeWeak((id *)&v15->_context, v14);
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke;
    v21[3] = &unk_189F99188;
    id v22 = v11;
    v23 = v15;
    id v24 = v12;
    id v25 = v13;
    -[LAClient _synchronousRemoteObjectProxy:performCall:](v23, "_synchronousRemoteObjectProxy:performCall:", 0LL, v21);
  }

  return v15;
}

void __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  [v4 context];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 instanceId];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke_2;
  v10[3] = &unk_189F99160;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  [v5 connectToContextWithUUID:v3 callback:v4 clientId:v7 token:v9 senderAuditTokenData:v8 reply:v10];
}

uint64_t __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:a2 uuid:*(void *)(a1 + 40) proxyId:a3 error:a4];
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAClient invalidations](self, "invalidations");
  +[LAClient _queue](&OBJC_CLASS___LAClient, "_queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __19__LAClient_dealloc__block_invoke;
  block[3] = &unk_189F991B0;
  id v10 = v3;
  id v11 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LAClient;
  -[LAClient dealloc](&v8, sel_dealloc);
}

uint64_t __19__LAClient_dealloc__block_invoke(uint64_t a1)
{
  return +[LAClient _performInvalidationBlocks:]( &OBJC_CLASS___LAClient,  "_performInvalidationBlocks:",  *(void *)(a1 + 40));
}

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_1);
  }
  return (id)_queue_queue;
}

void __18__LAClient__queue__block_invoke()
{
  v0 = (void *)MEMORY[0x189610780];
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1895F8AF8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 createDefaultQueueWithIdentifier:@"la_client" concurrencyAttribute:v3];
  v2 = (void *)_queue_queue;
  _queue_queue = v1;
}

+ (id)createConnection:(const unsigned int *)a3 legacyService:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = @"com.apple.CoreAuthentication.daemon";
  if (v4) {
    id v7 = @"com.apple.CoreAuthentication.daemon.libxpc";
  }
  objc_super v8 = v7;
  else {
    uint64_t v9 = 4096LL;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:v8 options:v9];
  if (xpc_user_sessions_enabled())
  {
    *(_DWORD *)v17 = 0;
    uint64_t foreground_uid = xpc_user_sessions_get_foreground_uid();
    objc_msgSend(v10, "_xpcConnection", *(void *)v17);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_user_session_uid();

    id v13 = v6;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[LAClient createConnection:legacyService:].cold.1(foreground_uid, v13);
    }
  }

  id v14 = v6;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (a3)
    {
      [MEMORY[0x189607968] numberWithUnsignedInt:*a3];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v15 = 0LL;
    }

    *(_DWORD *)v17 = 138543874;
    *(void *)&v17[4] = v8;
    __int16 v18 = 1024;
    int v19 = v9;
    __int16 v20 = 2114;
    v21 = v15;
    _os_log_impl( &dword_186EAF000,  v14,  OS_LOG_TYPE_INFO,  "Connecting to %{public}@, flags:%x, uid:%{public}@",  v17,  0x1Cu);
    if (a3) {
  }
    }

  return v10;
}

- (void)_connectToServerWithRecovery:(BOOL)a3 userSession:(const unsigned int *)a4 legacyService:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAClient createConnection:legacyService:](&OBJC_CLASS___LAClient, "createConnection:legacyService:", a4, v5);
  id v10 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
  serverConnection = self->_serverConnection;
  self->_serverConnection = v10;

  [MEMORY[0x1896087A0] interfaceWithInternalProtocol:&unk_18C6B4100];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAClient serverConnection](self, "serverConnection");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setRemoteObjectInterface:v12];

  -[LAClient serverConnection](self, "serverConnection");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[LAClient _queue](&OBJC_CLASS___LAClient, "_queue");
  [v14 _setQueue:v15];

  if (a4 && *a4)
  {
    -[NSXPCConnection _setTargetUserIdentifier:](self->_serverConnection, "_setTargetUserIdentifier:");
    uint64_t v16 = v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = -[LAClient context](self, "context");
      unsigned int v18 = *a4;
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      __int16 v29 = 1024;
      unsigned int v30 = v18;
      _os_log_impl(&dword_186EAF000, v16, OS_LOG_TYPE_INFO, "%{public}@ target uid: %u", buf, 0x12u);
    }
  }

  objc_initWeak((id *)buf, self);
  uint64_t v22 = MEMORY[0x1895F87A8];
  id v19 = v9;
  id v23 = v19;
  objc_copyWeak(&v25, (id *)buf);
  BOOL v26 = a3;
  id v24 = self;
  -[LAClient serverConnection]( self,  "serverConnection",  v22,  3221225472LL,  __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke,  &unk_189F99220);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setInterruptionHandler:&v22];
  v21 = -[LAClient serverConnection](self, "serverConnection");
  [v21 resume];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained context];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = *(unsigned __int8 *)(a1 + 56);
    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    id v12 = v5;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = [v7 willRetryOnInterruptedConnection];
    _os_log_impl( &dword_186EAF000,  v3,  OS_LOG_TYPE_INFO,  "%{public}@ connection to server interrupted (recovery: %d, willRetry: %d)",  buf,  0x18u);
  }

  if (*(_BYTE *)(a1 + 56))
  {
    if (([*(id *)(a1 + 40) willRetryOnInterruptedConnection] & 1) == 0)
    {
      +[LAClient _queue](&OBJC_CLASS___LAClient, "_queue");
      objc_super v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke_90;
      block[3] = &unk_189F991F8;
      objc_copyWeak(&v10, (id *)(a1 + 48));
      dispatch_async(v8, block);

      objc_destroyWeak(&v10);
    }
  }

void __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke_90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleRecovery];
}

- (void)_synchronousRemoteObjectProxy:(const unsigned int *)a3 performCall:(id)a4
{
  int v6 = (void (**)(id, void *))a4;
  -[LAClient setWillRetryOnInterruptedConnection:](self, "setWillRetryOnInterruptedConnection:", 1LL);
  -[LAClient _connectToServerWithRecovery:userSession:legacyService:]( self,  "_connectToServerWithRecovery:userSession:legacyService:",  1LL,  a3,  0LL);
  -[LAClient serverConnection](self, "serverConnection");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = MEMORY[0x1895F87A8];
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke;
  v29[3] = &unk_189F99248;
  v29[4] = self;
  [v7 synchronousRemoteObjectProxyWithErrorHandler:v29];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9);
  -[NSError domain](self->_permanentError, "domain");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = *MEMORY[0x189607460];
  if ([v10 isEqualToString:*MEMORY[0x189607460]])
  {
    NSInteger v12 = -[NSError code](self->_permanentError, "code");

    if (v12 == 4097)
    {
      LALogForCategory();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[LAClient _synchronousRemoteObjectProxy:performCall:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      }

      -[LAClient _connectToServerWithRecovery:userSession:legacyService:]( self,  "_connectToServerWithRecovery:userSession:legacyService:",  1LL,  a3,  0LL);
      v21 = -[LAClient serverConnection](self, "serverConnection");
      v28[0] = v8;
      v28[1] = 3221225472LL;
      v28[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_92;
      v28[3] = &unk_189F99248;
      v28[4] = self;
      [v21 synchronousRemoteObjectProxyWithErrorHandler:v28];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

      v6[2](v6, v22);
    }
  }

  else
  {
  }

  -[LAClient setWillRetryOnInterruptedConnection:](self, "setWillRetryOnInterruptedConnection:", 0LL);
  -[NSError domain](self->_permanentError, "domain");
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v23 isEqualToString:v11])
  {
    NSInteger v24 = -[NSError code](self->_permanentError, "code");

    if (v24 == 4099)
    {
      -[LAClient _connectToServerWithRecovery:userSession:legacyService:]( self,  "_connectToServerWithRecovery:userSession:legacyService:",  1LL,  a3,  1LL);
      -[LAClient serverConnection](self, "serverConnection");
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v8;
      v27[1] = 3221225472LL;
      v27[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_2;
      v27[3] = &unk_189F99248;
      v27[4] = self;
      uint64_t v26 = [v25 synchronousRemoteObjectProxyWithErrorHandler:v27];

      v6[2](v6, (void *)v26);
      uint64_t v9 = (void *)v26;
    }
  }

  else
  {
  }
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:0 uuid:0 proxyId:0 error:a2];
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_92(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:0 uuid:0 proxyId:0 error:a2];
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:0 uuid:0 proxyId:0 error:a2];
}

- (void)_handleConnectionResult:(id)a3 uuid:(id)a4 proxyId:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    LALogForCategory();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[LAClient _handleConnectionResult:uuid:proxyId:error:].cold.1(self);
    }

    -[LAClient _invalidateCachedExternalizedContextWithError:]( self,  "_invalidateCachedExternalizedContextWithError:",  v13);
  }

  -[LAClient setRemoteContext:](self, "setRemoteContext:", v10);
  -[LAClient setUuid:](self, "setUuid:", v11);
  -[LAClient setProxyId:](self, "setProxyId:", v12);
  -[LAClient setPermanentError:](self, "setPermanentError:", v13);
}

- (void)_invalidateCachedExternalizedContextWithError:(id)a3
{
  id v7 = a3;
  [v7 domain];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    BOOL v5 = 0LL;
  }

  -[LAClient cachedExternalizedContext](self, "cachedExternalizedContext");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 invalidateBecauseOfInvalidConnection:v5];
}

- (void)setRemoteContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_remoteContext, a3);
  if (v5)
  {
    -[LAClient remoteContext](self, "remoteContext");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __29__LAClient_setRemoteContext___block_invoke;
    v10[3] = &unk_189F99248;
    void v10[4] = self;
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];
    id v7 = (LAContextXPC *)objc_claimAutoreleasedReturnValue();
    synchronousRemoteContext = self->_synchronousRemoteContext;
    self->_synchronousRemoteContext = v7;
  }

  else
  {
    uint64_t v9 = self->_synchronousRemoteContext;
    self->_synchronousRemoteContext = 0LL;
  }
}

void __29__LAClient_setRemoteContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LALogForCategory();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __29__LAClient_setRemoteContext___block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 32) _scheduleRecovery];
}

- (void)_scheduleRecovery
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = -[LAClient _setPermanentError:](self, "_setPermanentError:", v3);

  if (v4) {
    -[LAClient setShouldRecoverConnection:](self, "setShouldRecoverConnection:", 1LL);
  }
}

- (void)_recoverConnectionIfNeeded
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (-[LAClient shouldRecoverConnection](self, "shouldRecoverConnection"))
  {
    -[LAClient setShouldRecoverConnection:](self, "setShouldRecoverConnection:", 0LL);
    LALogForCategory();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[LAClient context](self, "context");
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v11 = v4;
      _os_log_impl( &dword_186EAF000,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is recovering connection to server",  buf,  0xCu);
    }

    -[LAClient userSession](self, "userSession");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 unsignedIntValue];

    *(_DWORD *)buf = v6;
    -[LAClient userSession](self, "userSession");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      uint64_t v8 = buf;
    }
    else {
      uint64_t v8 = 0LL;
    }
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __38__LAClient__recoverConnectionIfNeeded__block_invoke;
    v9[3] = &unk_189F99270;
    v9[4] = self;
    -[LAClient _synchronousRemoteObjectProxy:performCall:](self, "_synchronousRemoteObjectProxy:performCall:", v8, v9);
  }

void __38__LAClient__recoverConnectionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 existingContext];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = *(void **)(a1 + 32);
  [v6 context];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v7 instanceId];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __38__LAClient__recoverConnectionIfNeeded__block_invoke_2;
  v9[3] = &unk_189F99110;
  v9[4] = *(void *)(a1 + 32);
  [v4 connectToExistingContext:v5 callback:v6 clientId:v8 reply:v9];
}

uint64_t __38__LAClient__recoverConnectionIfNeeded__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleConnectionResult:a2 uuid:a3 proxyId:a4 error:a5];
}

- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __64__LAClient_allowTransferToProcess_receiverAuditTokenData_reply___block_invoke;
  v10[3] = &unk_189F99298;
  int v12 = a3;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, a5);
}

void __64__LAClient_allowTransferToProcess_receiverAuditTokenData_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 allowTransferToProcess:*(unsigned int *)(a1 + 48) receiverAuditTokenData:*(void *)(a1 + 40) reply:v4];
}

- (void)tokenForTransferToUnknownProcess:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __45__LAClient_tokenForTransferToUnknownProcess___block_invoke;
  v3[3] = &unk_189F992C0;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __45__LAClient_tokenForTransferToUnknownProcess___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 synchronousRemoteContext];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 tokenForTransferToUnknownProcess:v3];
}

- (void)invalidatedWithError:(id)a3
{
  id v4 = a3;
  LALogForCategory();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[LAClient invalidatedWithError:].cold.1(self);
  }

  +[LAClient _queue](&OBJC_CLASS___LAClient, "_queue");
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __33__LAClient_invalidatedWithError___block_invoke;
  v8[3] = &unk_189F991B0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __33__LAClient_invalidatedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPermanentError:*(void *)(a1 + 40)];
}

- (void)invalidateWithMessage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  +[LAClient _queue](&OBJC_CLASS___LAClient, "_queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__LAClient_invalidateWithMessage___block_invoke;
  block[3] = &unk_189F992E8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __34__LAClient_invalidateWithMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _serializedInvalidateWithMessage:*(void *)(a1 + 32)];
}

- (void)_serializedInvalidateWithMessage:(id)a3
{
  serverConnection = self->_serverConnection;
  id v5 = a3;
  -[NSXPCConnection invalidate](serverConnection, "invalidate");
  id v6 = self->_serverConnection;
  self->_serverConnection = 0LL;

  [MEMORY[0x189608798] errorWithCode:-9 message:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[LAClient _setPermanentError:](self, "_setPermanentError:", v7);
  [MEMORY[0x189608798] errorWithCode:-10 message:@"Invalid context."];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[LAClient setPermanentError:](self, "setPermanentError:", v8);
}

- (void)invalidateWithReply:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__LAClient_invalidateWithReply___block_invoke;
  v3[3] = &unk_189F99310;
  v3[4] = self;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v3, a3);
}

uint64_t __32__LAClient_invalidateWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 invalidateWithReply:v4];

  return [*(id *)(a1 + 32) _serializedInvalidateWithMessage:@"invalidate called"];
}

+ (void)_performInvalidationBlocks:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invoke];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  [v3 removeAllObjects];
}

- (void)_checkIdResultForTCC:(id)a3 synchronous:(BOOL)a4 error:(id)a5 retryBlock:(id)a6 finally:(id)a7
{
}

- (void)_performCallId:(id)a3 finally:(id)a4
{
}

- (void)_performCallBool:(id)a3 finally:(id)a4
{
}

- (void)_performSynchronous:(BOOL)a3 callId:(id)a4 finally:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = __47__LAClient__performSynchronous_callId_finally___block_invoke;
  uint64_t v18 = &unk_189F993B0;
  uint64_t v19 = self;
  id v10 = v9;
  id v20 = v10;
  id v11 = v8;
  id v21 = v11;
  BOOL v22 = v6;
  int v12 = (void *)MEMORY[0x18959CD0C](&v15);
  +[LAClient _queue](&OBJC_CLASS___LAClient, "_queue", v15, v16, v17, v18, v19);
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v6) {
    dispatch_sync(v13, v12);
  }
  else {
    dispatch_async(v13, v12);
  }
}

void __47__LAClient__performSynchronous_callId_finally___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) _recoverConnectionIfNeeded];
  objc_sync_exit(v2);

  [*(id *)(a1 + 32) permanentError];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) permanentError];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0LL, v13);
  }

  else
  {
    v22[0] = 0LL;
    v22[1] = v22;
    v22[2] = 0x2020000000LL;
    char v23 = 0;
    uint64_t v5 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_2;
    v19[3] = &unk_189F99338;
    id v21 = v22;
    id v6 = *(id *)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    id v20 = v6;
    uint64_t v7 = (void *)MEMORY[0x18959CD0C](v19);
    id v8 = -[Invalidation initWithBlock:](objc_alloc(&OBJC_CLASS___Invalidation), "initWithBlock:", v7);
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(a1 + 32) invalidations];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v8];

    objc_sync_exit(v9);
    uint64_t v11 = *(void *)(a1 + 48);
    v14[0] = v5;
    v14[1] = 3221225472LL;
    v14[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_3;
    v14[3] = &unk_189F99388;
    v14[4] = *(void *)(a1 + 32);
    int v12 = v8;
    uint64_t v15 = v12;
    uint64_t v17 = v22;
    char v18 = *(_BYTE *)(a1 + 56);
    id v16 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

    _Block_object_dispose(v22, 8);
  }

void __47__LAClient__performSynchronous_callId_finally___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    uint64_t v2 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) permanentError];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0LL, v3);
  }

void __47__LAClient__performSynchronous_callId_finally___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  [*(id *)(a1 + 32) invalidations];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 removeObject:*(void *)(a1 + 40)];

  objc_sync_exit(v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
  if (!*(_BYTE *)(v9 + 24))
  {
    *(_BYTE *)(v9 + 24) = 1;
    if (*(_BYTE *)(a1 + 64))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    else
    {
      dispatch_get_global_queue(0LL, 0LL);
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_4;
      block[3] = &unk_189F99360;
      id v14 = *(id *)(a1 + 48);
      id v12 = v5;
      id v13 = v6;
      dispatch_async(v10, block);
    }
  }
}

uint64_t __47__LAClient__performSynchronous_callId_finally___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_performSynchronous:(BOOL)a3 callBool:(id)a4 finally:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v12 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke;
  v13[3] = &unk_189F99400;
  id v14 = v8;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke_3;
  v11[3] = &unk_189F99428;
  id v9 = v12;
  id v10 = v8;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v6, v13, v11);
}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke_2;
  v7[3] = &unk_189F993D8;
  id v8 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x189607968];
  id v6 = a3;
  [v5 numberWithBool:a2];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

- (BOOL)_setPermanentError:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x189608798] error:v4 hasCode:-9] & 1) == 0)
  {
    LALogForCategory();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[LAClient _setPermanentError:].cold.1(self);
    }
  }

  -[LAClient permanentError](self, "permanentError");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[LAClient cachedExternalizedContext](self, "cachedExternalizedContext");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 cachedExternalizedContext];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAClient setExistingContext:](self, "setExistingContext:", v8);

    -[LAClient _invalidateCachedExternalizedContextWithError:]( self,  "_invalidateCachedExternalizedContextWithError:",  v4);
    -[LAClient setRemoteContext:](self, "setRemoteContext:", 0LL);
    -[LAClient setPermanentError:](self, "setPermanentError:", v4);
    id v9 = self;
    objc_sync_enter(v9);
    -[LAClient invalidations](v9, "invalidations");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAClient _performInvalidationBlocks:](&OBJC_CLASS___LAClient, "_performInvalidationBlocks:", v10);

    objc_sync_exit(v9);
  }

  return v6 == 0LL;
}

- (id)_updateOptions:(id)a3
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:&unk_189FA0FB0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v3;
  if (v4)
  {
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v3];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078F8] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v6 forKey:&unk_189FA0FB0];
  }

  return v5;
}

- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4
{
}

- (void)getDomainStateWithOptions:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke;
  v10[3] = &unk_189F99450;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v6, v10, a5);
}

void __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) synchronousRemoteContext];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke_2;
  v7[3] = &unk_189F98F88;
  id v8 = v3;
  id v6 = v3;
  [v4 getDomainStateWithOptions:v5 reply:v7];
}

uint64_t __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  -[LAClient uiDelegate](self, "uiDelegate");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[LAClient evaluatePolicy:options:uiDelegate:reply:]( self,  "evaluatePolicy:options:uiDelegate:reply:",  a3,  v9,  v10,  v8);
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6
{
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 synchronous:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  -[LAClient _updateOptions:](self, "_updateOptions:", a4);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)MEMORY[0x189608798];
  [MEMORY[0x1896087A8] checkOptions:v14];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 raiseExceptionOnError:v16];

  uint64_t v17 = (void *)MEMORY[0x189608798];
  [MEMORY[0x1896087A8] checkPolicy:a3];
  char v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 raiseExceptionOnError:v18];

  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke;
  v21[3] = &unk_189F994C8;
  void v21[4] = self;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a3;
  BOOL v25 = v8;
  id v19 = v12;
  id v20 = v14;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v8, v21, v13);
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) synchronousRemoteContext];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_2;
  v9[3] = &unk_189F994A0;
  char v14 = *(_BYTE *)(a1 + 64);
  id v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  uint64_t v13 = v5;
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v8 = v3;
  [v4 evaluatePolicy:v5 options:v10 uiDelegate:v6 reply:v9];
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v9[0] = MEMORY[0x1895F87A8];
  v9[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_3;
  v9[3] = &unk_189F99478;
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  uint64_t v13 = v6;
  uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
  v9[1] = 3221225472LL;
  id v11 = v7;
  id v12 = *(id *)(a1 + 48);
  [v10 _checkIdResultForTCC:a2 synchronous:v8 error:a3 retryBlock:v9 finally:*(void *)(a1 + 56)];
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_3( void *a1,  void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 evaluatePolicy:a1[7] options:a1[5] uiDelegate:a1[6] reply:v4];
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[LAClient uiDelegate](self, "uiDelegate");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  -[LAClient evaluateACL:operation:options:uiDelegate:reply:]( self,  "evaluateACL:operation:options:uiDelegate:reply:",  v13,  v12,  v11,  v14,  v10);
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 synchronous:(BOOL)a7 reply:(id)a8
{
  BOOL v26 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  -[LAClient _updateOptions:](self, "_updateOptions:", a5);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  char v18 = (void *)MEMORY[0x189608798];
  [MEMORY[0x1896087A8] checkOptions:v17];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 raiseExceptionOnError:v19];

  id v20 = (void *)MEMORY[0x189608798];
  [MEMORY[0x1896087A8] checkACL:v13];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 raiseExceptionOnError:v21];

  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke;
  v27[3] = &unk_189F99540;
  v27[4] = self;
  id v28 = v13;
  id v29 = v14;
  id v30 = v17;
  id v31 = v15;
  BOOL v32 = v26;
  id v22 = v15;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v26, v27, v16);
}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) synchronousRemoteContext];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_2;
  v10[3] = &unk_189F99518;
  uint64_t v8 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  char v16 = *(_BYTE *)(a1 + 72);
  id v11 = v8;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = v3;
  id v9 = v3;
  [v4 evaluateACL:v11 operation:v5 options:v6 uiDelegate:v7 reply:v10];
}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_3;
  v8[3] = &unk_189F994F0;
  uint64_t v7 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  [v9 _checkIdResultForTCC:a2 synchronous:v6 error:a3 retryBlock:v8 finally:*(void *)(a1 + 72)];
}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_3( void *a1,  void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 evaluateACL:a1[5] operation:a1[6] options:a1[7] uiDelegate:a1[8] reply:v4];
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x189608798];
  id v10 = (void *)MEMORY[0x1896087A8];
  id v11 = a5;
  [v10 checkEvent:a3];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 raiseExceptionOnError:v12];

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __50__LAClient_failProcessedEvent_failureError_reply___block_invoke;
  v14[3] = &unk_189F99568;
  id v15 = v8;
  int64_t v16 = a3;
  v14[4] = self;
  id v13 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v14, v11);
}

void __50__LAClient_failProcessedEvent_failureError_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 failProcessedEvent:a1[6] failureError:a1[5] reply:v4];
}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x189608798];
  uint64_t v7 = (void *)MEMORY[0x1896087A8];
  id v8 = a4;
  [v7 checkEvent:a3];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __38__LAClient_retryProcessedEvent_reply___block_invoke;
  v10[3] = &unk_189F99590;
  void v10[4] = self;
  void v10[5] = a3;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, v8);
}

void __38__LAClient_retryProcessedEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 retryProcessedEvent:*(void *)(a1 + 40) reply:v4];
}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x189608798];
  uint64_t v7 = (void *)MEMORY[0x1896087A8];
  id v8 = a4;
  [v7 checkEvent:a3];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __38__LAClient_resetProcessedEvent_reply___block_invoke;
  v10[3] = &unk_189F99590;
  void v10[4] = self;
  void v10[5] = a3;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, v8);
}

void __38__LAClient_resetProcessedEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 resetProcessedEvent:*(void *)(a1 + 40) reply:v4];
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  id v8 = (void *)MEMORY[0x189608798];
  id v9 = (void *)MEMORY[0x1896087A8];
  id v10 = a5;
  [v9 checkEvent:a3];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 raiseExceptionOnError:v11];

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __44__LAClient_pauseProcessedEvent_pause_reply___block_invoke;
  v12[3] = &unk_189F995B8;
  v12[4] = self;
  v12[5] = a3;
  BOOL v13 = a4;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v12, v10);
}

void __44__LAClient_pauseProcessedEvent_pause_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 pauseProcessedEvent:*(void *)(a1 + 40) pause:*(unsigned __int8 *)(a1 + 48) reply:v4];
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = (void *)MEMORY[0x189608798];
  id v12 = (void *)MEMORY[0x1896087A8];
  id v13 = a6;
  [v12 checkEvent:a4];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 raiseExceptionOnError:v14];

  id v15 = (void *)MEMORY[0x189608798];
  [MEMORY[0x1896087A8] checkCredentialType:a5];
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 raiseExceptionOnError:v16];

  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __65__LAClient_setCredential_forProcessedEvent_credentialType_reply___block_invoke;
  v18[3] = &unk_189F995E0;
  v18[4] = self;
  id v19 = v10;
  int64_t v20 = a4;
  int64_t v21 = a5;
  id v17 = v10;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v18, v13);
}

void __65__LAClient_setCredential_forProcessedEvent_credentialType_reply___block_invoke( void *a1,  void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setCredential:a1[5] forProcessedEvent:a1[6] credentialType:a1[7] reply:v4];
}

- (void)isCredentialSet:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x189608798];
  uint64_t v7 = (void *)MEMORY[0x1896087A8];
  id v8 = a4;
  [v7 checkCredentialType:a3];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __34__LAClient_isCredentialSet_reply___block_invoke;
  v10[3] = &unk_189F99590;
  void v10[4] = self;
  void v10[5] = a3;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, v8);
}

void __34__LAClient_isCredentialSet_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 isCredentialSet:*(void *)(a1 + 40) reply:v4];
}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x189608798];
  id v10 = (void *)MEMORY[0x1896087A8];
  id v11 = a5;
  [v10 checkCredentialType:a4];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 raiseExceptionOnError:v12];

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __37__LAClient_setCredential_type_reply___block_invoke;
  v14[3] = &unk_189F99568;
  v14[4] = self;
  id v15 = v8;
  int64_t v16 = a4;
  id v13 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v14, v11);
}

void __37__LAClient_setCredential_type_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setCredential:a1[5] type:a1[6] reply:v4];
}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x189608798];
  uint64_t v7 = (void *)MEMORY[0x1896087A8];
  id v8 = a4;
  [v7 checkCredentialType:a3];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 raiseExceptionOnError:v9];

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __35__LAClient_credentialOfType_reply___block_invoke;
  v10[3] = &unk_189F99608;
  void v10[4] = self;
  void v10[5] = a3;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v10, v8);
}

void __35__LAClient_credentialOfType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 credentialOfType:*(void *)(a1 + 40) reply:v4];
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __57__LAClient_verifyFileVaultUser_volumeUuid_options_reply___block_invoke;
  v14[3] = &unk_189F99630;
  v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  unint64_t v17 = a5;
  id v12 = v11;
  id v13 = v10;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v14, a6);
}

void __57__LAClient_verifyFileVaultUser_volumeUuid_options_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 verifyFileVaultUser:a1[5] volumeUuid:a1[6] options:a1[7] reply:v4];
}

- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __42__LAClient_serverPropertyForOption_reply___block_invoke;
  v4[3] = &unk_189F99608;
  v4[4] = self;
  v4[5] = a3;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v4, a4);
}

void __42__LAClient_serverPropertyForOption_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 serverPropertyForOption:*(void *)(a1 + 40) reply:v4];
}

- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __51__LAClient_setServerPropertyForOption_value_reply___block_invoke;
  v10[3] = &unk_189F99568;
  id v11 = v8;
  int64_t v12 = a3;
  void v10[4] = self;
  id v9 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, a5);
}

void __51__LAClient_setServerPropertyForOption_value_reply___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setServerPropertyForOption:a1[6] value:a1[5] reply:v4];
}

- (id)serverPropertyForOption:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  unint64_t v17 = __Block_byref_object_copy__0;
  char v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = __Block_byref_object_copy__0;
  int64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__LAClient_serverPropertyForOption_error___block_invoke;
  v7[3] = &unk_189F99658;
  void v7[4] = &v14;
  v7[5] = &v8;
  -[LAClient serverPropertyForOption:reply:](self, "serverPropertyForOption:reply:", a3, v7);
  if (a4) {
    *a4 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __42__LAClient_serverPropertyForOption_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setServerPropertyForOption:(int64_t)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __51__LAClient_setServerPropertyForOption_value_error___block_invoke;
  v11[3] = &unk_189F99680;
  void v11[4] = &v18;
  v11[5] = &v12;
  -[LAClient setServerPropertyForOption:value:reply:](self, "setServerPropertyForOption:value:reply:", a3, v8, v11);
  if (a5) {
    *a5 = (id) v13[5];
  }
  char v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __51__LAClient_setServerPropertyForOption_value_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (void)externalizedContextWithReply:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__LAClient_externalizedContextWithReply___block_invoke;
  v3[3] = &unk_189F992C0;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __41__LAClient_externalizedContextWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 synchronousRemoteContext];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 externalizedContextWithReply:v3];
}

- (id)synchronousExternalizedContextWithError:(id *)a3
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0LL;
  v6[5] = &v8;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __52__LAClient_synchronousExternalizedContextWithError___block_invoke;
  v7[3] = &unk_189F992C0;
  void v7[4] = self;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __52__LAClient_synchronousExternalizedContextWithError___block_invoke_2;
  v6[3] = &unk_189F996A8;
  v6[4] = &v14;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v7, v6);
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __52__LAClient_synchronousExternalizedContextWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 synchronousRemoteContext];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 externalizedContextWithReply:v3];
}

void __52__LAClient_synchronousExternalizedContextWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSData)externalizedContext
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 externalizedContext];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v4 length])
  {
    usleep(0x1388u);
    LALogForCategory();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[LAClient externalizedContext].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    -[LAClient cachedExternalizedContext](self, "cachedExternalizedContext");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 externalizedContext];

    id v4 = (void *)v14;
  }

  return (NSData *)v4;
}

- (void)authMethodWithReply:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__LAClient_authMethodWithReply___block_invoke;
  v3[3] = &unk_189F992C0;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __32__LAClient_authMethodWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 synchronousRemoteContext];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 authMethodWithReply:v3];
}

- (void)prearmTouchIdWithReply:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35__LAClient_prearmTouchIdWithReply___block_invoke;
  v3[3] = &unk_189F992C0;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __35__LAClient_prearmTouchIdWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) serverConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__LAClient_prearmTouchIdWithReply___block_invoke_2;
  v7[3] = &unk_189F990C0;
  id v8 = v3;
  id v5 = v3;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v7];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 prearmTouchIdWithReply:v5];
}

uint64_t __35__LAClient_prearmTouchIdWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)resetWithReply:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __27__LAClient_resetWithReply___block_invoke;
  v3[3] = &unk_189F99310;
  v3[4] = self;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v3, a3);
}

void __27__LAClient_resetWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 synchronousRemoteContext];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 resetProcessedEvent:0 reply:v3];
}

- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  -[LAClient _connectToServerWithRecovery:userSession:legacyService:]( self,  "_connectToServerWithRecovery:userSession:legacyService:",  0LL,  0LL,  0LL);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __38__LAClient_notifyEvent_options_reply___block_invoke;
  v11[3] = &unk_189F99568;
  id v12 = v8;
  int64_t v13 = a3;
  void v11[4] = self;
  id v10 = v8;
  -[LAClient _performSynchronous:callBool:finally:](self, "_performSynchronous:callBool:finally:", 0LL, v11, v9);
}

void __38__LAClient_notifyEvent_options_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) serverConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__LAClient_notifyEvent_options_reply___block_invoke_2;
  v7[3] = &unk_189F990C0;
  id v8 = v3;
  id v5 = v3;
  [v4 remoteObjectProxyWithErrorHandler:v7];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 notifyEvent:*(void *)(a1 + 48) options:*(void *)(a1 + 40) reply:v5];
}

uint64_t __38__LAClient_notifyEvent_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __47__LAClient_setShowingCoachingHint_event_reply___block_invoke;
  v5[3] = &unk_189F995B8;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v5, a5);
}

void __47__LAClient_setShowingCoachingHint_event_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 synchronousRemoteContext];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setShowingCoachingHint:*(unsigned __int8 *)(a1 + 48) event:*(void *)(a1 + 40) reply:v4];
}

- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[LAClient serverConnection](self, "serverConnection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  id v17 = __51__LAClient_bootstrapServiceType_completionHandler___block_invoke;
  uint64_t v18 = &unk_189F990C0;
  id v19 = v6;
  id v9 = v6;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:&v15];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)NSString;
  [MEMORY[0x1896079D8] processInfo];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 processIdentifier];
  objc_msgSend(v11, "stringWithFormat:", @"%d", v13, v15, v16, v17, v18);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 bootstrapSessionServiceType:v7 serviceClientID:v14 completionHandler:v9];
}

uint64_t __51__LAClient_bootstrapServiceType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (LAUIDelegate)uiDelegate
{
  return (LAUIDelegate *)objc_loadWeakRetained((id *)&self->_uiDelegate);
}

- (void)setUiDelegate:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)proxyId
{
  return self->_proxyId;
}

- (void)setProxyId:(id)a3
{
}

- (NSError)permanentError
{
  return (NSError *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPermanentError:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (LAContextXPC)remoteContext
{
  return self->_remoteContext;
}

- (LAContextXPC)synchronousRemoteContext
{
  return self->_synchronousRemoteContext;
}

- (NSMutableArray)invalidations
{
  return self->_invalidations;
}

- (LACachedExternalizedContext)cachedExternalizedContext
{
  return (LACachedExternalizedContext *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCachedExternalizedContext:(id)a3
{
}

- (BOOL)shouldRecoverConnection
{
  return self->_shouldRecoverConnection;
}

- (void)setShouldRecoverConnection:(BOOL)a3
{
  self->_shouldRecoverConnection = a3;
}

- (BOOL)willRetryOnInterruptedConnection
{
  return self->_willRetryOnInterruptedConnection;
}

- (void)setWillRetryOnInterruptedConnection:(BOOL)a3
{
  self->_willRetryOnInterruptedConnection = a3;
}

- (NSNumber)userSession
{
  return self->_userSession;
}

- (NSData)existingContext
{
  return self->_existingContext;
}

- (void)setExistingContext:(id)a3
{
}

- (LAContext)context
{
  return (LAContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
}

+ (void)createConnection:(uint64_t)a1 legacyService:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189607968] numberWithUnsignedInt:a1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543362;
  id v5 = v3;
  _os_log_debug_impl( &dword_186EAF000,  a2,  OS_LOG_TYPE_DEBUG,  "xpc_connection_set_target_user_session_uid() setting uid:%{public}@",  (uint8_t *)&v4,  0xCu);

  OUTLINED_FUNCTION_4();
}

+ (void)createConnection:(int *)a1 legacyService:(os_log_s *)a2 .cold.2(int *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2080;
  uint64_t v6 = xpc_strerror();
  _os_log_error_impl( &dword_186EAF000,  a2,  OS_LOG_TYPE_ERROR,  "xpc_user_sessions_get_foreground_uid() failed with error %d - %s",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)_synchronousRemoteObjectProxy:(uint64_t)a3 performCall:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_handleConnectionResult:(void *)a1 uuid:proxyId:error:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_186EAF000, v2, v3, "%{public}@ failed to initialize: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __29__LAClient_setRemoteContext___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0( &dword_186EAF000,  v2,  v3,  "%{public}@ has encountered XPC error on synchronous proxy: %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)invalidatedWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_186EAF000, v2, v3, "%{public}@ invalidated by server: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_setPermanentError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0( &dword_186EAF000,  v2,  v3,  "%{public}@ will keep returning %{public}@ from now on",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_1();
}

- (void)externalizedContext
{
}

@end