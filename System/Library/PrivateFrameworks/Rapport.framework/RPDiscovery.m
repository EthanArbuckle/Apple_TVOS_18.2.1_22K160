@interface RPDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)_ensureXPCStarted;
- (BOOL)targetUserSession;
- (NSArray)discoveredEndpoints;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPDiscovery)init;
- (RPDiscovery)initWithCoder:(id)a3;
- (id)changedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)foundHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)lostHandler;
- (unint64_t)controlFlags;
- (unsigned)changeFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_lostAllEndpoints;
- (void)_scheduleRetry;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setChangedHandler:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFoundHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLostHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)xpcDiscoveryChangedEndpoint:(id)a3;
- (void)xpcDiscoveryFoundEndpoint:(id)a3;
- (void)xpcDiscoveryLostEndpoint:(id)a3;
@end

@implementation RPDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPDiscovery;
  v2 = -[RPDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPDiscovery;
    v4 = v3;
  }

  return v3;
}

- (RPDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RPDiscovery;
  v5 = -[RPDiscovery init](&v14, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPDiscovery;
    id v7 = v4;

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    label = v6->_label;
    if (label)
    {
      v10 = label;
      -[NSString UTF8String](v10, "UTF8String");
      LogCategoryReplaceF();
    }

    id v11 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v6;
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
    [v4 encodeInt64:changeFlags forKey:@"chgF"];
    id v4 = v9;
  }

  unint64_t controlFlags = self->_controlFlags;
  if (controlFlags)
  {
    [v9 encodeInt64:controlFlags forKey:@"ctlF"];
    id v4 = v9;
  }

  label = self->_label;
  if (label)
  {
    [v9 encodeObject:label forKey:@"label"];
    id v4 = v9;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v9 encodeObject:serviceType forKey:@"st"];
    id v4 = v9;
  }
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPDiscovery;
  -[RPDiscovery dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPDiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v20 = 0LL;
  v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t changeFlags = self->_changeFlags;
  unint64_t controlFlags = self->_controlFlags;
  serviceType = self->_serviceType;
  NSAppendPrintF();
  objc_storeStrong(&v25, 0LL);
  if (a3 <= 30)
  {
    v5 = v21;
    id obj = v21[5];
    uint64_t v12 = -[NSMutableDictionary count]( self->_endpointMap,  "count",  serviceType,  controlFlags,  &unk_1873E6938,  changeFlags,  &unk_1873E6BBD);
    NSAppendPrintF();
    objc_storeStrong(v5 + 5, obj);
    if (a3 <= 20)
    {
      objc_super v6 = v21;
      id v17 = v21[5];
      NSAppendPrintF();
      objc_storeStrong(v6 + 5, v17);
      if (a3 >= 11) {
        int v7 = 50;
      }
      else {
        int v7 = 30;
      }
      endpointMap = self->_endpointMap;
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __36__RPDiscovery_descriptionWithLevel___block_invoke;
      v15[3] = &unk_18A0328C0;
      v15[4] = &v20;
      int v16 = v7;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( endpointMap,  "enumerateKeysAndObjectsUsingBlock:",  v15,  v12);
    }
  }

  id v9 = v21[5];
  _Block_object_dispose(&v20, 8);

  return v9;
}

void __36__RPDiscovery_descriptionWithLevel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v1 + 40);
  CUDescriptionWithLevel();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  BOOL activateCalled = v5->_activateCalled;
  v5->_BOOL activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__RPDiscovery_activateWithCompletion___block_invoke;
  block[3] = &unk_18A031CA0;
  block[4] = v5;
  id v10 = v4;
  BOOL v11 = activateCalled;
  id v8 = v4;
  dispatch_async(dispatchQueue, block);

  objc_sync_exit(v5);
}

void __38__RPDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    RPErrorF();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 40LL);
    id v9 = v3;
    if (v4 <= 115)
    {
      if (v4 != -1 || (int v6 = _LogCategory_Initialize(), v3 = v9, v6))
      {
        LogPrintF();
        v3 = v9;
      }
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
      v3 = v9;
    }
  }

  else if (*(_BYTE *)(a1 + 48))
  {
    int v5 = **(_DWORD **)(v2 + 40);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0LL);
    }
  }

  else
  {
    [(id)v2 _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
  }

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (self->_targetUserSession) {
        uint64_t v8 = "(TargetUserSession)";
      }
      else {
        uint64_t v8 = "";
      }
      objc_super v14 = v8;
LABEL_14:
      LogPrintF();
    }
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if (self->_targetUserSession) {
      id v9 = "(TargetUserSession)";
    }
    else {
      id v9 = "";
    }
    objc_super v14 = v9;
    goto LABEL_14;
  }

  if (-[RPDiscovery _ensureXPCStarted](self, "_ensureXPCStarted", v14))
  {
    xpcCnx = self->_xpcCnx;
    uint64_t v11 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke;
    v18[3] = &unk_18A032340;
    BOOL v20 = v4;
    v18[4] = self;
    id v12 = v6;
    id v19 = v12;
    v13 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v18);
    v15[0] = v11;
    v15[1] = 3221225472LL;
    v15[2] = __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke_2;
    v15[3] = &unk_18A032368;
    BOOL v17 = v4;
    v15[4] = self;
    id v16 = v12;
    [v13 xpcDiscoveryActivate:self completion:v15];
  }

  else
  {
    -[RPDiscovery _scheduleRetry](self, "_scheduleRetry");
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

void __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 40LL);
  if (*(_BYTE *)(a1 + 48))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = v6;
LABEL_8:
      LogPrintF();
    }
  }

  else if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    goto LABEL_8;
  }

  objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry", v5);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);
  }
}

void __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  v30 = v5;
  if (!v6)
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_super v14 = *(void **)(*(void *)(a1 + 32) + 16LL);
          if (!v14)
          {
            id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
            uint64_t v16 = *(void *)(a1 + 32);
            BOOL v17 = *(void **)(v16 + 16);
            *(void *)(v16 + 16) = v15;

            objc_super v14 = *(void **)(*(void *)(a1 + 32) + 16LL);
          }

          [v13 identifier];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 setObject:v13 forKeyedSubscript:v18];
        }

        uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v10);
    }

    objc_sync_exit(v8);
    int v19 = **(_DWORD **)(*(void *)(a1 + 32) + 40LL);
    if (*(_BYTE *)(a1 + 48))
    {
    }

    else if (v19 > 30 || v19 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_38;
    }

    [v9 count];
    LogPrintF();
LABEL_38:
    uint64_t v23 = *(void *)(a1 + 40);
    if (v23) {
      (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0LL);
    }
    v24 = (void (**)(void, void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 104LL));
    if (v24)
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v25 = v9;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v32;
        do
        {
          for (uint64_t j = 0LL; j != v26; ++j)
          {
            if (*(void *)v32 != v27) {
              objc_enumerationMutation(v25);
            }
            v24[2](v24, *(void *)(*((void *)&v31 + 1) + 8 * j));
          }

          uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }

        while (v26);
      }
    }

    id v6 = 0LL;
    goto LABEL_50;
  }

  int v7 = **(_DWORD **)(*(void *)(a1 + 32) + 40LL);
  if (*(_BYTE *)(a1 + 48))
  {
    if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
    {
      id v29 = v6;
LABEL_22:
      LogPrintF();
    }
  }

  else if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    id v29 = v6;
    goto LABEL_22;
  }

  if (objc_msgSend(v6, "code", v29) == -71168)
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      v21 = *(void (**)(void))(v20 + 16);
LABEL_34:
      v21();
    }
  }

  else
  {
    [*(id *)(a1 + 32) _scheduleRetry];
    uint64_t v22 = *(void *)(a1 + 40);
    if (v22)
    {
      v21 = *(void (**)(void))(v22 + 16);
      goto LABEL_34;
    }
  }

- (BOOL)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5C20];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v5 = objc_opt_class();
    id v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    [v3 setClasses:v6 forSelector:sel_xpcDiscoveryActivate_completion_ argumentIndex:0 ofReply:1];

    int v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.CompanionLink" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v7;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D7EE8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v3);
    uint64_t v10 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __32__RPDiscovery__ensureXPCStarted__block_invoke;
    v14[3] = &unk_18A031A30;
    v14[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v14);
    v13[0] = v10;
    v13[1] = 3221225472LL;
    v13[2] = __32__RPDiscovery__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_18A031A30;
    v13[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    int var0 = self->_ucat->var0;
  }

  return 1;
}

uint64_t __32__RPDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __32__RPDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 40);
  if (*(_BYTE *)(v4 + 24))
  {
    if (v5 <= 30)
    {
      if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(void *)(a1 + 32), v6))
      {
        LogPrintF();
        uint64_t v4 = *(void *)(a1 + 32);
      }
    }

    return [(id)v4 _invalidated];
  }

  else
  {
    if (v5 <= 90)
    {
      if (v5 != -1 || (v8 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 32), v8))
      {
        LogPrintF();
        uint64_t v4 = *(void *)(a1 + 32);
      }
    }

    return [(id)v4 _scheduleRetry];
  }

- (void)_interrupted
{
  int var0 = self->_ucat->var0;
  -[RPDiscovery _lostAllEndpoints](self, "_lostAllEndpoints");
  if (self->_activateCalled) {
    -[RPDiscovery _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0LL, 1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__RPDiscovery_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__RPDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    uint64_t v3 = *(void *)(result + 32);
    int v4 = **(_DWORD **)(v3 + 40);
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(v2 + 32);
      }
    }

    int v6 = *(void **)(v3 + 32);
    if (v6)
    {
      int v7 = v6;
      dispatch_source_cancel(v7);
      uint64_t v8 = *(void *)(v2 + 32);
      id v9 = *(void **)(v8 + 32);
      *(void *)(v8 + 32) = 0LL;
    }

    [*(id *)(*(void *)(v2 + 32) + 48) invalidate];
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
      int v5 = retryTimer;
      dispatch_source_cancel(v5);
      int v6 = self->_retryTimer;
      self->_retryTimer = 0LL;
    }

    id foundHandler = self->_foundHandler;
    self->_id foundHandler = 0LL;

    id lostHandler = self->_lostHandler;
    self->_id lostHandler = 0LL;

    id changedHandler = self->_changedHandler;
    self->_id changedHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v11 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
  }

- (void)_scheduleRetry
{
  if (!self->_invalidateCalled && !self->_retryTimer)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v3;

    int v5 = self->_retryTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __29__RPDiscovery__scheduleRetry__block_invoke;
    handler[3] = &unk_18A031A30;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }

_BYTE *__29__RPDiscovery__scheduleRetry__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 40);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  int v5 = *(void **)(v2 + 32);
  if (v5)
  {
    int v6 = v5;
    dispatch_source_cancel(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0LL;
  }

  result = *(_BYTE **)(a1 + 32);
  if (!result[24]) {
    return (_BYTE *)[result _activateWithCompletion:0 reactivate:1];
  }
  return result;
}

- (NSArray)discoveredEndpoints
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  endpointMap = v2->_endpointMap;
  if (endpointMap)
  {
    -[NSMutableDictionary allValues](endpointMap, "allValues");
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v4 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)_lostAllEndpoints
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int var0 = self->_ucat->var0;
  int v4 = (void (**)(void, void))MEMORY[0x1895A4770](self->_lostHandler);
  int v5 = self;
  objc_sync_enter(v5);
  endpointMap = v5->_endpointMap;
  if (v4)
  {
    -[NSMutableDictionary allValues](endpointMap, "allValues");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](v5->_endpointMap, "removeAllObjects");
    objc_sync_exit(v5);

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }

        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](endpointMap, "removeAllObjects");
    objc_sync_exit(v5);
  }
}

- (void)xpcDiscoveryFoundEndpoint:(id)a3
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  int v5 = v12;
  endpointMap = v4->_endpointMap;
  if (!endpointMap)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v8 = v4->_endpointMap;
    v4->_endpointMap = v7;

    endpointMap = v4->_endpointMap;
    int v5 = v12;
  }

  [v5 identifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](endpointMap, "setObject:forKeyedSubscript:", v12, v9);

  objc_sync_exit(v4);
  uint64_t v10 = MEMORY[0x1895A4770](v4->_foundHandler);
  id v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v12);
  }
}

- (void)xpcDiscoveryLostEndpoint:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  endpointMap = v4->_endpointMap;
  [v9 identifier];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](endpointMap, "setObject:forKeyedSubscript:", 0LL, v6);

  objc_sync_exit(v4);
  uint64_t v7 = MEMORY[0x1895A4770](v4->_lostHandler);
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }
}

- (void)xpcDiscoveryChangedEndpoint:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  endpointMap = v4->_endpointMap;
  [v9 identifier];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](endpointMap, "setObject:forKeyedSubscript:", v9, v6);

  objc_sync_exit(v4);
  uint64_t v7 = MEMORY[0x1895A4770](v4->_changedHandler);
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
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

- (NSString)label
{
  return self->_label;
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

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_unint64_t controlFlags = a3;
}

- (id)foundHandler
{
  return self->_foundHandler;
}

- (void)setFoundHandler:(id)a3
{
}

- (id)lostHandler
{
  return self->_lostHandler;
}

- (void)setLostHandler:(id)a3
{
}

- (id)changedHandler
{
  return self->_changedHandler;
}

- (void)setChangedHandler:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end