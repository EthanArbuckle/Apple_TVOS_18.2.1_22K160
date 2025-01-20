@interface RPStreamServer
- (NSString)serviceType;
- (RPMessageable)messenger;
- (RPStreamServer)init;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)invalidationHandler;
- (id)streamAcceptHandler;
- (id)streamPrepareHandler;
- (id)streamPrepareHandlerEx;
- (int)streamQoS;
- (unsigned)streamFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleStopRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setStreamAcceptHandler:(id)a3;
- (void)setStreamFlags:(unsigned int)a3;
- (void)setStreamPrepareHandler:(id)a3;
- (void)setStreamPrepareHandlerEx:(id)a3;
- (void)setStreamQoS:(int)a3;
@end

@implementation RPStreamServer

- (RPStreamServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPStreamServer;
  v2 = -[RPStreamServer init](&v6, sel_init);
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
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __41__RPStreamServer_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __41__RPStreamServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (gLogCategory_RPStreamServer <= 30
    && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  v5 = self->_messenger;
  objc_super v6 = v5;
  if (v5)
  {
    -[RPMessageable setServiceType:](v5, "setServiceType:", self->_serviceType);
    uint64_t v7 = MEMORY[0x1895F87A8];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__RPStreamServer__activateWithCompletion___block_invoke;
    v10[3] = &unk_18A033E80;
    v10[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v6,  "registerRequestID:options:handler:",  @"_streamStart",  0LL,  v10);
    v9[0] = v7;
    v9[1] = 3221225472LL;
    v9[2] = __42__RPStreamServer__activateWithCompletion___block_invoke_2;
    v9[3] = &unk_18A033E80;
    v9[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v6,  "registerRequestID:options:handler:",  @"_streamStop",  0LL,  v9);
    objc_storeStrong(&self->_selfRef, self);
    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    RPErrorF();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v4) {
      ((void (**)(id, void *))v4)[2](v4, v8);
    }
  }
}

uint64_t __42__RPStreamServer__activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleStartRequest:a2 options:a3 responseHandler:a4];
}

uint64_t __42__RPStreamServer__activateWithCompletion___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleStopRequest:a2 options:a3 responseHandler:a4];
}

- (id)description
{
  return -[RPStreamServer descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4 = 0LL;
  v5 = v4;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v12 = v4;
    v11 = serviceType;
    NSAppendPrintF();
    id v7 = v12;

    v5 = v7;
  }

  if (self->_streamQoS)
  {
    NSAppendPrintF();
    id v9 = v5;

    v5 = v9;
  }

  return v5;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__RPStreamServer_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__RPStreamServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPStreamServer <= 30
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", @"_streamStart");
    -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", @"_streamStop");
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_streamSessions,  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_15);
    -[NSMutableDictionary removeAllObjects](self->_streamSessions, "removeAllObjects");
    -[RPStreamServer _invalidated](self, "_invalidated");
  }

uint64_t __29__RPStreamServer__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    uint64_t v3 = MEMORY[0x1895A4770](self->_invalidationHandler);
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    messenger = self->_messenger;
    self->_messenger = 0LL;

    self->_invalidateDone = 1;
    id streamAcceptHandler = self->_streamAcceptHandler;
    self->_id streamAcceptHandler = 0LL;

    id streamPrepareHandler = self->_streamPrepareHandler;
    self->_id streamPrepareHandler = 0LL;

    id streamPrepareHandlerEx = self->_streamPrepareHandlerEx;
    self->_id streamPrepareHandlerEx = 0LL;

    selfRef = self->_selfRef;
    self->_selfRef = 0LL;

    if (gLogCategory_RPStreamServer <= 30
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)_handleStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v46 = 0LL;
  v47 = (id *)&v46;
  uint64_t v48 = 0x3032000000LL;
  v49 = __Block_byref_object_copy__5;
  v50 = __Block_byref_object_dispose__5;
  id v51 = 0LL;
  v43[0] = MEMORY[0x1895F87A8];
  v43[1] = 3221225472LL;
  v43[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke;
  v43[3] = &unk_18A033FA0;
  v45 = &v46;
  id v11 = v10;
  id v44 = v11;
  v12 = (void (**)(void))MEMORY[0x1895A4770](v43);
  v33 = v12;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || (uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(), !(_DWORD)Int64Ranged))
  {
    uint64_t v29 = RPErrorF();
    id v35 = v47[5];
    v47[5] = (id)v29;

    goto LABEL_25;
  }

  v34 = (void *)MEMORY[0x1895A4770](self->_streamAcceptHandler);
  if (!v34)
  {
    uint64_t v30 = RPErrorF();
    v16 = (RPStreamSession *)v47[5];
    v47[5] = (id)v30;
    goto LABEL_24;
  }

  if (gLogCategory_RPStreamServer <= 30
    && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
  {
    else {
      v15 = *(char **)((char *)off_18A0340B0 + (((Int64Ranged << 32) - 0x100000000LL) >> 29));
    }
    v31 = v13;
    v32 = v15;
    LogPrintF();
  }

  v16 = objc_alloc_init(&OBJC_CLASS___RPStreamSession);
  -[RPStreamSession setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
  -[RPStreamSession setMessenger:](v16, "setMessenger:", self->_messenger);
  -[RPStreamSession setStreamID:](v16, "setStreamID:", v13);
  -[RPStreamSession setStreamType:](v16, "setStreamType:", Int64Ranged);
  -[RPStreamSession setServiceType:](v16, "setServiceType:", self->_serviceType);
  -[RPStreamSession setStreamQoS:](v16, "setStreamQoS:", self->_streamQoS);
  id v17 = v8;
  -[RPStreamSession setStreamFlags:]( v16,  "setStreamFlags:",  -[RPStreamSession streamFlags](v16, "streamFlags") | CFDictionaryGetInt64Ranged() & 2);
  id v18 = v11;
  uint64_t v19 = MEMORY[0x1895A4770](self->_streamPrepareHandlerEx);
  v20 = (void *)v19;
  id v21 = v9;
  if (!v19)
  {
    uint64_t v26 = MEMORY[0x1895A4770](self->_streamPrepareHandler);
    v27 = (void *)v26;
    if (v26) {
      (*(void (**)(uint64_t, RPStreamSession *))(v26 + 16))(v26, v16);
    }

    goto LABEL_18;
  }

  v22 = v47;
  id obj = v47[5];
  char v23 = (*(uint64_t (**)(uint64_t, RPStreamSession *, id *))(v19 + 16))(v19, v16, &obj);
  objc_storeStrong(v22 + 5, obj);
  if ((v23 & 1) != 0)
  {
LABEL_18:
    id v9 = v21;
    id v11 = v18;
    id v8 = v17;
    uint64_t v28 = MEMORY[0x1895F87A8];
    if ((self->_streamFlags & 1) != 0
      || (_DWORD)Int64Ranged == 2 && (-[RPStreamSession streamFlags](v16, "streamFlags") & 4) != 0)
    {
      v40[0] = v28;
      v40[1] = 3221225472LL;
      v40[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_2;
      v40[3] = &unk_18A034040;
      v40[4] = v16;
      v40[5] = self;
      int v41 = Int64Ranged;
      v40[6] = v13;
      v40[7] = v34;
      -[RPStreamSession setStreamAcceptHandler:](v16, "setStreamAcceptHandler:", v40, v31, v32);
    }

    v36[0] = v28;
    v36[1] = 3221225472LL;
    v36[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_6;
    v36[3] = &unk_18A034090;
    v36[4] = v16;
    int v39 = Int64Ranged;
    id v37 = v11;
    v38 = v34;
    v36[5] = self;
    v36[6] = v13;
    -[RPStreamSession activateForServerRequest:options:responseHandler:]( v16,  "activateForServerRequest:options:responseHandler:",  v17,  v9,  v36);

    goto LABEL_23;
  }

  uint64_t v24 = RPNestedErrorF();
  id v25 = v47[5];
  v47[5] = (id)v24;

  id v9 = v21;
  id v11 = v18;
  id v8 = v17;
LABEL_23:

  v12 = v33;
LABEL_24:

LABEL_25:
  v12[2](v12);

  _Block_object_dispose(&v46, 8);
}

uint64_t __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_2(int8x16_t *a1)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_3;
  v4[3] = &unk_18A034018;
  int8x16_t v1 = a1[2];
  int8x16_t v5 = vextq_s8(v1, v1, 8uLL);
  __int32 v7 = a1[4].i32[0];
  uint64_t v2 = a1[3].i64[1];
  uint64_t v6 = a1[3].i64[0];
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v1.i64[0], v4);
}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_3( int8x16_t *a1,  void *a2)
{
  id v3 = a2;
  id v4 = *(dispatch_queue_s **)(a1[2].i64[0] + 8);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_4;
  block[3] = &unk_18A033FF0;
  id v7 = v3;
  __int32 v10 = a1[3].i32[2];
  int8x16_t v8 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v9 = a1[3].i64[0];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return [*(id *)(a1 + 40) invalidate];
  }

  else
  {
    uint64_t result = [*(id *)(a1 + 40) streamFlags];
    if ((result & 1) == 0)
    {
      if (*(_DWORD *)(a1 + 64) != 2 || (uint64_t result = [*(id *)(a1 + 40) streamFlags], (result & 4) == 0))
      {
        v3[0] = MEMORY[0x1895F87A8];
        v3[1] = 3221225472LL;
        v3[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_5;
        v3[3] = &unk_18A033FC8;
        __int128 v4 = *(_OWORD *)(a1 + 40);
        uint64_t v5 = *(void *)(a1 + 56);
        return [(id)v4 startServerConnectionWithCompletion:v3];
      }
    }
  }

  return result;
}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    }

    else
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v7);
    }
  }

  else
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 32LL);
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v4;

      id v3 = *(void **)(*(void *)(a1 + 40) + 32LL);
    }

    [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_6( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int32 v10 = v9;
  if (!v7 || v9)
  {
    [*(id *)(a1 + 32) invalidate];
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v13 = *(void *)(a1 + 56);
    if (v10)
    {
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0LL, 0LL, v10);
    }

    else
    {
      RPErrorF();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0LL, 0LL, v14);
    }
  }

  else if ((*(_BYTE *)(*(void *)(a1 + 40) + 40LL) & 1) != 0 {
         || *(_DWORD *)(a1 + 72) == 2 && ([*(id *)(a1 + 32) streamFlags] & 4) != 0)
  }
  {
    (*(void (**)(void, id, void, void))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  v7,  0LL,  0LL);
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_7;
    v15[3] = &unk_18A034068;
    v15[4] = v11;
    uint64_t v12 = *(void *)(a1 + 64);
    id v18 = *(id *)(a1 + 56);
    __int128 v16 = *(_OWORD *)(a1 + 40);
    id v17 = v7;
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v11, v15);
  }
}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    [*(id *)(a1 + 32) invalidate];
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))(*(void *)(a1 + 64));
  }

  else
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 32LL);
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v4;

      id v3 = *(void **)(*(void *)(a1 + 40) + 32LL);
    }

    [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) acceptedByServer];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))(*(void *)(a1 + 64));
  }
}

- (void)_handleStopRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  __int32 v10 = (void (**)(void))a5;
  id v7 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_streamSessions, "objectForKeyedSubscript:", v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_streamSessions,  "setObject:forKeyedSubscript:",  0LL,  v8);
      [v9 invalidate];
      if (gLogCategory_RPStreamServer <= 30
        && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
      {
LABEL_8:
        LogPrintF();
      }
    }

    else if (gLogCategory_RPStreamServer <= 30 {
           && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    }
    {
      goto LABEL_8;
    }
  }

  else
  {
    RPErrorF();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }

  v10[2](v10);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)streamAcceptHandler
{
  return self->_streamAcceptHandler;
}

- (void)setStreamAcceptHandler:(id)a3
{
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_streamFlags = a3;
}

- (id)streamPrepareHandlerEx
{
  return self->_streamPrepareHandlerEx;
}

- (void)setStreamPrepareHandlerEx:(id)a3
{
}

- (id)streamPrepareHandler
{
  return self->_streamPrepareHandler;
}

- (void)setStreamPrepareHandler:(id)a3
{
}

- (int)streamQoS
{
  return self->_streamQoS;
}

- (void)setStreamQoS:(int)a3
{
  self->_streamQoS = a3;
}

- (void).cxx_destruct
{
}

@end