@interface SKSetupClient
- (BOOL)skipWifi;
- (NSDictionary)clientConfig;
- (SKSetupClient)init;
- (id)authCompletionHandler;
- (id)authPromptHandler;
- (id)invalidationHandler;
- (id)overallCompletionHandler;
- (void)_activateBLEWithCompletion:(id)a3;
- (void)_activateNANContinueWithError:(id)a3;
- (void)_activateNANWithCompletion:(id)a3;
- (void)_activateOOBWithCompletion:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_completeWithError:(id)a3;
- (void)_invalidate;
- (void)_invalidateSteps;
- (void)_invalidated;
- (void)_prepareSteps;
- (void)_prepareStepsOSRecovery;
- (void)_run;
- (void)_setupConnectionCommon:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAuthPromptHandler:(id)a3;
- (void)setClientConfig:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setOverallCompletionHandler:(id)a3;
- (void)setSkipWifi:(BOOL)a3;
- (void)tryPassword:(id)a3;
@end

@implementation SKSetupClient

- (SKSetupClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupClient);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__SKSetupClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A281C28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = __Block_byref_object_copy__1431;
  v32 = __Block_byref_object_dispose__1432;
  id v33 = 0LL;
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __41__SKSetupClient__activateWithCompletion___block_invoke;
  v25[3] = &unk_18A281F78;
  v27 = &v28;
  v25[4] = self;
  id v5 = v4;
  id v26 = v5;
  id v6 = (void (**)(void))MEMORY[0x1895CC3E8](v25);
  if (self->super._activateCalled || self->super._invalidateCalled)
  {
    uint64_t v19 = NSErrorF_safe();
LABEL_24:
    v14 = (SKStepWiFiPreflight *)v29[5];
    v29[5] = v19;
    goto LABEL_25;
  }

  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t setupType = self->super._setupType;
    else {
      v9 = off_18A281DB0[setupType];
    }
    CUPrintFlags32();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    peerDevice = self->super._peerDevice;
    BOOL v12 = -[SKSetupBase reversePairing](self, "reversePairing");
    v13 = "no";
    if (v12) {
      v13 = "yes";
    }
    v22 = peerDevice;
    v23 = v13;
    v20 = v9;
    v21 = v10;
    LogPrintF();
  }

  self->super._activateCalled = 1;
  if (self->super._setupType == 1)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___SKStepWiFiPreflight);
    -[SKStepWiFiPreflight setPreventAppleWiFi:](v14, "setPreventAppleWiFi:", 0LL);
    v15 = (id *)(v29 + 5);
    id obj = (id)v29[5];
    BOOL v16 = -[SKStepWiFiPreflight checkWiFiAndReturnError:](v14, "checkWiFiAndReturnError:", &obj);
    objc_storeStrong(v15, obj);
    if (!v16)
    {
      (*((void (**)(id, void))v5 + 2))(v5, 0LL);
      -[SKSetupClient _completeWithError:](self, "_completeWithError:", v29[5]);
      v18 = (void *)v29[5];
      v29[5] = 0LL;

LABEL_25:
      goto LABEL_26;
    }
  }

  -[SKSetupClient _prepareSteps](self, "_prepareSteps", v20, v21, v22, v23);
  if (!self->super._sendDataHandler)
  {
    unsigned int controlFlags = self->super._controlFlags;
    if ((controlFlags & 2) != 0)
    {
      -[SKSetupClient _activateNANWithCompletion:](self, "_activateNANWithCompletion:", v5);
      goto LABEL_26;
    }

    if ((controlFlags & 1) == 0)
    {
      -[SKSetupClient _activateBLEWithCompletion:](self, "_activateBLEWithCompletion:", v5);
      goto LABEL_26;
    }

    uint64_t v19 = NSErrorF_safe();
    goto LABEL_24;
  }

  -[SKSetupClient _activateOOBWithCompletion:](self, "_activateOOBWithCompletion:", v5);
LABEL_26:
  v6[2](v6);

  _Block_object_dispose(&v28, 8);
}

- (void)_activateBLEWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__1431;
  v22 = __Block_byref_object_dispose__1432;
  id v23 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __44__SKSetupClient__activateBLEWithCompletion___block_invoke;
  v15[3] = &unk_18A281F78;
  v17 = &v18;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  v7 = (void (**)(void))MEMORY[0x1895CC3E8](v15);
  id v8 = objc_alloc_init(&OBJC_CLASS___SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v8);
  v9 = self->super._peerDevice;
  if (v9)
  {
    -[SKConnection setBlePeerDevice:](v8, "setBlePeerDevice:", v9);
    -[SKSetupClient _setupConnectionCommon:](self, "_setupConnectionCommon:", v8);
    int var0 = self->super._ucat->var0;
    v13[0] = v5;
    v13[1] = 3221225472LL;
    v13[2] = __44__SKSetupClient__activateBLEWithCompletion___block_invoke_2;
    v13[3] = &unk_18A281C50;
    v13[4] = v8;
    v13[5] = self;
    id v14 = v6;
    -[SKConnection activateWithCompletion:](v8, "activateWithCompletion:", v13);
  }

  else
  {
    uint64_t v11 = NSErrorF_safe();
    BOOL v12 = (void *)v19[5];
    v19[5] = v11;
  }

  v7[2](v7);
  _Block_object_dispose(&v18, 8);
}

- (void)_activateNANWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__1431;
  v25 = __Block_byref_object_dispose__1432;
  id v26 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke;
  v18[3] = &unk_18A281F78;
  uint64_t v20 = &v21;
  v18[4] = self;
  id v6 = v4;
  id v19 = v6;
  v7 = (void (**)(void))MEMORY[0x1895CC3E8](v18);
  id v8 = objc_alloc_init(&OBJC_CLASS___SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v8);
  -[SKConnection setClientMode:](v8, "setClientMode:", 1LL);
  -[SKConnection setPassword:](v8, "setPassword:", self->super._password);
  v9 = -[SKDevice identifier](self->super._peerDevice, "identifier");
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x18960ED58]);
    objc_storeStrong((id *)&self->_nanSubscriber, v10);
    [v10 setControlFlags:1];
    [v10 setDispatchQueue:self->super._dispatchQueue];
    [v10 setServiceType:@"com.apple.setup"];
    uint64_t v11 = (void *)MEMORY[0x1895CC3E8](v6);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v11;

    v17[0] = v5;
    v17[1] = 3221225472LL;
    v17[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_2;
    v17[3] = &unk_18A281C78;
    v17[4] = v9;
    v17[5] = self;
    [v10 setEndpointFoundHandler:v17];
    v16[0] = v5;
    v16[1] = 3221225472LL;
    v16[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_3;
    v16[3] = &unk_18A281CA0;
    v16[4] = v10;
    v16[5] = self;
    v16[6] = v9;
    v16[7] = v8;
    [v10 setReceiveHandler:v16];
    v15[0] = v5;
    v15[1] = 3221225472LL;
    v15[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_4;
    v15[3] = &unk_18A281CF0;
    v15[4] = v10;
    void v15[5] = self;
    -[SKConnection setSendDataHandler:](v8, "setSendDataHandler:", v15);
    v14[0] = v5;
    v14[1] = 3221225472LL;
    v14[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_6;
    v14[3] = &unk_18A282310;
    v14[4] = v10;
    v14[5] = self;
    [v10 activateWithCompletion:v14];
  }

  else
  {
    uint64_t v13 = NSErrorF_safe();
    id v10 = (id)v22[5];
    v22[5] = v13;
  }

  v7[2](v7);
  _Block_object_dispose(&v21, 8);
}

- (void)_activateNANContinueWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (SKConnection *)MEMORY[0x1895CC3E8](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v5) {
      ((void (*)(SKConnection *, id))v5->_authThrottleDeadlineTicks)(v5, v4);
    }
  }

  else
  {
    uint64_t v5 = self->super._skCnx;
    if (v5)
    {
      -[SKSetupClient _setupConnectionCommon:](self, "_setupConnectionCommon:", v5);
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        id v8 = v5;
        LogPrintF();
      }

      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __47__SKSetupClient__activateNANContinueWithError___block_invoke;
      v9[3] = &unk_18A282310;
      v9[4] = v5;
      v9[5] = self;
      -[SKConnection activateWithCompletion:](v5, "activateWithCompletion:", v9, v8);
    }
  }
}

- (void)_activateOOBWithCompletion:(id)a3
{
  id v4 = a3;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = __Block_byref_object_copy__1431;
  v16[4] = __Block_byref_object_dispose__1432;
  id v17 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __44__SKSetupClient__activateOOBWithCompletion___block_invoke;
  v13[3] = &unk_18A281F78;
  v15 = v16;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  v7 = (void (**)(void))MEMORY[0x1895CC3E8](v13);
  id v8 = objc_alloc_init(&OBJC_CLASS___SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v8);
  -[SKConnection setSendDataHandler:](v8, "setSendDataHandler:", self->super._sendDataHandler);
  -[SKSetupClient _setupConnectionCommon:](self, "_setupConnectionCommon:", v8);
  int var0 = self->super._ucat->var0;
  v11[0] = v5;
  v11[1] = 3221225472LL;
  v11[2] = __44__SKSetupClient__activateOOBWithCompletion___block_invoke_2;
  v11[3] = &unk_18A281C50;
  v11[4] = v8;
  v11[5] = self;
  id v10 = v6;
  id v12 = v10;
  -[SKConnection activateWithCompletion:](v8, "activateWithCompletion:", v11);

  v7[2](v7);
  _Block_object_dispose(v16, 8);
}

- (void)_setupConnectionCommon:(id)a3
{
  id v4 = a3;
  [v4 setClientMode:1];
  objc_msgSend(v4, "setConditionalPersistent:", -[SKSetupBase conditionalPersistent](self, "conditionalPersistent"));
  [v4 setDispatchQueue:self->super._dispatchQueue];
  [v4 setPassword:self->super._password];
  objc_msgSend(v4, "setPersistentPairing:", -[SKSetupBase persistentPairing](self, "persistentPairing"));
  objc_msgSend(v4, "setReversePairing:", -[SKSetupBase reversePairing](self, "reversePairing"));
  uint64_t v5 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke;
  v26[3] = &unk_18A281CC8;
  v26[4] = self;
  [v4 setAuthCompletionHandler:v26];
  v25[0] = v5;
  v25[1] = 3221225472LL;
  v25[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_2;
  v25[3] = &unk_18A281D18;
  v25[4] = self;
  [v4 setAuthPromptHandler:v25];
  v24[0] = v5;
  v24[1] = 3221225472LL;
  v24[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_3;
  v24[3] = &unk_18A281D40;
  v24[4] = self;
  [v4 setAuthShowPasswordHandler:v24];
  v21[0] = v5;
  v21[1] = 3221225472LL;
  v21[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_4;
  v21[3] = &unk_18A282310;
  id v6 = v4;
  id v22 = v6;
  uint64_t v23 = self;
  [v6 setErrorHandler:v21];
  v18[0] = v5;
  v18[1] = 3221225472LL;
  v18[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_5;
  v18[3] = &unk_18A2820C0;
  id v7 = v6;
  id v19 = v7;
  uint64_t v20 = self;
  [v7 setInvalidationHandler:v18];
  v17[0] = v5;
  v17[1] = 3221225472LL;
  v17[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_6;
  v17[3] = &unk_18A281D68;
  v17[4] = self;
  [v7 setPairSetupConfigHandler:v17];
  v14[0] = v5;
  v14[1] = 3221225472LL;
  v14[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_7;
  v14[3] = &unk_18A281D90;
  id v8 = v7;
  id v15 = v8;
  id v16 = self;
  [v8 setReceivedEventHandler:v14];
  v11[0] = v5;
  v11[1] = 3221225472LL;
  v11[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_8;
  v11[3] = &unk_18A2822E8;
  id v12 = v8;
  uint64_t v13 = self;
  id v9 = v8;
  [v9 setReceivedRequestHandler:v11];
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_9;
  v10[3] = &unk_18A2822C0;
  v10[4] = self;
  [v9 setStateChangedHandler:v10];
}

- (void)_invalidate
{
  nanSubscriber = self->_nanSubscriber;
  self->_nanSubscriber = 0LL;

  id v4 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v4)
  {
    NSErrorF_safe();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v4)[2](v4, v6);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SKSetupClient;
  -[SKSetupBase _invalidate](&v7, sel__invalidate);
}

- (void)_invalidated
{
  if (self->super._invalidateCalled)
  {
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0LL;

    id authPromptHandler = self->_authPromptHandler;
    self->_id authPromptHandler = 0LL;

    uint64_t v5 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_overallCompletionHandler);
    id overallCompletionHandler = self->_overallCompletionHandler;
    self->_id overallCompletionHandler = 0LL;

    if (v5)
    {
      NSErrorF_safe();
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v5)[2](v5, v7);
    }

    id v8 = (void (**)(void))MEMORY[0x1895CC3E8](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    if (v8) {
      v8[2](v8);
    }
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SKSetupClient;
    -[SKSetupBase _invalidated](&v10, sel__invalidated);
  }

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  int var0 = self->super._ucat->var0;
  id v13 = v4;
  if (v4)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    int v6 = 3;
  }

  else
  {
    int v6 = 4;
  }

  self->super._runState = v6;
  objc_super v7 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v13);
  }
  id v9 = -[SKEvent initWithEventType:error:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:error:", 20LL, v13);
  -[SKSetupBase _reportEvent:](self, "_reportEvent:", v9);

  objc_super v10 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_overallCompletionHandler);
  id overallCompletionHandler = self->_overallCompletionHandler;
  self->_id overallCompletionHandler = 0LL;

  if (v10) {
    ((void (**)(void, id))v10)[2](v10, v13);
  }
}

- (void)_invalidateSteps
{
  stepCurrent = self->super._stepCurrent;
  self->super._stepCurrent = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKSetupClient;
  -[SKSetupBase _invalidateSteps](&v4, sel__invalidateSteps);
}

- (void)_prepareSteps
{
  if (self->super._setupType == 1) {
    -[SKSetupClient _prepareStepsOSRecovery](self, "_prepareStepsOSRecovery");
  }
}

- (void)_prepareStepsOSRecovery
{
  v3 = objc_alloc_init(&OBJC_CLASS___SKStepBasicConfigClient);
  -[SKSetupClient clientConfig](self, "clientConfig");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStepBasicConfigClient setClientConfig:](v3, "setClientConfig:", v4);

  -[SKStepBasicConfigClient setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigClient setSkMessaging:](v3, "setSkMessaging:", self);
  uint64_t v5 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __40__SKSetupClient__prepareStepsOSRecovery__block_invoke;
  v8[3] = &unk_18A282310;
  v8[4] = self;
  v8[5] = v3;
  -[SKStepBasicConfigClient setSkCompletionHandler:](v3, "setSkCompletionHandler:", v8);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);

  if (!self->_skipWifi)
  {
    int v6 = objc_alloc_init(&OBJC_CLASS___SKStepWiFiSetupClientLegacy);
    -[SKStepWiFiSetupClientLegacy setDispatchQueue:](v6, "setDispatchQueue:", self->super._dispatchQueue);
    -[SKStepWiFiSetupClientLegacy setSkMessaging:](v6, "setSkMessaging:", self);
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __40__SKSetupClient__prepareStepsOSRecovery__block_invoke_2;
    v7[3] = &unk_18A282310;
    v7[4] = self;
    void v7[5] = v6;
    -[SKStepWiFiSetupClientLegacy setSkCompletionHandler:](v6, "setSkCompletionHandler:", v7);
    -[SKSetupBase _addStep:](self, "_addStep:", v6);
  }

- (void)tryPassword:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __29__SKSetupClient_tryPassword___block_invoke;
  v7[3] = &unk_18A2820C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      int runState = self->super._runState;
      if (runState > 11)
      {
        if (runState == 12)
        {
          BOOL v6 = -[SKSetupBase _runSteps](self, "_runSteps");
          int v5 = self->super._runState;
          if (!v6) {
            goto LABEL_15;
          }
LABEL_13:
          ++v5;
LABEL_14:
          self->super._int runState = v5;
          goto LABEL_15;
        }

        if (runState != 13) {
          return;
        }
        -[SKSetupClient _completeWithError:](self, "_completeWithError:", 0LL);
        int v5 = self->super._runState;
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
        int v4 = -[SKConnection state](self->super._skCnx, "state");
        int v5 = self->super._runState;
        if (v4 == 1) {
          goto LABEL_13;
        }
      }

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)authPromptHandler
{
  return self->_authPromptHandler;
}

- (void)setAuthPromptHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSDictionary)clientConfig
{
  return self->_clientConfig;
}

- (void)setClientConfig:(id)a3
{
}

- (BOOL)skipWifi
{
  return self->_skipWifi;
}

- (void)setSkipWifi:(BOOL)a3
{
  self->_skipWifi = a3;
}

- (id)overallCompletionHandler
{
  return self->_overallCompletionHandler;
}

- (void)setOverallCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __29__SKSetupClient_tryPassword___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 120LL);
  int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
  id v6 = v2;
  if (v2)
  {
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = v6, v4))
      {
        LogPrintF();
        id v2 = v6;
      }
    }

    [v2 tryPassword:*(void *)(a1 + 40)];
    goto LABEL_7;
  }

  if (v3 <= 90)
  {
    if (v3 != -1 || (int v5 = _LogCategory_Initialize(), v2 = 0LL, v5))
    {
      LogPrintF();
LABEL_7:
      id v2 = v6;
    }
  }
}

void __40__SKSetupClient__prepareStepsOSRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  id v11 = v3;
  if (v3)
  {
    int v5 = *v4[18];
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
    {
      id v9 = "-[SKSetupClient _prepareStepsOSRecovery]_block_invoke";
      id v10 = v11;
      LogPrintF();
    }
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___SKEventBasicConfigUpdated);
    [*(id *)(a1 + 40) outServerConfig];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = -[SKEventBasicConfigUpdated initWithBasicConfig:](v6, "initWithBasicConfig:", v7);
    [v4 _reportEvent:v8];
  }

  objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(void *)(a1 + 40), 0, v9, v10);
}

uint64_t __40__SKSetupClient__prepareStepsOSRecovery__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = -[SKEvent initWithEventType:error:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:error:", 140LL, v6);
  [*(id *)(a1 + 32) _reportEvent:v3];
  uint64_t v4 = MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 32) + 240LL));
  int v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  id v10 = -[SKAuthenticationRequestEvent initWithPasswordType:pairingFlags:throttleSeconds:]( objc_alloc(&OBJC_CLASS___SKAuthenticationRequestEvent),  "initWithPasswordType:pairingFlags:throttleSeconds:",  a2,  a3,  a4);
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:");
  uint64_t v8 = MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 32) + 248LL));
  id v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3, a4);
  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = -[SKAuthenticationPresentEvent initWithPasswordType:password:]( objc_alloc(&OBJC_CLASS___SKAuthenticationPresentEvent),  "initWithPasswordType:password:",  a2,  v5);

  [*(id *)(a1 + 32) _reportEvent:v6];
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_4(uint64_t a1, void *a2)
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
    objc_super v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = 0LL;

    id v3 = v9;
  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 120))
  {
    int v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(a1 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(a1 + 40);
      }
    }

    int v5 = *(void **)(v1 + 120);
    *(void *)(v1 + 120) = 0LL;
  }

void __40__SKSetupClient__setupConnectionCommon___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[18];
  id v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      CUPrintNSObjectOneLine();
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      id v3 = v8;
      int v4 = *(_DWORD ***)(a1 + 32);
    }

    else
    {
      id v3 = v8;
    }
  }

  objc_msgSend(v4, "_pairSetupConfig:", v3, v7);
}

void *__40__SKSetupClient__setupConnectionCommon___block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v5 == result[15]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__40__SKSetupClient__setupConnectionCommon___block_invoke_8( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v6 == result[15]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

uint64_t __40__SKSetupClient__setupConnectionCommon___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

uint64_t __44__SKSetupClient__activateOOBWithCompletion___block_invoke(void *a1)
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

void __44__SKSetupClient__activateOOBWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v7 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(v8 + 120);
      *(void *)(v8 + 120) = 0LL;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      [*(id *)(a1 + 40) _run];
    }
  }

  else
  {
    NSErrorF_safe();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = **(_DWORD **)(*(void *)(a1 + 40) + 144LL);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48));
  }
}

void __47__SKSetupClient__activateNANContinueWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v22 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v8 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v20);
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = *(void **)(v13 + 120);
      *(void *)(v13 + 120) = 0LL;

      uint64_t v5 = (void (**)(void, void))MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 40) + 208LL));
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(v15 + 208);
      *(void *)(v15 + 208) = 0LL;

      if (v5) {
        ((void (**)(void, id))v5)[2](v5, v22);
      }
    }

    else
    {
      if (v8 <= 30)
      {
        if (v8 != -1 || (v17 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 40), v17))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }

      uint64_t v5 = (void (**)(void, void))MEMORY[0x1895CC3E8](*(void *)(v4 + 208));
      uint64_t v18 = *(void *)(a1 + 40);
      id v19 = *(void **)(v18 + 208);
      *(void *)(v18 + 208) = 0LL;

      if (v5) {
        v5[2](v5, 0LL);
      }
      [*(id *)(a1 + 40) _run];
    }
  }

  else
  {
    NSErrorF_safe();
    uint64_t v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = **(_DWORD **)(v6 + 144);
    if (v7 <= 90)
    {
      if (v7 != -1 || (v9 = _LogCategory_Initialize(), uint64_t v6 = *(void *)(a1 + 40), v9))
      {
        CUPrintNSError();
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v6 = *(void *)(a1 + 40);
      }
    }

    id v10 = (void (**)(void, void))MEMORY[0x1895CC3E8](*(void *)(v6 + 208));
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(v11 + 208);
    *(void *)(v11 + 208) = 0LL;

    if (v10) {
      v10[2](v10, v5);
    }
  }
}

uint64_t __44__SKSetupClient__activateNANWithCompletion___block_invoke(void *a1)
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

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  [v15 identifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
  }

  else
  {
    int v8 = v7;
    if ((v6 == 0LL) == (v7 != 0LL))
    {

LABEL_10:
      int v12 = **(_DWORD **)(*(void *)(a1 + 40) + 144LL);
      goto LABEL_15;
    }

    char v9 = [v6 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 216LL), a2);
  id v10 = *(_DWORD ***)(a1 + 40);
  int v11 = *v10[18];
  if (v11 <= 30 && (v11 != -1 || (v13 = _LogCategory_Initialize(), id v10 = *(_DWORD ***)(a1 + 40), v13)))
  {
    LogPrintF();
    objc_msgSend(*(id *)(a1 + 40), "_activateNANContinueWithError:", 0, v6);
  }

  else
  {
    objc_msgSend(v10, "_activateNANContinueWithError:", 0, v14);
  }

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = v5;
  if (*(void *)(a1 + 32) != *(void *)(*(void *)(a1 + 40) + 224LL)) {
    goto LABEL_13;
  }
  [v5 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = *(void **)(a1 + 48);
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_7;
  }

  int v11 = v10;
  if ((v9 == 0LL) != (v10 != 0LL))
  {
    char v12 = [v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    [*(id *)(a1 + 56) receivedData:v15];
    goto LABEL_13;
  }

LABEL_9:
  int v13 = **(_DWORD **)(*(void *)(a1 + 40) + 144LL);
  if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
  {
    [v6 identifier];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void **)(v4 + 224))
  {
    id v6 = *(void **)(v4 + 216);
    if (v6)
    {
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_5;
      v8[3] = &unk_18A281CC8;
      v8[4] = v4;
      id v7 = v6;
      [v5 sendMessageData:v3 endpoint:v7 completionHandler:v8];
    }
  }
}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 32) == *(void *)(v4 + 224))
    {
      id v9 = v3;
      int v5 = **(_DWORD **)(v4 + 144);
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 224);
      *(void *)(v6 + 224) = 0LL;

      [*(id *)(a1 + 40) _activateNANContinueWithError:v9];
      id v3 = v9;
    }
  }
}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
    if (v5 <= 90)
    {
      id v8 = v3;
      if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        CUPrintNSError();
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v4 = v8;
      }
    }
  }
}

uint64_t __44__SKSetupClient__activateBLEWithCompletion___block_invoke(void *a1)
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

void __44__SKSetupClient__activateBLEWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v7 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(v8 + 120);
      *(void *)(v8 + 120) = 0LL;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      [*(id *)(a1 + 40) _run];
    }
  }

  else
  {
    NSErrorF_safe();
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = **(_DWORD **)(*(void *)(a1 + 40) + 144LL);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48));
  }
}

uint64_t __41__SKSetupClient__activateWithCompletion___block_invoke(void *a1)
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

uint64_t __40__SKSetupClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

@end