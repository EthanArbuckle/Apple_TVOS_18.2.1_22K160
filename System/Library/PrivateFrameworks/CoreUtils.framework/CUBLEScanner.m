@interface CUBLEScanner
- (BOOL)_shouldScan;
- (CUBLEScanner)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)_scanParameters;
- (id)_scanParametersSummary:(id)a3;
- (id)bluetoothStateChangedHandler;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (int)bluetoothState;
- (int)rssiThreshold;
- (int)scanRate;
- (unsigned)changeFlags;
- (unsigned)scanFlags;
- (void)_invalidate;
- (void)_invalidated;
- (void)_stopScanIfNeededWithReason:(const char *)a3;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_updateScanRules:(id *)a3 payloadType:(unsigned __int8)a4 rssiThreshold:(int)a5;
- (void)activate;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setBluetoothState:(int)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRssiThreshold:(int)a3;
- (void)setScanFlags:(unsigned int)a3;
- (void)setScanRate:(int)a3;
@end

@implementation CUBLEScanner

- (CUBLEScanner)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUBLEScanner;
  v2 = -[CUBLEScanner init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_scanRate = 30;
    v3->_ucat = (LogCategory *)&gLogCategory_CUBLEScanner;
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
  v4.super_class = (Class)&OBJC_CLASS___CUBLEScanner;
  -[CUBLEScanner dealloc](&v4, sel_dealloc);
}

- (void)setChangeFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __31__CUBLEScanner_setChangeFlags___block_invoke;
  v3[3] = &unk_189F30D80;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (int)rssiThreshold
{
  v2 = self;
  objc_sync_enter(v2);
  int rssiThreshold = v2->_rssiThreshold;
  objc_sync_exit(v2);

  return rssiThreshold;
}

- (void)setRssiThreshold:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__CUBLEScanner_setRssiThreshold___block_invoke;
  v3[3] = &unk_189F30D80;
  int v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setScanFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __29__CUBLEScanner_setScanFlags___block_invoke;
  v3[3] = &unk_189F30D80;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setScanRate:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __28__CUBLEScanner_setScanRate___block_invoke;
  v3[3] = &unk_189F30D80;
  int v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __24__CUBLEScanner_activate__block_invoke;
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
  block[2] = __26__CUBLEScanner_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEScanner _invalidate]",  0x1Eu,  (uint64_t)"Invalidate\n",  v2,  v3,  v4,  v5,  v10);
    }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0LL;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0LL;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_7:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEScanner _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v9,  v10,  v11,  v12,  v14);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_7;
      }
    }
  }

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t v4 = (uint64_t (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __41__CUBLEScanner__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_189F34238;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

- (void)_update
{
  v58[1] = *MEMORY[0x1895F89C0];
  if (!self->_invalidateCalled)
  {
    centralManager = self->_centralManager;
    uint64_t v4 = centralManager;
    if (!centralManager)
    {
      id v5 = objc_alloc((Class)getCBCentralManagerClass_1420[0]());
      dispatchQueue = self->_dispatchQueue;
      getCBManagerNeedsRestrictedStateOperation_1423[0]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v7;
      v58[0] = MEMORY[0x189604A88];
      [MEMORY[0x189603F68] dictionaryWithObjects:v58 forKeys:&v57 count:1];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (CBCentralManager *)[v5 initWithDelegate:self queue:dispatchQueue options:v8];
      uint64_t v10 = self->_centralManager;
      self->_centralManager = v9;

      uint64_t v4 = self->_centralManager;
      if (!v4)
      {
        ucat = self->_ucat;
        if (ucat->var0 > 90) {
          return;
        }
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        v37 = "### Create CBCentralManager failed\n";
        unsigned int v38 = 90;
        goto LABEL_44;
      }
    }

    uint64_t v15 = -[CBCentralManager state](v4, "state");
    if (v15 != 5 && v15 != 10)
    {
      if (!centralManager) {
        return;
      }
      unint64_t v34 = v15;
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        return;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      if (v34 > 0xA) {
        v36 = "?";
      }
      else {
        v36 = off_189F30C28[v34];
      }
      char v54 = (char)v36;
      v37 = "Deferring until Bluetooth powered: %s\n";
      unsigned int v38 = 30;
LABEL_44:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _update]", v38, (uint64_t)v37, v11, v12, v13, v14, v54);
      return;
    }

    if ((self->_scanFlags & 1) == 0 && !self->_systemMonitor)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
      systemMonitor = self->_systemMonitor;
      self->_systemMonitor = v17;

      -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
      uint64_t v19 = MEMORY[0x1895F87A8];
      v56[0] = MEMORY[0x1895F87A8];
      v56[1] = 3221225472LL;
      v56[2] = __23__CUBLEScanner__update__block_invoke;
      v56[3] = &unk_189F34238;
      v56[4] = self;
      -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v56);
      v20 = self->_systemMonitor;
      v55[0] = v19;
      v55[1] = 3221225472LL;
      v55[2] = __23__CUBLEScanner__update__block_invoke_2;
      v55[3] = &unk_189F34238;
      v55[4] = self;
      -[CUSystemMonitor activateWithCompletion:](v20, "activateWithCompletion:", v55);
    }

    v21 = self;
    objc_sync_enter(v21);
    BOOL changesPending = v21->_changesPending;
    v21->_BOOL changesPending = 0;
    objc_sync_exit(v21);

    if (!-[CUBLEScanner _shouldScan](v21, "_shouldScan"))
    {
      -[CUBLEScanner _stopScanIfNeededWithReason:](v21, "_stopScanIfNeededWithReason:", "criteria");
      return;
    }

    if (v21->_scannerStartCalled)
    {
      if (!changesPending) {
        return;
      }
      v23 = -[CUBLEScanner _scanParameters](v21, "_scanParameters");
      p_scanParametersCurrent = (id *)&v21->_scanParametersCurrent;
      scanParametersCurrent = v21->_scanParametersCurrent;
      v26 = v23;
      v27 = scanParametersCurrent;
      if (v26 == v27)
      {
      }

      else
      {
        v28 = v27;
        if ((v26 == 0LL) == (v27 != 0LL))
        {

          goto LABEL_37;
        }

        char v29 = -[NSDictionary isEqual:](v26, "isEqual:", v27);

        if ((v29 & 1) == 0)
        {
LABEL_37:
          v47 = v21->_ucat;
          if (v47->var0 <= 30)
          {
            if (v47->var0 == -1)
            {
              v47 = v21->_ucat;
            }
            v48 = -[CUBLEScanner _scanParametersSummary:](v21, "_scanParametersSummary:", v26);
            LogPrintF( (uint64_t)v47,  (uint64_t)"-[CUBLEScanner _update]",  0x1Eu,  (uint64_t)"Scanner update: %@\n",  v49,  v50,  v51,  v52,  (char)v48);
          }

- (id)_scanParameters
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int scanFlags = v2->_scanFlags;
  int v4 = v2->_changeFlags & 0x18;
  uint64_t rssiThreshold = v2->_rssiThreshold;
  int scanRate = v2->_scanRate;
  if (scanRate == 60) {
    int v7 = 30;
  }
  else {
    int v7 = 966;
  }
  if (scanRate == 50) {
    unsigned int v8 = 40;
  }
  else {
    unsigned int v8 = v7;
  }
  if (scanRate == 40) {
    unsigned int v9 = 60;
  }
  else {
    unsigned int v9 = 966;
  }
  if (scanRate == 30) {
    unsigned int v9 = 300;
  }
  if (scanRate <= 49) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v8;
  }
  objc_sync_exit(v2);

  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ((scanFlags & 0x40) != 0)
  {
    getCBCentralManagerScanOptionActive[0]();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:MEMORY[0x189604A88] forKeyedSubscript:v12];
  }

  if (v4)
  {
    getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:MEMORY[0x189604A88] forKeyedSubscript:v13];
  }

  [MEMORY[0x189607968] numberWithInt:v10];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionScanInterval[0]();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v14 forKeyedSubscript:v15];

  [MEMORY[0x189607968] numberWithInt:30];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionScanWindow[0]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v16 forKeyedSubscript:v17];

  getCBManagerIsPrivilegedDaemonKey_1416[0]();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:MEMORY[0x189604A88] forKeyedSubscript:v18];

  v23 = 0LL;
  if ((scanFlags & 2) != 0) {
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:]( v2,  "_updateScanRules:payloadType:rssiThreshold:",  &v23,  15LL,  rssiThreshold);
  }
  if ((scanFlags & 4) != 0) {
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:]( v2,  "_updateScanRules:payloadType:rssiThreshold:",  &v23,  16LL,  rssiThreshold);
  }
  if ((scanFlags & 0x90) != 0) {
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:]( v2,  "_updateScanRules:payloadType:rssiThreshold:",  &v23,  7LL,  rssiThreshold);
  }
  if ((scanFlags & 0x20) != 0) {
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:]( v2,  "_updateScanRules:payloadType:rssiThreshold:",  &v23,  18LL,  rssiThreshold);
  }
  uint64_t v19 = v23;
  if (v23)
  {
    getCBCentralManagerScanOptionMatchingRuleKey[0]();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v19 forKeyedSubscript:v20];

    v21 = v23;
  }

  else
  {
    v21 = 0LL;
  }

  return v11;
}

- (id)_scanParametersSummary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (const __CFDictionary *)a3;
  id v4 = (id)getCBCentralManagerScanOptionScanInterval[0]();
  int64_t Int64Ranged = CFDictionaryGetInt64Ranged(v3, v4, 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  id v6 = (id)getCBCentralManagerScanOptionScanWindow[0]();
  int64_t v7 = CFDictionaryGetInt64Ranged(v3, v6, 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  LODWORD(v8) = 100 * (int)v7 / (int)Int64Ranged;
  else {
    uint64_t v8 = 0LL;
  }
  CFMutableStringRef v47 = 0LL;
  int64_t v34 = Int64Ranged;
  uint64_t v36 = v8;
  int64_t v32 = v7;
  NSAppendPrintF(&v47);
  unsigned int v9 = v47;
  id v10 = (id)getCBCentralManagerScanOptionMatchingRuleKey[0]();
  CFTypeID TypeID = CFArrayGetTypeID();
  CFDictionaryGetTypedValue(v3, v10, TypeID, 0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count", v32, v34, v36))
  {
    CFMutableStringRef v46 = v9;
    NSAppendPrintF(&v46);
    uint64_t v13 = v46;

    unsigned int v9 = v13;
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v16 = "";
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(const __CFDictionary **)(*((void *)&v42 + 1) + 8 * i);
        id v20 = (id)getCBCentralManagerScanOptionMatchingRuleTypeKey[0]();
        unsigned __int8 v21 = CFDictionaryGetInt64Ranged(v19, v20, 0LL, 255LL, 0LL);
        CFMutableStringRef v41 = v9;
        v22 = "?";
        if (v21 <= 0x12u) {
          v22 = off_189F307E0[(char)v21];
        }
        int64_t v33 = (int64_t)v16;
        v35 = v22;
        NSAppendPrintF(&v41);
        v23 = v41;

        id v24 = (id)getCBCentralManagerScanOptionMatchingRuleRSSIKey[0]();
        int64_t v25 = CFDictionaryGetInt64Ranged(v19, v24, 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
        if ((_DWORD)v25)
        {
          CFMutableStringRef v40 = v23;
          int64_t v33 = v25;
          NSAppendPrintF(&v40);
          unsigned int v9 = v40;
        }

        else
        {
          unsigned int v9 = v23;
        }

        v16 = "; ";
      }

      uint64_t v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16, v33, v35);
      v16 = "; ";
    }

    while (v15);
  }

  if ([obj count])
  {
    CFMutableStringRef v39 = v9;
    NSAppendPrintF(&v39);
    v26 = v39;

    unsigned int v9 = v26;
  }

  id v27 = (id)getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
  if (CFDictionaryGetInt64(v3, v27, 0LL))
  {
    CFMutableStringRef v38 = v9;
    NSAppendPrintF(&v38);
    v28 = v38;

    unsigned int v9 = v28;
  }

  if (v9) {
    char v29 = v9;
  }
  else {
    char v29 = @"?";
  }
  uint64_t v30 = v29;

  return v30;
}

- (BOOL)_shouldScan
{
  if ((self->_scanFlags & 1) != 0 || (BOOL v2 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn"))) {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)_stopScanIfNeededWithReason:(const char *)a3
{
  if (self->_scannerStartCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      char v9 = (char)a3;
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEScanner _stopScanIfNeededWithReason:]",  0x1Eu,  (uint64_t)"Scanner stop (%s)\n",  v3,  v4,  v5,  v6,  v9);
    }

- (void)_updateScanRules:(id *)a3 payloadType:(unsigned __int8)a4 rssiThreshold:(int)a5
{
  uint64_t v6 = a4;
  v22[2] = *MEMORY[0x1895F89C0];
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedChar:v6];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionMatchingRuleTypeKey[0]();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v9 forKeyedSubscript:v10];

  if (a5) {
    uint64_t v11 = a5;
  }
  else {
    uint64_t v11 = 4294967216LL;
  }
  [MEMORY[0x189607968] numberWithInt:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionMatchingRuleRSSIKey[0]();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v12 forKeyedSubscript:v13];

  uint64_t v21 = 0LL;
  v22[0] = 0LL;
  *(void *)((char *)v22 + 6) = 0LL;
  uint64_t v19 = 0LL;
  v20[0] = 0LL;
  *(void *)((char *)v20 + 6) = 0LL;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v21 length:22];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v19 length:22];
  getCBCentralManagerScanOptionMatchingRulePayloadKey[0]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v14 forKeyedSubscript:v16];

  getCBCentralManagerScanOptionMatchingRuleMaskKey[0]();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v15 forKeyedSubscript:v17];

  id v18 = *a3;
  if (!v18)
  {
    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    objc_storeStrong(a3, v18);
  }

  [v18 addObject:v8];
}

- (void)centralManagerDidUpdateState:(id)a3
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
    uint64_t v12 = "?";
  }
  else {
    uint64_t v12 = off_189F30C98[v6];
  }
  LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEScanner centralManagerDidUpdateState:]",  0x1Eu,  (uint64_t)"Bluetooth scanner state changed: %s\n",  v7,  v8,  v9,  v10,  (char)v12);
LABEL_9:
  unint64_t v13 = v6 - 1;
  if (v6 - 1 > 9) {
    int v14 = 0;
  }
  else {
    int v14 = dword_186B4A844[v13];
  }
  self->_bluetoothState = v14;
  uint64_t v15 = _Block_copy(self->_bluetoothStateChangedHandler);
  v16 = v15;
  if (v15) {
    (*((void (**)(void *))v15 + 2))(v15);
  }

  switch(v13)
  {
    case 0uLL:
    case 3uLL:
      self->_scannerStartCalled = 0;
      break;
    case 4uLL:
    case 9uLL:
      -[CUBLEScanner _update](self, "_update");
      break;
    default:
      return;
  }

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v12 identifier];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 UUIDString];
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v37);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(&OBJC_CLASS___CUBLEDevice);
  -[CUBLEDevice setIdentifier:](v16, "setIdentifier:", v37);
  uint64_t v17 = [v10 intValue];

  unsigned int v18 = -[CUBLEDevice updateWithAdvertisementData:rssi:oldDevice:]( v16,  "updateWithAdvertisementData:rssi:oldDevice:",  v11,  v17,  v15);
  uint64_t v19 = v18 | 0x18;
  if (v15) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v18 | 0x38;
  }
  -[CUBLEDevice setChangeFlags:](v16, "setChangeFlags:", v20);
  [v13 sharedPairingAgent];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v22 = [v21 isPeerPaired:v12];
  -[CUBLEDevice setDeviceFlags:](v16, "setDeviceFlags:", v22);
  unsigned int scanFlags = self->_scanFlags;
  if ((scanFlags & 0xFE) != 0 && (-[CUBLEDevice scanFlags](v16, "scanFlags") & scanFlags & 0xFE) == 0)
  {
    int v29 = 0;
    signed int v28 = 8;
  }

  else
  {
    signed int v28 = 9;
    int v29 = 1;
  }

  ucat = self->_ucat;
  if (v28 >= ucat->var0)
  {
    if (ucat->var0 != -1)
    {
LABEL_10:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEScanner centralManager:didDiscoverPeripheral:advertisementData:RSSI:]",  v28,  (uint64_t)"Found: %@\n",  v23,  v24,  v25,  v26,  (char)v16);
      goto LABEL_12;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, v28))
    {
      ucat = self->_ucat;
      goto LABEL_10;
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

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
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

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (int)scanRate
{
  return self->_scanRate;
}

- (void).cxx_destruct
{
}

uint64_t __44__CUBLEScanner__stopScanIfNeededWithReason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __23__CUBLEScanner__update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __23__CUBLEScanner__update__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __41__CUBLEScanner__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __26__CUBLEScanner_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __24__CUBLEScanner_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = (int *)v9[9];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void **)(a1 + 32);
      if (!v11) {
        return [v9 _update];
      }
      id v10 = (int *)v9[9];
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUBLEScanner activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void **)(a1 + 32);
  }

  return [v9 _update];
}

BOOL __28__CUBLEScanner_setScanRate___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 92) = v1;
  }
  return v1 != v3;
}

BOOL __29__CUBLEScanner_setScanFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 88);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 88) = v1;
  }
  return v1 != v3;
}

BOOL __33__CUBLEScanner_setRssiThreshold___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 44);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 44) = v1;
  }
  return v1 != v3;
}

BOOL __31__CUBLEScanner_setChangeFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 84);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 84) = v1;
  }
  return v1 != v3;
}

@end