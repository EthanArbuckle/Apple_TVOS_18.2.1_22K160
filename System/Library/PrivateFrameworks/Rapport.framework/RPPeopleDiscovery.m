@interface RPPeopleDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)_ensureXPCStarted;
- (BOOL)targetUserSession;
- (NSArray)discoveredPeople;
- (OS_dispatch_queue)dispatchQueue;
- (RPPeopleDiscovery)init;
- (RPPeopleDiscovery)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)peopleDensityChangedHandler;
- (id)personChangedHandler;
- (id)personFoundHandler;
- (id)personLostHandler;
- (id)statusChangedHandler;
- (int)discoveryMode;
- (int)peopleDensity;
- (unsigned)changeFlags;
- (unsigned)discoveryFlags;
- (unsigned)scanRate;
- (unsigned)statusFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_lostAllPeople;
- (void)_scheduleRetry;
- (void)_updatePeopleDensity:(unint64_t)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addAppleID:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)removeAppleID:(id)a3 completion:(id)a4;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDiscoveryFlags:(unsigned int)a3;
- (void)setDiscoveryMode:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeopleDensityChangedHandler:(id)a3;
- (void)setPersonChangedHandler:(id)a3;
- (void)setPersonFoundHandler:(id)a3;
- (void)setPersonLostHandler:(id)a3;
- (void)setScanRate:(unsigned int)a3;
- (void)setStatusChangedHandler:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)xpcPeopleStatusChanged:(unsigned int)a3;
- (void)xpcPersonChanged:(id)a3 changes:(unsigned int)a4;
- (void)xpcPersonFound:(id)a3;
- (void)xpcPersonLost:(id)a3;
@end

@implementation RPPeopleDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPeopleDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPPeopleDiscovery;
  v2 = -[RPPeopleDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (RPPeopleDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPPeopleDiscovery;
  v5 = -[RPPeopleDiscovery init](&v9, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t changeFlags = self->_changeFlags;
  id v9 = v4;
  if ((_DWORD)changeFlags)
  {
    [v4 encodeInt64:changeFlags forKey:@"cf"];
    id v4 = v9;
  }

  uint64_t discoveryFlags = self->_discoveryFlags;
  if ((_DWORD)discoveryFlags)
  {
    [v9 encodeInt64:discoveryFlags forKey:@"df"];
    id v4 = v9;
  }

  uint64_t discoveryMode = self->_discoveryMode;
  if ((_DWORD)discoveryMode)
  {
    [v9 encodeInteger:discoveryMode forKey:@"dm"];
    id v4 = v9;
  }

  uint64_t scanRate = self->_scanRate;
  if ((_DWORD)scanRate)
  {
    [v9 encodeInt64:scanRate forKey:@"scr"];
    id v4 = v9;
  }
}

- (id)description
{
  return -[RPPeopleDiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v26 = 0LL;
  v27 = (id *)&v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  id v31 = 0LL;
  id v25 = 0LL;
  int discoveryMode = self->_discoveryMode;
  if (discoveryMode > 199)
  {
    if (discoveryMode == 200)
    {
      objc_super v6 = "MyMeDevices";
      goto LABEL_11;
    }

    if (discoveryMode == 400)
    {
      objc_super v6 = "Contacts";
      goto LABEL_11;
    }

void __42__RPPeopleDiscovery_descriptionWithLevel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v1 + 40);
  CUDescriptionWithLevel();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

- (void)setDiscoveryFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __39__RPPeopleDiscovery_setDiscoveryFlags___block_invoke;
  v3[3] = &unk_18A032318;
  v3[4] = self;
  unsigned int v4 = a3;
  -[RPPeopleDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __39__RPPeopleDiscovery_setDiscoveryFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 56LL) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setScanRate:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__RPPeopleDiscovery_setScanRate___block_invoke;
  v3[3] = &unk_18A032318;
  v3[4] = self;
  unsigned int v4 = a3;
  -[RPPeopleDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __33__RPPeopleDiscovery_setScanRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 68LL) = *(_DWORD *)(result + 40);
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __44__RPPeopleDiscovery_activateWithCompletion___block_invoke;
  v8[3] = &unk_18A031B60;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __44__RPPeopleDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_7;
    }
  }

  else if (gLogCategory_RPPeopleDiscovery <= 30 {
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
LABEL_7:
    if (self->_targetUserSession) {
      id v7 = "(TargetUserSession)";
    }
    else {
      id v7 = "";
    }
    int v12 = v7;
    LogPrintF();
  }

  if (-[RPPeopleDiscovery _ensureXPCStarted](self, "_ensureXPCStarted", v12))
  {
    xpcCnx = self->_xpcCnx;
    uint64_t v9 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke;
    v16[3] = &unk_18A032340;
    BOOL v18 = v4;
    v16[4] = self;
    id v10 = v6;
    id v17 = v10;
    v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v16);
    v13[0] = v9;
    v13[1] = 3221225472LL;
    v13[2] = __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke_2;
    v13[3] = &unk_18A033A88;
    BOOL v15 = v4;
    v13[4] = self;
    id v14 = v10;
    [v11 xpcPeopleDiscoveryActivate:self completion:v13];
  }

  else
  {
    -[RPPeopleDiscovery _scheduleRetry](self, "_scheduleRetry");
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

void __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v4 = v5;
      LogPrintF();
    }
  }

  else if (gLogCategory_RPPeopleDiscovery <= 90 {
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry", v4);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
}

void __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  v29 = v5;
  if (!v6)
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          int v12 = *(void **)(*(void *)(a1 + 32) + 16LL);
          if (!v12)
          {
            id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
            uint64_t v14 = *(void *)(a1 + 32);
            BOOL v15 = *(void **)(v14 + 16);
            *(void *)(v14 + 16) = v13;

            int v12 = *(void **)(*(void *)(a1 + 32) + 16LL);
          }

          [v11 identifier];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 setObject:v11 forKeyedSubscript:v16];
        }

        uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v8);
    }

    uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    objc_sync_exit(obj);

    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_RPPeopleDiscovery > 30
        || gLogCategory_RPPeopleDiscovery == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_37;
      }
    }

    else if (gLogCategory_RPPeopleDiscovery > 30 {
           || gLogCategory_RPPeopleDiscovery == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_37;
    }

    [v7 count];
    LogPrintF();
LABEL_37:
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0LL);
    }
    int v22 = (void (**)(void, void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 112LL));
    if (v22)
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v23 = v7;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v31;
        do
        {
          for (uint64_t j = 0LL; j != v24; ++j)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v23);
            }
            v22[2](v22, *(void *)(*((void *)&v30 + 1) + 8 * j));
          }

          uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }

        while (v24);
      }
    }

    [*(id *)(a1 + 32) _updatePeopleDensity:v17];
    goto LABEL_49;
  }

  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_21:
      id v27 = v6;
      LogPrintF();
    }
  }

  else if (gLogCategory_RPPeopleDiscovery <= 90 {
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_21;
  }

  if (objc_msgSend(v6, "code", v27) == -71168)
  {
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18)
    {
      v19 = *(void (**)(void))(v18 + 16);
LABEL_33:
      v19();
    }
  }

  else
  {
    [*(id *)(a1 + 32) _scheduleRetry];
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      v19 = *(void (**)(void))(v20 + 16);
      goto LABEL_33;
    }
  }

- (BOOL)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5CE0];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v5 = objc_opt_class();
    id v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    [v3 setClasses:v6 forSelector:sel_xpcPeopleDiscoveryActivate_completion_ argumentIndex:0 ofReply:1];

    id v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.rapport.people" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v7;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6DFBE0];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v3);
    uint64_t v10 = MEMORY[0x1895F87A8];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke;
    v13[3] = &unk_18A031A30;
    v13[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v13);
    v12[0] = v10;
    v12[1] = 3221225472LL;
    v12[2] = __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke_2;
    v12[3] = &unk_18A031A30;
    v12[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPPeopleDiscovery <= 10
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return 1;
}

uint64_t __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  if (*(_BYTE *)(*(void *)(a1 + 32) + 24LL))
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return [*(id *)(a1 + 32) _invalidated];
  }

  else
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return [*(id *)(a1 + 32) _scheduleRetry];
  }

- (void)_invokeBlockActivateSafe:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __46__RPPeopleDiscovery__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_18A032390;
    v7[4] = v5;
    uint64_t v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }

  else
  {
    v4[2](v4);
  }

  objc_sync_exit(v5);
}

void __46__RPPeopleDiscovery__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 xpcPeopleDiscoveryUpdate:*(void *)(a1 + 32)];
}

- (void)_interrupted
{
  if (gLogCategory_RPPeopleDiscovery <= 50
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  -[RPPeopleDiscovery _lostAllPeople](self, "_lostAllPeople");
  if (self->_activateCalled) {
    -[RPPeopleDiscovery _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0LL, 1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__RPPeopleDiscovery_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__RPPeopleDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v3 = *(void **)(*(void *)(v2 + 32) + 32LL);
    if (v3)
    {
      id v4 = v3;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(v2 + 32);
      id v6 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = 0LL;
    }

    [*(id *)(*(void *)(v2 + 32) + 40) invalidate];
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
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      uint64_t v5 = retryTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_retryTimer;
      self->_retryTimer = 0LL;
    }

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id peopleDensityChangedHandler = self->_peopleDensityChangedHandler;
    self->_id peopleDensityChangedHandler = 0LL;

    id personFoundHandler = self->_personFoundHandler;
    self->_id personFoundHandler = 0LL;

    id personLostHandler = self->_personLostHandler;
    self->_id personLostHandler = 0LL;

    id personChangedHandler = self->_personChangedHandler;
    self->_id personChangedHandler = 0LL;

    id statusChangedHandler = self->_statusChangedHandler;
    self->_id statusChangedHandler = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)_scheduleRetry
{
  if (!self->_invalidateCalled && !self->_retryTimer)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v3;

    uint64_t v5 = self->_retryTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __35__RPPeopleDiscovery__scheduleRetry__block_invoke;
    handler[3] = &unk_18A031A30;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }

_BYTE *__35__RPPeopleDiscovery__scheduleRetry__block_invoke(uint64_t a1)
{
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32LL);
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;
  }

  result = *(_BYTE **)(a1 + 32);
  if (!result[24]) {
    return (_BYTE *)[result _activateWithCompletion:0 reactivate:1];
  }
  return result;
}

- (NSArray)discoveredPeople
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  discoveredPeople = v2->_discoveredPeople;
  if (discoveredPeople)
  {
    -[NSMutableDictionary allValues](discoveredPeople, "allValues");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)_lostAllPeople
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  id personLostHandler = self->_personLostHandler;
  id obj = self;
  objc_sync_enter(obj);
  discoveredPeople = obj->_discoveredPeople;
  if (personLostHandler)
  {
    -[NSMutableDictionary allValues](discoveredPeople, "allValues");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](obj->_discoveredPeople, "removeAllObjects");
    objc_sync_exit(obj);

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = (void (**)(id, void))self->_personLostHandler;
          if (v10) {
            v10[2](v10, *(void *)(*((void *)&v12 + 1) + 8 * i));
          }
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](discoveredPeople, "removeAllObjects");
    objc_sync_exit(obj);
  }

- (void)_updatePeopleDensity:(unint64_t)a3
{
  if (a3 >= 0x1E) {
    int v3 = 90;
  }
  else {
    int v3 = 50;
  }
  if (a3 >= 5) {
    int v4 = v3;
  }
  else {
    int v4 = 10;
  }
  if (a3) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  int peopleDensity = self->_peopleDensity;
  if (v5 != peopleDensity)
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    self->_int peopleDensity = v5;
    uint64_t v8 = (void (**)(void, void))MEMORY[0x1895A4770](self->_peopleDensityChangedHandler);
    if (v8)
    {
      id v10 = v8;
      v8[2](v8, v9);
      uint64_t v8 = (void (**)(void, void))v10;
    }
  }

- (void)xpcPeopleStatusChanged:(unsigned int)a3
{
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  self->_statusFlags = a3;
  int v5 = (void (**)(void, void, void, void))MEMORY[0x1895A4770](self->_statusChangedHandler);
  if (v5)
  {
    uint64_t v9 = v5;
    v5[2](v5, v6, v7, v8);
    int v5 = v9;
  }
}

- (void)xpcPersonFound:(id)a3
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  int v5 = v12;
  discoveredPeople = v4->_discoveredPeople;
  if (!discoveredPeople)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v8 = v4->_discoveredPeople;
    v4->_discoveredPeople = v7;

    discoveredPeople = v4->_discoveredPeople;
    int v5 = v12;
  }

  [v5 identifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", v12, v9);

  uint64_t v10 = -[NSMutableDictionary count](v4->_discoveredPeople, "count");
  objc_sync_exit(v4);

  id personFoundHandler = (void (**)(id, id))v4->_personFoundHandler;
  if (personFoundHandler) {
    personFoundHandler[2](personFoundHandler, v12);
  }
  -[RPPeopleDiscovery _updatePeopleDensity:](v4, "_updatePeopleDensity:", v10);
}

- (void)xpcPersonLost:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  discoveredPeople = v4->_discoveredPeople;
  [v9 identifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", 0LL, v6);

  uint64_t v7 = -[NSMutableDictionary count](v4->_discoveredPeople, "count");
  objc_sync_exit(v4);

  id personLostHandler = (void (**)(id, id))v4->_personLostHandler;
  if (personLostHandler) {
    personLostHandler[2](personLostHandler, v9);
  }
  -[RPPeopleDiscovery _updatePeopleDensity:](v4, "_updatePeopleDensity:", v7);
}

- (void)xpcPersonChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  discoveredPeople = v6->_discoveredPeople;
  [v10 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", v10, v8);

  objc_sync_exit(v6);
  id personChangedHandler = (void (**)(id, id, void))v6->_personChangedHandler;
  if (personChangedHandler) {
    personChangedHandler[2](personChangedHandler, v10, v4);
  }
}

- (void)addAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[RPPeopleDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __43__RPPeopleDiscovery_addAppleID_completion___block_invoke;
  v17[3] = &unk_18A031B10;
  id v10 = v7;
  id v18 = v10;
  v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v17);
  v14[0] = v9;
  v14[1] = 3221225472LL;
  v14[2] = __43__RPPeopleDiscovery_addAppleID_completion___block_invoke_2;
  v14[3] = &unk_18A032290;
  id v15 = v6;
  id v16 = v10;
  id v12 = v10;
  id v13 = v6;
  [v11 xpcPeopleAddAppleID:v13 completion:v14];
}

void __43__RPPeopleDiscovery_addAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_RPPeopleDiscovery <= 90)
  {
    if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void __43__RPPeopleDiscovery_addAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_RPPeopleDiscovery <= 90)
    {
      if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }

  else if (gLogCategory_RPPeopleDiscovery <= 40)
  {
    if (gLogCategory_RPPeopleDiscovery != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = 0LL;
    if (v5) {
      goto LABEL_7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

- (void)removeAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[RPPeopleDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke;
  v17[3] = &unk_18A031B10;
  id v10 = v7;
  id v18 = v10;
  v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v17);
  v14[0] = v9;
  v14[1] = 3221225472LL;
  v14[2] = __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke_2;
  v14[3] = &unk_18A032290;
  id v15 = v6;
  id v16 = v10;
  id v12 = v10;
  id v13 = v6;
  [v11 xpcPeopleRemoveAppleID:v13 completion:v14];
}

void __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_RPPeopleDiscovery <= 90)
  {
    if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_RPPeopleDiscovery <= 90)
    {
      if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }

  else if (gLogCategory_RPPeopleDiscovery <= 40)
  {
    if (gLogCategory_RPPeopleDiscovery != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = 0LL;
    if (v5) {
      goto LABEL_7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    id v3 = v7;
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

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_uint64_t changeFlags = a3;
}

- (unsigned)discoveryFlags
{
  return self->_discoveryFlags;
}

- (int)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(int)a3
{
  self->_int discoveryMode = a3;
}

- (int)peopleDensity
{
  return self->_peopleDensity;
}

- (id)peopleDensityChangedHandler
{
  return self->_peopleDensityChangedHandler;
}

- (void)setPeopleDensityChangedHandler:(id)a3
{
}

- (id)personFoundHandler
{
  return self->_personFoundHandler;
}

- (void)setPersonFoundHandler:(id)a3
{
}

- (id)personLostHandler
{
  return self->_personLostHandler;
}

- (void)setPersonLostHandler:(id)a3
{
}

- (id)personChangedHandler
{
  return self->_personChangedHandler;
}

- (void)setPersonChangedHandler:(id)a3
{
}

- (unsigned)scanRate
{
  return self->_scanRate;
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void).cxx_destruct
{
}

@end