@interface CUMobileDeviceSession
- (CUMobileDevice)peerDevice;
- (CUMobileDeviceSession)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)promptForPINHandler;
- (void)_invalidated;
- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)_unpairWithCompletion:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)unpairWithCompletion:(id)a3;
@end

@implementation CUMobileDeviceSession

- (CUMobileDeviceSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUMobileDeviceSession;
  v2 = -[CUMobileDeviceSession init](&v4, sel_init);
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
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__CUMobileDeviceSession_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__CUMobileDeviceSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (!self->_invalidateCalled
    && gLogCategory_CUMobileDeviceSession <= 50
    && (gLogCategory_CUMobileDeviceSession != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x32u)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceSession,  (uint64_t)"-[CUMobileDeviceSession _invalidated]",  0x32u,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v14);
  }

  if (!self->_mdRunLoopThread)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v8 = self->_invalidationHandler;
    }

    else
    {
      id v8 = 0LL;
    }

    self->_invalidationHandler = 0LL;

    id promptForPINHandler = self->_promptForPINHandler;
    self->_id promptForPINHandler = 0LL;

    if (gLogCategory_CUMobileDeviceSession <= 30
      && (gLogCategory_CUMobileDeviceSession != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceSession,  (uint64_t)"-[CUMobileDeviceSession _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v10,  v11,  v12,  v13,  v15);
    }
  }

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_189F31390;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__CUMobileDeviceSession__pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_189F34300;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__CUMobileDeviceSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_189F31390;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__CUMobileDeviceSession__pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_189F34300;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)unpairWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_unpairWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__CUMobileDeviceSession__unpairWithCompletion___block_invoke;
  block[3] = &unk_189F34300;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (CUMobileDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __47__CUMobileDeviceSession__unpairWithCompletion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x189607870];
    uint64_t v3 = *MEMORY[0x189607670];
    uint64_t v15 = *MEMORY[0x1896075E0];
    id v4 = (void *)NSString;
    if (MEMORY[0x18960EFF0] && (uint64_t v5 = CUErrorCodesTableGet(), (v6 = *(const char **)(v5 + 8)) != 0LL))
    {
      if (*(_DWORD *)v5 != -6735)
      {
        id v7 = (const char **)(v5 + 24);
        id v6 = "";
        while (1)
        {
          id v8 = *v7;
          if (!*v7) {
            break;
          }
          int v9 = *((_DWORD *)v7 - 2);
          v7 += 2;
          if (v9 == -6735)
          {
            id v6 = v8;
            break;
          }
        }
      }
    }

    else
    {
      id v6 = "";
    }

    uint64_t v10 = [v4 stringWithUTF8String:v6];
    unsigned int v11 = (void *)v10;
    uint64_t v12 = @"?";
    if (v10) {
      uint64_t v12 = (const __CFString *)v10;
    }
    v16[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 errorWithDomain:v3 code:-6735 userInfo:v13];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);
  }

void __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke_2;
  v4[3] = &unk_189F33060;
  v4[4] = v1;
  id v5 = v2;
  [v3 performBlock:v4];
}

uint64_t __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unpairWithCompletion:*(void *)(a1 + 40)];
}

void __57__CUMobileDeviceSession__pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x189607870];
  uint64_t v3 = *MEMORY[0x189607670];
  uint64_t v15 = *MEMORY[0x1896075E0];
  id v4 = (void *)NSString;
  if (MEMORY[0x18960EFF0] && (uint64_t v5 = CUErrorCodesTableGet(), (v6 = *(const char **)(v5 + 8)) != 0LL))
  {
    if (*(_DWORD *)v5 != -6735)
    {
      id v7 = (const char **)(v5 + 24);
      id v6 = "";
      while (1)
      {
        id v8 = *v7;
        if (!*v7) {
          break;
        }
        int v9 = *((_DWORD *)v7 - 2);
        v7 += 2;
        if (v9 == -6735)
        {
          id v6 = v8;
          break;
        }
      }
    }
  }

  else
  {
    id v6 = "";
  }

  uint64_t v10 = [v4 stringWithUTF8String:v6];
  unsigned int v11 = (void *)v10;
  uint64_t v12 = @"?";
  if (v10) {
    uint64_t v12 = (const __CFString *)v10;
  }
  v16[0] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 errorWithDomain:v3 code:-6735 userInfo:v13];
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);
}

void __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1895F87A8];
  v4[2] = __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke_2;
  v4[3] = &unk_189F31390;
  v4[1] = 3221225472LL;
  v4[4] = v1;
  int v6 = *(_DWORD *)(a1 + 48);
  id v5 = v2;
  [v3 performBlock:v4];
}

uint64_t __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairVerifyWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __41__CUMobileDeviceSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupTryPIN:*(void *)(a1 + 40)];
}

void __56__CUMobileDeviceSession__pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x189607870];
  uint64_t v3 = *MEMORY[0x189607670];
  uint64_t v15 = *MEMORY[0x1896075E0];
  id v4 = (void *)NSString;
  if (MEMORY[0x18960EFF0] && (uint64_t v5 = CUErrorCodesTableGet(), (v6 = *(const char **)(v5 + 8)) != 0LL))
  {
    if (*(_DWORD *)v5 != -6735)
    {
      id v7 = (const char **)(v5 + 24);
      int v6 = "";
      while (1)
      {
        id v8 = *v7;
        if (!*v7) {
          break;
        }
        int v9 = *((_DWORD *)v7 - 2);
        v7 += 2;
        if (v9 == -6735)
        {
          int v6 = v8;
          break;
        }
      }
    }
  }

  else
  {
    int v6 = "";
  }

  uint64_t v10 = [v4 stringWithUTF8String:v6];
  unsigned int v11 = (void *)v10;
  uint64_t v12 = @"?";
  if (v10) {
    uint64_t v12 = (const __CFString *)v10;
  }
  v16[0] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 errorWithDomain:v3 code:-6735 userInfo:v13];
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);
}

void __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1895F87A8];
  v4[2] = __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke_2;
  v4[3] = &unk_189F31390;
  v4[1] = 3221225472LL;
  v4[4] = v1;
  int v6 = *(_DWORD *)(a1 + 48);
  id v5 = v2;
  [v3 performBlock:v4];
}

uint64_t __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __35__CUMobileDeviceSession_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (!*(_BYTE *)(*(void *)(result + 32) + 9LL))
  {
    uint64_t v8 = result;
    if (gLogCategory_CUMobileDeviceSession <= 30
      && (gLogCategory_CUMobileDeviceSession != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceSession,  (uint64_t)"-[CUMobileDeviceSession invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v10);
    }

    *(_BYTE *)(*(void *)(v8 + 32) + 9LL) = 1;
    int v9 = *(id **)(v8 + 32);
    if (v9[2]) {
      return [v9[2] invalidate];
    }
    else {
      return [v9 _invalidated];
    }
  }

  return result;
}

uint64_t __33__CUMobileDeviceSession_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUMobileDeviceSession <= 30
    && (gLogCategory_CUMobileDeviceSession != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceSession,  (uint64_t)"-[CUMobileDeviceSession activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v14);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  int v9 = objc_alloc_init(&OBJC_CLASS___CURunLoopThread);
  uint64_t v10 = *(void *)(a1 + 32);
  unsigned int v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  [*(id *)(*(void *)(a1 + 32) + 16) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  [(id)objc_opt_class() description];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 16) setLabel:v12];

  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __33__CUMobileDeviceSession_activate__block_invoke_2;
  v15[3] = &unk_189F34238;
  uint64_t v16 = *(void *)(a1 + 32);
  [*(id *)(v16 + 16) setInvalidationHandler:v15];
  return [*(id *)(*(void *)(a1 + 32) + 16) activate];
}

uint64_t __33__CUMobileDeviceSession_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

@end