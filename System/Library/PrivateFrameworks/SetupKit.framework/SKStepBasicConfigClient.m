@interface SKStepBasicConfigClient
- (BOOL)_runBasicConfigStart;
- (CUMessaging)skMessaging;
- (NSDictionary)clientConfig;
- (NSDictionary)outServerConfig;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepBasicConfigClient)init;
- (id)skCompletionHandler;
- (void)_completeWithError:(id)a3;
- (void)_invalidated;
- (void)_run;
- (void)activate;
- (void)invalidate;
- (void)setClientConfig:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setOutServerConfig:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepBasicConfigClient

- (SKStepBasicConfigClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKStepBasicConfigClient;
  v2 = -[SKStepBasicConfigClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (NSString)description
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v2;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__SKStepBasicConfigClient_activate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__SKStepBasicConfigClient_invalidate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v5 = (void (**)(id, void *))MEMORY[0x1895CC3E8](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0LL;

    if (v5)
    {
      NSErrorF_safe();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v4);
    }

    self->_invalidateDone = 1;
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  if (v4) {
    int v5 = 3;
  }
  else {
    int v5 = 4;
  }
  self->_runState = v5;
  id v9 = v4;
  if (v4)
  {
    if (gLogCategory_SKStepBasicConfigClient <= 60
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  else if (gLogCategory_SKStepBasicConfigClient <= 30 {
         && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  objc_super v6 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_skCompletionHandler);
  id skCompletionHandler = self->_skCompletionHandler;
  self->_id skCompletionHandler = 0LL;

  if (v6) {
    ((void (**)(void, id))v6)[2](v6, v9);
  }
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      int runState = self->_runState;
      if (runState > 11)
      {
        if (runState == 12)
        {
          if (self->_responseReceived)
          {
            int v5 = 13;
            goto LABEL_14;
          }

          int v5 = 12;
        }

        else
        {
          if (runState != 13) {
            return;
          }
          -[SKStepBasicConfigClient _completeWithError:](self, "_completeWithError:", 0LL);
          int v5 = self->_runState;
        }
      }

      else
      {
        if (!runState)
        {
          int v5 = 11;
          goto LABEL_14;
        }

        if (runState != 11) {
          return;
        }
        BOOL v4 = -[SKStepBasicConfigClient _runBasicConfigStart](self, "_runBasicConfigStart");
        int v5 = self->_runState;
        if (v4)
        {
          ++v5;
LABEL_14:
          self->_int runState = v5;
        }
      }

      if (v5 == runState) {
        return;
      }
      if (gLogCategory_SKStepBasicConfigClient <= 30
        && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }

- (BOOL)_runBasicConfigStart
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[SKStepBasicConfigClient clientConfig](self, "clientConfig");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    [MEMORY[0x189603F90] preferredLanguages];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 firstObject];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"_lang"];
    }

    else if (gLogCategory_SKStepBasicConfigClient <= 90 {
           && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }

    [MEMORY[0x189603F90] currentLocale];
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 localeIdentifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"_locale"];
    }

    else if (gLogCategory_SKStepBasicConfigClient <= 90 {
           && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }

  v8 = self->_skMessaging;
  if (v8)
  {
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    v13 = @"timeoutSeconds";
    v14[0] = &unk_18A289370;
    objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v11);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __47__SKStepBasicConfigClient__runBasicConfigStart__block_invoke;
    v12[3] = &unk_18A282118;
    v12[4] = self;
    -[CUMessaging sendRequestID:requestMessage:options:responseHandler:]( v8,  "sendRequestID:requestMessage:options:responseHandler:",  @"_bsCf",  v3,  v9,  v12);
  }

  else
  {
    NSErrorF_safe();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKStepBasicConfigClient _completeWithError:](self, "_completeWithError:", v9);
  }

  return v8 != 0LL;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setSkCompletionHandler:(id)a3
{
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkMessaging:(id)a3
{
}

- (SKSetupBase)skSetupObject
{
  return (SKSetupBase *)objc_loadWeakRetained((id *)&self->_skSetupObject);
}

- (void)setSkSetupObject:(id)a3
{
}

- (NSDictionary)clientConfig
{
  return self->_clientConfig;
}

- (void)setClientConfig:(id)a3
{
}

- (NSDictionary)outServerConfig
{
  return self->_outServerConfig;
}

- (void)setOutServerConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

void __47__SKStepBasicConfigClient__runBasicConfigStart__block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  v10 = *(_BYTE **)(a1 + 32);
  if (!v10[8])
  {
    id v11 = v15;
    if (!v15 || v8)
    {
      if (v8)
      {
        [*(id *)(a1 + 32) _completeWithError:v8];
      }

      else
      {
        NSErrorF_safe();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 _completeWithError:v12];
      }
    }

    else
    {
      if (gLogCategory_SKStepBasicConfigClient <= 30)
      {
        if (gLogCategory_SKStepBasicConfigClient != -1 || (v13 = _LogCategory_Initialize(), id v11 = v15, v13))
        {
          CUPrintNSObjectOneLine();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          id v11 = v15;
        }
      }

      *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = 1;
      objc_msgSend(*(id *)(a1 + 32), "setOutServerConfig:", v11, v14);
      [*(id *)(a1 + 32) _run];
    }
  }
}

uint64_t __37__SKStepBasicConfigClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

uint64_t __35__SKStepBasicConfigClient_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SKStepBasicConfigClient <= 30
    && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return [*(id *)(a1 + 32) _run];
}

@end