@interface CUBluetoothClient
- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4;
- (CUBluetoothClient)init;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)_createCUBluetoothDeviceWithBTDevice:(BTDeviceImpl *)a3;
- (id)_internalDispatchQueue;
- (id)bluetoothAddressChangedHandler;
- (id)bluetoothStateChangedHandler;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceConnectedHandler;
- (id)deviceDisconnectedHandler;
- (id)deviceEventHandler;
- (id)devicePairedHandler;
- (id)deviceUnpairedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)bluetoothState;
- (unsigned)flags;
- (unsigned)requiredServices;
- (unsigned)statusFlags;
- (void)_btAccessoryNameChanged:(BTDeviceImpl *)a3;
- (void)_btAccessoryPlacementChanged:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4;
- (void)_btAccessoryStreamStateChanged:(int)a3 device:(BTDeviceImpl *)a4;
- (void)_btEnsureStarted;
- (void)_btEnsureStopped;
- (void)_externalInvokeBlock:(id)a3;
- (void)_findDeviceByAddress:(id)a3 completion:(id)a4;
- (void)_handleBluetoothAddressChanged;
- (void)_handleConnectedDevicesInit;
- (void)_handleDeviceConnected:(BTDeviceImpl *)a3;
- (void)_handleDeviceDisconnected:(BTDeviceImpl *)a3 reason:(int)a4;
- (void)_handleDeviceEvent:(unsigned int)a3 device:(BTDeviceImpl *)a4;
- (void)_handlePairingStatusChanged;
- (void)_invalidated;
- (void)_processFindDeviceRequests;
- (void)_setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6;
- (void)activate;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)findDeviceByAddress:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setBluetoothAddressChangedHandler:(id)a3;
- (void)setBluetoothState:(int)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setDeviceConnectedHandler:(id)a3;
- (void)setDeviceDisconnectedHandler:(id)a3;
- (void)setDeviceEventHandler:(id)a3;
- (void)setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6;
- (void)setDevicePairedHandler:(id)a3;
- (void)setDeviceUnpairedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRequiredServices:(unsigned int)a3;
- (void)setStatusFlags:(unsigned int)a3;
- (void)updateDevice:(id)a3 btDevice:(BTDeviceImpl *)a4;
- (void)updateStatusFlags;
@end

@implementation CUBluetoothClient

- (CUBluetoothClient)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUBluetoothClient;
  v2 = -[CUBluetoothClient init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBluetoothClient;
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
  v4.super_class = (Class)&OBJC_CLASS___CUBluetoothClient;
  -[CUBluetoothClient dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[CUBluetoothClient descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v5 = 0LL;
  -[NSMutableDictionary count](self->_btConnectedDevices, "count", *(void *)&a3);
  -[NSMutableDictionary count](self->_btPairedDevices, "count");
  NSAppendPrintF(&v5);
  return v5;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CUBluetoothClient_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_externalInvokeBlock:(id)a3
{
  block = (void (**)(void))a3;
  -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
  objc_super v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;

  if (v4 == dispatchQueue) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)self->_dispatchQueue, block);
  }
}

- (id)_internalDispatchQueue
{
  return self->_dispatchQueue;
}

- (void)invalidate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__CUBluetoothClient_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 50)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _invalidated]",  0x32u,  (uint64_t)"### Unexpectedly invalidated\n",  v2,  v3,  v4,  v5,  v24);
      }
    }

- (void)findDeviceByAddress:(id)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)a3.var0;
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__CUBluetoothClient_findDeviceByAddress_completion___block_invoke;
  block[3] = &unk_189F30A30;
  int v11 = v4;
  __int16 v12 = WORD2(v4);
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_findDeviceByAddress:(id)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)a3.var0;
  id v6 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___CUBluetoothFindDeviceRequest);
  -[CUBluetoothFindDeviceRequest setAddress:](v10, "setAddress:", v4 & 0xFFFFFFFFFFFFLL);
  -[CUBluetoothFindDeviceRequest setCompletion:](v10, "setCompletion:", v6);

  findDeviceRequests = self->_findDeviceRequests;
  if (!findDeviceRequests)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v9 = self->_findDeviceRequests;
    self->_findDeviceRequests = v8;

    findDeviceRequests = self->_findDeviceRequests;
  }

  -[NSMutableArray addObject:](findDeviceRequests, "addObject:", v10);
  self->_btCentralManagerNeeded = 1;
  self->_btSessionNeeded = 1;
  -[CUBluetoothClient _btEnsureStarted](self, "_btEnsureStarted");
}

- (void)_processFindDeviceRequests
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  while (1)
  {
    uint64_t v3 = -[NSMutableArray firstObject](self->_findDeviceRequests, "firstObject");
    if (!v3) {
      break;
    }
    uint64_t v4 = (void *)v3;
    -[NSMutableArray removeObjectAtIndex:](self->_findDeviceRequests, "removeObjectAtIndex:", 0LL);
    if (self->_invalidateCalled)
    {
      [v4 completion];
      uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
      id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0LL, v6);
      goto LABEL_16;
    }

    uint64_t v7 = [v4 address];
    int v26 = v7;
    __int16 v27 = WORD2(v7);
    NSPrintF();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[CBCentralManager retrievePeripheralWithAddress:]( self->_btCentralManager,  "retrievePeripheralWithAddress:",  v8,  &v26);
    if (v9)
    {
      id v6 = (void (**)(void, void, void))v9;
      uint64_t v5 = (void (**)(void, void, void))v8;
    }

    else
    {
      uint64_t v10 = [v4 address];
      int v24 = v10;
      __int16 v25 = WORD2(v10);
      NSPrintF();
      uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

      uint64_t v11 = -[CBCentralManager retrievePeripheralWithAddress:]( self->_btCentralManager,  "retrievePeripheralWithAddress:",  v5,  &v24);
      if (!v11)
      {
        [v4 completion];
        id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
        __int16 v12 = (CUBluetoothDevice *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void, CUBluetoothDevice *))v6)[2](v6, 0LL, v12);
        goto LABEL_15;
      }

      id v6 = (void (**)(void, void, void))v11;
    }

    __int16 v12 = objc_alloc_init(&OBJC_CLASS___CUBluetoothDevice);
    [v6 identifier];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothDevice setIdentifier:](v12, "setIdentifier:", v13);
    [v13 getUUIDBytes:v29];
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier_2032[0])( (uint64_t)self->_btSession,  (uint64_t)v29,  (uint64_t)&v23))
    {
      [v4 completion];
      v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v15 = 4294960588LL;
    }

    else
    {
      v28[0] = 0;
      if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1985[0])( v23,  (uint64_t)v28,  32LL))
      {
        [NSString stringWithUTF8String:v28];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothDevice setAddressString:](v12, "setAddressString:", v17);

        if (((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])( (uint64_t)v28,  (uint64_t)&v21))
        {
          [v4 completion];
          uint64_t v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          NSErrorWithOSStatusF((const char *)0xFFFFE597LL);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void, void *))v18)[2](v18, 0LL, v19);
        }

        else
        {
          unint64_t v20 = v20 & 0xFFFF000000000000LL | v21 | ((unint64_t)v22 << 32);
          -[CUBluetoothDevice setAddress:](v12, "setAddress:");
          -[CUBluetoothClient updateDevice:btDevice:](self, "updateDevice:btDevice:", v12, v23);
          [v4 completion];
          uint64_t v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, CUBluetoothDevice *, void))v18)[2](v18, v12, 0LL);
        }

        goto LABEL_14;
      }

      [v4 completion];
      v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v15 = 4294960535LL;
    }

    NSErrorWithOSStatusF((const char *)v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v14)[2](v14, 0LL, v16);

LABEL_14:
LABEL_15:

LABEL_16:
  }

- (void)setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
  __int16 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __61__CUBluetoothClient_setDeviceFlags_mask_deviceID_completion___block_invoke;
  v15[3] = &unk_189F31780;
  unsigned int v18 = a3;
  unsigned int v19 = a4;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

- (void)_setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6
{
  id v13 = (void (**)(id, void *))a6;
  NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5B1LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _setDeviceFlags:mask:deviceID:completion:]",  0x5Au,  (uint64_t)"### setDeviceFlags failed: %{error}",  v7,  v8,  v9,  v10,  (char)v11);
  }

- (void)_btEnsureStarted
{
  v77[1] = *MEMORY[0x1895F89C0];
  if (!self->_btCentralManagerNeeded || self->_btCentralManager) {
    goto LABEL_11;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _btEnsureStarted]",  0x1Eu,  (uint64_t)"CBCentralManager start\n",  v2,  v3,  v4,  v5,  v68);
  }

- (void)_btEnsureStopped
{
  if (!self->_invalidateCalled)
  {
    self->_statusFlags = 0;
    uint64_t v7 = _Block_copy(self->_deviceDisconnectedHandler);
    btConnectedDevices = self->_btConnectedDevices;
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __37__CUBluetoothClient__btEnsureStopped__block_invoke;
    v29[3] = &unk_189F30A58;
    v29[4] = self;
    v29[5] = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( btConnectedDevices,  "enumerateKeysAndObjectsUsingBlock:",  v29);
  }

  if (!self->_btAccessoryEventsRegistered) {
    goto LABEL_13;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _btEnsureStopped]",  0x1Eu,  (uint64_t)"BTAccessoryManagerRemoveCallbacks\n",  v2,  v3,  v4,  v5,  v28);
  }

- (void)_btAccessoryNameChanged:(BTDeviceImpl *)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if ((self->_flags & 0x40) != 0)
  {
    v43[0] = 0;
    int v5 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1985[0])( (uint64_t)a3,  (uint64_t)v43,  32LL);
    if (!v5)
    {
      [NSString stringWithUTF8String:v43];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v10);
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v11;
      if (!v11)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 30)
        {
          if (ucat->var0 == -1)
          {
            ucat = self->_ucat;
          }

          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]",  0x1Eu,  (uint64_t)"Name state changed: Lookup device failed: %@\n",  v12,  v13,  v14,  v15,  (char)v10);
        }

- (void)_btAccessoryStreamStateChanged:(int)a3 device:(BTDeviceImpl *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if ((self->_flags & 0x40) != 0)
  {
    uint64_t v4 = *(void *)&a3;
    v36[0] = 0;
    int v6 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1985[0])( (uint64_t)a4,  (uint64_t)v36,  32LL);
    if (!v6)
    {
      [NSString stringWithUTF8String:v36];
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v11);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v12;
      if (!v12)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 30)
        {
          if (ucat->var0 == -1)
          {
            ucat = self->_ucat;
          }

          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]",  0x1Eu,  (uint64_t)"Stream state changed: Lookup device failed: %@\n",  v13,  v14,  v15,  v16,  (char)v11);
        }

        goto LABEL_19;
      }

      if ([v12 streamState] == (_DWORD)v4)
      {
        uint64_t v22 = self->_ucat;
        if (v22->var0 <= 10)
        {
          if (v22->var0 == -1)
          {
            uint64_t v22 = self->_ucat;
          }

          LogPrintF( (uint64_t)v22,  (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]",  0xAu,  (uint64_t)"Stream state unchanged: %@\n",  v18,  v19,  v20,  v21,  (char)v17);
        }

- (void)_btAccessoryPlacementChanged:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  int v57 = 0;
  int v7 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetInEarDetectionEnable[0])( (uint64_t)a3,  (uint64_t)a4,  (uint64_t)&v57);
  if (v7)
  {
    char v12 = v7;
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]",  0x3Cu,  (uint64_t)"### Placement changed: BTAccessoryManagerGetInEarDetectionEnable failed: %#m\n",  v8,  v9,  v10,  v11,  v12 - 16);
    }

- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v22 = 0LL;
  id v6 = a3;
  int v7 = (char *)[v6 UTF8String];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v20 = (void *)*MEMORY[0x189607670];
    uint64_t v17 = 4294960591LL;
    goto LABEL_24;
  }

  uint64_t v11 = v7;
  if (!StringToUUIDEx(v7, 0xFFFFFFFFFFFFFFFFLL, 0, 0LL, &v23, v8, v9, v10))
  {
    int v16 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier_2032[0])( (uint64_t)self->_btSession,  (uint64_t)&v23,  (uint64_t)&v22);
    if (v16 == -310000) {
      uint64_t v17 = 4294960596LL;
    }
    else {
      uint64_t v17 = (v16 + 310000);
    }
    if (!v16) {
      goto LABEL_14;
    }
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v20 = (void *)*MEMORY[0x189607670];
LABEL_24:
    NSErrorF_safe(v20, (const char *)v17);
    uint64_t v18 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

  uint64_t v12 = TextToHardwareAddress(v11, 0xFFFFFFFFFFFFFFFFLL, 6LL, v21);
  if ((_DWORD)v12)
  {
    if (a4)
    {
      uint64_t v14 = v12;
      uint64_t v15 = (void *)*MEMORY[0x189607670];
      goto LABEL_20;
    }

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4 = [a3 state];
  else {
    unsigned int v9 = dword_186B4A844[v4 - 1];
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    if (v9 > 0xA) {
      uint64_t v11 = "?";
    }
    else {
      uint64_t v11 = off_189F30C98[v9];
    }
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient centralManagerDidUpdateState:]",  0x1Eu,  (uint64_t)"Bluetooth state changed: central, %s\n",  v5,  v6,  v7,  v8,  (char)v11);
  }

- (id)_createCUBluetoothDeviceWithBTDevice:(BTDeviceImpl *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___CUBluetoothDevice);
  v26[0] = 0;
  int v6 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1985[0])( (uint64_t)a3,  (uint64_t)v26,  32LL);
  if (!v6)
  {
    [NSString stringWithUTF8String:v26];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothDevice setAddressString:](v5, "setAddressString:", v13);
    int v14 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)v26, (uint64_t)&v24);
    if (v14)
    {
      char v19 = v14;
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:]",  0x3Cu,  (uint64_t)"### BTDeviceAddressFromString failed: %#m\n",  v15,  v16,  v17,  v18,  v19 - 16);
      }
    }

    else
    {
      -[CUBluetoothDevice setAddress:](v5, "setAddress:", v24 | ((unint64_t)v25 << 32));
      -[CBCentralManager retrievePeripheralWithAddress:](self->_btCentralManager, "retrievePeripheralWithAddress:", v13);
      int v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 identifier];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBluetoothDevice setIdentifier:](v5, "setIdentifier:", v22);
    }

- (void)_handleBluetoothAddressChanged
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v3 copy];

  if ([v4 length] == 6
    && (uint64_t v5 = v4, v6 = -[NSData bytes](v5, "bytes"),
                                         *(_DWORD *)v6 | *(unsigned __int16 *)(v6 + 4))
    || (uint64_t v5 = self->_btLocalDeviceAddr, v4, -[NSData length](v5, "length") == 6)
    && (uint64_t v5 = v5, v7 = -[NSData bytes](v5, "bytes"),
                                         *(_DWORD *)v7 | *(unsigned __int16 *)(v7 + 4)))
  {
    if ((-[NSData isEqual:](self->_btAdvertisingAddress, "isEqual:", v5) & 1) == 0)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        if (-[NSData length](v5, "length") == 6) {
          char v13 = (char)-[NSData bytes](v5, "bytes");
        }
        else {
          char v13 = 0;
        }
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _handleBluetoothAddressChanged]",  0x1Eu,  (uint64_t)"Bluetooth address changed: %.6a\n",  v9,  v10,  v11,  v12,  v13);
      }

- (void)_handleConnectedDevicesInit
{
  if (!self->_btLocalDevice) {
    return;
  }
  unint64_t v54 = 0LL;
  int v3 = 5;
  uint64_t v4 = 256LL;
  do
  {
    uint64_t v5 = malloc(8 * v4);
    if (!v5)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        return;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]",  0x5Au,  (uint64_t)"### Malloc connected device array failed (%zu bytes)",  v6,  v7,  v8,  v9,  v4);
      return;
    }

    uint64_t v10 = v5;
    int v11 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetConnectedDevices[0])( (uint64_t)self->_btLocalDevice,  (uint64_t)v5,  (uint64_t)&v54,  v4);
    if (!v11)
    {
      if (!v54)
      {
LABEL_49:
        free(v10);
        return;
      }

      uint64_t v23 = 0LL;
      while (1)
      {
        uint64_t v24 = *((void *)v10 + v23);
        if (!self->_requiredServices)
        {
LABEL_27:
          -[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:](self, "_createCUBluetoothDeviceWithBTDevice:", v24);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            uint64_t v40 = self->_ucat;
            if (v40->var0 <= 30)
            {
              if (v40->var0 != -1) {
                goto LABEL_30;
              }
              if (_LogCategory_Initialize((uint64_t)v40, 0x1Eu))
              {
                uint64_t v40 = self->_ucat;
LABEL_30:
                LogPrintF( (uint64_t)v40,  (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]",  0x1Eu,  (uint64_t)"Connected device: %@\n",  v35,  v36,  v37,  v38,  (char)v39);
              }
            }

            [v39 addressString];
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42)
            {
              btConnectedDevices = self->_btConnectedDevices;
              if (!btConnectedDevices)
              {
                uint64_t v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
                uint64_t v45 = self->_btConnectedDevices;
                self->_btConnectedDevices = v44;

                btConnectedDevices = self->_btConnectedDevices;
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:]( btConnectedDevices,  "setObject:forKeyedSubscript:",  v39,  v42);
              -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
              v46 = _Block_copy(self->_deviceConnectedHandler);
              v47 = v46;
              if (v46)
              {
                v50[0] = MEMORY[0x1895F87A8];
                v50[1] = 3221225472LL;
                v50[2] = __48__CUBluetoothClient__handleConnectedDevicesInit__block_invoke;
                v50[3] = &unk_189F33060;
                uint64_t v52 = v46;
                id v51 = v39;
                -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v50);
              }
            }
          }

          goto LABEL_43;
        }

        int v53 = 0;
        int ConnectedServices_1961 = softLinkBTDeviceGetConnectedServices_1961(v24, &v53);
        int v30 = ConnectedServices_1961 + 310000;
        if (ConnectedServices_1961 && v30 != 0)
        {
          uint64_t v32 = self->_ucat;
          if (v32->var0 <= 90)
          {
            if (v32->var0 != -1) {
              goto LABEL_24;
            }
          }
        }

- (void)_handleDeviceConnected:(BTDeviceImpl *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addressString];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_15;
  }
  if ((self->_flags & 0x100) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6) {
      goto LABEL_15;
    }
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v7;
  if (v7) {
    objc_msgSend(v4, "setStreamState:", objc_msgSend(v7, "streamState"));
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _handleDeviceConnected:]",  0x1Eu,  (uint64_t)"Device connected: %@\n",  v8,  v9,  v10,  v11,  (char)v4);
  }

- (void)_handleDeviceDisconnected:(BTDeviceImpl *)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  int v33 = 0;
  int ConnectedServices_1961 = softLinkBTDeviceGetConnectedServices_1961(a3, &v33);
  if (ConnectedServices_1961)
  {
    char v12 = ConnectedServices_1961;
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _handleDeviceDisconnected:reason:]",  0x3Cu,  (uint64_t)"### BTDeviceGetConnectedServices failed: %#m\n",  v8,  v9,  v10,  v11,  v12 - 16);
        goto LABEL_6;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }

- (void)_handleDeviceEvent:(unsigned int)a3 device:(BTDeviceImpl *)a4
{
  uint64_t v7 = _Block_copy(self->_deviceEventHandler);
  if (v7)
  {
    -[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:](self, "_createCUBluetoothDeviceWithBTDevice:", a4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_8:

      goto LABEL_9;
    }

    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      BTServiceSpecificEventToString_2016(a3);
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _handleDeviceEvent:device:]",  0x1Eu,  (uint64_t)"Device event: %@, event %s\n",  v10,  v11,  v12,  v13,  (char)v8);
    }

- (void)_handlePairingStatusChanged
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  unint64_t v74 = 0LL;
  uint64_t v3 = 256LL;
  uint64_t v4 = 5LL;
  do
  {
    uint64_t v5 = malloc(8 * v3);
    if (!v5)
    {
      uint64_t v55 = 4294960568LL;
      goto LABEL_57;
    }

    uint64_t v6 = v5;
    int v7 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetPairedDevices)( (uint64_t)self->_btLocalDevice,  (uint64_t)v5,  (uint64_t)&v74,  v3);
    if (!v7)
    {
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_btPairedDevices,  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_1984);
      if (v74)
      {
        unint64_t v14 = 0LL;
        unsigned int v15 = softLinkCGImageDestinationAddImage_433;
        do
        {
          uint64_t v16 = v6[v14];
          v76[0] = 0;
          int v17 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v15[241])(v16, (uint64_t)v76, 32LL);
          if (!v17)
          {
            [NSString stringWithUTF8String:v76];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](self->_btPairedDevices, "objectForKeyedSubscript:", v24);
            uint64_t v25 = (CUBluetoothDevice *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              uint64_t v26 = v25;
              -[CUBluetoothDevice setPresent:](v25, "setPresent:", 1LL);
LABEL_35:

              goto LABEL_36;
            }

            uint64_t v26 = objc_alloc_init(&OBJC_CLASS___CUBluetoothDevice);
            -[CBCentralManager retrievePeripheralWithAddress:]( self->_btCentralManager,  "retrievePeripheralWithAddress:",  v24);
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 identifier];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUBluetoothDevice setIdentifier:](v26, "setIdentifier:", v28);

            if (!((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])( (uint64_t)v76,  (uint64_t)&v72))
            {
              unint64_t v61 = v61 & 0xFFFF000000000000LL | v72 | ((unint64_t)v73 << 32);
              -[CUBluetoothDevice setAddress:](v26, "setAddress:");
            }

            -[CUBluetoothDevice setAddressString:](v26, "setAddressString:", v24);
            -[CUBluetoothDevice setPresent:](v26, "setPresent:", 1LL);
            -[CUBluetoothClient updateDevice:btDevice:](self, "updateDevice:btDevice:", v26, v16);
            btPairedDevices = self->_btPairedDevices;
            if (!btPairedDevices)
            {
              int v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
              id v31 = self->_btPairedDevices;
              self->_btPairedDevices = v30;

              btPairedDevices = self->_btPairedDevices;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( btPairedDevices,  "setObject:forKeyedSubscript:",  v26,  v24);
            ucat = self->_ucat;
            if (ucat->var0 <= 30)
            {
              if (ucat->var0 != -1) {
                goto LABEL_25;
              }
              if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
              {
                ucat = self->_ucat;
LABEL_25:
                LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]",  0x1Eu,  (uint64_t)"Found %@\n",  v32,  v33,  v34,  v35,  (char)v26);
              }
            }

            -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
            if (self->_btPairedDevicesInitialized || (self->_flags & 1) != 0)
            {
              uint64_t v37 = _Block_copy(self->_devicePairedHandler);
              uint64_t v38 = v37;
              if (v37)
              {
                v69[0] = MEMORY[0x1895F87A8];
                v69[1] = 3221225472LL;
                v69[2] = __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_2;
                v69[3] = &unk_189F33060;
                __int128 v71 = v37;
                v70 = v26;
                -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v69);
              }
            }

            unsigned int v15 = softLinkCGImageDestinationAddImage_433;
            goto LABEL_35;
          }

          char v22 = v17;
          uint64_t v23 = self->_ucat;
          if (v23->var0 <= 60)
          {
            if (v23->var0 == -1)
            {
              uint64_t v23 = self->_ucat;
            }

            LogPrintF( (uint64_t)v23,  (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]",  0x3Cu,  (uint64_t)"### BTDeviceGetAddressString failed: %#m\n",  v18,  v19,  v20,  v21,  v22 - 16);
          }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"advertisingAddress", a4, a5, a6))
  {
    -[CBPeripheralManager advertisingAddress](self->_btPeripheralManager, "advertisingAddress");
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = (id)[v7 copy];

    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        if ([v14 length] == 6) {
          char v13 = [v14 bytes];
        }
        else {
          char v13 = 0;
        }
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient observeValueForKeyPath:ofObject:change:context:]",  0x1Eu,  (uint64_t)"Bluetooth advertising address: %.6a\n",  v9,  v10,  v11,  v12,  v13);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  ucat = self->_ucat;
  id v13 = v4;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      unint64_t v6 = [v4 state];
      if (v6 > 0xA) {
        uint64_t v11 = "?";
      }
      else {
        uint64_t v11 = off_189F30C98[v6];
      }
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient peripheralManagerDidUpdateState:]",  0x1Eu,  (uint64_t)"Bluetooth state changed: peripheral, %s\n",  v7,  v8,  v9,  v10,  (char)v11);
      id v4 = v13;
      goto LABEL_9;
    }

    BOOL v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    id v4 = v13;
    if (v12)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)updateDevice:(id)a3 btDevice:(BTDeviceImpl *)a4
{
  v121[32] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  p_btAccessoryManager = (uint64_t *)&self->_btAccessoryManager;
  if (!self->_btAccessoryManager)
  {
    int v26 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerGetDefault[0])( (uint64_t)self->_btSession,  (uint64_t)&self->_btAccessoryManager);
    if (v26)
    {
      char v31 = v26;
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 != -1)
        {
LABEL_23:
          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]",  0x3Cu,  (uint64_t)"### BTAccessoryManagerGetDefault failed: %#m\n",  v27,  v28,  v29,  v30,  v31 - 16);
          goto LABEL_2;
        }

        if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
        {
          ucat = self->_ucat;
          goto LABEL_23;
        }
      }
    }
  }

- (void)updateStatusFlags
{
  unsigned int statusFlags = self->_statusFlags;
  self->_unsigned int statusFlags = 0;
  uint64_t v4 = MEMORY[0x1895F87A8];
  btConnectedDevices = self->_btConnectedDevices;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __38__CUBluetoothClient_updateStatusFlags__block_invoke;
  v13[3] = &unk_189F30AC0;
  v13[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( btConnectedDevices,  "enumerateKeysAndObjectsUsingBlock:",  v13);
  btPairedDevices = self->_btPairedDevices;
  v12[0] = v4;
  v12[1] = 3221225472LL;
  v12[2] = __38__CUBluetoothClient_updateStatusFlags__block_invoke_2;
  v12[3] = &unk_189F30AC0;
  v12[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](btPairedDevices, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (self->_statusFlags != statusFlags)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClient updateStatusFlags]",  0x1Eu,  (uint64_t)"Status flags changed: %#{flags} -> %#{flags}\n",  v7,  v8,  v9,  v10,  statusFlags);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }

- (int)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int)a3
{
  self->_bluetoothState = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)requiredServices
{
  return self->_requiredServices;
}

- (void)setRequiredServices:(unsigned int)a3
{
  self->_unsigned int requiredServices = a3;
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusFlags:(unsigned int)a3
{
  self->_unsigned int statusFlags = a3;
}

- (id)bluetoothAddressChangedHandler
{
  return self->_bluetoothAddressChangedHandler;
}

- (void)setBluetoothAddressChangedHandler:(id)a3
{
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (id)deviceConnectedHandler
{
  return self->_deviceConnectedHandler;
}

- (void)setDeviceConnectedHandler:(id)a3
{
}

- (id)deviceDisconnectedHandler
{
  return self->_deviceDisconnectedHandler;
}

- (void)setDeviceDisconnectedHandler:(id)a3
{
}

- (id)deviceEventHandler
{
  return self->_deviceEventHandler;
}

- (void)setDeviceEventHandler:(id)a3
{
}

- (id)devicePairedHandler
{
  return self->_devicePairedHandler;
}

- (void)setDevicePairedHandler:(id)a3
{
}

- (id)deviceUnpairedHandler
{
  return self->_deviceUnpairedHandler;
}

- (void)setDeviceUnpairedHandler:(id)a3
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

- (void).cxx_destruct
{
}

void __38__CUBluetoothClient_updateStatusFlags__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  char v4 = [v7 deviceFlags];
  if ((v4 & 1) != 0) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244LL) |= 8u;
  }
  if ((v4 & 4) != 0) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244LL) |= 0x10u;
  }
  int v5 = [v7 primaryPlacement];
  if (v5 == 1 || v5 == 4 || (int v6 = [v7 secondaryPlacement], v6 == 4) || v6 == 1) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244LL) |= 1u;
  }
}

uint64_t __38__CUBluetoothClient_updateStatusFlags__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 supportsAACPService];
  if ((_DWORD)result) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244LL) |= 2u;
  }
  return result;
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPresent:0];
}

uint64_t __47__CUBluetoothClient__handleDeviceEvent_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 48));
}

uint64_t __54__CUBluetoothClient__handleDeviceDisconnected_reason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __44__CUBluetoothClient__handleDeviceConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handleConnectedDevicesInit__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __51__CUBluetoothClient__handleBluetoothAddressChanged__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __57__CUBluetoothClient__btAccessoryPlacementChanged_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __59__CUBluetoothClient__btAccessoryStreamStateChanged_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __45__CUBluetoothClient__btAccessoryNameChanged___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __37__CUBluetoothClient__btEnsureStopped__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 setDisconnectReason:4294896145];
  uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 224LL);
  if (*v9 <= 30)
  {
    if (*v9 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)v9,  (uint64_t)"-[CUBluetoothClient _btEnsureStopped]_block_invoke",  0x1Eu,  (uint64_t)"Device disconnected: %@\n",  v5,  v6,  v7,  v8,  (char)v4);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)v9, 0x1Eu))
    {
      uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 224LL);
      goto LABEL_3;
    }
  }

uint64_t __37__CUBluetoothClient__btEnsureStopped__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __61__CUBluetoothClient_setDeviceFlags_mask_deviceID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDeviceFlags:*(unsigned int *)(a1 + 56) mask:*(unsigned int *)(a1 + 60) deviceID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __52__CUBluetoothClient_findDeviceByAddress_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findDeviceByAddress:*(unsigned int *)(a1 + 48) | ((unint64_t)*(unsigned __int16 *)(a1 + 52) << 32) completion:*(void *)(a1 + 40)];
}

uint64_t __31__CUBluetoothClient_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 216))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 216) = 1;
    uint64_t v10 = *(void **)(result + 32);
    uint64_t v11 = (int *)v10[28];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        uint64_t v10 = *(void **)(v9 + 32);
        if (!v12) {
          goto LABEL_6;
        }
        uint64_t v11 = (int *)v10[28];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUBluetoothClient invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidating\n",  a5,  a6,  a7,  a8,  v13);
      uint64_t v10 = *(void **)(v9 + 32);
    }

uint64_t __29__CUBluetoothClient_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 224);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUBluetoothClient activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate: %#{flags}, RS %#{flags}\n",  a5,  a6,  a7,  a8,  *(_DWORD *)(v9 + 236));
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }

    BOOL v11 = _LogCategory_Initialize(*(void *)(v9 + 224), 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 224);
      goto LABEL_3;
    }
  }

@end