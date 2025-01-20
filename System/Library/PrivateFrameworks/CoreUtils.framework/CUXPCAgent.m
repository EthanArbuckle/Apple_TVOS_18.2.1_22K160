@interface CUXPCAgent
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CUXPCAgent)init;
- (NSString)label;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)connectionEndedHandler;
- (id)connectionStartedHandler;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_connectionInvalidated:(id)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setConnectionEndedHandler:(id)a3;
- (void)setConnectionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
@end

@implementation CUXPCAgent

- (CUXPCAgent)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUXPCAgent;
  v2 = -[CUXPCAgent init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUXPCAgent;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUXPCAgent;
  -[CUXPCAgent dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __37__CUXPCAgent_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUXPCAgent activateDirectAndReturnError:]",  0x1Eu,  (uint64_t)"Activate\n",  v3,  v4,  v5,  v6,  v23[0]);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_interrupted
{
  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_5;
  }
  if (ucat->var0 != -1) {
    goto LABEL_3;
  }
  if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
  {
    ucat = self->_ucat;
LABEL_3:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _interrupted]", 0x1Eu, (uint64_t)"Interrupted\n", v3, v4, v5, v6, v9);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __24__CUXPCAgent_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v15);
  }

- (void)_invalidated
{
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUXPCAgent _invalidated]",  0x3Cu,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v18);
    }
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_alloc_init(&OBJC_CLASS___CUXPCAgentConnection);
  objc_storeStrong((id *)&v7->_agent, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcCnxSet = self->_xpcCnxSet;
  if (!xpcCnxSet)
  {
    char v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v10 = self->_xpcCnxSet;
    self->_xpcCnxSet = v9;

    xpcCnxSet = self->_xpcCnxSet;
  }

  -[NSMutableSet addObject:](xpcCnxSet, "addObject:", v7);
  [v6 _setQueue:self->_dispatchQueue];
  [v6 setExportedInterface:self->_exportedInterface];
  [v6 setExportedObject:self->_exportedObject];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __49__CUXPCAgent_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_189F33088;
  v20[4] = self;
  uint64_t v11 = v7;
  v21 = v11;
  [v6 setInvalidationHandler:v20];
  [v6 setRemoteObjectInterface:self->_remoteObjectInterface];
  [v6 resume];
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      char v13 = [v6 processIdentifier];
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUXPCAgent listener:shouldAcceptNewConnection:]",  0x14u,  (uint64_t)"XPC connection started from %#{pid}\n",  v14,  v15,  v16,  v17,  v13);
      goto LABEL_7;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }

- (void)_connectionInvalidated:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v5 connectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcCnxSet, "removeObject:", v5);
  id connectionEndedHandler = (void (**)(id, id))self->_connectionEndedHandler;
  if (connectionEndedHandler) {
    connectionEndedHandler[2](connectionEndedHandler, v5);
  }
}

- (id)remoteObjectProxy
{
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }

  if ((unint64_t)-[NSMutableSet count](self->_xpcCnxSet, "count") >= 2)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUXPCAgent remoteObjectProxy]",  0x3Cu,  (uint64_t)"### Multiple connections...using arbitrary one\n",  v5,  v6,  v7,  v8,  v13);
    }
  }

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  if ((unint64_t)-[NSMutableSet count](self->_xpcCnxSet, "count") >= 2)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUXPCAgent remoteObjectProxyWithErrorHandler:]",  0x3Cu,  (uint64_t)"### Multiple connections...using arbitrary one\n",  v7,  v8,  v9,  v10,  v15);
    }
  }

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionEndedHandler:(id)a3
{
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

- (NSString)label
{
  return self->_label;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __49__CUXPCAgent_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

uint64_t __24__CUXPCAgent_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __43__CUXPCAgent_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __43__CUXPCAgent_activateDirectAndReturnError___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 16);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUXPCAgent activateDirectAndReturnError:]_block_invoke_2",  0x1Eu,  (uint64_t)"Invalidated\n",  a5,  a6,  a7,  a8,  v14);
    uint64_t v9 = *(void *)(a1 + 32);
  }

void __37__CUXPCAgent_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = 0LL;
  [v2 activateDirectAndReturnError:&v5];
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

@end