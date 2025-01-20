@interface RPRemoteDisplaySession
+ (BOOL)supportsSecureCoding;
- (BOOL)needsAWDL;
- (CUBonjourDevice)bonjourDevice;
- (NSArray)allowedMACAddresses;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSNumber)sessionID;
- (NSString)password;
- (NSString)serviceType;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPRemoteDisplayDevice)daemonDevice;
- (RPRemoteDisplayDevice)destinationDevice;
- (RPRemoteDisplayServer)server;
- (RPRemoteDisplaySession)init;
- (RPRemoteDisplaySession)initWithCoder:(id)a3;
- (id)authCompletionHandler;
- (id)description;
- (id)errorHandler;
- (id)hidePasswordHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)promptForPasswordHandler;
- (id)showPasswordHandler;
- (int)linkType;
- (int)passwordType;
- (int)passwordTypeActual;
- (unint64_t)controlFlags;
- (unsigned)internalAuthFlags;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)activateWithCompletion:(id)a3;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)remoteDisplayAuthCompleted:(id)a3;
- (void)remoteDisplayPromptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)remoteDisplayReceivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)remoteDisplayReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)remoteDisplaySessionError:(id)a3;
- (void)remoteDisplayUpdateDataLinkType:(id)a3;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setBonjourDevice:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDaemonDevice:(id)a3;
- (void)setDestinationDevice:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLinkType:(int)a3;
- (void)setNeedsAWDL:(BOOL)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setServer:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)tryPassword:(id)a3;
@end

@implementation RPRemoteDisplaySession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplaySession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPRemoteDisplaySession;
  v2 = -[RPRemoteDisplaySession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (RPRemoteDisplaySession)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPRemoteDisplaySession;
  v5 = -[RPRemoteDisplaySession init](&v12, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    id v7 = v4;

    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t controlFlags = self->_controlFlags;
  id v11 = v4;
  if (controlFlags)
  {
    [v4 encodeInt64:controlFlags forKey:@"cFl"];
    id v4 = v11;
  }

  destinationDevice = self->_destinationDevice;
  if (destinationDevice)
  {
    [v11 encodeObject:destinationDevice forKey:@"dd"];
    id v4 = v11;
  }

  uint64_t internalAuthFlags = self->_internalAuthFlags;
  if ((_DWORD)internalAuthFlags)
  {
    [v11 encodeInt64:internalAuthFlags forKey:@"iaf"];
    id v4 = v11;
  }

  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    [v11 encodeObject:pairingInfo forKey:@"pairI"];
    id v4 = v11;
  }

  uint64_t passwordType = self->_passwordType;
  if ((_DWORD)passwordType)
  {
    [v11 encodeInteger:passwordType forKey:@"pwTy"];
    id v4 = v11;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v11 encodeObject:serviceType forKey:@"srvTy"];
    id v4 = v11;
  }
}

- (id)description
{
  id v3 = 0LL;
  id v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_super v12 = v3;
    v10 = serviceType;
    NSAppendPrintF();
    id v6 = v12;

    id v4 = v6;
  }

  destinationDevice = self->_destinationDevice;
  if (destinationDevice)
  {
    id v11 = destinationDevice;
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }

  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__RPRemoteDisplaySession_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __49__RPRemoteDisplaySession_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (self->_server)
  {
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
    goto LABEL_23;
  }

  if (v4)
  {
    if (gLogCategory_RPRemoteDisplaySession > 30
      || gLogCategory_RPRemoteDisplaySession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
  }

  else if (gLogCategory_RPRemoteDisplaySession > 30 {
         || gLogCategory_RPRemoteDisplaySession == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_14;
  }

  LogPrintF();
LABEL_14:
  if (self->_authCompletionHandler) {
    self->_internalAuthFlags |= 8u;
  }
  if (self->_showPasswordHandler) {
    self->_internalAuthFlags |= 1u;
  }
  if (self->_hidePasswordHandler) {
    self->_internalAuthFlags |= 2u;
  }
  if (self->_promptForPasswordHandler) {
    self->_internalAuthFlags |= 4u;
  }
  -[RPRemoteDisplaySession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_18A032340;
  v15[4] = self;
  BOOL v17 = v4;
  id v10 = v7;
  id v16 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472LL;
  v12[2] = __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_18A031CC8;
  BOOL v14 = v4;
  id v13 = v10;
  [v11 remoteDisplayActivateSession:self completion:v12];

LABEL_23:
}

void __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (*(_BYTE *)(*(void *)(a1 + 32) + 24LL))
  {
    id v9 = v3;
    uint64_t v5 = RPNestedErrorF();

    BOOL v4 = (void *)v5;
  }

  id v10 = v4;
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1 || (int v6 = _LogCategory_Initialize(), v4 = v10, v6))
      {
LABEL_9:
        LogPrintF();
        BOOL v4 = v10;
      }
    }
  }

  else if (gLogCategory_RPRemoteDisplaySession <= 90)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1) {
      goto LABEL_9;
    }
    int v7 = _LogCategory_Initialize();
    BOOL v4 = v10;
    if (v7) {
      goto LABEL_9;
    }
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
    BOOL v4 = v10;
  }
}

void __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (gLogCategory_RPRemoteDisplaySession <= 90)
      {
        if (gLogCategory_RPRemoteDisplaySession != -1 || (v5 = _LogCategory_Initialize(), id v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          id v3 = v9;
        }
      }
    }

    else if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1) {
        goto LABEL_15;
      }
      int v7 = _LogCategory_Initialize();
      id v3 = v9;
      if (v7) {
        goto LABEL_15;
      }
    }
  }

  else if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplaySession <= 30)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      id v3 = 0LL;
      if (v6) {
        goto LABEL_15;
      }
    }
  }

  else if (gLogCategory_RPRemoteDisplaySession <= 30)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1) {
      goto LABEL_15;
    }
    int v8 = _LogCategory_Initialize();
    id v3 = 0LL;
    if (v8) {
      goto LABEL_15;
    }
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
    id v3 = v9;
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.RemoteDisplay" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E06F0];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472LL;
    v8[2] = __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_18A031A30;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5DA0];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPRemoteDisplaySession <= 10
      && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

uint64_t __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 224);
  *(void *)(v2 + 224) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_RPRemoteDisplaySession <= 50
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (self->_activateCalled) {
    -[RPRemoteDisplaySession _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0LL, 1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__RPRemoteDisplaySession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__RPRemoteDisplaySession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPRemoteDisplaySession <= 30
      && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v3 = *(void *)(v2 + 32);
    if (*(void *)(v3 + 208))
    {
      id v4 = *(id *)(v3 + 216);
      if (v4)
      {
        [*(id *)(*(void *)(v2 + 32) + 224) remoteObjectProxy];
        int v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 remoteDisplayInvalidateSessionID:v4];
      }

      uint64_t v6 = *(void *)(v2 + 32);
      int v7 = *(void **)(v6 + 208);
      *(void *)(v6 + 208) = 0LL;

      uint64_t v8 = *(void *)(v2 + 32);
      id v9 = *(void **)(v8 + 216);
      *(void *)(v8 + 216) = 0LL;

      uint64_t v10 = *(void *)(v2 + 32);
      id v11 = *(void **)(v10 + 224);
      *(void *)(v10 + 224) = 0LL;
    }

    else
    {
      [*(id *)(v3 + 224) remoteObjectProxy];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 remoteDisplayInvalidateClientSession];

      [*(id *)(*(void *)(v2 + 32) + 224) invalidate];
    }

    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    -[NSMutableDictionary removeAllObjects](self->_eventRegistrations, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_requestRegistrations, "removeAllObjects");
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0LL;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v7 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id showPasswordHandler = self->_showPasswordHandler;
    self->_id showPasswordHandler = 0LL;

    id hidePasswordHandler = self->_hidePasswordHandler;
    self->_id hidePasswordHandler = 0LL;

    id promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_id promptForPasswordHandler = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteDisplaySession <= 30
      && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)tryPassword:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__RPRemoteDisplaySession_tryPassword___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __38__RPRemoteDisplaySession_tryPassword___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 remoteDisplayTryPassword:*(void *)(a1 + 40)];
}

- (void)remoteDisplayPromptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    uint64_t v7 = MEMORY[0x1895A4770](self->_promptForPasswordHandler);
    id v8 = (void *)v7;
    if (v7)
    {
      uint64_t v10 = (void *)v7;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v5, v4);
LABEL_4:

      return;
    }

    if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      uint64_t v10 = 0LL;
      if (gLogCategory_RPRemoteDisplaySession != -1 || (v9 = _LogCategory_Initialize(), id v8 = 0LL, v9))
      {
        LogPrintF();
        goto LABEL_4;
      }
    }
  }

- (void)remoteDisplayAuthCompleted:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = MEMORY[0x1895A4770](self->_authCompletionHandler);
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }

  else if (gLogCategory_RPRemoteDisplaySession <= 90 {
         && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __58__RPRemoteDisplaySession_registerEventID_options_handler___block_invoke;
  v15[3] = &unk_18A032408;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __58__RPRemoteDisplaySession_registerEventID_options_handler___block_invoke(void *a1)
{
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = a1[4];
    LogPrintF();
  }

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___RPEventRegistration);
  -[RPEventRegistration setEventID:](v7, "setEventID:", a1[4]);
  -[RPEventRegistration setOptions:](v7, "setOptions:", a1[5]);
  -[RPEventRegistration setHandler:](v7, "setHandler:", a1[7]);
  id v2 = *(void **)(a1[6] + 16LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = a1[6];
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(a1[6] + 16LL);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, a1[4], v6);
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __44__RPRemoteDisplaySession_deregisterEventID___block_invoke;
  v7[3] = &unk_18A031AE8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __44__RPRemoteDisplaySession_deregisterEventID___block_invoke(uint64_t a1)
{
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return [*(id *)(*(void *)(a1 + 40) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    [v13 count];
    LogPrintF();
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77__RPRemoteDisplaySession_sendEventID_event_destinationID_options_completion___block_invoke;
  block[3] = &unk_18A033D28;
  block[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(dispatchQueue, block);
}

uint64_t __77__RPRemoteDisplaySession_sendEventID_event_destinationID_options_completion___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEventID:*(void *)(a1 + 40) event:*(void *)(a1 + 48) destinationID:*(void *)(a1 + 56) options:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (void)_sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([a5 isEqual:@"rapport:rdid:DirectPeer"])
  {
    -[RPRemoteDisplaySession _ensureXPCStarted](self, "_ensureXPCStarted");
    uint64_t v16 = MEMORY[0x1895F87A8];
    xpcCnx = self->_xpcCnx;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke;
    v25[3] = &unk_18A032610;
    v25[4] = self;
    id v18 = v12;
    id v26 = v18;
    id v19 = v15;
    id v27 = v19;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v25);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472LL;
    v22[2] = __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke_2;
    v22[3] = &unk_18A032290;
    id v23 = v18;
    id v24 = v19;
    [v20 remoteDisplaySendEventID:v23 event:v13 options:v14 completion:v22];
  }

  else if (v15)
  {
    RPErrorF();
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v21);
  }
}

void __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(_BYTE *)(*(void *)(a1 + 32) + 24LL))
  {
    id v8 = v3;
    uint64_t v5 = RPNestedErrorF();

    id v4 = (void *)v5;
  }

  id v9 = v4;
  if (gLogCategory_RPRemoteDisplaySession <= 90)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1 || (int v6 = _LogCategory_Initialize(), v4 = v9, v6))
    {
      LogPrintF();
      id v4 = v9;
    }
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    id v4 = v9;
  }
}

void __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

- (void)remoteDisplayReceivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", v8);
  if (v11)
  {
    id v12 = (void *)v11;
  }

  else
  {
    uint64_t v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", @"*");
    if (!v15) {
      goto LABEL_6;
    }
    id v12 = (void *)v15;
    if (v10)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v10];
      [v16 setObject:v8 forKeyedSubscript:@"eventID"];

      id v10 = v16;
    }

    else
    {
      id v17 = @"eventID";
      v18[0] = v8;
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  uint64_t v13 = [v12 handler];
  id v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v9, v10);
  }

LABEL_6:
}

- (void)remoteDisplaySessionError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = MEMORY[0x1895A4770](self->_errorHandler);
  uint64_t v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __60__RPRemoteDisplaySession_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_18A032408;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __60__RPRemoteDisplaySession_registerRequestID_options_handler___block_invoke(void *a1)
{
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = a1[4];
    LogPrintF();
  }

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___RPRequestRegistration);
  -[RPRequestRegistration setRequestID:](v7, "setRequestID:", a1[4]);
  -[RPRequestRegistration setOptions:](v7, "setOptions:", a1[5]);
  -[RPRequestRegistration setHandler:](v7, "setHandler:", a1[7]);
  id v2 = *(void **)(a1[6] + 32LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = a1[6];
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    id v2 = *(void **)(a1[6] + 32LL);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, a1[4], v6);
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__RPRemoteDisplaySession_deregisterRequestID___block_invoke;
  v7[3] = &unk_18A031AE8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __46__RPRemoteDisplaySession_deregisterRequestID___block_invoke(uint64_t a1)
{
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return [*(id *)(*(void *)(a1 + 40) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    [v13 count];
    LogPrintF();
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __86__RPRemoteDisplaySession_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  block[3] = &unk_18A033D28;
  block[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(dispatchQueue, block);
}

uint64_t __86__RPRemoteDisplaySession_sendRequestID_request_destinationID_options_responseHandler___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequestID:*(void *)(a1 + 40) request:*(void *)(a1 + 48) destinationID:*(void *)(a1 + 56) options:*(void *)(a1 + 64) responseHandler:*(void *)(a1 + 72)];
}

- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([a5 isEqual:@"rapport:rdid:DirectPeer"])
  {
    -[RPRemoteDisplaySession _ensureXPCStarted](self, "_ensureXPCStarted");
    uint64_t v16 = MEMORY[0x1895F87A8];
    xpcCnx = self->_xpcCnx;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke;
    v25[3] = &unk_18A032610;
    v25[4] = self;
    id v18 = v12;
    id v26 = v18;
    id v19 = v15;
    id v27 = v19;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v25);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472LL;
    v22[2] = __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke_2;
    v22[3] = &unk_18A033D50;
    id v23 = v18;
    id v24 = v19;
    [v20 remoteDisplaySendRequestID:v23 request:v13 options:v14 responseHandler:v22];
  }

  else if (v15)
  {
    RPErrorF();
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0LL, 0LL, v21);
  }
}

void __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(_BYTE *)(*(void *)(a1 + 32) + 24LL))
  {
    id v6 = v3;
    uint64_t v5 = RPNestedErrorF();

    id v4 = (id)v5;
  }

  id v7 = v4;
  if (gLogCategory_RPRemoteDisplaySession <= 90
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  (*(void (**)(void, void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL);
}

void __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8
    && gLogCategory_RPRemoteDisplaySession <= 90
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v9);
}

- (void)remoteDisplayReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", v10);
  if (v14)
  {
    id v15 = (void *)v14;
  }

  else
  {
    uint64_t v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", @"*");
    if (!v18)
    {
      RPErrorF();
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v15);
      goto LABEL_6;
    }

    id v15 = (void *)v18;
    if (v12)
    {
      id v19 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v12];
      [v19 setObject:v10 forKeyedSubscript:@"requestID"];

      id v12 = v19;
    }

    else
    {
      id v20 = @"requestID";
      v21[0] = v10;
      [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  uint64_t v16 = [v15 handler];
  id v17 = (void *)v16;
  if (v16) {
    (*(void (**)(uint64_t, id, id, id))(v16 + 16))(v16, v11, v12, v13);
  }

LABEL_6:
}

- (void)remoteDisplayUpdateDataLinkType:(id)a3
{
  unsigned int v4 = [a3 intValue];
  unsigned int linkType = self->_linkType;
  if (linkType) {
    BOOL v6 = linkType == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __58__RPRemoteDisplaySession_remoteDisplayUpdateDataLinkType___block_invoke;
    block[3] = &unk_18A032318;
    block[4] = self;
    unsigned int v9 = v4;
    dispatch_async(dispatchQueue, block);
  }

  else if (gLogCategory_RPRemoteDisplaySession <= 30)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1)
    {
LABEL_10:
      RPDataLinkTypeToString_0(linkType);
      RPDataLinkTypeToString_0(v4);
      LogPrintF();
      return;
    }

    if (_LogCategory_Initialize())
    {
      unsigned int linkType = self->_linkType;
      goto LABEL_10;
    }
  }

uint64_t __58__RPRemoteDisplaySession_remoteDisplayUpdateDataLinkType___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_DWORD *)(v1 + 60))
  {
    uint64_t v2 = result;
    if (gLogCategory_RPRemoteDisplaySession <= 30)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1
        || (result = _LogCategory_Initialize(), uint64_t v1 = *(void *)(v2 + 32), (_DWORD)result))
      {
        result = LogPrintF();
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }

    *(_DWORD *)(v1 + 60) = *(_DWORD *)(v2 + 40);
  }

  return result;
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
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
  self->_uint64_t passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_unsigned int linkType = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_unint64_t controlFlags = a3;
}

- (RPRemoteDisplayDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setDestinationDevice:(id)a3
{
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

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
}

- (RPRemoteDisplayDevice)daemonDevice
{
  return self->_daemonDevice;
}

- (void)setDaemonDevice:(id)a3
{
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (BOOL)needsAWDL
{
  return self->_needsAWDL;
}

- (void)setNeedsAWDL:(BOOL)a3
{
  self->_needsAWDL = a3;
}

- (RPRemoteDisplayServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end