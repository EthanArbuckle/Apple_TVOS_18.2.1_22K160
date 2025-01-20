@interface CUWACSession
- (CUWACSession)init;
- (CUWiFiDevice)wacDevice;
- (NSDictionary)configuration;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)progressHandler;
- (id)promptForSetupCodeHandler;
- (int)_runEasyConfigPostConfig;
- (int)_runEasyConfigPreConfig;
- (int)_runFinish;
- (int)_runJoinSoftAP;
- (int)_runRestoreOriginalWiFi;
- (int)_runSaveOriginalWiFi;
- (void)_cleanup;
- (void)_progress:(unsigned int)a3 info:(id)a4;
- (void)_run;
- (void)_runEasyConfigPreConfigStart;
- (void)_runEasyConfigProgress:(int)a3 info:(id)a4;
- (void)_runFinishRestored:(int)a3;
- (void)_runJoinSoftAPFinished:(int)a3;
- (void)_runJoinSoftAPStart;
- (void)_runRestoreOriginalWiFiFinished:(int)a3;
- (void)_runRestoreOriginalWiFiStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForSetupCodeHandler:(id)a3;
- (void)setWacDevice:(id)a3;
- (void)trySetupCode:(id)a3;
@end

@implementation CUWACSession

- (CUWACSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUWACSession;
  v2 = -[CUWACSession init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUWACSession;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled) {
    FatalErrorF("Dealloc without invalidate");
  }
  -[CUWACSession _cleanup](self, "_cleanup");
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUWACSession;
  -[CUWACSession dealloc](&v4, sel_dealloc);
}

- (void)_cleanup
{
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0LL;

  -[EasyConfigDevice stop](self->_easyConfigDevice, "stop");
  easyConfigDevice = self->_easyConfigDevice;
  self->_easyConfigDevice = 0LL;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0LL;

  id promptForSetupCodeHandler = self->_promptForSetupCodeHandler;
  self->_id promptForSetupCodeHandler = 0LL;
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
  block[2] = __24__CUWACSession_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CUWACSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_progress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v14 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    if ((int)v4 <= 99)
    {
      if ((int)v4 > 49)
      {
        if ((int)v4 <= 69)
        {
          if ((_DWORD)v4 == 50)
          {
            v11 = "JoinedSoftAP";
            goto LABEL_55;
          }

          if ((_DWORD)v4 == 60)
          {
            v11 = "PreConfigStart";
            goto LABEL_55;
          }
        }

        else
        {
          switch((_DWORD)v4)
          {
            case 'F':
              v11 = "SearchingPreConfig";
              goto LABEL_55;
            case 'P':
              v11 = "FoundPreConfig";
              goto LABEL_55;
            case 'Z':
              v11 = "Authenticating";
              goto LABEL_55;
          }
        }
      }

      else if ((int)v4 <= 19)
      {
        if (!(_DWORD)v4)
        {
          v11 = "Invalid";
          goto LABEL_55;
        }

        if ((_DWORD)v4 == 10)
        {
          v11 = "Start";
          goto LABEL_55;
        }
      }

      else
      {
        switch((_DWORD)v4)
        {
          case 0x14:
            v11 = "Final";
            goto LABEL_55;
          case 0x1E:
            v11 = "Error";
            goto LABEL_55;
          case 0x28:
            v11 = "JoiningSoftAP";
            goto LABEL_55;
        }
      }
    }

    else if ((int)v4 <= 149)
    {
      if ((int)v4 <= 119)
      {
        if ((_DWORD)v4 == 100)
        {
          v11 = "Authenticated";
          goto LABEL_55;
        }

        if ((_DWORD)v4 == 110)
        {
          v11 = "ApplyingConfig";
          goto LABEL_55;
        }
      }

      else
      {
        switch((_DWORD)v4)
        {
          case 0x78:
            v11 = "AppliedConfig";
            goto LABEL_55;
          case 0x82:
            v11 = "RestoringOriginalWiFi";
            goto LABEL_55;
          case 0x8C:
            v11 = "RestoredOriginalWiFi";
            goto LABEL_55;
        }
      }
    }

    else if ((int)v4 > 179)
    {
      switch((_DWORD)v4)
      {
        case 0xB4:
          v11 = "CheckingPostConfig";
          goto LABEL_55;
        case 0xBE:
          v11 = "CheckedPostConfig";
          goto LABEL_55;
        case 0xC8:
          v11 = "ConfigComplete";
          goto LABEL_55;
      }
    }

    else
    {
      switch((_DWORD)v4)
      {
        case 0x96:
          v11 = "SearchingPostConfig";
          goto LABEL_55;
        case 0xA0:
          v11 = "PostConfigStart";
          goto LABEL_55;
        case 0xAA:
          v11 = "FoundPostConfig";
LABEL_55:
          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _progress:info:]",  0x1Eu,  (uint64_t)"Progress: %s %@\n",  v6,  v7,  v8,  v9,  (char)v11);
          goto LABEL_56;
      }
    }

    v11 = "?";
    goto LABEL_55;
  }

- (void)trySetupCode:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __29__CUWACSession_trySetupCode___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_run
{
  if (!self->_invalidateCalled
    && -[CUWACSession _runSaveOriginalWiFi](self, "_runSaveOriginalWiFi") == 4
    && -[CUWACSession _runJoinSoftAP](self, "_runJoinSoftAP") == 4
    && -[CUWACSession _runEasyConfigPreConfig](self, "_runEasyConfigPreConfig") == 4
    && -[CUWACSession _runRestoreOriginalWiFi](self, "_runRestoreOriginalWiFi") == 4
    && -[CUWACSession _runEasyConfigPostConfig](self, "_runEasyConfigPostConfig") == 4)
  {
    -[CUWACSession _runFinish](self, "_runFinish");
  }

- (int)_runSaveOriginalWiFi
{
  v32[1] = *MEMORY[0x1895F89C0];
  int result = self->_saveOriginalWiFiState;
  if (result) {
    return result;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runSaveOriginalWiFi]",  0x1Eu,  (uint64_t)"Saving off current WiFi info\n",  v2,  v3,  v4,  v5,  v27);
  }

- (int)_runJoinSoftAP
{
  int joinSoftAPState = self->_joinSoftAPState;
  if (joinSoftAPState != 4)
  {
    if (joinSoftAPState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
          int joinSoftAPState = self->_joinSoftAPState;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runJoinSoftAP]",  0x1Eu,  (uint64_t)"Join SoftAP hasn't succeeded yet (%d)\n",  v2,  v3,  v4,  v5,  joinSoftAPState);
      }
    }

    else
    {
      self->_int joinSoftAPState = 1;
      -[CUWACSession _runJoinSoftAPStart](self, "_runJoinSoftAPStart");
    }
  }

  return self->_joinSoftAPState;
}

- (void)_runJoinSoftAPStart
{
  v31[1] = *MEMORY[0x1895F89C0];
  -[CUWACSession _progress:info:](self, "_progress:info:", 40LL, 0LL);
  -[CUWiFiDevice rawScanResult](self->_wacDevice, "rawScanResult");
  uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runJoinSoftAPStart]",  0x5Au,  (uint64_t)"### No scan result to join SoftAP\n",  v3,  v4,  v5,  v6,  v26);
    }

- (void)_runJoinSoftAPFinished:(int)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  self->_easyConfigPreConfigMetrics.wifiJoinSWAPError = a3;
  if (!a3)
  {
    self->_easyConfigPreConfigMetrics.secondsToGetLinkUpOnSWAP = CFAbsoluteTimeGetCurrent() - self->_joinSoftAPStartTime;
    -[CUWACSession _progress:info:](self, "_progress:info:", 50LL, 0LL);
    self->_int joinSoftAPState = 4;
    -[CUWACSession _run](self, "_run");
    return;
  }

  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runJoinSoftAPFinished:]",  0x3Cu,  (uint64_t)"### Join SoftAP start failed: %#m\n",  v3,  v4,  v5,  v6,  a3);
  }

- (int)_runEasyConfigPreConfig
{
  int easyConfigPreConfigState = self->_easyConfigPreConfigState;
  if (easyConfigPreConfigState != 4)
  {
    if (easyConfigPreConfigState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
          int easyConfigPreConfigState = self->_easyConfigPreConfigState;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runEasyConfigPreConfig]",  0x1Eu,  (uint64_t)"EasyConfig PreConfig hasn't succeeded yet (%d)\n",  v2,  v3,  v4,  v5,  easyConfigPreConfigState);
      }
    }

    else
    {
      self->_int easyConfigPreConfigState = 1;
      -[CUWACSession _runEasyConfigPreConfigStart](self, "_runEasyConfigPreConfigStart");
    }
  }

  return self->_easyConfigPreConfigState;
}

- (void)_runEasyConfigPreConfigStart
{
  v46[1] = *MEMORY[0x1895F89C0];
  -[CUWACSession _progress:info:](self, "_progress:info:", 60LL, 0LL);
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[CUWiFiDevice deviceIEDeviceID](self->_wacDevice, "deviceIEDeviceID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    getEasyConfigKey_DeviceID[0]();
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:v9];

    unsigned int v10 = -[CUWiFiDevice deviceIEFlags](self->_wacDevice, "deviceIEFlags");
    [MEMORY[0x189607968] numberWithUnsignedLongLong:(v10 >> 31) | (((v10 >> 14) & 1) << 17) & 0xFFEBFFFF | (((v10 >> 13) & 1) << 18) & 0xFFEFFFFF | (v10 >> 27) & 4 | (((v10 >> 11) & 1) << 20)];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    getEasyConfigKey_Flags[0]();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v11 forKeyedSubscript:v12];

    uint64_t v13 = self->_originalWiFiInfo;
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = (id)-[NSDictionary mutableCopy](self->_configuration, "mutableCopy");
      if (!v15) {
        id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
      }
      [v14 objectForKeyedSubscript:@"password"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        [v15 setObject:v16 forKeyedSubscript:@"wifiPSK"];
        goto LABEL_11;
      }

      ucat = self->_ucat;
      if (ucat->var0 <= 50)
      {
        if (ucat->var0 != -1)
        {
LABEL_9:
          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runEasyConfigPreConfigStart]",  0x32u,  (uint64_t)"### No WiFI password to configure\n",  v17,  v18,  v19,  v20,  v40);
          goto LABEL_11;
        }

        if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
        {
          ucat = self->_ucat;
          goto LABEL_9;
        }
      }

- (void)_runEasyConfigProgress:(int)a3 info:(id)a4
{
  v29[1] = *MEMORY[0x1895F89C0];
  unsigned int v10 = (const __CFDictionary *)a4;
  if (a3 <= 39)
  {
    if (a3 > 19)
    {
      if (a3 == 20)
      {
        uint64_t v11 = self;
        uint64_t v12 = 90LL;
        goto LABEL_25;
      }

      if (a3 == 30)
      {
        -[CUWACSession _progress:info:](self, "_progress:info:", 100LL, v10);
        uint64_t v11 = self;
        uint64_t v12 = 110LL;
        goto LABEL_25;
      }

      goto LABEL_27;
    }

    if (a3 != 2)
    {
      if (a3 == 10)
      {
        uint64_t v11 = self;
        uint64_t v12 = 70LL;
        goto LABEL_25;
      }

      goto LABEL_27;
    }

    id v13 = (id)getEasyConfigKey_ReasonError[0]();
    CFTypeID TypeID = CFErrorGetTypeID();
    CFDictionaryGetTypedValue(v10, v13, TypeID, 0LL);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_21:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runEasyConfigProgress:info:]",  0x1Eu,  (uint64_t)"EasyConfig final: %{error}\n",  v15,  v16,  v17,  v18,  (char)v19);
        goto LABEL_31;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_21;
      }
    }

- (int)_runRestoreOriginalWiFi
{
  int restoreOriginalWiFiState = self->_restoreOriginalWiFiState;
  if (restoreOriginalWiFiState != 4)
  {
    if (restoreOriginalWiFiState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
          int restoreOriginalWiFiState = self->_restoreOriginalWiFiState;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runRestoreOriginalWiFi]",  0x1Eu,  (uint64_t)"Restore original WiFi hasn't succeeded yet (%d)\n",  v2,  v3,  v4,  v5,  restoreOriginalWiFiState);
      }
    }

    else
    {
      self->_int restoreOriginalWiFiState = 1;
      -[CUWACSession _runRestoreOriginalWiFiStart](self, "_runRestoreOriginalWiFiStart");
    }
  }

  return self->_restoreOriginalWiFiState;
}

- (void)_runRestoreOriginalWiFiStart
{
  v32[1] = *MEMORY[0x1895F89C0];
  -[CUWACSession _progress:info:](self, "_progress:info:", 130LL, 0LL);
  uint64_t v3 = self->_originalWiFiInfo;
  uint64_t v8 = (const __CFDictionary *)v3;
  if (!v3)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiStart]",  0x5Au,  (uint64_t)"### No original WiFi info to restore\n",  v4,  v5,  v6,  v7,  v27);
    }

- (void)_runRestoreOriginalWiFiFinished:(int)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0LL;

  self->_easyConfigPostConfigMetrics.wifiJoinDestinationAPError = a3;
  if (!a3)
  {
    self->_easyConfigPostConfigMetrics.secondsToGetLinkUpOnDestination = CFAbsoluteTimeGetCurrent()
                                                                       - self->_restoreStartTime;
    -[CUWACSession _progress:info:](self, "_progress:info:", 140LL, 0LL);
    self->_int restoreOriginalWiFiState = 4;
    -[CUWACSession _run](self, "_run");
    return;
  }

  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiFinished:]",  0x3Cu,  (uint64_t)"### Restore original WiFi failed: %#m\n",  v6,  v7,  v8,  v9,  a3);
  }

- (int)_runEasyConfigPostConfig
{
  v34[1] = *MEMORY[0x1895F89C0];
  int easyConfigPostConfigState = self->_easyConfigPostConfigState;
  if (easyConfigPostConfigState == 4) {
    return self->_easyConfigPostConfigState;
  }
  if (!easyConfigPostConfigState)
  {
    self->_int easyConfigPostConfigState = 1;
    -[CUWACSession _progress:info:](self, "_progress:info:", 160LL, 0LL);
    easyConfigDevice = self->_easyConfigDevice;
    if (easyConfigDevice)
    {
      -[EasyConfigDevice setPostConfigMetrics:]( easyConfigDevice,  "setPostConfigMetrics:",  &self->_easyConfigPostConfigMetrics);
      -[EasyConfigDevice resumePostConfig](self->_easyConfigDevice, "resumePostConfig");
      return self->_easyConfigPostConfigState;
    }

    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      goto LABEL_14;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
      {
LABEL_14:
        self->_int easyConfigPostConfigState = 3;
        v33 = @"eo";
        uint64_t v15 = (void *)MEMORY[0x189607870];
        uint64_t v16 = *MEMORY[0x189607670];
        uint64_t v31 = *MEMORY[0x1896075E0];
        uint64_t v17 = (void *)NSString;
        if (MEMORY[0x18960EFF0] && (v18 = CUErrorCodesTableGet(), (uint64_t v19 = *(const char **)(v18 + 8)) != 0LL))
        {
          if (*(_DWORD *)v18 != -6762)
          {
            uint64_t v20 = (const char **)(v18 + 24);
            uint64_t v19 = "";
            while (1)
            {
              uint64_t v21 = *v20;
              if (!*v20) {
                break;
              }
              int v22 = *((_DWORD *)v20 - 2);
              v20 += 2;
              if (v22 == -6762)
              {
                uint64_t v19 = v21;
                break;
              }
            }
          }
        }

        else
        {
          uint64_t v19 = "";
        }

        uint64_t v23 = [v17 stringWithUTF8String:v19];
        uint64_t v24 = (void *)v23;
        uint64_t v25 = @"?";
        if (v23) {
          uint64_t v25 = (const __CFString *)v23;
        }
        v32 = v25;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 errorWithDomain:v16 code:-6762 userInfo:v26];
        char v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v27;
        [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:&v33 count:1];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUWACSession _progress:info:](self, "_progress:info:", 30LL, v28);

        return self->_easyConfigPostConfigState;
      }

      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runEasyConfigPostConfig]",  0x5Au,  (uint64_t)"### No EasyConfigDevice to resume?\n",  v8,  v9,  v10,  v11,  v30);
    goto LABEL_14;
  }

  uint64_t v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      uint64_t v13 = self->_ucat;
      int easyConfigPostConfigState = self->_easyConfigPostConfigState;
    }

    LogPrintF( (uint64_t)v13,  (uint64_t)"-[CUWACSession _runEasyConfigPostConfig]",  0x1Eu,  (uint64_t)"EasyConfig PostConfig hasn't succeeded yet (%d)\n",  v2,  v3,  v4,  v5,  easyConfigPostConfigState);
  }

  return self->_easyConfigPostConfigState;
}

- (int)_runFinish
{
  if (!self->_finishState)
  {
    originalWiFiInfo = self->_originalWiFiInfo;
    if (!originalWiFiInfo)
    {
      uint64_t v7 = self;
      uint64_t v6 = 0LL;
      goto LABEL_6;
    }

    self->_int easyConfigPostConfigState = 1;
    dispatchQueue = self->_dispatchQueue;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __26__CUWACSession__runFinish__block_invoke;
    v9[3] = &unk_189F32EC8;
    v9[4] = self;
    uint64_t v5 = WiFiRestoreNetwork((const __CFDictionary *)originalWiFiInfo, dispatchQueue, v9);
    if ((_DWORD)v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = self;
LABEL_6:
      -[CUWACSession _runFinishRestored:](v7, "_runFinishRestored:", v6);
    }
  }

  return self->_finishState;
}

- (void)_runFinishRestored:(int)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0LL;

  if (!a3)
  {
    -[CUWACSession _progress:info:](self, "_progress:info:", 20LL, 0LL);
    self->_finishState = 4;
    -[CUWACSession _run](self, "_run");
    return;
  }

  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWACSession _runFinishRestored:]",  0x3Cu,  (uint64_t)"### Finish restore original WiFi failed: %#m\n",  v6,  v7,  v8,  v9,  a3);
  }

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
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

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)promptForSetupCodeHandler
{
  return self->_promptForSetupCodeHandler;
}

- (void)setPromptForSetupCodeHandler:(id)a3
{
}

- (CUWiFiDevice)wacDevice
{
  return self->_wacDevice;
}

- (void)setWacDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __26__CUWACSession__runFinish__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runFinishRestored:a2];
}

uint64_t __44__CUWACSession__runRestoreOriginalWiFiStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runRestoreOriginalWiFiFinished:a2];
}

uint64_t __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _runEasyConfigProgress:a2 info:a3];
}

uint64_t __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke_2(uint64_t a1)
{
  return 0LL;
}

uint64_t __35__CUWACSession__runJoinSoftAPStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runJoinSoftAPFinished:a2];
}

uint64_t __29__CUWACSession_trySetupCode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) trySetupCode:*(void *)(a1 + 40)];
}

uint64_t __26__CUWACSession_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 9))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 9) = 1;
    uint64_t v10 = *(void **)(result + 32);
    uint64_t v11 = (int *)v10[2];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        uint64_t v10 = *(void **)(v9 + 32);
        if (!v12) {
          goto LABEL_6;
        }
        uint64_t v11 = (int *)v10[2];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUWACSession invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v13);
      uint64_t v10 = *(void **)(v9 + 32);
    }

uint64_t __24__CUWACSession_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 16);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUWACSession activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

@end