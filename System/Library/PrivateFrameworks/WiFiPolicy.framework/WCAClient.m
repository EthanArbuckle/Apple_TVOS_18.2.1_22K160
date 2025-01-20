@interface WCAClient
+ (id)sharedClient;
- (NSXPCConnection)connectionToService;
- (WCAClient)init;
- (void)_establishDaemonConnection;
- (void)_invalidateDaemonConnectionIfPossible;
- (void)executeFetchRequest:(id)a3;
- (void)fetchWiFiAssetsFromServer;
- (void)setConnectionToService:(id)a3;
@end

@implementation WCAClient

- (WCAClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WCAClient;
  v2 = -[WCAClient init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.wificloudassets.wcaclient", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)executeFetchRequest:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__WCAClient_executeFetchRequest___block_invoke;
  v7[3] = &unk_18A16C748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __33__WCAClient_executeFetchRequest___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __33__WCAClient_executeFetchRequest___block_invoke_2;
  v14[3] = &unk_18A16DFD8;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v15 = v5;
  uint64_t v16 = v6;
  [v3 remoteObjectProxyWithErrorHandler:v14];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = *(void **)(a1 + 40);
  v11[0] = v4;
  v11[1] = 3221225472LL;
  v11[2] = __33__WCAClient_executeFetchRequest___block_invoke_4;
  v11[3] = &unk_18A16E000;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  [v7 executeFetchRequest:v9 completionHandler:v11];
}

void __33__WCAClient_executeFetchRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    [*(id *)(a1 + 32) completionHandler];
    uint64_t v4 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0LL, 0LL);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(dispatch_queue_s **)(v5 + 8);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__WCAClient_executeFetchRequest___block_invoke_3;
  block[3] = &unk_18A16C770;
  block[4] = v5;
  dispatch_async(v6, block);
}

void __33__WCAClient_executeFetchRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;
}

void __33__WCAClient_executeFetchRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) completionHandler];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [*(id *)(a1 + 32) completionHandler];
    uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v5)[2](v5, v3, 0LL);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(dispatch_queue_s **)(v6 + 8);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__WCAClient_executeFetchRequest___block_invoke_5;
  block[3] = &unk_18A16C770;
  block[4] = v6;
  dispatch_async(v7, block);
}

void __33__WCAClient_executeFetchRequest___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16LL);
  dispatch_time_t v3 = dispatch_time(0LL, 5000000000LL);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(dispatch_queue_s **)(v4 + 8);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __33__WCAClient_executeFetchRequest___block_invoke_6;
  v6[3] = &unk_18A16D6A0;
  v6[4] = v4;
  v6[5] = v2;
  dispatch_after(v3, v5, v6);
}

void *__33__WCAClient_executeFetchRequest___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8) == result[2]) {
    return (void *)[result _invalidateDaemonConnectionIfPossible];
  }
  return result;
}

- (void)fetchWiFiAssetsFromServer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 fetchWiFiAssetsFromServer];
}

void __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)_establishDaemonConnection
{
  if (!self->_connectionToService)
  {
    dispatch_time_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.wifi.WiFiCloudAssetsXPCService"];
    connectionToService = self->_connectionToService;
    self->_connectionToService = v3;

    if (self->_connectionToService)
    {
      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C72DD08];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToService, "setRemoteObjectInterface:", v5);

      -[NSXPCConnection resume](self->_connectionToService, "resume");
      objc_initWeak(&location, self);
      uint64_t v6 = MEMORY[0x1895F87A8];
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __39__WCAClient__establishDaemonConnection__block_invoke;
      v9[3] = &unk_18A16CE78;
      objc_copyWeak(&v10, &location);
      -[NSXPCConnection setInvalidationHandler:](self->_connectionToService, "setInvalidationHandler:", v9);
      v7[0] = v6;
      v7[1] = 3221225472LL;
      v7[2] = __39__WCAClient__establishDaemonConnection__block_invoke_3;
      v7[3] = &unk_18A16CE78;
      objc_copyWeak(&v8, &location);
      -[NSXPCConnection setInterruptionHandler:](self->_connectionToService, "setInterruptionHandler:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

void __39__WCAClient__establishDaemonConnection__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v3 = (dispatch_queue_s *)WeakRetained[1];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__WCAClient__establishDaemonConnection__block_invoke_2;
  block[3] = &unk_18A16CE78;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void __39__WCAClient__establishDaemonConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateDaemonConnectionIfPossible];
}

void __39__WCAClient__establishDaemonConnection__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v3 = (dispatch_queue_s *)WeakRetained[1];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__WCAClient__establishDaemonConnection__block_invoke_4;
  block[3] = &unk_18A16CE78;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void __39__WCAClient__establishDaemonConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateDaemonConnectionIfPossible];
}

- (void)_invalidateDaemonConnectionIfPossible
{
  connectionToService = self->_connectionToService;
  if (connectionToService)
  {
    -[NSXPCConnection invalidate](connectionToService, "invalidate");
    uint64_t v4 = self->_connectionToService;
    self->_connectionToService = 0LL;
  }

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_16);
  }
  return (id)sharedClient_wcaClient;
}

void __25__WCAClient_sharedClient__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___WCAClient);
  v1 = (void *)sharedClient_wcaClient;
  sharedClient_wcaClient = (uint64_t)v0;
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void)setConnectionToService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end