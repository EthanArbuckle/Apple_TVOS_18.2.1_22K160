@interface RPHIDTouchSession
- (CGSize)screenSize;
- (RPHIDTouchSession)init;
- (RPMessageable)messenger;
- (unsigned)flags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidateWithCompletion:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)invalidateWithCompletion:(id)a3;
- (void)sendTouchEvent:(id)a3 completion:(id)a4;
- (void)setFlags:(unsigned int)a3;
- (void)setMessenger:(id)a3;
- (void)setScreenSize:(CGSize)a3;
@end

@implementation RPHIDTouchSession

- (RPHIDTouchSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPHIDTouchSession;
  v2 = -[RPHIDTouchSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_screenSize = (CGSize)vdupq_n_s64(0x408F400000000000uLL);
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
  v9[2] = __44__RPHIDTouchSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __44__RPHIDTouchSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v18[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = self->_messenger;
  if (v5)
  {
    if (gLogCategory_RPHIDTouchSession <= 30
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t flags = self->_flags;
      v14 = &unk_1873E75F8;
      CGFloat width = self->_screenSize.width;
      CGFloat height = self->_screenSize.height;
      LogPrintF();
    }

    v17[0] = @"_tFl";
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  self->_flags,  *(void *)&width,  *(void *)&height,  flags,  v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = @"_height";
    [MEMORY[0x189607968] numberWithDouble:self->_screenSize.height];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    v17[2] = @"_width";
    [MEMORY[0x189607968] numberWithDouble:self->_screenSize.width];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __45__RPHIDTouchSession__activateWithCompletion___block_invoke;
    v15[3] = &unk_18A0335E0;
    v15[4] = self;
    id v16 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( v5,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_touchStart",  v10,  @"rapport:rdid:DirectPeer",  0LL,  v15);
  }

  else
  {
    RPErrorF();
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPHIDTouchSession <= 90
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v6);
    }
  }
}

void __45__RPHIDTouchSession__activateWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPHIDTouchSession <= 90
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v8);
    }
  }

  else
  {
    NSDictionaryGetNSNumber();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16LL), v9);
      if (gLogCategory_RPHIDTouchSession <= 30
        && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      uint64_t v12 = *(void *)(a1 + 40);
      if (v12) {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0LL);
      }
    }

    else
    {
      RPErrorF();
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPHIDTouchSession <= 90
        && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v10);
      }
    }
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__RPHIDTouchSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__RPHIDTouchSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithCompletion:0];
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__RPHIDTouchSession_invalidateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __46__RPHIDTouchSession_invalidateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_invalidateWithCompletion:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (gLogCategory_RPHIDTouchSession <= 30
    && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  touchSessionID = self->_touchSessionID;
  if (touchSessionID)
  {
    id v14 = @"_i";
    v15[0] = touchSessionID;
    id v6 = (void *)MEMORY[0x189603F68];
    id v7 = touchSessionID;
    [v6 dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    messenger = self->_messenger;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __47__RPHIDTouchSession__invalidateWithCompletion___block_invoke;
    v12[3] = &unk_18A0325E8;
    id v13 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_touchStop",  v8,  @"rapport:rdid:DirectPeer",  0LL,  v12);
    id v10 = self->_touchSessionID;
    self->_touchSessionID = 0LL;
  }

  uint64_t v11 = self->_messenger;
  self->_messenger = 0LL;
}

void __47__RPHIDTouchSession__invalidateWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPHIDTouchSession <= 90
      && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPHIDTouchSession <= 30 {
         && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
  }
}

- (void)sendTouchEvent:(id)a3 completion:(id)a4
{
  v21[5] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_messenger;
  if (v8)
  {
    [v6 location];
    uint64_t v10 = (int)(v9 * self->_screenSize.width);
    uint64_t v12 = (int)(v11 * self->_screenSize.height);
    [v6 timestampSeconds];
    v20[0] = @"_ns";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:(unint64_t)(v13 * 1000000000.0)];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v20[1] = @"_tFg";
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v6, "finger"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    v20[2] = @"_tPh";
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v6, "phase"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v16;
    v20[3] = @"_cx";
    [MEMORY[0x189607968] numberWithUnsignedShort:v10];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v17;
    v20[4] = @"_cy";
    [MEMORY[0x189607968] numberWithUnsignedShort:v12];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v18;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:5];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPMessageable sendEventID:event:destinationID:options:completion:]( v8,  "sendEventID:event:destinationID:options:completion:",  @"_hidT",  v19,  @"rapport:rdid:DirectPeer",  0LL,  v7);
  }

  else if (gLogCategory_RPHIDTouchSession <= 90 {
         && (gLogCategory_RPHIDTouchSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (void).cxx_destruct
{
}

@end