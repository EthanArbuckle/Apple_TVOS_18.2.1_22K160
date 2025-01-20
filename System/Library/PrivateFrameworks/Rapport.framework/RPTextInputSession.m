@interface RPTextInputSession
- (RPMessageable)messenger;
- (RPTextInputSession)init;
- (RTIInputSystemSourceSession)rtiSession;
- (id)rtiUpdatedHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleTextInputChange:(id)a3 started:(BOOL)a4;
- (void)_handleTextInputStarted:(id)a3;
- (void)_handleTextInputStopped:(id)a3;
- (void)_invalidate;
- (void)activateWithCompletion:(id)a3;
- (void)handleTextActionPayload:(id)a3;
- (void)invalidate;
- (void)performDocumentRequest:(id)a3 completion:(id)a4;
- (void)setMessenger:(id)a3;
- (void)setRtiUpdatedHandler:(id)a3;
@end

@implementation RPTextInputSession

- (RPTextInputSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPTextInputSession;
  v2 = -[RPTextInputSession init](&v6, sel_init);
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
  v9[2] = __45__RPTextInputSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __45__RPTextInputSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = self->_messenger;
  if (v5)
  {
    if (gLogCategory_RPTextInputSession <= 30
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v17 = @"statusFlags";
    v18[0] = &unk_18A04E110;
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = MEMORY[0x1895F87A8];
    messenger = self->_messenger;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke;
    v16[3] = &unk_18A033968;
    v16[4] = self;
    -[RPMessageable registerEventID:options:handler:]( messenger,  "registerEventID:options:handler:",  @"_tiStarted",  v7,  v16);
    id v10 = self->_messenger;
    v15[0] = v8;
    v15[1] = 3221225472LL;
    v15[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_2;
    v15[3] = &unk_18A033968;
    v15[4] = self;
    -[RPMessageable registerEventID:options:handler:]( v10,  "registerEventID:options:handler:",  @"_tiStopped",  v7,  v15);
    v11 = self->_messenger;
    v14[0] = v8;
    v14[1] = 3221225472LL;
    v14[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_3;
    v14[3] = &unk_18A033968;
    v14[4] = self;
    -[RPMessageable registerEventID:options:handler:](v11, "registerEventID:options:handler:", @"_tiC", v7, v14);
    self->_started = 1;
    v12[0] = v8;
    v12[1] = 3221225472LL;
    v12[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_4;
    v12[3] = &unk_18A0335E0;
    v12[4] = self;
    id v13 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( v5,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_tiStart",  MEMORY[0x189604A60],  @"rapport:rdid:DirectPeer",  0LL,  v12);
  }

  else
  {
    RPErrorF();
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v6);
    }
  }
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputStarted:a2];
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputStopped:a2];
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputChange:a2 started:0];
}

void __46__RPTextInputSession__activateWithCompletion___block_invoke_4( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
LABEL_13:
    }
      (*(void (**)(uint64_t))(v9 + 16))(v9);
  }

  else
  {
    if (gLogCategory_RPTextInputSession <= 30
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    [*(id *)(a1 + 32) _handleTextInputChange:v10 started:1];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      goto LABEL_13;
    }
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__RPTextInputSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPTextInputSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", @"_tiStarted");
  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", @"_tiStopped");
  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", @"_tiC");
  if (self->_started)
  {
    self->_started = 0;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( self->_messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_tiStop",  MEMORY[0x189604A60],  @"rapport:rdid:DirectPeer",  0LL,  &__block_literal_global_17);
  }

  messenger = self->_messenger;
  self->_messenger = 0LL;

  -[RTIInputSystemSourceSession setPayloadDelegate:](self->_rtiSession, "setPayloadDelegate:", 0LL);
  rtiSession = self->_rtiSession;
  self->_rtiSession = 0LL;

  id rtiUpdatedHandler = self->_rtiUpdatedHandler;
  self->_id rtiUpdatedHandler = 0LL;
}

void __33__RPTextInputSession__invalidate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPTextInputSession <= 30 {
         && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

- (void)_handleTextInputStarted:(id)a3
{
  id v6 = a3;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [v4 length];
    LogPrintF();
  }

  -[RPTextInputSession _handleTextInputChange:started:](self, "_handleTextInputChange:started:", v6, 1LL, v5);
}

- (void)_handleTextInputStopped:(id)a3
{
  id v8 = a3;
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (self->_rtiSession)
  {
    -[objc_class payloadWithData:](getRTIDataPayloadClass(), "payloadWithData:", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIInputSystemSourceSession handleTextActionPayload:](self->_rtiSession, "handleTextActionPayload:", v4);
    -[RTIInputSystemSourceSession setPayloadDelegate:](self->_rtiSession, "setPayloadDelegate:", 0LL);
    rtiSession = self->_rtiSession;
    self->_rtiSession = 0LL;

    uint64_t v6 = MEMORY[0x1895A4770](self->_rtiUpdatedHandler);
    id v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
  }
}

- (void)_handleTextInputChange:(id)a3 started:(BOOL)a4
{
  id v15 = a3;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
    -[objc_class payloadWithData:version:](getRTIDataPayloadClass(), "payloadWithData:version:", v6, Int64Ranged);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!a4
        && gLogCategory_RPTextInputSession <= 20
        && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v14 = [v6 length];
        LogPrintF();
      }

      rtiSession = self->_rtiSession;
      if (!rtiSession)
      {
        id v10 = (RTIInputSystemSourceSession *)objc_alloc_init(getRTIInputSystemSourceSessionClass());
        v11 = self->_rtiSession;
        self->_rtiSession = v10;

        -[RTIInputSystemSourceSession setPayloadDelegate:](self->_rtiSession, "setPayloadDelegate:", self);
        uint64_t v12 = MEMORY[0x1895A4770](self->_rtiUpdatedHandler);
        id v13 = (void *)v12;
        if (v12) {
          (*(void (**)(uint64_t))(v12 + 16))(v12);
        }

        rtiSession = self->_rtiSession;
      }

      -[RTIInputSystemSourceSession handleTextActionPayload:](rtiSession, "handleTextActionPayload:", v8, v14);
    }

    else if (gLogCategory_RPTextInputSession <= 60 {
           && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
}

- (void)handleTextActionPayload:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__RPTextInputSession_handleTextActionPayload___block_invoke;
  v7[3] = &unk_18A031AE8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__RPTextInputSession_handleTextActionPayload___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  [*(id *)(a1 + 32) data];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v3, "version"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v4 forKeyedSubscript:@"_tiV"];
  }

  if (v2) {
    [v6 setObject:v2 forKeyedSubscript:@"_tiD"];
  }
  if (gLogCategory_RPTextInputSession <= 10
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [v2 length];
    LogPrintF();
  }

  objc_msgSend( *(id *)(*(void *)(a1 + 40) + 24),  "sendEventID:event:destinationID:options:completion:",  @"_tiC",  v6,  @"rapport:rdid:DirectPeer",  0,  &__block_literal_global_42,  v5);
}

void __46__RPTextInputSession_handleTextActionPayload___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2
    && gLogCategory_RPTextInputSession <= 90
    && ((v5 = v2, gLogCategory_RPTextInputSession != -1) || (int v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();
  }

  else
  {
  }

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_RPTextInputSession <= 90
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (RTIInputSystemSourceSession)rtiSession
{
  return self->_rtiSession;
}

- (id)rtiUpdatedHandler
{
  return self->_rtiUpdatedHandler;
}

- (void)setRtiUpdatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end