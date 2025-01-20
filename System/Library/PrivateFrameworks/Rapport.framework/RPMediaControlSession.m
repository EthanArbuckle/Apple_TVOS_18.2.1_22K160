@interface RPMediaControlSession
- (RPMediaControlSession)init;
- (RPMessageable)messenger;
- (id)mediaControlFlagsChangedHandler;
- (unint64_t)mediaControlFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleMediaControlEvent:(id)a3;
- (void)_invalidate;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)mediaCaptionSettingGetFromDestinationID:(id)a3 completion:(id)a4;
- (void)mediaCaptionSettingSet:(int)a3 destinationID:(id)a4 completion:(id)a5;
- (void)mediaCommand:(int)a3 destinationID:(id)a4 completion:(id)a5;
- (void)mediaGetVolumeFromDestinationID:(id)a3 completion:(id)a4;
- (void)mediaSetVolume:(double)a3 destinationID:(id)a4 completion:(id)a5;
- (void)mediaSkipBySeconds:(double)a3 destinationID:(id)a4 completion:(id)a5;
- (void)setMediaControlFlagsChangedHandler:(id)a3;
- (void)setMessenger:(id)a3;
@end

@implementation RPMediaControlSession

- (RPMediaControlSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPMediaControlSession;
  v2 = -[RPMediaControlSession init](&v6, sel_init);
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
  v9[2] = __48__RPMediaControlSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __48__RPMediaControlSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v10[2] = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void))a3;
  if (self->_messenger)
  {
    if (self->_mediaControlFlagsChangedHandler)
    {
      v9[0] = @"interest";
      v9[1] = @"statusFlags";
      v10[0] = MEMORY[0x189604A88];
      v10[1] = &unk_18A04E008;
      [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:2];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      messenger = self->_messenger;
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __49__RPMediaControlSession__activateWithCompletion___block_invoke;
      v8[3] = &unk_18A033968;
      v8[4] = self;
      -[RPMessageable registerEventID:options:handler:]( messenger,  "registerEventID:options:handler:",  @"_iMC",  v5,  v8);
      self->_registeredMediaControlInterest = 1;
    }

    if (gLogCategory_RPMediaControlSession <= 30
      && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    RPErrorF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPMediaControlSession <= 90
      && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v4) {
      ((void (**)(id, void *))v4)[2](v4, v7);
    }
  }
}

uint64_t __49__RPMediaControlSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleMediaControlEvent:a2];
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__RPMediaControlSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPMediaControlSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPMediaControlSession <= 30
      && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (self->_registeredMediaControlInterest)
    {
      -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", @"_iMC");
      self->_registeredMediaControlInterest = 0;
    }

    id mediaControlFlagsChangedHandler = self->_mediaControlFlagsChangedHandler;
    self->_id mediaControlFlagsChangedHandler = 0LL;

    messenger = self->_messenger;
    self->_messenger = 0LL;
  }

- (void)_handleMediaControlEvent:(id)a3
{
  unint64_t Int64 = CFDictionaryGetInt64();
  if (gLogCategory_RPMediaControlSession <= 30
    && (gLogCategory_RPMediaControlSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (!v7 && Int64 != self->_mediaControlFlags)
  {
    self->_mediaControlFlags = Int64;
    uint64_t v5 = MEMORY[0x1895A4770](self->_mediaControlFlagsChangedHandler);
    objc_super v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }
  }

- (void)mediaCaptionSettingGetFromDestinationID:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  messenger = self->_messenger;
  v14 = @"_mcc";
  v15[0] = &unk_18A04E020;
  id v8 = (void *)MEMORY[0x189603F68];
  id v9 = a3;
  [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __76__RPMediaControlSession_mediaCaptionSettingGetFromDestinationID_completion___block_invoke;
  v12[3] = &unk_18A0325E8;
  id v13 = v6;
  id v11 = v6;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_mcc",  v10,  v9,  0LL,  v12);
}

void __76__RPMediaControlSession_mediaCaptionSettingGetFromDestinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v5 = a4;
  CFDictionaryGetInt64Ranged();
  if (!v5 && v6)
  {
    RPErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)mediaCaptionSettingSet:(int)a3 destinationID:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v18[2] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  messenger = self->_messenger;
  v17[0] = @"_mcc";
  v17[1] = @"_mcs";
  v18[0] = &unk_18A04E038;
  id v10 = (void *)MEMORY[0x189607968];
  id v11 = a4;
  [v10 numberWithInt:v6];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  void v15[2] = __73__RPMediaControlSession_mediaCaptionSettingSet_destinationID_completion___block_invoke;
  v15[3] = &unk_18A0325E8;
  id v16 = v8;
  id v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_mcc",  v13,  v11,  0LL,  v15);
}

uint64_t __73__RPMediaControlSession_mediaCaptionSettingSet_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)mediaCommand:(int)a3 destinationID:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v18[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  messenger = self->_messenger;
  v17 = @"_mcc";
  id v10 = (void *)MEMORY[0x189607968];
  id v11 = a4;
  [v10 numberWithInt:v6];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  void v15[2] = __63__RPMediaControlSession_mediaCommand_destinationID_completion___block_invoke;
  v15[3] = &unk_18A0325E8;
  id v16 = v8;
  id v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_mcc",  v13,  v11,  0LL,  v15);
}

uint64_t __63__RPMediaControlSession_mediaCommand_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)mediaSkipBySeconds:(double)a3 destinationID:(id)a4 completion:(id)a5
{
  void v18[2] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  messenger = self->_messenger;
  v17[0] = @"_mcc";
  v17[1] = @"_skpS";
  v18[0] = &unk_18A04E050;
  id v10 = (void *)MEMORY[0x189607968];
  id v11 = a4;
  [v10 numberWithDouble:a3];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  void v15[2] = __69__RPMediaControlSession_mediaSkipBySeconds_destinationID_completion___block_invoke;
  v15[3] = &unk_18A0325E8;
  id v16 = v8;
  id v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_mcc",  v13,  v11,  0LL,  v15);
}

uint64_t __69__RPMediaControlSession_mediaSkipBySeconds_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)mediaGetVolumeFromDestinationID:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  messenger = self->_messenger;
  id v14 = @"_mcc";
  v15[0] = &unk_18A04E068;
  id v8 = (void *)MEMORY[0x189603F68];
  id v9 = a3;
  [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __68__RPMediaControlSession_mediaGetVolumeFromDestinationID_completion___block_invoke;
  v12[3] = &unk_18A0325E8;
  id v13 = v6;
  id v11 = v6;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_mcc",  v10,  v9,  0LL,  v12);
}

void __68__RPMediaControlSession_mediaGetVolumeFromDestinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v5 = a4;
  CFDictionaryGetDouble();
  double v7 = v6;
  if (!v5 && v8)
  {
    RPErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(double))(*(void *)(a1 + 32) + 16LL))(v7);
}

- (void)mediaSetVolume:(double)a3 destinationID:(id)a4 completion:(id)a5
{
  v19[2] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  messenger = self->_messenger;
  v18[0] = @"_mcc";
  v18[1] = @"_vol";
  v19[0] = &unk_18A04E080;
  id v10 = (void *)MEMORY[0x189607968];
  id v11 = a4;
  [v10 numberWithDouble:a3];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  void v15[2] = __65__RPMediaControlSession_mediaSetVolume_destinationID_completion___block_invoke;
  v15[3] = &unk_18A033990;
  double v17 = a3;
  id v16 = v8;
  id v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_mcc",  v13,  v11,  0LL,  v15);
}

void __65__RPMediaControlSession_mediaSetVolume_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v5 = a4;
  CFDictionaryGetDouble();
  if (!v5 && v8) {
    v6.n128_u64[0] = *(void *)(a1 + 40);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, __n128))(v7 + 16))(v7, v5, v6);
  }
}

- (unint64_t)mediaControlFlags
{
  return self->_mediaControlFlags;
}

- (id)mediaControlFlagsChangedHandler
{
  return self->_mediaControlFlagsChangedHandler;
}

- (void)setMediaControlFlagsChangedHandler:(id)a3
{
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