@interface SKSetupSIMTransferServer
- (BOOL)_bleAdvertiserShouldRun;
- (BOOL)useSecondTrigger;
- (SKSetupSIMTransferServer)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerAcceptConnecton:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_invalidate;
- (void)_oobEnsureStarted;
- (void)_run;
- (void)setUseSecondTrigger:(BOOL)a3;
@end

@implementation SKSetupSIMTransferServer

- (SKSetupSIMTransferServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupSIMTransferServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupSIMTransferServer);
  v3 = v2;
  if (v2)
  {
    v2->super._bluetoothUseCase = 258;
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
    -[SKSetupSIMTransferServer _oobEnsureStarted](self, "_oobEnsureStarted");
  }
  else {
    -[SKSetupSIMTransferServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupSIMTransferServer;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupSIMTransferServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_run
{
  if (-[SKSetupSIMTransferServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun")) {
    -[SKSetupSIMTransferServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
  }
  else {
    -[SKSetupSIMTransferServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  }
}

- (BOOL)_bleAdvertiserShouldRun
{
  int v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
  if (v3) {
    LOBYTE(v3) = self->super._skCnx == 0LL;
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
    if (self->_useSecondTrigger) {
      uint64_t v5 = 45LL;
    }
    else {
      uint64_t v5 = 2LL;
    }
    [v4 setNearbyActionType:v5];
    [v4 setUseCase:258];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (self->_useSecondTrigger) {
        v7 = "yes";
      }
      else {
        v7 = "no";
      }
      id v8 = v4;
      v9 = v7;
      LogPrintF();
    }

    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __55__SKSetupSIMTransferServer__bleAdvertiserEnsureStarted__block_invoke;
    v10[3] = &unk_18A282310;
    v10[4] = v4;
    v10[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v10, v8, v9);
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
  objc_super v6 = self->_bleAdvertiser;
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
    v9[2] = __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke;
    v9[3] = &unk_18A281A98;
    v9[4] = v4;
    v9[5] = self;
    [v4 setAcceptHandler:v9];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v4;
      LogPrintF();
    }

    v8[0] = v5;
    v8[1] = 3221225472LL;
    v8[2] = __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke_2;
    v8[3] = &unk_18A282310;
    v8[4] = v4;
    v8[5] = self;
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
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  v5,  0LL,  0LL,  &__block_literal_global_1009);
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

- (void)_oobEnsureStarted
{
  if (!self->super._skCnx)
  {
    int v3 = objc_alloc_init(&OBJC_CLASS___SKConnection);
    -[SKConnection setSendDataHandler:](v3, "setSendDataHandler:", self->super._sendDataHandler);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  v3,  0LL,  0LL,  &__block_literal_global_22);
  }

- (BOOL)useSecondTrigger
{
  return self->_useSecondTrigger;
}

- (void)setUseSecondTrigger:(BOOL)a3
{
  self->_useSecondTrigger = a3;
}

- (void).cxx_destruct
{
}

void __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  uint64_t v5 = a3;
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

void __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
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

void __55__SKSetupSIMTransferServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
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

@end