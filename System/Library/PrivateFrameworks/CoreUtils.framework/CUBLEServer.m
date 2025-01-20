@interface CUBLEServer
- (CUBLEServer)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)connectionEndedHandler;
- (id)connectionStartedHandler;
- (id)invalidationHandler;
- (unsigned)listenPSM;
- (unsigned)listeningPSM;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleConnectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)_startIfNeeded;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setConnectionEndedHandler:(id)a3;
- (void)setConnectionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setListenPSM:(unsigned __int16)a3;
- (void)setListeningPSM:(unsigned __int16)a3;
@end

@implementation CUBLEServer

- (CUBLEServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUBLEServer;
  v2 = -[CUBLEServer init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBLEServer;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUBLEServer;
  -[CUBLEServer dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__CUBLEServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  aBlock = (void (**)(void))a3;
  if (self->_peripheralManager)
  {
    uint64_t v4 = 4294960575LL;
    goto LABEL_3;
  }

  v11 = (CBPeripheralManager *)[objc_alloc(getCBPeripheralManagerClass_1578()) initWithDelegate:self queue:self->_dispatchQueue];
  peripheralManager = self->_peripheralManager;
  self->_peripheralManager = v11;

  if (self->_peripheralManager)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEServer _activateWithCompletion:]",  0x1Eu,  (uint64_t)"Activate PSM 0x%04X\n",  v13,  v14,  v15,  v16,  self->_listenPSM);
    }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__CUBLEServer_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_6;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        uint64_t v8 = (void (**)(void *, void *))_Block_copy(self->_activateCompletion);
        id activateCompletion = self->_activateCompletion;
        self->_id activateCompletion = 0LL;

        if (v8)
        {
          NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v10);
        }

        if (self->_listeningPSM)
        {
          -[CBPeripheralManager unpublishL2CAPChannel:](self->_peripheralManager, "unpublishL2CAPChannel:");
          self->_listeningPSM = 0;
        }

        -[CBPeripheralManager setDelegate:](self->_peripheralManager, "setDelegate:", 0LL);
        peripheralManager = self->_peripheralManager;
        self->_peripheralManager = 0LL;

        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        v12 = self->_connections;
        uint64_t v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v27;
          do
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(v12);
              }
              objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "invalidate", (void)v26);
            }

            uint64_t v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
          }

          while (v14);
        }

        -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
        invalidationHandler = (void (**)(void))self->_invalidationHandler;
        if (invalidationHandler) {
          invalidationHandler[2]();
        }
        id connectionStartedHandler = self->_connectionStartedHandler;
        self->_id connectionStartedHandler = 0LL;

        id connectionEndedHandler = self->_connectionEndedHandler;
        self->_id connectionEndedHandler = 0LL;

        id v20 = self->_invalidationHandler;
        self->_invalidationHandler = 0LL;

        v25 = self->_ucat;
        if (v25->var0 > 30) {
          goto LABEL_23;
        }
        if (v25->var0 == -1)
        {
          v25 = self->_ucat;
        }

        LogPrintF( (uint64_t)v25,  (uint64_t)"-[CUBLEServer _invalidate]",  0x1Eu,  (uint64_t)"Invalidated\n",  v21,  v22,  v23,  v24,  v26);
LABEL_23:

        return;
      }

      ucat = self->_ucat;
    }

    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v26);
    goto LABEL_6;
  }

- (void)_startIfNeeded
{
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEServer _startIfNeeded]",  9u,  (uint64_t)"StartIfNeeded\n",  v2,  v3,  v4,  v5,  v8);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)peripheralManagerDidUpdateState:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unint64_t v6 = [v5 state];

  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_9;
  }
  if (ucat->var0 == -1)
  {
    ucat = self->_ucat;
  }

  if (v6 > 0xA) {
    v12 = "?";
  }
  else {
    v12 = off_189F30C98[v6];
  }
  LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEServer peripheralManagerDidUpdateState:]",  0x1Eu,  (uint64_t)"Bluetooth state changed: %s\n",  v7,  v8,  v9,  v10,  (char)v12);
LABEL_9:
  if (v6 == 1)
  {
    self->_listeningPSM = 0;
  }

  else if (v6 == 5)
  {
    -[CUBLEServer _startIfNeeded](self, "_startIfNeeded");
  }

- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  id v15 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (v15)
  {
    if (var0 > 90) {
      goto LABEL_12;
    }
    if (var0 != -1) {
      goto LABEL_4;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
LABEL_4:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEServer peripheralManager:didPublishL2CAPChannel:error:]",  0x5Au,  (uint64_t)"### Publish L2CAP channel failed: %{error}\n",  v7,  v8,  v9,  v10,  (char)v15);
    }
  }

  else
  {
    if (var0 > 30) {
      goto LABEL_12;
    }
    if (var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEServer peripheralManager:didPublishL2CAPChannel:error:]",  0x1Eu,  (uint64_t)"Published L2CAP channel with PSM 0x%04X\n",  v7,  v8,  v9,  v10,  a4);
  }

- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  char v5 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEServer peripheralManager:didUnpublishL2CAPChannel:error:]",  0x1Eu,  (uint64_t)"Unpublished L2CAP channel with PSM 0x%04X: %{error}\n",  v7,  v8,  v9,  v10,  v5);
  }

- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v8)
  {
    id v18 = v7;
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v18)
    {
      if (var0 > 30) {
        goto LABEL_15;
      }
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        {
LABEL_15:
          __int128 v27 = objc_alloc_init(&OBJC_CLASS___CUBLEConnection);
          -[CUBLEConnection setDispatchQueue:](v27, "setDispatchQueue:", self->_dispatchQueue);
          -[CUBLEConnection setL2capChannel:](v27, "setL2capChannel:", v18);
          if (self->_label) {
            -[CUBLEConnection setLabel:](v27, "setLabel:");
          }
          v43[0] = MEMORY[0x1895F87A8];
          v43[1] = 3221225472LL;
          v43[2] = __59__CUBLEServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke;
          v43[3] = &unk_189F33088;
          v43[4] = self;
          __int128 v28 = v27;
          v44 = v28;
          -[CUBLEConnection setServerInvalidationHandler:](v28, "setServerInvalidationHandler:", v43);
          id v42 = 0LL;
          BOOL v29 = -[CUBLEConnection activateDirectAndReturnError:](v28, "activateDirectAndReturnError:", &v42);
          id v34 = v42;
          if (v29)
          {
            connections = self->_connections;
            if (!connections)
            {
              v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
              v37 = self->_connections;
              self->_connections = v36;

              connections = self->_connections;
            }

            -[NSMutableSet addObject:](connections, "addObject:", v28);
            id connectionStartedHandler = (void (**)(id, id))self->_connectionStartedHandler;
            if (connectionStartedHandler) {
              connectionStartedHandler[2](connectionStartedHandler, v28);
            }
            goto LABEL_29;
          }

          v39 = self->_ucat;
          if (v39->var0 <= 90)
          {
            if (v39->var0 == -1)
            {
              v39 = self->_ucat;
            }

            LogPrintF( (uint64_t)v39,  (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]",  0x5Au,  (uint64_t)"### Activate accepted connection failed: %{error}\n",  v30,  v31,  v32,  v33,  (char)v34);
          }

- (void)_handleConnectionInvalidated:(id)a3
{
  id v14 = a3;
  [v14 l2capChannel];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      char v6 = [v4 PSM];
      [v4 peer];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 identifier];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEServer _handleConnectionInvalidated:]",  0x1Eu,  (uint64_t)"Connection ended PSM 0x%04X, peer %@\n",  v8,  v9,  v10,  v11,  v6);

      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionEndedHandler:(id)a3
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

- (unsigned)listenPSM
{
  return self->_listenPSM;
}

- (void)setListenPSM:(unsigned __int16)a3
{
  self->_listenPSM = a3;
}

- (unsigned)listeningPSM
{
  return self->_listeningPSM;
}

- (void)setListeningPSM:(unsigned __int16)a3
{
  self->_listeningPSM = a3;
}

- (void).cxx_destruct
{
}

uint64_t __59__CUBLEServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionInvalidated:*(void *)(a1 + 40)];
}

uint64_t __25__CUBLEServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __38__CUBLEServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

@end