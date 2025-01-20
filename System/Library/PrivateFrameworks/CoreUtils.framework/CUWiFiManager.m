@interface CUWiFiManager
- (BOOL)degradeOnAnyTrafficUnavailable;
- (BOOL)infraDisabled;
- (BOOL)wakeOnWirelessEnabled;
- (CUWiFiManager)init;
- (NSArray)trafficPeers;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)trafficFlagsUnavailableUpdatedHandler;
- (id)wifiStateChangedHandler;
- (int)_wifiStateUncached;
- (int)wifiState;
- (unsigned)_wifiFlagsUncached;
- (unsigned)controlFlags;
- (unsigned)trafficFlagsUnavailable;
- (unsigned)wifiFlags;
- (void)_activateSafeInvokeBlock:(id)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)_update;
- (void)_updateInfraDisabled;
- (void)_updateTrafficPeerStatusMonitor;
- (void)_updateTrafficPeerStatusUpdated:(id)a3 isAvailable:(BOOL)a4 error:(id)a5;
- (void)_updateTrafficPeers;
- (void)_updateTrafficPeersWithService:(unsigned int)a3;
- (void)_updateWakeOnWireless;
- (void)_updateWiFiState;
- (void)_wifiAutoJoinNotification:(id)a3;
- (void)_wifiEnsureStarted;
- (void)_wifiEnsureStopped;
- (void)_wifiStateChanged;
- (void)activate;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performUpdate:(id)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDegradeOnAnyTrafficUnavailable:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInfraDisabled:(BOOL)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTrafficFlagsUnavailableUpdatedHandler:(id)a3;
- (void)setTrafficPeers:(id)a3;
- (void)setWakeOnWirelessEnabled:(BOOL)a3;
- (void)setWifiStateChangedHandler:(id)a3;
@end

@implementation CUWiFiManager

- (CUWiFiManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUWiFiManager;
  v2 = -[CUWiFiManager init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUWiFiManager;
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
  v4.super_class = (Class)&OBJC_CLASS___CUWiFiManager;
  -[CUWiFiManager dealloc](&v4, sel_dealloc);
}

- (void)setControlFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__CUWiFiManager_setControlFlags___block_invoke;
  v3[3] = &unk_189F32F60;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setInfraDisabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __34__CUWiFiManager_setInfraDisabled___block_invoke;
  v3[3] = &unk_189F32F88;
  BOOL v4 = a3;
  v3[4] = self;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)setTrafficPeers:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __33__CUWiFiManager_setTrafficPeers___block_invoke;
  v6[3] = &unk_189F33088;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);
}

- (void)setWakeOnWirelessEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __42__CUWiFiManager_setWakeOnWirelessEnabled___block_invoke;
  v3[3] = &unk_189F32F88;
  BOOL v4 = a3;
  v3[4] = self;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)activate
{
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __40__CUWiFiManager_activateWithCompletion___block_invoke;
  v8[3] = &unk_189F33060;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)_activateSafeInvokeBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __42__CUWiFiManager__activateSafeInvokeBlock___block_invoke;
    v7[3] = &unk_189F33060;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }

  else
  {
    v4[2](v4);
  }

  objc_sync_exit(v5);
}

- (void)_interrupted
{
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__CUWiFiManager_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _invalidated]",  0x3Cu,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v18);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (void)performUpdate:(id)a3
{
  uint64_t v4 = MEMORY[0x1895F87A8];
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__CUWiFiManager_performUpdate___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  uint64_t v6 = (void (**)(void))a3;
  dispatch_async(dispatchQueue, block);
  v6[2](v6);

  id v7 = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = v4;
  v8[1] = 3221225472LL;
  v8[2] = __31__CUWiFiManager_performUpdate___block_invoke_2;
  v8[3] = &unk_189F34238;
  v8[4] = self;
  dispatch_async(v7, v8);
}

- (void)_update
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_invalidateCalled)
  {
    -[CUWiFiManager _wifiEnsureStarted](obj, "_wifiEnsureStarted");
    -[CUWiFiManager _updateInfraDisabled](obj, "_updateInfraDisabled");
    -[CUWiFiManager _updateTrafficPeers](obj, "_updateTrafficPeers");
    -[CUWiFiManager _updateWakeOnWireless](obj, "_updateWakeOnWireless");
  }

  objc_sync_exit(obj);
}

- (void)_updateInfraDisabled
{
  if (!self->_wifiManager || !self->_infraDisabledChanged) {
    return;
  }
  BOOL infraDisabled = self->_infraDisabled;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      if (infraDisabled) {
        id v9 = "no";
      }
      else {
        id v9 = "yes";
      }
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _updateInfraDisabled]",  0x1Eu,  (uint64_t)"InfraDisabled: %s -> %s\n",  v2,  v3,  v4,  v5,  (char)v9);
      goto LABEL_10;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }

- (void)_updateTrafficPeers
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (self->_wifiDevice && self->_trafficPeerChanged)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_7;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_7:
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v9 = self->_trafficPeersCurrent;
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
        if (v10)
        {
          uint64_t v11 = v10;
          int v12 = 0;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v9);
              }
              v12 |= [*(id *)(*((void *)&v25 + 1) + 8 * i) trafficFlags];
            }

            uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
          }

          while (v11);
        }

        else
        {
          int v12 = 0;
        }

        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        uint64_t v15 = self->_trafficPeers;
        uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v22;
          do
          {
            for (uint64_t j = 0LL; j != v17; ++j)
            {
              if (*(void *)v22 != v18) {
                objc_enumerationMutation(v15);
              }
              v12 |= [*(id *)(*((void *)&v21 + 1) + 8 * j) trafficFlags];
            }

            uint64_t v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
          }

          while (v17);
        }

        if ((v12 & 0x100) != 0)
        {
          -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 256LL);
          if ((v12 & 0x400) == 0)
          {
LABEL_25:
            if ((v12 & 0x1000) == 0) {
              goto LABEL_26;
            }
            goto LABEL_36;
          }
        }

        else if ((v12 & 0x400) == 0)
        {
          goto LABEL_25;
        }

        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 1024LL);
        if ((v12 & 0x1000) == 0)
        {
LABEL_26:
          if ((v12 & 0x2000) == 0) {
            goto LABEL_27;
          }
          goto LABEL_37;
        }

- (void)_updateTrafficPeersWithService:(unsigned int)a3
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v65 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ((a3 & 0x100) != 0)
  {
    uint64_t v10 = @"airplay";
    goto LABEL_20;
  }

  if ((a3 & 0x400) != 0)
  {
    uint64_t v10 = @"D2DMigration";
    goto LABEL_20;
  }

  if ((a3 & 0x1000) != 0)
  {
    uint64_t v10 = @"ensemble";
    goto LABEL_20;
  }

  if ((a3 & 0x2000) != 0)
  {
    uint64_t v10 = @"MPRemoteCamera";
    goto LABEL_20;
  }

  if ((a3 & 0x8000) != 0)
  {
    uint64_t v10 = @"TVRemoteCamera";
    goto LABEL_20;
  }

  if ((a3 & 0x200) != 0)
  {
    uint64_t v10 = @"sidecar";
    goto LABEL_20;
  }

  if ((a3 & 0x4000) != 0)
  {
    uint64_t v10 = @"RemoteCamera";
    goto LABEL_20;
  }

  if ((a3 & 0x10000) != 0)
  {
    uint64_t v10 = @"RemoteScreen";
LABEL_20:
    char v62 = (char)v10;
    objc_msgSend(v65, "setObject:forKeyedSubscript:");
    uint64_t v11 = self->_trafficPeers;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v78,  v89,  16LL);
    v64 = self;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0LL;
      uint64_t v15 = *(void *)v79;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v79 != v15) {
            objc_enumerationMutation(v11);
          }
          int v17 = [*(id *)(*((void *)&v78 + 1) + 8 * i) trafficFlags];
          if ((v17 & a3) != 0)
          {
            if ((v17 & 4) != 0) {
              int v18 = 9;
            }
            else {
              int v18 = 1;
            }
            uint64_t v14 = v18 & 0xFFFFFFF9 | (2 * (v17 & 3)) | v14;
          }
        }

        uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v78,  v89,  16LL);
      }

      while (v13);
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:v14];
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v65 setObject:v19 forKeyedSubscript:@"TR_SESSION_FLAGS"];

    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    v20 = v11;
    uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v74,  v88,  16LL);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v75;
      do
      {
        for (uint64_t j = 0LL; j != v22; ++j)
        {
          if (*(void *)v75 != v23) {
            objc_enumerationMutation(v20);
          }
          __int128 v25 = *(void **)(*((void *)&v74 + 1) + 8 * j);
          if (([v25 trafficFlags] & 0x3200) != 0)
          {
            [v25 sessionID];
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26) {
              [v65 setObject:v26 forKeyedSubscript:@"TR_SIDECAR_SESSION_UUID"];
            }
          }
        }

        uint64_t v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v74,  v88,  16LL);
      }

      while (v22);
    }

    v63 = v20;

    if ((_DWORD)v14) {
      uint64_t v27 = MEMORY[0x189604A88];
    }
    else {
      uint64_t v27 = MEMORY[0x189604A80];
    }
    [v65 setObject:v27 forKeyedSubscript:@"TR_ACTIVE"];
    id v28 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    v29 = v64->_trafficPeersCurrent;
    uint64_t v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v70,  v87,  16LL);
    uint64_t v31 = @"TR_IFNAME";
    v32 = @"awdl0";
    if (v30)
    {
      uint64_t v33 = v30;
      uint64_t v34 = *(void *)v71;
      do
      {
        for (uint64_t k = 0LL; k != v33; ++k)
        {
          if (*(void *)v71 != v34) {
            objc_enumerationMutation(v29);
          }
          v36 = *(void **)(*((void *)&v70 + 1) + 8 * k);
          if (([v36 trafficFlags] & a3) != 0)
          {
            uint64_t v37 = [v36 peerMACAddressData];
            v38 = (void *)v37;
            if (v37)
            {
              v85[0] = v31;
              v85[1] = @"TR_PEER_ADDRESS";
              v86[0] = v32;
              v86[1] = v37;
              [MEMORY[0x189603F68] dictionaryWithObjects:v86 forKeys:v85 count:2];
              v39 = v32;
              v40 = v31;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              [v28 addObject:v41];

              uint64_t v31 = v40;
              v32 = v39;
            }
          }
        }

        uint64_t v33 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v70,  v87,  16LL);
      }

      while (v33);
    }

    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    v42 = v63;
    uint64_t v43 = -[NSArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v66,  v84,  16LL);
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v67;
      do
      {
        for (uint64_t m = 0LL; m != v44; ++m)
        {
          if (*(void *)v67 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v66 + 1) + 8 * m);
          if (([v47 trafficFlags] & a3) != 0)
          {
            uint64_t v48 = [v47 peerMACAddressData];
            v49 = (void *)v48;
            if (v48)
            {
              v82[0] = v31;
              v82[1] = @"TR_PEER_ADDRESS";
              v83[0] = v32;
              v83[1] = v48;
              [MEMORY[0x189603F68] dictionaryWithObjects:v83 forKeys:v82 count:2];
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              [v28 addObject:v50];
            }
          }
        }

        uint64_t v44 = -[NSArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v66,  v84,  16LL);
      }

      while (v44);
    }

    [v65 setObject:v28 forKeyedSubscript:@"TR_PEER_CONTEXTS"];
    int v55 = WiFiDeviceClientTrafficRegistration();
    ucat = v64->_ucat;
    int var0 = ucat->var0;
    if (v55)
    {
      if (var0 <= 90)
      {
        if (var0 == -1)
        {
          ucat = v64->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]",  0x5Au,  (uint64_t)"### Traffic register failed: '%@', %#m\n",  v51,  v52,  v53,  v54,  v62);
      }
    }

    else if (var0 <= 30)
    {
      if (var0 == -1)
      {
        ucat = v64->_ucat;
      }

      -[NSArray count](v42, "count");
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]",  0x1Eu,  (uint64_t)"Traffic registered: '%@', %d peers\n",  v58,  v59,  v60,  v61,  v62);
    }

- (void)_updateTrafficPeerStatusMonitor
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  if (self->_trafficFlagsUnavailableUpdatedHandler || self->_degradeOnAnyTrafficUnavailable)
  {
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    uint64_t v2 = self->_trafficPeersCurrent;
    id v3 = 0LL;
    uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v72,  v77,  16LL);
    if (v4)
    {
      uint64_t v5 = *(void *)v73;
      do
      {
        for (uint64_t i = 0LL; i != v4; ++i)
        {
          if (*(void *)v73 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          if (!v3) {
            id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
          }
          int v8 = [v7 trafficFlags];
          if ((v8 & 0x100) != 0)
          {
            uint64_t v9 = getAWDLTrafficRegistrationServiceAirPlay[0]();
            uint64_t v10 = (void *)v9;
            if (v9) {
              uint64_t v11 = (const __CFString *)v9;
            }
            else {
              uint64_t v11 = &stru_189F34A78;
            }
            [v3 addObject:v11];
          }

          if ((v8 & 0x200) != 0)
          {
            uint64_t v12 = getAWDLTrafficRegistrationServiceSidecar[0]();
            uint64_t v13 = (void *)v12;
            if (v12) {
              uint64_t v14 = (const __CFString *)v12;
            }
            else {
              uint64_t v14 = &stru_189F34A78;
            }
            [v3 addObject:v14];
          }

          if ((v8 & 0x400) != 0)
          {
            uint64_t v15 = getAWDLTrafficRegistrationServiceDeviceToDeviceMigration[0]();
            uint64_t v16 = (void *)v15;
            if (v15) {
              int v17 = (const __CFString *)v15;
            }
            else {
              int v17 = &stru_189F34A78;
            }
            [v3 addObject:v17];
          }

          if ((v8 & 0x1000) != 0)
          {
            uint64_t v18 = getAWDLTrafficRegistrationServiceUniversalControl[0]();
            char v19 = (void *)v18;
            if (v18) {
              v20 = (const __CFString *)v18;
            }
            else {
              v20 = &stru_189F34A78;
            }
            [v3 addObject:v20];
          }

          if ((v8 & 0x2000) != 0)
          {
            uint64_t v21 = getAWDLTrafficRegistrationServiceMPRemoteCamera[0]();
            uint64_t v22 = (void *)v21;
            if (v21) {
              uint64_t v23 = (const __CFString *)v21;
            }
            else {
              uint64_t v23 = &stru_189F34A78;
            }
            [v3 addObject:v23];
          }

          if ((v8 & 0x4000) != 0)
          {
            uint64_t v24 = getAWDLTrafficRegistrationServiceRemoteCamera[0]();
            __int128 v25 = (void *)v24;
            if (v24) {
              __int128 v26 = (const __CFString *)v24;
            }
            else {
              __int128 v26 = &stru_189F34A78;
            }
            [v3 addObject:v26];
          }

          if ((v8 & 0x8000) != 0)
          {
            uint64_t v27 = getAWDLTrafficRegistrationServiceTVRemoteCamera[0]();
            id v28 = (void *)v27;
            if (v27) {
              v29 = (const __CFString *)v27;
            }
            else {
              v29 = &stru_189F34A78;
            }
            [v3 addObject:v29];
          }

          if ((v8 & 0x10000) != 0)
          {
            uint64_t v30 = getAWDLTrafficRegistrationServiceRemoteScreen[0]();
            uint64_t v31 = (void *)v30;
            if (v30) {
              v32 = (const __CFString *)v30;
            }
            else {
              v32 = &stru_189F34A78;
            }
            [v3 addObject:v32];
          }
        }

        uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v72,  v77,  16LL);
      }

      while (v4);
    }

    if ([v3 count])
    {
      wifiP2PStateServices = self->_wifiP2PStateServices;
      v38 = (NSSet *)v3;
      v39 = wifiP2PStateServices;
      if (v38 != v39)
      {
        v40 = v39;
        if ((v38 == 0LL) != (v39 != 0LL))
        {
          char v41 = -[NSSet isEqual:](v38, "isEqual:", v39);

          v42 = self;
          if ((v41 & 1) != 0) {
            goto LABEL_81;
          }
        }

        else
        {

          v42 = self;
        }

        ucat = v42->_ucat;
        if (ucat->var0 > 30) {
          goto LABEL_67;
        }
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        NSPrintF();
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusMonitor]",  0x1Eu,  (uint64_t)"P2P state monitor start: services=%@",  v46,  v47,  v48,  v49,  (char)v45);

LABEL_67:
        objc_storeStrong((id *)&self->_wifiP2PStateServices, v3);
        -[WiFiP2PAWDLStateMonitor endMonitoring](self->_wifiP2PStateMonitor, "endMonitoring");
        wifiP2PStateMonitor = self->_wifiP2PStateMonitor;
        self->_wifiP2PStateMonitor = 0LL;

        uint64_t v51 = (WiFiP2PAWDLStateMonitor *)objc_alloc_init(getWiFiP2PAWDLStateMonitorClass());
        uint64_t v52 = self->_wifiP2PStateMonitor;
        self->_wifiP2PStateMonitor = v51;

        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        uint64_t v53 = v38;
        uint64_t v54 = -[NSSet countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v68,  v76,  16LL);
        if (v54)
        {
          uint64_t v55 = *(void *)v69;
          do
          {
            for (uint64_t j = 0LL; j != v54; ++j)
            {
              if (*(void *)v69 != v55) {
                objc_enumerationMutation(v53);
              }
              v57 = *(void **)(*((void *)&v68 + 1) + 8 * j);
              if ([v57 length]) {
                -[WiFiP2PAWDLStateMonitor registerAvailabilityUpdatesForService:]( self->_wifiP2PStateMonitor,  "registerAvailabilityUpdatesForService:",  v57);
              }
            }

            uint64_t v54 = -[NSSet countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v68,  v76,  16LL);
          }

          while (v54);
        }

        objc_initWeak(&location, self);
        v65[0] = MEMORY[0x1895F87A8];
        v65[1] = 3221225472LL;
        v65[2] = __48__CUWiFiManager__updateTrafficPeerStatusMonitor__block_invoke;
        v65[3] = &unk_189F32FB0;
        objc_copyWeak(&v66, &location);
        -[WiFiP2PAWDLStateMonitor setServiceAvailabilityUpdatedHandler:]( self->_wifiP2PStateMonitor,  "setServiceAvailabilityUpdatedHandler:",  v65);
        -[WiFiP2PAWDLStateMonitor beginMonitoring](self->_wifiP2PStateMonitor, "beginMonitoring");
        objc_destroyWeak(&v66);
        objc_destroyWeak(&location);
        goto LABEL_80;
      }

LABEL_80:
      v42 = self;
      goto LABEL_81;
    }

    v42 = self;
    if (!self->_wifiP2PStateMonitor)
    {
LABEL_81:
      -[CUWiFiManager _updateWiFiState](v42, "_updateWiFiState");

      return;
    }

    uint64_t v43 = self->_ucat;
    if (v43->var0 <= 30)
    {
      if (v43->var0 != -1)
      {
LABEL_60:
        LogPrintF( (uint64_t)v43,  (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusMonitor]",  0x1Eu,  (uint64_t)"P2P state monitor stop",  v33,  v34,  v35,  v36,  v63);
        v42 = self;
        goto LABEL_78;
      }

      BOOL v58 = _LogCategory_Initialize((uint64_t)v43, 0x1Eu);
      v42 = self;
      if (v58)
      {
        uint64_t v43 = self->_ucat;
        goto LABEL_60;
      }
    }

- (void)_updateTrafficPeerStatusUpdated:(id)a3 isAvailable:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  getAWDLTrafficRegistrationServiceAirPlay[0]();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v59 = v8;
  id v11 = v10;
  if (v11 == v59)
  {

    goto LABEL_6;
  }

  if ((v59 == 0LL) == (v11 != 0LL))
  {

    goto LABEL_8;
  }

  char v12 = [v59 isEqual:v11];

  if ((v12 & 1) != 0)
  {
LABEL_6:
    int v13 = 256;
    goto LABEL_58;
  }

- (void)_updateWakeOnWireless
{
  if (self->_wifiManager && self->_wakeOnWirelessEnabledChanged)
  {
    BOOL wakeOnWirelessEnabled = self->_wakeOnWirelessEnabled;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        if (wakeOnWirelessEnabled) {
          id v9 = "no";
        }
        else {
          id v9 = "yes";
        }
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _updateWakeOnWireless]",  0x1Eu,  (uint64_t)"WakeOnWireless: %s -> %s\n",  v2,  v3,  v4,  v5,  (char)v9);
        goto LABEL_10;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }

- (void)_updateWiFiState
{
  unsigned int wifiFlags = self->_wifiFlags;
  int lastTrafficRegistrationErrorCode = self->_lastTrafficRegistrationErrorCode;
  BOOL degradeOnAnyTrafficUnavailable = self->_degradeOnAnyTrafficUnavailable;
  if (self->_degradeOnAnyTrafficUnavailable) {
    BOOL degradeOnAnyTrafficUnavailable = self->_trafficFlagsUnavailable != 0;
  }
  self->_trafficPeerDegraded = degradeOnAnyTrafficUnavailable;
  if ((lastTrafficRegistrationErrorCode == 100 || lastTrafficRegistrationErrorCode == 0)
    && !degradeOnAnyTrafficUnavailable)
  {
    unsigned int v12 = wifiFlags & 0xFFFFFFBF;
  }

  else
  {
    unsigned int v12 = wifiFlags | 0x40;
  }

  unsigned int v13 = v12 & 0xFFFFFF7F | ((lastTrafficRegistrationErrorCode == 100) << 7);
  if (v13 != wifiFlags)
  {
    self->_unsigned int wifiFlags = v13;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _updateWiFiState]",  0x1Eu,  (uint64_t)"Flags changed: %#{flags} -> %#{flags}\n",  v2,  v3,  v4,  v5,  wifiFlags);
    }

- (void)_wifiEnsureStarted
{
  if (!self->_wifiRetrier)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]",  0x1Eu,  (uint64_t)"WiFi start monitoring\n",  v2,  v3,  v4,  v5,  v37);
    }

- (void)_wifiEnsureStopped
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (self->_wifiDevice && -[NSArray count](self->_trafficPeersCurrent, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_7;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_7:
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        unsigned int v13 = self->_trafficPeersCurrent;
        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
        if (v14)
        {
          uint64_t v15 = v14;
          int v16 = 0;
          uint64_t v17 = *(void *)v33;
          do
          {
            for (uint64_t i = 0LL; i != v15; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v13);
              }
              v16 |= [*(id *)(*((void *)&v32 + 1) + 8 * i) trafficFlags];
            }

            uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
          }

          while (v15);
        }

        else
        {
          int v16 = 0;
        }

        trafficPeers = self->_trafficPeers;
        self->_trafficPeers = 0LL;

        if ((v16 & 0x100) != 0)
        {
          -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 256LL);
          if ((v16 & 0x400) == 0)
          {
LABEL_18:
            if ((v16 & 0x1000) == 0) {
              goto LABEL_19;
            }
            goto LABEL_32;
          }
        }

        else if ((v16 & 0x400) == 0)
        {
          goto LABEL_18;
        }

        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 1024LL);
        if ((v16 & 0x1000) == 0)
        {
LABEL_19:
          if ((v16 & 0x2000) == 0) {
            goto LABEL_20;
          }
          goto LABEL_33;
        }

- (void)_wifiAutoJoinNotification:(id)a3
{
  uint64_t v26 = (const __CFDictionary *)a3;
  uint64_t v4 = (const void *)*MEMORY[0x189611998];
  CFTypeID TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v26, v4, TypeID, 0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = -[CUWiFiManager _wifiFlagsUncached](self, "_wifiFlagsUncached");
  int v12 = -[CUWiFiManager _wifiStateUncached](self, "_wifiStateUncached");
  ucat = self->_ucat;
  if (ucat->var0 > 9) {
    goto LABEL_6;
  }
  if (ucat->var0 == -1)
  {
    ucat = self->_ucat;
  }

  LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _wifiAutoJoinNotification:]",  9u,  (uint64_t)"WiFi AutoJoin notification: %@, %s, %#{flags}\n",  v8,  v9,  v10,  v11,  (char)v6);
LABEL_6:
  else {
    int v14 = v12;
  }
  if (v14 == self->_wifiState && v7 == self->_wifiFlags) {
    goto LABEL_34;
  }
  -[__CFDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", *MEMORY[0x189611988]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15) {
    SSID = (void *)WiFiNetworkGetSSID();
  }
  else {
    SSID = 0LL;
  }
  id v21 = SSID;
  uint64_t v22 = self->_ucat;
  if (v22->var0 <= 30)
  {
    if (v22->var0 != -1) {
      goto LABEL_16;
    }
    if (_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
    {
      uint64_t v22 = self->_ucat;
LABEL_16:
      int wifiState = self->_wifiState;
      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          uint64_t v24 = "Unknown";
          goto LABEL_30;
        }

        if (wifiState == 10)
        {
          uint64_t v24 = "Off";
          goto LABEL_30;
        }
      }

      else
      {
        switch(wifiState)
        {
          case 20:
            uint64_t v24 = "NotConnected";
            goto LABEL_30;
          case 30:
            uint64_t v24 = "Connecting";
            goto LABEL_30;
          case 40:
            uint64_t v24 = "Connected";
LABEL_30:
            LogPrintF( (uint64_t)v22,  (uint64_t)"-[CUWiFiManager _wifiAutoJoinNotification:]",  0x1Eu,  (uint64_t)"WiFi state changed: %s -> %s, %#{flags} %?''@\n",  v17,  v18,  v19,  v20,  (char)v24);
            goto LABEL_31;
        }
      }

      uint64_t v24 = "?";
      goto LABEL_30;
    }
  }

- (unsigned)_wifiFlagsUncached
{
  unsigned int v2 = self->_wifiCriticalState << 8;
  if (self->_wifiDevice)
  {
    uint64_t v3 = WiFiDeviceClientCopyCurrentNetwork();
    if (v3)
    {
      uint64_t v4 = (const void *)v3;
      unsigned int AuthFlags = WiFiNetworkGetAuthFlags();
      v2 |= (AuthFlags == 0) | (__rbit32(AuthFlags) >> 27) & 0x1A;
      CFRelease(v4);
    }

    WiFiDeviceClientCopyHostedNetworks();
  }

  return v2;
}

- (int)_wifiStateUncached
{
  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    if (WiFiManagerClientGetPower())
    {
      if (self->_wifiDevice && (uint64_t v4 = (const void *)WiFiDeviceClientCopyCurrentNetwork()) != 0LL)
      {
        CFRelease(v4);
        LODWORD(wifiManager) = 40;
      }

      else
      {
        LODWORD(wifiManager) = 20;
      }
    }

    else
    {
      LODWORD(wifiManager) = 10;
    }
  }

  return (int)wifiManager;
}

- (void)_wifiStateChanged
{
  unsigned int v3 = -[CUWiFiManager _wifiFlagsUncached](self, "_wifiFlagsUncached");
  int v8 = -[CUWiFiManager _wifiStateUncached](self, "_wifiStateUncached");
  int wifiState = self->_wifiState;
  if (__PAIR64__(v8, v3) == *(void *)&self->_wifiFlags)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 10) {
      return;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    if (v8 <= 19)
    {
      if (!v8)
      {
        uint64_t v11 = "Unknown";
        goto LABEL_38;
      }

      if (v8 == 10)
      {
        uint64_t v11 = "Off";
        goto LABEL_38;
      }
    }

    else
    {
      switch(v8)
      {
        case 20:
          uint64_t v11 = "NotConnected";
          goto LABEL_38;
        case 30:
          uint64_t v11 = "Connecting";
          goto LABEL_38;
        case 40:
          uint64_t v11 = "Connected";
LABEL_38:
          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUWiFiManager _wifiStateChanged]",  0xAu,  (uint64_t)"WiFi state changed: %s, %#{flags}\n",  v4,  v5,  v6,  v7,  (char)v11);
          return;
      }
    }

    uint64_t v11 = "?";
    goto LABEL_38;
  }

  int v12 = self->_ucat;
  if (v12->var0 <= 30)
  {
    if (v12->var0 != -1) {
      goto LABEL_11;
    }
    if (_LogCategory_Initialize((uint64_t)v12, 0x1Eu))
    {
      int v12 = self->_ucat;
      int wifiState = self->_wifiState;
LABEL_11:
      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          unsigned int v13 = "Unknown";
          goto LABEL_27;
        }

        if (wifiState == 10)
        {
          unsigned int v13 = "Off";
          goto LABEL_27;
        }
      }

      else
      {
        switch(wifiState)
        {
          case 20:
            unsigned int v13 = "NotConnected";
            goto LABEL_27;
          case 30:
            unsigned int v13 = "Connecting";
            goto LABEL_27;
          case 40:
            unsigned int v13 = "Connected";
LABEL_27:
            LogPrintF( (uint64_t)v12,  (uint64_t)"-[CUWiFiManager _wifiStateChanged]",  0x1Eu,  (uint64_t)"WiFi state changed: %s -> %s, %#{flags}\n",  v4,  v5,  v6,  v7,  (char)v13);
            goto LABEL_28;
        }
      }

      unsigned int v13 = "?";
      goto LABEL_27;
    }
  }

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)infraDisabled
{
  return self->_infraDisabled;
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

- (NSString)label
{
  return self->_label;
}

- (NSArray)trafficPeers
{
  return self->_trafficPeers;
}

- (unsigned)trafficFlagsUnavailable
{
  return self->_trafficFlagsUnavailable;
}

- (id)trafficFlagsUnavailableUpdatedHandler
{
  return self->_trafficFlagsUnavailableUpdatedHandler;
}

- (void)setTrafficFlagsUnavailableUpdatedHandler:(id)a3
{
}

- (BOOL)degradeOnAnyTrafficUnavailable
{
  return self->_degradeOnAnyTrafficUnavailable;
}

- (void)setDegradeOnAnyTrafficUnavailable:(BOOL)a3
{
  self->_BOOL degradeOnAnyTrafficUnavailable = a3;
}

- (BOOL)wakeOnWirelessEnabled
{
  return self->_wakeOnWirelessEnabled;
}

- (unsigned)wifiFlags
{
  return self->_wifiFlags;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (id)wifiStateChangedHandler
{
  return self->_wifiStateChangedHandler;
}

- (void)setWifiStateChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __35__CUWiFiManager__wifiEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void __48__CUWiFiManager__updateTrafficPeerStatusMonitor__block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _updateTrafficPeerStatusUpdated:v8 isAvailable:a3 error:v7];
}

uint64_t __31__CUWiFiManager_performUpdate___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 24LL) = 1;
  return result;
}

_BYTE *__31__CUWiFiManager_performUpdate___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (result[9])
  {
    if (!result[10]) {
      return (_BYTE *)[result _update];
    }
  }

  return result;
}

uint64_t __27__CUWiFiManager_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 10))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 10) = 1;
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

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUWiFiManager invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidating\n",  a5,  a6,  a7,  a8,  v13);
      uint64_t v10 = *(void **)(v9 + 32);
    }

_BYTE *__42__CUWiFiManager__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (!result[24]) {
    return (_BYTE *)[result _update];
  }
  return result;
}

uint64_t __40__CUWiFiManager_activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 16);
  if (*v10 > 30) {
    goto LABEL_5;
  }
  if (*v10 != -1) {
    goto LABEL_3;
  }
  BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v10 = *(int **)(v9 + 16);
LABEL_3:
    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUWiFiManager activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

uint64_t __42__CUWiFiManager_setWakeOnWirelessEnabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 130))
  {
    *(_BYTE *)(v2 + 130) = v1;
    *(_BYTE *)(*(void *)(result + 32) + 127LL) = 1;
  }

  return result;
}

void __33__CUWiFiManager_setTrafficPeers___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 126LL) = 1;
}

uint64_t __34__CUWiFiManager_setInfraDisabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 128))
  {
    *(_BYTE *)(v2 + 128) = v1;
    *(_BYTE *)(*(void *)(result + 32) + 125LL) = 1;
  }

  return result;
}

uint64_t __33__CUWiFiManager_setControlFlags___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 132)) {
    *(_DWORD *)(v2 + 132) = v1;
  }
  return result;
}

@end