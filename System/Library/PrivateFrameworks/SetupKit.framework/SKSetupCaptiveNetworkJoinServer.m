@interface SKSetupCaptiveNetworkJoinServer
+ (void)resetWithCompletionHandler:(id)a3;
- (BOOL)_bleAdvertiserShouldRun;
- (SKSetupCaptiveNetworkJoinServer)init;
- (id)descriptionWithLevel:(int)a3;
- (int)mode;
- (void)_activate;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerAcceptConnecton:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_captiveDetectedNotificationUpdate:(BOOL)a3;
- (void)_captiveNetworkLoginInfo:(id)a3 cookie:(unsigned int)a4 responseHandler:(id)a5;
- (void)_captiveNetworkLoginRequest:(id)a3 responseHandler:(id)a4;
- (void)_captiveNetworkProbeEnsureStopped;
- (void)_captiveNetworkProbeRequest:(id)a3 responseHandler:(id)a4;
- (void)_captiveNetworkProbeResult:(int)a3 responseHandler:(id)a4;
- (void)_cfuEnsuredStarted;
- (void)_cfuEnsuredStopped;
- (void)_connectionEnded:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_networkRelayAWDLStartRequest:(id)a3 responseHandler:(id)a4;
- (void)_networkRelayDeviceEnsureStopped;
- (void)_networkRelaySetupRequest:(id)a3 responseHandler:(id)a4;
- (void)_oobEnsureStarted;
- (void)_pbsEnsureStopped;
- (void)_pbsShowUIIfNeeded;
- (void)_run;
- (void)_runDefault;
- (void)_runDetected;
- (void)dealloc;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5;
- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4;
- (void)setMode:(int)a3;
@end

@implementation SKSetupCaptiveNetworkJoinServer

- (SKSetupCaptiveNetworkJoinServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupCaptiveNetworkJoinServer);
  v3 = v2;
  if (v2)
  {
    v2->_captiveDetectedNotifyToken = -1;
    v2->super._setupType = 2;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinServer;
  -[SKSetupBase dealloc](&v3, sel_dealloc);
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
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v4 = 0LL;
  }

  uint64_t mode = self->_mode;
  else {
    objc_super v6 = off_18A281070[mode];
  }
  v15 = v6;
  CUAppendF();
  v7 = (__CFString *)v4;
  v8 = -[SKSetupBase pskData](self, "pskData", v15);
  v9 = v8;
  if (v8)
  {
    [v8 length];
    CUAppendF();
    v10 = v7;

    v7 = v10;
  }

  v11 = &stru_18A2823D0;
  if (v7) {
    v11 = v7;
  }
  v12 = v11;

  return v12;
}

- (void)_activate
{
  uint64_t v3 = MEMORY[0x1895F87A8];
  v11[4] = self;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke;
  v12[3] = &unk_18A280DF0;
  v12[4] = self;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_2;
  v11[3] = &unk_18A281CC8;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:]( self,  "registerRequestID:options:requestHandler:completionHandler:",  @"_awSt",  0LL,  v12,  v11);
  v10[0] = v3;
  v10[1] = 3221225472LL;
  v10[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_3;
  v10[3] = &unk_18A280DF0;
  v10[4] = self;
  v9[0] = v3;
  v9[1] = 3221225472LL;
  v9[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_4;
  v9[3] = &unk_18A281CC8;
  v9[4] = self;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:]( self,  "registerRequestID:options:requestHandler:completionHandler:",  @"_cnPb",  0LL,  v10,  v9);
  v7[4] = self;
  v8[0] = v3;
  v8[1] = 3221225472LL;
  v8[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_5;
  v8[3] = &unk_18A280DF0;
  v8[4] = self;
  v7[0] = v3;
  v7[1] = 3221225472LL;
  v7[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_6;
  v7[3] = &unk_18A281CC8;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:]( self,  "registerRequestID:options:requestHandler:completionHandler:",  @"_ntRl",  0LL,  v8,  v7);
  v5[4] = self;
  v6[0] = v3;
  v6[1] = 3221225472LL;
  v6[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_7;
  v6[3] = &unk_18A280DF0;
  v6[4] = self;
  v5[0] = v3;
  v5[1] = 3221225472LL;
  v5[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_8;
  v5[3] = &unk_18A281CC8;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:]( self,  "registerRequestID:options:requestHandler:completionHandler:",  @"_cnLg",  0LL,  v6,  v5);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinServer;
  -[SKSetupBase _activate](&v4, sel__activate);
}

- (void)_invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_invalidated
{
  if (!self->_cfuController)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinServer;
    -[SKSetupBase _invalidated](&v2, sel__invalidated);
  }

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    int mode = self->_mode;
    if (mode == 2)
    {
      -[SKSetupCaptiveNetworkJoinServer _runUserRequest](self, "_runUserRequest");
    }

    else if (mode == 1)
    {
      -[SKSetupCaptiveNetworkJoinServer _runDetected](self, "_runDetected");
    }

    else if (mode)
    {
      int var0 = self->super._ucat->var0;
    }

    else
    {
      -[SKSetupCaptiveNetworkJoinServer _runDefault](self, "_runDefault");
    }
  }

- (void)_runDefault
{
  if (self->super._sendDataHandler) {
    -[SKSetupCaptiveNetworkJoinServer _oobEnsureStarted](self, "_oobEnsureStarted");
  }
  else {
    -[SKSetupCaptiveNetworkJoinServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
  }
  if (-[SKSetupCaptiveNetworkJoinServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun")) {
    -[SKSetupCaptiveNetworkJoinServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
  }
  else {
    -[SKSetupCaptiveNetworkJoinServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  }
}

- (void)_runDetected
{
  if (GestaltGetDeviceClass() == 4)
  {
    -[SKSetupCaptiveNetworkJoinServer _cfuEnsuredStarted](self, "_cfuEnsuredStarted");
    id v5 = (id)CFPreferencesCopyValue( @"SATVIsTapToSetupModeKey",  @"com.apple.PineBoard",  @"mobile",  (CFStringRef)*MEMORY[0x189605190]);
    if (CFGetInt64())
    {
      int var0 = self->super._ucat->var0;
    }

    else
    {
      if (!softLinkDMIsMigrationNeeded())
      {
        -[SKSetupCaptiveNetworkJoinServer _pbsShowUIIfNeeded](self, "_pbsShowUIIfNeeded");
        goto LABEL_15;
      }

      int v4 = self->super._ucat->var0;
    }

    LogPrintF();
LABEL_15:
  }

- (BOOL)_bleAdvertiserShouldRun
{
  int v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
  if (v3) {
    LOBYTE(v3) = -[SKConnection state](self->super._skCnx, "state") != 1 && GestaltGetDeviceClass() != 7;
  }
  return v3;
}

- (void)_bleAdvertiserEnsureStarted
{
  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    id v4 = objc_alloc_init(MEMORY[0x189602360]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setNearbyActionFlags:64];
    [v4 setNearbyActionType:39];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v4;
      LogPrintF();
    }

    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __62__SKSetupCaptiveNetworkJoinServer__bleAdvertiserEnsureStarted__block_invoke;
    v7[3] = &unk_18A282310;
    v7[4] = v4;
    void v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7, v6);
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
        v7 = bleAdvertiser;
        LogPrintF();
        bleAdvertiser = self->_bleAdvertiser;
      }
    }
  }

  -[CBAdvertiser invalidate](bleAdvertiser, "invalidate", v7);
  id v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0LL;
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
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke;
    v9[3] = &unk_18A281A98;
    v9[4] = v4;
    void v9[5] = self;
    [v4 setAcceptHandler:v9];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v4;
      LogPrintF();
    }

    v8[0] = v5;
    v8[1] = 3221225472LL;
    v8[2] = __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke_2;
    v8[3] = &unk_18A282310;
    v8[4] = v4;
    void v8[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v8, v7);
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

- (void)_bleServerAcceptConnecton:(id)a3
{
  id v11 = a3;
  id v4 = self->super._skCnx;
  if (!v4)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SKConnection);
    -[SKConnection setBleConnection:](v5, "setBleConnection:", v11);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  v5,  0LL,  0LL,  &__block_literal_global_76);
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

- (void)_connectionEnded:(id)a3
{
}

- (void)_captiveNetworkLoginRequest:(id)a3 responseHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SKCaptiveContext);
  -[SKCaptiveContext setResponseHandler:](v8, "setResponseHandler:", v6);
  -[SKCaptiveContext setServer:](v8, "setServer:", self);
  id v9 = v8;
  if (!CNIAmTheWebsheetApp2())
  {
    int v10 = self->super._ucat->var0;

    NSErrorF_safe();
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *, void *))v6 + 2))( v6,  0LL,  0LL,  v11,  &__block_literal_global_162);
  }
}

- (void)_captiveNetworkLoginInfo:(id)a3 cookie:(unsigned int)a4 responseHandler:(id)a5
{
  v32[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = __Block_byref_object_copy__70;
  v29 = __Block_byref_object_dispose__71;
  id v30 = 0LL;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __83__SKSetupCaptiveNetworkJoinServer__captiveNetworkLoginInfo_cookie_responseHandler___block_invoke;
  v22[3] = &unk_18A281F78;
  v24 = &v25;
  v22[4] = self;
  id v10 = v9;
  id v23 = v10;
  id v11 = (void (**)(void))MEMORY[0x1895CC3E8](v22);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  if (v8)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          self->_captiveNetworkCookie = a4;
          objc_storeStrong((id *)&self->_captiveNetworkInterfaceName, v15);
          self->_captiveNetworkWebSheetActive = 1;
          v31[0] = @"_cnSS";
          v31[1] = @"_cnUR";
          v32[0] = v14;
          v32[1] = v13;
          [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:2];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, void, void, void *))v10 + 2))( v10,  v16,  0LL,  0LL,  &__block_literal_global_176);
        }

        else
        {
          uint64_t v20 = NSErrorF_safe();
          v16 = (void *)v26[5];
          v26[5] = v20;
        }
      }

      else
      {
        uint64_t v19 = NSErrorF_safe();
        v15 = (void *)v26[5];
        v26[5] = v19;
      }
    }

    else
    {
      uint64_t v18 = NSErrorF_safe();
      v14 = (void *)v26[5];
      v26[5] = v18;
    }
  }

  else
  {
    uint64_t v17 = NSErrorF_safe();
    id v13 = (void *)v26[5];
    v26[5] = v17;
  }

  v11[2](v11);
  _Block_object_dispose(&v25, 8);
}

- (void)_captiveNetworkProbeEnsureStopped
{
  if (self->_captiveNetworkWebSheetActive)
  {
    int var0 = self->super._ucat->var0;
    CNWebsheetNotifyComplete();
    self->_captiveNetworkWebSheetActive = 0;
  }

- (void)_captiveNetworkProbeRequest:(id)a3 responseHandler:(id)a4
{
  v31[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = __Block_byref_object_copy__70;
  v28 = __Block_byref_object_dispose__71;
  id v29 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __79__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeRequest_responseHandler___block_invoke;
  v21[3] = &unk_18A281F78;
  id v23 = &v24;
  v21[4] = self;
  id v8 = v7;
  id v22 = v8;
  id v9 = (void (**)(void))MEMORY[0x1895CC3E8](v21);
  int var0 = self->super._ucat->var0;
  if (self->_captiveNetworkWebSheetActive)
  {
    id v11 = self->_captiveNetworkInterfaceName;
    if (v11)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___SKCaptiveContext);
      -[SKCaptiveContext setResponseHandler:](v12, "setResponseHandler:", v8);
      -[SKCaptiveContext setServer:](v12, "setServer:", self);
      id v13 = v12;
      if (!CNProberCreate())
      {

        uint64_t v14 = NSErrorF_safe();
        v15 = (void *)v25[5];
        v25[5] = v14;
      }
    }

    else
    {
      uint64_t v19 = NSErrorF_safe();
      id v13 = (SKCaptiveContext *)v25[5];
      v25[5] = v19;
    }
  }

  else
  {
    if (self->_captiveNetworkWebSheetCompleted) {
      uint64_t v16 = 0LL;
    }
    else {
      uint64_t v16 = 4294960551LL;
    }
    int v17 = self->super._ucat->var0;
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
    {
      CUPrintErrorCode();
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    id v30 = @"_cnPR";
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v16, v20);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v18;
    [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v11 = (NSString *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, NSString *, void, void, void *))v8 + 2))( v8,  v11,  0LL,  0LL,  &__block_literal_global_185);
  }

  v9[2](v9);
  _Block_object_dispose(&v24, 8);
}

- (void)_captiveNetworkProbeResult:(int)a3 responseHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v17[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 4294896138LL;
  id v7 = a4;
  if (!(_DWORD)v4)
  {
    int v8 = CNWebsheetNotifyComplete();
    self->_captiveNetworkWebSheetActive = 0;
    if (v8) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = 4294896139LL;
    }
    self->_captiveNetworkWebSheetCompleted = 1;
  }

  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    uint64_t v12 = v4;
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  uint64_t v16 = @"_cnPR";
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v6, v12, v13);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __78__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeResult_responseHandler___block_invoke;
  v14[3] = &unk_18A281610;
  int v15 = v6;
  v14[4] = self;
  (*((void (**)(id, void *, void, void, void *))v7 + 2))(v7, v11, 0LL, 0LL, v14);
}

- (void)_cfuEnsuredStarted
{
  v14[1] = *MEMORY[0x1895F89C0];
  p_cfuController = &self->_cfuController;
  if (!self->_cfuController)
  {
    int var0 = self->super._ucat->var0;
    uint64_t v5 = (void *)[objc_alloc(getFLFollowUpControllerClass()) initWithClientIdentifier:@"com.apple.SetupKit"];
    objc_storeStrong((id *)p_cfuController, v5);
    id v6 = objc_alloc_init((Class)getFLFollowUpItemClass[0]());
    id v7 = v6;
    if (v6)
    {
      [v6 setUniqueIdentifier:@"com.apple.SetupKit.followup.captive-portal"];
      getFLGroupIdentifierDevice[0]();
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setGroupIdentifier:v8];

      SKLocalizedString(@"CNJ_CFU_TITLE");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setTitle:v9];

      id v10 = objc_alloc_init((Class)getFLFollowUpActionClass[0]());
      if (v10)
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:@"prefs:root=Network&cfuAction=launchCaptive&activate=true"];
        [v10 setUrl:v11];

        v14[0] = v10;
        [MEMORY[0x189603F18] arrayWithObjects:v14 count:1];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setActions:v12];

        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStarted__block_invoke;
        v13[3] = &unk_18A280ED8;
        v13[4] = self;
        [v5 postFollowUpItem:v7 completion:v13];
      }
    }
  }

- (void)_cfuEnsuredStopped
{
  if (self->_mode == 1 && GestaltGetDeviceClass() != 7)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    cfuController = self->_cfuController;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStopped__block_invoke;
    v7[3] = &unk_18A280ED8;
    v7[4] = cfuController;
    uint64_t v4 = cfuController;
    -[FLFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:completion:]( v4,  "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:",  &unk_18A2891D8,  v7);
  }

  if (self->_cfuController)
  {
    int var0 = self->super._ucat->var0;
  }

  id v6 = self->_cfuController;
  self->_cfuController = 0LL;
}

- (void)_networkRelayDeviceEnsureStopped
{
  id v13 = self->_nrDeviceManager;
  int v3 = self->_nrDeviceIdentifier;
  if (v13) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[NRDeviceIdentifier nrDeviceIdentifier](v3, "nrDeviceIdentifier");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[NRDeviceManager unregisterDevice:](v13, "unregisterDevice:", v3, v12);
    }

    else
    {
      -[NRDeviceManager unregisterDevice:](v13, "unregisterDevice:", v3, v11);
    }
  }

  nrDeviceIdentifier = self->_nrDeviceIdentifier;
  self->_nrDeviceIdentifier = 0LL;

  nrDeviceManager = self->_nrDeviceManager;
  self->_nrDeviceManager = 0LL;

  nrDeviceMonitor = self->_nrDeviceMonitor;
  self->_nrDeviceMonitor = 0LL;

  if (self->_awdlAdvertiser)
  {
    int v9 = self->super._ucat->var0;
  }

  -[CUBonjourAdvertiser invalidate](self->_awdlAdvertiser, "invalidate");
  awdlAdvertiser = self->_awdlAdvertiser;
  self->_awdlAdvertiser = 0LL;
}

- (void)_networkRelayAWDLStartRequest:(id)a3 responseHandler:(id)a4
{
  v27[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = __Block_byref_object_copy__70;
  uint64_t v24 = __Block_byref_object_dispose__71;
  id v25 = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  void v17[2] = __81__SKSetupCaptiveNetworkJoinServer__networkRelayAWDLStartRequest_responseHandler___block_invoke;
  v17[3] = &unk_18A281F78;
  uint64_t v19 = &v20;
  v17[4] = self;
  id v8 = v7;
  id v18 = v8;
  int v9 = (void (**)(void))MEMORY[0x1895CC3E8](v17);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x18960ED18]);
    objc_storeStrong((id *)&self->_awdlAdvertiser, v12);
    [v12 setAdvertiseFlags:2048];
    [v12 setDispatchQueue:self->super._dispatchQueue];
    [v12 setDomain:@"local."];
    [v12 setInterfaceName:@"awdl0"];
    [v12 setName:v11];
    [v12 setPort:1234];
    [v12 setServiceType:@"_setupkit._tcp"];
    uint64_t v26 = @"rpBA";
    v27[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setTxtDictionary:v13];

    int v14 = self->super._ucat->var0;
    if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = v11;
      LogPrintF();
    }

    objc_msgSend(v12, "activate", v16);
    (*((void (**)(id, void, void, void, void *))v8 + 2))( v8,  MEMORY[0x189604A60],  0LL,  0LL,  &__block_literal_global_220);
  }

  else
  {
    uint64_t v15 = NSErrorF_safe();
    id v12 = (id)v21[5];
    void v21[5] = v15;
  }

  v9[2](v9);
  _Block_object_dispose(&v20, 8);
}

- (void)_networkRelaySetupRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v42 = a3;
  id v6 = a4;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = __Block_byref_object_copy__70;
  v54 = __Block_byref_object_dispose__71;
  id v55 = 0LL;
  v47[0] = MEMORY[0x1895F87A8];
  v47[1] = 3221225472LL;
  v47[2] = __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke;
  v47[3] = &unk_18A281F78;
  v49 = &v50;
  v47[4] = self;
  id v7 = v6;
  id v48 = v7;
  v39 = (void (**)(void))MEMORY[0x1895CC3E8](v47);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  CFStringGetTypeID();
  uint64_t v9 = [(id) CFDictionaryGetTypedValue() UTF8String];
  if (!v9)
  {
    NSErrorF_safe();
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSetupBase _completeWithError:](self, "_completeWithError:", v26);

    goto LABEL_35;
  }

  uint64_t v45 = 0LL;
  if (StringToSockAddr() || CUGetInterfaceAddresses())
  {
    uint64_t v27 = NSErrorF_safe();
    v28 = (void *)v51[5];
    v51[5] = v27;

    goto LABEL_35;
  }

  if (SockAddrToString())
  {
    uint64_t v29 = NSErrorF_safe();
    v41 = (void *)v51[5];
    v51[5] = v29;

    goto LABEL_35;
  }

  [NSString stringWithUTF8String:v59];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = self->_nrDeviceManager;
  if (v10) {
    goto LABEL_12;
  }
  id v10 = (NRDeviceManager *)[MEMORY[0x189611A28] copySharedDeviceManager];
  if (v10)
  {
    objc_storeStrong((id *)&self->_nrDeviceManager, v10);
LABEL_12:
    p_nrDeviceIdentifier = &self->_nrDeviceIdentifier;
    id v12 = self->_nrDeviceIdentifier;
    if (v12)
    {
      int v13 = self->super._ucat->var0;
      if (v13 < 31 && (v13 != -1 || _LogCategory_Initialize()))
      {
        v36 = -[NRDeviceIdentifier nrDeviceIdentifier](v12, "nrDeviceIdentifier", v36);
        LogPrintF();
      }

      -[NRDeviceManager unregisterDevice:](v10, "unregisterDevice:", v12, v36);
      int v14 = *p_nrDeviceIdentifier;
      *p_nrDeviceIdentifier = 0LL;
    }

    uint64_t v15 = (void *)[MEMORY[0x189611A20] newEphemeralDeviceIdentifier];
    if (v15)
    {
      objc_storeStrong((id *)&self->_nrDeviceIdentifier, v15);
      id v16 = objc_alloc_init(MEMORY[0x189611A40]);
      int v17 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v46 length:v45];
      [v16 setAwdlAddressData:v17];

      if (-[NSData length](self->super._pskData, "length"))
      {
        -[NSData bytes](self->super._pskData, "bytes");
        -[NSData length](self->super._pskData, "length");
        CryptoHKDF();
        id v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F48]), "initWithBytes:length:", v58, 32, v58);
      }

      else
      {
        skCnx = self->super._skCnx;
        uint64_t v20 = (id *)(v51 + 5);
        id obj = (id)v51[5];
        -[SKConnection deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:]( skCnx,  "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:",  "NetworkRelaySalt",  16LL,  "NetworkRelayInfo",  16LL,  32LL,  &obj);
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v20, obj);
      }

      if (v18)
      {
        [v16 setOutOfBandKey:v18];
        id v21 = objc_alloc_init(MEMORY[0x189611A38]);
        [v21 setAllowedLinkTypes:&unk_18A2891F0];
        [v21 setAllowedLinkSubtypes:&unk_18A289208];
        [v21 setProxyCapability:1];
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v21 setProxyProviderRequiresWiFi:1];
        }
        uint64_t v22 = self->_nrDeviceMonitor;
        if (!v22)
        {
          uint64_t v22 = (NRDeviceMonitor *)[objc_alloc(MEMORY[0x189611A30]) initWithDeviceIdentifier:v15 delegate:self queue:self->super._dispatchQueue];
          objc_storeStrong((id *)&self->_nrDeviceMonitor, v22);
        }

        int v23 = self->super._ucat->var0;
        if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
        {
          v37 = v40;
          uint64_t v38 = v9;
          v36 = v15;
          LogPrintF();
        }

        dispatchQueue = self->super._dispatchQueue;
        v43[0] = MEMORY[0x1895F87A8];
        v43[1] = 3221225472LL;
        v43[2] = __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke_253;
        v43[3] = &unk_18A281CC8;
        v43[4] = self;
        -[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]( v10,  "registerDevice:properties:operationalproperties:queue:completionBlock:",  v15,  v16,  v21,  dispatchQueue,  v43,  v36,  v37,  v38);
        v56 = @"_ip";
        v57 = v40;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, void, void, void *))v7 + 2))( v7,  v25,  0LL,  0LL,  &__block_literal_global_256);
      }

      else
      {
        v31 = v51;
        v32 = (void *)v51[5];
        if (v32)
        {
          id v33 = v32;
          id v21 = (id)v31[5];
          v31[5] = (uint64_t)v33;
        }

        else
        {
          uint64_t v35 = NSErrorF_safe();
          id v21 = (id)v51[5];
          v51[5] = v35;
        }
      }
    }

    else
    {
      uint64_t v30 = NSErrorF_safe();
      id v16 = (id)v51[5];
      v51[5] = v30;
    }

    goto LABEL_34;
  }

  uint64_t v34 = NSErrorF_safe();
  id v10 = (NRDeviceManager *)v51[5];
  v51[5] = v34;
LABEL_34:

LABEL_35:
  v39[2](v39);

  _Block_object_dispose(&v50, 8);
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  [v9 proxyServiceInterfaceName];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    [v9 linkType];
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    [v9 linkSubtype];
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id StringFromNRLinkType = (id)createStringFromNRLinkType();
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();
  }

- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30)
  {
    id v6 = v10;
    if (var0 == -1)
    {
      id v6 = v10;
    }

    [v6 isConnected];
    [v10 linkType];
    id StringFromNRLinkType = (void *)createStringFromNRLinkType();
    [v10 linkSubtype];
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    [v10 proxyServiceInterfaceName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

- (void)_captiveDetectedNotificationUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  int var0 = self->super._ucat->var0;
  p_captiveDetectedNotifyToken = &self->_captiveDetectedNotifyToken;
  int v7 = *p_captiveDetectedNotifyToken;
  if (v3)
  {
    if (v7 == -1)
    {
      notify_register_check("com.apple.coreutils.captive-network-state", p_captiveDetectedNotifyToken);
      int v7 = *p_captiveDetectedNotifyToken;
    }

    notify_set_state(v7, 1uLL);
    notify_post("com.apple.coreutils.captive-network-state");
  }

  else if (v7 != -1)
  {
    notify_set_state(v7, 0LL);
    notify_post("com.apple.coreutils.captive-network-state");
    notify_cancel(*p_captiveDetectedNotifyToken);
    int *p_captiveDetectedNotifyToken = -1;
  }

- (void)_oobEnsureStarted
{
  if (!self->super._skCnx)
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___SKConnection);
    -[SKConnection setSendDataHandler:](v3, "setSendDataHandler:", self->super._sendDataHandler);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  v3,  0LL,  0LL,  &__block_literal_global_262);
  }

- (void)_pbsShowUIIfNeeded
{
  v18[3] = *MEMORY[0x1895F89C0];
  if (GestaltGetDeviceClass() == 4 && !self->_pbsUICalled)
  {
    self->_pbsUICalled = 1;
    if (self->_pbsService
      || ([(Class)getPBSUserPresentationServiceClass[0]() sharedInstance],
          BOOL v3 = (PBSUserPresentationService *)objc_claimAutoreleasedReturnValue(),
          BOOL v4 = self->_pbsService,
          self->_pbsService = v3,
          v4,
          self->_pbsService))
    {
      int var0 = self->super._ucat->var0;
      getPBSUPRDialogCustomViewControllerClassNameKey[0]();
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v6;
      v18[0] = @"HCVSViewController";
      getPBSUPRDialogCustomViewServiceNameKey[0]();
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v7;
      v18[1] = @"com.apple.HomeCaptiveViewService";
      getPBSUPRDialogTypeKey[0]();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      void v17[2] = v8;
      getPBSUPRDialogTypeCustom[0]();
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v9;
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v11 = (PBSUserPresentationRequest *)[objc_alloc((Class)getPBSUserPresentationRequestClass[0]()) initWithType:0 options:v10];
      pbsUIRequest = self->_pbsUIRequest;
      self->_pbsUIRequest = v11;

      pbsService = self->_pbsService;
      int v14 = self->_pbsUIRequest;
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __53__SKSetupCaptiveNetworkJoinServer__pbsShowUIIfNeeded__block_invoke;
      v16[3] = &unk_18A280FC8;
      v16[4] = self;
      -[PBSUserPresentationService presentUIWithRequest:completion:]( pbsService,  "presentUIWithRequest:completion:",  v14,  v16);
    }

    else
    {
      int v15 = self->super._ucat->var0;
    }
  }

- (void)_pbsEnsureStopped
{
  pbsUIRequest = self->_pbsUIRequest;
  self->_pbsUIRequest = 0LL;

  pbsService = self->_pbsService;
  self->_pbsService = 0LL;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_int mode = a3;
}

- (void).cxx_destruct
{
}

void __53__SKSetupCaptiveNetworkJoinServer__pbsShowUIIfNeeded__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(dispatch_queue_s **)(v7 + 32);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__SKSetupCaptiveNetworkJoinServer__pbsShowUIIfNeeded__block_invoke_2;
  block[3] = &unk_18A280FA0;
  id v11 = v6;
  uint64_t v12 = a2;
  block[4] = v7;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __53__SKSetupCaptiveNetworkJoinServer__pbsShowUIIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = **(_DWORD **)(v1 + 144);
  if (v2 <= 30)
  {
    if (v2 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(a1 + 32), v4))
    {
      CUPrintNSError();
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      uint64_t v1 = *(void *)(a1 + 32);
    }
  }

  uint64_t v5 = *(void **)(v1 + 304);
  *(void *)(v1 + 304) = 0LL;
}

uint64_t __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke( void *a1)
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

void __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke_253( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 144);
  id v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(void *)(a1 + 32), v6))
    {
      CUPrintNSError();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      uint64_t v4 = *(void *)(a1 + 32);
    }
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 32));
  [*(id *)(a1 + 32) _run];
}

uint64_t __81__SKSetupCaptiveNetworkJoinServer__networkRelayAWDLStartRequest_responseHandler___block_invoke( void *a1)
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

void __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStopped__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
    && ((v7 = v3, gLogCategory_SKSetupCaptiveNetworkJoinServer != -1) || (v5 = _LogCategory_Initialize(), uint64_t v4 = v7, v5)))
  {
    CUPrintNSError();
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

  else
  {
  }

void __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStarted__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  int v5 = v4;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 144LL);
  if (v6 <= 30)
  {
    id v9 = v4;
    if (v6 != -1 || (v7 = _LogCategory_Initialize(), int v5 = v9, v7))
    {
      CUPrintNSError();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      int v5 = v9;
    }
  }
}

uint64_t __78__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeResult_responseHandler___block_invoke( uint64_t result)
{
  if (!*(_DWORD *)(result + 40)) {
    return [*(id *)(result + 32) _reportEventType:202];
  }
  return result;
}

uint64_t __79__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeRequest_responseHandler___block_invoke( void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

uint64_t __83__SKSetupCaptiveNetworkJoinServer__captiveNetworkLoginInfo_cookie_responseHandler___block_invoke( void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

void __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  int v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v6 + 216))
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

void __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void *)(v4 + 216))
  {
    int v6 = **(_DWORD **)(v4 + 144);
    id v12 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(void **)(v7 + 216);
      *(void *)(v7 + 216) = 0LL;

      goto LABEL_13;
    }

    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        uint64_t v11 = v5;
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 40), "_run", v11);
LABEL_13:
        id v3 = v12;
        goto LABEL_14;
      }

      int v9 = _LogCategory_Initialize();
      uint64_t v4 = *(void *)(a1 + 40);
      if (v9)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        goto LABEL_8;
      }
    }

    objc_msgSend((id)v4, "_run", v10);
    goto LABEL_13;
  }

void __62__SKSetupCaptiveNetworkJoinServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 208))
  {
    id v9 = v3;
    if (v3)
    {
      int v5 = **(_DWORD **)(v4 + 144);
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(v6 + 208);
      *(void *)(v6 + 208) = 0LL;
    }

    else
    {
      [(id)v4 _run];
    }

    id v3 = v9;
  }
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _networkRelayAWDLStartRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _captiveNetworkProbeRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _networkRelaySetupRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_6(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _captiveNetworkLoginRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_8(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

+ (void)resetWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(getFLFollowUpControllerClass()) initWithClientIdentifier:@"com.apple.SetupKit"];
  if (v4)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __62__SKSetupCaptiveNetworkJoinServer_resetWithCompletionHandler___block_invoke;
    v6[3] = &unk_18A280DC8;
    id v8 = v3;
    id v7 = v4;
    [v7 clearPendingFollowUpItemsWithUniqueIdentifiers:&unk_18A2891C0 completion:v6];
  }

  else
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 90
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    if (v3)
    {
      NSErrorF_safe();
      int v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v3 + 2))(v3, v5);
    }
  }
}

void __62__SKSetupCaptiveNetworkJoinServer_resetWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  id v8 = v4;
  if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || (v5 = _LogCategory_Initialize(), id v4 = v8, v5))
    {
      CUPrintNSError();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      id v4 = v8;
    }
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    id v4 = v8;
  }
}

@end