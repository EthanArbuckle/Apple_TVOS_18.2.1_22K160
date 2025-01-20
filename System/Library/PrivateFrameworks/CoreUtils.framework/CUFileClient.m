@interface CUFileClient
- (CUFileClient)init;
- (NSString)destinationID;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_completeQuery:(id)a3 response:(id)a4 error:(id)a5;
- (void)_invalidate;
- (void)_invalidated;
- (void)_reportError:(id)a3 where:(const char *)a4;
- (void)_run;
- (void)_runCLinkActivate;
- (void)_runPrepare;
- (void)_runQueries;
- (void)_runQueryResponse:(id)a3 query:(id)a4 error:(id)a5;
- (void)_runSendQuery:(id)a3;
- (void)_runSessionStartRequest;
- (void)_runSessionStartResponse:(id)a3 error:(id)a4;
- (void)_sendKeepAlive:(double)a3;
- (void)_sendSessionStop;
- (void)_sessionTimerFired;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performQuery:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation CUFileClient

- (CUFileClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUFileClient;
  v2 = -[CUFileClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUFileClient;
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
  v4.super_class = (Class)&OBJC_CLASS___CUFileClient;
  -[CUFileClient dealloc](&v4, sel_dealloc);
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
  v7[2] = __39__CUFileClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy__2979;
  v18 = __Block_byref_object_dispose__2980;
  id v19 = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __40__CUFileClient__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_189F32BC0;
  v13 = &v14;
  aBlock[4] = self;
  id v5 = v4;
  id v12 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if (!self->_destinationID || !self->_serviceType)
  {
    uint64_t v9 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
LABEL_9:
    v10 = (void *)v15[5];
    v15[5] = v9;

    goto LABEL_5;
  }

  if (self->_activateCalled)
  {
    uint64_t v9 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5BFLL);
    goto LABEL_9;
  }

  self->_activateCalled = 1;
  v7 = _Block_copy(v5);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = v7;

  -[CUFileClient _run](self, "_run");
LABEL_5:
  v6[2](v6);

  _Block_object_dispose(&v14, 8);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CUFileClient_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
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

    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _invalidate]", 0x1Eu, (uint64_t)"Invalidate", v2, v3, v4, v5, v20);
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_clinkClient
    && !self->_queryArray
    && !self->_currentQuery
    && !self->_sessionID)
  {
    id v12 = _Block_copy(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id v8 = v12;
    if (v12)
    {
      (*((void (**)(void *))v12 + 2))(v12);
      id v8 = v12;
    }

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_14;
    }
    if (ucat->var0 == -1)
    {
      BOOL v10 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
      id v8 = v12;
      if (!v10) {
        goto LABEL_14;
      }
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _invalidated]",  0x1Eu,  (uint64_t)"Invalidated",  v4,  v5,  v6,  v7,  v11);
    id v8 = v12;
LABEL_14:
  }

- (void)performQuery:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __29__CUFileClient_performQuery___block_invoke;
  v7[3] = &unk_189F33088;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_completeQuery:(id)a3 response:(id)a4 error:(id)a5
{
  id v19 = (CUFileQuery *)a3;
  id v8 = a4;
  id v13 = a5;
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (v13)
  {
    if (var0 > 90) {
      goto LABEL_12;
    }
    char v16 = (char)v19;
    if (var0 != -1) {
      goto LABEL_4;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      char v16 = (char)v19;
LABEL_4:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _completeQuery:response:error:]",  0x5Au,  (uint64_t)"### Query failed: %@, %{error}",  v9,  v10,  v11,  v12,  v16);
    }
  }

  else
  {
    if (var0 > 30) {
      goto LABEL_12;
    }
    char v17 = (char)v19;
    if (var0 == -1)
    {
      ucat = self->_ucat;
      char v17 = (char)v19;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _completeQuery:response:error:]",  0x1Eu,  (uint64_t)"Query completed: %@, %@",  v9,  v10,  v11,  v12,  v17);
  }

- (void)_reportError:(id)a3 where:(const char *)a4
{
  char v4 = (char)a4;
  id v13 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _reportError:where:]",  0x5Au,  (uint64_t)"### Error: %s, %{error}",  v6,  v7,  v8,  v9,  v4);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_sendKeepAlive:(double)a3
{
  v17[1] = *MEMORY[0x1895F89C0];
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    char v9 = LOBYTE(a3);
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _sendKeepAlive:]",  0x14u,  (uint64_t)"Keep alive request: %.3f delta seconds",  v3,  v4,  v5,  v6,  v9);
  }

- (void)_sendSessionStop
{
  v19[1] = *MEMORY[0x1895F89C0];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _sendSessionStop]",  0x1Eu,  (uint64_t)"Session stop",  v2,  v3,  v4,  v5,  v13);
  }

- (void)_sessionTimerFired
{
  uint64_t v7 = mach_absolute_time() - self->_lastRequestTicks;
  if (sUpTicksToSecondsOnce != -1) {
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  }
  double v8 = 15.0 - *(double *)&sUpTicksToSecondsMultiplier * (double)v7;
  if (v8 <= 45.0)
  {
    -[CUFileClient _sendKeepAlive:](self, "_sendKeepAlive:");
    double v8 = 15.0;
  }

  else
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 20)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _sessionTimerFired]",  0x14u,  (uint64_t)"Keep alive deferred: %.3f seconds",  v3,  v4,  v5,  v6,  SLOBYTE(v8));
    }
  }

- (void)_run
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          unint64_t state = self->_state;
          switch((int)state)
          {
            case 0:
              int v8 = 10;
              break;
            case 10:
              self->_unint64_t state = 11;
              -[CUFileClient _runCLinkActivate](self, "_runCLinkActivate");
              goto LABEL_15;
            case 11:
              if (!self->_clinkActivated) {
                goto LABEL_15;
              }
              int v8 = 12;
              break;
            case 12:
              self->_unint64_t state = 13;
              -[CUFileClient _runSessionStartRequest](self, "_runSessionStartRequest");
              goto LABEL_15;
            case 13:
              if (!self->_sessionID) {
                goto LABEL_15;
              }
              int v8 = 14;
              break;
            case 14:
              self->_unint64_t state = 15;
              -[CUFileClient _runPrepare](self, "_runPrepare");
              goto LABEL_15;
            case 15:
              -[CUFileClient _runQueries](self, "_runQueries");
              goto LABEL_15;
            default:
              goto LABEL_15;
          }

          self->_unint64_t state = v8;
LABEL_15:
          if (self->_state == state) {
            return;
          }
          ucat = self->_ucat;
        }

        while (ucat->var0 > 30);
        if (ucat->var0 == -1) {
          break;
        }
LABEL_18:
        uint64_t v10 = "?";
        if (state <= 0xF) {
          uint64_t v10 = off_189F30F98[state];
        }
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _run]",  0x1Eu,  (uint64_t)"State: %s -> %s",  v2,  v3,  v4,  v5,  (char)v10);
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_18;
      }
    }
  }

- (void)_runCLinkActivate
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _runCLinkActivate]",  0x1Eu,  (uint64_t)"CLink activate start",  v2,  v3,  v4,  v5,  v13[0]);
  }

- (void)_runSessionStartRequest
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _runSessionStartRequest]",  0x1Eu,  (uint64_t)"Session start request",  v2,  v3,  v4,  v5,  v11);
  }

- (void)_runSessionStartResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  id v19 = (id *)&v18;
  uint64_t v20 = 0x3032000000LL;
  __int128 v21 = __Block_byref_object_copy__2979;
  __int128 v22 = __Block_byref_object_dispose__2980;
  id v23 = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __47__CUFileClient__runSessionStartResponse_error___block_invoke;
  aBlock[3] = &unk_189F30F30;
  aBlock[4] = self;
  void aBlock[5] = &v18;
  int v8 = (void (**)(void))_Block_copy(aBlock);
  if (v6 && !v7)
  {
    NSDictionaryGetNSNumber(v6, (uint64_t)@"sid", 0LL);
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      uint64_t v15 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
      id v16 = v19[5];
      v19[5] = (id)v15;

      char v9 = 0LL;
      goto LABEL_9;
    }

    objc_storeStrong((id *)&self->_sessionID, v9);
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _runSessionStartResponse:error:]",  0x1Eu,  (uint64_t)"Session started: ID %@",  v10,  v11,  v12,  v13,  (char)v9);
    }

- (void)_runPrepare
{
  p_sessionTimer = (id *)&self->_sessionTimer;
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    uint64_t v5 = sessionTimer;
    dispatch_source_cancel(v5);
    id v6 = *p_sessionTimer;
    id *p_sessionTimer = 0LL;
  }

  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong(p_sessionTimer, v7);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __27__CUFileClient__runPrepare__block_invoke;
  v11[3] = &unk_189F33088;
  v11[4] = v7;
  v11[5] = self;
  dispatch_source_set_event_handler(v7, v11);
  dispatch_time_t v8 = dispatch_time(0LL, 15000000000LL);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
  dispatch_activate(v7);
  char v9 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v9) {
    v9[2](v9, 0LL);
  }
}

- (void)_runQueries
{
  p_currentQuery = &self->_currentQuery;
  if (!self->_currentQuery)
  {
    -[NSMutableArray popFirstObject](self->_queryArray, "popFirstObject");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      uint64_t v5 = v4;
      objc_storeStrong((id *)p_currentQuery, v4);
      -[CUFileClient _runSendQuery:](self, "_runSendQuery:", v5);
      uint64_t v4 = v5;
    }
  }

- (void)_runSendQuery:(id)a3
{
  v20[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileClient _runSendQuery:]",  0x1Eu,  (uint64_t)"Query start: %@",  v4,  v5,  v6,  v7,  (char)v8);
  }

- (void)_runQueryResponse:(id)a3 query:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  if (!v11 || v10)
  {
    if (v10)
    {
      -[CUFileClient _completeQuery:response:error:](self, "_completeQuery:response:error:", v9, 0LL, v10);
    }

    else
    {
      NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D4LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUFileClient _completeQuery:response:error:](self, "_completeQuery:response:error:", v9, 0LL, v14);
    }
  }

  else
  {
    id v15 = 0LL;
    uint64_t v12 = -[CUFileResponse initWithDictionary:error:]( objc_alloc(&OBJC_CLASS___CUFileResponse),  "initWithDictionary:error:",  v11,  &v15);
    id v13 = v15;
    -[CUFileClient _completeQuery:response:error:](self, "_completeQuery:response:error:", v9, v12, v13);
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

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __30__CUFileClient__runSendQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runQueryResponse:a2 query:*(void *)(a1 + 40) error:a4];
}

void *__27__CUFileClient__runPrepare__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[10]) {
    return (void *)[result _sessionTimerFired];
  }
  return result;
}

uint64_t __47__CUFileClient__runSessionStartResponse_error___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  uint64_t v9 = *(void *)(*(void *)(v8 + 8) + 40LL);
  if (v9)
  {
    uint64_t v10 = result;
    id v11 = *(uint64_t **)(result + 32);
    uint64_t v12 = (int *)v11[12];
    if (*v12 <= 90)
    {
      if (*v12 == -1)
      {
        BOOL v13 = _LogCategory_Initialize(v11[12], 0x5Au);
        id v11 = *(uint64_t **)(v10 + 32);
        uint64_t v8 = *(void *)(v10 + 40);
        if (!v13) {
          return [v11 _reportError:*(void *)(*(void *)(v8 + 8) + 40) where:"Session start"];
        }
        uint64_t v12 = (int *)v11[12];
        uint64_t v9 = *(void *)(*(void *)(v8 + 8) + 40LL);
      }

      LogPrintF( (uint64_t)v12,  (uint64_t)"-[CUFileClient _runSessionStartResponse:error:]_block_invoke",  0x5Au,  (uint64_t)"### Session start failed: %{error}",  a5,  a6,  a7,  a8,  v9);
      id v11 = *(uint64_t **)(v10 + 32);
      uint64_t v8 = *(void *)(v10 + 40);
    }

    return [v11 _reportError:*(void *)(*(void *)(v8 + 8) + 40) where:"Session start"];
  }

  return result;
}

uint64_t __39__CUFileClient__runSessionStartRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runSessionStartResponse:error:", a2);
}

uint64_t __33__CUFileClient__runCLinkActivate__block_invoke(uint64_t result)
{
  v1 = *(void **)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 == *(void **)(v2 + 32))
  {
    uint64_t v3 = result;
    *(void *)(v2 + 32) = 0LL;

    return [*(id *)(v3 + 40) _invalidated];
  }

  return result;
}

void __33__CUFileClient__runCLinkActivate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 32LL))
  {
    id v16 = v3;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v10 = *(int **)(v9 + 96);
      if (*v10 <= 90)
      {
        if (*v10 == -1)
        {
          BOOL v13 = _LogCategory_Initialize((uint64_t)v10, 0x5Au);
          uint64_t v9 = *(void *)(a1 + 40);
          if (!v13) {
            goto LABEL_10;
          }
          uint64_t v10 = *(int **)(v9 + 96);
        }

        LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileClient _runCLinkActivate]_block_invoke_2",  0x5Au,  (uint64_t)"### CLink activate failed: %{error}",  v4,  v5,  v6,  v7,  (char)v8);
        uint64_t v9 = *(void *)(a1 + 40);
      }

void __32__CUFileClient__sendSessionStop__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v12 = a4;
  uint64_t v13 = *(void *)(a1 + 32);
  BOOL v14 = *(int **)(v13 + 96);
  if (*v14 <= 30)
  {
    if (*v14 == -1)
    {
      BOOL v15 = _LogCategory_Initialize((uint64_t)v14, 0x1Eu);
      uint64_t v13 = *(void *)(a1 + 32);
      if (!v15) {
        goto LABEL_5;
      }
      BOOL v14 = *(int **)(v13 + 96);
    }

    LogPrintF( (uint64_t)v14,  (uint64_t)"-[CUFileClient _sendSessionStop]_block_invoke",  0x1Eu,  (uint64_t)"Session stop response: %{error}",  v8,  v9,  v10,  v11,  (char)v12);
    uint64_t v13 = *(void *)(a1 + 32);
  }

void __31__CUFileClient__sendKeepAlive___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v12 = a4;
  uint64_t v13 = *(int **)(*(void *)(a1 + 32) + 96LL);
  if (*v13 <= 20)
  {
    if (*v13 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)v13,  (uint64_t)"-[CUFileClient _sendKeepAlive:]_block_invoke",  0x14u,  (uint64_t)"Keep alive response: %##@, %{error}",  v8,  v9,  v10,  v11,  (char)v14);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)v13, 0x14u))
    {
      uint64_t v13 = *(int **)(*(void *)(a1 + 32) + 96LL);
      goto LABEL_3;
    }
  }

void __29__CUFileClient_performQuery___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  char a9)
{
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = *(void *)(a1 + 40);
  if (!v10)
  {
    id v17 = *(int **)(v15 + 96);
    if (*v17 > 90) {
      return;
    }
    if (*v17 == -1)
    {
      id v17 = *(int **)(*(void *)(a1 + 40) + 96LL);
    }

    LogPrintF( (uint64_t)v17,  (uint64_t)"-[CUFileClient performQuery:]_block_invoke",  0x5Au,  (uint64_t)"### Query without completion",  v11,  v12,  v13,  v14,  a9);
    return;
  }

  if (*(_BYTE *)(v15 + 40))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFEEA14LL);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v15 _completeQuery:v16 response:0 error:v22];
  }

  else
  {
    id v18 = *(void **)(v15 + 56);
    if (!v18)
    {
      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v20 = *(void *)(a1 + 40);
      __int128 v21 = *(void **)(v20 + 56);
      *(void *)(v20 + 56) = v19;

      id v18 = *(void **)(*(void *)(a1 + 40) + 56LL);
    }

    [v18 addObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _run];
  }

uint64_t __26__CUFileClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __40__CUFileClient__activateWithCompletion___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    uint64_t v9 = (void *)result;
    uint64_t v10 = *(int **)(*(void *)(result + 32) + 96LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(v9[4] + 96LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileClient _activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

uint64_t __39__CUFileClient_activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (int *)v9[12];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void **)(a1 + 32);
      if (!v11) {
        return [v9 _activateWithCompletion:*(void *)(a1 + 40)];
      }
      uint64_t v10 = (int *)v9[12];
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileClient activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)"Activate",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void **)(a1 + 32);
  }

  return [v9 _activateWithCompletion:*(void *)(a1 + 40)];
}

@end