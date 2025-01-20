@interface CBServer
- (CBServer)init;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)acceptHandler;
- (id)bluetoothStateChangedHandler;
- (id)configChangedHandler;
- (id)invalidationHandler;
- (int64_t)bluetoothState;
- (unsigned)bleListenPSM;
- (unsigned)bleListeningPSM;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleConnectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)_startIfNeeded;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)pairingGenerateOOBDataForPeer:(id)a3 completionHandler:(id)a4;
- (void)pairingSetOOBEnabled:(BOOL)a3 peer:(id)a4 completionHandler:(id)a5;
- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setAcceptHandler:(id)a3;
- (void)setBleListenPSM:(unsigned __int16)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setConfigChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CBServer

- (CBServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBServer;
  v2 = -[CBServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CBServer;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)&OBJC_CLASS___CBServer;
  -[CBServer dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)NSPrintF_safe();
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
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__CBServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_189FB2B50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__CBServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0LL;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __36__CBServer__activateWithCompletion___block_invoke;
  v14[3] = &unk_189FB1BF8;
  v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void))MEMORY[0x18959F890](v14);
  if (self->_activateCalled
    || self->_invalidateCalled
    || (self->_activateCalled = 1,
        v7 = -[CBPeripheralManager initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___CBPeripheralManager),  "initWithDelegate:queue:",  self,  self->_dispatchQueue),  peripheralManager = self->_peripheralManager,  self->_peripheralManager = v7,  peripheralManager,  !self->_peripheralManager))
  {
    uint64_t v12 = NSErrorF_safe();
    v13 = (void *)v18[5];
    v18[5] = v12;
  }

  else
  {
    int var0 = self->_ucat->var0;
    v10 = (void *)MEMORY[0x18959F890](v5);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v10;

    -[CBServer _startIfNeeded](self, "_startIfNeeded");
  }

  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __36__CBServer__activateWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 48LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__CBServer_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__CBServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    id v4 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v4)
    {
      NSErrorF_safe();
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v4)[2](v4, v6);
    }

    if (self->_bleListeningPSM)
    {
      -[CBPeripheralManager unpublishL2CAPChannel:](self->_peripheralManager, "unpublishL2CAPChannel:");
      self->_bleListeningPSM = 0;
    }

    -[CBPeripheralManager setDelegate:](self->_peripheralManager, "setDelegate:", 0LL);
    peripheralManager = self->_peripheralManager;
    self->_peripheralManager = 0LL;

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = self->_connections;
    uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "invalidate", (void)v19);
        }

        uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      }

      while (v10);
    }

    -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
    v13 = (void (**)(void))MEMORY[0x18959F890](self->_invalidationHandler);
    id acceptHandler = self->_acceptHandler;
    self->_id acceptHandler = 0LL;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0LL;

    id configChangedHandler = self->_configChangedHandler;
    self->_id configChangedHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    if (v13) {
      v13[2](v13);
    }
    int v18 = self->_ucat->var0;
  }

- (void)_startIfNeeded
{
  int var0 = self->_ucat->var0;
  if (!self->_bleListeningPSM && -[CBManager state](self->_peripheralManager, "state") == CBManagerStatePoweredOn) {
    -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:]( self->_peripheralManager,  "publishL2CAPChannel:requiresEncryption:",  self->_bleListenPSM,  0LL);
  }
}

- (void)_handleConnectionInvalidated:(id)a3
{
  id v10 = a3;
  [v10 l2capChannel];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v6 = [v4 PSM];
    [v4 peer];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 identifier];
    uint64_t v8 = v6;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v10, v8, v9);
}

- (void)pairingGenerateOOBDataForPeer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__6;
  id v50 = 0LL;
  v41[0] = MEMORY[0x1895F87A8];
  v41[1] = 3221225472LL;
  v41[2] = __60__CBServer_pairingGenerateOOBDataForPeer_completionHandler___block_invoke;
  v41[3] = &unk_189FB5E60;
  v44 = &v45;
  v41[4] = self;
  id v8 = v6;
  id v42 = v8;
  id v9 = v7;
  id v43 = v9;
  v16 = (void (**)(void))MEMORY[0x18959F890](v41);
  if (self->_invalidateCalled)
  {
    uint64_t v35 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v10, v11, v12, v13, v14, v15, v39);
    uint64_t v24 = (void *)v46[5];
    v46[5] = v35;
  }

  else
  {
    -[CBManager sharedPairingAgent](self->_peripheralManager, "sharedPairingAgent");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = v17;
    if (v17)
    {
      [v17 delegate];
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25) {
        [v24 setDelegate:self];
      }
      [v24 retrieveOOBDataForPeer:v8];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          [v8 identifier];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSDataHex();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();
        }

        (*((void (**)(id, void *, void))v9 + 2))(v9, v32, 0LL);
      }

      else
      {
        uint64_t v37 = CBErrorF(-6700, (uint64_t)"Generate OOB data failed", v26, v27, v28, v29, v30, v31, v39);
        v38 = (void *)v46[5];
        v46[5] = v37;
      }
    }

    else
    {
      uint64_t v36 = CBErrorF(-6705, (uint64_t)"No pairing agent", v18, v19, v20, v21, v22, v23, v39);
      v32 = (void *)v46[5];
      v46[5] = v36;
    }
  }

  v16[2](v16);
  _Block_object_dispose(&v45, 8);
}

uint64_t __60__CBServer_pairingGenerateOOBDataForPeer_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 48LL);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(v1 + 40) identifier];
      int v3 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16LL))();
  }

  return result;
}

- (void)pairingSetOOBEnabled:(BOOL)a3 peer:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  id v42 = __Block_byref_object_copy__6;
  id v43 = __Block_byref_object_dispose__6;
  id v44 = 0LL;
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __56__CBServer_pairingSetOOBEnabled_peer_completionHandler___block_invoke;
  v34[3] = &unk_189FB5E88;
  uint64_t v37 = &v39;
  v34[4] = self;
  BOOL v38 = a3;
  id v10 = v8;
  id v35 = v10;
  id v11 = v9;
  id v36 = v11;
  uint64_t v18 = (void (**)(void))MEMORY[0x18959F890](v34);
  if (self->_invalidateCalled)
  {
    uint64_t v30 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v12, v13, v14, v15, v16, v17, v33);
    uint64_t v26 = (void *)v40[5];
    v40[5] = v30;
  }

  else
  {
    -[CBManager sharedPairingAgent](self->_peripheralManager, "sharedPairingAgent");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = v19;
    if (v19)
    {
      [v19 delegate];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27) {
        [v26 setDelegate:self];
      }
      [v26 setOOBPairingEnabled:1 forPeer:v10];
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        [v10 identifier];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
      }

      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }

    else
    {
      uint64_t v31 = CBErrorF(-6705, (uint64_t)"No pairing agent", v20, v21, v22, v23, v24, v25, v33);
      v32 = (void *)v40[5];
      v40[5] = v31;
    }
  }

  v18[2](v18);
  _Block_object_dispose(&v39, 8);
}

uint64_t __56__CBServer_pairingSetOOBEnabled_peer_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 48LL);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(v1 + 40) identifier];
      int v3 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16LL))();
  }

  return result;
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v27 = a3;
  id v9 = a4;
  id v25 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v26 = v9;
  [v9 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v11 = self->_connections;
  uint64_t v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v16 l2capChannel];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 peer];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 identifier];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v19 isEqual:v10])
        {
          uint64_t v22 = v26;
          uint64_t v21 = v27;
          uint64_t v23 = v25;
          [v16 pairingAgent:v27 peerDidRequestPairing:v26 type:a5 passkey:v25];

          goto LABEL_13;
        }
      }

      uint64_t v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      if (v13) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  uint64_t v22 = v26;
  uint64_t v21 = v27;
  uint64_t v23 = v25;
LABEL_13:
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v21 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v20 = v6;
  [v6 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = self->_connections;
  uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v13 l2capChannel];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 peer];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 identifier];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v16 isEqual:v7])
        {
          uint64_t v19 = v20;
          uint64_t v18 = v21;
          [v13 pairingAgent:v21 peerDidCompletePairing:v20];

          goto LABEL_13;
        }
      }

      uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  uint64_t v19 = v20;
  uint64_t v18 = v21;
LABEL_13:
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v25 = a3;
  id v8 = a4;
  id v23 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v24 = v8;
  [v8 identifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v10 = self->_connections;
  uint64_t v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v15 l2capChannel];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 peer];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 identifier];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v18 isEqual:v9])
        {
          id v21 = v24;
          id v20 = v25;
          [v15 pairingAgent:v25 peerDidCompletePairing:v24];

          __int128 v22 = v23;
          goto LABEL_13;
        }
      }

      uint64_t v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      if (v12) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  id v21 = v24;
  id v20 = v25;
  __int128 v22 = v23;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    uint64_t v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
LABEL_13:
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v21 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v20 = v6;
  [v6 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = self->_connections;
  uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v13 l2capChannel];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 peer];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 identifier];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v16 isEqual:v7])
        {
          uint64_t v19 = v20;
          uint64_t v18 = v21;
          [v13 pairingAgent:v21 peerDidUnpair:v20];

          goto LABEL_13;
        }
      }

      uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  uint64_t v19 = v20;
  uint64_t v18 = v21;
LABEL_13:
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  uint64_t v6 = [v5 state];

  int var0 = self->_ucat->var0;
  if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
    if (v6 != 1) {
      goto LABEL_5;
    }
LABEL_8:
    self->_bleListeningPSM = 0;
    return;
  }

  LogPrintF_safe();
  if (v6 == 1) {
    goto LABEL_8;
  }
LABEL_5:
  if (v6 == 5) {
    -[CBServer _startIfNeeded](self, "_startIfNeeded");
  }
}

- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  int v5 = a4;
  id v13 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (v13)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  self->_bleListeningPSM = v5;
  id v8 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v8)
  {
    ((void (**)(void, id))v8)[2](v8, v13);
  }

  else if (self->_bleListenPSM != v5)
  {
    uint64_t v10 = MEMORY[0x18959F890](self->_configChangedHandler);
    uint64_t v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
}

- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

  else
  {
  }

- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  else
  {
    id v9 = v7;
    int v10 = self->_ucat->var0;
    if (v9)
    {
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      {
        [v9 peer];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 identifier];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        unsigned int v13 = [v9 PSM];
        CUPrintNSError();
        uint64_t v29 = v13;
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v25 = v12;
        LogPrintF_safe();
      }

      uint64_t v14 = objc_alloc_init(&OBJC_CLASS___CBConnection);
      -[CBConnection setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
      -[CBConnection setL2capChannel:](v14, "setL2capChannel:", v9);
      -[CBConnection setServer:](v14, "setServer:", self);
      if (self->_label) {
        -[CBConnection setLabel:](v14, "setLabel:");
      }
      uint64_t v15 = MEMORY[0x1895F87A8];
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke;
      v33[3] = &unk_189FB1900;
      v33[4] = self;
      v33[5] = v14;
      -[CBConnection setServerInvalidationHandler:](v14, "setServerInvalidationHandler:", v33, v25, v29, v30);
      id v32 = 0LL;
      BOOL v16 = -[CBConnection activateDirectAndReturnError:](v14, "activateDirectAndReturnError:", &v32);
      id v17 = v32;
      if (v16)
      {
        connections = self->_connections;
        if (!connections)
        {
          uint64_t v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
          id v20 = self->_connections;
          self->_connections = v19;

          connections = self->_connections;
        }

        -[NSMutableSet addObject:](connections, "addObject:", v14);
        uint64_t v21 = MEMORY[0x18959F890](self->_acceptHandler);
        __int128 v22 = (void *)v21;
        if (v21)
        {
          v31[0] = v15;
          v31[1] = 3221225472LL;
          v31[2] = __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke_2;
          v31[3] = &unk_189FB4CE8;
          v31[4] = self;
          v31[5] = v9;
          v31[6] = v14;
          (*(void (**)(uint64_t, CBConnection *, void *))(v21 + 16))(v21, v14, v31);
        }
      }

      else
      {
        int v23 = self->_ucat->var0;
        if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          -[CBConnection invalidate](v14, "invalidate", v27);
        }

        else
        {
          -[CBConnection invalidate](v14, "invalidate", v26);
        }
      }
    }

    else if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

uint64_t __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionInvalidated:*(void *)(a1 + 40)];
}

void __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = **(_DWORD **)(v5 + 48);
  if (v3)
  {
    id v15 = v3;
    if (v6 <= 30)
    {
      if (v6 != -1 || (v10 = _LogCategory_Initialize(), uint64_t v5 = *(void *)(a1 + 32), v10))
      {
        unsigned int v7 = [*(id *)(a1 + 40) PSM];
        [*(id *)(a1 + 40) peer];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 identifier];
        uint64_t v12 = v7;
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        uint64_t v5 = *(void *)(a1 + 32);
      }
    }

    objc_msgSend(*(id *)(v5 + 24), "removeObject:", *(void *)(a1 + 48), v12, v13);
    [*(id *)(a1 + 48) invalidate];
    goto LABEL_10;
  }

  if (v6 <= 30)
  {
    id v15 = 0LL;
    if (v6 != -1 || (v11 = _LogCategory_Initialize(), id v4 = 0LL, v11))
    {
      [*(id *)(a1 + 40) PSM];
      [*(id *)(a1 + 40) peer];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 identifier];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

LABEL_10:
      id v4 = v15;
    }
  }
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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

- (id)acceptHandler
{
  return self->_acceptHandler;
}

- (void)setAcceptHandler:(id)a3
{
}

- (unsigned)bleListenPSM
{
  return self->_bleListenPSM;
}

- (void)setBleListenPSM:(unsigned __int16)a3
{
  self->_bleListenPSM = a3;
}

- (unsigned)bleListeningPSM
{
  return self->_bleListeningPSM;
}

- (id)configChangedHandler
{
  return self->_configChangedHandler;
}

- (void)setConfigChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end