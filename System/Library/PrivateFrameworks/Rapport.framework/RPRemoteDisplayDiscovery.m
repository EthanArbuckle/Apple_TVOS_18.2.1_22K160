@interface RPRemoteDisplayDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)_checkRSSIThresholdForDevice:(id)a3;
- (BOOL)shouldReportDevice:(id)a3;
- (BOOL)triggerEnhancedDiscovery;
- (NSArray)discoveredDevices;
- (NSArray)discoveredPeople;
- (NSString)peerDeviceIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPRemoteDisplayDevice)dedicatedDevice;
- (RPRemoteDisplayDiscovery)init;
- (RPRemoteDisplayDiscovery)initWithCoder:(id)a3;
- (RPRemoteDisplayPerson)personSelected;
- (id)dedicatedDeviceChangedHandler;
- (id)description;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)deviceSelectedHandler;
- (id)discoverySessionStateChangedHandler;
- (id)errorFlagsChangedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)personChangedHandler;
- (id)personDeclinedHandler;
- (id)personFoundHandler;
- (id)personLostHandler;
- (int64_t)rssiThreshold;
- (unint64_t)controlFlags;
- (unint64_t)discoveryFlags;
- (unint64_t)errorFlags;
- (unsigned)currentState;
- (unsigned)discoverySessionStartReason;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_lostAllPeople;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enterDiscoverySessionWithDevice:(id)a3 reason:(id)a4;
- (void)exitDiscoverySessionWithReason:(id)a3;
- (void)invalidate;
- (void)personCanceled:(id)a3;
- (void)remoteDisplayChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)remoteDisplayDedicatedDeviceChanged:(id)a3;
- (void)remoteDisplayDeviceSelected:(id)a3;
- (void)remoteDisplayFoundDevice:(id)a3;
- (void)remoteDisplayLostDevice:(id)a3;
- (void)remoteDisplayNotifyDiscoverySessionState:(unsigned __int8)a3 forDevice:(id)a4 startReason:(unsigned __int8)a5;
- (void)remoteDisplayPersonDeclined;
- (void)remoteDisplayUpdateErrorFlags:(unint64_t)a3;
- (void)requestDedicatedDeviceConfirmationWithCompletion:(id)a3;
- (void)saveDedicatedDevice:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDedicatedDeviceChangedHandler:(id)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDeviceSelectedHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDiscoverySessionStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorFlags:(unint64_t)a3;
- (void)setErrorFlagsChangedHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPersonChangedHandler:(id)a3;
- (void)setPersonDeclinedHandler:(id)a3;
- (void)setPersonFoundHandler:(id)a3;
- (void)setPersonLostHandler:(id)a3;
- (void)setPersonSelected:(id)a3;
- (void)setPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4;
- (void)setRssiThreshold:(int64_t)a3;
- (void)setTriggerEnhancedDiscovery:(BOOL)a3;
@end

@implementation RPRemoteDisplayDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayDiscovery)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPRemoteDisplayDiscovery;
  v2 = -[RPRemoteDisplayDiscovery init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_controlFlags = 6LL;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    int DeviceClass = GestaltGetDeviceClass();
    uint64_t v5 = -60LL;
    if (DeviceClass == 4) {
      uint64_t v5 = -75LL;
    }
    v3->_rssiThreshold = v5;
    v6 = v3;
  }

  return v3;
}

- (RPRemoteDisplayDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPRemoteDisplayDiscovery;
  uint64_t v5 = -[RPRemoteDisplayDiscovery init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    id v7 = v4;

    id v8 = v7;
    id v9 = v8;

    id v10 = v9;
    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t controlFlags = self->_controlFlags;
  id v8 = v4;
  if (controlFlags)
  {
    [v4 encodeInt64:controlFlags forKey:@"cFl"];
    id v4 = v8;
  }

  unint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags)
  {
    [v8 encodeInt64:discoveryFlags forKey:@"dFl"];
    id v4 = v8;
  }

  if (self->_triggerEnhancedDiscovery)
  {
    [v8 encodeBool:1 forKey:@"eDis"];
    id v4 = v8;
  }

  int64_t rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold)
  {
    [v8 encodeInteger:rssiThreshold forKey:@"rssiTh"];
    id v4 = v8;
  }
}

- (id)description
{
  unint64_t discoveryFlags = (unint64_t)self;
  NSAppendPrintF();
  id v3 = 0LL;
  id v4 = v3;
  if (self->_discoveryFlags)
  {
    v14 = v3;
    unint64_t discoveryFlags = self->_discoveryFlags;
    objc_super v13 = &unk_1873E7A35;
    NSAppendPrintF();
    id v5 = v14;

    id v4 = v5;
  }

  if (self->_controlFlags)
  {
    unint64_t discoveryFlags = self->_controlFlags;
    objc_super v13 = &unk_1873E7A54;
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }

  if (-[NSMutableDictionary count](self->_discoveredDevices, "count", discoveryFlags, v13))
  {
    uint64_t v12 = -[NSMutableDictionary count](self->_discoveredDevices, "count");
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }

  if (-[NSMutableDictionary count](self->_discoveredPeople, "count", v12))
  {
    -[NSMutableDictionary count](self->_discoveredPeople, "count");
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }

  if (self->_rssiThreshold)
  {
    NSAppendPrintF();
    id v9 = v4;

    id v4 = v9;
  }

  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __51__RPRemoteDisplayDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __51__RPRemoteDisplayDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  int DeviceClass = GestaltGetDeviceClass();
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 64)) {
    BOOL v4 = DeviceClass == 100;
  }
  else {
    BOOL v4 = 0;
  }
  char v5 = v4;
  *(_BYTE *)(v3 + 50) = v5;
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPRemoteDisplayDiscovery <= 30 {
         && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  -[RPRemoteDisplayDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  uint64_t v7 = MEMORY[0x1895F87A8];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_18A031CC8;
  BOOL v17 = v4;
  id v9 = v6;
  id v16 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_18A033BD8;
  BOOL v14 = v4;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 remoteDisplayActivateDiscovery:self completion:v12];
}

void __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }

  else if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
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

void __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(a1 + 32) + 112LL) = a2;
  id v13 = v5;
  if (a2 && *(_BYTE *)(a1 + 48))
  {
    uint64_t v6 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 120LL), v5);
    id v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

    id v5 = v13;
  }

  if (v5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
      {
        if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (v9 = _LogCategory_Initialize(), id v5 = v13, v9))
        {
LABEL_20:
          LogPrintF();
          id v5 = v13;
        }
      }
    }

    else if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
        goto LABEL_20;
      }
      int v11 = _LogCategory_Initialize();
      id v5 = v13;
      if (v11) {
        goto LABEL_20;
      }
    }
  }

  else if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
        goto LABEL_20;
      }
      int v10 = _LogCategory_Initialize();
      id v5 = v13;
      if (v10) {
        goto LABEL_20;
      }
    }
  }

  else if (gLogCategory_RPRemoteDisplayDiscovery <= 30)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
      goto LABEL_20;
    }
    int v12 = _LogCategory_Initialize();
    id v5 = v13;
    if (v12) {
      goto LABEL_20;
    }
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v13);
    id v5 = v13;
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
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472LL;
    v8[2] = __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_18A031A30;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5DA0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPRemoteDisplayDiscovery <= 10
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

uint64_t __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_RPRemoteDisplayDiscovery <= 50
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  -[RPRemoteDisplayDiscovery _lostAllDevices](self, "_lostAllDevices");
  -[RPRemoteDisplayDiscovery _lostAllPeople](self, "_lostAllPeople");
  if (self->_activateCalled) {
    -[RPRemoteDisplayDiscovery _activateWithCompletion:reactivate:]( self,  "_activateWithCompletion:reactivate:",  0LL,  1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__RPRemoteDisplayDiscovery_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__RPRemoteDisplayDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 32) = 1;
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
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
    id dedicatedDeviceChangedHandler = self->_dedicatedDeviceChangedHandler;
    self->_id dedicatedDeviceChangedHandler = 0LL;

    dedicatedDevice = self->_dedicatedDevice;
    self->_dedicatedDevice = 0LL;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0LL;

    id discoverySessionStateChangedHandler = self->_discoverySessionStateChangedHandler;
    self->_id discoverySessionStateChangedHandler = 0LL;

    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0LL;

    discoveredPeople = self->_discoveredPeople;
    self->_discoveredPeople = 0LL;

    id errorFlagsChangedHandler = self->_errorFlagsChangedHandler;
    self->_id errorFlagsChangedHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v14 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id personDeclinedHandler = self->_personDeclinedHandler;
    self->_id personDeclinedHandler = 0LL;

    id personFoundHandler = self->_personFoundHandler;
    self->_id personFoundHandler = 0LL;

    id personLostHandler = self->_personLostHandler;
    self->_id personLostHandler = 0LL;

    id personChangedHandler = self->_personChangedHandler;
    self->_id personChangedHandler = 0LL;

    personSelected = self->_personSelected;
    self->_personSelected = 0LL;

    peerDeviceIdentifier = self->_peerDeviceIdentifier;
    self->_peerDeviceIdentifier = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)personCanceled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[RPRemoteDisplayDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __43__RPRemoteDisplayDiscovery_personCanceled___block_invoke;
    v8[3] = &unk_18A031AC0;
    id v6 = v4;
    id v9 = v6;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 remoteDisplayPersonCanceled:v6];
  }
}

void __43__RPRemoteDisplayDiscovery_personCanceled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    id v5 = v2;
    if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

- (BOOL)_checkRSSIThresholdForDevice:(id)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 bleDevice];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v6 = [v5 rssi];

  return !v6 || v6 >= self->_rssiThreshold;
}

- (NSArray)discoveredDevices
{
  id v2 = self;
  objc_sync_enter(v2);
  discoveredDevices = v2->_discoveredDevices;
  if (discoveredDevices)
  {
    -[NSMutableDictionary allValues](discoveredDevices, "allValues");
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v4 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (NSArray)discoveredPeople
{
  id v2 = self;
  objc_sync_enter(v2);
  discoveredPeople = v2->_discoveredPeople;
  if (discoveredPeople)
  {
    -[NSMutableDictionary allValues](discoveredPeople, "allValues");
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v4 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setPersonSelected:(id)a3
{
}

- (void)setPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_personSelected, a3);
  objc_sync_exit(v8);

  if (v7)
  {
    -[RPRemoteDisplayDiscovery _ensureXPCStarted](v8, "_ensureXPCStarted");
    xpcCnx = v8->_xpcCnx;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    id v14 = __66__RPRemoteDisplayDiscovery_setPersonSelected_forDedicatedPairing___block_invoke;
    v15 = &unk_18A031A58;
    id v10 = v7;
    id v16 = v10;
    BOOL v17 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", &v12);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteDisplayPersonSelected:forDedicatedPairing:", v10, v4, v12, v13, v14, v15);
  }
}

void __66__RPRemoteDisplayDiscovery_setPersonSelected_forDedicatedPairing___block_invoke( uint64_t a1,  void *a2)
{
  id v6 = a2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  id v3 = *(id *)(a1 + 40);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 176);
  *(void *)(v4 + 176) = 0LL;

  objc_sync_exit(v3);
}

- (void)remoteDisplayFoundDevice:(id)a3
{
  id v20 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  discoveredDevices = v4->_discoveredDevices;
  if (!discoveredDevices)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v7 = v4->_discoveredDevices;
    v4->_discoveredDevices = v6;

    discoveredDevices = v4->_discoveredDevices;
  }

  [v20 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v20, v8);

  [v20 accountAltDSID];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    goto LABEL_14;
  }
  -[NSMutableDictionary valueForKey:](v4->_discoveredPeople, "valueForKey:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v10)
  {
    [v10 addDevice:v20];
    char v12 = 0;
    goto LABEL_15;
  }

  id v11 = -[RPRemoteDisplayPerson initPersonWithDevice:]( objc_alloc(&OBJC_CLASS___RPRemoteDisplayPerson),  "initPersonWithDevice:",  v20);
  if (!v11)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

- (void)remoteDisplayLostDevice:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  discoveredDevices = v4->_discoveredDevices;
  [v17 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", 0LL, v6);

  [v17 accountAltDSID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary valueForKey:](v4->_discoveredPeople, "valueForKey:", v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v8
      && ([v8 removeDevice:v17],
          [v9 discoveredDevices],
          id v10 = (void *)objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 count],
          v10,
          !v11))
    {
      -[NSMutableDictionary removeObjectForKey:](v4->_discoveredPeople, "removeObjectForKey:", v7);
      char v12 = 1;
    }

    else
    {
      char v12 = 0;
    }
  }

  else
  {
    char v12 = 0;
    id v9 = 0LL;
  }

  objc_sync_exit(v4);
  if (v9)
  {
    if ((v12 & 1) != 0) {
      id personLostHandler = v4->_personLostHandler;
    }
    else {
      id personLostHandler = v4->_personChangedHandler;
    }
    uint64_t v14 = MEMORY[0x1895A4770](personLostHandler);
    v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v9);
    }
  }

  id deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
  if (deviceLostHandler) {
    deviceLostHandler[2](deviceLostHandler, v17);
  }
}

- (void)remoteDisplayChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = self;
  objc_sync_enter(v6);
  discoveredDevices = v6->_discoveredDevices;
  [v17 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](discoveredDevices, "objectForKeyedSubscript:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v10 = v6->_discoveredDevices;
    [v17 identifier];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, v11);

    [v17 accountAltDSID];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSMutableDictionary valueForKey:](v6->_discoveredPeople, "valueForKey:", v12);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = v13;
      if (v13)
      {
        [v13 removeDevice:v17];
        [v14 addDevice:v17];
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    objc_sync_exit(v6);
    if (v14)
    {
      id personChangedHandler = (void (**)(id, void *))v6->_personChangedHandler;
      if (personChangedHandler) {
        personChangedHandler[2](personChangedHandler, v14);
      }
    }

    id deviceChangedHandler = (void (**)(id, id, void))v6->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v17, v4);
    }
  }

  else
  {
    -[RPRemoteDisplayDiscovery remoteDisplayFoundDevice:](v6, "remoteDisplayFoundDevice:", v17);
    objc_sync_exit(v6);

    uint64_t v14 = 0LL;
  }
}

- (void)remoteDisplayUpdateErrorFlags:(unint64_t)a3
{
  if (self->_errorFlags != a3)
  {
    self->_errorFlags = a3;
    id v5 = (void (**)(void))MEMORY[0x1895A4770](self->_errorFlagsChangedHandler);
    if (v5)
    {
      id v6 = v5;
      v5[2]();
      id v5 = v6;
    }
  }

- (void)remoteDisplayDeviceSelected:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    uint64_t v4 = -[RPRemoteDisplayPerson initPersonWithDevice:]( objc_alloc(&OBJC_CLASS___RPRemoteDisplayPerson),  "initPersonWithDevice:",  v8);
    personSelected = self->_personSelected;
    self->_personSelected = v4;
  }

  else
  {
    personSelected = self->_personSelected;
    self->_personSelected = 0LL;
  }

  uint64_t v6 = MEMORY[0x1895A4770](self->_deviceSelectedHandler);
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  }
}

- (void)remoteDisplayNotifyDiscoverySessionState:(unsigned __int8)a3 forDevice:(id)a4 startReason:(unsigned __int8)a5
{
  uint64_t v7 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_currentState = v7;
  objc_storeStrong((id *)&self->_peerDeviceIdentifier, a4);
  self->_discoverySessionStartReason = a5;
  id discoverySessionStateChangedHandler = (void (**)(id, void, id))self->_discoverySessionStateChangedHandler;
  if (discoverySessionStateChangedHandler) {
    discoverySessionStateChangedHandler[2](discoverySessionStateChangedHandler, v7, v10);
  }
}

- (void)remoteDisplayPersonDeclined
{
  id v3 = (void (**)(void))MEMORY[0x1895A4770](self->_personDeclinedHandler);
  if (v3)
  {
    uint64_t v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (void)_lostAllDevices
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (gLogCategory_RPRemoteDisplayDiscovery <= 30
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  id deviceLostHandler = self->_deviceLostHandler;
  obj = self;
  objc_sync_enter(obj);
  discoveredDevices = obj->_discoveredDevices;
  if (deviceLostHandler)
  {
    -[NSMutableDictionary allValues](discoveredDevices, "allValues");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](obj->_discoveredDevices, "removeAllObjects");
    uint64_t v6 = obj->_discoveredDevices;
    obj->_discoveredDevices = 0LL;

    objc_sync_exit(obj);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = (void (**)(id, void))self->_deviceLostHandler;
          if (v11) {
            v11[2](v11, *(void *)(*((void *)&v14 + 1) + 8 * i));
          }
        }

        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](discoveredDevices, "removeAllObjects");
    char v12 = obj->_discoveredDevices;
    obj->_discoveredDevices = 0LL;

    objc_sync_exit(obj);
  }

- (void)_lostAllPeople
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (gLogCategory_RPRemoteDisplayDiscovery <= 30
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  -[RPRemoteDisplayDiscovery discoveredPeople](self, "discoveredPeople");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeAllObjects](v4->_discoveredPeople, "removeAllObjects");
  discoveredPeople = v4->_discoveredPeople;
  v4->_discoveredPeople = 0LL;

  personSelected = v4->_personSelected;
  v4->_personSelected = 0LL;

  objc_sync_exit(v4);
  if (v4->_personLostHandler)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          (*((void (**)(id))v4->_personLostHandler + 2))(v4->_personLostHandler);
        }

        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }
}

- (BOOL)shouldReportDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = (([v4 statusFlags] & 0x80000) != 0
     || ([v4 statusFlags] & 0x2000000000) != 0 && (self->_discoveryFlags & 1) != 0
     || ([v4 statusFlags] & 0x1000000000) != 0 && (self->_discoveryFlags & 2) != 0)
    && -[RPRemoteDisplayDiscovery _checkRSSIThresholdForDevice:](self, "_checkRSSIThresholdForDevice:", v4);

  return v5;
}

- (void)enterDiscoverySessionWithDevice:(id)a3 reason:(id)a4
{
  xpcCnx = self->_xpcCnx;
  id v6 = a4;
  id v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcCnx,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_12);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 remoteDisplayChangeDiscoverySessionStateForDevice:v7 reason:v6];
}

void __67__RPRemoteDisplayDiscovery_enterDiscoverySessionWithDevice_reason___block_invoke( uint64_t a1,  void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((BOOL v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();
  }

  else
  {
  }

- (void)exitDiscoverySessionWithReason:(id)a3
{
  xpcCnx = self->_xpcCnx;
  id v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcCnx,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_117);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 remoteDisplayChangeDiscoverySessionStateForDevice:0 reason:v4];
}

void __59__RPRemoteDisplayDiscovery_exitDiscoverySessionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((id v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();
  }

  else
  {
  }

- (void)saveDedicatedDevice:(id)a3
{
  xpcCnx = self->_xpcCnx;
  id v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcCnx,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_119);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 remoteDisplayChangeDedicatedDevice:v4];
}

void __48__RPRemoteDisplayDiscovery_saveDedicatedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((id v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();
  }

  else
  {
  }

- (void)remoteDisplayDedicatedDeviceChanged:(id)a3
{
  id v8 = (RPRemoteDisplayDevice *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_dedicatedDevice == v8)
  {
    objc_storeStrong((id *)&v5->_dedicatedDevice, a3);
    objc_sync_exit(v5);
  }

  else
  {
    BOOL v6 = -[RPRemoteDisplayDevice isEqualToDevice:](v8, "isEqualToDevice:");
    objc_storeStrong((id *)&v5->_dedicatedDevice, a3);
    objc_sync_exit(v5);

    if (!v6)
    {
      id dedicatedDeviceChangedHandler = (void (**)(id, RPRemoteDisplayDevice *))v5->_dedicatedDeviceChangedHandler;
      if (dedicatedDeviceChangedHandler) {
        dedicatedDeviceChangedHandler[2](dedicatedDeviceChangedHandler, v8);
      }
    }
  }
}

- (void)requestDedicatedDeviceConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  -[RPRemoteDisplayDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_xpcCnx,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_121);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke_2;
  v7[3] = &unk_18A031B10;
  id v8 = v4;
  id v6 = v4;
  [v5 remoteDisplayDedicatedDeviceConfirmationWithCompletion:v7];
}

void __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((id v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();
  }

  else
  {
  }

void __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_unint64_t controlFlags = a3;
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

- (id)deviceSelectedHandler
{
  return self->_deviceSelectedHandler;
}

- (void)setDeviceSelectedHandler:(id)a3
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

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

- (void)setErrorFlags:(unint64_t)a3
{
  self->_errorFlags = a3;
}

- (id)errorFlagsChangedHandler
{
  return self->_errorFlagsChangedHandler;
}

- (void)setErrorFlagsChangedHandler:(id)a3
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

- (id)personChangedHandler
{
  return self->_personChangedHandler;
}

- (void)setPersonChangedHandler:(id)a3
{
}

- (id)personDeclinedHandler
{
  return self->_personDeclinedHandler;
}

- (void)setPersonDeclinedHandler:(id)a3
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

- (RPRemoteDisplayPerson)personSelected
{
  return self->_personSelected;
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_int64_t rssiThreshold = a3;
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (NSString)peerDeviceIdentifier
{
  return self->_peerDeviceIdentifier;
}

- (RPRemoteDisplayDevice)dedicatedDevice
{
  return self->_dedicatedDevice;
}

- (id)dedicatedDeviceChangedHandler
{
  return self->_dedicatedDeviceChangedHandler;
}

- (void)setDedicatedDeviceChangedHandler:(id)a3
{
}

- (unsigned)discoverySessionStartReason
{
  return self->_discoverySessionStartReason;
}

- (id)discoverySessionStateChangedHandler
{
  return self->_discoverySessionStateChangedHandler;
}

- (void)setDiscoverySessionStateChangedHandler:(id)a3
{
}

- (BOOL)triggerEnhancedDiscovery
{
  return self->_triggerEnhancedDiscovery;
}

- (void)setTriggerEnhancedDiscovery:(BOOL)a3
{
  self->_triggerEnhancedDiscovery = a3;
}

- (void).cxx_destruct
{
}

@end