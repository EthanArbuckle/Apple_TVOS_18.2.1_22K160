@interface SKSetupBase
- (BOOL)_runSteps;
- (BOOL)conditionalPersistent;
- (BOOL)persistentPairing;
- (BOOL)reversePairing;
- (CUMessageSession)messageSessionTemplate;
- (NSData)authTagOverride;
- (NSData)pskData;
- (NSString)description;
- (NSString)label;
- (NSString)password;
- (OS_dispatch_queue)dispatchQueue;
- (SKDevice)peerDevice;
- (SKSetupBase)initWithLogCategory:(LogCategory *)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)eventHandler;
- (id)passwordTypeChangedHandler;
- (id)sendDataHandler;
- (int)passwordType;
- (int)setupType;
- (unsigned)bluetoothUseCase;
- (unsigned)controlFlags;
- (void)_addStep:(id)a3;
- (void)_completeWithError:(id)a3;
- (void)_completedStep:(id)a3 error:(id)a4;
- (void)_connectionStartWithSKConnection:(id)a3 clientMode:(BOOL)a4 completeOnFailure:(BOOL)a5 completion:(id)a6;
- (void)_invalidate;
- (void)_invalidateSteps;
- (void)_invalidated;
- (void)_pairSetupConfig:(id)a3;
- (void)_postEvent:(id)a3;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_reportEvent:(id)a3;
- (void)_reportEventType:(int)a3;
- (void)_setupMessageSession;
- (void)_tearDownMessageSession;
- (void)activate;
- (void)addStep:(id)a3;
- (void)dealloc;
- (void)deregisterEventID:(id)a3 completionHandler:(id)a4;
- (void)deregisterRequestID:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)postEvent:(id)a3;
- (void)postEventType:(int)a3;
- (void)receivedData:(id)a3;
- (void)registerEventID:(id)a3 options:(id)a4 eventHandler:(id)a5 completionHandler:(id)a6;
- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6;
- (void)reportEvent:(id)a3;
- (void)reportEventType:(int)a3;
- (void)sendEventID:(id)a3 eventMessage:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)sendRequestID:(id)a3 requestMessage:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAuthTagOverride:(id)a3;
- (void)setBluetoothUseCase:(unsigned int)a3;
- (void)setConditionalPersistent:(BOOL)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPasswordTypeChangedHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPersistentPairing:(BOOL)a3;
- (void)setPskData:(id)a3;
- (void)setReversePairing:(BOOL)a3;
- (void)setSendDataHandler:(id)a3;
- (void)setSetupType:(int)a3;
@end

@implementation SKSetupBase

- (SKSetupBase)initWithLogCategory:(LogCategory *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKSetupBase;
  v4 = -[SKSetupBase init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v5->_ucat = a3;
    v5->_ucatBase = a3;
    v6 = v5;
  }

  return v5;
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
  v4.super_class = (Class)&OBJC_CLASS___SKSetupBase;
  -[SKSetupBase dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SKSetupBase descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v4 = 0LL;
  }

  CUPrintFlags32();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  id v5 = v4;

  pskData = self->_pskData;
  if (pskData)
  {
    v7 = pskData;
    -[NSData length](v7, "length", v14);
    CUAppendF();
    id v8 = v5;

    id v5 = v8;
  }

  CUAppendF();
  v9 = (__CFString *)v5;

  v10 = &stru_18A2823D0;
  if (v9) {
    v10 = v9;
  }
  v11 = v10;

  return v11;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setPasswordType:(int)a3
{
  int passwordType = self->_passwordType;
  self->_int passwordType = a3;
  if (passwordType != a3 && self->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __31__SKSetupBase_setPasswordType___block_invoke;
    v5[3] = &unk_18A281798;
    v5[4] = self;
    int v6 = a3;
    dispatch_async(dispatchQueue, v5);
  }

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __23__SKSetupBase_activate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__SKSetupBase_invalidate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  registeredEvents = self->_registeredEvents;
  self->_registeredEvents = 0LL;

  registeredRequests = self->_registeredRequests;
  self->_registeredRequests = 0LL;

  -[SKConnection invalidate](self->_skCnx, "invalidate");
  skCnx = self->_skCnx;
  self->_skCnx = 0LL;

  -[SKSetupBase _tearDownMessageSession](self, "_tearDownMessageSession");
  -[SKSetupBase _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    -[SKSetupBase _reportEventType:](self, "_reportEventType:", 30LL);
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = 0LL;

    id passwordTypeChangedHandler = self->_passwordTypeChangedHandler;
    self->_id passwordTypeChangedHandler = 0LL;

    id sendDataHandler = self->_sendDataHandler;
    self->_id sendDataHandler = 0LL;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
  }

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v9 = v4;
  if (v4)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    int v6 = 3;
  }

  else
  {
    int v6 = 4;
  }

  self->_runState = v6;
  v7 = -[SKEvent initWithEventType:error:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:error:", 20LL, v9);
  -[SKSetupBase _reportEvent:](self, "_reportEvent:", v7);
}

- (void)postEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __25__SKSetupBase_postEvent___block_invoke;
  v7[3] = &unk_18A2820C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)postEventType:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __29__SKSetupBase_postEventType___block_invoke;
  v4[3] = &unk_18A281798;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_postEvent:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v12, v6))
    {
      id v11 = v4;
      LogPrintF();
      id v4 = v12;
    }
  }

  if (objc_msgSend(v4, "eventType", v11) == 130)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v7 = v12;
      [v7 password];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SKConnection tryPassword:](self->_skCnx, "tryPassword:", v8);
      }

      else
      {
        int v10 = self->_ucat->var0;
      }
    }

    else
    {
      int v9 = self->_ucat->var0;
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        objc_opt_class();
        LogPrintF();
      }
    }
  }
}

- (void)reportEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __27__SKSetupBase_reportEvent___block_invoke;
  v7[3] = &unk_18A2820C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_reportEvent:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  uint64_t v5 = MEMORY[0x1895CC3E8](self->_eventHandler);
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

- (void)reportEventType:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __31__SKSetupBase_reportEventType___block_invoke;
  v4[3] = &unk_18A281798;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_reportEventType:(int)a3
{
  id v4 = -[SKEvent initWithEventType:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:", *(void *)&a3);
  -[SKSetupBase _reportEvent:](self, "_reportEvent:", v4);
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __28__SKSetupBase_receivedData___block_invoke;
  v7[3] = &unk_18A2820C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_connectionStartWithSKConnection:(id)a3 clientMode:(BOOL)a4 completeOnFailure:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = __Block_byref_object_copy__879;
  v42 = __Block_byref_object_dispose__880;
  id v43 = 0LL;
  uint64_t v12 = MEMORY[0x1895F87A8];
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke;
  v34[3] = &unk_18A2817C0;
  v36 = &v38;
  v34[4] = self;
  id v13 = v11;
  id v35 = v13;
  BOOL v37 = a5;
  v14 = (void (**)(void))MEMORY[0x1895CC3E8](v34);
  -[SKConnection invalidate](self->_skCnx, "invalidate");
  if (v10) {
    v15 = (SKConnection *)v10;
  }
  else {
    v15 = objc_alloc_init(&OBJC_CLASS___SKConnection);
  }
  v16 = v15;
  objc_storeStrong((id *)&self->_skCnx, v15);
  -[SKConnection setBluetoothUseCase:](v16, "setBluetoothUseCase:", self->_bluetoothUseCase);
  -[SKConnection setClientMode:](v16, "setClientMode:", v8);
  -[SKConnection setConditionalPersistent:](v16, "setConditionalPersistent:", self->_conditionalPersistent);
  -[SKConnection setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
  -[SKConnection setPassword:](v16, "setPassword:", self->_password);
  -[SKConnection setPasswordType:](v16, "setPasswordType:", self->_passwordType);
  -[SKConnection setPersistentPairing:](v16, "setPersistentPairing:", self->_persistentPairing);
  -[SKConnection setPskData:](v16, "setPskData:", self->_pskData);
  -[SKConnection setReversePairing:](v16, "setReversePairing:", self->_reversePairing);
  -[SKConnection setSendDataHandler:](v16, "setSendDataHandler:", self->_sendDataHandler);
  if (v8 && !self->_sendDataHandler)
  {
    v17 = self->_peerDevice;
    if (!v17)
    {
      uint64_t v20 = NSErrorF_safe();
      v21 = (void *)v39[5];
      v39[5] = v20;

      goto LABEL_13;
    }

    v18 = v17;
    -[SKConnection setBlePeerDevice:](v16, "setBlePeerDevice:", v17);
  }

  v33[0] = v12;
  v33[1] = 3221225472LL;
  v33[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_2;
  v33[3] = &unk_18A281CC8;
  v33[4] = self;
  -[SKConnection setAuthCompletionHandler:](v16, "setAuthCompletionHandler:", v33);
  v32[0] = v12;
  v32[1] = 3221225472LL;
  v32[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_3;
  v32[3] = &unk_18A281D18;
  v32[4] = self;
  -[SKConnection setAuthPromptHandler:](v16, "setAuthPromptHandler:", v32);
  v31[0] = v12;
  v31[1] = 3221225472LL;
  v31[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_4;
  v31[3] = &unk_18A281D40;
  v31[4] = self;
  -[SKConnection setAuthShowPasswordHandler:](v16, "setAuthShowPasswordHandler:", v31);
  v30[0] = v12;
  v30[1] = 3221225472LL;
  v30[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_5;
  v30[3] = &unk_18A282310;
  v30[4] = v16;
  v30[5] = self;
  -[SKConnection setErrorHandler:](v16, "setErrorHandler:", v30);
  v29[0] = v12;
  v29[1] = 3221225472LL;
  v29[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_6;
  v29[3] = &unk_18A2820C0;
  v29[4] = self;
  v29[5] = v16;
  -[SKConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v29);
  v28[0] = v12;
  v28[1] = 3221225472LL;
  v28[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_7;
  v28[3] = &unk_18A281D68;
  v28[4] = self;
  -[SKConnection setPairSetupConfigHandler:](v16, "setPairSetupConfigHandler:", v28);
  v27[0] = v12;
  v27[1] = 3221225472LL;
  v27[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_8;
  v27[3] = &unk_18A281D90;
  v27[4] = v16;
  v27[5] = self;
  -[SKConnection setReceivedEventHandler:](v16, "setReceivedEventHandler:", v27);
  v26[0] = v12;
  v26[1] = 3221225472LL;
  v26[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_9;
  v26[3] = &unk_18A2822E8;
  v26[4] = v16;
  v26[5] = self;
  -[SKConnection setReceivedRequestHandler:](v16, "setReceivedRequestHandler:", v26);
  v25[0] = v12;
  v25[1] = 3221225472LL;
  v25[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_10;
  v25[3] = &unk_18A2820C0;
  v25[4] = v16;
  v25[5] = self;
  -[SKConnection setStateChangedHandler:](v16, "setStateChangedHandler:", v25);
  int var0 = self->_ucat->var0;
  v22[0] = v12;
  v22[1] = 3221225472LL;
  v22[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_11;
  v22[3] = &unk_18A2817E8;
  v22[4] = v16;
  v22[5] = self;
  id v23 = v13;
  BOOL v24 = a5;
  -[SKConnection activateWithCompletion:](v16, "activateWithCompletion:", v22);

LABEL_13:
  v14[2](v14);

  _Block_object_dispose(&v38, 8);
}

- (void)_pairSetupConfig:(id)a3
{
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  id passwordTypeChangedHandler = (void (**)(id, uint64_t))self->_passwordTypeChangedHandler;
  if (passwordTypeChangedHandler) {
    passwordTypeChangedHandler[2](passwordTypeChangedHandler, Int64Ranged);
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v12);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 handler];
  id v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();

  if (v11) {
    ((void (**)(void, id, id, id))v11)[2](v11, v12, v8, v9);
  }
}

- (void)registerEventID:(id)a3 options:(id)a4 eventHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__SKSetupBase_registerEventID_options_eventHandler_completionHandler___block_invoke;
  block[3] = &unk_18A281810;
  block[4] = self;
  id v20 = v10;
  id v22 = v13;
  id v23 = v12;
  id v21 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)deregisterEventID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__SKSetupBase_deregisterEventID_completionHandler___block_invoke;
  block[3] = &unk_18A281838;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)sendEventID:(id)a3 eventMessage:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__SKSetupBase_sendEventID_eventMessage_options_completionHandler___block_invoke;
  block[3] = &unk_18A281860;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v17);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 handler];
  id v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, id, id, id, id))(v14 + 16))(v14, v17, v10, v11, v12);
  }

  else
  {
    NSErrorF_safe();
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *, void *))v12 + 2))( v12,  0LL,  0LL,  v16,  &__block_literal_global_872);
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __74__SKSetupBase_registerRequestID_options_requestHandler_completionHandler___block_invoke;
  block[3] = &unk_18A281810;
  block[4] = self;
  id v20 = v10;
  id v22 = v13;
  id v23 = v12;
  id v21 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)deregisterRequestID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__SKSetupBase_deregisterRequestID_completionHandler___block_invoke;
  block[3] = &unk_18A281838;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)sendRequestID:(id)a3 requestMessage:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__SKSetupBase_sendRequestID_requestMessage_options_responseHandler___block_invoke;
  block[3] = &unk_18A281860;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

- (CUMessageSession)messageSessionTemplate
{
  messageSessionTemplate = self->_messageSessionTemplate;
  if (!messageSessionTemplate)
  {
    -[SKSetupBase _setupMessageSession](self, "_setupMessageSession");
    messageSessionTemplate = self->_messageSessionTemplate;
  }

  return messageSessionTemplate;
}

- (void)_setupMessageSession
{
  if (!self->_messageSessionServer)
  {
    int var0 = self->_ucat->var0;
    id v4 = (CUMessageSessionServer *)objc_alloc_init(MEMORY[0x18960ED30]);
    messageSessionServer = self->_messageSessionServer;
    self->_messageSessionServer = v4;

    -[CUMessageSessionServer setDispatchQueue:](self->_messageSessionServer, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke;
    v12[3] = &unk_18A281918;
    v12[4] = self;
    -[CUMessageSessionServer setRegisterRequestHandler:](self->_messageSessionServer, "setRegisterRequestHandler:", v12);
    v11[0] = v6;
    v11[1] = 3221225472LL;
    v11[2] = __35__SKSetupBase__setupMessageSession__block_invoke_6;
    v11[3] = &unk_18A281960;
    v11[4] = self;
    -[CUMessageSessionServer setDeregisterRequestHandler:]( self->_messageSessionServer,  "setDeregisterRequestHandler:",  v11);
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __35__SKSetupBase__setupMessageSession__block_invoke_8;
    v10[3] = &unk_18A2819B0;
    v10[4] = self;
    -[CUMessageSessionServer setSendRequestHandler:](self->_messageSessionServer, "setSendRequestHandler:", v10);
    -[CUMessageSessionServer activate](self->_messageSessionServer, "activate");
    -[CUMessageSessionServer templateSession](self->_messageSessionServer, "templateSession");
    id v7 = (CUMessageSession *)objc_claimAutoreleasedReturnValue();
    messageSessionTemplate = self->_messageSessionTemplate;
    self->_messageSessionTemplate = v7;

    if (!self->_messageSessionTemplate)
    {
      int v9 = self->_ucat->var0;
    }
  }

- (void)_tearDownMessageSession
{
  messageSessionTemplate = self->_messageSessionTemplate;
  self->_messageSessionTemplate = 0LL;

  -[CUMessageSessionServer invalidate](self->_messageSessionServer, "invalidate");
  messageSessionServer = self->_messageSessionServer;
  self->_messageSessionServer = 0LL;
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __23__SKSetupBase_addStep___block_invoke;
  v7[3] = &unk_18A2820C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_addStep:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v12, v6))
    {
      id v11 = v4;
      LogPrintF();
      id v4 = v12;
    }
  }

  objc_msgSend(v4, "skSetupObject", v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7) {
    [v12 setSkSetupObject:self];
  }
  stepArray = self->_stepArray;
  if (!stepArray)
  {
    int v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    id v10 = self->_stepArray;
    self->_stepArray = v9;

    stepArray = self->_stepArray;
  }

  -[NSMutableArray addObject:](stepArray, "addObject:", v12);
}

- (void)_completedStep:(id)a3 error:(id)a4
{
  id v13 = (SKStepable *)a3;
  id v6 = a4;
  if (self->_stepCurrent == v13)
  {
    id v8 = v6;
    int var0 = self->_ucat->var0;
    if (v8)
    {
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v11 = v13;
        LogPrintF();
      }
    }

    else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v13;
      LogPrintF();
    }

    -[SKStepable invalidate](v13, "invalidate", v11, v12);
    stepCurrent = self->_stepCurrent;
    self->_stepCurrent = 0LL;

    if (v8) {
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", v8);
    }
    else {
      -[SKSetupBase _run](self, "_run");
    }
    goto LABEL_20;
  }

  int v7 = self->_ucat->var0;
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_20:
  }
}

- (void)_invalidateSteps
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[SKStepable setSkCompletionHandler:](self->_stepCurrent, "setSkCompletionHandler:", 0LL);
  -[SKStepable invalidate](self->_stepCurrent, "invalidate");
  stepCurrent = self->_stepCurrent;
  self->_stepCurrent = 0LL;

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = self->_stepArray;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setSkCompletionHandler:", 0, (void)v11);
        [v9 invalidate];
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_stepArray, "removeAllObjects");
  stepArray = self->_stepArray;
  self->_stepArray = 0LL;
}

- (BOOL)_runSteps
{
  p_stepCurrent = &self->_stepCurrent;
  if (self->_stepCurrent) {
    return 0;
  }
  -[NSMutableArray popFirstObject](self->_stepArray, "popFirstObject");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v4 == 0LL;
  if (v4)
  {
    objc_storeStrong((id *)p_stepCurrent, v4);
    [v4 activate];
  }

  return v3;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)authTagOverride
{
  return self->_authTagOverride;
}

- (void)setAuthTagOverride:(id)a3
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

- (BOOL)conditionalPersistent
{
  return self->_conditionalPersistent;
}

- (void)setConditionalPersistent:(BOOL)a3
{
  self->_conditionalPersistent = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
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

- (id)passwordTypeChangedHandler
{
  return self->_passwordTypeChangedHandler;
}

- (void)setPasswordTypeChangedHandler:(id)a3
{
}

- (SKDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
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

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
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

- (int)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(int)a3
{
  self->_setupType = a3;
}

- (void).cxx_destruct
{
}

uint64_t __23__SKSetupBase_addStep___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addStep:*(void *)(a1 + 40)];
}

void __35__SKSetupBase__setupMessageSession__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  int v9 = v8;
  id v10 = *(void **)(a1 + 32);
  if (v10[20])
  {
    uint64_t v11 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __35__SKSetupBase__setupMessageSession__block_invoke_2;
    v14[3] = &unk_18A2818F0;
    id v15 = v8;
    v12[0] = v11;
    v12[1] = 3221225472LL;
    v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_5;
    v12[3] = &unk_18A282310;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v7;
    [v10 registerRequestID:v13 options:a3 requestHandler:v14 completionHandler:v12];
  }
}

void *__35__SKSetupBase__setupMessageSession__block_invoke_6(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[20]) {
    return (void *)[result deregisterRequestID:a2 completionHandler:&__block_literal_global_63];
  }
  return result;
}

void __35__SKSetupBase__setupMessageSession__block_invoke_8( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  void *a5)
{
  id v9 = a5;
  id v10 = v9;
  uint64_t v11 = *(void **)(a1 + 32);
  if (v11[20])
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_9;
    v12[3] = &unk_18A281988;
    id v13 = v9;
    [v11 sendRequestID:a2 requestMessage:a4 options:a3 responseHandler:v12];
  }
}

void __35__SKSetupBase__setupMessageSession__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v7 = a2;
  uint64_t v6 = NSErrorToOSStatus();
  (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, v6, v5, v7);
}

void __35__SKSetupBase__setupMessageSession__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  void *a5)
{
  id v8 = a5;
  uint64_t v9 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_3;
  v12[3] = &unk_18A2818C8;
  id v13 = v8;
  id v10 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v9 + 16);
  id v11 = v8;
  v10(v9, a4, a3, v12);
}

void __35__SKSetupBase__setupMessageSession__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
    if (v5 <= 90)
    {
      id v8 = v3;
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), uint64_t v4 = v8, v6))
      {
        CUPrintNSError();
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v4 = v8;
      }
    }
  }
}

void __35__SKSetupBase__setupMessageSession__block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2)
  {
    int v6 = (void *)MEMORY[0x189607870];
    uint64_t v7 = *MEMORY[0x189607670];
    uint64_t v8 = a2;
    id v9 = a4;
    id v10 = a3;
    [v6 errorWithDomain:v7 code:v8 userInfo:0];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v9, v10);
  }

  else
  {
    id v11 = *(void (**)(uint64_t, id))(v5 + 16);
    id v10 = a4;
    id v12 = a3;
    v11(v5, v10);
  }
}

void __68__SKSetupBase_sendRequestID_requestMessage_options_responseHandler___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 120LL);
  id v6 = v2;
  if (v2)
  {
    [v2 sendRequestID:a1[5] request:a1[6] options:a1[7] responseHandler:a1[8]];
  }

  else
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    uint64_t v4 = a1[8];
    NSErrorF_safe();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0LL, 0LL, v5);
  }
}

uint64_t __53__SKSetupBase_deregisterRequestID_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  int v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[4], v4))
    {
      uint64_t v6 = a1[5];
      LogPrintF();
      uint64_t v2 = a1[4];
    }
  }

  objc_msgSend(*(id *)(v2 + 88), "setObject:forKeyedSubscript:", 0, a1[5], v6);
  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

void __74__SKSetupBase_registerRequestID_options_requestHandler_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  int v3 = **(_DWORD **)(a1[4] + 144LL);
  if (v2)
  {
    uint64_t v4 = a1[7];
    NSErrorF_safe();
    id v10 = (SKRequestRegistration *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, SKRequestRegistration *))(v4 + 16))(v4, v10);
  }

  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = a1[5];
      LogPrintF();
    }

    id v10 = objc_alloc_init(&OBJC_CLASS___SKRequestRegistration);
    -[SKRequestRegistration setHandler:](v10, "setHandler:", a1[8]);
    -[SKRequestRegistration setOptions:](v10, "setOptions:", a1[6]);
    -[SKRequestRegistration setRequestID:](v10, "setRequestID:", a1[5]);
    uint64_t v5 = *(void **)(a1[4] + 88LL);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v7 = a1[4];
      uint64_t v8 = *(void **)(v7 + 88);
      *(void *)(v7 + 88) = v6;

      uint64_t v5 = *(void **)(a1[4] + 88LL);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, a1[5], v9);
    (*(void (**)(void, void))(a1[7] + 16LL))(a1[7], 0LL);
  }
}

void __66__SKSetupBase_sendEventID_eventMessage_options_completionHandler___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 120LL);
  id v6 = v2;
  if (v2)
  {
    [v2 sendEventID:a1[5] event:a1[6] options:a1[7] completion:a1[8]];
  }

  else
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    uint64_t v4 = a1[8];
    NSErrorF_safe();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __51__SKSetupBase_deregisterEventID_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  int v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[4], v4))
    {
      uint64_t v6 = a1[5];
      LogPrintF();
      uint64_t v2 = a1[4];
    }
  }

  objc_msgSend(*(id *)(v2 + 80), "setObject:forKeyedSubscript:", 0, a1[5], v6);
  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

void __70__SKSetupBase_registerEventID_options_eventHandler_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  int v3 = **(_DWORD **)(a1[4] + 144LL);
  if (v2)
  {
    uint64_t v4 = a1[7];
    NSErrorF_safe();
    id v10 = (SKEventRegistration *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, SKEventRegistration *))(v4 + 16))(v4, v10);
  }

  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = a1[5];
      LogPrintF();
    }

    id v10 = objc_alloc_init(&OBJC_CLASS___SKEventRegistration);
    -[SKEventRegistration setEventID:](v10, "setEventID:", a1[5]);
    -[SKEventRegistration setHandler:](v10, "setHandler:", a1[8]);
    -[SKEventRegistration setOptions:](v10, "setOptions:", a1[6]);
    uint64_t v5 = *(void **)(a1[4] + 80LL);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v7 = a1[4];
      uint64_t v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;

      uint64_t v5 = *(void **)(a1[4] + 80LL);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, a1[5], v9);
    (*(void (**)(void, void))(a1[7] + 16LL))(a1[7], 0LL);
  }
}

uint64_t __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke( uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40));
    if (*(_BYTE *)(a1 + 56)) {
      return [*(id *)(a1 + 32) _completeWithError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }

  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[SKEvent initWithEventType:error:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:error:", 140LL, v3);

  [*(id *)(a1 + 32) _reportEvent:v4];
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v5 = -[SKAuthenticationRequestEvent initWithPasswordType:pairingFlags:throttleSeconds:]( objc_alloc(&OBJC_CLASS___SKAuthenticationRequestEvent),  "initWithPasswordType:pairingFlags:throttleSeconds:",  a2,  a3,  a4);
  [*(id *)(a1 + 32) _reportEvent:v5];
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  id v6 = -[SKAuthenticationPresentEvent initWithPasswordType:password:]( objc_alloc(&OBJC_CLASS___SKAuthenticationPresentEvent),  "initWithPasswordType:password:",  a2,  v5);

  [*(id *)(a1 + 32) _reportEvent:v6];
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_5( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    id v9 = v3;
    int v5 = **(_DWORD **)(v4 + 144);
    if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = 0LL;

    [*(id *)(a1 + 40) _run];
    id v3 = v9;
  }
}

int *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_6( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(int **)(v2 + 144);
  if (*result <= 30)
  {
    if (*result != -1 || (result = (int *)_LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), (_DWORD)result))
    {
      uint64_t result = (int *)LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4 == *(void **)(v2 + 120))
  {
    *(void *)(v2 + 120) = 0LL;

    [*(id *)(a1 + 32) _connectionEnded:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _reportEventType:41];
    return (int *)[*(id *)(a1 + 32) _run];
  }

  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_7( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[18];
  id v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), uint64_t v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      CUPrintNSObjectOneLine();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      id v3 = v8;
      uint64_t v4 = *(_DWORD ***)(a1 + 32);
    }

    else
    {
      id v3 = v8;
    }
  }

  objc_msgSend(v4, "_pairSetupConfig:", v3, v7);
}

void *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_8( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v5 == result[15]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_9( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[15]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

void *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_10( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[15]) {
    return (void *)[result _run];
  }
  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_11( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v13 = v3;
  if (v4 == *(void **)(v5 + 120))
  {
    int v8 = **(_DWORD **)(v5 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v11);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 120);
      *(void *)(v9 + 120) = 0LL;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      if (*(_BYTE *)(a1 + 56)) {
        [*(id *)(a1 + 40) _completeWithError:v13];
      }
      goto LABEL_19;
    }

    if (v8 <= 30)
    {
      if (v8 == -1)
      {
        uint64_t v4 = *(void **)(a1 + 32);
      }

      id v11 = v4;
      LogPrintF();
    }

uint64_t __28__SKSetupBase_receivedData___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) receivedData:*(void *)(a1 + 40)];
}

uint64_t __31__SKSetupBase_reportEventType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportEventType:*(unsigned int *)(a1 + 40)];
}

uint64_t __27__SKSetupBase_reportEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportEvent:*(void *)(a1 + 40)];
}

void __29__SKSetupBase_postEventType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = -[SKEvent initWithEventType:]( objc_alloc(&OBJC_CLASS___SKEvent),  "initWithEventType:",  *(unsigned int *)(a1 + 40));
  [v1 _postEvent:v2];
}

uint64_t __25__SKSetupBase_postEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postEvent:*(void *)(a1 + 40)];
}

uint64_t __25__SKSetupBase_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 40) = 1;
    id v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        id v3 = *(_DWORD ***)(v2 + 32);
      }
    }

    return [v3 _invalidate];
  }

  return result;
}

int *__23__SKSetupBase_activate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(int **)(v2 + 144);
  int v4 = *result;
  if (*(_BYTE *)(v2 + 40))
  {
    if (v4 <= 90)
    {
      if (v4 != -1) {
        return (int *)LogPrintF();
      }
      uint64_t result = (int *)_LogCategory_Initialize();
      if ((_DWORD)result) {
        return (int *)LogPrintF();
      }
    }
  }

  else
  {
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }

    return (int *)[(id)v2 _activate];
  }

  return result;
}

uint64_t __31__SKSetupBase_setPasswordType___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) updatePasswordType:*(unsigned int *)(a1 + 40)];
}

@end