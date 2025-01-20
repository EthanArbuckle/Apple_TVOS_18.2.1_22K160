@interface SKStepBasicConfigServer
- (CUMessaging)skMessaging;
- (NSDictionary)outClientConfig;
- (NSDictionary)serverConfig;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepBasicConfigServer)init;
- (id)skCompletionHandler;
- (void)_activate;
- (void)_completeWithError:(id)a3;
- (void)_handleRequestBasicConfig:(id)a3 responseHandler:(id)a4;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setOutClientConfig:(id)a3;
- (void)setServerConfig:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepBasicConfigServer

- (SKStepBasicConfigServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKStepBasicConfigServer;
  v2 = -[SKStepBasicConfigServer init](&v6, sel_init);
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
  block[2] = __35__SKStepBasicConfigServer_activate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  skMessaging = self->_skMessaging;
  if (skMessaging)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __36__SKStepBasicConfigServer__activate__block_invoke;
    v7[3] = &unk_18A2822E8;
    v7[4] = skMessaging;
    v7[5] = self;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __36__SKStepBasicConfigServer__activate__block_invoke_2;
    v6[3] = &unk_18A282310;
    v6[4] = skMessaging;
    v6[5] = self;
    v4 = skMessaging;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:]( v4,  "registerRequestID:options:requestHandler:completionHandler:",  @"_bsCf",  0LL,  v7,  v6);
  }

  else
  {
    NSErrorF_safe();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SKStepBasicConfigServer _completeWithError:](self, "_completeWithError:", v5);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__SKStepBasicConfigServer_invalidate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v5 = (void (**)(id, void *))MEMORY[0x1895CC3E8](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0LL;

    if (v5)
    {
      NSErrorF_safe();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v4);
    }

    self->_invalidateDone = 1;
    if (gLogCategory_SKStepBasicConfigServer <= 30
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (gLogCategory_SKStepBasicConfigServer <= 90
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  else if (gLogCategory_SKStepBasicConfigServer <= 30 {
         && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  id v5 = (void (**)(void, void, void, void, void))MEMORY[0x1895CC3E8](self->_responseHandler);
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = 0LL;

  if (v5)
  {
    if (v4) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = MEMORY[0x189604A60];
    }
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __46__SKStepBasicConfigServer__completeWithError___block_invoke;
    v9[3] = &unk_18A282310;
    v9[4] = self;
    id v10 = v4;
    ((void (**)(void, uint64_t, void, id, void *))v5)[2](v5, v7, 0LL, v10, v9);
  }
}

- (void)_handleRequestBasicConfig:(id)a3 responseHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (gLogCategory_SKStepBasicConfigServer <= 30
    && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

  -[SKStepBasicConfigServer setOutClientConfig:](self, "setOutClientConfig:", v13, v12);
  uint64_t v7 = -[SKEventBasicConfigUpdated initWithBasicConfig:]( objc_alloc(&OBJC_CLASS___SKEventBasicConfigUpdated),  "initWithBasicConfig:",  v13);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_skSetupObject);
  [WeakRetained _reportEvent:v7];

  uint64_t v9 = -[SKStepBasicConfigServer serverConfig](self, "serverConfig");
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x189604A60];
  }
  (*((void (**)(id, uint64_t, void, void, void *))v6 + 2))(v6, v11, 0LL, 0LL, &__block_literal_global_14);
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

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
{
}

- (NSDictionary)outClientConfig
{
  return self->_outClientConfig;
}

- (void)setOutClientConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

void __46__SKStepBasicConfigServer__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void (**)(void, void))MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 32) + 32LL));
  if (v3)
  {
    if (*(void *)(a1 + 40)) {
      id v4 = *(id *)(a1 + 40);
    }
    else {
      id v4 = v5;
    }
    ((void (**)(void, id))v3)[2](v3, v4);
  }
}

void __37__SKStepBasicConfigServer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    if (gLogCategory_SKStepBasicConfigServer <= 30
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    id v6 = (id)MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 32) + 16LL));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0LL;

    if (v6)
    {
      NSErrorF_safe();
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void *, void *))v6 + 2))( v6,  0LL,  0LL,  v5,  &__block_literal_global_2349);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) deregisterRequestID:@"_bsCf" completionHandler:&__block_literal_global_9];
    [*(id *)(a1 + 32) _invalidated];
  }

void *__36__SKStepBasicConfigServer__activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v6 == result[5]) {
    return (void *)[result _handleRequestBasicConfig:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepBasicConfigServer__activate__block_invoke_2(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    result = (void *)result[5];
    if (v2 == result[5]) {
      return (void *)[result _completeWithError:a2];
    }
  }

  return result;
}

uint64_t __35__SKStepBasicConfigServer_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SKStepBasicConfigServer <= 30
    && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return [*(id *)(a1 + 32) _activate];
}

@end