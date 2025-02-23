@interface RPLegacySession
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPDevice)peerDevice;
- (RPLegacySession)init;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)promptForPINHandler;
- (int)_runMobileDeviceStart;
- (int)_runPairVerify;
- (unsigned)securityFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_cleanup;
- (void)_invalidate;
- (void)_invalidated;
- (void)_pairSetupTryPIN:(id)a3;
- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)_run;
- (void)_sendQueuedMessages;
- (void)_unpairWithCompletion:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)requestSystemInfoWithCompletion:(id)a3;
- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setSecurityFlags:(unsigned int)a3;
- (void)setServiceType:(id)a3;
- (void)unpairWithCompletion:(id)a3;
@end

@implementation RPLegacySession

- (RPLegacySession)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPLegacySession;
  v2 = -[RPLegacySession init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPLegacySession;
  -[RPLegacySession dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0LL;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0LL;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0LL;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__RPLegacySession_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__RPLegacySession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v13 = (void (**)(id, void *))a3;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (!self->_invalidateCalled && !self->_activateCalled)
  {
    serviceType = self->_serviceType;
    if (serviceType)
    {
      self->_activateCalled = 1;
      if (-[NSString isEqual:](serviceType, "isEqual:", @"RPLegacyServiceTypeMobileDevice"))
      {
        -[RPDevice mobileDevice](self->_peerDevice, "mobileDevice");
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          -[RPDevice pairedPeer](self->_peerDevice, "pairedPeer");
          id v6 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 info];
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 objectForKeyedSubscript:@"udid"];
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10) {
            goto LABEL_11;
          }
          id v5 = objc_alloc_init(MEMORY[0x18960ED38]);
          [v5 setUdid:v10];
          -[RPDevice setMobileDevice:](self->_peerDevice, "setMobileDevice:", v5);

          if (!v5) {
            goto LABEL_12;
          }
        }

        self->_mdEnabled = 1;
        id v6 = v5;
LABEL_11:

LABEL_12:
        -[RPLegacySession _run](self, "_run");
        v7 = 0LL;
LABEL_23:
        id v8 = v13;
        goto LABEL_24;
      }
    }
  }

  RPErrorF();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v13;
  if (v7)
  {
    if (gLogCategory_RPLegacySupport <= 60)
    {
      if (gLogCategory_RPLegacySupport != -1 || (v11 = _LogCategory_Initialize(), id v8 = v13, v11))
      {
        LogPrintF();
        id v8 = v13;
      }
    }

    id errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      errorHandler[2](errorHandler, v7);
      goto LABEL_23;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__RPLegacySession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__RPLegacySession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  self->_invalidateCalled = 1;
  -[CUMobileDeviceSession invalidate](self->_mdSession, "invalidate");
  -[RPLegacySession _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (!self->_mdSession)
    {
      id invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler) {
        invalidationHandler[2]();
      }
      -[RPLegacySession _cleanup](self, "_cleanup");
      self->_invalidateDone = 1;
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    if (!self->_mdEnabled
      || (int v3 = -[RPLegacySession _runMobileDeviceStart](self, "_runMobileDeviceStart"), v3 == 4)
      || v3 == 2)
    {
      if ((self->_securityFlags & 2) != 0
        || (int v4 = -[RPLegacySession _runPairVerify](self, "_runPairVerify"), v4 == 4)
        || v4 == 2)
      {
        if (gLogCategory_RPLegacySupport <= 30
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        self->_messagingReady = 1;
        -[RPLegacySession _sendQueuedMessages](self, "_sendQueuedMessages");
      }
    }
  }

- (int)_runMobileDeviceStart
{
  int mdState = self->_mdState;
  if (mdState != 4 && mdState != 2)
  {
    if (mdState)
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }

    else
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      self->_int mdState = 1;
      id v5 = (CUMobileDeviceSession *)objc_alloc_init(MEMORY[0x18960ED48]);
      mdSession = self->_mdSession;
      self->_mdSession = v5;

      -[CUMobileDeviceSession setDispatchQueue:](self->_mdSession, "setDispatchQueue:", self->_dispatchQueue);
      v7 = -[RPDevice mobileDevice](self->_peerDevice, "mobileDevice");
      -[CUMobileDeviceSession setPeerDevice:](self->_mdSession, "setPeerDevice:", v7);

      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __40__RPLegacySession__runMobileDeviceStart__block_invoke;
      v9[3] = &unk_18A031A30;
      v9[4] = self;
      -[CUMobileDeviceSession setInvalidationHandler:](self->_mdSession, "setInvalidationHandler:", v9);
      -[CUMobileDeviceSession setPromptForPINHandler:]( self->_mdSession,  "setPromptForPINHandler:",  self->_promptForPINHandler);
      -[CUMobileDeviceSession activate](self->_mdSession, "activate");
      self->_int mdState = 4;
    }
  }

  return self->_mdState;
}

_BYTE *__40__RPLegacySession__runMobileDeviceStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  result = *(_BYTE **)(a1 + 32);
  if (result[9]) {
    return (_BYTE *)[result _invalidated];
  }
  return result;
}

- (int)_runPairVerify
{
  int pairVerifyState = self->_pairVerifyState;
  if (pairVerifyState != 4 && pairVerifyState != 2)
  {
    if (pairVerifyState)
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }

    else
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      uint64_t v5 = MEMORY[0x1895F87A8];
      self->_int pairVerifyState = 1;
      v7[0] = v5;
      v7[1] = 3221225472LL;
      v7[2] = __33__RPLegacySession__runPairVerify__block_invoke;
      v7[3] = &unk_18A031AC0;
      v7[4] = self;
      -[RPLegacySession pairVerifyWithFlags:completion:](self, "pairVerifyWithFlags:completion:", 8LL, v7);
    }
  }

  return self->_pairVerifyState;
}

void __33__RPLegacySession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!v3)
  {
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 28LL) = 4;
    [*(id *)(a1 + 32) _run];
    goto LABEL_13;
  }

  int v4 = v3;
  if (gLogCategory_RPLegacySupport <= 30)
  {
    if (gLogCategory_RPLegacySupport != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      LogPrintF();
      int v4 = v7;
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 28LL) = 3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 88LL);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
LABEL_13:
    int v4 = v7;
  }
}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__RPLegacySession_pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_18A031C28;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__RPLegacySession_pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (self->_mdEnabled && (mdSession = self->_mdSession) != 0LL)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __50__RPLegacySession__pairSetupWithFlags_completion___block_invoke;
    v10[3] = &unk_18A032290;
    v10[4] = self;
    id v11 = v6;
    -[CUMobileDeviceSession pairSetupWithFlags:completion:](mdSession, "pairSetupWithFlags:completion:", v4, v10);
  }

  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v7)[2](v7, v9);
  }
}

uint64_t __50__RPLegacySession__pairSetupWithFlags_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 1;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__RPLegacySession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__RPLegacySession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)_pairSetupTryPIN:(id)a3
{
  if (self->_mdEnabled) {
    -[CUMobileDeviceSession pairSetupTryPIN:](self->_mdSession, "pairSetupTryPIN:", a3);
  }
}

- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__RPLegacySession_pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_18A031C28;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __50__RPLegacySession_pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairVerifyWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (self->_mdEnabled && (mdSession = self->_mdSession) != 0LL)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __51__RPLegacySession__pairVerifyWithFlags_completion___block_invoke;
    v10[3] = &unk_18A032290;
    v10[4] = self;
    id v11 = v6;
    -[CUMobileDeviceSession pairVerifyWithFlags:completion:](mdSession, "pairVerifyWithFlags:completion:", v4, v10);
  }

  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v7)[2](v7, v9);
  }
}

uint64_t __51__RPLegacySession__pairVerifyWithFlags_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 1;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)unpairWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__RPLegacySession_unpairWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __40__RPLegacySession_unpairWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unpairWithCompletion:*(void *)(a1 + 40)];
}

- (void)_unpairWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = (void (**)(void, void))v4;
  if (self->_mdEnabled && (mdSession = self->_mdSession) != 0LL)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __41__RPLegacySession__unpairWithCompletion___block_invoke;
    v8[3] = &unk_18A031B10;
    id v9 = v4;
    -[CUMobileDeviceSession unpairWithCompletion:](mdSession, "unpairWithCompletion:", v8);
  }

  else
  {
    RPErrorF();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

uint64_t __41__RPLegacySession__unpairWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__RPLegacySession_sendRequestID_options_request_responseHandler___block_invoke;
  block[3] = &unk_18A033920;
  id v20 = v12;
  id v21 = v11;
  v23 = self;
  id v24 = v13;
  id v22 = v10;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(dispatchQueue, block);
}

void __65__RPLegacySession_sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(&OBJC_CLASS___RPLegacySessionMessage);
  -[RPLegacySessionMessage setMessage:](v6, "setMessage:", *(void *)(a1 + 32));
  -[RPLegacySessionMessage setOptions:](v6, "setOptions:", *(void *)(a1 + 40));
  -[RPLegacySessionMessage setRequestID:](v6, "setRequestID:", *(void *)(a1 + 48));
  -[RPLegacySessionMessage setResponseHandler:](v6, "setResponseHandler:", *(void *)(a1 + 64));
  uint64_t v2 = *(void **)(*(void *)(a1 + 56) + 16LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v4 = *(void *)(a1 + 56);
    int v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 56) + 16LL);
  }

  [v2 addObject:v6];
  [*(id *)(a1 + 56) _sendQueuedMessages];
}

- (void)_sendQueuedMessages
{
  if (self->_messagingReady)
  {
    uint64_t v3 = -[NSMutableArray firstObject](self->_messageSendQueue, "firstObject");
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      do
      {
        -[NSMutableArray removeObjectAtIndex:](self->_messageSendQueue, "removeObjectAtIndex:", 0LL);
        -[RPLegacySession _sendMessage:](self, "_sendMessage:", v4);

        -[NSMutableArray firstObject](self->_messageSendQueue, "firstObject");
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      }

      while (v4);
    }
  }

- (void)requestSystemInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __51__RPLegacySession_requestSystemInfoWithCompletion___block_invoke;
  v6[3] = &unk_18A0325E8;
  id v7 = v4;
  id v5 = v4;
  -[RPLegacySession sendRequestID:options:request:responseHandler:]( self,  "sendRequestID:options:request:responseHandler:",  @"_systemInfo",  &unk_18A04E1A8,  MEMORY[0x189604A60],  v6);
}

uint64_t __51__RPLegacySession_requestSystemInfoWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (RPDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (unsigned)securityFlags
{
  return self->_securityFlags;
}

- (void)setSecurityFlags:(unsigned int)a3
{
  self->_securityFlags = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
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

@end