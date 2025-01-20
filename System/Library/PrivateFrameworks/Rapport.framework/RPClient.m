@interface RPClient
+ (void)primaryAccountSignedIn;
+ (void)primaryAccountSignedOut;
- (BOOL)targetUserSession;
- (OS_dispatch_queue)dispatchQueue;
- (RPClient)init;
- (RPClient)initWithUserProvider:(id)a3;
- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (id)_ensureXPCStarted;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)type;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateAssertionWithIdentifier:(id)a3;
- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4;
- (void)clientCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7;
- (void)createDeviceToListenerMapping:(id)a3 deviceID:(id)a4 completion:(id)a5;
- (void)createEndpointToDeviceMapping:(id)a3 deviceID:(id)a4 endpointID:(id)a5 completion:(id)a6;
- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5;
- (void)diagnosticLogControl:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5;
- (void)getIdentitiesWithCompletion:(id)a3;
- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)invalidate;
- (void)primaryAccountSignedInWithCompletion:(id)a3;
- (void)primaryAccountSignedOutWithCompletion:(id)a3;
- (void)queryDeviceToListenerMapping:(id)a3 deviceID:(id)a4 completion:(id)a5;
- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3;
- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4;
- (void)setAutoMapping:(BOOL)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation RPClient

+ (void)primaryAccountSignedIn
{
  v2 = objc_alloc_init(&OBJC_CLASS___RPClient);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __34__RPClient_primaryAccountSignedIn__block_invoke;
  v3[3] = &unk_18A031AC0;
  v3[4] = v2;
  -[RPClient primaryAccountSignedInWithCompletion:](v2, "primaryAccountSignedInWithCompletion:", v3);
}

void __34__RPClient_primaryAccountSignedIn__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5) {
    int v3 = 90;
  }
  else {
    int v3 = 30;
  }
  if (v3 >= gLogCategory_RPClient && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4);
}

+ (void)primaryAccountSignedOut
{
  v2 = objc_alloc_init(&OBJC_CLASS___RPClient);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35__RPClient_primaryAccountSignedOut__block_invoke;
  v3[3] = &unk_18A031AC0;
  v3[4] = v2;
  -[RPClient primaryAccountSignedOutWithCompletion:](v2, "primaryAccountSignedOutWithCompletion:", v3);
}

void __35__RPClient_primaryAccountSignedOut__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5) {
    int v3 = 90;
  }
  else {
    int v3 = 30;
  }
  if (v3 >= gLogCategory_RPClient && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4);
}

- (RPClient)init
{
  int v3 = objc_alloc_init(&OBJC_CLASS___RPSignedInUserProvider);
  id v4 = -[RPClient initWithUserProvider:](self, "initWithUserProvider:", v3);

  return v4;
}

- (RPClient)initWithUserProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPClient;
  v6 = -[RPClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v7->_type = 1;
    objc_storeStrong((id *)&v7->_userProvider, a3);
  }

  return v7;
}

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v5 = (objc_class *)MEMORY[0x189607B30];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithMachServiceName:v6 options:a4];

  return v7;
}

- (id)_ensureXPCStarted
{
  if (self->_xpcCnx)
  {
LABEL_21:
    v11 = 0LL;
    return v11;
  }

  if (-[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
    && self->_targetUserSession)
  {
    if (!-[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID"))
    {
      RPErrorF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      return v11;
    }
  }

  if (self->_type == 1)
  {
    -[RPClient _XPCConnectionWithMachServiceName:options:]( self,  "_XPCConnectionWithMachServiceName:options:",  @"com.apple.rapport",  0LL);
    int v3 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5AA0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5B00];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v8 = objc_opt_class();
    objc_super v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_getIdentitiesWithFlags_completion_ argumentIndex:0 ofReply:1];
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    uint64_t v10 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __29__RPClient__ensureXPCStarted__block_invoke;
    v15[3] = &unk_18A031A30;
    v15[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v15);
    v14[0] = v10;
    v14[1] = 3221225472LL;
    v14[2] = __29__RPClient__ensureXPCStarted__block_invoke_2;
    v14[3] = &unk_18A031A30;
    v14[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v14);
    if (self->_targetUserSession
      && -[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
      && -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID"))
    {
      -[NSXPCConnection _setTargetUserIdentifier:]( self->_xpcCnx,  "_setTargetUserIdentifier:",  -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID"));
    }

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    goto LABEL_21;
  }

  uint64_t v13 = FatalErrorF();
  return (id)__29__RPClient__ensureXPCStarted__block_invoke(v13);
}

uint64_t __29__RPClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __29__RPClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[NSMutableSet count](self->_assertions, "count"))
  {
    id v3 = -[RPClient _ensureXPCStarted](self, "_ensureXPCStarted");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v4 = self->_assertions;
    uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (gLogCategory_RPClient <= 50 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
          {
            uint64_t v12 = v9;
            LogPrintF();
          }

          -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy", v12);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 activateAssertionWithIdentifier:v9];
        }

        uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v6);
    }
  }

  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__RPClient_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __22__RPClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    if (!*(_BYTE *)(*(void *)(a1 + 32) + 25LL)
      && gLogCategory_RPClient <= 30
      && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v3 = *(void **)(*(void *)(a1 + 32) + 40LL);
    if (v3)
    {
      [v3 invalidate];
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = 0LL;
    }

    else
    {
      [*(id *)(a1 + 32) _invalidated];
    }
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPClient <= 50
      && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0LL;

    self->_invalidateDone = 1;
  }

- (void)activateAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __44__RPClient_activateAssertionWithIdentifier___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __44__RPClient_activateAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  }

  [v2 addObject:*(void *)(a1 + 40)];
  id v6 = (id)[*(id *)(a1 + 32) _ensureXPCStarted];
  [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 activateAssertionWithIdentifier:*(void *)(a1 + 40)];
}

- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__RPClient_addOrUpdateIdentity_completion___block_invoke;
  block[3] = &unk_18A031B38;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __43__RPClient_addOrUpdateIdentity_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __43__RPClient_addOrUpdateIdentity_completion___block_invoke_2;
    v9[3] = &unk_18A031B10;
    id v10 = *(id *)(a1 + 48);
    [v4 remoteObjectProxyWithErrorHandler:v9];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    v7[1] = 3221225472LL;
    v7[2] = __43__RPClient_addOrUpdateIdentity_completion___block_invoke_3;
    v7[3] = &unk_18A031B10;
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    [v5 addOrUpdateIdentity:v6 completion:v7];
  }
}

uint64_t __43__RPClient_addOrUpdateIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __43__RPClient_addOrUpdateIdentity_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    uint64_t v5 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_2;
    v9[3] = &unk_18A031B10;
    id v10 = v3;
    [v4 remoteObjectProxyWithErrorHandler:v9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_3;
    v7[3] = &unk_18A031B10;
    id v8 = *(id *)(a1 + 40);
    [v6 regenerateTemporarySelfIdentityWithCompletion:v7];
  }
}

uint64_t __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __48__RPClient_diagnosticCommand_params_completion___block_invoke;
  v15[3] = &unk_18A031BB0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

void __48__RPClient_diagnosticCommand_params_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    id v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __48__RPClient_diagnosticCommand_params_completion___block_invoke_2;
    v10[3] = &unk_18A031B10;
    id v11 = *(id *)(a1 + 56);
    [v4 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v8[0] = v3;
    v8[1] = 3221225472LL;
    v8[2] = __48__RPClient_diagnosticCommand_params_completion___block_invoke_3;
    v8[3] = &unk_18A031B88;
    id v9 = *(id *)(a1 + 56);
    [v5 diagnosticCommand:v6 params:v7 completion:v8];
  }
}

uint64_t __48__RPClient_diagnosticCommand_params_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __48__RPClient_diagnosticCommand_params_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__RPClient_diagnosticLogControl_completion___block_invoke;
  block[3] = &unk_18A031B38;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __44__RPClient_diagnosticLogControl_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 description];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }

  else
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    id v7 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __44__RPClient_diagnosticLogControl_completion___block_invoke_2;
    v12[3] = &unk_18A031B10;
    id v13 = *(id *)(a1 + 48);
    [v7 remoteObjectProxyWithErrorHandler:v12];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __44__RPClient_diagnosticLogControl_completion___block_invoke_3;
    v10[3] = &unk_18A031BD8;
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v8 diagnosticLogControl:v9 completion:v10];
  }
}

void __44__RPClient_diagnosticLogControl_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

void __44__RPClient_diagnosticLogControl_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }

    else
    {
      NSPrintF();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }

    uint64_t v4 = v7;
  }
}

- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __44__RPClient_diagnosticShow_level_completion___block_invoke;
  v13[3] = &unk_18A031C00;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  int v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(dispatchQueue, v13);
}

void __44__RPClient_diagnosticShow_level_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 description];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }

  else
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    id v7 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __44__RPClient_diagnosticShow_level_completion___block_invoke_2;
    v13[3] = &unk_18A031B10;
    id v14 = *(id *)(a1 + 48);
    [v7 remoteObjectProxyWithErrorHandler:v13];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = *(unsigned int *)(a1 + 56);
    v11[0] = v6;
    v11[1] = 3221225472LL;
    v11[2] = __44__RPClient_diagnosticShow_level_completion___block_invoke_3;
    v11[3] = &unk_18A031BD8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    [v8 diagnosticShow:v10 level:v9 completion:v11];
  }
}

void __44__RPClient_diagnosticShow_level_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

void __44__RPClient_diagnosticShow_level_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }

    else
    {
      NSPrintF();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }

    uint64_t v4 = v7;
  }
}

- (void)getIdentitiesWithCompletion:(id)a3
{
}

- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__RPClient_getIdentitiesWithFlags_completion___block_invoke;
  block[3] = &unk_18A031C28;
  block[4] = self;
  id v10 = v6;
  unsigned int v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __46__RPClient_getIdentitiesWithFlags_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __46__RPClient_getIdentitiesWithFlags_completion___block_invoke_2;
    v6[3] = &unk_18A031B10;
    id v7 = v3;
    [v4 remoteObjectProxyWithErrorHandler:v6];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 getIdentitiesWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
}

uint64_t __46__RPClient_getIdentitiesWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)primaryAccountSignedInWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    uint64_t v5 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_2;
    v9[3] = &unk_18A031B10;
    id v10 = v3;
    [v4 remoteObjectProxyWithErrorHandler:v9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_3;
    v7[3] = &unk_18A031B10;
    id v8 = *(id *)(a1 + 40);
    [v6 primaryAccountSignedInWithCompletion:v7];
  }
}

uint64_t __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)primaryAccountSignedOutWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    uint64_t v5 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_2;
    v9[3] = &unk_18A031B10;
    id v10 = v3;
    [v4 remoteObjectProxyWithErrorHandler:v9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_3;
    v7[3] = &unk_18A031B10;
    id v8 = *(id *)(a1 + 40);
    [v6 primaryAccountSignedOutWithCompletion:v7];
  }
}

uint64_t __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clientCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke;
  v21[3] = &unk_18A031C78;
  id v22 = v12;
  id v23 = v13;
  id v25 = v14;
  id v26 = v15;
  int v27 = a3;
  v24 = self;
  id v17 = v14;
  id v18 = v15;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(dispatchQueue, v21);
}

void __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke( uint64_t a1)
{
  if (gLogCategory_RPClient <= 40 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted", v10, v11);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    id v4 = *(void **)(*(void *)(a1 + 48) + 40LL);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_2;
    v14[3] = &unk_18A031B10;
    id v15 = *(id *)(a1 + 64);
    [v4 remoteObjectProxyWithErrorHandler:v14];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(unsigned int *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v12[0] = v3;
    v12[1] = 3221225472LL;
    v12[2] = __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_3;
    v12[3] = &unk_18A031C50;
    uint64_t v9 = *(void *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    [v5 serverCreateDeviceMappingInternal:v6 applicationService:v7 deviceID:v8 endpointID:v9 completion:v12];
  }
}

uint64_t __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_3( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)createEndpointToDeviceMapping:(id)a3 deviceID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
}

- (void)createDeviceToListenerMapping:(id)a3 deviceID:(id)a4 completion:(id)a5
{
}

- (void)queryDeviceToListenerMapping:(id)a3 deviceID:(id)a4 completion:(id)a5
{
}

- (void)setAutoMapping:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__RPClient_setAutoMapping_completion___block_invoke;
  block[3] = &unk_18A031CA0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __38__RPClient_setAutoMapping_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_RPClient <= 40 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(a1 + 48)) {
      id v2 = "yes";
    }
    else {
      id v2 = "no";
    }
    id v10 = v2;
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v10);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
  }

  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 40LL);
    uint64_t v7 = MEMORY[0x1895F87A8];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __38__RPClient_setAutoMapping_completion___block_invoke_2;
    v13[3] = &unk_18A031B10;
    id v14 = v5;
    [v6 remoteObjectProxyWithErrorHandler:v13];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
    v11[0] = v7;
    v11[1] = 3221225472LL;
    v11[2] = __38__RPClient_setAutoMapping_completion___block_invoke_3;
    v11[3] = &unk_18A031B10;
    id v12 = *(id *)(a1 + 40);
    [v8 serverSetAutoMappingInternal:v9 completion:v11];
  }
}

uint64_t __38__RPClient_setAutoMapping_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __38__RPClient_setAutoMapping_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__RPClient_removeSessionPairedIdentity_completion___block_invoke;
  block[3] = &unk_18A031B38;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __51__RPClient_removeSessionPairedIdentity_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
    }
  }

  else
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __51__RPClient_removeSessionPairedIdentity_completion___block_invoke_2;
    v6[3] = &unk_18A031B10;
    id v7 = *(id *)(a1 + 48);
    [v4 remoteObjectProxyWithErrorHandler:v6];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 removeSessionPairedIdentity:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

uint64_t __51__RPClient_removeSessionPairedIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
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

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end