@interface RPNearbyInvitationServer
+ (BOOL)supportsSecureCoding;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyInvitationServer)init;
- (RPNearbyInvitationServer)initWithCoder:(id)a3;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)sessionEndedHandler;
- (id)sessionStartHandler;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)nearbyInvitationReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6;
- (void)nearbyInvitationReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7;
- (void)nearbyInvitationSessionEndedWithID:(id)a3;
- (void)nearbyInvitationSessionError:(id)a3 withID:(id)a4;
- (void)nearbyInvitationStartServerSessionID:(id)a3 device:(id)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionEndedHandler:(id)a3;
- (void)setSessionStartHandler:(id)a3;
@end

@implementation RPNearbyInvitationServer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationServer;
  v2 = -[RPNearbyInvitationServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (RPNearbyInvitationServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationServer;
  v5 = -[RPNearbyInvitationServer init](&v10, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  serviceType = self->_serviceType;
  if (serviceType) {
    [a3 encodeObject:serviceType forKey:@"srvTy"];
  }
}

- (id)description
{
  id v3 = 0LL;
  id v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v9 = v3;
    v8 = serviceType;
    NSAppendPrintF();
    id v6 = v9;

    id v4 = v6;
  }

  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __51__RPNearbyInvitationServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __51__RPNearbyInvitationServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPNearbyInvitationServer <= 30 {
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  -[RPNearbyInvitationServer _ensureXPCStarted](self, "_ensureXPCStarted");
  uint64_t v7 = MEMORY[0x1895F87A8];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_18A031CC8;
  BOOL v17 = v4;
  id v9 = v6;
  id v16 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_18A031CC8;
  BOOL v14 = v4;
  id v13 = v9;
  id v11 = v9;
  [v10 nearbyInvitationActivateServer:self completion:v12];
}

void __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPNearbyInvitationServer <= 90)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }

  else if (gLogCategory_RPNearbyInvitationServer <= 90)
  {
    if (gLogCategory_RPNearbyInvitationServer != -1) {
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

void __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (gLogCategory_RPNearbyInvitationServer <= 90)
      {
        if (gLogCategory_RPNearbyInvitationServer != -1 || (v5 = _LogCategory_Initialize(), id v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          id v3 = v9;
        }
      }
    }

    else if (gLogCategory_RPNearbyInvitationServer <= 90)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1) {
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
    if (gLogCategory_RPNearbyInvitationServer <= 30)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      id v3 = 0LL;
      if (v6) {
        goto LABEL_15;
      }
    }
  }

  else if (gLogCategory_RPNearbyInvitationServer <= 30)
  {
    if (gLogCategory_RPNearbyInvitationServer != -1) {
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
    v9[2] = __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472LL;
    v8[2] = __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_18A031A30;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5B60];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPNearbyInvitationServer <= 10
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

uint64_t __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_RPNearbyInvitationServer <= 50
    && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (self->_activateCalled) {
    -[RPNearbyInvitationServer _activateWithCompletion:reactivate:]( self,  "_activateWithCompletion:reactivate:",  0LL,  1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__RPNearbyInvitationServer_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__RPNearbyInvitationServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    [*(id *)(*(void *)(v2 + 32) + 16) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_0];
    [*(id *)(*(void *)(v2 + 32) + 24) invalidate];
    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

uint64_t __38__RPNearbyInvitationServer_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_sessions, "count")
    && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id sessionStartHandler = self->_sessionStartHandler;
    self->_id sessionStartHandler = 0LL;

    id sessionEndedHandler = self->_sessionEndedHandler;
    self->_id sessionEndedHandler = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)nearbyInvitationStartServerSessionID:(id)a3 device:(id)a4 completion:(id)a5
{
  id v18 = a3;
  int v8 = (void (**)(id, void *))a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v10 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v11 = objc_alloc_init(&OBJC_CLASS___RPNearbyInvitationSession);
  -[RPNearbyInvitationSession setDestinationDevice:](v11, "setDestinationDevice:", v10);

  -[RPNearbyInvitationSession setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
  -[RPNearbyInvitationSession setServer:](v11, "setServer:", self);
  -[RPNearbyInvitationSession setSessionID:](v11, "setSessionID:", v18);
  -[RPNearbyInvitationSession setXpcCnx:](v11, "setXpcCnx:", self->_xpcCnx);
  sessions = self->_sessions;
  if (!sessions)
  {
    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    BOOL v14 = self->_sessions;
    self->_sessions = v13;

    sessions = self->_sessions;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v11, v18);
  uint64_t v15 = MEMORY[0x1895A4770](self->_sessionStartHandler);
  id v16 = (void *)v15;
  if (v15)
  {
    (*(void (**)(uint64_t, RPNearbyInvitationSession *, void (**)(id, void *)))(v15 + 16))( v15,  v11,  v8);
  }

  else
  {
    RPErrorF();
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v17);
  }
}

- (void)nearbyInvitationSessionEndedWithID:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v7);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v5 = MEMORY[0x1895A4770](self->_sessionEndedHandler);
    uint64_t v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0LL);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessions, "setObject:forKeyedSubscript:", 0LL, v7);
  }
}

- (void)nearbyInvitationReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = v13;
    if (v13) {
      [v13 nearbyInvitationReceivedEventID:v15 event:v10 options:v11 sessionID:v12];
    }
  }

  else if (gLogCategory_RPNearbyInvitationServer <= 90 {
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)nearbyInvitationReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = v16;
    if (v16) {
      [v16 nearbyInvitationReceivedRequestID:v18 request:v12 options:v13 responseHandler:v14 sessionID:v15];
    }
  }

  else if (gLogCategory_RPNearbyInvitationServer <= 90 {
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)nearbyInvitationSessionError:(id)a3 withID:(id)a4
{
  id v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", a4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6) {
    [v6 nearbyInvitationSessionError:v8];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)sessionStartHandler
{
  return self->_sessionStartHandler;
}

- (void)setSessionStartHandler:(id)a3
{
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end