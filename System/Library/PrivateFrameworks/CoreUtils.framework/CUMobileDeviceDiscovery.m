@interface CUMobileDeviceDiscovery
+ (void)getDevicesWithQueue:(id)a3 completion:(id)a4;
- (CUMobileDeviceDiscovery)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (unsigned)changeFlags;
- (unsigned)discoveryFlags;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CUMobileDeviceDiscovery

- (CUMobileDeviceDiscovery)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUMobileDeviceDiscovery;
  v2 = -[CUMobileDeviceDiscovery init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    *(void *)&v2->_changeFlags = 0x200000003LL;
  }

  return v2;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__CUMobileDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (!self->_invalidateCalled
    && gLogCategory_CUMobileDeviceDiscovery <= 50
    && (gLogCategory_CUMobileDeviceDiscovery != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x32u)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceDiscovery,  (uint64_t)"-[CUMobileDeviceDiscovery _invalidated]",  0x32u,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v12);
  }

  if (!self->_mdRunLoopThread)
  {
    if (gLogCategory_CUMobileDeviceDiscovery <= 30
      && (gLogCategory_CUMobileDeviceDiscovery != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceDiscovery,  (uint64_t)"-[CUMobileDeviceDiscovery _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v3,  v4,  v5,  v6,  v12);
    }

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v8 = self->_invalidationHandler;
    }

    else
    {
      id v8 = 0LL;
    }

    self->_invalidationHandler = 0LL;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0LL;
  }

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unsigned int)a3
{
  self->_discoveryFlags = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
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

- (void).cxx_destruct
{
}

uint64_t __37__CUMobileDeviceDiscovery_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (!*(_BYTE *)(*(void *)(result + 32) + 9LL))
  {
    uint64_t v8 = result;
    if (gLogCategory_CUMobileDeviceDiscovery <= 30
      && (gLogCategory_CUMobileDeviceDiscovery != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceDiscovery,  (uint64_t)"-[CUMobileDeviceDiscovery invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v10);
    }

    *(_BYTE *)(*(void *)(v8 + 32) + 9LL) = 1;
    v9 = *(id **)(v8 + 32);
    if (v9[2]) {
      return [v9[2] invalidate];
    }
    else {
      return [v9 _invalidated];
    }
  }

  return result;
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUMobileDeviceDiscovery <= 30
    && (gLogCategory_CUMobileDeviceDiscovery != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUMobileDeviceDiscovery,  (uint64_t)"-[CUMobileDeviceDiscovery activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v15);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  v9 = objc_alloc_init(&OBJC_CLASS___CURunLoopThread);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  [*(id *)(*(void *)(a1 + 32) + 16) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 40)];
  [(id)objc_opt_class() description];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 16) setLabel:v12];

  uint64_t v13 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_2;
  v20[3] = &unk_189F34238;
  uint64_t v21 = *(void *)(a1 + 32);
  [*(id *)(v21 + 16) setInvalidationHandler:v20];
  v18[0] = v13;
  v18[1] = 3221225472LL;
  v18[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_3;
  v18[3] = &unk_189F34238;
  uint64_t v19 = *(void *)(a1 + 32);
  [*(id *)(v19 + 16) setThreadInitializeHandler:v18];
  v16[0] = v13;
  v16[1] = 3221225472LL;
  v16[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_4;
  v16[3] = &unk_189F34238;
  uint64_t v17 = *(void *)(a1 + 32);
  [*(id *)(v17 + 16) setThreadFinalizeHandler:v16];
  return [*(id *)(*(void *)(a1 + 32) + 16) activate];
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mdThreadInitialize];
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mdThreadFinalize];
}

+ (void)getDevicesWithQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_queue_create("CUMobileDeviceGetDevices", 0LL);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke;
  v10[3] = &unk_189F33060;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke_2;
  v6[3] = &unk_189F33060;
  uint64_t v3 = *(dispatch_queue_s **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

@end