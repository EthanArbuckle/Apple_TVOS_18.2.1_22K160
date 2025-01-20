@interface SKStepWiFiSetupServerCW
- (CUMessaging)skMessaging;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepWiFiSetupServerCW)init;
- (id)skCompletionHandler;
- (void)_activate;
- (void)_completeWithError:(id)a3;
- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4;
- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4;
- (void)_handleRequestWiFiSetup:(id)a3 responseHandler:(id)a4;
- (void)_invalidated;
- (void)_run;
- (void)_runInternetReachabilityStart;
- (void)_runJoinStart:(int)a3;
- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5;
- (void)_runScanStart:(int)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepWiFiSetupServerCW

- (SKStepWiFiSetupServerCW)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKStepWiFiSetupServerCW;
  v2 = -[SKStepWiFiSetupServerCW init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiSetupServerCW;
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
  v4.super_class = (Class)&OBJC_CLASS___SKStepWiFiSetupServerCW;
  -[SKStepWiFiSetupServerCW dealloc](&v4, sel_dealloc);
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
  block[2] = __35__SKStepWiFiSetupServerCW_activate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  self->_startTicks = mach_absolute_time();
  skMessaging = self->_skMessaging;
  if (skMessaging)
  {
    self->_internetReachabilityEnabled = 1;
    uint64_t v4 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke;
    v12[3] = &unk_18A2822E8;
    v12[4] = skMessaging;
    v12[5] = self;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_2;
    v11[3] = &unk_18A282310;
    v11[4] = skMessaging;
    v11[5] = self;
    v5 = skMessaging;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:]( v5,  "registerRequestID:options:requestHandler:completionHandler:",  @"_bjTS",  0LL,  v12,  v11);
    v9[5] = self;
    v10[0] = v4;
    v10[1] = 3221225472LL;
    v10[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_3;
    v10[3] = &unk_18A2822E8;
    v10[4] = v5;
    v10[5] = self;
    v9[0] = v4;
    v9[1] = 3221225472LL;
    v9[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_4;
    v9[3] = &unk_18A282310;
    v9[4] = v5;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:]( v5,  "registerRequestID:options:requestHandler:completionHandler:",  @"_bjTD",  0LL,  v10,  v9);
    v7[5] = self;
    v8[0] = v4;
    v8[1] = 3221225472LL;
    v8[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_5;
    v8[3] = &unk_18A2822E8;
    v8[4] = v5;
    v8[5] = self;
    v7[0] = v4;
    v7[1] = 3221225472LL;
    v7[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_6;
    v7[3] = &unk_18A282310;
    v7[4] = v5;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:]( v5,  "registerRequestID:options:requestHandler:completionHandler:",  @"_wiSU",  0LL,  v8,  v7);
  }

  else
  {
    NSErrorF_safe();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SKStepWiFiSetupServerCW _completeWithError:](self, "_completeWithError:", v6);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__SKStepWiFiSetupServerCW_invalidate__block_invoke;
  block[3] = &unk_18A2822C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v6 = (void (**)(id, void *))MEMORY[0x1895CC3E8](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0LL;

    if (v6)
    {
      NSErrorF_safe();
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v4);
    }

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
  }

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  self->_runState = 0;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_metricTotalSeconds = v5;
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  v7 = (void (**)(void, void, void, void, void))MEMORY[0x1895CC3E8](self->_responseHandler);
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = 0LL;

  if (v7)
  {
    if (v4) {
      uint64_t v9 = 0LL;
    }
    else {
      uint64_t v9 = MEMORY[0x189604A60];
    }
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __46__SKStepWiFiSetupServerCW__completeWithError___block_invoke;
    v11[3] = &unk_18A282310;
    v11[4] = self;
    id v12 = v4;
    ((void (**)(void, uint64_t, void, id, void *))v7)[2](v7, v9, 0LL, v12, v11);
  }
}

- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
    id v10 = objc_alloc_init(MEMORY[0x18960ED18]);
    objc_storeStrong((id *)&self->_bonjourAdvertiser, v10);
    [v10 setDispatchQueue:self->_dispatchQueue];
    [v10 setDomain:@"local."];
    [v10 setLabel:@"WiFiSetup"];
    [v10 setName:v9];
    [v10 setPort:9];
    [v10 setServiceType:@"_bonjourtest._tcp"];
    v22 = @"bjID";
    v23[0] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setTxtDictionary:v11];

    [v10 activate];
    bonjourTimeoutTimer = self->_bonjourTimeoutTimer;
    if (bonjourTimeoutTimer)
    {
      v13 = bonjourTimeoutTimer;
      dispatch_source_cancel(v13);
      v14 = self->_bonjourTimeoutTimer;
      self->_bonjourTimeoutTimer = 0LL;
    }

    v15 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    v16 = self->_bonjourTimeoutTimer;
    self->_bonjourTimeoutTimer = v15;
    v17 = v15;

    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __74__SKStepWiFiSetupServerCW__handleRequestBonjourTestStart_responseHandler___block_invoke_2;
    handler[3] = &unk_18A2820C0;
    handler[4] = v17;
    handler[5] = self;
    dispatch_source_set_event_handler(v17, handler);
    CUDispatchTimerSet();
    dispatch_activate(v17);
    (*((void (**)(id, void, void, void, void *))v7 + 2))( v7,  MEMORY[0x189604A60],  0LL,  0LL,  &__block_literal_global_36);
  }

  else
  {
    NSErrorWithOSStatusF();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    int v18 = self->_ucat->var0;
    if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    (*((void (**)(id, void, void, id, void *))v7 + 2))(v7, 0LL, 0LL, v10, &__block_literal_global_27);
  }
}

- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate", v12);
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0LL;

  bonjourTimeoutTimer = self->_bonjourTimeoutTimer;
  if (bonjourTimeoutTimer)
  {
    id v10 = bonjourTimeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_bonjourTimeoutTimer;
    self->_bonjourTimeoutTimer = 0LL;
  }

  (*((void (**)(id, void, void, void, void *))v6 + 2))( v6,  MEMORY[0x189604A60],  0LL,  0LL,  &__block_literal_global_38);
}

- (void)_handleRequestWiFiSetup:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = __Block_byref_object_copy__427;
  v35 = __Block_byref_object_dispose__428;
  id v36 = 0LL;
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __67__SKStepWiFiSetupServerCW__handleRequestWiFiSetup_responseHandler___block_invoke;
  v28[3] = &unk_18A281F78;
  v30 = &v31;
  v28[4] = self;
  id v8 = v7;
  id v29 = v8;
  uint64_t v9 = (void (**)(void))MEMORY[0x1895CC3E8](v28);
  if (self->_runState) {
    goto LABEL_9;
  }
  self->_wifiChannel = CFDictionaryGetInt64Ranged();
  self->_wifiDirected = CFDictionaryGetInt64() != 0;
  [v6 objectForKeyedSubscript:@"_wiEC"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id wifiEAPConfig = self->_wifiEAPConfig;
  self->_id wifiEAPConfig = v10;

  [v6 objectForKeyedSubscript:@"_wiET"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id wifiEAPTrustExceptions = self->_wifiEAPTrustExceptions;
  self->_id wifiEAPTrustExceptions = v12;

  self->_wifiHomeNetwork = CFDictionaryGetInt64() != 0;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiPassword = self->_wifiPassword;
  self->_wifiPassword = v14;

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  wifiPSK = self->_wifiPSK;
  self->_wifiPSK = v16;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  int v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = self->_wifiPassword;
  self->_wifiPassword = v18;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiSSID = self->_wifiSSID;
  self->_wifiSSID = v20;

  if (!self->_wifiSSID)
  {
LABEL_9:
    uint64_t v26 = NSErrorF_safe();
    v27 = (void *)v32[5];
    v32[5] = v26;
  }

  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObject();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    v24 = (void *)MEMORY[0x1895CC3E8](v8);
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = v24;

    -[SKStepWiFiSetupServerCW _run](self, "_run");
  }

  v9[2](v9);

  _Block_object_dispose(&v31, 8);
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unint64_t runState = self->_runState;
      switch((int)runState)
      {
        case 0:
          if (self->_responseHandler)
          {
            if (self->_wifiChannel < 1) {
              goto LABEL_33;
            }
            int v4 = 11;
            goto LABEL_39;
          }

          goto LABEL_40;
        case 3:
          stepError = self->_stepError;
          if (!stepError)
          {
            NSErrorF_safe();
            id v6 = (NSError *)objc_claimAutoreleasedReturnValue();
            id v7 = self->_stepError;
            self->_stepError = v6;

            stepError = self->_stepError;
          }

          id v8 = self;
          goto LABEL_11;
        case 4:
          id v8 = self;
          stepError = 0LL;
LABEL_11:
          -[SKStepWiFiSetupServerCW _completeWithError:](v8, "_completeWithError:", stepError, v24);
          goto LABEL_40;
        case 11:
          self->_unint64_t runState = 12;
          uint64_t wifiChannel = self->_wifiChannel;
          id v10 = self;
          goto LABEL_20;
        case 12:
          if (self->_scanResult)
          {
            int v4 = 13;
            goto LABEL_39;
          }

          if (self->_stepDone) {
            goto LABEL_33;
          }
          int var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_40;
          }
          if (var0 == -1) {
            goto LABEL_74;
          }
          uint64_t v14 = 12LL;
          goto LABEL_70;
        case 13:
          self->_unint64_t runState = 14;
          uint64_t v11 = self->_wifiChannel;
          id v12 = self;
          goto LABEL_24;
        case 14:
          if (self->_stepDone)
          {
            if (!self->_stepError) {
              goto LABEL_27;
            }
LABEL_33:
            int v4 = 15;
            goto LABEL_39;
          }

          int v13 = self->_ucat->var0;
          if (v13 > 30) {
            goto LABEL_40;
          }
          if (v13 != -1)
          {
            uint64_t v14 = 14LL;
            goto LABEL_70;
          }

          goto LABEL_74;
        case 15:
          self->_unint64_t runState = 16;
          id v10 = self;
          uint64_t wifiChannel = 0LL;
LABEL_20:
          -[SKStepWiFiSetupServerCW _runScanStart:](v10, "_runScanStart:", wifiChannel, v24);
          goto LABEL_40;
        case 16:
          if (self->_scanResult)
          {
            int v4 = 17;
            goto LABEL_39;
          }

          if (self->_stepDone) {
            goto LABEL_38;
          }
          int v22 = self->_ucat->var0;
          if (v22 > 30) {
            goto LABEL_40;
          }
          if (v22 == -1) {
            goto LABEL_74;
          }
          uint64_t v14 = 16LL;
          goto LABEL_70;
        case 17:
          self->_unint64_t runState = 18;
          id v12 = self;
          uint64_t v11 = 0LL;
LABEL_24:
          -[SKStepWiFiSetupServerCW _runJoinStart:](v12, "_runJoinStart:", v11, v24, v25);
          goto LABEL_40;
        case 18:
          if (self->_stepDone)
          {
            if (self->_stepError) {
              goto LABEL_38;
            }
LABEL_27:
            int v4 = 19;
            goto LABEL_39;
          }

          int v19 = self->_ucat->var0;
          if (v19 > 30) {
            goto LABEL_40;
          }
          if (v19 != -1)
          {
            uint64_t v14 = 18LL;
            goto LABEL_70;
          }

          goto LABEL_74;
        case 19:
          self->_unint64_t runState = 20;
          -[SKStepWiFiSetupServerCW _runInternetReachabilityStart](self, "_runInternetReachabilityStart");
          goto LABEL_40;
        case 20:
          if (!self->_stepDone)
          {
            int v20 = self->_ucat->var0;
            if (v20 > 30) {
              goto LABEL_40;
            }
            if (v20 != -1)
            {
              uint64_t v14 = 20LL;
              goto LABEL_70;
            }

- (void)_runScanStart:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v27[1] = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__427;
  v25 = __Block_byref_object_dispose__428;
  id v26 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke;
  v19[3] = &unk_18A281FA0;
  v19[4] = self;
  v19[5] = &v21;
  int v20 = a3;
  id v6 = (void (**)(void))MEMORY[0x1895CC3E8](v19, a2);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = v3;
    LogPrintF();
  }

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  scanResult = self->_scanResult;
  self->_scanResult = 0LL;

  id v10 = objc_alloc_init(MEMORY[0x18960F058]);
  if ((int)v3 >= 1)
  {
    id v11 = objc_alloc_init(MEMORY[0x18960F038]);
    [v11 setChannel:v3];
    [v11 setFlags:28];
    v27[0] = v11;
    [MEMORY[0x189603F18] arrayWithObjects:v27 count:1];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setChannels:v12];
  }

  int v13 = self->_wifiSSID;
  if (v13)
  {
    [v10 setSSID:v13];
    uint64_t v14 = self->_wifiInterface;
    if (!v14)
    {
      uint64_t v14 = (CWFInterface *)objc_alloc_init(MEMORY[0x18960F040]);
      objc_storeStrong((id *)&self->_wifiInterface, v14);
      -[CWFInterface activate](v14, "activate");
    }

    v17[0] = v5;
    v17[1] = 3221225472LL;
    v17[2] = __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke_2;
    v17[3] = &unk_18A2815E8;
    v17[4] = self;
    int v18 = v3;
    -[CWFInterface performScanWithParameters:reply:](v14, "performScanWithParameters:reply:", v10, v17, v16);
  }

  else
  {
    uint64_t v15 = NSErrorF_safe();
    uint64_t v14 = (CWFInterface *)v22[5];
    v22[5] = v15;
  }

  v6[2](v6);
  _Block_object_dispose(&v21, 8);
}

- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5
{
  id v13 = a3;
  id v7 = (NSError *)a4;
  [v13 firstObject];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int var0 = self->_ucat->var0;
  if (!v7)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [v13 count];
      LogPrintF();
    }

    id v11 = v8;
    scanResult = self->_scanResult;
    self->_scanResult = v11;
    goto LABEL_12;
  }

  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    scanResult = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_12:
  }

  self->_stepDone = 1;
  stepError = self->_stepError;
  self->_stepError = v7;

  -[SKStepWiFiSetupServerCW _run](self, "_run");
}

- (void)_runJoinStart:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = __Block_byref_object_copy__427;
  v35 = __Block_byref_object_dispose__428;
  id v36 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke;
  v29[3] = &unk_18A281FA0;
  v29[4] = self;
  v29[5] = &v31;
  int v30 = a3;
  id v6 = (void (**)(void))MEMORY[0x1895CC3E8](v29, a2);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = CUPrintNSObject();
    uint64_t v9 = (void *)v8;
    id v10 = "yes";
    if (self->_wifiEAPConfig) {
      id v11 = "yes";
    }
    else {
      id v11 = "no";
    }
    if (self->_wifiEAPTrustExceptions) {
      id v12 = "yes";
    }
    else {
      id v12 = "no";
    }
    if (self->_wifiPassword) {
      id v13 = "yes";
    }
    else {
      id v13 = "no";
    }
    if (self->_wifiPSK) {
      uint64_t v14 = "yes";
    }
    else {
      uint64_t v14 = "no";
    }
    if (!self->_wifiHomeNetwork) {
      id v10 = "no";
    }
    v25 = v14;
    id v26 = v10;
    uint64_t v23 = v12;
    v24 = v13;
    uint64_t v21 = v3;
    int v22 = v11;
    uint64_t v20 = v8;
    LogPrintF();
  }

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  uint64_t v16 = self->_scanResult;
  if (v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x18960F028]);
    [v17 setScanResult:v16];
    [v17 setPassword:self->_wifiPassword];
    int v18 = self->_wifiInterface;
    if (!v18)
    {
      int v18 = (CWFInterface *)objc_alloc_init(MEMORY[0x18960F040]);
      objc_storeStrong((id *)&self->_wifiInterface, v18);
      -[CWFInterface activate](v18, "activate");
    }

    v27[0] = v5;
    v27[1] = 3221225472LL;
    void v27[2] = __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke_2;
    v27[3] = &unk_18A281610;
    v27[4] = self;
    int v28 = v3;
    -[CWFInterface associateWithParameters:reply:]( v18,  "associateWithParameters:reply:",  v17,  v27,  v20,  v21,  v22,  v23,  v24,  v25,  v26);
  }

  else
  {
    uint64_t v19 = NSErrorF_safe();
    id v17 = (id)v32[5];
    v32[5] = v19;
  }

  v6[2](v6);
  _Block_object_dispose(&v31, 8);
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
    uint64_t v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x18960ED98]);
    internetReachabilityMonitor = self->_internetReachabilityMonitor;
    self->_internetReachabilityMonitor = v5;
    id v7 = v5;

    -[CUReachabilityMonitor setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
    -[CUReachabilityMonitor setTimeout:](v7, "setTimeout:", 20.0);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __56__SKStepWiFiSetupServerCW__runInternetReachabilityStart__block_invoke;
    v9[3] = &unk_18A282310;
    v9[4] = v7;
    v9[5] = self;
    -[CUReachabilityMonitor setCompletionHandler:](v7, "setCompletionHandler:", v9);
    -[CUReachabilityMonitor activate](v7, "activate");
  }

  else
  {
    self->_stepDone = 1;
    uint64_t v8 = self->_stepError;
    self->_stepError = 0LL;
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

- (void).cxx_destruct
{
}

void __56__SKStepWiFiSetupServerCW__runInternetReachabilityStart__block_invoke(uint64_t a1, void *a2)
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
      uint64_t v8 = *(void **)(v7 + 104);
      *(void *)(v7 + 104) = v6;

      int v9 = **(_DWORD **)(*(void *)(a1 + 40) + 112LL);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }

    else
    {
      int v10 = **(_DWORD **)(*(void *)(a1 + 40) + 112LL);
    }

    *(_BYTE *)(*(void *)(a1 + 40) + 96LL) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    id v3 = v12;
  }
}

void __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 112);
    if (v3 <= 90)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
      {
        CUPrintNSError();
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }

    *(_BYTE *)(v2 + 96) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104LL), *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }

void __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 48))
  {
    int v6 = **(_DWORD **)(v5 + 112);
    id v8 = v4;
    if (v4)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }

    else if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 96LL) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104LL), a2);
    [*(id *)(a1 + 32) _run];
    id v4 = v8;
  }
}

void __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 112);
    if (v3 <= 90)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
      {
        CUPrintNSError();
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }

    *(_BYTE *)(v2 + 96) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104LL), *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }

_BYTE *__41__SKStepWiFiSetupServerCW__runScanStart___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(_BYTE **)(a1 + 32);
  if (!result[48]) {
    return (_BYTE *)[result _runScanResults:a3 error:a2 channel:*(unsigned int *)(a1 + 40)];
  }
  return result;
}

uint64_t __67__SKStepWiFiSetupServerCW__handleRequestWiFiSetup_responseHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 112LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

void __74__SKStepWiFiSetupServerCW__handleRequestBonjourTestStart_responseHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v1 + 24))
  {
    if (v2)
    {
      int v4 = v2;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = 0LL;

      uint64_t v1 = *(void *)(a1 + 40);
    }

    int v7 = **(_DWORD **)(v1 + 112);
    if (v7 <= 90)
    {
      if (v7 != -1 || (int v8 = _LogCategory_Initialize(), v1 = *(void *)(a1 + 40), v8))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(a1 + 40);
      }
    }

    [*(id *)(v1 + 16) invalidate];
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0LL;
  }

void __46__SKStepWiFiSetupServerCW__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = (void (**)(void, void))MEMORY[0x1895CC3E8](*(void *)(*(void *)(a1 + 32) + 200LL));
  if (v3)
  {
    if (*(void *)(a1 + 40)) {
      id v4 = *(id *)(a1 + 40);
    }
    else {
      id v4 = v5;
    }
    ((void (**)(void, id))v3)[2](v3, v4);
  }
}

void __37__SKStepWiFiSetupServerCW_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 112);
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }

    id v20 = (id)MEMORY[0x1895CC3E8](*(void *)(v3 + 64));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = 0LL;

    if (v20)
    {
      NSErrorF_safe();
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void *, void *))v20 + 2))( v20,  0LL,  0LL,  v8,  &__block_literal_global_474);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0LL;

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 24);
    if (v12)
    {
      id v13 = v12;
      dispatch_source_cancel(v13);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(v14 + 24);
      *(void *)(v14 + 24) = 0LL;

      uint64_t v11 = *(void *)(a1 + 32);
    }

    [*(id *)(v11 + 40) invalidate];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0LL;

    [*(id *)(*(void *)(a1 + 32) + 208) deregisterRequestID:@"_bjTS" completionHandler:&__block_literal_global_16];
    [*(id *)(*(void *)(a1 + 32) + 208) deregisterRequestID:@"_bjTD" completionHandler:&__block_literal_global_17];
    [*(id *)(*(void *)(a1 + 32) + 208) deregisterRequestID:@"_wiSU" completionHandler:&__block_literal_global_18];
    [*(id *)(*(void *)(a1 + 32) + 152) invalidate];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(v18 + 152);
    *(void *)(v18 + 152) = 0LL;

    [*(id *)(a1 + 32) _invalidated];
  }

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[26]) {
    return (void *)[result _handleRequestBonjourTestStart:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_2(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    uint64_t result = (void *)result[5];
    if (v2 == result[26]) {
      return (void *)[result _completeWithError:a2];
    }
  }

  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[26]) {
    return (void *)[result _handleRequestBonjourTestDone:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_4(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    uint64_t result = (void *)result[5];
    if (v2 == result[26]) {
      return (void *)[result _completeWithError:a2];
    }
  }

  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[26]) {
    return (void *)[result _handleRequestWiFiSetup:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_6(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    uint64_t result = (void *)result[5];
    if (v2 == result[26]) {
      return (void *)[result _completeWithError:a2];
    }
  }

  return result;
}

uint64_t __35__SKStepWiFiSetupServerCW_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[14];
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(_DWORD ***)(a1 + 32);
    }
  }

  return [v2 _activate];
}

@end