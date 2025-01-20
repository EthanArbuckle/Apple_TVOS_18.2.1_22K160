@interface RPNearbyInvitationDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldReportDevice:(id)a3;
- (NSArray)discoveredDevices;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyInvitationDiscovery)init;
- (RPNearbyInvitationDiscovery)initWithCoder:(id)a3;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unint64_t)discoveryFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)nearbyInvitationChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)nearbyInvitationFoundDevice:(id)a3;
- (void)nearbyInvitationLostDevice:(id)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation RPNearbyInvitationDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationDiscovery;
  v2 = -[RPNearbyInvitationDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (RPNearbyInvitationDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationDiscovery;
  v5 = -[RPNearbyInvitationDiscovery init](&v10, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    id v7 = v4;

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags) {
    [a3 encodeInt64:discoveryFlags forKey:@"_disFl"];
  }
}

- (NSString)description
{
  unint64_t discoveryFlags = (unint64_t)self;
  NSAppendPrintF();
  id v3 = 0LL;
  id v4 = v3;
  if (self->_discoveryFlags)
  {
    objc_super v10 = v3;
    unint64_t discoveryFlags = self->_discoveryFlags;
    v9 = &unk_1873E72A8;
    NSAppendPrintF();
    id v5 = v10;

    id v4 = v5;
  }

  if (-[NSMutableDictionary count](self->_discoveredDevices, "count", discoveryFlags, v9))
  {
    -[NSMutableDictionary count](self->_discoveredDevices, "count");
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }

  return (NSString *)v4;
}

- (BOOL)shouldReportDevice:(id)a3
{
  return ([a3 statusFlags] & 0x10000AE000) == 0;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__RPNearbyInvitationDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __54__RPNearbyInvitationDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
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
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPNearbyInvitationDiscovery <= 30 {
         && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  -[RPNearbyInvitationDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v8 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_18A032340;
  v15[4] = self;
  BOOL v17 = v4;
  id v9 = v6;
  id v16 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472LL;
  v12[2] = __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_18A031CC8;
  BOOL v14 = v4;
  id v13 = v9;
  id v11 = v9;
  [v10 nearbyInvitationActivateDiscovery:self completion:v12];
}

void __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke( uint64_t a1,  void *a2)
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
    if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1 || (int v6 = _LogCategory_Initialize(), v4 = v10, v6))
      {
LABEL_9:
        LogPrintF();
        BOOL v4 = v10;
      }
    }
  }

  else if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
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

void __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
      {
        if (gLogCategory_RPNearbyInvitationDiscovery != -1 || (v5 = _LogCategory_Initialize(), id v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          id v3 = v9;
        }
      }
    }

    else if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
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
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      id v3 = 0LL;
      if (v6) {
        goto LABEL_15;
      }
    }
  }

  else if (gLogCategory_RPNearbyInvitationDiscovery <= 30)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
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
    v9[2] = __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472LL;
    v8[2] = __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_18A031A30;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5B60];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPNearbyInvitationDiscovery <= 10
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

uint64_t __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_RPNearbyInvitationDiscovery <= 50
    && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (self->_activateCalled) {
    -[RPNearbyInvitationDiscovery _activateWithCompletion:reactivate:]( self,  "_activateWithCompletion:reactivate:",  0LL,  1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__RPNearbyInvitationDiscovery_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__RPNearbyInvitationDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    [*(id *)(*(void *)(v2 + 32) + 32) invalidate];
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
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0LL;

    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0LL;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (NSArray)discoveredDevices
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  discoveredDevices = v2->_discoveredDevices;
  if (discoveredDevices)
  {
    -[NSMutableDictionary allValues](discoveredDevices, "allValues");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)nearbyInvitationFoundDevice:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [v10 identifier];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    discoveredDevices = v4->_discoveredDevices;
    if (!discoveredDevices)
    {
      int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      id v8 = v4->_discoveredDevices;
      v4->_discoveredDevices = v7;

      discoveredDevices = v4->_discoveredDevices;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v10, v5);

    objc_sync_exit(v4);
    id deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler) {
      deviceFoundHandler[2](deviceFoundHandler, v10);
    }
  }

  else
  {
    objc_sync_exit(v4);
  }
}

- (void)nearbyInvitationLostDevice:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [v7 identifier];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_discoveredDevices, "setObject:forKeyedSubscript:", 0LL, v5);

    objc_sync_exit(v4);
    id deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
    if (deviceLostHandler) {
      deviceLostHandler[2](deviceLostHandler, v7);
    }
  }

  else
  {
    objc_sync_exit(v4);
  }
}

- (void)nearbyInvitationChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  [v9 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_discoveredDevices, "setObject:forKeyedSubscript:", v9, v7);

    objc_sync_exit(v6);
    id deviceChangedHandler = (void (**)(id, id, void))v6->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v9, v4);
    }
  }

  else
  {
    objc_sync_exit(v6);
  }
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_unint64_t discoveryFlags = a3;
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

- (void).cxx_destruct
{
}

@end