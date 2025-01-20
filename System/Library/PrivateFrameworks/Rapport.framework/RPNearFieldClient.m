@interface RPNearFieldClient
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldClient)init;
- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (id)_ensureXPCStarted;
- (id)connectionEstablishedHandler;
- (id)failedDiscovery;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)tapEventHandler;
- (void)_interrupted;
- (void)_invalidated;
- (void)didConnect;
- (void)failDiscoveryWithError:(id)a3;
- (void)invalidate;
- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3;
- (void)receivedTapEvent:(id)a3;
- (void)setConnectionEstablishedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFailedDiscovery:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTapEventHandler:(id)a3;
- (void)stopWithCompletion:(id)a3;
@end

@implementation RPNearFieldClient

- (RPNearFieldClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPNearFieldClient;
  v2 = -[RPNearFieldClient init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
  }
  return v3;
}

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  objc_super v5 = (objc_class *)MEMORY[0x189607B30];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithMachServiceName:v6 options:a4];

  return v7;
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    -[RPNearFieldClient _XPCConnectionWithMachServiceName:options:]( self,  "_XPCConnectionWithMachServiceName:options:",  @"com.apple.rapport.nearfield",  0LL);
    v3 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D7A48];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5BC0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    uint64_t v7 = MEMORY[0x1895F87A8];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __38__RPNearFieldClient__ensureXPCStarted__block_invoke;
    v10[3] = &unk_18A031A30;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v7;
    v9[1] = 3221225472LL;
    v9[2] = __38__RPNearFieldClient__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPNearFieldClient <= 10
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return 0LL;
}

uint64_t __38__RPNearFieldClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __38__RPNearFieldClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_RPNearFieldClient <= 50
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  v3 = (void (**)(void))MEMORY[0x1895A4770](self->_interruptionHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__RPNearFieldClient_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__RPNearFieldClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    if (!*(_BYTE *)(*(void *)(a1 + 32) + 17LL)
      && gLogCategory_RPNearFieldClient <= 30
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v3 = *(void **)(*(void *)(a1 + 32) + 64LL);
    if (v3)
    {
      [v3 invalidate];
      uint64_t v4 = *(void *)(a1 + 32);
      objc_super v5 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = 0LL;
    }

    else
    {
      [*(id *)(a1 + 32) _invalidated];
    }
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPNearFieldClient <= 50
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearFieldClient <= 10
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = -[RPNearFieldClient _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __40__RPNearFieldClient_stopWithCompletion___block_invoke;
  v13[3] = &unk_18A031B10;
  id v8 = v4;
  id v14 = v8;
  v9 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13);
  v11[0] = v7;
  v11[1] = 3221225472LL;
  v11[2] = __40__RPNearFieldClient_stopWithCompletion___block_invoke_2;
  v11[3] = &unk_18A031B10;
  id v12 = v8;
  id v10 = v8;
  [v9 stopDiscoveryWithCompletion:v11];
}

void __40__RPNearFieldClient_stopWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  uint64_t v3 = MEMORY[0x1895A4770](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __40__RPNearFieldClient_stopWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_RPNearFieldClient <= 90
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPNearFieldClient <= 40 {
         && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  uint64_t v3 = MEMORY[0x1895A4770](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (void)failDiscoveryWithError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = MEMORY[0x1895A4770](self->_failedDiscovery);
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)receivedTapEvent:(id)a3
{
  id v6 = a3;
  uint64_t v4 = MEMORY[0x1895A4770](self->_tapEventHandler);
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3
{
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

- (void)didConnect
{
  v2 = (void (**)(void))MEMORY[0x1895A4770](self->_connectionEstablishedHandler, a2);
  if (v2)
  {
    uint64_t v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)tapEventHandler
{
  return self->_tapEventHandler;
}

- (void)setTapEventHandler:(id)a3
{
}

- (id)failedDiscovery
{
  return self->_failedDiscovery;
}

- (void)setFailedDiscovery:(id)a3
{
}

- (id)connectionEstablishedHandler
{
  return self->_connectionEstablishedHandler;
}

- (void)setConnectionEstablishedHandler:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
}

@end