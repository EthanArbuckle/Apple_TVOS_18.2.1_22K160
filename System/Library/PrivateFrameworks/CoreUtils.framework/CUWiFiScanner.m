@interface CUWiFiScanner
- (CUWiFiScanner)init;
- (NSString)label;
- (NSString)ssid;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)errorHandler;
- (id)invalidationHandler;
- (unsigned)changeFlags;
- (unsigned)scanFlags;
- (void)_cleanup;
- (void)_invalidated;
- (void)_scanWiFiFinished:(id)a3 status:(int)a4;
- (void)_scanWiFiProcessResult:(id)a3;
- (void)_scanWiFiStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setScanFlags:(unsigned int)a3;
- (void)setSsid:(id)a3;
- (void)suspend;
@end

@implementation CUWiFiScanner

- (CUWiFiScanner)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUWiFiScanner;
  v2 = -[CUWiFiScanner init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_changeFlags = 5;
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_scanFlags = 3;
    v3->_ucat = (LogCategory *)&gLogCategory_CUWiFiScanner;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled) {
    FatalErrorF("Dealloc without invalidate");
  }
  -[CUWiFiScanner _cleanup](self, "_cleanup");
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUWiFiScanner;
  -[CUWiFiScanner dealloc](&v4, sel_dealloc);
}

- (void)_cleanup
{
  devices = self->_devices;
  self->_devices = 0LL;

  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    objc_super v5 = scanTimer;
    dispatch_source_cancel(v5);
    v6 = self->_scanTimer;
    self->_scanTimer = 0LL;
  }

  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0LL;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0LL;

  id deviceChangedHandler = self->_deviceChangedHandler;
  self->_id deviceChangedHandler = 0LL;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0LL;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__CUWiFiScanner_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__CUWiFiScanner_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (!*(_WORD *)&self->_invalidateDone)
  {
    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    -[CUWiFiScanner _cleanup](self, "_cleanup");
    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_6:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiScanner _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v4,  v5,  v6,  v7,  v9);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_6;
      }
    }
  }

- (void)suspend
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __24__CUWiFiScanner_suspend__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)resume
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __23__CUWiFiScanner_resume__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_scanWiFiStart
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v8 = v3;
  unsigned int scanFlags = self->_scanFlags;
  if ((scanFlags & 1) == 0)
  {
    [v3 setObject:MEMORY[0x189604A80] forKeyedSubscript:@"channel_2pt4GHz"];
    unsigned int scanFlags = self->_scanFlags;
  }

  if ((scanFlags & 2) == 0) {
    [v8 setObject:MEMORY[0x189604A80] forKeyedSubscript:@"channel_5GHz"];
  }
  ssid = self->_ssid;
  if (ssid) {
    [v8 setObject:ssid forKeyedSubscript:@"ssid"];
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiScanner _scanWiFiStart]",  0x1Eu,  (uint64_t)"WiFi scan start\n",  v4,  v5,  v6,  v7,  v23[0]);
  }

- (void)_scanWiFiFinished:(id)a3 status:(int)a4
{
  v61[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      char v8 = [v6 count];
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiScanner _scanWiFiFinished:status:]",  0x1Eu,  (uint64_t)"WiFi scan finish: %ld results, status %#m\n",  v9,  v10,  v11,  v12,  v8);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_scanWiFiProcessResult:(id)a3
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (const __CFDictionary *)a3;
  CFDictionaryGetHardwareAddress(v4, @"bssid", (char *)&v49, 6uLL, &v51);
  if (v51)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiScanner _scanWiFiProcessResult:]",  0x32u,  (uint64_t)"### No BSSID for scan result\n",  v5,  v6,  v7,  v8,  v45);
    }

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_unsigned int changeFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (void)setScanFlags:(unsigned int)a3
{
  self->_unsigned int scanFlags = a3;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
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

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
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

uint64_t __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scanWiFiStart];
}

void __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_msgSend(v3, "setPresent:", objc_msgSend(v3, "present") - 1);
}

uint64_t __31__CUWiFiScanner__scanWiFiStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 26LL) = 0;
  return [*(id *)(a1 + 32) _scanWiFiFinished:a3 status:a2];
}

uint64_t __23__CUWiFiScanner_resume__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 48);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUWiFiScanner resume]_block_invoke",  0x1Eu,  (uint64_t)"Resume\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

void __24__CUWiFiScanner_suspend__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUWiFiScanner suspend]_block_invoke",  0x1Eu,  (uint64_t)"Suspend\n",  a5,  a6,  a7,  a8,  v16);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }

    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 48);
      goto LABEL_3;
    }
  }

uint64_t __27__CUWiFiScanner_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(_BYTE *)(v8 + 24)) {
    return result;
  }
  uint64_t v9 = result;
  *(_BYTE *)(v8 + 24) = 1;
  uint64_t v10 = *(void *)(result + 32);
  if (!*(_BYTE *)(v10 + 25))
  {
    BOOL v11 = *(int **)(v10 + 48);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize(*(void *)(v10 + 48), 0x1Eu);
        uint64_t v10 = *(void *)(v9 + 32);
        if (!v12) {
          goto LABEL_7;
        }
        BOOL v11 = *(int **)(v10 + 48);
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUWiFiScanner invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidating\n",  a5,  a6,  a7,  a8,  v17);
      uint64_t v10 = *(void *)(v9 + 32);
    }
  }

uint64_t __25__CUWiFiScanner_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 48);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUWiFiScanner activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

@end