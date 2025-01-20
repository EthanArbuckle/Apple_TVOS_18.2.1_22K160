@interface EasyConfigDevice
+ (BOOL)supportedScanRecord:(id)a3;
+ (id)deviceWithInfo:(id)a3;
+ (id)deviceWithScanRecord:(id)a3;
- (BOOL)pausesAfterApply;
- (BOOL)removed:(id)a3;
- (BOOL)skipPairSetup;
- (BOOL)updated:(id)a3;
- (EasyConfigDevice)init;
- (NSDictionary)configuration;
- (NSString)model;
- (NSString)name;
- (OS_dispatch_queue)dispatchQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)progressHandler;
- (int)_applyConfigStart;
- (int)_configureStart:(id)a3;
- (int)_findDevicePostConfigStart;
- (int)_findDevicePreConfigStart;
- (int)_mfiSAPNext:(HTTPMessagePrivate *)a3;
- (int)_mfiSAPStart;
- (int)_pairSetupNext:(HTTPMessagePrivate *)a3;
- (int)_pairSetupStart;
- (int)_pairVerifyNext:(HTTPMessagePrivate *)a3;
- (int)_pairVerifyStart;
- (int)_setupClient:(id)a3;
- (int)_startBonjourWithTimeout:(int)a3 handler:(id)a4;
- (int)_timeoutTimerStart:(int)a3 block:(id)a4;
- (unint64_t)deviceIdentifier;
- (unint64_t)features;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (void)_applyConfigCompletion:(HTTPMessagePrivate *)a3;
- (void)_findDevicePostConfigEvent:(unsigned int)a3 info:(id)a4;
- (void)_findDevicePreConfigEvent:(unsigned int)a3 info:(id)a4;
- (void)_handleError:(int)a3;
- (void)_logEnded;
- (void)_postConfigCheckCompletion:(HTTPMessagePrivate *)a3;
- (void)_postConfigCheckStart:(id)a3;
- (void)_postNote:(id)a3 info:(id)a4;
- (void)_postProgress:(int)a3 info:(id)a4;
- (void)_postProgress:(int)a3 withResponse:(id)a4;
- (void)_start;
- (void)_stop:(int)a3;
- (void)_trySetupCode:(id)a3;
- (void)dealloc;
- (void)resumePostConfig;
- (void)setConfiguration:(id)a3;
- (void)setDeviceIdentifier:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFeatures:(unint64_t)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingDelegate:(const void *)a3;
- (void)setPausesAfterApply:(BOOL)a3;
- (void)setPostConfigMetrics:(id *)a3;
- (void)setPreConfigMetrics:(id *)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForSetupCodeHandler:(id)a3;
- (void)setSkipPairSetup:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)trySetupCode:(id)a3;
@end

@implementation EasyConfigDevice

- (EasyConfigDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___EasyConfigDevice;
  v2 = -[EasyConfigDevice init](&v7, sel_init);
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create("EasyConfigDevice", 0LL),
        internalQueue = v2->_internalQueue,
        v2->_internalQueue = (OS_dispatch_queue *)v3,
        internalQueue,
        v2->_internalQueue))
  {
    objc_storeStrong((id *)&v2->_userQueue, MEMORY[0x1895F8AE0]);
    v5 = v2;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)dealloc
{
  internalQueue = self->_internalQueue;
  if (internalQueue)
  {
    self->_internalQueue = 0LL;
  }

  userQueue = self->_userQueue;
  if (userQueue)
  {
    self->_userQueue = 0LL;
  }

  scanRecord = self->_scanRecord;
  self->_scanRecord = 0LL;

  airplayBonjourInfo = self->_airplayBonjourInfo;
  self->_airplayBonjourInfo = 0LL;

  raopBonjourInfo = self->_raopBonjourInfo;
  self->_raopBonjourInfo = 0LL;

  mfiConfigBonjourInfo = self->_mfiConfigBonjourInfo;
  self->_mfiConfigBonjourInfo = 0LL;

  hapBonjourInfo = self->_hapBonjourInfo;
  self->_hapBonjourInfo = 0LL;

  model = self->_model;
  self->_model = 0LL;

  name = self->_name;
  self->_name = 0LL;

  configuration = self->_configuration;
  self->_configuration = 0LL;

  configResponse = self->_configResponse;
  self->_configResponse = 0LL;

  id promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_id promptForSetupCodeBlock = 0LL;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0LL;

  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = 0LL;

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___EasyConfigDevice;
  -[EasyConfigDevice dealloc](&v17, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = -[NSDictionary copy](self->_scanRecord, "copy");
  v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = -[NSDictionary copy](self->_airplayBonjourInfo, "copy");
  v8 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v7;

  uint64_t v9 = -[NSDictionary copy](self->_raopBonjourInfo, "copy");
  v10 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v9;

  uint64_t v11 = -[NSDictionary copy](self->_mfiConfigBonjourInfo, "copy");
  v12 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v11;

  uint64_t v13 = -[NSDictionary copy](self->_hapBonjourInfo, "copy");
  v14 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v13;

  *(_DWORD *)(v4 + 104) = self->_configSeed;
  [(id)v4 setDeviceIdentifier:self->_deviceIdentifier];
  *(void *)(v4 + 184) = self->_features;
  [(id)v4 setModel:self->_model];
  [(id)v4 setName:self->_name];
  [(id)v4 setConfiguration:self->_configuration];
  return (id)v4;
}

- (BOOL)updated:(id)a3
{
  id v5 = a3;
  [v5 objectForKey:@"name"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = -[NSString isEqual:](self->_name, "isEqual:", v6);
  if ((v7 & 1) == 0) {
    -[EasyConfigDevice setName:](self, "setName:", v6);
  }
  unint64_t DeviceID = BonjourDevice_GetDeviceID();
  if (DeviceID == self->_deviceIdentifier)
  {
    char v9 = v7 ^ 1;
  }

  else
  {
    self->_deviceIdentifier = DeviceID;
    char v9 = 1;
  }

  [v5 objectForKey:@"serviceType"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v10 isEqual:@"_airplay._tcp."])
  {
    airplayBonjourInfo = self->_airplayBonjourInfo;
    p_airplayBonjourInfo = &self->_airplayBonjourInfo;
    uint64_t v11 = airplayBonjourInfo;
  }

  else if ([v10 isEqual:@"_raop._tcp."])
  {
    raopBonjourInfo = self->_raopBonjourInfo;
    p_airplayBonjourInfo = &self->_raopBonjourInfo;
    uint64_t v11 = raopBonjourInfo;
  }

  else if ([v10 isEqual:@"_mfi-config._tcp."])
  {
    mfiConfigBonjourInfo = self->_mfiConfigBonjourInfo;
    p_airplayBonjourInfo = &self->_mfiConfigBonjourInfo;
    uint64_t v11 = mfiConfigBonjourInfo;
  }

  else
  {
    hapBonjourInfo = self->_hapBonjourInfo;
    p_airplayBonjourInfo = &self->_hapBonjourInfo;
    uint64_t v11 = hapBonjourInfo;
  }

  if ((-[NSDictionary isEqual:](v11, "isEqual:", v5) & 1) == 0)
  {

    objc_storeStrong((id *)p_airplayBonjourInfo, a3);
    char v9 = 1;
  }

- (BOOL)removed:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqual:@"_airplay._tcp."])
  {
    uint64_t v5 = 6LL;
LABEL_9:
    Class v6 = (&self->super.isa)[v5];
    (&self->super.isa)[v5] = 0LL;

    goto LABEL_10;
  }

  if ([v4 isEqual:@"_raop._tcp."])
  {
    uint64_t v5 = 8LL;
    goto LABEL_9;
  }

  if ([v4 isEqual:@"_mfi-config._tcp."])
  {
    uint64_t v5 = 10LL;
    goto LABEL_9;
  }

  if ([v4 isEqual:@"_hap._tcp."])
  {
    uint64_t v5 = 12LL;
    goto LABEL_9;
  }

- (void)start
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__EasyConfigDevice_start__block_invoke;
  block[3] = &unk_18A2F4500;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_start
{
  if (!self->_started)
  {
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    self->_started = 1;
    self->_firstErr = 0;
    self->_configStartTime = CFAbsoluteTimeGetCurrent();
    configResponse = self->_configResponse;
    self->_configResponse = 0LL;

    scanRecord = self->_scanRecord;
    if (scanRecord)
    {
      -[NSDictionary objectForKey:](scanRecord, "objectForKey:", @"IE");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = v5;
      if (v5)
      {
        if ([v5 length])
        {
          id v6 = v6;
          [v6 bytes];
          uint64_t v7 = IEGetVendorSpecific();
          unsigned int v13 = v7;
          if ((_DWORD)v7 || (uint64_t v7 = TLV8Get(), (v13 = v7) != 0))
          {
            uint64_t v8 = v7;
LABEL_23:
            if (gLogCategory_EasyConfigDevice <= 60
              && (gLogCategory_EasyConfigDevice != -1 || (v10 = _LogCategory_Initialize(), uint64_t v8 = v13, v10)))
            {
              uint64_t v12 = v8;
              LogPrintF();
              -[EasyConfigDevice _stop:](self, "_stop:", v13, v12);
            }

            else
            {
              -[EasyConfigDevice _stop:](self, "_stop:", v8, v11);
            }

            goto LABEL_28;
          }

          uint64_t v8 = 4294960553LL;
        }

        else
        {
          uint64_t v8 = 4294960546LL;
        }
      }

      else
      {
        uint64_t v8 = 4294960569LL;
      }
    }

    else
    {
      if (self->_deviceInfo)
      {
        self->_deviceIdentifier = CFDictionaryGetHardwareAddress();
        uint64_t v8 = v13;
        if (v13)
        {
          id v6 = 0LL;
          goto LABEL_23;
        }

        unsigned int Int64 = CFDictionaryGetInt64();
        id v6 = 0LL;
        self->_supportsHAP = (Int64 & 0x20000) != 0;
        self->_supportsHAP2 = (Int64 & 0x40000) != 0;
        self->_supportsMFi = (Int64 & 4) != 0;
        self->_supportsPairSetup = (Int64 & 0x100000) != 0;
        if (((Int64 >> 17) & 1) == 0 && ((Int64 >> 18) & 1) == 0 && ((Int64 >> 2) & 1) == 0 && ((Int64 >> 20) & 1) == 0)
        {
          uint64_t v8 = 4294960562LL;
          goto LABEL_36;
        }

        if (self->_configuration)
        {
          -[EasyConfigDevice _findDevicePreConfigStart](self, "_findDevicePreConfigStart");
          goto LABEL_28;
        }
      }

      else
      {
        id v6 = 0LL;
      }

      uint64_t v8 = 4294960551LL;
    }

- (void)stop
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __24__EasyConfigDevice_stop__block_invoke;
  block[3] = &unk_18A2F4500;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_stop:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v31[1] = *MEMORY[0x1895F89C0];
  BOOL started = self->_started;
  self->_BOOL started = 0;
  if (!self->_firstErr) {
    self->_firstErr = a3;
  }
  if (started)
  {
    -[EasyConfigDevice _logEnded](self, "_logEnded");
    unint64_t v6 = 0x18C740000uLL;
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v25 = v3;
      LogPrintF();
    }

    unint64_t v7 = 0x189607000uLL;
    if ((_DWORD)v3)
    {
      v30 = @"EasyConfigKey_ReasonError";
      uint64_t v8 = (void *)MEMORY[0x189607870];
      uint64_t v9 = *MEMORY[0x189607670];
      uint64_t v10 = (int)v3;
      uint64_t v28 = *MEMORY[0x1896075E0];
      uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v12 = (void *)v11;
      unsigned int v13 = @"?";
      if (v11) {
        unsigned int v13 = (const __CFString *)v11;
      }
      v29 = v13;
      objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1, v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 errorWithDomain:v9 code:(int)v3 userInfo:v14];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v15;
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 2LL, v16);

      unint64_t v7 = 0x189607000LL;
      unint64_t v6 = 0x18C740000LL;
    }

    else
    {
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 2LL, 0LL);
      uint64_t v10 = 0LL;
      uint64_t v9 = *MEMORY[0x189607670];
    }

    objc_msgSend( *(id *)(v7 + 2160),  "errorWithDomain:code:userInfo:",  v9,  v10,  0,  v25,  @"EasyConfigKey_ReasonError");
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EasyConfigDevice _postNote:info:](self, "_postNote:info:", @"EasyConfigDeviceStoppedNotification", v18);

    int v19 = *(_DWORD *)(v6 + 2616);
  }

  if (self->_airplayBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_airplayBrowser);
    self->_airplayBrowser = 0LL;
  }

  if (self->_raopBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_raopBrowser);
    self->_raopBrowser = 0LL;
  }

  if (self->_mfiConfigBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_mfiConfigBrowser);
    self->_mfiConfigBrowser = 0LL;
  }

  if (self->_hapBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_hapBrowser);
    self->_hapBrowser = 0LL;
  }

  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(self->_httpClient);
    self->_httpClient = 0LL;
  }

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v21 = timeoutTimer;
    dispatch_source_cancel(v21);
    v22 = self->_timeoutTimer;
    self->_timeoutTimer = 0LL;
  }

  if (self->_mfiSAP)
  {
    MFiSAP_Delete();
    self->_mfiSAP = 0LL;
  }

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0LL;
  }

  id promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_id promptForSetupCodeBlock = 0LL;
}

- (void)resumePostConfig
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__EasyConfigDevice_resumePostConfig__block_invoke;
  block[3] = &unk_18A2F4500;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)setPairingDelegate:(const void *)a3
{
  if (a3)
  {
    *(_OWORD *)&self->_pairingDelegate.context = *(_OWORD *)a3;
    __int128 v3 = *((_OWORD *)a3 + 1);
    __int128 v4 = *((_OWORD *)a3 + 2);
    __int128 v5 = *((_OWORD *)a3 + 3);
    self->_pairingDelegate.resumeResponse_f = (void *)*((void *)a3 + 8);
    *(_OWORD *)&self->_pairingDelegate.copyIdentity_f = v4;
    *(_OWORD *)&self->_pairingDelegate.savePeer_f = v5;
    *(_OWORD *)&self->_pairingDelegate.hideSetupCode_f = v3;
    BOOL v6 = 1;
  }

  else
  {
    BOOL v6 = 0;
  }

  self->_hasPairingDelegate = v6;
}

- (void)setPreConfigMetrics:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  __int128 v4 = *(_OWORD *)&a3->var8;
  *(_OWORD *)&self->_preConfigMetrics.secondsToGetLinkUpOnSWAP = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_preConfigMetrics.rssiOfSWAP = v4;
  *(_OWORD *)&self->_preConfigMetrics.startTime = v3;
  self->_preConfigMetricsSet = 1;
}

- (void)setPostConfigMetrics:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_postConfigMetrics.secondsToGetLinkUpOnDestination = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_postConfigMetrics.rssiOfDestinationAP = v3;
  self->_postConfigMetricsSet = 1;
}

- (void)setPromptForSetupCodeHandler:(id)a3
{
  __int128 v4 = (void *)MEMORY[0x1895D496C](a3, a2);
  if (v4)
  {
    __int128 v5 = v4;
    id v8 = (id)[v4 copy];
  }

  else
  {
    id v8 = 0LL;
  }

  BOOL v6 = (void *)MEMORY[0x1895D496C](v8);
  id promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_id promptForSetupCodeBlock = v6;
}

- (void)trySetupCode:(id)a3
{
  id v4 = a3;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__EasyConfigDevice_trySetupCode___block_invoke;
  v7[3] = &unk_18A2F4528;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)_trySetupCode:(id)a3
{
  id v5 = a3;
  self->_enterSetupCodeMs = ((CFAbsoluteTimeGetCurrent() - self->_promptForSetupCodeTime) * 1000.0);
  if (!self->_pairingSession)
  {
    uint64_t v4 = 4294960593LL;
LABEL_4:
    -[EasyConfigDevice _handleError:](self, "_handleError:", v4);
    goto LABEL_5;
  }

  [v5 UTF8String];
  uint64_t v4 = PairingSessionSetSetupCode();
  if ((_DWORD)v4) {
    goto LABEL_4;
  }
  uint64_t v4 = -[EasyConfigDevice _pairSetupNext:](self, "_pairSetupNext:", 0LL);
  if ((_DWORD)v4) {
    goto LABEL_4;
  }
LABEL_5:
}

- (int)_findDevicePreConfigStart
{
  self->_state = 1;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = MEMORY[0x1895F87A8];
  self->_findPreConfigStartTime = Current;
  self->_findPreConfigFoundTime = Current;
  v10[0] = v4;
  v10[1] = 3221225472LL;
  v10[2] = __45__EasyConfigDevice__findDevicePreConfigStart__block_invoke;
  v10[3] = &unk_18A2F4550;
  v10[4] = self;
  uint64_t v5 = -[EasyConfigDevice _startBonjourWithTimeout:handler:](self, "_startBonjourWithTimeout:handler:", 20LL, v10);
  if ((_DWORD)v5)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t deviceIdentifier = self->_deviceIdentifier;
      uint64_t v9 = v5;
      LogPrintF();
    }

    -[EasyConfigDevice _handleError:](self, "_handleError:", v5, deviceIdentifier, v9);
  }

  else if (gLogCategory_EasyConfigDevice <= 30 {
         && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  }
  {
    unint64_t v8 = self->_deviceIdentifier;
    LogPrintF();
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 10LL, 0LL, v8);
  }

  else
  {
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 10LL, 0LL, deviceIdentifier);
  }

  return v5;
}

- (void)_findDevicePreConfigEvent:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    && self->_started
    && (self->_airplayBrowser || self->_raopBrowser || self->_mfiConfigBrowser || self->_hapBrowser))
  {
    id v11 = v6;
    BOOL v7 = BonjourDevice_GetDeviceID() == self->_deviceIdentifier;
    id v6 = v11;
    if (v7)
    {
      self->_findPreConfigFoundTime = CFAbsoluteTimeGetCurrent();
      BonjourDevice_Reconfirm();
      if (self->_airplayBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_airplayBrowser);
        self->_airplayBrowser = 0LL;
      }

      if (self->_raopBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_raopBrowser);
        self->_raopBrowser = 0LL;
      }

      if (self->_mfiConfigBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_mfiConfigBrowser);
        self->_mfiConfigBrowser = 0LL;
      }

      if (self->_hapBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_hapBrowser);
        self->_hapBrowser = 0LL;
      }

      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        uint64_t v9 = timeoutTimer;
        dispatch_source_cancel(v9);
        uint64_t v10 = self->_timeoutTimer;
        self->_timeoutTimer = 0LL;
      }

      -[EasyConfigDevice _configureStart:](self, "_configureStart:", v11);
      id v6 = v11;
    }
  }
}

- (int)_configureStart:(id)a3
{
  uint64_t v4 = (const __CFDictionary *)a3;
  self->_state = 2;
  int v5 = gLogCategory_EasyConfigDevice;
  if (gLogCategory_EasyConfigDevice <= 30)
  {
    if (gLogCategory_EasyConfigDevice == -1)
    {
      int v5 = gLogCategory_EasyConfigDevice;
    }

    unint64_t deviceIdentifier = self->_deviceIdentifier;
    else {
      BOOL v7 = ":\n";
    }
    if (gLogCategory_EasyConfigDevice > 20) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize() != 0;
    }
    unint64_t v21 = deviceIdentifier;
    uint64_t v22 = (uint64_t)v7;
    BOOL v23 = v8;
    v24 = v4;
    LogPrintF();
  }

- (int)_mfiSAPStart
{
  self->_securityStartTime = CFAbsoluteTimeGetCurrent();
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }

  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 20LL, 0LL, deviceIdentifier);
  if (self->_mfiSAP)
  {
    MFiSAP_Delete();
    self->_mfiSAP = 0LL;
  }

  uint64_t v3 = MFiSAP_Create();
  if ((_DWORD)v3
    || (uint64_t v3 = -[EasyConfigDevice _mfiSAPNext:](self, "_mfiSAPNext:", 0LL), (_DWORD)v3)
    || (v9[0] = MEMORY[0x1895F87A8],
        v9[1] = 3221225472LL,
        v9[2] = __32__EasyConfigDevice__mfiSAPStart__block_invoke,
        v9[3] = &unk_18A2F4500,
        v9[4] = self,
        uint64_t v3 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20LL, v9),
        (_DWORD)v3))
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v7 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v3, v7, v3);
    }

    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v3, v6, v8);
    }
  }

  return v3;
}

- (int)_mfiSAPNext:(HTTPMessagePrivate *)a3
{
  if (!a3) {
    goto LABEL_4;
  }
  uint64_t var21 = a3->var21;
  if ((_DWORD)var21) {
    goto LABEL_8;
  }
  int var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    uint64_t var21 = (var12 + 200000);
  }

  else
  {
LABEL_4:
    uint64_t var21 = MFiSAP_Exchange();
    if (!(_DWORD)var21)
    {
      uint64_t var21 = HTTPMessageCreate();
      if (!(_DWORD)var21)
      {
        HTTPHeader_InitRequest();
        HTTPHeader_SetField();
        uint64_t var21 = HTTPMessageSetBody();
        if (!(_DWORD)var21)
        {
          HTTPMessageSetCompletionBlock();
          uint64_t var21 = HTTPClientSendMessage();
        }
      }
    }
  }

- (int)_pairSetupStart
{
  self->_securityStartTime = CFAbsoluteTimeGetCurrent();
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }

  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 20LL, 0LL, deviceIdentifier);
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0LL;
  }

  uint64_t v4 = PairingSessionCreate();
  if ((_DWORD)v4) {
    goto LABEL_23;
  }
  if (self->_supportsHAP || self->_supportsHAP2 || self->_supportsPairSetup)
  {
    LODWORD(v7) = 1;
    PairingSessionSetKeychainInfo();
  }

  if (self->_pairSetupFlags) {
    PairingSessionSetFlags();
  }
  PairingSessionSetLogging();
  uint64_t v4 = -[EasyConfigDevice _pairSetupNext:](self, "_pairSetupNext:", 0LL);
  if ((_DWORD)v4)
  {
LABEL_23:
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v8 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v8, v4);
    }

    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v7, v9);
    }
  }

  return v4;
}

- (int)_pairSetupNext:(HTTPMessagePrivate *)a3
{
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  char v14 = 0;
  CFTypeRef v13 = 0LL;
  if (!a3) {
    goto LABEL_4;
  }
  uint64_t var21 = a3->var21;
  if ((_DWORD)var21) {
    goto LABEL_10;
  }
  int var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    uint64_t var21 = (var12 + 200000);
  }

  else
  {
LABEL_4:
    unsigned int v6 = PairingSessionExchange();
    if (v6)
    {
      if (v6 == -6771) {
        uint64_t var21 = 0LL;
      }
      else {
        uint64_t var21 = v6;
      }
    }

    else
    {
      uint64_t var21 = HTTPMessageCreate();
      if (!(_DWORD)var21)
      {
        uint64_t v9 = "pair-setup";
        HTTPHeader_InitRequestF();
        uint64_t var21 = HTTPMessageSetBody();
        if (!(_DWORD)var21)
        {
          uint64_t v7 = MEMORY[0x1895F87A8];
          v12[5] = MEMORY[0x1895F87A8];
          v12[6] = 3221225472LL;
          v12[7] = __35__EasyConfigDevice__pairSetupNext___block_invoke;
          v12[8] = &unk_18A2F4578;
          v12[9] = self;
          HTTPMessageSetCompletionBlock();
          uint64_t var21 = HTTPClientSendMessage();
          if (!(_DWORD)var21)
          {
            if (self->_timeoutTimer)
            {
              uint64_t var21 = 0LL;
            }

            else
            {
              v12[0] = v7;
              v12[1] = 3221225472LL;
              v12[2] = __35__EasyConfigDevice__pairSetupNext___block_invoke_2;
              v12[3] = &unk_18A2F4500;
              v12[4] = self;
              uint64_t var21 = -[EasyConfigDevice _timeoutTimerStart:block:]( self,  "_timeoutTimerStart:block:",  20LL,  v12,  "pair-setup");
            }
          }
        }
      }
    }
  }

- (int)_pairVerifyStart
{
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0LL;
  }

  __int128 v10 = 0u;
  memset(v11, 0, sizeof(v11));
  void v9[5] = self;
  if (self->_hasPairingDelegate)
  {
    *(_OWORD *)((char *)v11 + 8) = *(_OWORD *)&self->_pairingDelegate.copyIdentity_f;
    *((void *)&v11[1] + 1) = self->_pairingDelegate.savePeer_f;
  }

  uint64_t v4 = PairingSessionCreate();
  if ((_DWORD)v4) {
    goto LABEL_26;
  }
  if (self->_supportsHAP || self->_supportsHAP2 || self->_supportsPairSetup)
  {
    LODWORD(deviceIdentifier) = 1;
    PairingSessionSetKeychainInfo();
  }

  if (self->_pairVerifyFlags) {
    PairingSessionSetFlags();
  }
  PairingSessionSetLogging();
  uint64_t v4 = -[EasyConfigDevice _pairVerifyNext:](self, "_pairVerifyNext:", 0LL);
  if ((_DWORD)v4
    || (v9[0] = MEMORY[0x1895F87A8],
        v9[1] = 3221225472LL,
        v9[2] = __36__EasyConfigDevice__pairVerifyStart__block_invoke,
        v9[3] = &unk_18A2F4500,
        v9[4] = self,
        uint64_t v4 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20LL, v9),
        (_DWORD)v4))
  {
LABEL_26:
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v7 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v7, v4);
    }

    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, deviceIdentifier, v8);
    }
  }

  return v4;
}

- (int)_pairVerifyNext:(HTTPMessagePrivate *)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a3) {
    goto LABEL_4;
  }
  uint64_t var21 = a3->var21;
  if ((_DWORD)var21) {
    goto LABEL_5;
  }
  int var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    uint64_t var21 = (var12 + 200000);
  }

  else
  {
LABEL_4:
    uint64_t var21 = PairingSessionExchange();
    if (!(_DWORD)var21)
    {
      uint64_t var21 = HTTPMessageCreate();
      if (!(_DWORD)var21)
      {
        unint64_t v7 = "pair-verify";
        HTTPHeader_InitRequestF();
        uint64_t var21 = HTTPMessageSetBody();
        if (!(_DWORD)var21)
        {
          HTTPMessageSetCompletionBlock();
          uint64_t var21 = HTTPClientSendMessage();
        }
      }
    }
  }

- (int)_applyConfigStart
{
  int v18 = 0LL;
  self->_applyConfigStartTime = CFAbsoluteTimeGetCurrent();
  if (self->_supportsTLV)
  {
    uint64_t v3 = EasyConfigCreateTLVfromDictionary((const __CFDictionary *)self->_configuration, (uint64_t)&v17, &v19);
    id v4 = 0LL;
    if (v19)
    {
      int v5 = (void *)v3;
      goto LABEL_8;
    }

    unint64_t v7 = "application/x-tlv8";
    int v5 = (void *)v3;
  }

  else
  {
    [MEMORY[0x1896079E8] dataWithPropertyList:self->_configuration format:200 options:0 error:0];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v4 = 0LL;
      unsigned int v19 = -6732;
      goto LABEL_10;
    }

    id v4 = v6;
    [v4 bytes];
    int v5 = 0LL;
    uint64_t v17 = [v4 length];
    unint64_t v7 = "application/octet-stream";
  }

  unsigned int v19 = HTTPMessageCreate();
  if (!v19)
  {
    HTTPHeader_InitRequest();
    HTTPHeader_SetField();
    unint64_t deviceIdentifier = (unint64_t)v7;
    HTTPHeader_SetField();
    if (self->_mfiSAP)
    {
      unsigned int v19 = HTTPMessageSetBodyLength();
      if (v19) {
        goto LABEL_8;
      }
      unsigned int v10 = MFiSAP_Encrypt();
    }

    else
    {
      unsigned int v10 = HTTPMessageSetBody();
    }

    unsigned int v19 = v10;
    if (!v10)
    {
      uint64_t v13 = MEMORY[0x1895F87A8];
      v16[5] = MEMORY[0x1895F87A8];
      v16[6] = 3221225472LL;
      v16[7] = __37__EasyConfigDevice__applyConfigStart__block_invoke;
      v16[8] = &unk_18A2F4578;
      v16[9] = self;
      HTTPMessageSetCompletionBlock();
      v18[8512] = 1;
      unsigned int v19 = HTTPClientSendMessage();
      if (!v19)
      {
        v16[0] = v13;
        v16[1] = 3221225472LL;
        v16[2] = __37__EasyConfigDevice__applyConfigStart__block_invoke_2;
        v16[3] = &unk_18A2F4500;
        v16[4] = self;
        unsigned int v19 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20LL, v16, v7);
        if (!v19)
        {
          if (gLogCategory_EasyConfigDevice <= 30
            && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
          {
            unint64_t deviceIdentifier = self->_deviceIdentifier;
            LogPrintF();
          }

          -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 30LL, 0LL, deviceIdentifier);
        }
      }
    }
  }

- (void)_applyConfigCompletion:(HTTPMessagePrivate *)a3
{
  uint64_t var21 = a3->var21;
  if ((_DWORD)var21)
  {
    unsigned int v18 = var21;
  }

  else
  {
    int var12 = a3->var2.var12;
    if ((var12 - 200) >= 0x64)
    {
      int v13 = var12 + 196608;
      uint64_t var21 = (v13 + 3392);
      unsigned int v18 = v13 + 3392;
      if (v13 == -3392) {
        return;
      }
    }

    else if (!self->_mfiSAP || (var21 = MFiSAP_Decrypt(), (unsigned int v18 = var21) == 0))
    {
      CFDictionaryGetTypeID();
      DictionaryFromTLV = (NSDictionary *)CFCreateWithPlistBytes();
      if (!DictionaryFromTLV)
      {
        DictionaryFromTLV = (NSDictionary *)EasyConfigCreateDictionaryFromTLV((uint64_t)a3->var6, a3->var7, (int *)&v18);
        if (!DictionaryFromTLV) {
          goto LABEL_20;
        }
      }

      configResponse = self->_configResponse;
      self->_configResponse = DictionaryFromTLV;

      self->_applyConfigFinishTime = CFAbsoluteTimeGetCurrent();
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        unint64_t deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }

      -[EasyConfigDevice _postProgress:withResponse:]( self,  "_postProgress:withResponse:",  40LL,  self->_configResponse,  deviceIdentifier);
      if (self->_pausesAfterApply)
      {
        timeoutTimer = self->_timeoutTimer;
        if (timeoutTimer)
        {
          unsigned int v10 = timeoutTimer;
          dispatch_source_cancel(v10);
          int v11 = self->_timeoutTimer;
          self->_timeoutTimer = 0LL;
        }

        if (gLogCategory_EasyConfigDevice <= 30
          && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

- (int)_findDevicePostConfigStart
{
  self->_state = 3;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = MEMORY[0x1895F87A8];
  self->_findPostConfigStartTime = Current;
  self->_findPostConfigFoundTime = Current;
  v10[0] = v4;
  v10[1] = 3221225472LL;
  v10[2] = __46__EasyConfigDevice__findDevicePostConfigStart__block_invoke;
  v10[3] = &unk_18A2F4550;
  v10[4] = self;
  uint64_t v5 = -[EasyConfigDevice _startBonjourWithTimeout:handler:](self, "_startBonjourWithTimeout:handler:", 60LL, v10);
  if ((_DWORD)v5)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t deviceIdentifier = self->_deviceIdentifier;
      uint64_t v9 = v5;
      LogPrintF();
    }

    -[EasyConfigDevice _handleError:](self, "_handleError:", v5, deviceIdentifier, v9);
  }

  else if (gLogCategory_EasyConfigDevice <= 30 {
         && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  }
  {
    unint64_t v8 = self->_deviceIdentifier;
    LogPrintF();
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 50LL, 0LL, v8);
  }

  else
  {
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 50LL, 0LL, deviceIdentifier);
  }

  return v5;
}

- (void)_findDevicePostConfigEvent:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  if (a3 != 1
    || !self->_started
    || !self->_airplayBrowser && !self->_raopBrowser && !self->_mfiConfigBrowser && !self->_hapBrowser
    || BonjourDevice_GetDeviceID() != self->_deviceIdentifier)
  {
    goto LABEL_37;
  }

  uint64_t Int64 = BonjourDevice_GetInt64();
  if (v16)
  {
    BonjourDevice_GetInt64();
    uint64_t Int64 = BonjourDevice_GetInt64();
  }

  uint64_t v8 = Int64;
  if (self->_configSeed != (_DWORD)Int64) {
    goto LABEL_24;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v9 caseInsensitiveCompare:@"_hap._tcp."])
  {
    uint64_t v10 = BonjourDevice_GetInt64();
    if ((v10 & 2) == 0)
    {
      if (gLogCategory_EasyConfigDevice <= 40
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        uint64_t v13 = v8;
        uint64_t v15 = v10;
        unint64_t deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }

LABEL_24:
      self->_findPostConfigFoundTime = CFAbsoluteTimeGetCurrent();
      if (self->_airplayBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_airplayBrowser);
        self->_airplayBrowser = 0LL;
      }

      if (self->_raopBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_raopBrowser);
        self->_raopBrowser = 0LL;
      }

      if (self->_mfiConfigBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_mfiConfigBrowser);
        self->_mfiConfigBrowser = 0LL;
      }

      if (self->_hapBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_hapBrowser);
        self->_hapBrowser = 0LL;
      }

      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        uint64_t configSeed = self->_configSeed;
        unint64_t v12 = self->_deviceIdentifier;
        LogPrintF();
        -[EasyConfigDevice _postConfigCheckStart:](self, "_postConfigCheckStart:", v6, v12, configSeed, v8);
      }

      else
      {
        -[EasyConfigDevice _postConfigCheckStart:](self, "_postConfigCheckStart:", v6, deviceIdentifier, v13, v15);
      }

      goto LABEL_37;
    }
  }

  if (gLogCategory_EasyConfigDevice <= 40
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

LABEL_37:
}

- (void)_postConfigCheckStart:(id)a3
{
  uint64_t v13 = 0LL;
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_postConfigCheckStartTime = Current;
  self->_postConfigCheckFinishTime = Current;
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }

  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 60LL, 0LL, deviceIdentifier);
  uint64_t v6 = -[EasyConfigDevice _setupClient:](self, "_setupClient:", v4);

  if (!(_DWORD)v6)
  {
    uint64_t v6 = HTTPMessageCreate();
    if (!(_DWORD)v6)
    {
      HTTPHeader_InitRequest();
      HTTPHeader_SetField();
      uint64_t v7 = MEMORY[0x1895F87A8];
      v12[5] = MEMORY[0x1895F87A8];
      v12[6] = 3221225472LL;
      v12[7] = __42__EasyConfigDevice__postConfigCheckStart___block_invoke;
      v12[8] = &unk_18A2F4578;
      v12[9] = self;
      HTTPMessageSetCompletionBlock();
      v13[8512] = 1;
      uint64_t v6 = HTTPClientSendMessage();
      if (!(_DWORD)v6)
      {
        v12[0] = v7;
        v12[1] = 3221225472LL;
        v12[2] = __42__EasyConfigDevice__postConfigCheckStart___block_invoke_2;
        v12[3] = &unk_18A2F4500;
        v12[4] = self;
        uint64_t v6 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20LL, v12);
      }
    }
  }

  if (v13) {
    CFRelease(v13);
  }
  if ((_DWORD)v6)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v10 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v6, v10, v6);
    }

    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v6, v9, v11);
    }
  }

- (void)_postConfigCheckCompletion:(HTTPMessagePrivate *)a3
{
  self->_postConfigCheckFinishTime = CFAbsoluteTimeGetCurrent();
  uint64_t var21 = a3->var21;
  if (!(_DWORD)var21)
  {
    int var12 = a3->var2.var12;
    if ((var12 - 300) >= 0xFFFFFF9C)
    {
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        unint64_t deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }

      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 70LL, 0LL, deviceIdentifier);
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 100LL, 0LL);
      -[EasyConfigDevice _stop:](self, "_stop:", 0LL);
      return;
    }

    uint64_t var21 = (var12 + 200000);
    if (var12 == -200000) {
      return;
    }
  }

  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  -[EasyConfigDevice _handleError:](self, "_handleError:", var21);
}

- (void)_handleError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = CFAbsoluteTimeGetCurrent() - self->_configStartTime;
  if (gLogCategory_EasyConfigDevice <= 40
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (!self->_firstErr) {
    self->_firstErr = v3;
  }
  if ((self->_state - 1) <= 1)
  {
    if (v5 >= 120.0)
    {
      if (gLogCategory_EasyConfigDevice <= 60
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }

    else
    {
      v6[0] = MEMORY[0x1895F87A8];
      v6[1] = 3221225472LL;
      v6[2] = __33__EasyConfigDevice__handleError___block_invoke;
      v6[3] = &unk_18A2F4500;
      v6[4] = self;
      uint64_t v3 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 5LL, v6);
    }
  }

  if ((_DWORD)v3) {
    -[EasyConfigDevice _stop:](self, "_stop:", v3);
  }
}

- (void)_logEnded
{
  if (gLogCategory_EasyConfigDevice <= 50
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

- (void)_postNote:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  userQueue = (dispatch_queue_s *)self->_userQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__EasyConfigDevice__postNote_info___block_invoke;
  block[3] = &unk_18A2F45A0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(userQueue, block);
}

- (void)_postProgress:(int)a3 info:(id)a4
{
  id v6 = a4;
  userQueue = (dispatch_queue_s *)self->_userQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__EasyConfigDevice__postProgress_info___block_invoke;
  block[3] = &unk_18A2F45C8;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(userQueue, block);
}

- (void)_postProgress:(int)a3 withResponse:(id)a4
{
  id v6 = a4;
  userQueue = (dispatch_queue_s *)self->_userQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__EasyConfigDevice__postProgress_withResponse___block_invoke;
  block[3] = &unk_18A2F45C8;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(userQueue, block);
}

- (int)_setupClient:(id)a3
{
  id v4 = a3;
  p_httpClient = &self->_httpClient;
  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(*p_httpClient);
    *p_httpClient = 0LL;
  }

  int DNSName = HTTPClientCreate();
  if (DNSName
    || (HTTPClientSetDispatchQueue(),
        HTTPClientSetFlags(),
        HTTPClientSetLogging(),
        (int DNSName = BonjourDevice_GetDNSName()) != 0)
    || (int DNSName = HTTPClientSetDestination()) != 0)
  {
    if (*p_httpClient)
    {
      HTTPClientInvalidate();
      CFRelease(*p_httpClient);
      *p_httpClient = 0LL;
    }
  }

  return DNSName;
}

- (int)_startBonjourWithTimeout:(int)a3 handler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!self->_supportsHAP2)
  {
    p_airplayBrowser = &self->_airplayBrowser;
    if (self->_airplayBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_airplayBrowser);
      *p_airplayBrowser = 0LL;
    }

    int v8 = BonjourBrowser_Create();
    if (v8) {
      goto LABEL_20;
    }
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    int v8 = BonjourBrowser_Start();
    if (v8) {
      goto LABEL_20;
    }
    int v11 = self;

    p_raopBrowser = (CFTypeRef *)&v11->_raopBrowser;
    if (v11->_raopBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_raopBrowser);
      CFTypeRef *p_raopBrowser = 0LL;
    }

    int v8 = BonjourBrowser_Create();
    if (v8) {
      goto LABEL_20;
    }
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    int v8 = BonjourBrowser_Start();
    if (v8) {
      goto LABEL_20;
    }
    uint64_t v13 = v11;

    p_mfiConfigBrowser = (CFTypeRef *)&v13->_mfiConfigBrowser;
    if (v13->_mfiConfigBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_mfiConfigBrowser);
      CFTypeRef *p_mfiConfigBrowser = 0LL;
    }

    int v8 = BonjourBrowser_Create();
    if (v8) {
      goto LABEL_20;
    }
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    int v8 = BonjourBrowser_Start();
    if (v8) {
      goto LABEL_20;
    }
  }

  p_hapBrowser = &self->_hapBrowser;
  if (self->_hapBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(*p_hapBrowser);
    *p_hapBrowser = 0LL;
  }

  int v8 = BonjourBrowser_Create();
  if (v8) {
    goto LABEL_20;
  }
  BonjourBrowser_SetDispatchQueue();
  BonjourBrowser_SetEventHandlerBlock();
  int v8 = BonjourBrowser_Start();
  if (v8) {
    goto LABEL_20;
  }
  id v9 = self;

  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __53__EasyConfigDevice__startBonjourWithTimeout_handler___block_invoke;
  v16[3] = &unk_18A2F4500;
  v16[4] = v9;
  int v8 = -[EasyConfigDevice _timeoutTimerStart:block:](v9, "_timeoutTimerStart:block:", v4, v16);
  if (v8)
  {
LABEL_20:
    if (self->_airplayBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_airplayBrowser);
      self->_airplayBrowser = 0LL;
    }

    if (self->_raopBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_raopBrowser);
      self->_raopBrowser = 0LL;
    }

    if (self->_mfiConfigBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_mfiConfigBrowser);
      self->_mfiConfigBrowser = 0LL;
    }

    if (self->_hapBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_hapBrowser);
      self->_hapBrowser = 0LL;
    }
  }

  return v8;
}

- (int)_timeoutTimerStart:(int)a3 block:(id)a4
{
  id v6 = a4;
  p_timeoutTimer = (id *)&self->_timeoutTimer;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    id v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    id v10 = *p_timeoutTimer;
    id *p_timeoutTimer = 0LL;
  }

  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_internalQueue);
  objc_storeStrong(p_timeoutTimer, v11);
  if (v11)
  {
    dispatch_source_set_event_handler(v11, v6);
    dispatch_time_t v12 = dispatch_time(0LL, 1000000000LL * a3);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(v11);
    int v13 = 0;
  }

  else
  {
    int v13 = -6700;
  }

  return v13;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (unint64_t)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(unint64_t)a3
{
  self->_unint64_t deviceIdentifier = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_userQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)features
{
  return self->_features;
}

- (void)setFeatures:(unint64_t)a3
{
  self->_features = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (BOOL)pausesAfterApply
{
  return self->_pausesAfterApply;
}

- (void)setPausesAfterApply:(BOOL)a3
{
  self->_pausesAfterApply = a3;
}

- (BOOL)skipPairSetup
{
  return self->_skipPairSetup;
}

- (void)setSkipPairSetup:(BOOL)a3
{
  self->_skipPairSetup = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __53__EasyConfigDevice__startBonjourWithTimeout_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

void __47__EasyConfigDevice__postProgress_withResponse___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496LL);
  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 40);
    id v14 = @"EasyConfigKey_Response";
    v15[0] = v4;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    double v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v5);
  }

  if (*(_DWORD *)(a1 + 48) == 2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 496);
    *(void *)(v6 + 496) = 0LL;
  }

  [MEMORY[0x189607958] defaultCenter];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *(void *)(a1 + 32);
  v12[0] = @"EasyConfigKey_Progress";
  [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 48)];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = @"EasyConfigKey_Response";
  v13[0] = v10;
  v13[1] = *(void *)(a1 + 40);
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:2];
  dispatch_source_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 postNotificationName:@"EasyConfigDeviceProgressNotification" object:v9 userInfo:v11];
}

void __39__EasyConfigDevice__postProgress_info___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496LL);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  }
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 496);
    *(void *)(v3 + 496) = 0LL;
  }

  [MEMORY[0x189607958] defaultCenter];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v9 = @"EasyConfigKey_Progress";
  [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 48)];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"EasyConfigDeviceProgressNotification" object:v6 userInfo:v8];
}

void __35__EasyConfigDevice__postNote_info___block_invoke(void *a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

uint64_t __33__EasyConfigDevice__handleError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findDevicePreConfigStart];
}

uint64_t __42__EasyConfigDevice__postConfigCheckStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _postConfigCheckCompletion:a2];
}

uint64_t __42__EasyConfigDevice__postConfigCheckStart___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

uint64_t __46__EasyConfigDevice__findDevicePostConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _findDevicePostConfigEvent:a2 info:a3];
}

uint64_t __37__EasyConfigDevice__applyConfigStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyConfigCompletion:a2];
}

uint64_t __37__EasyConfigDevice__applyConfigStart__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

uint64_t __36__EasyConfigDevice__pairVerifyNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _pairVerifyNext:a2];
}

uint64_t __36__EasyConfigDevice__pairVerifyStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

uint64_t __35__EasyConfigDevice__pairSetupNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _pairSetupNext:a2];
}

uint64_t __35__EasyConfigDevice__pairSetupNext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

uint64_t __32__EasyConfigDevice__mfiSAPNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mfiSAPNext:a2];
}

uint64_t __32__EasyConfigDevice__mfiSAPStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleError:4294960574];
}

uint64_t __45__EasyConfigDevice__findDevicePreConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _findDevicePreConfigEvent:a2 info:a3];
}

uint64_t __33__EasyConfigDevice_trySetupCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trySetupCode:*(void *)(a1 + 40)];
}

uint64_t __36__EasyConfigDevice_resumePostConfig__block_invoke(uint64_t result)
{
  if (*(_BYTE *)(*(void *)(result + 32) + 232LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return [*(id *)(v1 + 32) _findDevicePostConfigStart];
  }

  else if (gLogCategory_EasyConfigDevice <= 60)
  {
    if (gLogCategory_EasyConfigDevice != -1) {
      return LogPrintF();
    }
    result = _LogCategory_Initialize();
    if ((_DWORD)result) {
      return LogPrintF();
    }
  }

  return result;
}

uint64_t __24__EasyConfigDevice_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop:4294960573];
}

uint64_t __25__EasyConfigDevice_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

+ (BOOL)supportedScanRecord:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (!v3 || ![v3 length]) {
    goto LABEL_5;
  }
  [v4 bytes];
  int v5 = IEGetVendorSpecific();
  if (!v5)
  {
    TLV8Get();
LABEL_5:
    int v5 = -6727;
  }

  BOOL v6 = v5 == 0;

  return v6;
}

+ (id)deviceWithInfo:(id)a3
{
  uint64_t v3 = (NSDictionary *)a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___EasyConfigDevice);
  deviceInfo = v4->_deviceInfo;
  v4->_deviceInfo = v3;

  return v4;
}

+ (id)deviceWithScanRecord:(id)a3
{
  uint64_t v3 = (NSDictionary *)a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___EasyConfigDevice);
  scanRecord = v4->_scanRecord;
  v4->_scanRecord = v3;

  return v4;
}

@end