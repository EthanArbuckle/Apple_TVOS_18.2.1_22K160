@interface RPHIDSession
- (RPHIDSession)init;
- (RPMessageable)messenger;
- (void)activateWithCompletion:(id)a3;
- (void)hidCommand:(int)a3 buttonState:(int)a4 destinationID:(id)a5 completion:(id)a6;
- (void)hidCommand:(int)a3 destinationID:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setMessenger:(id)a3;
@end

@implementation RPHIDSession

- (RPHIDSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPHIDSession;
  v2 = -[RPHIDSession init](&v6, sel_init);
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
  v9[2] = __39__RPHIDSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __39__RPHIDSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16LL))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
    }
  }

  else
  {
    RPErrorF();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v6 = v2;
    if (gLogCategory_RPHIDSession <= 90)
    {
      if (gLogCategory_RPHIDSession != -1 || (int v4 = _LogCategory_Initialize(), v2 = v6, v4))
      {
        LogPrintF();
        v2 = v6;
      }
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
      v2 = v6;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__RPHIDSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__RPHIDSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;
}

- (void)hidCommand:(int)a3 destinationID:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v18[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  messenger = self->_messenger;
  v17 = @"_hidC";
  id v10 = (void *)MEMORY[0x189607968];
  id v11 = a4;
  [v10 numberWithInt:v6];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __52__RPHIDSession_hidCommand_destinationID_completion___block_invoke;
  v15[3] = &unk_18A0325E8;
  id v16 = v8;
  id v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_hidC",  v13,  v11,  0LL,  v15);
}

uint64_t __52__RPHIDSession_hidCommand_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)hidCommand:(int)a3 buttonState:(int)a4 destinationID:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  v21[2] = *MEMORY[0x1895F89C0];
  id v10 = a6;
  messenger = self->_messenger;
  v20[0] = @"_hBtS";
  v12 = (void *)MEMORY[0x189607968];
  id v13 = a5;
  [v12 numberWithInt:v7];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = @"_hidC";
  v21[0] = v14;
  [MEMORY[0x189607968] numberWithInt:v8];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  void v18[2] = __64__RPHIDSession_hidCommand_buttonState_destinationID_completion___block_invoke;
  v18[3] = &unk_18A0325E8;
  id v19 = v10;
  id v17 = v10;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_hidC",  v16,  v13,  0LL,  v18);
}

uint64_t __64__RPHIDSession_hidCommand_buttonState_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end