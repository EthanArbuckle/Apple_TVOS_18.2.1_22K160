@interface CUPairingManager
+ (id)copySystemPairingIdentifierAndReturnError:(id *)a3;
- (BOOL)targetUserSession;
- (CUPairingManager)init;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)identityCreatedHandler;
- (id)identityDeletedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)pairedPeerAddedHandler;
- (id)pairedPeerChangedHandler;
- (id)pairedPeerRemovedHandler;
- (int)_ensureXPCStarted;
- (unsigned)targetUserID;
- (void)_deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_getPairingIdentityWithOptions:(unint64_t)a3 tryCount:(unsigned int)a4 completion:(id)a5;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_showWithCompletion:(id)a3;
- (void)_startMonitoringWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getPairedPeersWithGroupID:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)invalidate;
- (void)pairedPeerAdded:(id)a3 options:(unint64_t)a4;
- (void)pairedPeerChanged:(id)a3 options:(unint64_t)a4;
- (void)pairedPeerRemoved:(id)a3 options:(unint64_t)a4;
- (void)pairingIdentityCreated:(id)a3 options:(unint64_t)a4;
- (void)pairingIdentityDeletedWithOptions:(unint64_t)a3;
- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentityCreatedHandler:(id)a3;
- (void)setIdentityDeletedHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPairedPeerAddedHandler:(id)a3;
- (void)setPairedPeerChangedHandler:(id)a3;
- (void)setPairedPeerRemovedHandler:(id)a3;
- (void)setTargetUserID:(unsigned int)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)showWithCompletion:(id)a3;
- (void)startMonitoringWithOptions:(unint64_t)a3;
- (void)updatePairedPeersWithGroupID:(id)a3 groupInfo:(id)a4 options:(unint64_t)a5 completion:(id)a6;
@end

@implementation CUPairingManager

- (CUPairingManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUPairingManager;
  v2 = -[CUPairingManager init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }

  return v2;
}

- (void)dealloc
{
  if (self->_xpcCnx) {
    FatalErrorF("XPC connection still active during dealloc");
  }
  id identityCreatedHandler = self->_identityCreatedHandler;
  self->_id identityCreatedHandler = 0LL;

  id identityDeletedHandler = self->_identityDeletedHandler;
  self->_id identityDeletedHandler = 0LL;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0LL;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  id pairedPeerAddedHandler = self->_pairedPeerAddedHandler;
  self->_id pairedPeerAddedHandler = 0LL;

  id pairedPeerRemovedHandler = self->_pairedPeerRemovedHandler;
  self->_id pairedPeerRemovedHandler = 0LL;

  id pairedPeerChangedHandler = self->_pairedPeerChangedHandler;
  self->_id pairedPeerChangedHandler = 0LL;

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CUPairingManager;
  -[CUPairingManager dealloc](&v10, sel_dealloc);
}

- (int)_ensureXPCStarted
{
  if (self->_xpcCnx) {
    return 0;
  }
  if (!self->_invalidateCalled && !self->_invalidateDone)
  {
    testListenerEndpoint = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x189607B30]);
    else {
      v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.PairingManager" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    uint64_t v7 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __37__CUPairingManager__ensureXPCStarted__block_invoke;
    v15[3] = &unk_189F34238;
    v15[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v15);
    v14[0] = v7;
    v14[1] = 3221225472LL;
    v14[2] = __37__CUPairingManager__ensureXPCStarted__block_invoke_2;
    v14[3] = &unk_189F34238;
    v14[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v14);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6AAC98];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6AAB08];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v10 = (void *)MEMORY[0x189604010];
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setClasses:v12 forSelector:sel_getPairedPeersWithOptions_completion_ argumentIndex:0 ofReply:1];
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");

    return 0;
  }

  return -6724;
}

- (void)_interrupted
{
  if (gLogCategory_CUPairingManager <= 50
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _interrupted]",  0x32u,  (uint64_t)"### Interrupted\n",  v3,  v4,  v5,  v6,  v13);
  }

  if (self->_monitoring && !-[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted"))
  {
    if (gLogCategory_CUPairingManager <= 50
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _interrupted]",  0x32u,  (uint64_t)"Restarting monitor after interruption\n",  v7,  v8,  v9,  v10,  v13);
    }

    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 startMonitoringWithOptions:self->_monitorOptions];
  }

  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUPairingManager_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _invalidate]",  0x1Eu,  (uint64_t)"Invalidating\n",  v3,  v4,  v5,  v6,  v9);
    }

    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      uint64_t v8 = self->_xpcCnx;
      self->_xpcCnx = 0LL;
    }

    else
    {
      -[CUPairingManager _invalidated](self, "_invalidated");
    }
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CUPairingManager <= 50
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _invalidated]",  0x32u,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v20);
    }

    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id identityCreatedHandler = self->_identityCreatedHandler;
    self->_id identityCreatedHandler = 0LL;

    id identityDeletedHandler = self->_identityDeletedHandler;
    self->_id identityDeletedHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v11 = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id pairedPeerAddedHandler = self->_pairedPeerAddedHandler;
    self->_id pairedPeerAddedHandler = 0LL;

    id pairedPeerRemovedHandler = self->_pairedPeerRemovedHandler;
    self->_id pairedPeerRemovedHandler = 0LL;

    id pairedPeerChangedHandler = self->_pairedPeerChangedHandler;
    self->_id pairedPeerChangedHandler = 0LL;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v16,  v17,  v18,  v19,  v21);
    }
  }

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/getPairingIdentityWithOptions",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__CUPairingManager_getPairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_189F316E0;
  id v11 = v6;
  unint64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

- (void)_getPairingIdentityWithOptions:(unint64_t)a3 tryCount:(unsigned int)a4 completion:(id)a5
{
  v35[1] = *MEMORY[0x1895F89C0];
  unint64_t v12 = (void (**)(id, void, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]",  0x1Eu,  (uint64_t)"GetPairingIdentity %#{flags}\n",  v8,  v9,  v10,  v11,  a3);
  }

  int v13 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v13)
  {
    int v21 = v13;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]",  0x3Cu,  (uint64_t)"### GetPairingIdentity %#{flags} failed: %#m\n",  v14,  v15,  v16,  v17,  a3);
    }

    v22 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607670];
    uint64_t v24 = v21;
    uint64_t v34 = *MEMORY[0x1896075E0];
    uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v21, 0, 0));
    v26 = (void *)v25;
    v27 = @"?";
    if (v25) {
      v27 = (const __CFString *)v25;
    }
    v35[0] = v27;
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 errorWithDomain:v23 code:v24 userInfo:v28];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0LL, v29);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __71__CUPairingManager__getPairingIdentityWithOptions_tryCount_completion___block_invoke;
    v30[3] = &unk_189F31708;
    unsigned int v33 = a4;
    v30[4] = self;
    unint64_t v32 = a3;
    uint64_t v19 = v12;
    id v31 = v19;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v30);
    char v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 getPairingIdentityWithOptions:a3 completion:v19];
  }
}

- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/deletePairingIdentityWithOptions",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__CUPairingManager_deletePairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_189F316E0;
  id v11 = v6;
  unint64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

- (void)_deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  v31[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = (void (**)(id, void *))a4;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _deletePairingIdentityWithOptions:completion:]",  0x1Eu,  (uint64_t)"DeletePairingIdentity %#{flags}\n",  v6,  v7,  v8,  v9,  a3);
  }

  int v11 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v11)
  {
    int v20 = v11;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _deletePairingIdentityWithOptions:completion:]",  0x3Cu,  (uint64_t)"### DeletePairingIdentity %#{flags} failed: %#m\n",  v12,  v13,  v14,  v15,  a3);
    }

    int v21 = (void *)MEMORY[0x189607870];
    uint64_t v22 = *MEMORY[0x189607670];
    uint64_t v23 = v20;
    uint64_t v30 = *MEMORY[0x1896075E0];
    uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    uint64_t v19 = (void *)v24;
    uint64_t v25 = @"?";
    if (v24) {
      uint64_t v25 = (const __CFString *)v24;
    }
    v31[0] = v25;
    [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 errorWithDomain:v22 code:v23 userInfo:v26];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v27);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __65__CUPairingManager__deletePairingIdentityWithOptions_completion___block_invoke;
    v28[3] = &unk_189F31730;
    uint64_t v17 = v10;
    v29 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v28);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 deletePairingIdentityWithOptions:a3 completion:v17];

    uint64_t v19 = v29;
  }
}

- (void)getPairedPeersWithGroupID:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __65__CUPairingManager_getPairedPeersWithGroupID_options_completion___block_invoke;
  v12[3] = &unk_189F31758;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  -[CUPairingManager getPairedPeersWithOptions:completion:](self, "getPairedPeersWithOptions:completion:", a4, v12);
}

- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/getPairedPeersWithOptions",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__CUPairingManager_getPairedPeersWithOptions_completion___block_invoke;
  block[3] = &unk_189F316E0;
  id v11 = v6;
  unint64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

- (void)_getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  v31[1] = *MEMORY[0x1895F89C0];
  id v10 = (void (**)(id, void, void *))a4;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _getPairedPeersWithOptions:completion:]",  0x1Eu,  (uint64_t)"GetPairedPeers %#{flags}\n",  v6,  v7,  v8,  v9,  a3);
  }

  int v11 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v11)
  {
    int v20 = v11;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _getPairedPeersWithOptions:completion:]",  0x3Cu,  (uint64_t)"### GetPairedPeers %#{flags} failed: %#m\n",  v12,  v13,  v14,  v15,  a3);
    }

    int v21 = (void *)MEMORY[0x189607870];
    uint64_t v22 = *MEMORY[0x189607670];
    uint64_t v23 = v20;
    uint64_t v30 = *MEMORY[0x1896075E0];
    uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    uint64_t v19 = (void *)v24;
    uint64_t v25 = @"?";
    if (v24) {
      uint64_t v25 = (const __CFString *)v24;
    }
    v31[0] = v25;
    [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 errorWithDomain:v22 code:v23 userInfo:v26];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0LL, v27);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __58__CUPairingManager__getPairedPeersWithOptions_completion___block_invoke;
    v28[3] = &unk_189F31730;
    uint64_t v17 = v10;
    id v29 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v28);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 getPairedPeersWithOptions:a3 completion:v17];

    uint64_t v19 = v29;
  }
}

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/findPairedPeer",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __54__CUPairingManager_findPairedPeer_options_completion___block_invoke;
  v14[3] = &unk_189F31780;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v35[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    [v8 identifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _findPairedPeer:options:completion:]",  0x1Eu,  (uint64_t)"FindPairedPeer %@, %#{flags}\n",  v11,  v12,  v13,  v14,  (char)v10);
  }

  int v15 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v15)
  {
    int v24 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _findPairedPeer:options:completion:]",  0x3Cu,  (uint64_t)"### FindPairedPeer %#{flags} failed: %#m\n",  v16,  v17,  v18,  v19,  a4);
    }

    uint64_t v25 = (void *)MEMORY[0x189607870];
    uint64_t v26 = *MEMORY[0x189607670];
    uint64_t v27 = v24;
    uint64_t v34 = *MEMORY[0x1896075E0];
    uint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
    uint64_t v23 = (void *)v28;
    id v29 = @"?";
    if (v28) {
      id v29 = (const __CFString *)v28;
    }
    v35[0] = v29;
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 errorWithDomain:v26 code:v27 userInfo:v30];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0LL, v31);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __55__CUPairingManager__findPairedPeer_options_completion___block_invoke;
    v32[3] = &unk_189F31730;
    int v21 = v9;
    id v33 = v21;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v32);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 findPairedPeer:v8 options:a4 completion:v21];

    uint64_t v23 = v33;
  }
}

- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/savePairedPeer",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __54__CUPairingManager_savePairedPeer_options_completion___block_invoke;
  v14[3] = &unk_189F31780;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)_savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    [v8 identifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _savePairedPeer:options:completion:]",  0x1Eu,  (uint64_t)"SavePairedPeer %@, %#{flags}\n",  v11,  v12,  v13,  v14,  (char)v10);
  }

  int v15 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v15)
  {
    int v20 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      [v8 identifier];
      int v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _savePairedPeer:options:completion:]",  0x3Cu,  (uint64_t)"### SavePairedPeer %@, %#{flags} failed: %#m\n",  v22,  v23,  v24,  v25,  (char)v21);
    }

    uint64_t v26 = (void *)MEMORY[0x189607870];
    uint64_t v27 = *MEMORY[0x189607670];
    uint64_t v28 = v20;
    uint64_t v35 = *MEMORY[0x1896075E0];
    uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    uint64_t v19 = (void *)v29;
    uint64_t v30 = @"?";
    if (v29) {
      uint64_t v30 = (const __CFString *)v29;
    }
    v36[0] = v30;
    [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 errorWithDomain:v27 code:v28 userInfo:v31];
    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v32);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __55__CUPairingManager__savePairedPeer_options_completion___block_invoke;
    v33[3] = &unk_189F31730;
    unint64_t v17 = v9;
    uint64_t v34 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v33);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 savePairedPeer:v8 options:a4 completion:v17];

    uint64_t v19 = v34;
  }
}

- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/removePairedPeer",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __56__CUPairingManager_removePairedPeer_options_completion___block_invoke;
  v14[3] = &unk_189F31780;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)_removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    [v8 identifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _removePairedPeer:options:completion:]",  0x1Eu,  (uint64_t)"RemovePairedPeer %@, %#{flags}\n",  v11,  v12,  v13,  v14,  (char)v10);
  }

  int v15 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v15)
  {
    int v20 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      [v8 identifier];
      int v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _removePairedPeer:options:completion:]",  0x3Cu,  (uint64_t)"### RemovePairedPeer %@, %#{flags} failed: %#m\n",  v22,  v23,  v24,  v25,  (char)v21);
    }

    uint64_t v26 = (void *)MEMORY[0x189607870];
    uint64_t v27 = *MEMORY[0x189607670];
    uint64_t v28 = v20;
    uint64_t v35 = *MEMORY[0x1896075E0];
    uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    uint64_t v19 = (void *)v29;
    uint64_t v30 = @"?";
    if (v29) {
      uint64_t v30 = (const __CFString *)v29;
    }
    v36[0] = v30;
    [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 errorWithDomain:v27 code:v28 userInfo:v31];
    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v32);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __57__CUPairingManager__removePairedPeer_options_completion___block_invoke;
    v33[3] = &unk_189F31730;
    unint64_t v17 = v9;
    uint64_t v34 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v33);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 removePairedPeer:v8 options:a4 completion:v17];

    uint64_t v19 = v34;
  }
}

- (void)showWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/showWithCompletion",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __39__CUPairingManager_showWithCompletion___block_invoke;
  v8[3] = &unk_189F33060;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

- (void)_showWithCompletion:(id)a3
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v8 = (void (**)(id, void, void *))a3;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _showWithCompletion:]",  0x1Eu,  (uint64_t)"Show\n",  v4,  v5,  v6,  v7,  v26);
  }

  int v9 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v9)
  {
    int v18 = v9;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _showWithCompletion:]",  0x3Cu,  (uint64_t)"### Show failed: %#m\n",  v10,  v11,  v12,  v13,  v18);
    }

    uint64_t v19 = (void *)MEMORY[0x189607870];
    uint64_t v20 = *MEMORY[0x189607670];
    uint64_t v21 = v18;
    uint64_t v29 = *MEMORY[0x1896075E0];
    uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v18, 0, 0));
    unint64_t v17 = (void *)v22;
    uint64_t v23 = @"?";
    if (v22) {
      uint64_t v23 = (const __CFString *)v22;
    }
    v30[0] = v23;
    [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 errorWithDomain:v20 code:v21 userInfo:v24];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0LL, v25);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __40__CUPairingManager__showWithCompletion___block_invoke;
    v27[3] = &unk_189F31730;
    int v15 = v8;
    id v28 = v15;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v27);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 showWithCompletion:v15];

    unint64_t v17 = v28;
  }
}

- (void)updatePairedPeersWithGroupID:(id)a3 groupInfo:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke;
  v14[3] = &unk_189F317D0;
  id v15 = v10;
  id v16 = self;
  id v17 = v11;
  unint64_t v18 = a5;
  id v12 = v10;
  id v13 = v11;
  -[CUPairingManager getPairedPeersWithGroupID:options:completion:]( self,  "getPairedPeersWithGroupID:options:completion:",  a3,  a5,  v14);
}

- (void)startMonitoringWithOptions:(unint64_t)a3
{
  uint64_t v5 = _os_activity_create( &dword_186A3B000,  "CoreUtils/CUPairingManager/startMonitoringWithOptions",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__CUPairingManager_startMonitoringWithOptions___block_invoke;
  v7[3] = &unk_189F317F8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(dispatchQueue, v7);
  os_activity_scope_leave(&state);
}

- (void)_startMonitoringWithOptions:(unint64_t)a3
{
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _startMonitoringWithOptions:]",  0x1Eu,  (uint64_t)"StartMonitoring %#{flags}\n",  v3,  v4,  v5,  v6,  a3);
  }

  if (-[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted"))
  {
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _startMonitoringWithOptions:]",  0x3Cu,  (uint64_t)"### StartMonitoring %#{flags} failed: %#m\n",  v9,  v10,  v11,  v12,  a3);
    }
  }

  else
  {
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 startMonitoringWithOptions:a3];

    self->_monitoring = 1;
    self->_monitorOptions = a3;
  }

- (void)pairingIdentityCreated:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    [v13 identifier];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager pairingIdentityCreated:options:]",  0x1Eu,  (uint64_t)"PairingIdentityCreated %@, %#{flags}\n",  v7,  v8,  v9,  v10,  (char)v6);
  }

  id identityCreatedHandler = (void (**)(id, id, unint64_t))self->_identityCreatedHandler;
  uint64_t v12 = v13;
  if (identityCreatedHandler)
  {
    identityCreatedHandler[2](identityCreatedHandler, v13, a4);
    uint64_t v12 = v13;
  }
}

- (void)pairingIdentityDeletedWithOptions:(unint64_t)a3
{
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager pairingIdentityDeletedWithOptions:]",  0x1Eu,  (uint64_t)"PairingIdentityDeleted %#{flags}\n",  v5,  v6,  v7,  v8,  a3);
  }

  id identityDeletedHandler = (void (**)(id, unint64_t))self->_identityDeletedHandler;
  if (identityDeletedHandler) {
    identityDeletedHandler[2](identityDeletedHandler, a3);
  }
}

- (void)pairedPeerAdded:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    [v13 identifier];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager pairedPeerAdded:options:]",  0x1Eu,  (uint64_t)"PairedPeerAdded %@, %#{flags}\n",  v7,  v8,  v9,  v10,  (char)v6);
  }

  id pairedPeerAddedHandler = (void (**)(id, id, unint64_t))self->_pairedPeerAddedHandler;
  uint64_t v12 = v13;
  if (pairedPeerAddedHandler)
  {
    pairedPeerAddedHandler[2](pairedPeerAddedHandler, v13, a4);
    uint64_t v12 = v13;
  }
}

- (void)pairedPeerRemoved:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    [v13 identifier];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager pairedPeerRemoved:options:]",  0x1Eu,  (uint64_t)"PairedPeerRemoved %@, %#{flags}\n",  v7,  v8,  v9,  v10,  (char)v6);
  }

  id pairedPeerRemovedHandler = (void (**)(id, id, unint64_t))self->_pairedPeerRemovedHandler;
  uint64_t v12 = v13;
  if (pairedPeerRemovedHandler)
  {
    pairedPeerRemovedHandler[2](pairedPeerRemovedHandler, v13, a4);
    uint64_t v12 = v13;
  }
}

- (void)pairedPeerChanged:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    [v13 identifier];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager pairedPeerChanged:options:]",  0x1Eu,  (uint64_t)"PairedPeerChanged %@, %#{flags}\n",  v7,  v8,  v9,  v10,  (char)v6);
  }

  id pairedPeerChangedHandler = (void (**)(id, id, unint64_t))self->_pairedPeerChangedHandler;
  uint64_t v12 = v13;
  if (pairedPeerChangedHandler)
  {
    pairedPeerChangedHandler[2](pairedPeerChangedHandler, v13, a4);
    uint64_t v12 = v13;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)identityCreatedHandler
{
  return self->_identityCreatedHandler;
}

- (void)setIdentityCreatedHandler:(id)a3
{
}

- (id)identityDeletedHandler
{
  return self->_identityDeletedHandler;
}

- (void)setIdentityDeletedHandler:(id)a3
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

- (id)pairedPeerAddedHandler
{
  return self->_pairedPeerAddedHandler;
}

- (void)setPairedPeerAddedHandler:(id)a3
{
}

- (id)pairedPeerRemovedHandler
{
  return self->_pairedPeerRemovedHandler;
}

- (void)setPairedPeerRemovedHandler:(id)a3
{
}

- (id)pairedPeerChangedHandler
{
  return self->_pairedPeerChangedHandler;
}

- (void)setPairedPeerChangedHandler:(id)a3
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

- (unsigned)targetUserID
{
  return self->_targetUserID;
}

- (void)setTargetUserID:(unsigned int)a3
{
  self->_targetUserID = a3;
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

uint64_t __47__CUPairingManager_startMonitoringWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoringWithOptions:*(void *)(a1 + 40)];
}

void __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke( void *a1,  void *a2,  void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v21 = v5;
  if (v6)
  {
    (*(void (**)(void))(a1[6] + 16LL))();
  }

  else
  {
    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x3032000000LL;
    v33[3] = __Block_byref_object_copy__5984;
    void v33[4] = __Block_byref_object_dispose__5985;
    id v34 = 0LL;
    uint64_t v7 = dispatch_group_create();
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v11 info];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = (void *)[v12 mutableCopy];
          uint64_t v14 = v13;
          if (v13) {
            id v15 = v13;
          }
          else {
            id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
          }
          id v16 = v15;

          [v16 setObject:a1[4] forKeyedSubscript:@"groupInfo"];
          [v11 setInfo:v16];
          dispatch_group_enter(v7);
          id v17 = (void *)a1[5];
          uint64_t v18 = a1[7];
          v26[0] = MEMORY[0x1895F87A8];
          v26[1] = 3221225472LL;
          v26[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_77;
          v26[3] = &unk_189F33CF0;
          id v28 = v33;
          uint64_t v27 = v7;
          [v17 savePairedPeer:v11 options:v18 completion:v26];
        }

        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }

      while (v8);
    }

    uint64_t v19 = (void *)a1[6];
    uint64_t v20 = *(dispatch_queue_s **)(a1[5] + 40LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_2;
    block[3] = &unk_189F317A8;
    id v24 = v19;
    uint64_t v25 = v33;
    dispatch_group_notify(v7, v20, block);

    _Block_object_dispose(v33, 8);
    id v6 = 0LL;
  }
}

void __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_77( uint64_t a1,  void *a2)
{
  id v7 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void *)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  if (!v6) {
    objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

uint64_t __40__CUPairingManager__showWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __39__CUPairingManager_showWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __57__CUPairingManager__removePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __56__CUPairingManager_removePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __55__CUPairingManager__savePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __54__CUPairingManager_savePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _savePairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __55__CUPairingManager__findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __54__CUPairingManager_findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findPairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __58__CUPairingManager__getPairedPeersWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __57__CUPairingManager_getPairedPeersWithOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPairedPeersWithOptions:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void __65__CUPairingManager_getPairedPeersWithGroupID_options_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    uint64_t v22 = 0LL;
    goto LABEL_18;
  }

  id v23 = v6;
  id v24 = v5;
  id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v27;
  do
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      [v13 groupInfo];
      uint64_t v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFTypeID TypeID = CFStringGetTypeID();
      CFDictionaryGetTypedValue(v14, @"groupID", TypeID, 0LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();

      id v17 = *(void **)(a1 + 32);
      id v18 = v16;
      id v19 = v17;
      if (v18 == v19)
      {

LABEL_12:
        [v25 addObject:v13];
        goto LABEL_14;
      }

      uint64_t v20 = v19;
      if ((v18 == 0LL) != (v19 != 0LL))
      {
        int v21 = [v18 isEqual:v19];

        if (v21) {
          goto LABEL_12;
        }
      }

      else
      {
      }

uint64_t __65__CUPairingManager__deletePairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __64__CUPairingManager_deletePairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deletePairingIdentityWithOptions:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void __71__CUPairingManager__getPairingIdentityWithOptions_tryCount_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v9 = a2;
  if ([v9 code] == 4097 && (unsigned int v7 = *(_DWORD *)(a1 + 56), v7 <= 9))
  {
    if (gLogCategory_CUPairingManager <= 60)
    {
      if (gLogCategory_CUPairingManager != -1
        || (v8 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu), unsigned int v7 = *(_DWORD *)(a1 + 56), v8))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]_block_invoke",  0x3Cu,  (uint64_t)"### GetPairingIdentity daemon restart...retrying %u of 10\n",  v3,  v4,  v5,  v6,  v7);
        unsigned int v7 = *(_DWORD *)(a1 + 56);
      }
    }

    [*(id *)(a1 + 32) _getPairingIdentityWithOptions:*(void *)(a1 + 48) tryCount:v7 + 1 completion:*(void *)(a1 + 40)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

uint64_t __61__CUPairingManager_getPairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPairingIdentityWithOptions:*(void *)(a1 + 48) tryCount:1 completion:*(void *)(a1 + 40)];
}

uint64_t __30__CUPairingManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __37__CUPairingManager__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __37__CUPairingManager__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

+ (id)copySystemPairingIdentifierAndReturnError:(id *)a3
{
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]",  0x1Eu,  (uint64_t)"CopySystemPairingIdentifier: trying direct",  v3,  v4,  v5,  v6,  v35);
  }

  id v8 = -[CUPairingDaemon initStandalone](objc_alloc(&OBJC_CLASS___CUPairingDaemon), "initStandalone");
  unsigned int v38 = -6700;
  id v9 = (void *)[v8 copyIdentityWithOptions:4 error:&v38];
  [v9 identifier];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 UUIDString];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingManager,  (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]",  0x1Eu,  (uint64_t)"CopySystemPairingIdentifier: direct: %@",  v12,  v13,  v14,  v15,  (char)v11);
    }

@end