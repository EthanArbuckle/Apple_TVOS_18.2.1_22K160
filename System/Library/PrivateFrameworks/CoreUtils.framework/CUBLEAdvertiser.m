@interface CUBLEAdvertiser
- (CUBLEAdvertiser)init;
- (NSData)appleManufacturerData;
- (NSData)lgBTAddress;
- (NSData)lgDeviceID;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)_advertiseParameters;
- (id)_advertiseParametersSummary:(id)a3;
- (id)invalidationHandler;
- (unsigned)advertiseFlags;
- (void)_advertiseParametersAddLGWake:(id)a3;
- (void)_advertiseParametersAddOSR;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setAdvertiseFlags:(unsigned int)a3;
- (void)setAppleManufacturerData:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLgBTAddress:(id)a3;
- (void)setLgDeviceID:(id)a3;
@end

@implementation CUBLEAdvertiser

- (CUBLEAdvertiser)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUBLEAdvertiser;
  v2 = -[CUBLEAdvertiser init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUBLEAdvertiser;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)&OBJC_CLASS___CUBLEAdvertiser;
  -[CUBLEAdvertiser dealloc](&v4, sel_dealloc);
}

- (void)setAdvertiseFlags:(unsigned int)a3
{
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (v4->_advertiseFlags != a3)
  {
    v4->_advertiseFlags = a3;
    if (v4->_activateCalled)
    {
      dispatchQueue = (dispatch_queue_s *)v4->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __37__CUBLEAdvertiser_setAdvertiseFlags___block_invoke;
      block[3] = &unk_189F34238;
      block[4] = v4;
      dispatch_async(dispatchQueue, block);
    }
  }

  objc_sync_exit(v4);
}

- (void)setAppleManufacturerData:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  objc_super v6 = self;
  objc_sync_enter(v6);
  appleManufacturerData = v6->_appleManufacturerData;
  v8 = v5;
  v9 = appleManufacturerData;
  if (v8 == v9)
  {
  }

  else
  {
    v10 = v9;
    if ((v8 == 0LL) != (v9 != 0LL))
    {
      char v11 = -[NSData isEqual:](v8, "isEqual:", v9);

      if ((v11 & 1) != 0) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&v6->_appleManufacturerData, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = (dispatch_queue_s *)v6->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __44__CUBLEAdvertiser_setAppleManufacturerData___block_invoke;
      block[3] = &unk_189F34238;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)setLgBTAddress:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  objc_super v6 = self;
  objc_sync_enter(v6);
  lgBTAddress = v6->_lgBTAddress;
  v8 = v5;
  v9 = lgBTAddress;
  if (v8 == v9)
  {
  }

  else
  {
    v10 = v9;
    if ((v8 == 0LL) != (v9 != 0LL))
    {
      char v11 = -[NSData isEqual:](v8, "isEqual:", v9);

      if ((v11 & 1) != 0) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&v6->_lgBTAddress, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = (dispatch_queue_s *)v6->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __34__CUBLEAdvertiser_setLgBTAddress___block_invoke;
      block[3] = &unk_189F34238;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }

- (void)setLgDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  objc_super v6 = self;
  objc_sync_enter(v6);
  lgDeviceID = v6->_lgDeviceID;
  v8 = v5;
  v9 = lgDeviceID;
  if (v8 == v9)
  {
  }

  else
  {
    v10 = v9;
    if ((v8 == 0LL) != (v9 != 0LL))
    {
      char v11 = -[NSData isEqual:](v8, "isEqual:", v9);

      if ((v11 & 1) != 0) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&v6->_lgDeviceID, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = (dispatch_queue_s *)v6->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __33__CUBLEAdvertiser_setLgDeviceID___block_invoke;
      block[3] = &unk_189F34238;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__CUBLEAdvertiser_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CUBLEAdvertiser_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }

    else
    {
      id v4 = 0LL;
    }

    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEAdvertiser _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v5,  v6,  v7,  v8,  v10);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }

- (void)_ensureStarted
{
  peripheralManager = self->_peripheralManager;
  if (!peripheralManager)
  {
    v12 = (CBPeripheralManager *)[objc_alloc(getCBPeripheralManagerClass()) initWithDelegate:self queue:self->_dispatchQueue];
    v13 = self->_peripheralManager;
    self->_peripheralManager = v12;

    v18 = self->_peripheralManager;
    if (!v18)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        return;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEAdvertiser _ensureStarted]",  0x5Au,  (uint64_t)"### Create CBPeripheralManager failed\n",  v14,  v15,  v16,  v17,  v49);
      return;
    }

    if (-[CBPeripheralManager state](v18, "state") != 5) {
      return;
    }
LABEL_9:
    if (!self->_retrier)
    {
      v19 = objc_alloc_init(&OBJC_CLASS___CURetrier);
      retrier = self->_retrier;
      self->_retrier = v19;

      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 3221225472LL;
      v48[2] = __33__CUBLEAdvertiser__ensureStarted__block_invoke;
      v48[3] = &unk_189F34238;
      v48[4] = self;
      -[CURetrier setActionHandler:](self->_retrier, "setActionHandler:", v48);
      -[CURetrier setDispatchQueue:](self->_retrier, "setDispatchQueue:", self->_dispatchQueue);
      -[CURetrier setStartTime:](self->_retrier, "setStartTime:", CFAbsoluteTimeGetCurrent());
    }

    if (self->_startAdvertisingCalled)
    {
      if (!self->_changesPending) {
        return;
      }
      v21 = -[CUBLEAdvertiser _advertiseParameters](self, "_advertiseParameters");
      advertiseParametersCurrent = self->_advertiseParametersCurrent;
      v23 = v21;
      v24 = advertiseParametersCurrent;
      if (v23 == v24)
      {

        self->_changesPending = 0;
      }

      else
      {
        v25 = v24;
        if ((v23 == 0LL) == (v24 != 0LL))
        {

          self->_changesPending = 0;
          goto LABEL_30;
        }

        char v26 = -[NSDictionary isEqual:](v23, "isEqual:", v24);

        self->_changesPending = 0;
        if ((v26 & 1) == 0)
        {
LABEL_30:
          v40 = self->_ucat;
          if (v40->var0 <= 30)
          {
            if (v40->var0 == -1)
            {
              v40 = self->_ucat;
            }
            v41 = -[CUBLEAdvertiser _advertiseParametersSummary:](self, "_advertiseParametersSummary:", v23);
            LogPrintF( (uint64_t)v40,  (uint64_t)"-[CUBLEAdvertiser _ensureStarted]",  0x1Eu,  (uint64_t)"Advertiser update: %@\n",  v42,  v43,  v44,  v45,  (char)v41);
          }

- (void)_ensureStopped
{
  retrier = self->_retrier;
  if (retrier)
  {
    -[CURetrier invalidateDirect](retrier, "invalidateDirect");
    uint64_t v8 = self->_retrier;
    self->_retrier = 0LL;
  }

  self->_changesPending = 0;
  if (self->_startAdvertisingCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEAdvertiser _ensureStopped]",  0x1Eu,  (uint64_t)"Advertising stop\n",  v2,  v3,  v4,  v5,  v12);
    }

- (id)_advertiseParameters
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (-[NSData length](v4->_lgDeviceID, "length") == 6) {
    -[CUBLEAdvertiser _advertiseParametersAddLGWake:](v4, "_advertiseParametersAddLGWake:", v3);
  }
  if ((v4->_advertiseFlags & 8) != 0) {
    -[CUBLEAdvertiser _advertiseParametersAddOSR](v4, "_advertiseParametersAddOSR");
  }
  uint64_t v5 = v4->_appleManufacturerData;
  size_t v6 = -[NSData length](v5, "length");
  if (v6 - 1 <= 0x19)
  {
    MEMORY[0x1895F8858]();
    uint64_t v7 = (char *)v15 - ((v6 + 19) & 0xFFFFFFFFFFFFFFF0LL);
    *uint64_t v7 = v6 + 3;
    *(_WORD *)(v7 + 1) = 19711;
    v7[3] = 0;
    memcpy(v7 + 4, -[NSData bytes](v5, "bytes"), v6);
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v7 length:v6 + 4];
    getCBAdvertisementDataAppleMfgData();
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:v9];
  }

  unsigned int advertiseFlags = v4->_advertiseFlags;
  getCBAdvertisementDataIsConnectable();
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((advertiseFlags & 2) != 0) {
    uint64_t v12 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v12 = MEMORY[0x189604A80];
  }
  [v3 setObject:v12 forKeyedSubscript:v11];

  if ((v4->_advertiseFlags & 4) != 0) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"kCBAdvDataIsExtended"];
  }
  getCBManagerIsPrivilegedDaemonKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:v13];

  objc_sync_exit(v4);
  return v3;
}

- (void)_advertiseParametersAddLGWake:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FB8]);
  __int16 v7 = 196;
  [v5 appendBytes:&v7 length:2];
  size_t v6 = self->_lgDeviceID;
  if (-[NSData length](v6, "length") == 6)
  {
    [v5 appendData:v6];
    __int16 v7 = 7;
    [v5 appendBytes:&v7 length:2];
    [v4 setObject:v5 forKeyedSubscript:@"kCBAdvDataManufacturerDataInternal"];
    [v4 setObject:v5 forKeyedSubscript:@"kCBAdvDataNonAppleMfgData"];
  }
}

- (void)_advertiseParametersAddOSR
{
  __int16 v6 = 5952;
  char v7 = 1;
  if (GestaltGetDeviceClass_sOnce != -1) {
    dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13042);
  }
  char v3 = 6;
  switch(GestaltGetDeviceClass_deviceClass)
  {
    case 1:
      char v3 = 1;
      break;
    case 2:
      char v3 = 2;
      break;
    case 3:
      char v3 = 3;
      break;
    case 4:
      break;
    case 6:
      char v3 = 7;
      break;
    case 7:
      char v3 = 4;
      break;
    default:
      char v3 = 0;
      break;
  }

  char v8 = v3;
  id v4 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v6 length:4];
  appleManufacturerData = self->_appleManufacturerData;
  self->_appleManufacturerData = v4;
}

- (id)_advertiseParametersSummary:(id)a3
{
  char v3 = (const __CFDictionary *)a3;
  id CBAdvertisementDataAppleMfgData = getCBAdvertisementDataAppleMfgData();
  CFTypeID TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v3, CBAdvertisementDataAppleMfgData, TypeID, 0LL);
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = v6;
  if (v6)
  {
    CFMutableStringRef v30 = 0LL;
    id v8 = v6;
    [v8 bytes];
    [v8 length];
    NSAppendPrintF(&v30);
    unint64_t v9 = v30;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  CFTypeID v10 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v3, @"kCBAdvDataManufacturerDataInternal", v10, 0LL);
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    CFMutableStringRef v29 = v9;
    id v13 = v11;
    [v13 bytes];
    [v13 length];
    NSAppendPrintF(&v29);
    uint64_t v14 = v29;

    unint64_t v9 = v14;
  }

  CFTypeID v15 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v3, @"kCBAdvDataNonAppleMfgData", v15, 0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v16;
  if (v16)
  {
    CFMutableStringRef v28 = v9;
    id v18 = v16;
    [v18 bytes];
    [v18 length];
    NSAppendPrintF(&v28);
    v19 = v28;

    unint64_t v9 = v19;
  }

  id CBAdvertisementDataIsConnectable = getCBAdvertisementDataIsConnectable();
  if (CFDictionaryGetInt64(v3, CBAdvertisementDataIsConnectable, 0LL))
  {
    CFMutableStringRef v27 = v9;
    NSAppendPrintF(&v27);
    v21 = v27;

    unint64_t v9 = v21;
  }

  if (CFDictionaryGetInt64(v3, @"kCBAdvDataIsExtended", 0LL))
  {
    CFMutableStringRef v26 = v9;
    NSAppendPrintF(&v26);
    v22 = v26;

    unint64_t v9 = v22;
  }

  if (v9) {
    v23 = v9;
  }
  else {
    v23 = @"?";
  }
  v24 = v23;

  return v24;
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unint64_t v6 = [v5 state];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      if (v6 > 0xA) {
        uint64_t v12 = "?";
      }
      else {
        uint64_t v12 = off_189F30C98[v6];
      }
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidUpdateState:]",  0x1Eu,  (uint64_t)"Bluetooth advertiser state changed: %s\n",  v7,  v8,  v9,  v10,  (char)v12);
      goto LABEL_9;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (v6)
  {
    if (var0 <= 90)
    {
      if (var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidStartAdvertising:error:]",  0x5Au,  (uint64_t)"### Advertiser start failed: %{error}\n",  v7,  v8,  v9,  v10,  (char)v6);
    }

- (NSData)appleManufacturerData
{
  return self->_appleManufacturerData;
}

- (unsigned)advertiseFlags
{
  return self->_advertiseFlags;
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

- (NSData)lgBTAddress
{
  return self->_lgBTAddress;
}

- (NSData)lgDeviceID
{
  return self->_lgDeviceID;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

uint64_t __33__CUBLEAdvertiser__ensureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureStarted];
}

uint64_t __29__CUBLEAdvertiser_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 25))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 25) = 1;
    uint64_t v10 = *(void **)(result + 32);
    char v11 = (int *)v10[7];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        uint64_t v10 = *(void **)(v9 + 32);
        if (!v12) {
          return [v10 _invalidate];
        }
        char v11 = (int *)v10[7];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUBLEAdvertiser invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v13);
      uint64_t v10 = *(void **)(v9 + 32);
    }

    return [v10 _invalidate];
  }

  return result;
}

uint64_t __27__CUBLEAdvertiser_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (int *)v9[7];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void **)(a1 + 32);
      if (!v11) {
        return [v9 _ensureStarted];
      }
      uint64_t v10 = (int *)v9[7];
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUBLEAdvertiser activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void **)(a1 + 32);
  }

  return [v9 _ensureStarted];
}

uint64_t __33__CUBLEAdvertiser_setLgDeviceID___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

uint64_t __34__CUBLEAdvertiser_setLgBTAddress___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

uint64_t __44__CUBLEAdvertiser_setAppleManufacturerData___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

uint64_t __37__CUBLEAdvertiser_setAdvertiseFlags___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

@end