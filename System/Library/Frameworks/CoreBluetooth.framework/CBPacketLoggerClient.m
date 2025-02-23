@interface CBPacketLoggerClient
- (CBPacketLoggerClient)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)rawPacketHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_activateXPC:(BOOL)a3 completion:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_xpcReceivedEvent:(id)a3;
- (void)_xpcReceivedPacket:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRawPacketHandler:(id)a3;
@end

@implementation CBPacketLoggerClient

- (CBPacketLoggerClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBPacketLoggerClient;
  v2 = -[CBPacketLoggerClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__CBPacketLoggerClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_189FB2B50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __47__CBPacketLoggerClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0LL;
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  v11 = __48__CBPacketLoggerClient__activateWithCompletion___block_invoke;
  v12 = &unk_189FB1B30;
  v14 = &v15;
  id v5 = v4;
  id v13 = v5;
  id v6 = (void (**)(void))MEMORY[0x18959F890](&v9);
  if (*(_WORD *)&self->_activateCalled)
  {
    uint64_t v7 = NSErrorF_safe();
    id v8 = (void *)v16[5];
    v16[5] = v7;
  }

  else
  {
    self->_activateCalled = 1;
    -[CBPacketLoggerClient _activateXPC:completion:](self, "_activateXPC:completion:", 0LL, v5, v9, v10, v11, v12);
  }

  v6[2](v6);

  _Block_object_dispose(&v15, 8);
}

uint64_t __48__CBPacketLoggerClient__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

- (void)_activateXPC:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }

  else if (gLogCategory_CBPacketLoggerClient <= 30 {
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  -[CBPacketLoggerClient _ensureXPCStarted](self, "_ensureXPCStarted");
  id v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __48__CBPacketLoggerClient__activateXPC_completion___block_invoke;
  v11[3] = &unk_189FB4510;
  BOOL v13 = v4;
  id v12 = v6;
  id v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, v11);
}

void __48__CBPacketLoggerClient__activateXPC_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }

  else if (gLogCategory_CBPacketLoggerClient <= 30 {
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  uint64_t v3 = MEMORY[0x18959F890](*(void *)(a1 + 32));
  BOOL v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__CBPacketLoggerClient_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__CBPacketLoggerClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    uint64_t v3 = *(_xpc_connection_s **)(*(void *)(v2 + 32) + 16LL);
    if (v3) {
      xpc_connection_cancel(v3);
    }
    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    uint64_t v3 = MEMORY[0x18959F890](self->_interruptionHandler);
    BOOL v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    -[CBPacketLoggerClient _activateXPC:completion:](self, "_activateXPC:completion:", 1LL, 0LL);
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    uint64_t v9 = MEMORY[0x18959F890](self->_invalidationHandler, a2);
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id rawPacketHandler = self->_rawPacketHandler;
    self->_id rawPacketHandler = 0LL;

    xpc_object_t v7 = (void *)v9;
    if (v9)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      xpc_object_t v7 = (void *)v9;
    }

    self->_invalidateDone = 1;
    if (gLogCategory_CBPacketLoggerClient <= 30)
    {
      if (gLogCategory_CBPacketLoggerClient != -1 || (int v8 = _LogCategory_Initialize(), v7 = (void *)v9, v8))
      {
        LogPrintF_safe();
        xpc_object_t v7 = (void *)v9;
      }
    }
  }

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  BOOL v4 = self->_xpcCnx;
  if (v4)
  {
    id v5 = v4;
  }

  else
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.bluetooth.BTPacketLogger.ios",  (dispatch_queue_t)self->_dispatchQueue,  0LL);
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __41__CBPacketLoggerClient__ensureXPCStarted__block_invoke;
    v9[3] = &unk_189FB1EC8;
    v9[4] = self;
    xpc_object_t v7 = mach_service;
    id v10 = v7;
    xpc_connection_set_event_handler(v7, v9);
    xpc_connection_activate(v7);
    id v5 = v7;
  }

  return v5;
}

void *__41__CBPacketLoggerClient__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[2] == *(void *)(a1 + 40)) {
    return (void *)[result _xpcReceivedEvent:a2];
  }
  return result;
}

- (void)_xpcReceivedEvent:(id)a3
{
  id v14 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    -[CBPacketLoggerClient _xpcReceivedPacket:](self, "_xpcReceivedPacket:", v14);
  }

  else if (v14 == (id)MEMORY[0x1895F9198])
  {
    -[CBPacketLoggerClient _interrupted](self, "_interrupted");
  }

  else if (v14 == (id)MEMORY[0x1895F91A0])
  {
    if (!self->_invalidateCalled
      && gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0LL;

    -[CBPacketLoggerClient _invalidated](self, "_invalidated");
  }

  else
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintXPC();
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    id v10 = (void (**)(void, void))MEMORY[0x18959F890](self->_errorHandler);
    if (v10)
    {
      CBErrorF(-6700, (uint64_t)"XPC error", v4, v5, v6, v7, v8, v9, (uint64_t)v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v10)[2](v10, v11);
    }
  }

- (void)_xpcReceivedPacket:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9240])
    {
      uint64_t v4 = MEMORY[0x18959F890](self->_rawPacketHandler);
      uint64_t v5 = (void *)v4;
      if (v4) {
        (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
      }

      goto LABEL_6;
    }

    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_13:
      LogPrintF_safe();

      return;
    }
  }

  else if (gLogCategory_CBPacketLoggerClient <= 90 {
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_13;
  }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
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

- (id)rawPacketHandler
{
  return self->_rawPacketHandler;
}

- (void)setRawPacketHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end