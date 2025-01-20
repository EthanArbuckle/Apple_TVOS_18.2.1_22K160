@interface RPNearbyInvitationSession
+ (BOOL)supportsSecureCoding;
- (BOOL)failedToConnect;
- (BOOL)waitingToConnect;
- (NSNumber)sessionID;
- (NSString)description;
- (NSString)serviceType;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyInvitationDevice)daemonDevice;
- (RPNearbyInvitationDevice)destinationDevice;
- (RPNearbyInvitationServer)server;
- (RPNearbyInvitationSession)init;
- (RPNearbyInvitationSession)initWithCoder:(id)a3;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)activateWithCompletion:(id)a3;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)nearbyInvitationReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6;
- (void)nearbyInvitationReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7;
- (void)nearbyInvitationSessionError:(id)a3;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setDaemonDevice:(id)a3;
- (void)setDestinationDevice:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFailedToConnect:(BOOL)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setServer:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setWaitingToConnect:(BOOL)a3;
- (void)setXpcCnx:(id)a3;
@end

@implementation RPNearbyInvitationSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationSession;
  v2 = -[RPNearbyInvitationSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (RPNearbyInvitationSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationSession;
  v5 = -[RPNearbyInvitationSession init](&v10, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  serviceType = self->_serviceType;
  id v7 = v4;
  if (serviceType)
  {
    [v4 encodeObject:serviceType forKey:@"srvTy"];
    id v4 = v7;
  }

  destinationDevice = self->_destinationDevice;
  if (destinationDevice)
  {
    [v7 encodeObject:destinationDevice forKey:@"dd"];
    id v4 = v7;
  }
}

- (NSString)description
{
  id v3 = 0LL;
  id v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v12 = v3;
    objc_super v10 = serviceType;
    NSAppendPrintF();
    id v6 = v12;

    id v4 = v6;
  }

  destinationDevice = self->_destinationDevice;
  if (destinationDevice)
  {
    v11 = destinationDevice;
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }

  return (NSString *)v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __52__RPNearbyInvitationSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __52__RPNearbyInvitationSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (!self->_server)
  {
    if (v4)
    {
      if (gLogCategory_RPNearbyInvitationSession > 30
        || gLogCategory_RPNearbyInvitationSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_14;
      }
    }

    else if (gLogCategory_RPNearbyInvitationSession > 30 {
           || gLogCategory_RPNearbyInvitationSession == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_14;
    }

    LogPrintF();
LABEL_14:
    -[RPNearbyInvitationSession _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    uint64_t v9 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __64__RPNearbyInvitationSession__activateWithCompletion_reactivate___block_invoke;
    v15[3] = &unk_18A032340;
    v15[4] = self;
    BOOL v17 = v4;
    id v10 = v7;
    id v16 = v10;
    v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
    v12[0] = v9;
    v12[1] = 3221225472LL;
    v12[2] = __64__RPNearbyInvitationSession__activateWithCompletion_reactivate___block_invoke_2;
    v12[3] = &unk_18A031CC8;
    BOOL v14 = v4;
    id v13 = v10;
    [v11 nearbyInvitationActivateSession:self completion:v12];

    goto LABEL_15;
  }

  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
LABEL_15:
}

void __64__RPNearbyInvitationSession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
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
    if (gLogCategory_RPNearbyInvitationSession <= 90)
    {
      if (gLogCategory_RPNearbyInvitationSession != -1 || (int v6 = _LogCategory_Initialize(), v4 = v10, v6))
      {
LABEL_9:
        LogPrintF();
        BOOL v4 = v10;
      }
    }
  }

  else if (gLogCategory_RPNearbyInvitationSession <= 90)
  {
    if (gLogCategory_RPNearbyInvitationSession != -1) {
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

void __64__RPNearbyInvitationSession__activateWithCompletion_reactivate___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (gLogCategory_RPNearbyInvitationSession <= 90)
      {
        if (gLogCategory_RPNearbyInvitationSession != -1 || (v5 = _LogCategory_Initialize(), id v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          id v3 = v9;
        }
      }
    }

    else if (gLogCategory_RPNearbyInvitationSession <= 90)
    {
      if (gLogCategory_RPNearbyInvitationSession != -1) {
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
    if (gLogCategory_RPNearbyInvitationSession <= 30)
    {
      if (gLogCategory_RPNearbyInvitationSession != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      id v3 = 0LL;
      if (v6) {
        goto LABEL_15;
      }
    }
  }

  else if (gLogCategory_RPNearbyInvitationSession <= 30)
  {
    if (gLogCategory_RPNearbyInvitationSession != -1) {
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
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.rapport.NearbyInvitation" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6DC138];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __46__RPNearbyInvitationSession__ensureXPCStarted__block_invoke;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472LL;
    v8[2] = __46__RPNearbyInvitationSession__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_18A031A30;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5B60];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPNearbyInvitationSession <= 10
      && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

uint64_t __46__RPNearbyInvitationSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __46__RPNearbyInvitationSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)nearbyInvitationSessionError:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__RPNearbyInvitationSession_nearbyInvitationSessionError___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __58__RPNearbyInvitationSession_nearbyInvitationSessionError___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void (**)(void, void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 72LL));
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 40));
    uint64_t v2 = (void (**)(void, void))v3;
  }
}

- (void)_interrupted
{
  if (gLogCategory_RPNearbyInvitationSession <= 50
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (self->_activateCalled) {
    -[RPNearbyInvitationSession _activateWithCompletion:reactivate:]( self,  "_activateWithCompletion:reactivate:",  0LL,  1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__RPNearbyInvitationSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__RPNearbyInvitationSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPNearbyInvitationSession <= 30
      && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v3 = *(void *)(v2 + 32);
    if (*(void *)(v3 + 104))
    {
      id v4 = *(id *)(v3 + 112);
      if (v4)
      {
        [*(id *)(*(void *)(v2 + 32) + 120) remoteObjectProxy];
        int v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 nearbyInvitationInvalidateSessionID:v4];
      }

      uint64_t v6 = *(void *)(v2 + 32);
      int v7 = *(void **)(v6 + 104);
      *(void *)(v6 + 104) = 0LL;

      uint64_t v8 = *(void *)(v2 + 32);
      id v9 = *(void **)(v8 + 112);
      *(void *)(v8 + 112) = 0LL;

      uint64_t v10 = *(void *)(v2 + 32);
      v11 = *(void **)(v10 + 120);
      *(void *)(v10 + 120) = 0LL;
    }

    else
    {
      [*(id *)(v3 + 120) remoteObjectProxy];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 nearbyInvitationInvalidateClientSession];

      [*(id *)(*(void *)(v2 + 32) + 120) invalidate];
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
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearbyInvitationSession <= 30
      && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
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
  v15[2] = __61__RPNearbyInvitationSession_registerEventID_options_handler___block_invoke;
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

void __61__RPNearbyInvitationSession_registerEventID_options_handler___block_invoke(void *a1)
{
  if (gLogCategory_RPNearbyInvitationSession <= 30
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = a1[4];
    LogPrintF();
  }

  int v7 = objc_alloc_init(&OBJC_CLASS___RPEventRegistration);
  -[RPEventRegistration setEventID:](v7, "setEventID:", a1[4]);
  -[RPEventRegistration setOptions:](v7, "setOptions:", a1[5]);
  -[RPEventRegistration setHandler:](v7, "setHandler:", a1[7]);
  uint64_t v2 = *(void **)(a1[6] + 16LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = a1[6];
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(a1[6] + 16LL);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, a1[4], v6);
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__RPNearbyInvitationSession_deregisterEventID___block_invoke;
  v7[3] = &unk_18A031AE8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __47__RPNearbyInvitationSession_deregisterEventID___block_invoke(uint64_t a1)
{
  if (gLogCategory_RPNearbyInvitationSession <= 30
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
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
  id v14 = a6;
  id v15 = a7;
  if ([a5 isEqual:@"rapport:rdid:DirectPeer"])
  {
    -[RPNearbyInvitationSession _ensureXPCStarted](self, "_ensureXPCStarted");
    uint64_t v16 = MEMORY[0x1895F87A8];
    xpcCnx = self->_xpcCnx;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __80__RPNearbyInvitationSession_sendEventID_event_destinationID_options_completion___block_invoke;
    v25[3] = &unk_18A032610;
    v25[4] = self;
    id v18 = v12;
    id v26 = v18;
    id v19 = v15;
    id v27 = v19;
    v20 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v25);
    v22[0] = v16;
    v22[1] = 3221225472LL;
    v22[2] = __80__RPNearbyInvitationSession_sendEventID_event_destinationID_options_completion___block_invoke_2;
    v22[3] = &unk_18A032290;
    id v23 = v18;
    id v24 = v19;
    [v20 nearbyInvitationSendEventID:v23 event:v13 options:v14 completion:v22];
  }

  else if (v15)
  {
    RPErrorF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v21);
  }
}

void __80__RPNearbyInvitationSession_sendEventID_event_destinationID_options_completion___block_invoke( uint64_t a1,  void *a2)
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
  if (gLogCategory_RPNearbyInvitationSession <= 90)
  {
    if (gLogCategory_RPNearbyInvitationSession != -1 || (int v6 = _LogCategory_Initialize(), v4 = v9, v6))
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

void __80__RPNearbyInvitationSession_sendEventID_event_destinationID_options_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_RPNearbyInvitationSession <= 90)
    {
      if (gLogCategory_RPNearbyInvitationSession != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
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

- (void)nearbyInvitationReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", v9);
  if (v12)
  {
    id v13 = (void *)v12;
LABEL_3:
    uint64_t v14 = [v13 handler];
    id v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v10, v11);
    }

    goto LABEL_6;
  }

  uint64_t v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", @"*");
  if (v16)
  {
    id v13 = (void *)v16;
    if (v11)
    {
      id v17 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v11];
      [v17 setObject:v9 forKeyedSubscript:@"eventID"];

      id v11 = v17;
    }

    else
    {
      id v18 = @"eventID";
      v19[0] = v9;
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_3;
  }

  if (gLogCategory_RPNearbyInvitationSession <= 90
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __63__RPNearbyInvitationSession_registerRequestID_options_handler___block_invoke;
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

void __63__RPNearbyInvitationSession_registerRequestID_options_handler___block_invoke(void *a1)
{
  if (gLogCategory_RPNearbyInvitationSession <= 30
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = a1[4];
    LogPrintF();
  }

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___RPRequestRegistration);
  -[RPRequestRegistration setRequestID:](v7, "setRequestID:", a1[4]);
  -[RPRequestRegistration setOptions:](v7, "setOptions:", a1[5]);
  -[RPRequestRegistration setHandler:](v7, "setHandler:", a1[7]);
  uint64_t v2 = *(void **)(a1[6] + 32LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = a1[6];
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(a1[6] + 32LL);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, a1[4], v6);
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__RPNearbyInvitationSession_deregisterRequestID___block_invoke;
  v7[3] = &unk_18A031AE8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __49__RPNearbyInvitationSession_deregisterRequestID___block_invoke(uint64_t a1)
{
  if (gLogCategory_RPNearbyInvitationSession <= 30
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
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
  if (gLogCategory_RPNearbyInvitationSession <= 30
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
  {
    [v13 count];
    LogPrintF();
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __89__RPNearbyInvitationSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
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

uint64_t __89__RPNearbyInvitationSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke( uint64_t a1)
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
    -[RPNearbyInvitationSession _ensureXPCStarted](self, "_ensureXPCStarted");
    uint64_t v16 = MEMORY[0x1895F87A8];
    xpcCnx = self->_xpcCnx;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __90__RPNearbyInvitationSession__sendRequestID_request_destinationID_options_responseHandler___block_invoke;
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
    v22[2] = __90__RPNearbyInvitationSession__sendRequestID_request_destinationID_options_responseHandler___block_invoke_2;
    v22[3] = &unk_18A033D50;
    id v23 = v18;
    id v24 = v19;
    [v20 nearbyInvitationSendRequestID:v23 request:v13 options:v14 responseHandler:v22];
  }

  else if (v15)
  {
    RPErrorF();
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0LL, 0LL, v21);
  }
}

void __90__RPNearbyInvitationSession__sendRequestID_request_destinationID_options_responseHandler___block_invoke( uint64_t a1,  void *a2)
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
  if (gLogCategory_RPNearbyInvitationSession <= 90
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  (*(void (**)(void, void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL);
}

void __90__RPNearbyInvitationSession__sendRequestID_request_destinationID_options_responseHandler___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8
    && gLogCategory_RPNearbyInvitationSession <= 90
    && (gLogCategory_RPNearbyInvitationSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v9);
}

- (void)nearbyInvitationReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", v11);
  if (v15)
  {
    uint64_t v16 = (void *)v15;
  }

  else
  {
    uint64_t v19 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", @"*");
    if (!v19)
    {
      RPErrorF();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0LL, 0LL, v16);
      goto LABEL_6;
    }

    uint64_t v16 = (void *)v19;
    if (v13)
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v13];
      [v20 setObject:v11 forKeyedSubscript:@"requestID"];

      id v13 = v20;
    }

    else
    {
      id v21 = @"requestID";
      v22[0] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  uint64_t v17 = [v16 handler];
  id v18 = (void *)v17;
  if (v17) {
    (*(void (**)(uint64_t, id, id, id))(v17 + 16))(v17, v12, v13, v14);
  }

LABEL_6:
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (RPNearbyInvitationDevice)destinationDevice
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

- (RPNearbyInvitationDevice)daemonDevice
{
  return self->_daemonDevice;
}

- (void)setDaemonDevice:(id)a3
{
}

- (RPNearbyInvitationServer)server
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

- (BOOL)waitingToConnect
{
  return self->_waitingToConnect;
}

- (void)setWaitingToConnect:(BOOL)a3
{
  self->_waitingToConnect = a3;
}

- (BOOL)failedToConnect
{
  return self->_failedToConnect;
}

- (void)setFailedToConnect:(BOOL)a3
{
  self->_failedToConnect = a3;
}

- (void).cxx_destruct
{
}

@end