@interface RPStatusSubscriber
+ (BOOL)supportsSecureCoding;
- (BOOL)targetUserSession;
- (BOOL)wantStatus:(id)a3 FromDevice:(id)a4;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)statusConfigurations;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (RPStatusSubscriber)init;
- (RPStatusSubscriber)initWithCoder:(id)a3;
- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7;
- (id)_ensureXPCStarted;
- (id)identifierFromDevice:(id)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDevices:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setStatusConfigurations:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)subscribeToStatusUpdate:(id)a3 leeway:(double)a4 configurationFlags:(unint64_t)a5 statusUpdateHandler:(id)a6 completion:(id)a7;
- (void)unsubscribeToStatusUpdate:(id)a3 completion:(id)a4;
- (void)xpcStatusUpdatableGiveStatusUpdate:(id)a3 peerDevice:(id)a4 currentState:(int)a5 statusInfo:(id)a6;
@end

@implementation RPStatusSubscriber

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPStatusSubscriber)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPStatusSubscriber;
  v2 = -[RPStatusSubscriber init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = objc_alloc_init(&OBJC_CLASS___RPSignedInUserProvider);
    userProvider = v3->_userProvider;
    v3->_userProvider = v4;

    v6 = v3;
  }

  return v3;
}

- (RPStatusSubscriber)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPStatusSubscriber;
  v3 = -[RPStatusSubscriber init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v5 = v4;
  }

  return v4;
}

- (NSString)description
{
  return (NSString *)0LL;
}

- (void)subscribeToStatusUpdate:(id)a3 leeway:(double)a4 configurationFlags:(unint64_t)a5 statusUpdateHandler:(id)a6 completion:(id)a7
{
  id v9 = a3;
  id v10 = a7;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __103__RPStatusSubscriber_subscribeToStatusUpdate_leeway_configurationFlags_statusUpdateHandler_completion___block_invoke;
  block[3] = &unk_18A031B38;
  id v15 = v9;
  id v16 = v10;
  block[4] = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(dispatchQueue, block);
}

void __103__RPStatusSubscriber_subscribeToStatusUpdate_leeway_configurationFlags_statusUpdateHandler_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  objc_super v7 = (void *)v2;
  if (!v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 xpcStatusUpdatableSubscribeToStatus:*(void *)(a1 + 40)];

LABEL_9:
    v3 = v7;
    goto LABEL_10;
  }

  v3 = (void *)v2;
  if (gLogCategory_StatusSubscriber <= 60)
  {
    if (gLogCategory_StatusSubscriber != -1 || (int v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      LogPrintF();
      v3 = v7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    goto LABEL_9;
  }

- (void)unsubscribeToStatusUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__RPStatusSubscriber_unsubscribeToStatusUpdate_completion___block_invoke;
  block[3] = &unk_18A031B38;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __59__RPStatusSubscriber_unsubscribeToStatusUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v7 = (void *)v2;
  if (!v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 xpcStatusUpdatableUnsubscribeToStatus:*(void *)(a1 + 40)];

LABEL_9:
    v3 = v7;
    goto LABEL_10;
  }

  v3 = (void *)v2;
  if (gLogCategory_StatusSubscriber <= 60)
  {
    if (gLogCategory_StatusSubscriber != -1 || (int v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      LogPrintF();
      v3 = v7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    goto LABEL_9;
  }

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __45__RPStatusSubscriber_activateWithCompletion___block_invoke;
  v8[3] = &unk_18A031B60;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __45__RPStatusSubscriber_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (gLogCategory_StatusSubscriber > 30
      || gLogCategory_StatusSubscriber == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
  }

  else if (gLogCategory_StatusSubscriber > 30 {
         || gLogCategory_StatusSubscriber == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_14;
  }

  if (self->_targetUserSession) {
    id v7 = "(TargetUserSession)";
  }
  else {
    id v7 = "";
  }
  v14 = v7;
  LogPrintF();
LABEL_14:
  -[RPStatusSubscriber _ensureXPCStarted](self, "_ensureXPCStarted", v14);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6) {
      v6[2](v6, v8);
    }
  }

  else
  {
    uint64_t v9 = MEMORY[0x1895F87A8];
    xpcCnx = self->_xpcCnx;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke;
    v18[3] = &unk_18A031CC8;
    BOOL v20 = v4;
    v11 = v6;
    v19 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v18);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472LL;
    v15[2] = __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke_2;
    v15[3] = &unk_18A032368;
    BOOL v17 = v4;
    v15[4] = self;
    id v13 = v11;
    id v16 = v13;
    [v12 xpcStatusSubscriberActivate:self completion:v15];

    if (v13) {
      v13[2](v13, 0LL);
    }
  }
}

void __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_StatusSubscriber <= 60)
    {
      if (gLogCategory_StatusSubscriber != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }

  else if (gLogCategory_StatusSubscriber <= 60)
  {
    if (gLogCategory_StatusSubscriber != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = v7;
    if (v5) {
      goto LABEL_7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

void __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) getIdentifier];
        }

        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v9);
    }

    objc_sync_exit(v7);
    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_StatusSubscriber <= 30
        && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
      {
LABEL_22:
        LogPrintF();
      }
    }

    else if (gLogCategory_StatusSubscriber <= 30 {
           && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    }
    {
      goto LABEL_22;
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0LL);
    }
    goto LABEL_32;
  }

  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_StatusSubscriber <= 60
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
LABEL_19:
      LogPrintF();
    }
  }

  else if (gLogCategory_StatusSubscriber <= 60 {
         && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_19;
  }

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    if (self->_invalidateCalled)
    {
      RPErrorF();
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }

    uint64_t v4 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __39__RPStatusSubscriber__ensureXPCStarted__block_invoke;
    v14[3] = &unk_18A031A30;
    v14[4] = self;
    id v5 = (void *)MEMORY[0x1895A4770](v14, a2);
    v13[0] = v4;
    v13[1] = 3221225472LL;
    v13[2] = __39__RPStatusSubscriber__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_18A031A30;
    v13[4] = self;
    id v6 = (void *)MEMORY[0x1895A4770](v13);
    if (-[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
      && self->_targetUserSession)
    {
      unsigned int v7 = -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID");
      if (!v7)
      {
        if (gLogCategory_StatusSubscriber <= 50
          && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        RPErrorF();
        uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }

      if (gLogCategory_StatusSubscriber <= 30)
      {
        unsigned int v8 = v7;
        if (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize())
        {
          uint64_t v12 = v8;
          LogPrintF();
        }
      }
    }

    -[RPStatusSubscriber _connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:]( self,  "_connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:",  self,  self->_dispatchQueue,  self->_userProvider,  v5,  v6,  v12);
    uint64_t v9 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v9;

    if (gLogCategory_StatusSubscriber <= 10
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v2 = 0LL;
LABEL_20:

    return v2;
  }

  uint64_t v2 = 0LL;
  return v2;
}

uint64_t __39__RPStatusSubscriber__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __39__RPStatusSubscriber__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v30 = a5;
  v11 = (objc_class *)MEMORY[0x189607B30];
  id v32 = a7;
  id v31 = a6;
  id v33 = a4;
  id v12 = a3;
  __int128 v13 = (void *)[[v11 alloc] initWithMachServiceName:@"com.apple.rapport.StatusUpdates" options:0];
  id v14 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E1738];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 setClasses:v22 forSelector:sel_xpcStatusUpdatableGiveStatusUpdate_peerDevice_currentState_statusInfo_ argumentIndex:1 ofReply:0];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5E60];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v26 = objc_opt_class();
  v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  [v24 setClasses:v27 forSelector:sel_xpcStatusSubscriberActivate_completion_ argumentIndex:0 ofReply:1];

  [v24 setClasses:v22 forSelector:sel_xpcStatusUpdatableSubscribeToStatus_ argumentIndex:0 ofReply:0];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:", objc_opt_class(), 0);
  [v24 setClasses:v28 forSelector:sel_xpcStatusUpdatableUnsubscribeToStatus_ argumentIndex:0 ofReply:0];

  [v13 setExportedInterface:v23];
  [v13 setExportedObject:v12];

  [v13 setInterruptionHandler:v31];
  [v13 setInvalidationHandler:v32];

  [v13 setRemoteObjectInterface:v24];
  [v13 _setQueue:v33];

  if (self->_targetUserSession
    && [v30 supportsMultipleUsers]
    && [v30 signedInUserID])
  {
    objc_msgSend(v13, "_setTargetUserIdentifier:", objc_msgSend(v30, "signedInUserID"));
  }

  [v13 resume];

  return v13;
}

- (void)_interrupted
{
  if (gLogCategory_StatusSubscriber <= 50
    && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (self->_activateCalled) {
    -[RPStatusSubscriber _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0LL, 1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__RPStatusSubscriber_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPStatusSubscriber_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_StatusSubscriber <= 30
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    [*(id *)(*(void *)(v2 + 32) + 24) invalidate];
    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    devices = self->_devices;
    self->_devices = 0LL;

    statusConfigurations = self->_statusConfigurations;
    self->_statusConfigurations = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_StatusSubscriber <= 30
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)xpcStatusUpdatableGiveStatusUpdate:(id)a3 peerDevice:(id)a4 currentState:(int)a5 statusInfo:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v21 = a3;
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = self;
  objc_sync_enter(v12);
  -[RPStatusSubscriber identifierFromDevice:](v12, "identifierFromDevice:", v10);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_devices, "objectForKeyedSubscript:", v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 statusInfoMap];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v11 forKeyedSubscript:v21];

    [MEMORY[0x189607968] numberWithInt:v7];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 statusStateMap];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setObject:v16 forKeyedSubscript:v21];

    -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_devices, "setObject:forKeyedSubscript:", v14, v13);
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_statusConfigurations, "objectForKeyedSubscript:", v21);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v18 = 0LL;
    id v14 = 0LL;
  }

  objc_sync_exit(v12);
  if (v13)
  {
    [v18 handler];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      [v18 handler];
      uint64_t v20 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, id, uint64_t, id))v20)[2](v20, v21, v10, v7, v11);
    }
  }
}

- (BOOL)wantStatus:(id)a3 FromDevice:(id)a4
{
  return 1;
}

- (id)identifierFromDevice:(id)a3
{
  id v3 = a3;
  [v3 idsDeviceIdentifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    [v3 identifier];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v7 = v6;

  return v7;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSMutableDictionary)statusConfigurations
{
  return self->_statusConfigurations;
}

- (void)setStatusConfigurations:(id)a3
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

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (void).cxx_destruct
{
}

@end