@interface CUMessageSession
+ (BOOL)supportsSecureCoding;
- (CUMessageSession)init;
- (CUMessageSession)initWithCoder:(id)a3;
- (CUMessageSession)initWithTemplate:(id)a3;
- (NSString)label;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)activateHandler;
- (id)invalidateHandler;
- (id)invalidationHandler;
- (id)registerRequestHandler;
- (id)sendRequestHandler;
- (void)_cleanup;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)activate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)remoteRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)setActivateHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidateHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setRegisterRequestHandler:(id)a3;
- (void)setSendRequestHandler:(id)a3;
@end

@implementation CUMessageSession

- (CUMessageSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUMessageSession;
  v2 = -[CUMessageSession init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUMessageSession;
  }

  return v2;
}

- (CUMessageSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CUMessageSession init](self, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    NSDecodeObjectIfPresent(v4, @"lep", v6, (void **)&v5->_listenerEndpoint);
  }

  return v5;
}

- (CUMessageSession)initWithTemplate:(id)a3
{
  id v4 = a3;
  v5 = -[CUMessageSession init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 listenerEndpoint];
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v6;
  }

  return v5;
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
  v4.super_class = (Class)&OBJC_CLASS___CUMessageSession;
  -[CUMessageSession dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  listenerEndpoint = self->_listenerEndpoint;
}

- (void)_cleanup
{
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = 0LL;

  id invalidateHandler = self->_invalidateHandler;
  self->_id invalidateHandler = 0LL;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  id registerRequestHandler = self->_registerRequestHandler;
  self->_id registerRequestHandler = 0LL;

  id sendRequestHandler = self->_sendRequestHandler;
  self->_id sendRequestHandler = 0LL;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__CUMessageSession_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    v7 = self->_listenerEndpoint;
    if (v7)
    {
      v8 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v7];
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = v8;

      -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6A87A0];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v10);

      -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
      uint64_t v11 = MEMORY[0x1895F87A8];
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __37__CUMessageSession__ensureXPCStarted__block_invoke;
      v15[3] = &unk_189F34238;
      v15[4] = self;
      -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v15);
      v14[0] = v11;
      v14[1] = 3221225472LL;
      v14[2] = __37__CUMessageSession__ensureXPCStarted__block_invoke_2;
      v14[3] = &unk_189F34238;
      v14[4] = self;
      -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v14);
      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6A8E08];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v12);

      -[NSXPCConnection resume](self->_xpcCnx, "resume");
    }

    else
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUMessageSession _ensureXPCStarted]",  0x3Cu,  (uint64_t)"### No XPC listener endpoint\n",  v3,  v4,  v5,  v6,  v14[0]);
      }
    }

- (void)_interrupted
{
  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUMessageSession _interrupted]",  0x3Cu,  (uint64_t)"### Interrupted\n",  v3,  v4,  v5,  v6,  v8);
      return;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUMessageSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
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
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUMessageSession _invalidated]",  0x3Cu,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v14);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __54__CUMessageSession_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_189F32D28;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___CUMessageRequestEntry);
  -[CUMessageRequestEntry setHandler:](v11, "setHandler:", v10);

  if (v9) {
    -[CUMessageRequestEntry setOptions:](v11, "setOptions:", v9);
  }
  requestMap = self->_requestMap;
  if (!requestMap)
  {
    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v14 = self->_requestMap;
    self->_requestMap = v13;

    requestMap = self->_requestMap;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](requestMap, "setObject:forKeyedSubscript:", v11, v8);
  -[CUMessageSession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  v20 = __55__CUMessageSession__registerRequestID_options_handler___block_invoke;
  v21 = &unk_189F31318;
  v22 = self;
  id v23 = v8;
  id v16 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", &v18);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "remoteRegisterRequestID:options:", v16, v9, v18, v19, v20, v21, v22);
}

- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__CUMessageSession_sendRequestID_options_request_responseHandler___block_invoke;
  block[3] = &unk_189F31340;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[CUMessageSession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __67__CUMessageSession__sendRequestID_options_request_responseHandler___block_invoke;
  v17[3] = &unk_189F31730;
  id v18 = v10;
  id v15 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v17);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 remoteSendRequestID:v13 options:v12 request:v11 responseHandler:v15];
}

- (void)remoteRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v27 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestMap, "objectForKeyedSubscript:", v27);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = v13;
  if (v13)
  {
    uint64_t v19 = [v13 handler];
    v24 = (void *)v19;
    if (v19)
    {
      (*(void (**)(uint64_t, id, id, id))(v19 + 16))(v19, v10, v11, v12);
    }

    else
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUMessageSession remoteRequestID:options:request:responseHandler:]",  0x3Cu,  (uint64_t)"### No handler for request ID '%@'\n",  v20,  v21,  v22,  v23,  (char)v27);
      }
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

- (NSString)label
{
  return self->_label;
}

- (id)activateHandler
{
  return self->_activateHandler;
}

- (void)setActivateHandler:(id)a3
{
}

- (id)invalidateHandler
{
  return self->_invalidateHandler;
}

- (void)setInvalidateHandler:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (id)registerRequestHandler
{
  return self->_registerRequestHandler;
}

- (void)setRegisterRequestHandler:(id)a3
{
}

- (id)sendRequestHandler
{
  return self->_sendRequestHandler;
}

- (void)setSendRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __67__CUMessageSession__sendRequestID_options_request_responseHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = NSErrorToOSStatusEx(a2, 0LL);
  }
  else {
    uint64_t v3 = 4294960596LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v2 + 16))(v2, v3, 0LL, 0LL);
}

uint64_t __66__CUMessageSession_sendRequestID_options_request_responseHandler___block_invoke( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  char a9)
{
  uint64_t result = a1[4];
  if (!*(_BYTE *)(result + 73))
  {
    uint64_t v11 = *(void *)(result + 56);
    if (v11)
    {
      (*(void (**)(void, void, void, void, void))(v11 + 16))( *(void *)(result + 56),  a1[5],  a1[6],  a1[7],  a1[8]);
      uint64_t result = a1[4];
      if (!*(void *)(result + 40)) {
        return result;
      }
    }

    else if (!*(void *)(result + 40))
    {
      uint64_t result = *(void *)(result + 64);
      if (*(_DWORD *)result == -1)
      {
        uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t result = *(void *)(a1[4] + 64LL);
      }

      return LogPrintF( result,  (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke",  0x3Cu,  (uint64_t)"### No handler or endpoint to send requests\n",  a5,  a6,  a7,  a8,  a9);
    }

    return [(id)result _sendRequestID:a1[5] options:a1[6] request:a1[7] responseHandler:a1[8]];
  }

  uint64_t result = *(void *)(result + 64);
  if (*(int *)result <= 60)
  {
    if (*(_DWORD *)result != -1) {
      return LogPrintF( result,  (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke",  0x3Cu,  (uint64_t)"### SendRequestID '%@' after invalidate\n",  a5,  a6,  a7,  a8,  a1[5]);
    }
    uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
    if ((_DWORD)result)
    {
      uint64_t result = *(void *)(a1[4] + 64LL);
      return LogPrintF( result,  (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke",  0x3Cu,  (uint64_t)"### SendRequestID '%@' after invalidate\n",  a5,  a6,  a7,  a8,  a1[5]);
    }
  }

  return result;
}

void __55__CUMessageSession__registerRequestID_options_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(int **)(v8 + 64);
  id v11 = v3;
  if (*v9 <= 60)
  {
    if (*v9 == -1)
    {
      BOOL v10 = _LogCategory_Initialize((uint64_t)v9, 0x3Cu);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_5;
      }
      id v9 = *(int **)(v8 + 64);
    }

    LogPrintF( (uint64_t)v9,  (uint64_t)"-[CUMessageSession _registerRequestID:options:handler:]_block_invoke",  0x3Cu,  (uint64_t)"### RegisterRequestID '%@' failed: %{error}\n",  v4,  v5,  v6,  v7,  *(void *)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
  }

uint64_t __54__CUMessageSession_registerRequestID_options_handler___block_invoke( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  char a9)
{
  uint64_t result = a1[4];
  if (*(_BYTE *)(result + 73))
  {
    uint64_t result = *(void *)(result + 64);
    if (*(int *)result <= 60)
    {
      if (*(_DWORD *)result != -1) {
        return LogPrintF( result,  (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke",  0x3Cu,  (uint64_t)"### RegisterRequestID '%@' after invalidate\n",  a5,  a6,  a7,  a8,  a1[5]);
      }
      uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
      if ((_DWORD)result)
      {
        uint64_t result = *(void *)(a1[4] + 64LL);
        return LogPrintF( result,  (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke",  0x3Cu,  (uint64_t)"### RegisterRequestID '%@' after invalidate\n",  a5,  a6,  a7,  a8,  a1[5]);
      }
    }
  }

  else
  {
    uint64_t v11 = *(void *)(result + 48);
    if (v11)
    {
      (*(void (**)(void, void, void, void))(v11 + 16))(*(void *)(result + 48), a1[5], a1[6], a1[7]);
      uint64_t result = a1[4];
    }

    if (*(void *)(result + 40))
    {
      [(id)result _registerRequestID:a1[5] options:a1[6] handler:a1[7]];
      uint64_t result = a1[4];
    }

    if (!*(void *)(result + 48) && !*(void *)(result + 40))
    {
      uint64_t result = *(void *)(result + 64);
      if (*(int *)result <= 60)
      {
        if (*(_DWORD *)result == -1)
        {
          uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t result = *(void *)(a1[4] + 64LL);
        }

        return LogPrintF( result,  (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke",  0x3Cu,  (uint64_t)"### No handler or endpoint to register requests\n",  a5,  a6,  a7,  a8,  a9);
      }
    }
  }

  return result;
}

void __30__CUMessageSession_invalidate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v8 + 73)) {
    return;
  }
  *(_BYTE *)(v8 + 73) = 1;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(int **)(v10 + 64);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = *(int **)(v10 + 64);
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUMessageSession invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidating\n",  a5,  a6,  a7,  a8,  v19);
    uint64_t v10 = *(void *)(a1 + 32);
  }

uint64_t __37__CUMessageSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __37__CUMessageSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void *__28__CUMessageSession_activate__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[1];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(result[1]);
    uint64_t result = *(void **)(a1 + 32);
  }

  if (result[5]) {
    return (void *)[result _ensureXPCStarted];
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end