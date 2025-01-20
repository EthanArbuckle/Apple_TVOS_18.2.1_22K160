@interface SKConnection
- (BOOL)clientMode;
- (BOOL)conditionalPersistent;
- (BOOL)persistentPairing;
- (BOOL)reversePairing;
- (CBConnection)bleConnection;
- (NSData)pskData;
- (NSString)description;
- (NSString)label;
- (NSString)password;
- (OS_dispatch_queue)dispatchQueue;
- (SKConnection)init;
- (SKDevice)blePeerDevice;
- (id)authCompletionHandler;
- (id)authHidePasswordHandler;
- (id)authPromptHandler;
- (id)authShowPasswordHandler;
- (id)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 error:(id *)a8;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)pairSetupConfigHandler;
- (id)receivedEventHandler;
- (id)receivedRequestHandler;
- (id)sendDataHandler;
- (id)stateChangedHandler;
- (int)passwordType;
- (int)state;
- (unsigned)bluetoothUseCase;
- (void)_abortRequestsWithError:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_clientConnectCompleted:(id)a3;
- (void)_clientConnectStart;
- (void)_clientConnectStartBLE;
- (void)_clientError:(id)a3;
- (void)_clientPairSetupCompleted:(id)a3;
- (void)_clientPairSetupContinueWithData:(id)a3;
- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 passwordType:(int)a4 throttleSeconds:(int)a5;
- (void)_clientPairSetupStart;
- (void)_clientPairSetupStartReverse;
- (void)_clientPairVerifyCompleted:(id)a3;
- (void)_clientPairVerifyStart;
- (void)_clientPairVerifyWithData:(id)a3;
- (void)_clientRun;
- (void)_invalidateCore:(id)a3;
- (void)_invalidateWithError:(id)a3;
- (void)_invalidated;
- (void)_pairSetupInvalidate;
- (void)_pairVerifyInvalidate;
- (void)_processSends;
- (void)_pskPrepareClientMode:(BOOL)a3;
- (void)_receiveCompletion:(id)a3;
- (void)_receiveStart:(id)a3;
- (void)_receivedEvent:(id)a3;
- (void)_receivedHeader:(id *)a3 body:(id)a4;
- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4;
- (void)_receivedHeader:(id *)a3 unencryptedObjectData:(id)a4;
- (void)_receivedObject:(id)a3;
- (void)_receivedRequest:(id)a3;
- (void)_receivedResponse:(id)a3;
- (void)_run;
- (void)_sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4;
- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4;
- (void)_sendHeaderData:(id)a3 bodyData:(id)a4 completion:(id)a5;
- (void)_sendRequestID:(id)a3 request:(id)a4 options:(id)a5 sendEntry:(id)a6 responseHandler:(id)a7;
- (void)_sendResponse:(id)a3 error:(id)a4 xid:(id)a5 requestID:(id)a6 completion:(id)a7;
- (void)_serverAccept;
- (void)_serverAcceptBLE;
- (void)_serverError:(id)a3;
- (void)_serverPairSetupCompleted:(id)a3;
- (void)_serverPairSetupContinueWithData:(id)a3 start:(BOOL)a4;
- (void)_serverPairVerifyCompleted:(id)a3;
- (void)_serverPairVerifyContinueWithData:(id)a3 start:(BOOL)a4;
- (void)_serverRun;
- (void)_timeoutForSendEntry:(id)a3;
- (void)_timeoutForXID:(id)a3;
- (void)_updateExternalState;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)receivedData:(id)a3;
- (void)sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAuthHidePasswordHandler:(id)a3;
- (void)setAuthPromptHandler:(id)a3;
- (void)setAuthShowPasswordHandler:(id)a3;
- (void)setBleConnection:(id)a3;
- (void)setBlePeerDevice:(id)a3;
- (void)setBluetoothUseCase:(unsigned int)a3;
- (void)setClientMode:(BOOL)a3;
- (void)setConditionalPersistent:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPairSetupConfigHandler:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPersistentPairing:(BOOL)a3;
- (void)setPskData:(id)a3;
- (void)setReceivedEventHandler:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setReversePairing:(BOOL)a3;
- (void)setSendDataHandler:(id)a3;
- (void)setState:(int)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)tryPassword:(id)a3;
- (void)updatePasswordType:(int)a3;
@end

@implementation SKConnection

- (SKConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKConnection;
  v2 = -[SKConnection init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    sendArray = v3->_sendArray;
    v3->_sendArray = v4;

    v3->_ucat = (LogCategory *)&gLogCategory_SKConnection;
    RandomBytes();
    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKConnection;
  -[SKConnection dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  int v18 = 12;
  v3 = self->_label;
  uint64_t v17 = 0LL;
  CUAppendF();
  id v16 = 0LL;
  CUAppendF();
  id v4 = v16;

  v15[3] = v4;
  CUAppendF();
  id v5 = v4;

  v15[2] = v5;
  CUAppendF();
  id v6 = v5;

  v15[1] = v6;
  CUAppendF();
  v7 = (__CFString *)v6;

  if (self->_bleConnection)
  {
    v15[0] = v7;
    objc_super v8 = (id *)v15;
  }

  else if (self->_blePeerDevice)
  {
    v14 = v7;
    objc_super v8 = (id *)&v14;
  }

  else
  {
    if (!self->_sendDataHandler) {
      goto LABEL_8;
    }
    v13 = v7;
    objc_super v8 = (id *)&v13;
  }

  CUAppendF();
  v9 = (__CFString *)*v8;

  v7 = v9;
LABEL_8:
  if (v7) {
    v10 = v7;
  }
  else {
    v10 = &stru_18A2823D0;
  }
  v11 = v10;

  return (NSString *)v11;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];

  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __39__SKConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A281C28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy__229;
  v23 = __Block_byref_object_dispose__230;
  id v24 = 0LL;
  uint64_t v12 = MEMORY[0x1895F87A8];
  uint64_t v13 = 3221225472LL;
  v14 = __40__SKConnection__activateWithCompletion___block_invoke;
  v15 = &unk_18A281F78;
  int v18 = &v19;
  id v16 = self;
  id v5 = v4;
  id v17 = v5;
  id v6 = (void (**)(void))MEMORY[0x1895CC3E8](&v12);
  if (self->_activateCalled || self->_invalidateCalled) {
    goto LABEL_14;
  }
  if (self->_blePeerDevice)
  {
    self->_clientMode = 1;
    goto LABEL_8;
  }

  bleConnection = self->_bleConnection;
  if (bleConnection)
  {
    self->_clientMode = 0;
    objc_storeStrong((id *)&self->_requestable, bleConnection);
    goto LABEL_8;
  }

  if (!self->_sendDataHandler)
  {
LABEL_14:
    uint64_t v9 = NSErrorF_safe();
    v10 = (void *)v20[5];
    v20[5] = v9;

    goto LABEL_13;
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__SKConnection_invalidate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    id v8 = v4;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    -[SKConnection _invalidateCore:](self, "_invalidateCore:", v8, v7);
    -[SKConnection _invalidated](self, "_invalidated");
    id v5 = v8;
  }
}

- (void)_invalidateCore:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = (NSError *)a3;
  startTimer = self->_startTimer;
  if (startTimer)
  {
    id v6 = startTimer;
    dispatch_source_cancel(v6);
    v7 = self->_startTimer;
    self->_startTimer = 0LL;
  }

  -[CBConnection invalidate](self->_bleConnection, "invalidate");
  if (self->_showPasswordCalled)
  {
    self->_showPasswordCalled = 0;
    uint64_t v8 = MEMORY[0x1895CC3E8](self->_authHidePasswordHandler);
    uint64_t v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
  }

  stepError = v4;
  v27 = v4;
  if (v4 || (stepError = self->_stepError) != 0LL)
  {
    v11 = stepError;
  }

  else
  {
    NSErrorF_safe();
    v11 = (NSError *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = v11;
  -[SKConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v11);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  obj = self->_sendArray;
  uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        int var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          [v17 requestID];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = (uint64_t)v19;
          if (!v19)
          {
            uint64_t v20 = [v17 eventID];
            v28 = (void *)v20;
          }

          CUPrintNSError();
          uint64_t v25 = v20;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

          if (!v19) {
        }
          }

        objc_msgSend(v17, "timer", v25, v26);
        uint64_t v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
        [v17 setTimer:0];
        if (v21) {
          dispatch_source_cancel(v21);
        }
        [v17 completion];
        v22 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        [v17 setCompletion:0];
        if (v22)
        {
          ((void (**)(void, NSError *))v22)[2](v22, v12);
        }

        else
        {
          [v17 responseHandler];
          v23 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          [v17 setResponseHandler:0];
          if (v23) {
            ((void (**)(void, void, void, NSError *))v23)[2](v23, 0LL, 0LL, v12);
          }
        }

        ++v16;
      }

      while (v14 != v16);
      uint64_t v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
      uint64_t v14 = v24;
    }

    while (v24);
  }

  -[NSMutableArray removeAllObjects](self->_sendArray, "removeAllObjects");
}

- (void)_invalidated
{
  if (!self->_invalidateDone && !self->_bleConnection)
  {
    -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
    -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
    startTimer = self->_startTimer;
    if (startTimer)
    {
      id v4 = startTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_startTimer;
      self->_startTimer = 0LL;
    }

    uint64_t v20 = MEMORY[0x1895CC3E8](self->_invalidationHandler);
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0LL;

    id authShowPasswordHandler = self->_authShowPasswordHandler;
    self->_id authShowPasswordHandler = 0LL;

    id authHidePasswordHandler = self->_authHidePasswordHandler;
    self->_id authHidePasswordHandler = 0LL;

    id authPromptHandler = self->_authPromptHandler;
    self->_id authPromptHandler = 0LL;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id pairSetupConfigHandler = self->_pairSetupConfigHandler;
    self->_id pairSetupConfigHandler = 0LL;

    id receivedEventHandler = self->_receivedEventHandler;
    self->_id receivedEventHandler = 0LL;

    id receivedRequestHandler = self->_receivedRequestHandler;
    self->_id receivedRequestHandler = 0LL;

    id sendDataHandler = self->_sendDataHandler;
    self->_id sendDataHandler = 0LL;

    id stateChangedHandler = self->_stateChangedHandler;
    self->_id stateChangedHandler = 0LL;

    id v17 = (void *)v20;
    self->_invalidateDone = 1;
    if (v20)
    {
      (*(void (**)(uint64_t))(v20 + 16))(v20);
      id v17 = (void *)v20;
    }

    int var0 = self->_ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v19 = _LogCategory_Initialize(), id v17 = (void *)v20, v19))
      {
        LogPrintF();
        id v17 = (void *)v20;
      }
    }
  }

- (id)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 error:(id *)a8
{
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    uint64_t v15 = pairSetupSession;
  }

  else
  {
    uint64_t v15 = self->_pairVerifySession;
    if (!v15)
    {
      if (a8)
      {
        NSErrorF_safe();
        id v17 = 0LL;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v17 = 0LL;
      }

      return v17;
    }
  }

  id v16 = [objc_alloc(MEMORY[0x189603FB8]) initWithLength:a7];
  if (-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]( v15,  "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:",  a3,  a4,  a5,  a6,  a7,  [v16 mutableBytes]))
  {
    if (a8)
    {
      NSErrorF_safe();
      id v17 = 0LL;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v17 = 0LL;
    }
  }

  else
  {
    id v17 = v16;
  }

  return v17;
}

- (void)_pairSetupInvalidate
{
  authThrottleTimer = self->_authThrottleTimer;
  if (authThrottleTimer)
  {
    id v4 = authThrottleTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_authThrottleTimer;
    self->_authThrottleTimer = 0LL;
  }

  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", 0LL);
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", 0LL);
  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0LL;
}

- (void)_pairVerifyInvalidate
{
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0LL;
}

- (void)_pskPrepareClientMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x18960ED88]);
  id v6 = self->_pskData;
  id v12 = 0LL;
  char v7 = [v5 prepareWithName:@"main" isClient:v3 pskData:v6 error:&v12];
  id v8 = v12;
  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_mainStream, v5);
    self->_mainAuthTagLength = [v5 authTagLength];
  }

  else
  {
    int var0 = self->_ucat->var0;
    NSErrorNestedF();
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    stepError = self->_stepError;
    self->_stepError = v10;
  }
}

- (void)_run
{
  if (self->_clientMode) {
    -[SKConnection _clientRun](self, "_clientRun");
  }
  else {
    -[SKConnection _serverRun](self, "_serverRun");
  }
}

- (void)tryPassword:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __28__SKConnection_tryPassword___block_invoke;
  v7[3] = &unk_18A2820C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)updatePasswordType:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __35__SKConnection_updatePasswordType___block_invoke;
  v4[3] = &unk_18A281798;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_updateExternalState
{
  int state = self->_state;
  unsigned int v3 = (self->_runState - 20) & 0xFFFFFFF7;
  int v4 = v3 == 0;
  if (state != v4)
  {
    int var0 = self->_ucat->var0;
    self->_int state = v4;
    char v7 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_stateChangedHandler);
    if (v7)
    {
      id v9 = v7;
      v7[2](v7, v8);
      char v7 = (void (**)(void, void))v9;
    }
  }

- (void)_clientRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unint64_t runState = self->_runState;
      switch((int)runState)
      {
        case 0:
          self->_unint64_t runState = 11;
          goto LABEL_32;
        case 11:
          self->_unint64_t runState = 12;
          -[SKConnection _clientConnectStart](self, "_clientConnectStart");
          goto LABEL_32;
        case 12:
          if (self->_stepError) {
            goto LABEL_24;
          }
          if (self->_stepDone)
          {
            if (!-[NSData length](self->_pskData, "length")) {
              goto LABEL_20;
            }
            int v4 = 19;
            goto LABEL_31;
          }

          goto LABEL_32;
        case 13:
          self->_unint64_t runState = 14;
          -[SKConnection _clientPairVerifyStart](self, "_clientPairVerifyStart");
          goto LABEL_32;
        case 14:
          if (!self->_stepError) {
            goto LABEL_15;
          }
          int v4 = 15;
          goto LABEL_31;
        case 15:
          if (self->_reversePairing)
          {
            int v4 = 17;
LABEL_31:
            self->_unint64_t runState = v4;
          }

          else
          {
            self->_unint64_t runState = 16;
            -[SKConnection _clientPairSetupStart](self, "_clientPairSetupStart");
          }

- (void)_clientConnectStart
{
  if (self->_blePeerDevice)
  {
    -[SKConnection _clientConnectStartBLE](self, "_clientConnectStartBLE");
  }

  else if (self->_sendDataHandler)
  {
    self->_stepDone = 1;
  }

  else
  {
    NSErrorF_safe();
    unsigned int v3 = (NSError *)objc_claimAutoreleasedReturnValue();
    stepError = self->_stepError;
    self->_stepError = v3;
  }

- (void)_clientConnectStartBLE
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  -[CBConnection invalidate](self->_bleConnection, "invalidate");
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    blePeerDevice = self->_blePeerDevice;
    LogPrintF();
  }

  id v5 = objc_alloc_init(MEMORY[0x189602368]);
  objc_storeStrong((id *)&self->_bleConnection, v5);
  unsigned int v6 = -[SKDevice blePSM](self->_blePeerDevice, "blePSM");
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 130LL;
  }
  objc_msgSend(v5, "setBlePSM:", v7, blePeerDevice);
  [v5 setConnectionFlags:64];
  [v5 setConnectTimeoutSeconds:10.0];
  [v5 setDispatchQueue:self->_dispatchQueue];
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"SKCnx";
  }
  [v5 setLabel:label];
  [v5 setUseCase:self->_bluetoothUseCase];
  -[SKDevice identifier](self->_blePeerDevice, "identifier");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x189602370]);
    [v10 setIdentifier:v9];
    [v5 setPeerDevice:v10];
    uint64_t v11 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __38__SKConnection__clientConnectStartBLE__block_invoke;
    v17[3] = &unk_18A282310;
    v17[4] = v5;
    v17[5] = self;
    [v5 setErrorHandler:v17];
    v16[0] = v11;
    v16[1] = 3221225472LL;
    v16[2] = __38__SKConnection__clientConnectStartBLE__block_invoke_2;
    v16[3] = &unk_18A2820C0;
    v16[4] = v5;
    v16[5] = self;
    [v5 setInvalidationHandler:v16];
    v15[0] = v11;
    v15[1] = 3221225472LL;
    v15[2] = __38__SKConnection__clientConnectStartBLE__block_invoke_3;
    v15[3] = &unk_18A282310;
    void v15[4] = v5;
    v15[5] = self;
    [v5 activateWithCompletion:v15];
  }

  else
  {
    NSErrorF_safe();
    id v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = self->_stepError;
    self->_stepError = v12;
  }
}

- (void)_clientConnectCompleted:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v9 = v4;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    if (!self->_stepError)
    {
      NSErrorNestedF();
      unsigned int v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v6;
    }
  }

  else
  {
    if (!self->_readRequested) {
      -[SKConnection _receiveStart:](self, "_receiveStart:", 0LL);
    }
    self->_stepDone = 1;
  }

  -[SKConnection _run](self, "_run", v8);
}

- (void)_clientPairSetupStart
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  int var0 = self->_ucat->var0;
  id v5 = objc_alloc_init(MEMORY[0x18960ED80]);
  objc_storeStrong((id *)&self->_pairSetupSession, v5);
  [v5 setDispatchQueue:self->_dispatchQueue];
  [v5 setFixedPIN:self->_password];
  if (self->_conditionalPersistent)
  {
    uint64_t v6 = 520LL;
  }

  else if (self->_persistentPairing)
  {
    uint64_t v6 = 8LL;
  }

  else
  {
    uint64_t v6 = 24LL;
  }

  [v5 setFlags:v6];
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"SKCnx";
  }
  [v5 setLabel:label];
  [v5 setSessionType:1];
  uint64_t v8 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __37__SKConnection__clientPairSetupStart__block_invoke;
  v11[3] = &unk_18A2810D0;
  v11[4] = self;
  v11[5] = v5;
  [v5 setPromptForPINHandler:v11];
  v10[0] = v8;
  v10[1] = 3221225472LL;
  v10[2] = __37__SKConnection__clientPairSetupStart__block_invoke_2;
  v10[3] = &unk_18A2810F8;
  v10[4] = v5;
  v10[5] = self;
  [v5 setSendDataHandler:v10];
  v9[0] = v8;
  v9[1] = 3221225472LL;
  v9[2] = __37__SKConnection__clientPairSetupStart__block_invoke_3;
  v9[3] = &unk_18A282310;
  v9[4] = v5;
  v9[5] = self;
  [v5 setCompletionHandler:v9];
  [v5 activate];
}

- (void)_clientPairSetupStartReverse
{
  v7[1] = *MEMORY[0x1895F89C0];
  int var0 = self->_ucat->var0;
  -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  uint64_t v6 = @"_pairReverse";
  v7[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 2LL, v5);
}

- (void)_clientPairSetupContinueWithData:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy__229;
  uint64_t v25 = __Block_byref_object_dispose__230;
  id v26 = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __49__SKConnection__clientPairSetupContinueWithData___block_invoke;
  v20[3] = &unk_18A2820E8;
  v20[4] = self;
  v20[5] = &v21;
  id v5 = (void (**)(void))MEMORY[0x1895CC3E8](v20);
  uint64_t v6 = self->_pairSetupSession;
  if (!v6)
  {
    uint64_t v12 = NSErrorF_safe();
    uint64_t v13 = (void *)v22[5];
    v22[5] = v12;

    goto LABEL_13;
  }

  uint64_t v7 = (void *)OPACKDecodeData();
  if (!v7)
  {
    id v14 = (id)NSErrorF_safe();
    goto LABEL_12;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = NSErrorF_safe();
LABEL_19:
    int v18 = (void *)v22[5];
    v22[5] = v16;

    goto LABEL_11;
  }

  uint64_t v8 = CUDecodeNSErrorDictionary();
  id v9 = (void *)v22[5];
  v22[5] = v8;

  if (v22[5])
  {
    id v17 = (id)NSErrorNestedF();
    goto LABEL_12;
  }

  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    [v4 length];
    CUPrintNSObjectOneLineEx();
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    uint64_t v16 = NSErrorF_safe();
    goto LABEL_19;
  }

  -[CUPairingSession receivedData:](v6, "receivedData:", v11);
LABEL_11:

LABEL_12:
LABEL_13:

  v5[2](v5);
  _Block_object_dispose(&v21, 8);
}

- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 passwordType:(int)a4 throttleSeconds:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintFlags32();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

    if ((v7 & 0x20000) == 0) {
      goto LABEL_14;
    }
  }

  else if ((v7 & 0x20000) == 0)
  {
    goto LABEL_14;
  }

  if ((int)v5 < 1)
  {
LABEL_14:
    uint64_t v20 = (void (**)(void, void, void, void))MEMORY[0x1895CC3E8](self->_authPromptHandler);
    if (v20)
    {
      id v21 = v20;
      v20[2](v20, v6, v7, 0LL);
      uint64_t v20 = (void (**)(void, void, void, void))v21;
    }

    return;
  }

  uint64_t v11 = mach_absolute_time();
  uint64_t v12 = SecondsToUpTicks();
  p_authThrottleTimer = &self->_authThrottleTimer;
  authThrottleTimer = self->_authThrottleTimer;
  self->_authThrottleDeadlineTicks = v12 + v11;
  if (authThrottleTimer)
  {
    uint64_t v15 = authThrottleTimer;
    dispatch_source_cancel(v15);
    uint64_t v16 = *p_authThrottleTimer;
    *p_authThrottleTimer = 0LL;
  }

  dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_authThrottleTimer, v17);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __77__SKConnection__clientPairSetupPromptWithFlags_passwordType_throttleSeconds___block_invoke;
  handler[3] = &unk_18A281120;
  handler[4] = v17;
  handler[5] = self;
  int v23 = v6;
  dispatch_source_set_event_handler(v17, handler);
  CUDispatchTimerSet();
  dispatch_activate(v17);
  uint64_t v18 = MEMORY[0x1895CC3E8](self->_authPromptHandler);
  int v19 = (void *)v18;
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, v6, v7, v5);
  }
}

- (void)_clientPairSetupCompleted:(id)a3
{
  id v4 = a3;
  authThrottleTimer = self->_authThrottleTimer;
  if (authThrottleTimer)
  {
    uint64_t v6 = authThrottleTimer;
    dispatch_source_cancel(v6);
    uint64_t v7 = self->_authThrottleTimer;
    self->_authThrottleTimer = 0LL;
  }

  id v8 = v4;
  id v9 = v8;
  if (v8) {
    goto LABEL_5;
  }
  pairSetupSession = self->_pairSetupSession;
  id v19 = 0LL;
  -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", @"main", &v19);
  uint64_t v11 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  id v9 = v19;
  mainStream = self->_mainStream;
  self->_mainStream = v11;

  if (v9)
  {
LABEL_5:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v18);
    }

    else
    {
      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v17);
    }
  }

  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    int v16 = self->_ucat->var0;
    id v9 = 0LL;
  }

  uint64_t v14 = MEMORY[0x1895CC3E8](self->_authCompletionHandler);
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v9);
  }

  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, v9);
  }
  self->_stepDone = 1;
  -[SKConnection _run](self, "_run");
}

- (void)_clientPairVerifyStart
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  int var0 = self->_ucat->var0;
  id v5 = objc_alloc_init(MEMORY[0x18960ED80]);
  objc_storeStrong((id *)&self->_pairVerifySession, v5);
  [v5 setDispatchQueue:self->_dispatchQueue];
  uint64_t v6 = 8LL;
  if (!self->_conditionalPersistent)
  {
    if (self->_persistentPairing) {
      uint64_t v6 = 8LL;
    }
    else {
      uint64_t v6 = 0x400000LL;
    }
  }

  [v5 setFlags:v6];
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"SKCnx";
  }
  [v5 setLabel:label];
  [v5 setSessionType:3];
  uint64_t v8 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __38__SKConnection__clientPairVerifyStart__block_invoke;
  v10[3] = &unk_18A2810F8;
  v10[4] = v5;
  v10[5] = self;
  [v5 setSendDataHandler:v10];
  v9[0] = v8;
  v9[1] = 3221225472LL;
  v9[2] = __38__SKConnection__clientPairVerifyStart__block_invoke_2;
  v9[3] = &unk_18A282310;
  v9[4] = v5;
  v9[5] = self;
  [v5 setCompletionHandler:v9];
  [v5 activate];
}

- (void)_clientPairVerifyWithData:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy__229;
  int v23 = __Block_byref_object_dispose__230;
  id v24 = 0LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __42__SKConnection__clientPairVerifyWithData___block_invoke;
  v18[3] = &unk_18A2820E8;
  v18[4] = self;
  v18[5] = &v19;
  id v5 = (void (**)(void))MEMORY[0x1895CC3E8](v18);
  if (self->_pairVerifySession)
  {
    uint64_t v6 = (void *)OPACKDecodeData();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          [v4 length];
          CUPrintNSObjectOneLineEx();
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
        }

        CFDataGetTypeID();
        CFDictionaryGetTypedValue();
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v8);
        }

        else
        {
          uint64_t v15 = NSErrorF_safe();
          int v16 = (void *)v20[5];
          v20[5] = v15;

          uint64_t v8 = 0LL;
        }
      }

      else
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = NSErrorF_safe();
        uint64_t v14 = (void *)v20[5];
        v20[5] = v13;
      }
    }

    else
    {
      uint64_t v11 = NSErrorF_safe();
      uint64_t v8 = (void *)v20[5];
      v20[5] = v11;
    }
  }

  else
  {
    uint64_t v9 = NSErrorF_safe();
    id v10 = (void *)v20[5];
    v20[5] = v9;
  }

  v5[2](v5);

  _Block_object_dispose(&v19, 8);
}

- (void)_clientPairVerifyCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    goto LABEL_3;
  }
  pairVerifySession = self->_pairVerifySession;
  id v15 = 0LL;
  -[CUPairingSession openStreamWithName:error:](pairVerifySession, "openStreamWithName:error:", @"main", &v15);
  uint64_t v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  id v5 = v15;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v14);
    }

    else
    {
      -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v13);
    }
  }

  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    int v10 = self->_ucat->var0;
    uint64_t v11 = MEMORY[0x1895CC3E8](self->_authCompletionHandler);
    uint64_t v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0LL);
    }

    id v5 = 0LL;
  }

  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, v5);
  }
  self->_stepDone = 1;
  -[SKConnection _run](self, "_run");
}

- (void)_clientError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v12 = v4;
  if (var0 <= 90)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v12, v6))
    {
      CUPrintNSError();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      id v4 = v12;
    }
  }

  startTimer = self->_startTimer;
  if (startTimer)
  {
    uint64_t v8 = startTimer;
    dispatch_source_cancel(v8);
    uint64_t v9 = self->_startTimer;
    self->_startTimer = 0LL;

    id v4 = v12;
  }

  if (v4)
  {
    -[SKConnection _abortRequestsWithError:](self, "_abortRequestsWithError:");
  }

  else
  {
    NSErrorF_safe();
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v10);
  }

  -[CBConnection invalidate](self->_bleConnection, "invalidate", v11);
  -[SKConnection _invalidateWithError:](self, "_invalidateWithError:", v12);
}

- (void)_serverRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      uint64_t runState = self->_runState;
      switch((int)runState)
      {
        case 23:
          -[SKConnection _serverAccept](self, "_serverAccept");
          if (!-[NSData length](self->_pskData, "length")) {
            goto LABEL_11;
          }
          unsigned int v4 = 27;
          goto LABEL_21;
        case 24:
          if (self->_reversePairing)
          {
            unsigned int v4 = 25;
LABEL_21:
            self->_uint64_t runState = v4;
            goto LABEL_22;
          }

          if (self->_stepError)
          {
LABEL_20:
            unsigned int v4 = 29;
            goto LABEL_21;
          }

          if (self->_stepDone)
          {
            self->_stepDone = 0;
LABEL_16:
            unsigned int v4 = 28;
            goto LABEL_21;
          }

          unsigned int v4 = 24;
LABEL_22:
          if (v4 == (_DWORD)runState) {
            return;
          }
          int var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_29;
          }
          if (var0 != -1) {
            goto LABEL_25;
          }
          if (_LogCategory_Initialize())
          {
            unsigned int v4 = self->_runState;
LABEL_25:
            int v6 = "?";
            if (v4 <= 0x1D) {
              int v6 = off_18A2812D0[v4];
            }
            uint64_t v7 = off_18A2812D0[runState];
            uint64_t v8 = v6;
            LogPrintF();
          }

- (void)_serverAccept
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  self->_reversePairing = 0;
  if (self->_bleConnection)
  {
    -[SKConnection _serverAcceptBLE](self, "_serverAcceptBLE");
  }

  else if (self->_sendDataHandler)
  {
    self->_stepDone = 1;
  }

  else
  {
    NSErrorF_safe();
    unsigned int v4 = (NSError *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_stepError;
    self->_stepError = v4;
  }

- (void)_serverAcceptBLE
{
  bleConnection = self->_bleConnection;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = __32__SKConnection__serverAcceptBLE__block_invoke;
  v7[3] = &unk_18A282310;
  v7[4] = bleConnection;
  void v7[5] = self;
  id v5 = bleConnection;
  -[CBConnection setErrorHandler:](v5, "setErrorHandler:", v7);
  v6[0] = v4;
  v6[1] = 3221225472LL;
  v6[2] = __32__SKConnection__serverAcceptBLE__block_invoke_2;
  v6[3] = &unk_18A2820C0;
  v6[4] = v5;
  v6[5] = self;
  -[CBConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v6);
  -[SKConnection _receiveStart:](self, "_receiveStart:", 0LL);
}

- (void)_serverPairSetupContinueWithData:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v32 = 0LL;
  __int128 v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = __Block_byref_object_copy__229;
  v36 = __Block_byref_object_dispose__230;
  id v37 = 0LL;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke;
  v31[3] = &unk_18A2820E8;
  v31[4] = self;
  v31[5] = &v32;
  uint64_t v8 = (void (**)(void))MEMORY[0x1895CC3E8](v31);
  uint64_t v9 = (void *)OPACKDecodeData();
  if (!v9)
  {
    uint64_t v19 = NSErrorF_safe();
    uint64_t v18 = (void *)v33[5];
    v33[5] = v19;
LABEL_33:

    goto LABEL_36;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = NSErrorF_safe();
    v22 = (void *)v33[5];
    v33[5] = v21;

    goto LABEL_33;
  }

  if (!v4)
  {
    if (self->_pairSetupSession)
    {
      int var0 = self->_ucat->var0;
      [v6 length];
      CUPrintNSObjectOneLineEx();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
LABEL_30:

LABEL_31:
      CFDataGetTypeID();
      CFDictionaryGetTypedValue();
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v18);
      }

      else
      {
        uint64_t v23 = NSErrorF_safe();
        id v24 = (void *)v33[5];
        v33[5] = v23;

        uint64_t v18 = 0LL;
      }

      goto LABEL_33;
    }

- (void)_serverPairSetupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    goto LABEL_3;
  }
  pairSetupSession = self->_pairSetupSession;
  id v16 = 0LL;
  -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", @"main", &v16);
  uint64_t v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  id v5 = v16;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v15);
    }

    else
    {
      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v14);
    }
  }

  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    int v13 = self->_ucat->var0;
    id v5 = 0LL;
  }

  int runState = self->_runState;
  if (runState == 24 || runState == 18)
  {
    uint64_t v11 = MEMORY[0x1895CC3E8](self->_authCompletionHandler);
    id v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
    }

    if (!self->_stepError) {
      objc_storeStrong((id *)&self->_stepError, v5);
    }
    self->_stepDone = 1;
    -[SKConnection _run](self, "_run");
  }
}

- (void)_serverPairVerifyContinueWithData:(id)a3 start:(BOOL)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  __int128 v31 = __Block_byref_object_copy__229;
  uint64_t v32 = __Block_byref_object_dispose__230;
  id v33 = 0LL;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke;
  v27[3] = &unk_18A2820E8;
  v27[4] = self;
  v27[5] = &v28;
  uint64_t v8 = (void (**)(void))MEMORY[0x1895CC3E8](v27);
  uint64_t v9 = (void *)OPACKDecodeData();
  if (!v9)
  {
    uint64_t v17 = NSErrorF_safe();
    id v16 = (void *)v29[5];
    v29[5] = v17;
    goto LABEL_22;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = NSErrorF_safe();
    uint64_t v20 = (void *)v29[5];
    v29[5] = v19;

    goto LABEL_22;
  }

  if (a4 || !self->_pairVerifySession)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = [v6 length];
      CUPrintNSObjectOneLineEx();
      uint64_t v23 = v13;
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v23, v24);
    id v11 = objc_alloc_init(MEMORY[0x18960ED80]);
    objc_storeStrong((id *)&self->_pairVerifySession, v11);
    [v11 setDispatchQueue:self->_dispatchQueue];
    if (self->_conditionalPersistent || self->_persistentPairing) {
      uint64_t v14 = 8LL;
    }
    else {
      uint64_t v14 = 0x400000LL;
    }
    [v11 setFlags:v14];
    if (self->_label) {
      label = (const __CFString *)self->_label;
    }
    else {
      label = @"SKCnx";
    }
    [v11 setLabel:label];
    [v11 setSessionType:4];
    v26[0] = v7;
    v26[1] = 3221225472LL;
    v26[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_2;
    v26[3] = &unk_18A2810F8;
    v26[4] = v11;
    v26[5] = self;
    [v11 setSendDataHandler:v26];
    v25[0] = v7;
    v25[1] = 3221225472LL;
    v25[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_3;
    v25[3] = &unk_18A282310;
    v25[4] = v11;
    v25[5] = self;
    [v11 setCompletionHandler:v25];
    [v11 activate];
  }

  else
  {
    int v10 = self->_ucat->var0;
    [v6 length];
    CUPrintNSObjectOneLineEx();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

LABEL_20:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v16);
  }

  else
  {
    uint64_t v21 = NSErrorF_safe();
    v22 = (void *)v29[5];
    v29[5] = v21;

    id v16 = 0LL;
  }

- (void)_serverPairVerifyCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    goto LABEL_3;
  }
  pairVerifySession = self->_pairVerifySession;
  id v14 = 0LL;
  -[CUPairingSession openStreamWithName:error:](pairVerifySession, "openStreamWithName:error:", @"main", &v14);
  uint64_t v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  id v5 = v14;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v13);
  }

  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    int v10 = self->_ucat->var0;
    if (self->_runState == 24)
    {
      uint64_t v11 = MEMORY[0x1895CC3E8](self->_authCompletionHandler);
      id v12 = (void *)v11;
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0LL);
      }

      self->_stepDone = 1;
      -[SKConnection _run](self, "_run");
    }
  }
}

- (void)_serverError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      CUPrintNSError();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      id v4 = v8;
    }
  }

  -[SKConnection _invalidateWithError:](self, "_invalidateWithError:", v4, v7);
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  v23[4] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v14 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    uint64_t v16 = xidLast + 1;
  }
  else {
    uint64_t v16 = 1LL;
  }
  self->_unsigned int xidLast = v16;
  v22[0] = &unk_18A289280;
  v22[1] = &unk_18A289298;
  v23[0] = v14;
  v23[1] = v10;
  v23[2] = &unk_18A2892C8;
  v22[2] = &unk_18A2892B0;
  v22[3] = &unk_18A2892E0;
  [MEMORY[0x189607968] numberWithUnsignedInt:v16];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v17;
  [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:4];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v19 = (void *)MEMORY[0x1895CC0D0](v18, 0LL, &v21);
  if (v19)
  {
    -[SKConnection sendEventID:data:xid:options:completion:]( self,  "sendEventID:data:xid:options:completion:",  v10,  v19,  v16,  v11,  v12);
  }

  else
  {
    NSErrorF_safe();
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v20);
  }
}

- (void)sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v19 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    NSErrorF_safe();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v17);
  }

  else if ((self->_runState & 0xFFFFFFF7) == 0x14 && !-[NSMutableArray count](self->_sendArray, "count"))
  {
    -[SKConnection _sendEventID:data:xid:options:completion:]( self,  "_sendEventID:data:xid:options:completion:",  v19,  v12,  v9,  v13,  v14);
  }

  else
  {
    int v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
    {
      -[NSMutableArray count](self->_sendArray, "count");
      LogPrintF();
    }

    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___SKSendEntry);
    -[SKSendEntry setCompletion:](v18, "setCompletion:", v14);
    -[SKSendEntry setEventID:](v18, "setEventID:", v19);
    -[SKSendEntry setEventData:](v18, "setEventData:", v12);
    -[SKSendEntry setOptions:](v18, "setOptions:", v13);
    -[SKSendEntry setQueueTicks:](v18, "setQueueTicks:", mach_absolute_time());
    -[SKSendEntry setXid:](v18, "setXid:", v9);
    -[NSMutableArray addObject:](self->_sendArray, "addObject:", v18);
  }
}

- (void)_sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v42 = 0LL;
  v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000LL;
  v45 = __Block_byref_object_copy__229;
  v46 = __Block_byref_object_dispose__230;
  id v47 = 0LL;
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __57__SKConnection__sendEventID_data_xid_options_completion___block_invoke;
  v37[3] = &unk_18A281170;
  v40 = &v42;
  v37[4] = self;
  id v34 = v12;
  id v38 = v34;
  int v41 = v9;
  id v16 = v15;
  id v39 = v16;
  uint64_t v17 = (void (**)(void))MEMORY[0x1895CC3E8](v37);
  v36[0] = 5;
  unint64_t v18 = self->_mainAuthTagLength + [v13 length];
  if (v18 >> 24)
  {
    uint64_t v26 = NSErrorF_safe();
    id v19 = v43[5];
    v43[5] = (id)v26;
  }

  else
  {
    uint64_t v33 = v9;
    v36[1] = BYTE2(v18);
    v36[2] = BYTE1(v18);
    v36[3] = v18;
    id v19 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v36 length:4];
    uint64_t v20 = self->_mainStream;
    int v21 = v20;
    if (v20)
    {
      v22 = v43;
      id obj = v43[5];
      id v23 = v13;
      -[CUPairingStream encryptData:aadData:error:](v20, "encryptData:aadData:error:", v13, v19, &obj);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v22 + 5, obj);
      if (v24)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSObject();
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

          -[SKConnection _sendHeaderData:bodyData:completion:]( self,  "_sendHeaderData:bodyData:completion:",  v19,  v24,  v16,  v34,  v33,  v31,  v18);
        }

        else
        {
          -[SKConnection _sendHeaderData:bodyData:completion:]( self,  "_sendHeaderData:bodyData:completion:",  v19,  v24,  v16,  v28,  v29,  v30,  v32);
        }
      }
    }

    else
    {
      id v23 = v13;
      uint64_t v27 = NSErrorF_safe();
      id v24 = v43[5];
      v43[5] = (id)v27;
    }

    id v13 = v23;
  }

  v17[2](v17);
  _Block_object_dispose(&v42, 8);
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    NSErrorF_safe();
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v16);
  }

  else if ((self->_runState & 0xFFFFFFF7) == 0x14 && !-[NSMutableArray count](self->_sendArray, "count"))
  {
    -[SKConnection _sendRequestID:request:options:sendEntry:responseHandler:]( self,  "_sendRequestID:request:options:sendEntry:responseHandler:",  v10,  v11,  v12,  0LL,  v13);
  }

  else
  {
    int v15 = self->_ucat->var0;
    if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
    {
      id v20 = v10;
      uint64_t v21 = -[NSMutableArray count](self->_sendArray, "count");
      LogPrintF();
    }

    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___SKSendEntry);
    -[SKSendEntry setOptions:](v17, "setOptions:", v12);
    -[SKSendEntry setQueueTicks:](v17, "setQueueTicks:", mach_absolute_time());
    -[SKSendEntry setRequestID:](v17, "setRequestID:", v10);
    -[SKSendEntry setRequest:](v17, "setRequest:", v11);
    -[SKSendEntry setResponseHandler:](v17, "setResponseHandler:", v13);
    if (v12)
    {
      CFDictionaryGetDouble();
      if (v18 > 0.0)
      {
        id v19 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_dispatchQueue);
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __62__SKConnection_sendRequestID_request_options_responseHandler___block_invoke;
        handler[3] = &unk_18A281198;
        handler[4] = v19;
        handler[5] = self;
        void handler[6] = v17;
        dispatch_source_set_event_handler(v19, handler);
        CUDispatchTimerSet();
        dispatch_activate(v19);
        -[SKSendEntry setTimer:](v17, "setTimer:", v19);
      }
    }

    -[NSMutableArray addObject:](self->_sendArray, "addObject:", v17, v20, v21);
  }
}

- (void)_sendRequestID:(id)a3 request:(id)a4 options:(id)a5 sendEntry:(id)a6 responseHandler:(id)a7
{
  v65[4] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v44 = a4;
  id v48 = a5;
  id v46 = a6;
  id v13 = a7;
  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    uint64_t v15 = xidLast + 1;
  }
  else {
    uint64_t v15 = 1LL;
  }
  self->_unsigned int xidLast = v15;
  uint64_t v58 = 0LL;
  v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = __Block_byref_object_copy__229;
  v62 = __Block_byref_object_dispose__230;
  id v63 = 0LL;
  v53[0] = MEMORY[0x1895F87A8];
  v53[1] = 3221225472LL;
  v53[2] = __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke;
  v53[3] = &unk_18A281170;
  v56 = &v58;
  v53[4] = self;
  id v47 = v12;
  id v54 = v47;
  int v57 = v15;
  id v43 = v13;
  id v55 = v43;
  uint64_t v42 = (void (**)(void))MEMORY[0x1895CC3E8](v53);
  uint64_t v16 = [MEMORY[0x189607968] numberWithUnsignedInt:v15];
  v64[0] = &unk_18A289280;
  v64[1] = &unk_18A289298;
  v65[0] = v44;
  v65[1] = v47;
  v64[2] = &unk_18A2892B0;
  v64[3] = &unk_18A2892E0;
  v65[2] = &unk_18A2892F8;
  v65[3] = v16;
  [MEMORY[0x189603F68] dictionaryWithObjects:v65 forKeys:v64 count:4];
  int v41 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (void *)MEMORY[0x1895CC0D0](v41, 0LL, &v52);
  double v18 = v17;
  v45 = (void *)v16;
  if (v17)
  {
    v51[0] = 5;
    unint64_t v19 = self->_mainAuthTagLength + [v17 length];
    if (v19 >> 24)
    {
      uint64_t v35 = NSErrorF_safe();
      id v20 = v59[5];
      v59[5] = (id)v35;
    }

    else
    {
      v51[1] = BYTE2(v19);
      v51[2] = BYTE1(v19);
      v51[3] = v19;
      id v20 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v51 length:4];
      uint64_t v21 = self->_mainStream;
      v22 = v21;
      if (v21)
      {
        id v23 = v59;
        id obj = v59[5];
        -[CUPairingStream encryptData:aadData:error:](v21, "encryptData:aadData:error:", v18, v20, &obj);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v23 + 5, obj);
        if (v24)
        {
          uint64_t v25 = objc_alloc_init(&OBJC_CLASS___SKRequestEntry);
          -[SKRequestEntry setOptions:](v25, "setOptions:", v48);
          -[SKRequestEntry setRequestID:](v25, "setRequestID:", v47);
          -[SKRequestEntry setResponseHandler:](v25, "setResponseHandler:", v43);
          -[SKRequestEntry setSendTicks:](v25, "setSendTicks:", mach_absolute_time());
          if (v46)
          {
            [v46 timer];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKRequestEntry setTimer:](v25, "setTimer:", v26);

            [v46 setXidObj:v45];
          }

          requests = self->_requests;
          if (!requests)
          {
            uint64_t v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
            uint64_t v29 = self->_requests;
            self->_requests = v28;

            requests = self->_requests;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](requests, "setObject:forKeyedSubscript:", v25, v45);
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObject();
            id v39 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v40 = v19;
            id v37 = v47;
            uint64_t v38 = v15;
            LogPrintF();
          }

          -[SKConnection _sendHeaderData:bodyData:completion:]( self,  "_sendHeaderData:bodyData:completion:",  v20,  v24,  &__block_literal_global_257,  v37,  v38,  v39,  v40);
          if (v48)
          {
            CFDictionaryGetDouble();
            if (v31 > 0.0)
            {
              uint64_t v32 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_dispatchQueue);
              handler[0] = MEMORY[0x1895F87A8];
              handler[1] = 3221225472LL;
              handler[2] = __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke_2;
              handler[3] = &unk_18A281198;
              handler[4] = v32;
              handler[5] = self;
              void handler[6] = v45;
              dispatch_source_set_event_handler(v32, handler);
              CUDispatchTimerSet();
              dispatch_activate(v32);
              -[SKRequestEntry setTimer:](v25, "setTimer:", v32);
            }
          }
        }
      }

      else
      {
        uint64_t v36 = NSErrorF_safe();
        id v24 = v59[5];
        v59[5] = (id)v36;
      }
    }
  }

  else
  {
    uint64_t v33 = NSErrorF_safe();
    id v34 = v59[5];
    v59[5] = (id)v33;
  }

  v42[2](v42);
  _Block_object_dispose(&v58, 8);
}

- (void)_sendResponse:(id)a3 error:(id)a4 xid:(id)a5 requestID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v44 = a6;
  id v15 = a7;
  uint64_t v54 = 0LL;
  id v55 = (id *)&v54;
  uint64_t v56 = 0x3032000000LL;
  int v57 = __Block_byref_object_copy__229;
  uint64_t v58 = __Block_byref_object_dispose__230;
  id v59 = 0LL;
  uint64_t v16 = [v14 unsignedIntValue];
  v50[0] = MEMORY[0x1895F87A8];
  v50[1] = 3221225472LL;
  v50[2] = __61__SKConnection__sendResponse_error_xid_requestID_completion___block_invoke;
  v50[3] = &unk_18A2811E0;
  int v52 = &v54;
  v50[4] = self;
  uint64_t v41 = v16;
  int v53 = v16;
  id v46 = v15;
  id v51 = v46;
  v45 = (void (**)(void))MEMORY[0x1895CC3E8](v50);
  id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
  double v18 = v17;
  if (v13) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v12 == 0LL;
  }
  if (v19) {
    id v20 = (id)MEMORY[0x189604A60];
  }
  else {
    id v20 = v12;
  }
  [v17 setObject:v20 forKeyedSubscript:&unk_18A289280];
  [v18 setObject:&unk_18A289310 forKeyedSubscript:&unk_18A2892B0];
  [v18 setObject:v14 forKeyedSubscript:&unk_18A2892E0];
  if (v13)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v36 = v41;
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    CUEncodeNSErrorDictionary();
  }

  v22 = (void *)MEMORY[0x1895CC0D0](v18, 0LL, &v49);
  id v23 = v22;
  if (v22)
  {
    v48[0] = 5;
    unint64_t v24 = self->_mainAuthTagLength + [v22 length];
    if (v24 >> 24)
    {
      uint64_t v34 = NSErrorF_safe();
      id v25 = v55[5];
      v55[5] = (id)v34;
    }

    else
    {
      v48[1] = BYTE2(v24);
      v48[2] = BYTE1(v24);
      v48[3] = v24;
      id v25 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v48 length:4];
      uint64_t v26 = self->_mainStream;
      uint64_t v27 = v26;
      id v42 = v14;
      id v43 = v12;
      if (v26)
      {
        uint64_t v28 = v55;
        id obj = v55[5];
        -[CUPairingStream encryptData:aadData:error:](v26, "encryptData:aadData:error:", v23, v25, &obj);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v28 + 5, obj);
        if (v29)
        {
          int v30 = self->_ucat->var0;
          if (v30 <= 30 && (v30 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObject();
            double v31 = (void *)objc_claimAutoreleasedReturnValue();
            CUPrintNSError();
            unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

            -[SKConnection _sendHeaderData:bodyData:completion:]( self,  "_sendHeaderData:bodyData:completion:",  v25,  v29,  v46,  v41,  v31,  v24,  v40);
          }

          else
          {
            -[SKConnection _sendHeaderData:bodyData:completion:]( self,  "_sendHeaderData:bodyData:completion:",  v25,  v29,  v46,  v36,  v37,  v38,  v39);
          }
        }
      }

      else
      {
        uint64_t v35 = NSErrorF_safe();
        id v29 = v55[5];
        v55[5] = (id)v35;
      }

      id v14 = v42;
      id v12 = v43;
    }
  }

  else
  {
    uint64_t v32 = NSErrorF_safe();
    id v33 = v55[5];
    v55[5] = (id)v32;
  }

  v45[2](v45);
  _Block_object_dispose(&v54, 8);
}

- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v21[0] = v4;
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7;
  if (v7 >> 24)
  {
    int var0 = self->_ucat->var0;
  }

  else
  {
    v21[1] = BYTE2(v7);
    v21[2] = BYTE1(v7);
    v21[3] = v7;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v21 length:4];
    int v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
    {
      else {
        id v11 = off_18A281408[v4];
      }
      uint64_t v12 = CUPrintNSDataHex();
      id v13 = (void *)v12;
      id v14 = "";
      if (v8 > 0x10) {
        id v14 = "...";
      }
      uint64_t v19 = v12;
      id v20 = v14;
      id v17 = v11;
      unint64_t v18 = v8;
      uint64_t v16 = v4;
      LogPrintF();
    }

    -[SKConnection _sendHeaderData:bodyData:completion:]( self,  "_sendHeaderData:bodyData:completion:",  v9,  v6,  &__block_literal_global_220_250,  v16,  v17,  v18,  v19,  v20);
  }
}

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4 = a3;
  id v6 = (void *)MEMORY[0x1895CC0D0](a4, 0LL, &v9);
  if (v6)
  {
    -[SKConnection _sendFrameType:body:](self, "_sendFrameType:body:", v4, v6);
  }

  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintErrorCode();
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }
}

- (void)_sendHeaderData:(id)a3 bodyData:(id)a4 completion:(id)a5
{
  v26[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_requestable;
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x18960EDD0]);
    uint64_t v19 = MEMORY[0x1895F87A8];
    uint64_t v20 = 3221225472LL;
    uint64_t v21 = __52__SKConnection__sendHeaderData_bodyData_completion___block_invoke;
    v22 = &unk_18A281C28;
    id v23 = v12;
    id v24 = v10;
    [v12 setCompletion:&v19];
    if (objc_msgSend(v9, "length", v19, v20, v21, v22, v23))
    {
      v26[0] = v8;
      v26[1] = v9;
      id v13 = (void *)MEMORY[0x189603F18];
      id v14 = (id *)v26;
      uint64_t v15 = 2LL;
    }

    else
    {
      id v25 = v8;
      id v13 = (void *)MEMORY[0x189603F18];
      id v14 = &v25;
      uint64_t v15 = 1LL;
    }

    [v13 arrayWithObjects:v14 count:v15];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setDataArray:v18];

    -[CUReadWriteRequestable writeWithRequest:](v11, "writeWithRequest:", v12);
  }

  else
  {
    id v12 = (id)MEMORY[0x1895CC3E8](self->_sendDataHandler);
    if (v12)
    {
      id v16 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v16 appendData:v8];
      if ([v9 length]) {
        [v16 appendData:v9];
      }
      (*((void (**)(id, id))v12 + 2))(v12, v16);
      uint64_t v17 = 0LL;
    }

    else
    {
      uint64_t v17 = NSErrorF_safe();
      id v16 = (id)v17;
    }

    (*((void (**)(id, uint64_t))v10 + 2))(v10, v17);
  }
}

- (void)_processSends
{
  uint64_t v3 = -[NSMutableArray popFirstObject](self->_sendArray, "popFirstObject");
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    do
    {
      [v4 eventID];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        [v4 eventData];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v7 = v6;
        if (v6)
        {
          id v8 = v6;
        }

        else
        {
          [MEMORY[0x189603F48] data];
          id v8 = (id)objc_claimAutoreleasedReturnValue();
        }

        id v10 = v8;

        [v4 completion];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = v14;
        if (!v14) {
          id v14 = &__block_literal_global_226;
        }
        id v16 = (void *)MEMORY[0x1895CC3E8](v14);

        uint64_t v17 = [v4 xid];
        [v4 options];
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKConnection _sendEventID:data:xid:options:completion:]( self,  "_sendEventID:data:xid:options:completion:",  v5,  v10,  v17,  v18,  v16);
      }

      else
      {
        uint64_t v9 = [v4 requestID];
        if (v9)
        {
          id v10 = (void *)v9;
          [v4 request];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          id v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }

          else
          {
            [MEMORY[0x189603F68] dictionary];
            id v13 = (id)objc_claimAutoreleasedReturnValue();
          }

          uint64_t v20 = v13;

          [v4 responseHandler];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 options];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKConnection _sendRequestID:request:options:sendEntry:responseHandler:]( self,  "_sendRequestID:request:options:sendEntry:responseHandler:",  v10,  v20,  v22,  v4,  v21);
        }

        else
        {
          int var0 = self->_ucat->var0;
          id v10 = 0LL;
        }
      }

      -[NSMutableArray popFirstObject](self->_sendArray, "popFirstObject");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    while (v4);
  }

- (void)_abortRequestsWithError:(id)a3
{
  id v4 = a3;
  requests = self->_requests;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = __40__SKConnection__abortRequestsWithError___block_invoke;
  v7[3] = &unk_18A281248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requests, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSMutableDictionary removeAllObjects](self->_requests, "removeAllObjects");
}

- (void)_timeoutForSendEntry:(id)a3
{
  id v15 = a3;
  [v15 xidObj];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SKConnection _timeoutForXID:](self, "_timeoutForXID:", v4);
    goto LABEL_15;
  }

  mach_absolute_time();
  [v15 queueTicks];
  UpTicksToSecondsF();
  uint64_t v6 = v5;
  uint64_t v7 = -[NSMutableArray indexOfObject:](self->_sendArray, "indexOfObject:", v15);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", v7);
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      id v11 = v15;
      if (var0 == -1)
      {
        id v11 = v15;
      }

      [v11 requestID];
      uint64_t v14 = v6;
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

- (void)_timeoutForXID:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 unsignedIntValue];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v14);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0LL, v14);
    mach_absolute_time();
    [v5 sendTicks];
    UpTicksToSecondsF();
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      uint64_t v8 = v6;
      if (var0 != -1 || _LogCategory_Initialize())
      {
        uint64_t v13 = v8;
        uint64_t v12 = v4;
        LogPrintF();
      }
    }

    objc_msgSend(v5, "responseHandler", v12, v13);
    uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    NSErrorF_safe();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void, void *))v9)[2](v9, 0LL, 0LL, v10);
  }

  else
  {
    int v11 = self->_ucat->var0;
  }
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = __29__SKConnection_receivedData___block_invoke;
  v7[3] = &unk_18A2820C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_receiveStart:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    id v5 = objc_alloc_init(MEMORY[0x18960EDA0]);
  }
  int var0 = self->_ucat->var0;
  self->_receivingHeader = 1;
  [v5 setMinLength:4];
  [v5 setMaxLength:4];
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  id v10 = __30__SKConnection__receiveStart___block_invoke;
  int v11 = &unk_18A2820C0;
  uint64_t v12 = self;
  id v13 = v5;
  id v7 = v5;
  [v7 setCompletion:&v8];
  -[CUReadWriteRequestable readWithRequest:](self->_requestable, "readWithRequest:", v7, v8, v9, v10, v11, v12);
  self->_readRequested = 1;
}

- (void)_receiveCompletion:(id)a3
{
  id v4 = a3;
  self->_readRequested = 0;
  [v4 error];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    if ([v5 code] == -6753 || objc_msgSend(v6, "code") == -71148 || objc_msgSend(v6, "code") == -71143)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
LABEL_7:
        CUPrintNSError();
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }

    else
    {
      int v17 = self->_ucat->var0;
    }
  }

  else
  {
    uint64_t v9 = [v4 length];
    [v4 bufferData];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setLength:v9];

    if (self->_receivingHeader)
    {
      [v4 data];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)[v11 length] <= 3)
      {
        int v22 = self->_ucat->var0;
        if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        {
          [v11 length];
          LogPrintF();
        }
      }

      else
      {
        uint64_t v12 = ($99C7B5D234F7D6D4241F49443380A03D *)[v11 bytes];
        $99C7B5D234F7D6D4241F49443380A03D v13 = *v12;
        self->_frameHeader = *v12;
        uint64_t v14 = (*(_DWORD *)&v13 << 8) & 0xFF0000 | (*(unsigned int *)&v13 >> 8) & 0xFF00 | v13.frameLen[2];
        int v15 = self->_ucat->var0;
        if ((_DWORD)v14)
        {
          if (v15 <= 10 && (v15 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v23 = v14;
            LogPrintF();
          }

          self->_receivingHeader = 0;
          objc_msgSend(v4, "setMinLength:", v14, v23);
          [v4 setMaxLength:v14];
          v24[0] = MEMORY[0x1895F87A8];
          v24[1] = 3221225472LL;
          v24[2] = __35__SKConnection__receiveCompletion___block_invoke;
          v24[3] = &unk_18A2820C0;
          v24[4] = self;
          id v18 = v4;
          id v25 = v18;
          [v18 setCompletion:v24];
          -[CUReadWriteRequestable readWithRequest:](self->_requestable, "readWithRequest:", v18);
          self->_readRequested = 1;
        }

        else
        {
          [MEMORY[0x189603F48] data];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKConnection _receivedHeader:body:](self, "_receivedHeader:body:", &self->_frameHeader, v21);

          -[SKConnection _receiveStart:](self, "_receiveStart:", v4);
        }
      }
    }

    else
    {
      int v16 = self->_ucat->var0;
      if (v16 <= 10 && (v16 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = [v4 length];
        LogPrintF();
      }

      objc_msgSend(v4, "data", v23);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[SKConnection _receivedHeader:body:](self, "_receivedHeader:body:", &self->_frameHeader, v19);
      }

      else
      {
        [MEMORY[0x189603F48] data];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKConnection _receivedHeader:body:](self, "_receivedHeader:body:", &self->_frameHeader, v20);
      }

      -[SKConnection _receiveStart:](self, "_receiveStart:", v4);
    }
  }
}

- (void)_receivedHeader:(id *)a3 body:(id)a4
{
  id v6 = a4;
  uint64_t var0 = a3->var0;
  id v30 = v6;
  uint64_t v8 = [v6 length];
  if ((_DWORD)var0 == 5) {
    int v9 = 10;
  }
  else {
    int v9 = 30;
  }
  int v10 = self->_ucat->var0;
  if (v9 >= v10)
  {
    unint64_t v11 = v8;
    if (v10 != -1 || _LogCategory_Initialize())
    {
      else {
        uint64_t v12 = off_18A281408[var0];
      }
      uint64_t v13 = CUPrintNSDataHex();
      uint64_t v14 = (void *)v13;
      int v15 = "";
      if (v11 > 0x10) {
        int v15 = "...";
      }
      uint64_t v28 = v13;
      id v29 = v15;
      uint64_t v26 = v12;
      unint64_t v27 = v11;
      uint64_t v25 = var0;
      LogPrintF();
    }
  }

  switch((int)var0)
  {
    case 1:
      break;
    case 2:
      if (!self->_clientMode || self->_reversePairing)
      {
        int v16 = self;
        id v17 = v30;
        uint64_t v18 = 1LL;
        goto LABEL_21;
      }

      int v24 = self->_ucat->var0;
      break;
    case 3:
      if (self->_clientMode && !self->_reversePairing)
      {
        -[SKConnection _clientPairSetupContinueWithData:](self, "_clientPairSetupContinueWithData:", v30);
      }

      else
      {
        int v16 = self;
        id v17 = v30;
        uint64_t v18 = 0LL;
LABEL_21:
        -[SKConnection _serverPairSetupContinueWithData:start:]( v16,  "_serverPairSetupContinueWithData:start:",  v17,  v18,  v25,  v26,  v27,  v28,  v29);
      }

      break;
    case 5:
      -[SKConnection _receivedHeader:encryptedObjectData:](self, "_receivedHeader:encryptedObjectData:", a3, v30);
      break;
    case 6:
      if (!self->_clientMode)
      {
        uint64_t v21 = self;
        id v22 = v30;
        uint64_t v23 = 1LL;
        goto LABEL_35;
      }

      int v20 = self->_ucat->var0;
      break;
    case 7:
      if (self->_clientMode)
      {
        -[SKConnection _clientPairVerifyWithData:](self, "_clientPairVerifyWithData:", v30);
      }

      else
      {
        uint64_t v21 = self;
        id v22 = v30;
        uint64_t v23 = 0LL;
LABEL_35:
        -[SKConnection _serverPairVerifyContinueWithData:start:]( v21,  "_serverPairVerifyContinueWithData:start:",  v22,  v23,  v25,  v26,  v27,  v28,  v29);
      }

      break;
    case 8:
      -[SKConnection _receivedHeader:unencryptedObjectData:](self, "_receivedHeader:unencryptedObjectData:", a3, v30);
      break;
    default:
      int v19 = self->_ucat->var0;
      if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v30, "length", v25, v26, v27, v28, v29);
LABEL_42:
        LogPrintF();
      }

      break;
  }
}

- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  int v24 = __Block_byref_object_copy__229;
  uint64_t v25 = __Block_byref_object_dispose__230;
  id v26 = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __52__SKConnection__receivedHeader_encryptedObjectData___block_invoke;
  v20[3] = &unk_18A2820E8;
  v20[4] = self;
  v20[5] = &v21;
  id v7 = (void (**)(void))MEMORY[0x1895CC3E8](v20);
  uint64_t v8 = self->_mainStream;
  int v9 = v8;
  if (v8)
  {
    int v10 = (id *)(v22 + 5);
    id obj = (id)v22[5];
    -[CUPairingStream decryptData:aadBytes:aadLength:error:]( v8,  "decryptData:aadBytes:aadLength:error:",  v6,  a3,  4LL,  &obj);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    if (v11)
    {
      uint64_t v12 = (void *)OPACKDecodeData();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SKConnection _receivedObject:](self, "_receivedObject:", v12);
        }

        else
        {
          int v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = NSErrorF_safe();
          id v17 = (void *)v22[5];
          v22[5] = v16;
        }
      }

      else
      {
        id v14 = (id)NSErrorF_safe();
      }
    }
  }

  else
  {
    uint64_t v13 = NSErrorF_safe();
    unint64_t v11 = (void *)v22[5];
    v22[5] = v13;
  }

  v7[2](v7);
  _Block_object_dispose(&v21, 8);
}

- (void)_receivedHeader:(id *)a3 unencryptedObjectData:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0LL;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__229;
  id v22 = __Block_byref_object_dispose__230;
  id v23 = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __54__SKConnection__receivedHeader_unencryptedObjectData___block_invoke;
  v17[3] = &unk_18A2820E8;
  v17[4] = self;
  v17[5] = &v18;
  id v7 = (void (**)(void))MEMORY[0x1895CC3E8](v17);
  uint64_t v8 = (void *)OPACKDecodeData();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      int var0 = self->_ucat->var0;
      if (a3->var0 == 8)
      {
        if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSObjectOneLine();
          int v15 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
        }

        id pairSetupConfigHandler = (void (**)(id, void *))self->_pairSetupConfigHandler;
        if (pairSetupConfigHandler) {
          pairSetupConfigHandler[2](pairSetupConfigHandler, v8);
        }
      }

      else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        [v6 length];
        LogPrintF();
      }
    }

    else
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = NSErrorF_safe();
      id v14 = (void *)v19[5];
      v19[5] = v13;
    }
  }

  else
  {
    id v11 = (id)NSErrorF_safe();
  }

  v7[2](v7);
  _Block_object_dispose(&v18, 8);
}

- (void)_receivedObject:(id)a3
{
  id v8 = a3;
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 3)
  {
    -[SKConnection _receivedResponse:](self, "_receivedResponse:", v8);
    goto LABEL_10;
  }

  if (Int64Ranged == 2)
  {
    -[SKConnection _receivedRequest:](self, "_receivedRequest:", v8);
    goto LABEL_10;
  }

  id v5 = v8;
  if (Int64Ranged == 1)
  {
    -[SKConnection _receivedEvent:](self, "_receivedEvent:", v8);
LABEL_10:
    id v5 = v8;
    goto LABEL_11;
  }

  int var0 = self->_ucat->var0;
  if (var0 <= 60)
  {
    if (var0 != -1 || (v7 = _LogCategory_Initialize(), id v5 = v8, v7))
    {
      LogPrintF();
      goto LABEL_10;
    }
  }

- (void)_receivedEvent:(id)a3
{
  id v4 = a3;
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      NSDictionaryGetNSNumber();
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 unsignedIntValue];
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        [v5 count];
        LogPrintF();
      }

      uint64_t v9 = MEMORY[0x1895CC3E8](self->_receivedEventHandler);
      int v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t, void *, void *, void))(v9 + 16))(v9, v6, v5, 0LL);
      }
    }

    else
    {
      int v12 = self->_ucat->var0;
      if (v12 > 90 || v12 == -1 && !_LogCategory_Initialize())
      {
        id v6 = 0LL;
        goto LABEL_11;
      }

      CUPrintErrorCode();
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

LABEL_11:
    goto LABEL_12;
  }

  int v11 = self->_ucat->var0;
  if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_11;
  }

- (void)_receivedRequest:(id)a3
{
  id v4 = a3;
  NSDictionaryGetNSNumber();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 unsignedIntValue];
  if ((_DWORD)v6)
  {
    uint64_t v7 = v6;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CFDictionaryGetTypeID();
      uint64_t v9 = CFDictionaryGetTypedValue();
      int var0 = self->_ucat->var0;
      if (v9)
      {
        int v11 = (void *)v9;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v19 = v7;
          uint64_t v20 = [v11 count];
          uint64_t v18 = v8;
          LogPrintF();
        }

        if (objc_msgSend(v8, "isEqual:", @"_ping", v18, v19, v20))
        {
          -[SKConnection _sendResponse:error:xid:requestID:completion:]( self,  "_sendResponse:error:xid:requestID:completion:",  v11,  0LL,  v5,  v8,  &__block_literal_global_264);
        }

        else
        {
          uint64_t v12 = MEMORY[0x1895CC3E8](self->_receivedRequestHandler);
          uint64_t v13 = (void *)v12;
          if (v12)
          {
            v22[0] = MEMORY[0x1895F87A8];
            v22[1] = 3221225472LL;
            v22[2] = __33__SKConnection__receivedRequest___block_invoke_3;
            v22[3] = &unk_18A2812B0;
            void v22[4] = self;
            v22[5] = v8;
            int v23 = v7;
            v22[6] = v5;
            (*(void (**)(uint64_t, void *, void *, void, void *))(v12 + 16))(v12, v8, v11, 0LL, v22);
          }

          else
          {
            int v14 = self->_ucat->var0;
            NSErrorF_safe();
            int v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKConnection _sendResponse:error:xid:requestID:completion:]( self,  "_sendResponse:error:xid:requestID:completion:",  0LL,  v15,  v5,  v8,  &__block_literal_global_267);
          }
        }
      }

      else
      {
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintErrorCode();
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
        }

        int v11 = 0LL;
      }
    }

    else
    {
      int v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize())
      {
        id v8 = 0LL;
        goto LABEL_19;
      }

      CUPrintErrorCode();
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

LABEL_19:
    goto LABEL_20;
  }

  int v16 = self->_ucat->var0;
  if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_19;
  }

- (void)_receivedResponse:(id)a3
{
  id v4 = a3;
  NSDictionaryGetNSNumber();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 unsignedIntValue];
  if ((_DWORD)v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v5);
    if (!v8)
    {
      int var0 = self->_ucat->var0;
      uint64_t v9 = 0LL;
      goto LABEL_20;
    }

    uint64_t v9 = (void *)v8;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0LL, v5);
    [v9 timer];
    int v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    [v9 setTimer:0];
    if (v10) {
      dispatch_source_cancel(v10);
    }
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      mach_absolute_time();
      [v9 sendTicks];
      uint64_t v12 = UpTicksToMilliseconds();
      CUDecodeNSErrorDictionary();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = self->_ucat->var0;
      if (v13)
      {
        if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          uint64_t v21 = v12;
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = v7;
          LogPrintF();
        }

        objc_msgSend(v9, "responseHandler", v20, v21, v22);
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v16 = (void (*)(void))v15[2];
      }

      else
      {
        if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v20 = v7;
          uint64_t v21 = v12;
          LogPrintF();
        }

        objc_msgSend(v9, "responseHandler", v20, v21);
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v16 = (void (*)(void))v15[2];
      }

      v16();
    }

    else
    {
      int v19 = self->_ucat->var0;
      CUPrintErrorCode();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }

  int v17 = self->_ucat->var0;
  if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_20;
  }

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)authHidePasswordHandler
{
  return self->_authHidePasswordHandler;
}

- (void)setAuthHidePasswordHandler:(id)a3
{
}

- (id)authShowPasswordHandler
{
  return self->_authShowPasswordHandler;
}

- (void)setAuthShowPasswordHandler:(id)a3
{
}

- (id)authPromptHandler
{
  return self->_authPromptHandler;
}

- (void)setAuthPromptHandler:(id)a3
{
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

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
}

- (CBConnection)bleConnection
{
  return self->_bleConnection;
}

- (void)setBleConnection:(id)a3
{
}

- (SKDevice)blePeerDevice
{
  return self->_blePeerDevice;
}

- (void)setBlePeerDevice:(id)a3
{
}

- (unsigned)bluetoothUseCase
{
  return self->_bluetoothUseCase;
}

- (void)setBluetoothUseCase:(unsigned int)a3
{
  self->_bluetoothUseCase = a3;
}

- (BOOL)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(BOOL)a3
{
  self->_clientMode = a3;
}

- (BOOL)conditionalPersistent
{
  return self->_conditionalPersistent;
}

- (void)setConditionalPersistent:(BOOL)a3
{
  self->_conditionalPersistent = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)pairSetupConfigHandler
{
  return self->_pairSetupConfigHandler;
}

- (void)setPairSetupConfigHandler:(id)a3
{
}

- (BOOL)persistentPairing
{
  return self->_persistentPairing;
}

- (void)setPersistentPairing:(BOOL)a3
{
  self->_persistentPairing = a3;
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
}

- (BOOL)reversePairing
{
  return self->_reversePairing;
}

- (void)setReversePairing:(BOOL)a3
{
  self->_reversePairing = a3;
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __33__SKConnection__receivedRequest___block_invoke_3( void *a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = a1[4];
  if (*(_BYTE *)(v12 + 52))
  {
    int v13 = **(_DWORD **)(v12 + 144);
  }

  else
  {
    [(id)v12 _sendResponse:v14 error:v10 xid:a1[6] requestID:a1[5] completion:v11];
  }
}

void __54__SKConnection__receivedHeader_unencryptedObjectData___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }

void __52__SKConnection__receivedHeader_encryptedObjectData___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }

uint64_t __35__SKConnection__receiveCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40)];
}

uint64_t __30__SKConnection__receiveStart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40)];
}

void __29__SKConnection_receivedData___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) length];
  if (v2 <= 3)
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 40) + 144LL);
  }

  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) bytes];
    objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 4, v2 - 4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) _receivedHeader:v3 body:v5];
  }

void __40__SKConnection__abortRequestsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
  if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [v12 unsignedIntValue];
    CUPrintNSError();
    uint64_t v10 = v7;
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  objc_msgSend(v5, "timer", v10, v11);
  uint64_t v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  [v5 setTimer:0];
  if (v8) {
    dispatch_source_cancel(v8);
  }
  [v5 responseHandler];
  id v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  [v5 setResponseHandler:0];
  if (v9) {
    v9[2](v9, 0LL, 0LL, *(void *)(a1 + 40));
  }
}

void __52__SKConnection__sendHeaderData_bodyData_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = (id)v2;
  if (v2)
  {
    NSErrorNestedF();
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }

  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
}

uint64_t __61__SKConnection__sendResponse_error_xid_requestID_completion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

uint64_t __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke( void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(a1[6] + 16LL))();
  }

  return result;
}

uint64_t __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _timeoutForXID:*(void *)(a1 + 48)];
}

uint64_t __62__SKConnection_sendRequestID_request_options_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _timeoutForSendEntry:*(void *)(a1 + 48)];
}

uint64_t __57__SKConnection__sendEventID_data_xid_options_completion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(a1[6] + 16LL))();
  }

  return result;
}

uint64_t __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40LL))
  {
    uint64_t v2 = result;
    int v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        CUPrintNSError();
        int v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        int v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    return [v3 _serverPairVerifyCompleted:*(void *)(*(void *)(v1 + 8) + 40)];
  }

  return result;
}

void __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  v8[1] = *MEMORY[0x1895F89C0];
  int v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[10])
  {
    uint64_t v7 = @"_pd";
    v8[0] = a3;
    int v4 = (void *)MEMORY[0x189603F68];
    id v5 = a3;
    [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 _sendFrameType:7 unencryptedObject:v6];
  }

void *__56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[10]) {
    return (void *)[result _serverPairVerifyCompleted:a2];
  }
  return result;
}

uint64_t __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40LL))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        CUPrintNSError();
        int v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    return [v3 _serverPairSetupCompleted:*(void *)(*(void *)(v1 + 8) + 40)];
  }

  return result;
}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v5 + 72))
  {
    id v8 = v4;
    *(_BYTE *)(v5 + 112) = 1;
    uint64_t v6 = MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 40) + 192LL));
    uint64_t v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, *(unsigned int *)(*(void *)(a1 + 40) + 160LL), v8);
    }

    id v4 = v8;
  }
}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 72) && *(_BYTE *)(v1 + 112))
  {
    *(_BYTE *)(v1 + 112) = 0;
    uint64_t v2 = (void (**)(void))MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 40) + 184LL));
    if (v2)
    {
      uint64_t v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3)
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[9])
  {
    uint64_t v7 = @"_pd";
    v8[0] = a3;
    id v4 = (void *)MEMORY[0x189603F68];
    id v5 = a3;
    [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 _sendFrameType:3 unencryptedObject:v6];
  }

void *__55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[9]) {
    return (void *)[result _serverPairSetupCompleted:a2];
  }
  return result;
}

void __32__SKConnection__serverAcceptBLE__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v1[29])
  {
    NSErrorNestedF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _serverError:v2];
  }

uint64_t __32__SKConnection__serverAcceptBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 232))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    id v5 = *(void **)(v1 + 232);
    *(void *)(v1 + 232) = 0LL;

    uint64_t v6 = *(void *)(v2 + 40);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;

    return [*(id *)(v2 + 40) _invalidated];
  }

  return result;
}

uint64_t __42__SKConnection__clientPairVerifyWithData___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40LL))
  {
    uint64_t v2 = result;
    int v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        CUPrintNSError();
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        int v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    return [v3 _clientPairVerifyCompleted:*(void *)(*(void *)(v1 + 8) + 40)];
  }

  return result;
}

void __38__SKConnection__clientPairVerifyStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  v9[1] = *MEMORY[0x1895F89C0];
  int v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[10])
  {
    uint64_t v4 = a2 & 1 ^ 7u;
    id v8 = @"_pd";
    v9[0] = a3;
    int v5 = (void *)MEMORY[0x189603F68];
    id v6 = a3;
    [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 _sendFrameType:v4 unencryptedObject:v7];
  }

void *__38__SKConnection__clientPairVerifyStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[10]) {
    return (void *)[result _clientPairVerifyCompleted:a2];
  }
  return result;
}

void __77__SKConnection__clientPairSetupPromptWithFlags_passwordType_throttleSeconds___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 24))
  {
    uint64_t v3 = *(void *)(v1 + 16);
    if ((uint64_t)(v3 - mach_absolute_time()) < 1)
    {
      uint64_t v3 = 0LL;
    }

    else
    {
      UpTicksToSecondsF();
      LODWORD(v3) = llround(v4);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = **(_DWORD **)(v5 + 144);
    if (v6 <= 30)
    {
      if (v6 != -1 || (v7 = _LogCategory_Initialize(), uint64_t v5 = *(void *)(a1 + 40), v7))
      {
        LogPrintF();
        uint64_t v5 = *(void *)(a1 + 40);
      }
    }

    if ((int)v3 <= 0)
    {
      id v9 = *(void **)(v5 + 24);
      if (v9)
      {
        uint64_t v10 = v9;
        dispatch_source_cancel(v10);
        uint64_t v11 = *(void *)(a1 + 40);
        id v12 = *(void **)(v11 + 24);
        *(void *)(v11 + 24) = 0LL;

        uint64_t v8 = 0LL;
        uint64_t v5 = *(void *)(a1 + 40);
      }

      else
      {
        uint64_t v8 = 0LL;
      }
    }

    else
    {
      uint64_t v8 = 0x20000LL;
    }

    int v13 = (void (**)(void, void, void, void))MEMORY[0x1895CC3E8](*(void *)(v5 + 200));
    if (v13)
    {
      id v14 = v13;
      v13[2](v13, *(unsigned int *)(a1 + 48), v8, v3);
      int v13 = (void (**)(void, void, void, void))v14;
    }
  }

uint64_t __49__SKConnection__clientPairSetupContinueWithData___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40LL))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        CUPrintNSError();
        int v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    return [v3 _clientPairSetupCompleted:*(void *)(*(void *)(v1 + 8) + 40)];
  }

  return result;
}

uint64_t __37__SKConnection__clientPairSetupStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_clientPairSetupPromptWithFlags:passwordType:throttleSeconds:",  a2,  objc_msgSend(*(id *)(a1 + 40), "pinTypeActual"),  a3);
}

void __37__SKConnection__clientPairSetupStart__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[9])
  {
    uint64_t v4 = a2 & 1 ^ 3u;
    uint64_t v8 = @"_pd";
    v9[0] = a3;
    int v5 = (void *)MEMORY[0x189603F68];
    id v6 = a3;
    [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 _sendFrameType:v4 unencryptedObject:v7];
  }

void *__37__SKConnection__clientPairSetupStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[9]) {
    return (void *)[result _clientPairSetupCompleted:a2];
  }
  return result;
}

void __38__SKConnection__clientConnectStartBLE__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v1[29])
  {
    NSErrorNestedF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _clientError:v2];
  }

uint64_t __38__SKConnection__clientConnectStartBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 232))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    int v5 = *(void **)(v1 + 232);
    *(void *)(v1 + 232) = 0LL;

    uint64_t v6 = *(void *)(v2 + 40);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;

    uint64_t result = *(void *)(v2 + 40);
    if (*(_BYTE *)(result + 52)) {
      return [(id)result _invalidated];
    }
  }

  return result;
}

void __38__SKConnection__clientConnectStartBLE__block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 232))
  {
    objc_storeStrong((id *)(v4 + 40), v3);
    id v6 = a2;
    [*(id *)(a1 + 40) _clientConnectCompleted:v6];
  }

void __35__SKConnection_updatePasswordType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(_BYTE **)(a1 + 32);
  if (!v1[52])
  {
    uint64_t v4 = @"_pt";
    [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 40)];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 _sendFrameType:8 unencryptedObject:v3];
  }

void __28__SKConnection_tryPassword___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 156) || *(_BYTE *)(v2 + 159))
  {
    id v3 = *(id *)(v2 + 72);
    uint64_t v4 = v3;
    id v8 = v3;
    if (v3)
    {
      [v3 tryPIN:*(void *)(a1 + 40)];
    }

    else
    {
      int v5 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
      if (v5 > 90) {
        goto LABEL_6;
      }
      if (v5 == -1)
      {
        int v7 = _LogCategory_Initialize();
        uint64_t v4 = 0LL;
        if (!v7) {
          goto LABEL_6;
        }
      }

      LogPrintF();
    }

    uint64_t v4 = v8;
LABEL_6:

    return;
  }

  int v6 = **(_DWORD **)(v2 + 144);
}

uint64_t __26__SKConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:0];
}

uint64_t __40__SKConnection__activateWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

uint64_t __39__SKConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

@end