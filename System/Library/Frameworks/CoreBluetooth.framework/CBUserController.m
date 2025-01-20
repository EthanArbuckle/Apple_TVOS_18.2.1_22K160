@interface CBUserController
+ (BOOL)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 error:(id *)a6;
+ (id)readPrefKeys:(id)a3 source:(unsigned int)a4 error:(id *)a5;
- (BOOL)_ensureXPCStarted;
- (CBUserController)init;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)clientID;
- (void)_activate;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteControllerInfoForDevice:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3;
- (void)getControllerInfoForDevice:(id)a3 completion:(id)a4;
- (void)getCurrentUserGivenNameWithCompletion:(id)a3;
- (void)getDistributedLoggingStatusWithCompletion:(id)a3;
- (void)invalidate;
- (void)readPrefKeys:(id)a3 source:(unsigned int)a4 completion:(id)a5;
- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6;
- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4;
- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4;
- (void)setErrorHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)storeControllerInfo:(id)a3 completion:(id)a4;
- (void)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6;
@end

@implementation CBUserController

- (CBUserController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CBUserController;
  v2 = -[CBUserController init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBUserController;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void (**)(void))MEMORY[0x18959F890](self->_invalidationHandler, a2);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    objc_super v5 = self;
    objc_sync_enter(v5);
    v6 = v5->_xpcCnx;
    v7 = v6;
    if (v6) {
      -[NSXPCConnection invalidate](v6, "invalidate");
    }

    objc_sync_exit(v5);
    ucat = self->_ucat;
    if (ucat && (ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0LL;
    }

    id interruptionHandler = v5->_interruptionHandler;
    v5->_id interruptionHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    if (v3) {
      v3[2](v3);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CBUserController;
  -[CBUserController dealloc](&v11, sel_dealloc);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    uint64_t v6 = MEMORY[0x18959F890](v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = (id)v6;

    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __43__CBUserController_activateWithCompletion___block_invoke;
    block[3] = &unk_189FB1AE0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __43__CBUserController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    id v4 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v4)
    {
      ((void (**)(void, id))v4)[2](v4, v9);
    }

    else
    {
      uint64_t v6 = MEMORY[0x18959F890](self->_errorHandler);
      v7 = (void *)v6;
      if (v6) {
        (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
      }
    }
  }

  else
  {
    -[CBUserController _activateXPCStart:](self, "_activateXPCStart:", 0LL);
  }

- (void)_activateXPCStart:(BOOL)a3
{
  int var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
    {
LABEL_10:
      objc_super v5 = self;
      goto LABEL_8;
    }
  }

  else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_10;
  }

  LogPrintF_safe();
  objc_super v5 = self;
LABEL_8:
  -[CBUserController _ensureXPCStarted](v5, "_ensureXPCStarted");
}

- (BOOL)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x189607B30]);
    if (v3) {
      objc_super v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      objc_super v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.bluetoothuser.xpc" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    CBUserControllerXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    id location = 0LL;
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __37__CBUserController__ensureXPCStarted__block_invoke;
    v15[3] = &unk_189FB1B08;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v15);
    v13[0] = v8;
    v13[1] = 3221225472LL;
    v13[2] = __37__CBUserController__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_189FB1B08;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v13);
    CBUserControllerXPCInterface();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_CBUserController <= 30
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    v10 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v10) {
      v10[2](v10, 0LL);
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __37__CBUserController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _interrupted];
}

void __37__CBUserController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_CBUserController <= 50
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  uint64_t v3 = MEMORY[0x18959F890](self->_interruptionHandler);
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

  -[CBUserController _activateXPCStart:](self, "_activateXPCStart:", 1LL);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CBUserController_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CBUserController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (!*(_BYTE *)(*(void *)(result + 32) + 25LL)
      && gLogCategory_CBUserController <= 30
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    uint64_t v3 = *(id **)(v2 + 32);
    if (v3[5])
    {
      [v3[5] invalidate];
      uint64_t v3 = *(id **)(v2 + 32);
    }

    return [v3 _invalidated];
  }

  return result;
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CBUserController <= 50
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    uint64_t v3 = MEMORY[0x18959F890](self->_invalidationHandler, a2);
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_CBUserController < 11
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__CBUserController_diagnosticShow_completion___block_invoke;
  block[3] = &unk_189FB1B80;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __46__CBUserController_diagnosticShow_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0LL;
  uint64_t v1 = *(void **)(a1 + 48);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __46__CBUserController_diagnosticShow_completion___block_invoke_2;
    v18[3] = &unk_189FB1B30;
    v20 = &v21;
    id v19 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v18);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      objc_super v11 = *(void **)(*(void *)(a1 + 32) + 40LL);
      if (v11)
      {
        v16[0] = v3;
        v16[1] = 3221225472LL;
        v16[2] = __46__CBUserController_diagnosticShow_completion___block_invoke_3;
        v16[3] = &unk_189FB1B58;
        id v17 = *(id *)(a1 + 48);
        [v11 remoteObjectProxyWithErrorHandler:v16];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 diagnosticShow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

        id v13 = v17;
LABEL_5:

        v4[2](v4);
        goto LABEL_6;
      }

      uint64_t v14 = CBErrorF(-6753, (uint64_t)"NO XPC", v5, v6, v7, v8, v9, v10, v15);
    }

    else
    {
      uint64_t v14 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
    }

    id v13 = (void *)v22[5];
    v22[5] = v14;
    goto LABEL_5;
  }

  if (gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

uint64_t __46__CBUserController_diagnosticShow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __46__CBUserController_diagnosticShow_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke;
  v7[3] = &unk_189FB1950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0LL;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_2;
    v18[3] = &unk_189FB1B30;
    v20 = &v21;
    id v19 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v18);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      objc_super v11 = *(void **)(*(void *)(a1 + 32) + 40LL);
      if (v11)
      {
        v16[0] = v3;
        v16[1] = 3221225472LL;
        v16[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_3;
        v16[3] = &unk_189FB1B58;
        id v17 = *(id *)(a1 + 40);
        [v11 remoteObjectProxyWithErrorHandler:v16];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 appleAudioAccessoryLimitedLoggingWithCompletion:*(void *)(a1 + 40)];

        id v13 = v17;
LABEL_5:

        v4[2](v4);
        goto LABEL_6;
      }

      uint64_t v14 = CBErrorF(-6753, (uint64_t)"NO XPC", v5, v6, v7, v8, v9, v10, v15);
    }

    else
    {
      uint64_t v14 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
    }

    id v13 = (void *)v22[5];
    v22[5] = v14;
    goto LABEL_5;
  }

  if (gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

uint64_t __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke;
  block[3] = &unk_189FB1BA8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_2;
    v19[3] = &unk_189FB1B30;
    uint64_t v21 = &v22;
    id v20 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v19);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      BOOL v11 = *(void **)(a1 + 40);
      id v12 = *(void **)(*(void *)(a1 + 32) + 40LL);
      v17[0] = v3;
      v17[1] = 3221225472LL;
      v17[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_3;
      v17[3] = &unk_189FB1B58;
      id v18 = v11;
      [v12 remoteObjectProxyWithErrorHandler:v17];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setAppleAudioAccessoryLimitedLogging:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];

      uint64_t v14 = v18;
    }

    else
    {
      uint64_t v15 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      uint64_t v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)getDistributedLoggingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke;
  v7[3] = &unk_189FB1950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_2;
    v19[3] = &unk_189FB1B30;
    uint64_t v21 = &v22;
    id v20 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v19);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      BOOL v11 = *(void **)(a1 + 40);
      id v12 = *(void **)(*(void *)(a1 + 32) + 40LL);
      v17[0] = v3;
      v17[1] = 3221225472LL;
      v17[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_3;
      v17[3] = &unk_189FB1B58;
      id v18 = v11;
      [v12 remoteObjectProxyWithErrorHandler:v17];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 getDistributedLoggingStatusWithCompletion:*(void *)(a1 + 40)];

      uint64_t v14 = v18;
    }

    else
    {
      uint64_t v15 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      uint64_t v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke;
  block[3] = &unk_189FB1BD0;
  block[4] = self;
  id v10 = v6;
  unsigned int v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_2;
    v19[3] = &unk_189FB1B30;
    uint64_t v21 = &v22;
    id v20 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v19);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      unsigned int v11 = *(void **)(a1 + 40);
      id v12 = *(void **)(*(void *)(a1 + 32) + 40LL);
      v17[0] = v3;
      v17[1] = 3221225472LL;
      v17[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_3;
      v17[3] = &unk_189FB1B58;
      id v18 = v11;
      [v12 remoteObjectProxyWithErrorHandler:v17];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setDistributedLoggingStatus:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];

      uint64_t v14 = v18;
    }

    else
    {
      uint64_t v15 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      uint64_t v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)getCurrentUserGivenNameWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke;
  v7[3] = &unk_189FB1950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_2;
    v19[3] = &unk_189FB1B30;
    uint64_t v21 = &v22;
    id v20 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v19);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      unsigned int v11 = *(void **)(a1 + 40);
      id v12 = *(void **)(*(void *)(a1 + 32) + 40LL);
      v17[0] = v3;
      v17[1] = 3221225472LL;
      v17[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_3;
      v17[3] = &unk_189FB1B58;
      id v18 = v11;
      [v12 remoteObjectProxyWithErrorHandler:v17];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 getCurrentUserGivenNameWithCompletion:*(void *)(a1 + 40)];

      uint64_t v14 = v18;
    }

    else
    {
      uint64_t v15 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      uint64_t v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)getControllerInfoForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke;
  block[3] = &unk_189FB1B80;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __58__CBUserController_getControllerInfoForDevice_completion___block_invoke(id *a1)
{
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  if (a1[6])
  {
    uint64_t v2 = MEMORY[0x1895F87A8];
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_2;
    v20[3] = &unk_189FB1BF8;
    uint64_t v23 = &v24;
    id v21 = a1[4];
    id v22 = a1[6];
    uint64_t v3 = (void (**)(void))MEMORY[0x18959F890](v20);
    if ([a1[5] _ensureXPCStarted])
    {
      id v10 = a1[6];
      unsigned int v11 = (void *)*((void *)a1[5] + 5);
      uint64_t v15 = v2;
      uint64_t v16 = 3221225472LL;
      id v17 = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_3;
      id v18 = &unk_189FB1B58;
      id v19 = v10;
      [v11 remoteObjectProxyWithErrorHandler:&v15];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getControllerInfoForDevice:completion:", a1[4], a1[6], v15, v16, v17, v18);

      id v13 = v19;
    }

    else
    {
      uint64_t v14 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v15);
      id v13 = (void *)v25[5];
      v25[5] = v14;
    }

    v3[2](v3);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v24, 8);
}

uint64_t __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  return result;
}

uint64_t __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)storeControllerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke;
  block[3] = &unk_189FB1B80;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __51__CBUserController_storeControllerInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0LL;
  uint64_t v1 = *(void **)(a1 + 48);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke_2;
    v18[3] = &unk_189FB1B30;
    id v20 = &v21;
    id v19 = v1;
    uint64_t v4 = (void (**)(void))MEMORY[0x18959F890](v18);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      unsigned int v11 = *(void **)(*(void *)(a1 + 32) + 40LL);
      v16[0] = v3;
      v16[1] = 3221225472LL;
      v16[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke_3;
      v16[3] = &unk_189FB1B58;
      id v17 = *(id *)(a1 + 48);
      [v11 remoteObjectProxyWithErrorHandler:v16];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 storeControllerInfo:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

      id v13 = v17;
    }

    else
    {
      uint64_t v14 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
      id v13 = (void *)v22[5];
      v22[5] = v14;
    }

    v4[2](v4);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v21, 8);
}

uint64_t __51__CBUserController_storeControllerInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __51__CBUserController_storeControllerInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke;
  v7[3] = &unk_189FB1950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_189FB1B30;
    uint64_t v21 = &v22;
    id v20 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v19);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      unsigned int v11 = *(void **)(a1 + 40);
      id v12 = *(void **)(*(void *)(a1 + 32) + 40LL);
      v17[0] = v3;
      v17[1] = 3221225472LL;
      v17[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_3;
      v17[3] = &unk_189FB1B58;
      id v18 = v11;
      [v12 remoteObjectProxyWithErrorHandler:v17];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 getCloudPairedDevicesWithCompletionHandler:*(void *)(a1 + 40)];

      uint64_t v14 = v18;
    }

    else
    {
      uint64_t v15 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      uint64_t v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)deleteControllerInfoForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke;
  block[3] = &unk_189FB1B80;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0LL;
  uint64_t v1 = *(void **)(a1 + 48);
  if (v1)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_2;
    v18[3] = &unk_189FB1B30;
    id v20 = &v21;
    id v19 = v1;
    id v4 = (void (**)(void))MEMORY[0x18959F890](v18);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      unsigned int v11 = *(void **)(*(void *)(a1 + 32) + 40LL);
      v16[0] = v3;
      v16[1] = 3221225472LL;
      v16[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_3;
      v16[3] = &unk_189FB1B58;
      id v17 = *(id *)(a1 + 48);
      [v11 remoteObjectProxyWithErrorHandler:v16];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 deleteControllerInfoForDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

      id v13 = v17;
    }

    else
    {
      uint64_t v14 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
      id v13 = (void *)v22[5];
      v22[5] = v14;
    }

    v4[2](v4);
  }

  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(&v21, 8);
}

uint64_t __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  id v10 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke;
  block[3] = &unk_189FB1C70;
  id v14 = v10;
  uint64_t v15 = self;
  BOOL v17 = a4;
  BOOL v18 = a5;
  unsigned int v16 = a6;
  id v12 = v10;
  dispatch_async(dispatchQueue, block);
}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke( uint64_t a1)
{
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_2;
  v15[3] = &unk_189FB1C20;
  BOOL v17 = &v18;
  id v16 = *(id *)(a1 + 32);
  uint64_t v3 = (void (**)(void))MEMORY[0x18959F890](v15);
  if ([*(id *)(a1 + 40) _ensureXPCStarted])
  {
    id v10 = *(void **)(*(void *)(a1 + 40) + 40LL);
    v14[0] = v2;
    v14[1] = 3221225472LL;
    v14[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_3;
    v14[3] = &unk_189FB1C48;
    v14[4] = &v18;
    [v10 remoteObjectProxyWithErrorHandler:v14];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 recordEventWithDeviceIdentifier:*(void *)(a1 + 32) initiator:*(unsigned __int8 *)(a1 + 52) starting:*(unsigned __int8 *)(a1 + 53) useCase:*(unsigned int *)(a1 + 48)];
  }

  else
  {
    uint64_t v12 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v13);
    unsigned int v11 = (void *)v19[5];
    v19[5] = v12;
  }

  v3[2](v3);
  _Block_object_dispose(&v18, 8);
}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_2( uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_3( uint64_t a1,  void *a2)
{
}

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke;
  v5[3] = &unk_189FB1CC0;
  unsigned int v6 = a4;
  v5[4] = self;
  BOOL v7 = a3;
  dispatch_async(dispatchQueue, v5);
}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke(uint64_t a1)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke_2;
  v15[3] = &unk_189FB1C98;
  void v15[4] = &v17;
  int v16 = *(_DWORD *)(a1 + 40);
  uint64_t v3 = (void (**)(void))MEMORY[0x18959F890](v15);
  if ([*(id *)(a1 + 32) _ensureXPCStarted])
  {
    id v10 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v14[0] = v2;
    v14[1] = 3221225472LL;
    v14[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke_3;
    v14[3] = &unk_189FB1C48;
    v14[4] = &v17;
    [v10 remoteObjectProxyWithErrorHandler:v14];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 recordEventWithStarting:*(unsigned __int8 *)(a1 + 44) useCase:*(unsigned int *)(a1 + 40)];
  }

  else
  {
    uint64_t v12 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v13);
    unsigned int v11 = (void *)v18[5];
    v18[5] = v12;
  }

  v3[2](v3);
  _Block_object_dispose(&v17, 8);
}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)readPrefKeys:(id)a3 source:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke;
  v13[3] = &unk_189FB1CE8;
  id v14 = v8;
  uint64_t v15 = self;
  unsigned int v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke_2;
  v19[3] = &unk_189FB1C20;
  uint64_t v21 = &v22;
  id v20 = *(id *)(a1 + 32);
  uint64_t v3 = (void (**)(void))MEMORY[0x18959F890](v19);
  if ([*(id *)(a1 + 40) _ensureXPCStarted])
  {
    id v10 = *(void **)(*(void *)(a1 + 40) + 40LL);
    v18[0] = v2;
    v18[1] = 3221225472LL;
    v18[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke_3;
    v18[3] = &unk_189FB1C48;
    void v18[4] = &v22;
    [v10 synchronousRemoteObjectProxyWithErrorHandler:v18];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(unsigned int *)(a1 + 56);
    v16[0] = v2;
    v16[1] = 3221225472LL;
    v16[2] = (uint64_t)__51__CBUserController_readPrefKeys_source_completion___block_invoke_4;
    v16[3] = (uint64_t)&unk_189FB1978;
    id v17 = *(id *)(a1 + 48);
    [v11 readPrefKeys:v12 source:v13 completion:v16];

    id v14 = v17;
  }

  else
  {
    uint64_t v15 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v16[0]);
    id v14 = (void *)v23[5];
    v23[5] = v15;
  }

  v3[2](v3);
  _Block_object_dispose(&v22, 8);
}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

void __51__CBUserController_readPrefKeys_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
}

uint64_t __51__CBUserController_readPrefKeys_source_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke;
  block[3] = &unk_189FB1D10;
  id v18 = v10;
  uint64_t v19 = self;
  unsigned int v22 = a5;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke_2;
  v20[3] = &unk_189FB1C20;
  unsigned int v22 = &v23;
  id v21 = *(id *)(a1 + 32);
  uint64_t v3 = (void (**)(void))MEMORY[0x18959F890](v20);
  if ([*(id *)(a1 + 40) _ensureXPCStarted])
  {
    id v10 = *(void **)(*(void *)(a1 + 40) + 40LL);
    v19[0] = v2;
    v19[1] = 3221225472LL;
    v19[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke_3;
    v19[3] = &unk_189FB1C48;
    void v19[4] = &v23;
    [v10 synchronousRemoteObjectProxyWithErrorHandler:v19];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(unsigned int *)(a1 + 64);
    v17[0] = v2;
    v17[1] = 3221225472LL;
    v17[2] = (uint64_t)__57__CBUserController_writePrefKey_value_source_completion___block_invoke_4;
    v17[3] = (uint64_t)&unk_189FB1B58;
    uint64_t v14 = *(void *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    [v11 writePrefKey:v12 value:v14 source:v13 completion:v17];

    id v15 = v18;
  }

  else
  {
    uint64_t v16 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v17[0]);
    id v15 = (void *)v24[5];
    v24[5] = v16;
  }

  v3[2](v3);
  _Block_object_dispose(&v23, 8);
}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
}

uint64_t __57__CBUserController_writePrefKey_value_source_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

+ (id)readPrefKeys:(id)a3 source:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  uint64_t v8 = MEMORY[0x1895F87A8];
  id v26 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke;
  v21[3] = &unk_189FB1D38;
  uint64_t v23 = v25;
  id v9 = v7;
  id v22 = v9;
  uint64_t v24 = a5;
  id v10 = (void (**)(void))MEMORY[0x18959F890](v21);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v12 = dispatch_queue_create("CBUserController-ReadPrefs", v11);

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.bluetoothuser.xpc" options:0];
  [v13 _setQueue:v12];
  CBUserControllerXPCInterface();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setExportedInterface:v14];

  CBUserControllerXPCInterface();
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setRemoteObjectInterface:v15];

  [v13 resume];
  v20[0] = v8;
  v20[1] = 3221225472LL;
  v20[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke_2;
  v20[3] = &unk_189FB1C48;
  void v20[4] = v25;
  [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472LL;
  v19[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke_3;
  v19[3] = &unk_189FB1D60;
  void v19[4] = &v27;
  [v16 readPrefKeys:v9 source:v6 completion:v19];

  id v17 = (id)v28[5];
  v10[2](v10);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v17;
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    }
  }

void __46__CBUserController_readPrefKeys_source_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke_3(uint64_t a1, void *a2)
{
}

+ (BOOL)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  id v32 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v11 = MEMORY[0x1895F87A8];
  char v30 = 0;
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke;
  v23[3] = &unk_189FB1D38;
  uint64_t v25 = v31;
  id v12 = v9;
  id v24 = v12;
  id v26 = a6;
  uint64_t v13 = (void (**)(void))MEMORY[0x18959F890](v23);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v15 = dispatch_queue_create("CBUserController-WritePrefs", v14);

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.bluetoothuser.xpc" options:0];
  [v16 _setQueue:v15];
  CBUserControllerXPCInterface();
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setExportedInterface:v17];

  CBUserControllerXPCInterface();
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setRemoteObjectInterface:v18];

  [v16 resume];
  v22[0] = v11;
  v22[1] = 3221225472LL;
  v22[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke_2;
  v22[3] = &unk_189FB1C48;
  v22[4] = v31;
  [v16 synchronousRemoteObjectProxyWithErrorHandler:v22];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472LL;
  v21[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke_3;
  v21[3] = &unk_189FB1C48;
  void v21[4] = &v27;
  [v19 writePrefKey:v12 value:v10 source:v7 completion:v21];

  LODWORD(v7) = *((unsigned __int8 *)v28 + 24);
  v13[2](v13);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);

  return (_DWORD)v7 != 0;
}

void __52__CBUserController_writePrefKey_value_source_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    }
  }

void __52__CBUserController_writePrefKey_value_source_error___block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __52__CBUserController_writePrefKey_value_source_error___block_invoke_3(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2 == 0;
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end