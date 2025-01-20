@interface SKSetupServer
- (BOOL)_bleAdvertiserShouldRun;
- (BOOL)skipWifi;
- (NSDictionary)serverConfig;
- (SKSetupServer)init;
- (id)authCompletionHandler;
- (id)authHidePasswordHandler;
- (id)authShowPasswordHandler;
- (id)invalidationHandler;
- (id)overallCompletionHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_handleAcceptBLEConnection:(id)a3;
- (void)_handleAcceptCommon:(id)a3;
- (void)_handleAcceptNANData:(id)a3 endpoint:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_nanPublisherEnsureStarted;
- (void)_nanPublisherEnsureStopped;
- (void)_prepareSteps;
- (void)_prepareStepsOSRecovery;
- (void)_update;
- (void)_wifiKeepAliveEnsureStarted;
- (void)_wifiKeepAliveEnsureStopped;
- (void)activateWithCompletion:(id)a3;
- (void)reset;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAuthHidePasswordHandler:(id)a3;
- (void)setAuthShowPasswordHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setOverallCompletionHandler:(id)a3;
- (void)setServerConfig:(id)a3;
- (void)setSkipWifi:(BOOL)a3;
@end

@implementation SKSetupServer

- (SKSetupServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupServer);
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
  v7[2] = __40__SKSetupServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A281C28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0LL;
  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 3221225472LL;
  v13 = __41__SKSetupServer__activateWithCompletion___block_invoke;
  v14 = &unk_18A281F78;
  v17 = &v18;
  v15 = self;
  id v5 = v4;
  id v16 = v5;
  id v6 = (void (**)(void))MEMORY[0x1895CC3E8](&v11);
  if (self->super._activateCalled || self->super._invalidateCalled)
  {
    uint64_t v8 = NSErrorF_safe();
    v9 = (void *)v19[5];
    v19[5] = v8;
  }

  else
  {
    self->super._activateCalled = 1;
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUDescriptionWithLevel();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    -[SKSetupServer _prepareSteps](self, "_prepareSteps", v10, v11, v12, v13, v14, v15);
    -[SKSetupServer _update](self, "_update");
    (*((void (**)(id, void))v5 + 2))(v5, 0LL);
  }

  v6[2](v6);

  _Block_object_dispose(&v18, 8);
}

- (void)_invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_invalidated
{
  if (self->super._invalidateCalled)
  {
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0LL;

    id authShowPasswordHandler = self->_authShowPasswordHandler;
    self->_id authShowPasswordHandler = 0LL;

    id authHidePasswordHandler = self->_authHidePasswordHandler;
    self->_id authHidePasswordHandler = 0LL;

    id v6 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_overallCompletionHandler);
    id overallCompletionHandler = self->_overallCompletionHandler;
    self->_id overallCompletionHandler = 0LL;

    if (v6)
    {
      NSErrorF_safe();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v6)[2](v6, v8);
    }

    v9 = (void (**)(void))MEMORY[0x1895CC3E8](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    if (v9) {
      v9[2](v9);
    }
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___SKSetupServer;
    -[SKSetupBase _invalidated](&v11, sel__invalidated);
  }

- (void)reset
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__SKSetupServer_reset__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  if (!self->super._invalidateCalled)
  {
    if ((self->super._controlFlags & 1) != 0) {
      -[SKSetupServer _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
    }
    else {
      -[SKSetupServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
    }
    if (-[SKSetupServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun")) {
      -[SKSetupServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
    }
    else {
      -[SKSetupServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
    }
    if ((self->super._controlFlags & 2) != 0) {
      -[SKSetupServer _nanPublisherEnsureStarted](self, "_nanPublisherEnsureStarted");
    }
    else {
      -[SKSetupServer _nanPublisherEnsureStopped](self, "_nanPublisherEnsureStopped");
    }
  }

- (void)_prepareSteps
{
  if ((self->super._setupType | 4) == 5) {
    -[SKSetupServer _prepareStepsOSRecovery](self, "_prepareStepsOSRecovery");
  }
}

- (void)_prepareStepsOSRecovery
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SKStepBasicConfigServer);
  -[SKStepBasicConfigServer setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigServer setSkMessaging:](v3, "setSkMessaging:", self);
  -[SKSetupServer serverConfig](self, "serverConfig");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStepBasicConfigServer setServerConfig:](v3, "setServerConfig:", v4);

  uint64_t v5 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __40__SKSetupServer__prepareStepsOSRecovery__block_invoke;
  v8[3] = &unk_18A281CC8;
  v8[4] = self;
  -[SKStepBasicConfigServer setSkCompletionHandler:](v3, "setSkCompletionHandler:", v8);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);
  -[SKStepBasicConfigServer activate](v3, "activate");

  if (!self->_skipWifi)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SKStepWiFiSetupServerLegacy);
    -[SKStepWiFiSetupServerLegacy setDispatchQueue:](v6, "setDispatchQueue:", self->super._dispatchQueue);
    -[SKStepWiFiSetupServerLegacy setSkMessaging:](v6, "setSkMessaging:", self);
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __40__SKSetupServer__prepareStepsOSRecovery__block_invoke_2;
    v7[3] = &unk_18A281CC8;
    v7[4] = self;
    -[SKStepWiFiSetupServerLegacy setSkCompletionHandler:](v6, "setSkCompletionHandler:", v7);
    -[SKSetupBase _addStep:](self, "_addStep:", v6);
    -[SKStepWiFiSetupServerLegacy activate](v6, "activate");
  }

- (BOOL)_bleAdvertiserShouldRun
{
  if (self->_completed || (self->super._controlFlags & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }

  else
  {
    int v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
    if (v3) {
      LOBYTE(v3) = self->super._skCnx == 0LL;
    }
  }

  return v3;
}

- (void)_bleAdvertiserEnsureStarted
{
  uint64_t v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    unsigned int bleAdvertisePSM = self->_bleAdvertisePSM;
    if ((_DWORD)v3 == bleAdvertisePSM || (bleAdvertiser = self->_bleAdvertiser) == 0LL)
    {
LABEL_9:
      self->_unsigned int bleAdvertisePSM = v4;
      v10 = self->_bleAdvertiser;
      if (v10)
      {
LABEL_27:

        return;
      }

      id v11 = objc_alloc_init(MEMORY[0x189602360]);
      objc_storeStrong((id *)&self->_bleAdvertiser, v11);
      [v11 setDispatchQueue:self->super._dispatchQueue];
      [v11 setNearbyActionFlags:!self->_skipWifi << 6];
      int setupType = self->super._setupType;
      switch(setupType)
      {
        case 1:
          v13 = v11;
          uint64_t v14 = 37LL;
          break;
        case 5:
          v13 = v11;
          uint64_t v14 = 85LL;
          break;
        case 2:
          v13 = v11;
          uint64_t v14 = 39LL;
          break;
        default:
          int var0 = self->super._ucat->var0;
          goto LABEL_17;
      }

      [v13 setNearbyActionType:v14];
LABEL_17:
      if (self->super._authTagOverride)
      {
        objc_msgSend(v11, "setNearbyActionFlags:", objc_msgSend(v11, "nearbyActionFlags") | 0x80);
        [v11 setNearbyActionAuthTagData:self->super._authTagOverride];
      }

      int v15 = self->super._ucat->var0;
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __44__SKSetupServer__bleAdvertiserEnsureStarted__block_invoke;
      v20[3] = &unk_18A282310;
      v10 = (CBAdvertiser *)v11;
      v21 = v10;
      v22 = self;
      -[CBAdvertiser activateWithCompletion:](v10, "activateWithCompletion:", v20);

      goto LABEL_27;
    }

    int v7 = self->super._ucat->var0;
    if (v7 <= 30)
    {
      if (v7 == -1)
      {
        int v8 = _LogCategory_Initialize();
        bleAdvertiser = self->_bleAdvertiser;
        if (!v8) {
          goto LABEL_8;
        }
        unsigned int bleAdvertisePSM = self->_bleAdvertisePSM;
      }

      uint64_t v18 = v4;
      v19 = bleAdvertiser;
      uint64_t v17 = bleAdvertisePSM;
      LogPrintF();
      bleAdvertiser = self->_bleAdvertiser;
    }

- (void)_bleAdvertiserEnsureStopped
{
  bleAdvertiser = self->_bleAdvertiser;
  if (bleAdvertiser)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (int v5 = _LogCategory_Initialize(), bleAdvertiser = self->_bleAdvertiser, v5))
      {
        int v7 = bleAdvertiser;
        LogPrintF();
        bleAdvertiser = self->_bleAdvertiser;
      }
    }
  }

  -[CBAdvertiser invalidate](bleAdvertiser, "invalidate", v7);
  id v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0LL;

  self->_unsigned int bleAdvertisePSM = 0;
}

- (void)_bleServerEnsureStarted
{
  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    id v4 = objc_alloc_init(MEMORY[0x189602378]);
    objc_storeStrong((id *)p_bleServer, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setBleListenPSM:130];
    uint64_t v5 = MEMORY[0x1895F87A8];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __40__SKSetupServer__bleServerEnsureStarted__block_invoke;
    v8[3] = &unk_18A281A98;
    v8[4] = v4;
    void v8[5] = self;
    [v4 setAcceptHandler:v8];
    int var0 = self->super._ucat->var0;
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __40__SKSetupServer__bleServerEnsureStarted__block_invoke_2;
    v7[3] = &unk_18A282310;
    v7[4] = v4;
    void v7[5] = self;
    [v4 activateWithCompletion:v7];
  }

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer)
  {
    int var0 = self->super._ucat->var0;
  }

  -[CBServer invalidate](self->_bleServer, "invalidate");
  bleServer = self->_bleServer;
  self->_bleServer = 0LL;
}

- (void)_nanPublisherEnsureStarted
{
  p_nanPublisher = &self->_nanPublisher;
  if (!self->_nanPublisher)
  {
    id v4 = objc_alloc_init(MEMORY[0x18960ED50]);
    objc_storeStrong((id *)p_nanPublisher, v4);
    [v4 setControlFlags:1];
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setServiceType:@"com.apple.setup"];
    uint64_t v5 = MEMORY[0x1895F87A8];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke;
    v8[3] = &unk_18A280D18;
    v8[4] = v4;
    void v8[5] = self;
    [v4 setReceiveHandler:v8];
    int var0 = self->super._ucat->var0;
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke_2;
    v7[3] = &unk_18A282310;
    v7[4] = v4;
    void v7[5] = self;
    [v4 activateWithCompletion:v7];
  }

- (void)_nanPublisherEnsureStopped
{
  if (self->_nanPublisher)
  {
    int var0 = self->super._ucat->var0;
  }

  -[CUNANPublisher invalidate](self->_nanPublisher, "invalidate");
  nanPublisher = self->_nanPublisher;
  self->_nanPublisher = 0LL;
}

- (void)_wifiKeepAliveEnsureStarted
{
  if (!self->_wifiManager)
  {
    self->_wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate();
    int var0 = self->super._ucat->var0;
  }

- (void)_wifiKeepAliveEnsureStopped
{
  if (self->_wifiKeepAliveInterface)
  {
    int var0 = self->super._ucat->var0;
  }

  -[CWFInterface invalidate](self->_wifiKeepAliveInterface, "invalidate");
  wifiKeepAliveInterface = self->_wifiKeepAliveInterface;
  self->_wifiKeepAliveInterface = 0LL;

  wifiKeepAliveActivity = self->_wifiKeepAliveActivity;
  self->_wifiKeepAliveActivity = 0LL;

  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    CFRelease(wifiManager);
    self->_wifiManager = 0LL;
  }

- (void)_handleAcceptBLEConnection:(id)a3
{
  id v11 = a3;
  id v4 = self->super._skCnx;
  if (!v4)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SKConnection);
    -[SKConnection setBleConnection:](v5, "setBleConnection:", v11);
    -[SKSetupServer _handleAcceptCommon:](self, "_handleAcceptCommon:", v5);
    goto LABEL_8;
  }

  uint64_t v5 = v4;
  int var0 = self->super._ucat->var0;
  if (var0 > 90) {
    goto LABEL_7;
  }
  id v7 = v11;
  if (var0 == -1)
  {
    if (_LogCategory_Initialize())
    {
      id v7 = v11;
      goto LABEL_4;
    }

- (void)_handleAcceptNANData:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->super._skCnx;
  if (!v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___SKConnection);
    objc_storeStrong((id *)&self->super._skCnx, v9);
    [v7 identifier];
    id v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    nanEndpointID = self->_nanEndpointID;
    self->_nanEndpointID = v16;

    uint64_t v12 = self->_nanPublisher;
    if (v12)
    {
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke;
      v19[3] = &unk_18A280D40;
      uint64_t v20 = v9;
      v21 = self;
      v22 = v12;
      id v23 = v7;
      -[SKConnection setSendDataHandler:](v20, "setSendDataHandler:", v19);
    }

    -[SKSetupServer _handleAcceptCommon:](self, "_handleAcceptCommon:", v9);
    goto LABEL_10;
  }

  id v9 = v8;
  [v7 identifier];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = self->_nanEndpointID;
  uint64_t v12 = v10;
  v13 = v11;
  if (v12 == (CUNANPublisher *)v13)
  {

    goto LABEL_10;
  }

  uint64_t v14 = v13;
  if ((v12 == 0LL) != (v13 != 0LL))
  {
    int v15 = -[CUNANPublisher isEqual:](v12, "isEqual:", v13);

    if (!v15) {
      goto LABEL_13;
    }
LABEL_10:
    -[SKConnection receivedData:](v9, "receivedData:", v6);
    goto LABEL_11;
  }

LABEL_13:
  int var0 = self->super._ucat->var0;
LABEL_11:
}

- (void)_handleAcceptCommon:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->super._skCnx, a3);
  objc_msgSend(v5, "setConditionalPersistent:", -[SKSetupBase conditionalPersistent](self, "conditionalPersistent"));
  [v5 setDispatchQueue:self->super._dispatchQueue];
  [v5 setPassword:self->super._password];
  objc_msgSend(v5, "setPersistentPairing:", -[SKSetupBase persistentPairing](self, "persistentPairing"));
  uint64_t v6 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke;
  v35[3] = &unk_18A281CC8;
  v35[4] = self;
  [v5 setAuthCompletionHandler:v35];
  v34[0] = v6;
  v34[1] = 3221225472LL;
  v34[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_2;
  v34[3] = &unk_18A281D18;
  v34[4] = self;
  [v5 setAuthPromptHandler:v34];
  v33[0] = v6;
  v33[1] = 3221225472LL;
  v33[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_3;
  v33[3] = &unk_18A281D40;
  v33[4] = self;
  [v5 setAuthShowPasswordHandler:v33];
  [v5 setAuthHidePasswordHandler:self->_authHidePasswordHandler];
  v30[0] = v6;
  v30[1] = 3221225472LL;
  v30[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_4;
  v30[3] = &unk_18A282310;
  id v7 = v5;
  id v31 = v7;
  v32 = self;
  [v7 setErrorHandler:v30];
  v27[0] = v6;
  v27[1] = 3221225472LL;
  v27[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_5;
  v27[3] = &unk_18A2820C0;
  id v8 = v7;
  id v28 = v8;
  v29 = self;
  [v8 setInvalidationHandler:v27];
  v26[0] = v6;
  v26[1] = 3221225472LL;
  v26[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_6;
  v26[3] = &unk_18A281D68;
  v26[4] = self;
  [v8 setPairSetupConfigHandler:v26];
  v23[0] = v6;
  v23[1] = 3221225472LL;
  v23[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_7;
  v23[3] = &unk_18A281D90;
  id v9 = v8;
  id v24 = v9;
  v25 = self;
  [v9 setReceivedEventHandler:v23];
  v20[0] = v6;
  v20[1] = 3221225472LL;
  v20[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_8;
  v20[3] = &unk_18A2822E8;
  id v10 = v9;
  id v21 = v10;
  v22 = self;
  [v10 setReceivedRequestHandler:v20];
  v17[0] = v6;
  v17[1] = 3221225472LL;
  v17[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_9;
  v17[3] = &unk_18A2820C0;
  id v11 = v10;
  id v18 = v11;
  v19 = self;
  [v11 setStateChangedHandler:v17];
  int var0 = self->super._ucat->var0;
  v14[0] = v6;
  v14[1] = 3221225472LL;
  v14[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_10;
  v14[3] = &unk_18A282310;
  id v15 = v11;
  id v16 = self;
  id v13 = v11;
  [v13 activateWithCompletion:v14];
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)overallCompletionHandler
{
  return self->_overallCompletionHandler;
}

- (void)setOverallCompletionHandler:(id)a3
{
}

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
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

- (void).cxx_destruct
{
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = -[SKEvent initWithEventType:error:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:error:", 140LL, v6);
  [*(id *)(a1 + 32) _reportEvent:v3];
  uint64_t v4 = MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 32) + 288LL));
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  id v5 = -[SKAuthenticationRequestEvent initWithPasswordType:pairingFlags:throttleSeconds:]( objc_alloc(&OBJC_CLASS___SKAuthenticationRequestEvent),  "initWithPasswordType:pairingFlags:throttleSeconds:",  a2,  a3,  a4);
  [*(id *)(a1 + 32) _reportEvent:v5];
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = -[SKAuthenticationPresentEvent initWithPasswordType:password:]( objc_alloc(&OBJC_CLASS___SKAuthenticationPresentEvent),  "initWithPasswordType:password:",  a2,  v8);
  [*(id *)(a1 + 32) _reportEvent:v5];
  uint64_t v6 = MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 32) + 304LL));
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_4(uint64_t a1, void *a2)
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
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = 0LL;

    [*(id *)(a1 + 40) _update];
    id v3 = v9;
  }
}

uint64_t __37__SKSetupServer__handleAcceptCommon___block_invoke_5(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 120))
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

    int v5 = *(void **)(v1 + 120);
    *(void *)(v1 + 120) = 0LL;

    uint64_t v6 = *(void *)(v2 + 40);
    id v7 = *(void **)(v6 + 240);
    *(void *)(v6 + 240) = 0LL;

    [*(id *)(v2 + 40) _connectionEnded:*(void *)(v2 + 32)];
    [*(id *)(v2 + 40) _reportEventType:41];
    return [*(id *)(v2 + 40) _update];
  }

  return result;
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_6(uint64_t a1, void *a2)
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
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
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

void *__37__SKSetupServer__handleAcceptCommon___block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v5 == result[15]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__37__SKSetupServer__handleAcceptCommon___block_invoke_8( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v6 == result[15]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

void *__37__SKSetupServer__handleAcceptCommon___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[15]) {
    return (void *)[result _update];
  }
  return result;
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v14 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v8 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v13);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void **)(v10 + 120);
      *(void *)(v10 + 120) = 0LL;
    }

    else
    {
      if (v8 <= 30)
      {
        if (v8 != -1 || (v12 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 40), v12))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }

      [(id)v4 _reportEventType:40];
    }

    [*(id *)(a1 + 40) _update];
  }

  else
  {
    NSErrorF_safe();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(_DWORD ***)(a1 + 40);
    int v7 = *v6[18];
    if (v7 <= 90)
    {
      if (v7 != -1 || (v9 = _LogCategory_Initialize(), uint64_t v6 = *(_DWORD ***)(a1 + 40), v9))
      {
        CUPrintNSError();
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v6 = *(_DWORD ***)(a1 + 40);
      }
    }

    objc_msgSend(v6, "_update", v13);
  }
}

void __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[5];
  if (a1[4] == *(void *)(v4 + 120))
  {
    uint64_t v5 = (void *)a1[6];
    if (v5 == *(void **)(v4 + 248))
    {
      uint64_t v6 = a1[7];
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke_2;
      v7[3] = &unk_18A281CC8;
      v7[4] = v4;
      [v5 sendMessageData:v3 endpoint:v6 completionHandler:v7];
    }
  }
}

void __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke_2(uint64_t a1, void *a2)
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
        int v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v4 = v8;
      }
    }
  }
}

void *__43__SKSetupServer__nanPublisherEnsureStarted__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v4 == result[31]) {
    return (void *)[result _handleAcceptNANData:a2 endpoint:a3];
  }
  return result;
}

void __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v5 + 248))
  {
    int v6 = **(_DWORD **)(v5 + 144);
    if (v3)
    {
      id v13 = v3;
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v12);
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 248);
      *(void *)(v7 + 248) = 0LL;

      int v9 = *(void **)(a1 + 40);
      uint64_t v10 = -[SKEvent initWithEventType:error:]( objc_alloc(&OBJC_CLASS___SKEvent),  "initWithEventType:error:",  42LL,  v13);
      [v9 _reportEvent:v10];

      goto LABEL_11;
    }

    if (v6 <= 30)
    {
      id v13 = 0LL;
      if (v6 != -1 || (v11 = _LogCategory_Initialize(), uint64_t v4 = 0LL, v11))
      {
        LogPrintF();
LABEL_11:
        uint64_t v4 = v13;
      }
    }
  }
}

void __40__SKSetupServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v6 + 224))
  {
    int v8 = **(_DWORD **)(v6 + 144);
    id v9 = v12;
    if (v8 <= 30)
    {
      if (v8 == -1)
      {
        int v10 = _LogCategory_Initialize();
        uint64_t v6 = *(void *)(a1 + 40);
        if (!v10)
        {
          id v9 = v12;
          goto LABEL_8;
        }

        id v9 = v12;
      }

      id v11 = v9;
      LogPrintF();
      id v9 = v12;
      uint64_t v6 = *(void *)(a1 + 40);
    }

void __40__SKSetupServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4 == *(void **)(v5 + 224))
  {
    int v6 = **(_DWORD **)(v5 + 144);
    id v14 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v12);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(void **)(v7 + 224);
      *(void *)(v7 + 224) = 0LL;

      id v9 = *(void **)(a1 + 40);
      int v10 = -[SKEvent initWithEventType:error:]( objc_alloc(&OBJC_CLASS___SKEvent),  "initWithEventType:error:",  42LL,  v14);
      [v9 _reportEvent:v10];

      goto LABEL_13;
    }

    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        uint64_t v13 = [v4 bleListeningPSM];
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 40), "_update", v13);
LABEL_13:
        id v3 = v14;
        goto LABEL_14;
      }

      int v11 = _LogCategory_Initialize();
      uint64_t v5 = *(void *)(a1 + 40);
      if (v11)
      {
        uint64_t v4 = *(void **)(a1 + 32);
        goto LABEL_8;
      }
    }

    objc_msgSend((id)v5, "_update", v12);
    goto LABEL_13;
  }

void __44__SKSetupServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void *)(v4 + 216))
  {
    int v6 = **(_DWORD **)(v4 + 144);
    id v14 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v12);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(void **)(v7 + 216);
      *(void *)(v7 + 216) = 0LL;

      id v9 = *(void **)(a1 + 40);
      int v10 = -[SKEvent initWithEventType:error:]( objc_alloc(&OBJC_CLASS___SKEvent),  "initWithEventType:error:",  42LL,  v14);
      [v9 _reportEvent:v10];

      goto LABEL_13;
    }

    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        uint64_t v13 = v5;
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 40), "_update", v13);
LABEL_13:
        id v3 = v14;
        goto LABEL_14;
      }

      int v11 = _LogCategory_Initialize();
      uint64_t v4 = *(void *)(a1 + 40);
      if (v11)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        goto LABEL_8;
      }
    }

    objc_msgSend((id)v4, "_update", v12);
    goto LABEL_13;
  }

uint64_t __40__SKSetupServer__prepareStepsOSRecovery__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (*(_BYTE *)(v2 + 280)) {
      *(_BYTE *)(v2 + 232) = 1;
    }
  }

  return result;
}

void __40__SKSetupServer__prepareStepsOSRecovery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = -[SKEvent initWithEventType:error:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:error:", 20LL, v4);

  [v3 _reportEvent:v5];
  if (!v4) {
    *(_BYTE *)(*(void *)(a1 + 32) + 232LL) = 1;
  }
}

uint64_t __22__SKSetupServer_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  *(_BYTE *)(v2 + 232) = 0;
  return [*(id *)(a1 + 32) _update];
}

uint64_t __41__SKSetupServer__activateWithCompletion___block_invoke(void *a1)
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

uint64_t __40__SKSetupServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

@end