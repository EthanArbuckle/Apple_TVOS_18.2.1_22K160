@interface CUMessageSessionServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CUMessageSession)templateSession;
- (CUMessageSessionServer)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deregisterRequestHandler;
- (id)invalidationHandler;
- (id)registerRequestHandler;
- (id)sendRequestHandler;
- (void)_connectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setDeregisterRequestHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRegisterRequestHandler:(id)a3;
- (void)setSendRequestHandler:(id)a3;
- (void)setTemplateSession:(id)a3;
@end

@implementation CUMessageSessionServer

- (CUMessageSessionServer)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUMessageSessionServer;
  v2 = -[CUMessageSessionServer init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }

  return v2;
}

- (void)activate
{
  if (gLogCategory_CUMessageSession <= 30
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUMessageSession,  (uint64_t)"-[CUMessageSessionServer activate]",  0x1Eu,  (uint64_t)"Activate\n",  v3,  v4,  v5,  v6,  v17);
  }

  if (!self->_xpcListener)
  {
    [MEMORY[0x189607B50] anonymousListener];
    v7 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    xpcListener = self->_xpcListener;
    self->_xpcListener = v7;

    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcListener, "resume");
    v9 = objc_alloc_init(&OBJC_CLASS___CUMessageSession);
    templateSession = self->_templateSession;
    self->_templateSession = v9;
    v11 = -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
    -[CUMessageSession setListenerEndpoint:](self->_templateSession, "setListenerEndpoint:", v11);
    v12 = -[CUMessageSession listenerEndpoint](self->_templateSession, "listenerEndpoint");
    if (!v12
      && gLogCategory_CUMessageSession <= 90
      && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x5Au)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUMessageSession,  (uint64_t)"-[CUMessageSessionServer activate]",  0x5Au,  (uint64_t)"### No XPC endpoint?\n",  v13,  v14,  v15,  v16,  v18);
    }
  }

- (void)invalidate
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUMessageSession <= 30
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUMessageSession,  (uint64_t)"-[CUMessageSessionServer invalidate]",  0x1Eu,  (uint64_t)"Invalidate\n",  v3,  v4,  v5,  v6,  v20);
  }

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0LL;

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v8 = self->_xpcConnections;
  uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        *(_BYTE *)(v13 + 16) = 1;
        objc_msgSend(*(id *)(v13 + 40), "invalidate", (void)v20);
      }

      uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v10);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0LL;

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v16 = self->_invalidationHandler;
  }

  else
  {
    id v16 = 0LL;
  }

  self->_invalidationHandler = 0LL;

  id registerRequestHandler = self->_registerRequestHandler;
  self->_id registerRequestHandler = 0LL;

  deid registerRequestHandler = self->_deregisterRequestHandler;
  self->_deid registerRequestHandler = 0LL;

  id sendRequestHandler = self->_sendRequestHandler;
  self->_id sendRequestHandler = 0LL;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_alloc_init(&OBJC_CLASS___CUMessageSessionXPCConnection);
  objc_storeStrong((id *)&v7->_server, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v7);
  [v6 _setQueue:self->_dispatchQueue];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6A8E08];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:v7];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __61__CUMessageSessionServer_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_189F33088;
  v20[4] = self;
  v12 = v7;
  __int128 v21 = v12;
  [v6 setInvalidationHandler:v20];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6A87A0];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setRemoteObjectInterface:v13];

  [v6 resume];
  if (gLogCategory_CUMessageSession <= 20
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x14u)))
  {
    char v14 = [v6 processIdentifier];
    LogPrintF( (uint64_t)&gLogCategory_CUMessageSession,  (uint64_t)"-[CUMessageSessionServer listener:shouldAcceptNewConnection:]",  0x14u,  (uint64_t)"XPC connection started from %#{pid}\n",  v15,  v16,  v17,  v18,  v14);
  }

  return 1;
}

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)registerRequestHandler
{
  return self->_registerRequestHandler;
}

- (void)setRegisterRequestHandler:(id)a3
{
}

- (id)deregisterRequestHandler
{
  return self->_deregisterRequestHandler;
}

- (void)setDeregisterRequestHandler:(id)a3
{
}

- (id)sendRequestHandler
{
  return self->_sendRequestHandler;
}

- (void)setSendRequestHandler:(id)a3
{
}

- (CUMessageSession)templateSession
{
  return self->_templateSession;
}

- (void)setTemplateSession:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __61__CUMessageSessionServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

@end