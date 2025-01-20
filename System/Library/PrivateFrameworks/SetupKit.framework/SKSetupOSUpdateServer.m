@interface SKSetupOSUpdateServer
- (BOOL)_bleAdvertiserShouldRun;
- (SKSetupOSUpdateServer)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerAcceptConnecton:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_invalidate;
- (void)_oobEnsureStarted;
- (void)_prepareSteps;
- (void)_run;
@end

@implementation SKSetupOSUpdateServer

- (SKSetupOSUpdateServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupOSUpdateServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupOSUpdateServer);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    v3 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v3 = (__CFString *)0LL;
  }

  v4 = &stru_18A2823D0;
  if (v3) {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (void)_activate
{
  if (self->super._sendDataHandler) {
    -[SKSetupOSUpdateServer _oobEnsureStarted](self, "_oobEnsureStarted");
  }
  else {
    -[SKSetupOSUpdateServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
  }
  -[SKSetupOSUpdateServer _prepareSteps](self, "_prepareSteps");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupOSUpdateServer;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupOSUpdateServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_prepareSteps
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SKStepBasicConfigServer);
  -[SKStepBasicConfigServer setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigServer setSkMessaging:](v3, "setSkMessaging:", self);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);
  -[SKStepBasicConfigServer activate](v3, "activate");

  v4 = objc_alloc_init(&OBJC_CLASS___SKStepWiFiSetupServerCW);
  -[SKStepWiFiSetupServerCW setDispatchQueue:](v4, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepWiFiSetupServerCW setSkMessaging:](v4, "setSkMessaging:", self);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __38__SKSetupOSUpdateServer__prepareSteps__block_invoke;
  v5[3] = &unk_18A281CC8;
  v5[4] = self;
  -[SKStepWiFiSetupServerCW setSkCompletionHandler:](v4, "setSkCompletionHandler:", v5);
  -[SKSetupBase _addStep:](self, "_addStep:", v4);
  -[SKStepWiFiSetupServerCW activate](v4, "activate");
}

- (void)_run
{
  if (-[SKSetupOSUpdateServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun")) {
    -[SKSetupOSUpdateServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
  }
  else {
    -[SKSetupOSUpdateServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  }
}

- (BOOL)_bleAdvertiserShouldRun
{
  if (self->_completed)
  {
    LOBYTE(v2) = 0;
  }

  else
  {
    int v2 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
    if (v2) {
      LOBYTE(v2) = -[SKConnection state](self->super._skCnx, "state") != 1;
    }
  }

  return v2;
}

- (void)_bleAdvertiserEnsureStarted
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    id v4 = objc_alloc_init(MEMORY[0x189602360]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setNearbyActionFlags:64];
    [v4 setNearbyActionType:83];
    logger();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_188798000, v5, OS_LOG_TYPE_DEFAULT, "BLE advertiser start: %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __52__SKSetupOSUpdateServer__bleAdvertiserEnsureStarted__block_invoke;
    v6[3] = &unk_18A282310;
    v6[4] = v4;
    v6[5] = self;
    [v4 activateWithCompletion:v6];
  }

- (void)_bleAdvertiserEnsureStopped
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (self->_bleAdvertiser)
  {
    logger();
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bleAdvertiser = self->_bleAdvertiser;
      int v7 = 138412290;
      id v8 = bleAdvertiser;
      _os_log_impl(&dword_188798000, v3, OS_LOG_TYPE_DEFAULT, "BLE advertiser stop: %@", (uint8_t *)&v7, 0xCu);
    }

    v5 = self->_bleAdvertiser;
  }

  else
  {
    v5 = 0LL;
  }

  -[CBAdvertiser invalidate](v5, "invalidate");
  objc_super v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0LL;
}

- (void)_bleServerEnsureStarted
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
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
    v8[2] = __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke;
    v8[3] = &unk_18A281A98;
    v8[4] = v4;
    v8[5] = self;
    [v4 setAcceptHandler:v8];
    logger();
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_188798000, v6, OS_LOG_TYPE_DEFAULT, "BLE server start: %@", buf, 0xCu);
    }

    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke_13;
    v7[3] = &unk_18A282310;
    v7[4] = v4;
    v7[5] = self;
    [v4 activateWithCompletion:v7];
  }

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer)
  {
    logger();
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_188798000, v3, OS_LOG_TYPE_DEFAULT, "BLE server stop", v6, 2u);
    }

    bleServer = self->_bleServer;
  }

  else
  {
    bleServer = 0LL;
  }

  -[CBServer invalidate](bleServer, "invalidate");
  uint64_t v5 = self->_bleServer;
  self->_bleServer = 0LL;
}

- (void)_bleServerAcceptConnecton:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = self->super._skCnx;
  if (v5)
  {
    objc_super v6 = v5;
    logger();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_error_impl( &dword_188798000,  v7,  OS_LOG_TYPE_ERROR,  "### Reject BLE connection when already connected: %@ vs %@",  (uint8_t *)&v8,  0x16u);
    }

    [v4 invalidate];
  }

  else
  {
    objc_super v6 = objc_alloc_init(&OBJC_CLASS___SKConnection);
    -[SKConnection setBleConnection:](v6, "setBleConnection:", v4);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  v6,  0LL,  0LL,  &__block_literal_global_1056);
  }
}

- (void)_oobEnsureStarted
{
  if (!self->super._skCnx)
  {
    objc_super v3 = objc_alloc_init(&OBJC_CLASS___SKConnection);
    -[SKConnection setSendDataHandler:](v3, "setSendDataHandler:", self->super._sendDataHandler);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  v3,  0LL,  0LL,  &__block_literal_global_15);
  }

- (void).cxx_destruct
{
}

void __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke( uint64_t a1,  void *a2,  void (**a3)(void, void))
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 216LL))
  {
    id v8 = a3;
    logger();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl( &dword_188798000,  v9,  OS_LOG_TYPE_DEFAULT,  "BLE server incoming connection: %@",  (uint8_t *)&v10,  0xCu);
    }

    [*(id *)(a1 + 40) _bleServerAcceptConnecton:v5];
    [*(id *)(a1 + 40) _run];
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }

  else
  {
    objc_super v6 = a3;
    NSErrorF_safe();
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))a3)[2](v6, v7);
  }
}

void __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 216LL))
  {
    logger();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        CUPrintNSError();
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = 138412290;
        id v11 = v9;
        _os_log_error_impl(&dword_188798000, v5, OS_LOG_TYPE_ERROR, "### BLE server failed: %@", (uint8_t *)&v10, 0xCu);
      }

      [*(id *)(a1 + 32) invalidate];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = *(void **)(v6 + 216);
      *(void *)(v6 + 216) = 0LL;
    }

    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 32);
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_188798000, v5, OS_LOG_TYPE_DEFAULT, "BLE server started: %@", (uint8_t *)&v10, 0xCu);
      }

      [*(id *)(a1 + 40) _run];
    }
  }
}

void __52__SKSetupOSUpdateServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v4[26])
  {
    if (v3)
    {
      logger();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CUPrintNSError();
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        int v9 = 138412290;
        int v10 = v8;
        _os_log_error_impl( &dword_188798000,  v5,  OS_LOG_TYPE_ERROR,  "### BLE advertiser failed: %@",  (uint8_t *)&v9,  0xCu);
      }

      [*(id *)(a1 + 32) invalidate];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = *(void **)(v6 + 208);
      *(void *)(v6 + 208) = 0LL;
    }

    else
    {
      [v4 _run];
    }
  }
}

void __38__SKSetupOSUpdateServer__prepareSteps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = -[SKEvent initWithEventType:error:](objc_alloc(&OBJC_CLASS___SKEvent), "initWithEventType:error:", 20LL, v4);

  [v3 _reportEvent:v5];
  if (!v4) {
    *(_BYTE *)(*(void *)(a1 + 32) + 224LL) = 1;
  }
}

@end