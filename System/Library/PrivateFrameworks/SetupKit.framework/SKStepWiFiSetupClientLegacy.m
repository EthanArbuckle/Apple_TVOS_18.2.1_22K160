@interface SKStepWiFiSetupClientLegacy
- (BOOL)_runInit;
- (CUMessaging)skMessaging;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepWiFiSetupClientLegacy)init;
- (double)metricTotalSeconds;
- (double)metricWiFiSetupSeconds;
- (id)skCompletionHandler;
- (void)_completeWithError:(id)a3;
- (void)_invalidateCore;
- (void)_invalidated;
- (void)_run;
- (void)_runInternetReachabilityStart;
- (void)_runWiFiSetupStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepWiFiSetupClientLegacy

- (SKStepWiFiSetupClientLegacy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKStepWiFiSetupClientLegacy;
  v2 = -[SKStepWiFiSetupClientLegacy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiSetupClientLegacy;
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
  v4.super_class = (Class)&OBJC_CLASS___SKStepWiFiSetupClientLegacy;
  -[SKStepWiFiSetupClientLegacy dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__SKStepWiFiSetupClientLegacy_activate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__SKStepWiFiSetupClientLegacy_invalidate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCore
{
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = 0LL;

  bonjourTimer = self->_bonjourTimer;
  if (bonjourTimer)
  {
    v5 = bonjourTimer;
    dispatch_source_cancel(v5);
    objc_super v6 = self->_bonjourTimer;
    self->_bonjourTimer = 0LL;
  }

  -[CUReachabilityMonitor invalidate](self->_internetReachabilityMonitor, "invalidate");
  internetReachabilityMonitor = self->_internetReachabilityMonitor;
  self->_internetReachabilityMonitor = 0LL;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0LL;
  }

  -[CWFInterface invalidate](self->_wifiInterface, "invalidate");
  wifiInterface = self->_wifiInterface;
  self->_wifiInterface = 0LL;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    objc_super v6 = (void (**)(id, void *))MEMORY[0x1895CC3E8](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0LL;

    if (v6)
    {
      NSErrorF_safe();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v4);
    }

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
  }

- (void)_completeWithError:(id)a3
{
  id v12 = a3;
  if (v12) {
    int v4 = 3;
  }
  else {
    int v4 = 4;
  }
  self->_runState = v4;
  mach_absolute_time();
  UpTicksToSecondsF();
  double v6 = v5;
  self->_metricTotalSeconds = v5;
  int var0 = self->_ucat->var0;
  if (v12)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      double v10 = v6;
      LogPrintF();
    }
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    double v10 = v6;
    LogPrintF();
  }

  -[SKStepWiFiSetupClientLegacy _invalidateCore](self, "_invalidateCore", *(void *)&v10, v11);
  v8 = (void (**)(void, void))MEMORY[0x1895CC3E8](self->_skCompletionHandler);
  id skCompletionHandler = self->_skCompletionHandler;
  self->_id skCompletionHandler = 0LL;

  if (v8) {
    ((void (**)(void, id))v8)[2](v8, v12);
  }
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          unint64_t runState = self->_runState;
          switch((int)runState)
          {
            case 0:
              self->_unint64_t runState = 10;
              if (-[SKStepWiFiSetupClientLegacy _runInit](self, "_runInit"))
              {
                int v4 = self->_runState + 1;
                goto LABEL_20;
              }

              break;
            case 11:
              self->_unint64_t runState = 12;
              -[SKStepWiFiSetupClientLegacy _runInternetReachabilityStart](self, "_runInternetReachabilityStart");
              break;
            case 12:
              if (self->_stepError) {
                goto LABEL_12;
              }
              if (self->_stepDone)
              {
                int v4 = 13;
                goto LABEL_20;
              }

              break;
            case 13:
              self->_unint64_t runState = 14;
              -[SKStepWiFiSetupClientLegacy _runWiFiSetupStart](self, "_runWiFiSetupStart");
              break;
            case 14:
              if (self->_stepError)
              {
LABEL_12:
                self->_unint64_t runState = 16;
              }

              else if (self->_stepDone)
              {
                int v4 = 15;
LABEL_20:
                self->_unint64_t runState = v4;
              }

              break;
            case 15:
              double v5 = self;
              stepError = 0LL;
              goto LABEL_17;
            case 16:
              stepError = self->_stepError;
              if (!stepError)
              {
                NSErrorF_safe();
                v7 = (NSError *)objc_claimAutoreleasedReturnValue();
                v8 = self->_stepError;
                self->_stepError = v7;

                stepError = self->_stepError;
              }

              double v5 = self;
LABEL_17:
              -[SKStepWiFiSetupClientLegacy _completeWithError:](v5, "_completeWithError:", stepError, v13, v14);
              break;
            default:
              break;
          }

          unint64_t v9 = self->_runState;
          if (v9 == runState) {
            return;
          }
          int var0 = self->_ucat->var0;
        }

        while (var0 > 30);
        if (var0 == -1) {
          break;
        }
LABEL_24:
        if (runState < 0x11 && ((0x1F8FFuLL >> runState) & 1) != 0)
        {
          v11 = off_18A282138[runState];
        }

        else if ((int)runState <= 9)
        {
          v11 = "?";
        }

        else
        {
          v11 = "User";
        }

        if (v9 < 0x11 && ((0x1F8FFuLL >> v9) & 1) != 0)
        {
          id v12 = off_18A282138[v9];
        }

        else if ((int)v9 <= 9)
        {
          id v12 = "?";
        }

        else
        {
          id v12 = "User";
        }

        v13 = v11;
        v14 = v12;
        LogPrintF();
      }

      if (_LogCategory_Initialize())
      {
        unint64_t v9 = self->_runState;
        goto LABEL_24;
      }
    }
  }

- (BOOL)_runInit
{
  self->_startTicks = mach_absolute_time();
  v3 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v3;
  double v5 = v3;

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __39__SKStepWiFiSetupClientLegacy__runInit__block_invoke;
  v7[3] = &unk_18A2820C0;
  v7[4] = v5;
  v7[5] = self;
  dispatch_source_set_event_handler(v5, v7);
  CUDispatchTimerSet();
  dispatch_activate((dispatch_object_t)self->_timeoutTimer);

  return 1;
}

- (void)_runInternetReachabilityStart
{
  int var0 = self->_ucat->var0;
  if (self->_internetReachabilityEnabled)
  {
    self->_stepDone = 0;
    stepError = self->_stepError;
    self->_stepError = 0LL;

    -[CUReachabilityMonitor invalidate](self->_internetReachabilityMonitor, "invalidate");
    double v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x18960ED98]);
    internetReachabilityMonitor = self->_internetReachabilityMonitor;
    self->_internetReachabilityMonitor = v5;
    v7 = v5;

    -[CUReachabilityMonitor setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
    -[CUReachabilityMonitor setTimeout:](v7, "setTimeout:", 20.0);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __60__SKStepWiFiSetupClientLegacy__runInternetReachabilityStart__block_invoke;
    v9[3] = &unk_18A282310;
    v9[4] = v7;
    v9[5] = self;
    -[CUReachabilityMonitor setCompletionHandler:](v7, "setCompletionHandler:", v9);
    -[CUReachabilityMonitor activate](v7, "activate");
  }

  else
  {
    self->_stepDone = 1;
    v8 = self->_stepError;
    self->_stepError = 0LL;
  }

- (void)_runWiFiSetupStart
{
  v38[1] = *MEMORY[0x1895F89C0];
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = __Block_byref_object_copy__2067;
  v35 = __Block_byref_object_dispose__2068;
  id v36 = 0LL;
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke;
  v30[3] = &unk_18A2820E8;
  v30[4] = self;
  v30[5] = &v31;
  v26 = (void (**)(void))MEMORY[0x1895CC3E8](v30, a2);
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  id v27 = objc_alloc_init(MEMORY[0x189603FC8]);
  int v4 = self->_wifiInterface;
  if (!v4)
  {
    int v4 = (CWFInterface *)objc_alloc_init(MEMORY[0x18960F040]);
    objc_storeStrong((id *)&self->_wifiInterface, v4);
    -[CWFInterface activate](v4, "activate");
  }

  -[CWFInterface currentKnownNetworkProfile](v4, "currentKnownNetworkProfile");
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CWFInterface channel](v4, "channel");
    double v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 channel];

    if (v7)
    {
      [MEMORY[0x189607968] numberWithUnsignedInteger:v7];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 setObject:v8 forKeyedSubscript:@"_wiCh"];
    }

    uint64_t v9 = [v5 SSID];
    double v10 = (void *)v9;
    if (v9)
    {
      id v29 = 0LL;
      MEMORY[0x1895CC01C](v9, &v29);
      id v11 = v29;
      if (v11) {
        [v27 setObject:v11 forKeyedSubscript:@"_wiPW"];
      }
      [v5 networkName];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        [v27 setObject:v12 forKeyedSubscript:@"_wiSS"];
        v13 = self->_skMessaging;
        if (v13)
        {
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v15 = CUPrintNSObject();
            v16 = (void *)v15;
            v17 = "yes";
            if (!v11) {
              v17 = "no";
            }
            uint64_t v24 = v7;
            v25 = v17;
            uint64_t v23 = v15;
            LogPrintF();
          }

          v37 = @"timeoutSeconds";
          v38[0] = &unk_18A2893A0;
          objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1, v23, v24, v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1895F87A8];
          v28[1] = 3221225472LL;
          v28[2] = __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke_40;
          v28[3] = &unk_18A282118;
          v28[4] = self;
          -[CUMessaging sendRequestID:requestMessage:options:responseHandler:]( v13,  "sendRequestID:requestMessage:options:responseHandler:",  @"_wiSU",  v27,  v18,  v28);
        }

        else
        {
          uint64_t v22 = NSErrorF_safe();
          v18 = (void *)v32[5];
          v32[5] = v22;
        }
      }

      else
      {
        uint64_t v21 = NSErrorF_safe();
        v13 = (CUMessaging *)v32[5];
        v32[5] = v21;
      }
    }

    else
    {
      uint64_t v20 = NSErrorF_safe();
      id v11 = (id)v32[5];
      v32[5] = v20;
    }
  }

  else
  {
    uint64_t v19 = NSErrorF_safe();
    double v10 = (void *)v32[5];
    v32[5] = v19;
  }

  v26[2](v26);
  _Block_object_dispose(&v31, 8);
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

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setSkCompletionHandler:(id)a3
{
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkMessaging:(id)a3
{
}

- (SKSetupBase)skSetupObject
{
  return (SKSetupBase *)objc_loadWeakRetained((id *)&self->_skSetupObject);
}

- (void)setSkSetupObject:(id)a3
{
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (double)metricWiFiSetupSeconds
{
  return self->_metricWiFiSetupSeconds;
}

- (void).cxx_destruct
{
}

void __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(v2 + 8) + 40LL))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 96);
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(a1 + 32), v2 = *(void *)(a1 + 40), v5))
      {
        CUPrintNSError();
        double v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v3 = *(void *)(a1 + 32);
        uint64_t v2 = *(void *)(a1 + 40);
      }
    }

    objc_storeStrong((id *)(v3 + 80), *(id *)(*(void *)(v2 + 8) + 40LL));
  }

void __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke_40( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v14 = a2;
  id v6 = a4;
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 48LL))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 160LL) = v7;
    id v8 = v14;
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = **(_DWORD **)(v9 + 96);
    if (!v8 || v6)
    {
      if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      id v12 = v6;
      if (!v6)
      {
        NSErrorF_safe();
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 80LL), v12);
      if (!v6) {
    }
      }

    else
    {
      if (v10 <= 30)
      {
        if (v10 != -1 || (v11 = _LogCategory_Initialize(), uint64_t v9 = *(void *)(a1 + 32), v11))
        {
          v13 = *(void **)(v9 + 160);
          LogPrintF();
          uint64_t v9 = *(void *)(a1 + 32);
        }
      }

      *(_BYTE *)(v9 + 72) = 1;
    }

    objc_msgSend(*(id *)(a1 + 32), "_run", v13);
  }
}

void __60__SKStepWiFiSetupClientLegacy__runInternetReachabilityStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4 == *(void **)(v5 + 40))
  {
    *(void *)(v5 + 40) = 0LL;
    id v12 = v3;

    if (v12)
    {
      uint64_t v6 = NSErrorNestedF();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;

      int v9 = **(_DWORD **)(*(void *)(a1 + 40) + 96LL);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }

    else
    {
      int v10 = **(_DWORD **)(*(void *)(a1 + 40) + 96LL);
    }

    *(_BYTE *)(*(void *)(a1 + 40) + 72LL) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    id v3 = v12;
  }
}

uint64_t __39__SKStepWiFiSetupClientLegacy__runInit__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(a1 + 40);
  if (v3 == *(void *)(result + 88))
  {
    int v4 = **(_DWORD **)(result + 96);
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), result = *(void *)(a1 + 40), v5))
      {
        LogPrintF();
        uint64_t result = *(void *)(a1 + 40);
      }
    }

    if (!*(void *)(result + 80))
    {
      uint64_t v6 = NSErrorF_safe();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;

      uint64_t result = *(void *)(a1 + 40);
    }

    return [(id)result _run];
  }

  return result;
}

uint64_t __41__SKStepWiFiSetupClientLegacy_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 48) = 1;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[12];
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(_DWORD ***)(v2 + 32);
      }
    }

    [v3 _invalidateCore];
    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

uint64_t __39__SKStepWiFiSetupClientLegacy_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 96);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  *(_BYTE *)(v2 + 32) = 1;
  return [*(id *)(a1 + 32) _run];
}

@end