@interface CUVoiceSession
- (CUVoiceSession)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (void)_completeAllRequestsWithError:(id)a3;
- (void)_completeRequest:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_processQueuedRequests;
- (void)_speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completion:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)speakText:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completionHandler:(id)a6;
- (void)stopSpeaking;
@end

@implementation CUVoiceSession

- (CUVoiceSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUVoiceSession;
  v2 = -[CUVoiceSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUVoiceSession;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)&OBJC_CLASS___CUVoiceSession;
  -[CUVoiceSession dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__CUVoiceSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __38__CUVoiceSession_invalidateWithFlags___block_invoke;
  v4[3] = &unk_189F32F60;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_invalidate
{
  uint64_t v3 = -[CUVoiceRequest speechRequest](self->_currentRequest, "speechRequest");
  id v8 = (id)v3;
  id v14 = (id)v3;
  if ((self->_invalidateFlags & 2) == 0 || !self->_currentRequest)
  {
    if (!v3)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUVoiceSession _completeAllRequestsWithError:](self, "_completeAllRequestsWithError:", v11);

      goto LABEL_13;
    }

    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
        id v8 = v14;
        if (!v12) {
          goto LABEL_12;
        }
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUVoiceSession _invalidate]",  0x1Eu,  (uint64_t)"Stop speaking for invalidate\n",  v4,  v5,  v6,  v7,  v13);
      id v8 = v14;
    }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }

    else
    {
      id v4 = 0LL;
    }

    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUVoiceSession _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v5,  v6,  v7,  v8,  v10);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }

- (void)speakText:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
}

- (void)speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__CUVoiceSession_speakText_flags_volume_completionHandler___block_invoke;
  block[3] = &unk_189F32E18;
  block[4] = self;
  id v16 = v10;
  unsigned int v19 = a4;
  double v18 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)_speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v39 = a3;
  id v14 = a6;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    if (IsAppleInternalBuild_sOnce != -1) {
      dispatch_once(&IsAppleInternalBuild_sOnce, &__block_literal_global_85);
    }
    if (IsAppleInternalBuild_sIsInternal) {
      LOBYTE(v16) = (_BYTE)v39;
    }
    else {
      id v16 = @"*";
    }
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUVoiceSession _speakText:flags:volume:completion:]",  0x1Eu,  (uint64_t)"Scheduling speaking '%@'\n",  v10,  v11,  v12,  v13,  (char)v16);
  }

- (void)stopSpeaking
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUVoiceSession_stopSpeaking__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_processQueuedRequests
{
  p_currentRequest = &self->_currentRequest;
  if (!self->_currentRequest)
  {
    -[NSMutableArray popFirstObject](self->_requests, "popFirstObject");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_15:

      return;
    }

    objc_storeStrong((id *)p_currentRequest, v4);
    [v4 speechRequest];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_14:

      goto LABEL_15;
    }

    if (IsAppleInternalBuild_sOnce != -1) {
      dispatch_once(&IsAppleInternalBuild_sOnce, &__block_literal_global_85);
    }
    if (IsAppleInternalBuild_sIsInternal)
    {
      [v9 text];
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v10 = @"*";
    }

    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUVoiceSession _processQueuedRequests]",  0x1Eu,  (uint64_t)"Start speaking text '%@'\n",  v5,  v6,  v7,  v8,  (char)v10);
    }

- (void)_completeAllRequestsWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_requests;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CUVoiceSession _completeRequest:error:]( self,  "_completeRequest:error:",  *(void *)(*((void *)&v10 + 1) + 8 * v9++),  v4,  (void)v10);
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  uint64_t v8 = (CUVoiceRequest *)a3;
  id v6 = a4;
  if (self->_currentRequest == v8)
  {
    self->_currentRequest = 0LL;
  }

  -[CUVoiceRequest completion](v8, "completion");
  uint64_t v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CUVoiceRequest setCompletion:](v8, "setCompletion:", 0LL);
    ((void (**)(void, id))v7)[2](v7, v6);
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

- (void).cxx_destruct
{
}

uint64_t __40__CUVoiceSession__processQueuedRequests__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40LL);
  if (*(int *)result <= 30)
  {
    if (*(_DWORD *)result != -1) {
      return LogPrintF( result,  (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke",  0x1Eu,  (uint64_t)"DidStartSpeakingRequest '%@'\n",  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
    }
    uint64_t result = _LogCategory_Initialize(result, 0x1Eu);
    if ((_DWORD)result)
    {
      uint64_t result = *(void *)(*(void *)(a1 + 32) + 40LL);
      return LogPrintF( result,  (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke",  0x1Eu,  (uint64_t)"DidStartSpeakingRequest '%@'\n",  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
    }
  }

  return result;
}

void __40__CUVoiceSession__processQueuedRequests__block_invoke_2(void *a1, void *a2)
{
  id v24 = a2;
  uint64_t v7 = a1[4];
  uint64_t v8 = *(int **)(v7 + 40);
  if (*v8 <= 30)
  {
    if (*v8 == -1)
    {
      BOOL v9 = _LogCategory_Initialize((uint64_t)v8, 0x1Eu);
      uint64_t v7 = a1[4];
      if (!v9) {
        goto LABEL_5;
      }
      uint64_t v8 = *(int **)(v7 + 40);
    }

    LogPrintF( (uint64_t)v8,  (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke_2",  0x1Eu,  (uint64_t)"Did finish speaking text '%@', finished %s, error %{error}\n",  v3,  v4,  v5,  v6,  a1[5]);
    uint64_t v7 = a1[4];
  }

void __30__CUVoiceSession_stopSpeaking__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(int **)(v7 + 40);
    uint64_t v11 = v2;
    if (*v8 <= 30)
    {
      if (*v8 == -1)
      {
        BOOL v9 = _LogCategory_Initialize((uint64_t)v8, 0x1Eu);
        uint64_t v7 = *(void *)(a1 + 32);
        if (!v9) {
          goto LABEL_6;
        }
        uint64_t v8 = *(int **)(v7 + 40);
      }

      LogPrintF( (uint64_t)v8,  (uint64_t)"-[CUVoiceSession stopSpeaking]_block_invoke",  0x1Eu,  (uint64_t)"Stop speaking\n",  v3,  v4,  v5,  v6,  v10);
      uint64_t v7 = *(void *)(a1 + 32);
    }

uint64_t __59__CUVoiceSession_speakText_flags_volume_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speakText:*(void *)(a1 + 40) flags:*(unsigned int *)(a1 + 64) volume:*(void *)(a1 + 48) completion:*(double *)(a1 + 56)];
}

uint64_t __38__CUVoiceSession_invalidateWithFlags___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 16))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 16) = 1;
    uint64_t v10 = *(void *)(result + 32);
    uint64_t v11 = *(int **)(v10 + 40);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        uint64_t v10 = *(void *)(v9 + 32);
        if (!v12) {
          goto LABEL_6;
        }
        uint64_t v11 = *(int **)(v10 + 40);
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUVoiceSession invalidateWithFlags:]_block_invoke",  0x1Eu,  (uint64_t)"InvalidateWithFlags: %#{flags}\n",  a5,  a6,  a7,  a8,  *(_DWORD *)(v9 + 40));
      uint64_t v10 = *(void *)(v9 + 32);
    }

uint64_t __28__CUVoiceSession_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 16))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 16) = 1;
    uint64_t v10 = *(void **)(result + 32);
    uint64_t v11 = (int *)v10[5];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        uint64_t v10 = *(void **)(v9 + 32);
        if (!v12) {
          return [v10 _invalidate];
        }
        uint64_t v11 = (int *)v10[5];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUVoiceSession invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v13);
      uint64_t v10 = *(void **)(v9 + 32);
    }

    return [v10 _invalidate];
  }

  return result;
}

@end