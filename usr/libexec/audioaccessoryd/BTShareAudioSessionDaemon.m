@interface BTShareAudioSessionDaemon
- (BTShareAudioSessionDaemon)init;
- (CUBluetoothDevice)wxDevice;
- (OS_dispatch_queue)dispatchQueue;
- (SDStatusMonitor)statusMonitor;
- (SFDevice)darwinDevice;
- (id)progressHandler;
- (int)_runAdvertiser;
- (int)_runConfirm;
- (int)_runConnectGuestHeadphones;
- (int)_runFinish;
- (int)_runGuestiOSConnect;
- (int)_runGuestiOSPairSetupPublic;
- (int)_runGuestiOSShareAudio;
- (int)_runGuestiOSShareAudioConnect;
- (int)_runInit;
- (int)_runScannerNearbyInfo;
- (int)_runScannerProxPairing;
- (int)_runShareAudioServiceStart;
- (int)_runShowHeadphonesPairingInstructions;
- (int)_runWaitForConfigRequestOrProxTrigger;
- (int)_runWaitForConnectRequest;
- (int)_runWaitForGuestHeadphones;
- (int)_runWaitForGuestHeadphonesPairingMode;
- (int)_runWaitForProxTrigger;
- (int)mode;
- (void)_bleScannerNearbyInfoDeviceFound:(id)a3;
- (void)_bleScannerProxPairingDeviceFound:(id)a3;
- (void)_cleanup;
- (void)_invalidate;
- (void)_pickableRoutesChanged;
- (void)_pickableRoutesChanged:(id)a3;
- (void)_reportError:(id)a3;
- (void)_reportProgress:(int)a3;
- (void)_reportProgress:(int)a3 info:(id)a4;
- (void)_reportProgressTriggeredDevice:(int)a3;
- (void)_run;
- (void)_runDefault;
- (void)_runGuestiOSShareAudioConnectProcessResponse:(id)a3 error:(id)a4;
- (void)_runGuestiOSShareAudioConnectSendRequest;
- (void)_runGuestiOSShareAudioProcessResponse:(id)a3 error:(id)a4;
- (void)_runGuestiOSShareAudioSendRequest;
- (void)_runShareAudioServiceConfigRequest:(id)a3 responseHandler:(id)a4;
- (void)_runShareAudioServiceConfigResponse:(id)a3;
- (void)_runShareAudioServiceConnectRequest:(id)a3 responseHandler:(id)a4;
- (void)_runStory6TV;
- (void)_runStory6iOS;
- (void)activate;
- (void)invalidate;
- (void)setDarwinDevice:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMode:(int)a3;
- (void)setProgressHandler:(id)a3;
- (void)setStatusMonitor:(id)a3;
- (void)setWxDevice:(id)a3;
- (void)userConfirmed:(BOOL)a3;
@end

@implementation BTShareAudioSessionDaemon

- (BTShareAudioSessionDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BTShareAudioSessionDaemon;
  v2 = -[BTShareAudioSessionDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FB50;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FC58;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[BTShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 20LL);
    -[BTShareAudioSessionDaemon _cleanup](self, "_cleanup");
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF(&dword_100234AB8, "-[BTShareAudioSessionDaemon _invalidate]", 30LL, "Invalidated");
    }
  }

- (void)_run
{
  int mode = self->_mode;
  if (mode == 2)
  {
    -[BTShareAudioSessionDaemon _runStory6TV](self, "_runStory6TV");
  }

  else if (mode == 1)
  {
    -[BTShareAudioSessionDaemon _runStory6iOS](self, "_runStory6iOS");
  }

  else
  {
    -[BTShareAudioSessionDaemon _runDefault](self, "_runDefault");
  }

- (void)_runDefault
{
  if (!self->_invalidateCalled)
  {
    unsigned int v3 = -[BTShareAudioSessionDaemon _runInit](self, "_runInit");
    if (v3 == 4 || v3 == 2)
    {
      unsigned int v4 = -[BTShareAudioSessionDaemon _runScannerProxPairing](self, "_runScannerProxPairing");
      if (v4 == 4 || v4 == 2)
      {
        unsigned int v5 = -[BTShareAudioSessionDaemon _runScannerNearbyInfo](self, "_runScannerNearbyInfo");
        if (v5 == 4 || v5 == 2)
        {
          unsigned int v6 = -[BTShareAudioSessionDaemon _runAdvertiser](self, "_runAdvertiser");
          if (v6 == 4 || v6 == 2)
          {
            unsigned int v7 = -[BTShareAudioSessionDaemon _runWaitForProxTrigger](self, "_runWaitForProxTrigger");
            if (v7 == 4 || v7 == 2)
            {
              unsigned int v8 = -[BTShareAudioSessionDaemon _runConfirm](self, "_runConfirm");
              if (v8 == 4 || v8 == 2)
              {
                if (self->_triggerediOS)
                {
                  unsigned int v9 = -[BTShareAudioSessionDaemon _runGuestiOSConnect](self, "_runGuestiOSConnect");
                  if (v9 != 4 && v9 != 2) {
                    return;
                  }
                  unsigned int v10 = -[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic](self, "_runGuestiOSPairSetupPublic");
                  if (v10 != 4 && v10 != 2) {
                    return;
                  }
                  unsigned int v11 = -[BTShareAudioSessionDaemon _runGuestiOSShareAudio](self, "_runGuestiOSShareAudio");
                  if (v11 != 2 && v11 != 4) {
                    return;
                  }
                }

                else if ((-[SFDevice paired](self->_triggeredDevice, "paired") & 1) == 0)
                {
                  unsigned int v12 = -[BTShareAudioSessionDaemon _runShowHeadphonesPairingInstructions]( self,  "_runShowHeadphonesPairingInstructions");
                  if (v12 != 4 && v12 != 2) {
                    return;
                  }
                  unsigned int v13 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphonesPairingMode]( self,  "_runWaitForGuestHeadphonesPairingMode");
                  if (v13 != 4 && v13 != 2) {
                    return;
                  }
                }

                unsigned int v14 = -[BTShareAudioSessionDaemon _runConnectGuestHeadphones](self, "_runConnectGuestHeadphones");
                if (v14 == 4 || v14 == 2)
                {
                  unsigned int v15 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphones](self, "_runWaitForGuestHeadphones");
                  if (v15 == 4 || v15 == 2) {
                    -[BTShareAudioSessionDaemon _runFinish](self, "_runFinish");
                  }
                }
              }
            }
          }
        }
      }
    }
  }

- (void)_runStory6iOS
{
  if (!self->_invalidateCalled)
  {
    unsigned int v3 = -[BTShareAudioSessionDaemon _runInit](self, "_runInit");
    if (v3 == 4 || v3 == 2)
    {
      unsigned int v4 = -[BTShareAudioSessionDaemon _runGuestiOSConnect](self, "_runGuestiOSConnect");
      if (v4 == 4 || v4 == 2)
      {
        unsigned int v5 = -[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic](self, "_runGuestiOSPairSetupPublic");
        if (v5 == 4 || v5 == 2)
        {
          unsigned int v6 = -[BTShareAudioSessionDaemon _runGuestiOSShareAudio](self, "_runGuestiOSShareAudio");
          if (v6 == 4 || v6 == 2)
          {
            unsigned int v7 = -[BTShareAudioSessionDaemon _runConnectGuestHeadphones](self, "_runConnectGuestHeadphones");
            if (v7 == 4 || v7 == 2)
            {
              unsigned int v8 = -[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnect](self, "_runGuestiOSShareAudioConnect");
              if (v8 == 4 || v8 == 2) {
                -[BTShareAudioSessionDaemon _runFinish](self, "_runFinish");
              }
            }
          }
        }
      }
    }
  }

- (void)_runStory6TV
{
  if (!self->_invalidateCalled)
  {
    unsigned int v3 = -[BTShareAudioSessionDaemon _runInit](self, "_runInit");
    if (v3 == 4 || v3 == 2)
    {
      unsigned int v4 = -[BTShareAudioSessionDaemon _runScannerProxPairing](self, "_runScannerProxPairing");
      if (v4 == 4 || v4 == 2)
      {
        unsigned int v5 = -[BTShareAudioSessionDaemon _runShareAudioServiceStart](self, "_runShareAudioServiceStart");
        if (v5 == 4 || v5 == 2)
        {
          unsigned int v6 = -[BTShareAudioSessionDaemon _runAdvertiser](self, "_runAdvertiser");
          if (v6 == 4 || v6 == 2)
          {
            unsigned int v7 = -[BTShareAudioSessionDaemon _runWaitForConfigRequestOrProxTrigger]( self,  "_runWaitForConfigRequestOrProxTrigger");
            if (v7 == 4 || v7 == 2)
            {
              unsigned int v8 = -[BTShareAudioSessionDaemon _runConfirm](self, "_runConfirm");
              if (v8 == 4 || v8 == 2)
              {
                if (self->_configRequestReceived)
                {
                  unsigned int v9 = -[BTShareAudioSessionDaemon _runWaitForConnectRequest](self, "_runWaitForConnectRequest");
                  if (v9 != 2 && v9 != 4) {
                    return;
                  }
                }

                else if ((-[SFDevice paired](self->_triggeredDevice, "paired") & 1) == 0)
                {
                  unsigned int v10 = -[BTShareAudioSessionDaemon _runShowHeadphonesPairingInstructions]( self,  "_runShowHeadphonesPairingInstructions");
                  if (v10 != 4 && v10 != 2) {
                    return;
                  }
                  unsigned int v11 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphonesPairingMode]( self,  "_runWaitForGuestHeadphonesPairingMode");
                  if (v11 != 4 && v11 != 2) {
                    return;
                  }
                }

                unsigned int v12 = -[BTShareAudioSessionDaemon _runConnectGuestHeadphones](self, "_runConnectGuestHeadphones");
                if (v12 == 4 || v12 == 2)
                {
                  unsigned int v13 = -[BTShareAudioSessionDaemon _runWaitForGuestHeadphones](self, "_runWaitForGuestHeadphones");
                  if (v13 == 4 || v13 == 2) {
                    -[BTShareAudioSessionDaemon _runFinish](self, "_runFinish");
                  }
                }
              }
            }
          }
        }
      }
    }
  }

- (int)_runInit
{
  if (!self->_initialized)
  {
    uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"shaHeadphoneTrigger", &v23);
    if (v23) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = Int64 == 0;
    }
    BOOL v5 = !v4;
    self->_prefHeadphoneTrigger = v5;
    uint64_t v6 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"shaiOSTrigger", &v23);
    if (v23) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    BOOL v8 = !v7;
    self->_prefiOSTrigger = v8;
    uint64_t v9 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"shaColorCode", &v23);
    else {
      int v12 = -1;
    }
    self->_prefOverrideColorCode = v12;
    uint64_t v13 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"shaProductID", &v23);
    else {
      int v16 = -1;
    }
    self->_prefOverrideProductID = v16;
    uint64_t v17 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"shaRSSI", 0LL);
    else {
      int v19 = v17;
    }
    self->_prefRSSIThreshold = v19;
    self->_prefRespectDeviceSupport = CFPrefs_GetInt64(@"com.apple.bluetooth", @"ppWS", &v23) == 0;
    if (!self->_preventProxCardsClient)
    {
      v20 = objc_alloc_init(&OBJC_CLASS___SFClient);
      preventProxCardsClient = self->_preventProxCardsClient;
      self->_preventProxCardsClient = v20;

      -[SFClient activateAssertionWithIdentifier:]( self->_preventProxCardsClient,  "activateAssertionWithIdentifier:",  @"com.apple.sharing.PreventProxCards");
    }

    self->_initialized = 1;
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runInit]",  30LL,  "Initialized: RSSI threshold %d",  self->_prefRSSIThreshold);
    }
  }

  return 4;
}

- (int)_runScannerProxPairing
{
  if (!self->_prefHeadphoneTrigger) {
    return 2;
  }
  if (self->_configRequestReceived || self->_triggeredDevice && self->_triggeredNeedsSetupDevice)
  {
    if (self->_bleProxPairingScanner)
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runScannerProxPairing]",  30LL,  "BLE ProxPairing scanner stop on triggered device");
      }

      -[SFDeviceDiscovery invalidate](self->_bleProxPairingScanner, "invalidate");
      bleProxPairingScanner = self->_bleProxPairingScanner;
      self->_bleProxPairingScanner = 0LL;
    }

    return 2;
  }

  if (!self->_bleProxPairingScanner)
  {
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runScannerProxPairing]",  30LL,  "BLE ProxPairing scanner start");
    }

    BOOL v5 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
    uint64_t v6 = self->_bleProxPairingScanner;
    self->_bleProxPairingScanner = v5;
    BOOL v7 = v5;

    -[SFDeviceDiscovery setChangeFlags:](v7, "setChangeFlags:", 13LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](v7, "setDiscoveryFlags:", 2LL);
    -[SFDeviceDiscovery setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](v7, "setPurpose:", @"ShareAudio");
    -[SFDeviceDiscovery setScanRate:](v7, "setScanRate:", 50LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100090514;
    v10[3] = &unk_100206FF8;
    v10[4] = v7;
    v10[5] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v7, "setDeviceFoundHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100090530;
    v9[3] = &unk_100207020;
    v9[4] = v7;
    v9[5] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v7, "setDeviceChangedHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10009054C;
    v8[3] = &unk_100206380;
    v8[4] = v7;
    v8[5] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v7, "activateWithCompletion:", v8);
  }

  return 4;
}

- (int)_runScannerNearbyInfo
{
  if (!self->_prefiOSTrigger) {
    return 2;
  }
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  if (self->_triggeredDevice)
  {
    if (bleNearbyInfoScanner)
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runScannerNearbyInfo]",  30LL,  "BLE NearbyInfo scanner stop on triggered device");
      }

      -[SFDeviceDiscovery invalidate](self->_bleNearbyInfoScanner, "invalidate");
      BOOL v4 = self->_bleNearbyInfoScanner;
      self->_bleNearbyInfoScanner = 0LL;
    }

    return 2;
  }

  if (!bleNearbyInfoScanner)
  {
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runScannerNearbyInfo]",  30LL,  "BLE NearbyInfo scanner start");
    }

    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
    BOOL v7 = self->_bleNearbyInfoScanner;
    self->_bleNearbyInfoScanner = v6;
    BOOL v8 = v6;

    -[SFDeviceDiscovery setChangeFlags:](v8, "setChangeFlags:", 13LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](v8, "setDiscoveryFlags:", 1LL);
    -[SFDeviceDiscovery setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](v8, "setPurpose:", @"ShareAudio");
    -[SFDeviceDiscovery setScanRate:](v8, "setScanRate:", 50LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100090864;
    v11[3] = &unk_100206FF8;
    v11[4] = v8;
    v11[5] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v8, "setDeviceFoundHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100090880;
    v10[3] = &unk_100207020;
    v10[4] = v8;
    v10[5] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v8, "setDeviceChangedHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009089C;
    v9[3] = &unk_100206380;
    v9[4] = v8;
    v9[5] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v8, "activateWithCompletion:", v9);
  }

  return 4;
}

- (int)_runShareAudioServiceStart
{
  if (!self->_shareAudioService)
  {
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runShareAudioServiceStart]",  30LL,  "ShareAudio service start");
    }

    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___BTShareAudioService);
    shareAudioService = self->_shareAudioService;
    self->_shareAudioService = v3;
    BOOL v5 = v3;

    dispatch_queue_t v6 = dispatch_queue_create("ShareAudioService", 0LL);
    -[BTShareAudioService setDispatchQueue:](v5, "setDispatchQueue:", v6);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100090AEC;
    v9[3] = &unk_100209208;
    v9[4] = v5;
    v9[5] = self;
    -[BTShareAudioService setConfigRequestHandler:](v5, "setConfigRequestHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100090B88;
    v8[3] = &unk_100209208;
    v8[4] = v5;
    v8[5] = self;
    -[BTShareAudioService setConnectRequestHandler:](v5, "setConnectRequestHandler:", v8);
    -[BTShareAudioService activate](v5, "activate");
  }

  return 4;
}

- (void)_runShareAudioServiceConfigRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100090EA0;
  v30 = sub_100090EB0;
  id v31 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100090EB8;
  v23[3] = &unk_100206810;
  v25 = &v26;
  id v7 = a4;
  id v24 = v7;
  BOOL v8 = objc_retainBlock(v23);
  if (dword_100234AB8 <= 30 && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL))) {
    LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runShareAudioServiceConfigRequest:responseHandler:]",  30LL,  "Config request: %##@",  v6);
  }
  if (self->_configResponseHandler)
  {
    uint64_t v18 = BTErrorF(4294960575LL, "Already handling config request");
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    unsigned int v11 = (void *)v27[5];
    v27[5] = v19;
  }

  else
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"btAd", TypeID, 0LL);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v11)
    {
      objc_storeStrong((id *)&self->_guestHeadphonesAddress, v11);
      CFTypeID v12 = CFStringGetTypeID();
      uint64_t v13 = CFDictionaryGetTypedValue(v6, @"dname", v12, 0LL);
      unsigned int v14 = (NSString *)objc_claimAutoreleasedReturnValue(v13);
      guestHeadphonesName = self->_guestHeadphonesName;
      self->_guestHeadphonesName = v14;

      self->_guestHeadphonesProductID = CFDictionaryGetInt64Ranged(v6, @"productID", 0LL, 0xFFFFFFFFLL, 0LL);
      id v16 = objc_retainBlock(v7);
      id configResponseHandler = self->_configResponseHandler;
      self->_id configResponseHandler = v16;

      self->_configRequestReceived = 1;
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 100LL);
      -[BTShareAudioSessionDaemon _run](self, "_run");
    }

    else
    {
      uint64_t v20 = BTErrorF(4294960591LL, "No BT addr");
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)v27[5];
      v27[5] = v21;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v26, 8);
}

- (void)_runShareAudioServiceConfigResponse:(id)a3
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  unsigned int v15 = sub_100090EA0;
  id v16 = sub_100090EB0;
  id v17 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100091150;
  v9[3] = &unk_100206810;
  unsigned int v11 = &v12;
  id v3 = a3;
  id v10 = v3;
  BOOL v4 = objc_retainBlock(v9);
  BOOL v5 = (void *)MGCopyAnswer(@"BluetoothAddress", 0LL);
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5, @"btAd");
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runShareAudioServiceConfigResponse:]",  30LL,  "Config response: %##@",  v6);
    }

    (*((void (**)(id, void, void, NSMutableDictionary *))v3 + 2))(v3, 0LL, 0LL, v6);
  }

  else
  {
    uint64_t v7 = BTErrorF(4294960596LL, "Get Bluetooth address failed");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    id v6 = (NSMutableDictionary *)v13[5];
    v13[5] = v8;
  }

  ((void (*)(void *))v4[2])(v4);
  _Block_object_dispose(&v12, 8);
}

- (void)_runShareAudioServiceConnectRequest:(id)a3 responseHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (dword_100234AB8 <= 30 && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL))) {
    LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runShareAudioServiceConnectRequest:responseHandler:]",  30LL,  "Connect request: %##@",  v9);
  }
  id v7 = objc_retainBlock(v6);
  id connectResponseHandler = self->_connectResponseHandler;
  self->_id connectResponseHandler = v7;

  self->_connectRequestReceived = 1;
  -[BTShareAudioSessionDaemon _run](self, "_run");
}

- (int)_runAdvertiser
{
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (self->_triggeredDevice)
  {
    if (bleNearbyActionAdvertiser)
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runAdvertiser]",  30LL,  "BLE advertiser stop on triggered device");
      }

      -[SFService invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
      BOOL v5 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = 0LL;
    }

    return 2;
  }

  else
  {
    if (!bleNearbyActionAdvertiser)
    {
      int DeviceClass = GestaltGetDeviceClass(self);
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF(&dword_100234AB8, "-[BTShareAudioSessionDaemon _runAdvertiser]", 30LL, "BLE advertiser start");
      }

      id v7 = objc_alloc_init(&OBJC_CLASS___SFService);
      uint64_t v8 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = v7;
      id v9 = v7;

      -[SFService setAdvertiseRate:](v9, "setAdvertiseRate:", 60LL);
      if (DeviceClass == 4) {
        uint64_t v10 = 31LL;
      }
      else {
        uint64_t v10 = 27LL;
      }
      -[SFService setDeviceActionType:](v9, "setDeviceActionType:", v10);
      -[SFService setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
      -[SFService setIdentifier:](v9, "setIdentifier:", @"a5989962-d94b-4755-bbca-59ecf498ad2f");
      -[SFService setLabel:](v9, "setLabel:", @"ShareAudio");
      -[SFService setNeedsSetup:](v9, "setNeedsSetup:", 1LL);
      -[SFService setPairSetupDisabled:](v9, "setPairSetupDisabled:", 1LL);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000914A0;
      v11[3] = &unk_100206380;
      v11[4] = v9;
      v11[5] = self;
      -[SFService activateWithCompletion:](v9, "activateWithCompletion:", v11);
    }

    return 4;
  }

- (int)_runWaitForConfigRequestOrProxTrigger
{
  BOOL configRequestReceived = self->_configRequestReceived;
  int result = 4;
  if (!configRequestReceived)
  {
    if (self->_triggeredDevice) {
      return 4;
    }
    else {
      return 1;
    }
  }

  return result;
}

- (int)_runWaitForProxTrigger
{
  if (self->_triggeredDevice) {
    return 4;
  }
  else {
    return 1;
  }
}

- (int)_runWaitForConnectRequest
{
  if (self->_connectRequestReceived) {
    return 4;
  }
  else {
    return 1;
  }
}

- (int)_runConfirm
{
  int confirmState = self->_confirmState;
  if (confirmState == 4)
  {
    id v4 = objc_retainBlock(self->_configResponseHandler);
    id configResponseHandler = self->_configResponseHandler;
    self->_id configResponseHandler = 0LL;

    if (v4) {
      -[BTShareAudioSessionDaemon _runShareAudioServiceConfigResponse:]( self,  "_runShareAudioServiceConfigResponse:",  v4);
    }
  }

  else if (confirmState != 2)
  {
    if (confirmState)
    {
      if (dword_100234AB8 <= 30)
      {
        if (dword_100234AB8 == -1)
        {
          int confirmState = self->_confirmState;
        }

        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runConfirm]",  30LL,  "Confirm not ready yet (%d)",  confirmState);
      }
    }

    else
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runConfirm]",  30LL,  "Confirm start: %@",  self->_triggeredDevice);
      }

      self->_int confirmState = 1;
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 100LL);
    }
  }

  return self->_confirmState;
}

- (int)_runGuestiOSConnect
{
  int guestiOSConnectState = self->_guestiOSConnectState;
  if (guestiOSConnectState != 4 && guestiOSConnectState != 2)
  {
    if (guestiOSConnectState)
    {
      if (dword_100234AB8 <= 30)
      {
        if (dword_100234AB8 == -1)
        {
          int guestiOSConnectState = self->_guestiOSConnectState;
        }

        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSConnect]",  30LL,  "Guest iOS session not ready yet (%d)",  guestiOSConnectState);
      }
    }

    else
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF(&dword_100234AB8, "-[BTShareAudioSessionDaemon _runGuestiOSConnect]", 30LL, "Guest iOS session start");
      }

      self->_int guestiOSConnectState = 1;
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 200LL);
      BOOL v5 = objc_alloc_init(&OBJC_CLASS___SFSession);
      objc_storeStrong((id *)&self->_guestiOSSession, v5);
      -[SFSession setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](v5, "setLabel:", @"ShareAudio");
      darwinDevice = self->_darwinDevice;
      if (!darwinDevice) {
        darwinDevice = self->_triggeredDevice;
      }
      -[SFSession setPeerDevice:](v5, "setPeerDevice:", darwinDevice);
      -[SFSession setServiceIdentifier:](v5, "setServiceIdentifier:", @"com.apple.sharing.ShareAudio");
      -[SFSession setSessionFlags:](v5, "setSessionFlags:", 1LL);
      -[SFSession setStatusMonitor:](v5, "setStatusMonitor:", self->_statusMonitor);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100091994;
      v12[3] = &unk_100206380;
      v12[4] = v5;
      v12[5] = self;
      -[SFSession setErrorHandler:](v5, "setErrorHandler:", v12);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100091AA4;
      v11[3] = &unk_100206358;
      v11[4] = v5;
      v11[5] = self;
      -[SFSession setInterruptionHandler:](v5, "setInterruptionHandler:", v11);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100091B14;
      v10[3] = &unk_100206358;
      v10[4] = v5;
      v10[5] = self;
      -[SFSession setInvalidationHandler:](v5, "setInvalidationHandler:", v10);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100091B84;
      v9[3] = &unk_100206358;
      void v9[4] = v5;
      v9[5] = self;
      -[SFSession setSessionStartedHandler:](v5, "setSessionStartedHandler:", v9);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100091C24;
      v8[3] = &unk_100206380;
      v8[4] = v5;
      v8[5] = self;
      -[SFSession activateWithCompletion:](v5, "activateWithCompletion:", v8);
    }
  }

  return self->_guestiOSConnectState;
}

- (int)_runGuestiOSPairSetupPublic
{
  int guestiOSPairSetupPublicState = self->_guestiOSPairSetupPublicState;
  if (guestiOSPairSetupPublicState != 4 && guestiOSPairSetupPublicState != 2)
  {
    if (guestiOSPairSetupPublicState)
    {
      if (dword_100234AB8 <= 30)
      {
        if (dword_100234AB8 == -1)
        {
          int guestiOSPairSetupPublicState = self->_guestiOSPairSetupPublicState;
        }

        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic]",  30LL,  "Guest iOS PairSetup hasn't succeeded yet (%d)",  guestiOSPairSetupPublicState);
      }
    }

    else
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSPairSetupPublic]",  30LL,  "Guest iOS PairSetup start");
      }

      self->_int guestiOSPairSetupPublicState = 1;
      BOOL v5 = self->_guestiOSSession;
      -[SFSession setFixedPIN:](v5, "setFixedPIN:", @"public");
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100091E94;
      v7[3] = &unk_100206380;
      v7[4] = v5;
      v7[5] = self;
      -[SFSession pairSetupWithFlags:completion:](v5, "pairSetupWithFlags:completion:", 16LL, v7);
    }
  }

  return self->_guestiOSPairSetupPublicState;
}

- (int)_runGuestiOSShareAudio
{
  int guestiOSShareAudioState = self->_guestiOSShareAudioState;
  if (guestiOSShareAudioState != 4 && guestiOSShareAudioState != 2)
  {
    if (guestiOSShareAudioState)
    {
      if (dword_100234AB8 <= 30)
      {
        if (dword_100234AB8 == -1)
        {
          int guestiOSShareAudioState = self->_guestiOSShareAudioState;
        }

        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudio]",  30LL,  "Guest iOS ShareAudio hasn't succeeded yet (%d)",  guestiOSShareAudioState);
      }
    }

    else
    {
      self->_int guestiOSShareAudioState = 1;
      -[BTShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest](self, "_runGuestiOSShareAudioSendRequest");
    }
  }

  return self->_guestiOSShareAudioState;
}

- (void)_runGuestiOSShareAudioSendRequest
{
  if (dword_100234AB8 <= 30 && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL))) {
    LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest]",  30LL,  "Guest iOS ShareAudio start");
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUBluetoothDevice addressString](self->_wxDevice, "addressString"));
  if (v4 || (id v4 = (void *)MGCopyAnswer(@"BluetoothAddress", 0LL)) != 0LL)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"btAd");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUBluetoothDevice name](self->_wxDevice, "name"));
    if (v5 || (BOOL v5 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL)) != 0LL)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"dname");
    }

    id v6 = -[CUBluetoothDevice productIdentifier](self->_wxDevice, "productIdentifier");
    if ((_DWORD)v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"productID");
    }

    guestiOSSession = self->_guestiOSSession;
    dispatchQueue = self->_dispatchQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000922A0;
    v12[3] = &unk_1002073A8;
    v12[4] = guestiOSSession;
    v12[5] = self;
    void v12[6] = v3;
    uint64_t v10 = guestiOSSession;
    -[SFSession appleIDAddProof:dispatchQueue:completion:]( v10,  "appleIDAddProof:dispatchQueue:completion:",  v3,  dispatchQueue,  v12);
  }

  else
  {
    if (dword_100234AB8 <= 90
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioSendRequest]",  90LL,  "### Get iOS ShareAudio get BT addr failed");
    }

    self->_int guestiOSShareAudioState = 3;
    uint64_t v11 = NSErrorF(NSOSStatusErrorDomain, 4294960535LL, "No iOS BT Addr");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v4);
  }
}

- (void)_runGuestiOSShareAudioProcessResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  if (v9)
  {
    if (dword_100234AB8 <= 90
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]",  90LL,  "### Guest iOS ShareAudio error: %{error}",  v9);
    }

    self->_int guestiOSShareAudioState = 3;
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v9);
  }

  else
  {
    if (v8)
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]",  30LL,  "Guest iOS response: %##.16@",  v8);
      }

      uint64_t v10 = self->_guestiOSSession;
      dispatchQueue = self->_dispatchQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10009264C;
      v14[3] = &unk_100209258;
      unsigned int v15 = v10;
      id v16 = self;
      id v17 = v8;
      uint64_t v12 = v10;
      -[SFSession appleIDVerifyProof:dispatchQueue:completion:]( v12,  "appleIDVerifyProof:dispatchQueue:completion:",  v17,  dispatchQueue,  v14);
    }

    else
    {
      if (dword_100234AB8 <= 90
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioProcessResponse:error:]",  90LL,  "### Guest iOS ShareAudio error: no response");
      }

      self->_int guestiOSShareAudioState = 3;
      uint64_t v13 = NSErrorF(NSOSStatusErrorDomain, 4294960584LL, "No response");
      uint64_t v12 = (SFSession *)objc_claimAutoreleasedReturnValue(v13);
      -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v12);
    }
  }
}

- (int)_runGuestiOSShareAudioConnect
{
  int guestiOSShareAudioConnectState = self->_guestiOSShareAudioConnectState;
  if (guestiOSShareAudioConnectState != 4 && guestiOSShareAudioConnectState != 2)
  {
    if (guestiOSShareAudioConnectState)
    {
      if (dword_100234AB8 <= 30)
      {
        if (dword_100234AB8 == -1)
        {
          int guestiOSShareAudioConnectState = self->_guestiOSShareAudioConnectState;
        }

        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnect]",  30LL,  "Guest iOS ShareAudio connect hasn't succeeded yet (%d)",  guestiOSShareAudioConnectState);
      }
    }

    else
    {
      self->_int guestiOSShareAudioConnectState = 1;
      -[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectSendRequest]( self,  "_runGuestiOSShareAudioConnectSendRequest");
    }
  }

  return self->_guestiOSShareAudioConnectState;
}

- (void)_runGuestiOSShareAudioConnectSendRequest
{
  if (dword_100234AB8 <= 30 && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL))) {
    LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectSendRequest]",  30LL,  "Guest iOS ShareAudio connect start");
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  guestiOSSession = self->_guestiOSSession;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100092A74;
  v6[3] = &unk_100209230;
  v6[4] = guestiOSSession;
  v6[5] = self;
  BOOL v5 = guestiOSSession;
  -[SFSession sendRequestID:options:request:responseHandler:]( v5,  "sendRequestID:options:request:responseHandler:",  @"_shCn",  0LL,  v3,  v6);
}

- (void)_runGuestiOSShareAudioConnectProcessResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (dword_100234AB8 <= 90
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectProcessResponse:error:]",  90LL,  "### Guest iOS ShareAudio connect error: %{error}",  v6);
    }

    self->_int guestiOSShareAudioConnectState = 3;
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v6);
  }

  else
  {
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runGuestiOSShareAudioConnectProcessResponse:error:]",  30LL,  "Guest iOS ShareAudio connect response: %##.16@",  v7);
    }

    self->_int guestiOSShareAudioConnectState = 4;
    -[BTShareAudioSessionDaemon _run](self, "_run");
  }
}

- (int)_runShowHeadphonesPairingInstructions
{
  int result = self->_guestHeadphonesInstructionsState;
  if (!result)
  {
    if (!self->_triggeredNeedsSetupDevice)
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runShowHeadphonesPairingInstructions]",  30LL,  "Guest headphone show instructions: %@",  self->_triggeredDevice);
      }

      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 120LL);
    }

    int result = 4;
    self->_guestHeadphonesInstructionsState = 4;
  }

  return result;
}

- (int)_runWaitForGuestHeadphonesPairingMode
{
  if (self->_triggeredNeedsSetupDevice) {
    return 4;
  }
  else {
    return 1;
  }
}

- (int)_runConnectGuestHeadphones
{
  int result = self->_guestHeadphonesConnectState;
  if (!result)
  {
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[CUBluetoothDevice addressString](self->_wxDevice, "addressString"));
    guestHeadphonesAddress = v4;
    if (!v4) {
      guestHeadphonesAddress = self->_guestHeadphonesAddress;
    }
    id v6 = guestHeadphonesAddress;

    guestiOSSession = self->_guestiOSSession;
    if (guestiOSSession) {
      id v8 = guestiOSSession;
    }
    else {
      id v8 = (SFSession *)objc_claimAutoreleasedReturnValue(-[BTShareAudioService sfSession](self->_shareAudioService, "sfSession"));
    }
    id v9 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[SFSession pairingDeriveKeyForIdentifier:keyLength:]( v8,  "pairingDeriveKeyForIdentifier:keyLength:",  @"ShareAudio",  16LL));
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runConnectGuestHeadphones]",  30LL,  "Guest headphone connect start: DA %@, GA %@, GK %{mask}",  v6,  self->_guestDeviceAddress,  v10);
    }

    self->_guestHeadphonesConnectState = 1;
    -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 300LL);
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___BTBluetoothPairingSession);
    objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, v11);
    -[BTBluetoothPairingSession setDeviceAddress:](v11, "setDeviceAddress:", v6);
    -[BTBluetoothPairingSession setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
    if (self->_triggerediOS || !-[SFDevice paired](self->_triggeredDevice, "paired"))
    {
      if (self->_guestDeviceAddress) {
        -[BTBluetoothPairingSession setGuestAddress:](v11, "setGuestAddress:");
      }
      -[BTBluetoothPairingSession setGuestKey:](v11, "setGuestKey:", v10);
      -[BTBluetoothPairingSession setGuestMode:](v11, "setGuestMode:", 1LL);
      -[BTBluetoothPairingSession setGuestPermanent:](v11, "setGuestPermanent:", self->_confirmPermanent);
      if (self->_triggerediOS && !self->_guestiOSContact || self->_mode == 1) {
        -[BTBluetoothPairingSession setUserNotInContacts:](v11, "setUserNotInContacts:", 1LL);
      }
    }

    else
    {
      -[BTBluetoothPairingSession setAggregate:](v11, "setAggregate:", 1LL);
      -[BTBluetoothPairingSession setConnectOnly:](v11, "setConnectOnly:", 1LL);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100092E84;
    v12[3] = &unk_100206380;
    v12[4] = v11;
    v12[5] = self;
    -[BTBluetoothPairingSession setCompletionHandler:](v11, "setCompletionHandler:", v12);
    -[BTBluetoothPairingSession activate](v11, "activate");

    return self->_guestHeadphonesConnectState;
  }

  return result;
}

- (int)_runWaitForGuestHeadphones
{
  int guestiOSWaitForRouteState = self->_guestiOSWaitForRouteState;
  if (guestiOSWaitForRouteState != 4 && guestiOSWaitForRouteState != 2)
  {
    if (guestiOSWaitForRouteState)
    {
      if (dword_100234AB8 <= 30)
      {
        if (dword_100234AB8 == -1)
        {
          int guestiOSWaitForRouteState = self->_guestiOSWaitForRouteState;
        }

        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runWaitForGuestHeadphones]",  30LL,  "Guest iOS wait for headphones hasn't succeeded yet (%d)",  guestiOSWaitForRouteState);
      }
    }

    else
    {
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runWaitForGuestHeadphones]",  30LL,  "Guest iOS waiting for headphones: %@",  self->_guestHeadphonesAddress);
      }

      self->_int guestiOSWaitForRouteState = 1;
      -[BTShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 320LL);
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  AVSystemController_PickableRoutesDidChangeNotification));
      [v5 setAttribute:v6 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v7 addObserver:self selector:"_pickableRoutesChanged:" name:AVSystemController_PickableRoutesDidChangeNotification object:v5];
      self->_observingPickableRoutes = 1;
      -[BTShareAudioSessionDaemon _pickableRoutesChanged](self, "_pickableRoutesChanged");
    }
  }

  return self->_guestiOSWaitForRouteState;
}

- (int)_runFinish
{
  id v3 = objc_retainBlock(self->_connectResponseHandler);
  if (v3)
  {
    if (dword_100234AB8 < 31
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF(&dword_100234AB8, "-[BTShareAudioSessionDaemon _runFinish]", 30LL, "Connect response");
    }

    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0LL, 0LL, &__NSDictionary0__struct);
    id connectResponseHandler = self->_connectResponseHandler;
    self->_id connectResponseHandler = 0LL;
  }

  BOOL v5 = self->_guestHeadphonesRouteUID;
  if (v5)
  {
    if (dword_100234AB8 <= 30
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
    {
      LogPrintF(&dword_100234AB8, "-[BTShareAudioSessionDaemon _runFinish]", 30LL, "Shared audio route ID: '%@'", v5);
    }

    uint64_t v12 = @"mediaRouteID";
    uint64_t v13 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    -[BTShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", 40LL, v6);
  }

  else
  {
    if (dword_100234AB8 <= 90
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _runFinish]",  90LL,  "### Shared audio route ID not found");
    }

    uint64_t v10 = @"error";
    uint64_t v7 = NSErrorWithOSStatusF(4294960569LL, "Audio route not found");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v11 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    -[BTShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", 50LL, v8);
  }

  -[BTShareAudioSessionDaemon _cleanup](self, "_cleanup");
  return 4;
}

- (void)_cleanup
{
  id v3 = objc_retainBlock(self->_configResponseHandler);
  if (v3)
  {
    uint64_t v4 = BTErrorF(4294960544LL, "Session ended");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (dword_100234AB8 < 91
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _cleanup]",  90LL,  "### ShareAudio config request aborted: %{error}\n",  v5);
    }

    (*((void (**)(id, void *, void, void))v3 + 2))(v3, v5, 0LL, 0LL);
    id configResponseHandler = self->_configResponseHandler;
    self->_id configResponseHandler = 0LL;
  }

  id v7 = objc_retainBlock(self->_connectResponseHandler);
  if (v7)
  {
    uint64_t v8 = BTErrorF(4294960544LL, "Session ended");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (dword_100234AB8 < 91
      && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
    {
      LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _cleanup]",  90LL,  "### ShareAudio config request aborted: %{error}\n",  v9);
    }

    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0LL, 0LL);
    id connectResponseHandler = self->_connectResponseHandler;
    self->_id connectResponseHandler = 0LL;
  }

  -[SFService invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0LL;

  -[SFDeviceDiscovery invalidate](self->_bleNearbyInfoScanner, "invalidate");
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  self->_bleNearbyInfoScanner = 0LL;

  -[SFDeviceDiscovery invalidate](self->_bleProxPairingScanner, "invalidate");
  bleProxPairingScanner = self->_bleProxPairingScanner;
  self->_bleProxPairingScanner = 0LL;

  self->_guestHeadphonesConnectState = 0;
  guestHeadphonesAddress = self->_guestHeadphonesAddress;
  self->_guestHeadphonesAddress = 0LL;

  -[BTBluetoothPairingSession invalidate](self->_guestHeadphonesPairingSession, "invalidate");
  guestHeadphonesPairingSession = self->_guestHeadphonesPairingSession;
  self->_guestHeadphonesPairingSession = 0LL;

  -[SFSession invalidate](self->_guestiOSSession, "invalidate");
  guestiOSSession = self->_guestiOSSession;
  self->_guestiOSSession = 0LL;

  if (self->_observingPickableRoutes)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 removeObserver:self name:AVSystemController_PickableRoutesDidChangeNotification object:0];
    self->_observingPickableRoutes = 0;
  }

  -[SFClient invalidate](self->_preventProxCardsClient, "invalidate");
  preventProxCardsClient = self->_preventProxCardsClient;
  self->_preventProxCardsClient = 0LL;

  -[BTShareAudioService invalidate](self->_shareAudioService, "invalidate");
  shareAudioService = self->_shareAudioService;
  self->_shareAudioService = 0LL;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0LL;

  triggeredDevice = self->_triggeredDevice;
  self->_triggeredDevice = 0LL;

  triggeredNeedsSetupDevice = self->_triggeredNeedsSetupDevice;
  self->_triggeredNeedsSetupDevice = 0LL;

  self->_triggerediOS = 0;
}

- (void)_bleScannerNearbyInfoDeviceFound:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_triggeredDevice)
  {
    uint64_t v12 = v5;
    if ([v5 paired])
    {
      id v6 = v12;
      if (dword_100234AB8 <= 10)
      {
        if (dword_100234AB8 != -1 || (v10 = _LogCategory_Initialize(&dword_100234AB8, 10LL), id v6 = v12, v10))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]",  10LL,  "Ignoring same-account device: %@",  v6);
LABEL_12:
          id v6 = v12;
        }
      }
    }

    else
    {
      if (([v12 deviceFlags] & 0x800) != 0)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 bleDevice]);
        id v8 = [v7 rssiEstimate];
        id v9 = v8;
        if ((v8 & 0x80000000) != 0 && (int)v8 >= self->_prefRSSIThreshold)
        {
          if (dword_100234AB8 <= 30
            && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
          {
            LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]",  30LL,  "Triggering proximity ShareAudio (iOS): RSSI %d, %@",  v9,  v12);
          }

          objc_storeStrong((id *)&self->_triggeredDevice, a3);
          self->_triggerediOS = 1;
          -[BTShareAudioSessionDaemon _run](self, "_run");
        }

        else if (dword_100234AB8 <= 10 {
               && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 10LL)))
        }
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]",  10LL,  "Ignoring weak RSSI: %d < %d, %@",  v9,  self->_prefRSSIThreshold,  v12);
        }

        goto LABEL_12;
      }

      id v6 = v12;
      if (dword_100234AB8 <= 10)
      {
        if (dword_100234AB8 != -1 || (v11 = _LogCategory_Initialize(&dword_100234AB8, 10LL), id v6 = v12, v11))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerNearbyInfoDeviceFound:]",  10LL,  "Ignoring unshareable: %@",  v6);
          goto LABEL_12;
        }
      }
    }
  }
}

- (void)_bleScannerProxPairingDeviceFound:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = v5;
  p_triggeredNeedsSetupDevice = &self->_triggeredNeedsSetupDevice;
  if (!self->_triggeredNeedsSetupDevice)
  {
    unsigned int v8 = [v5 needsSetup];
    if ((v8 & 1) != 0 || !self->_triggeredDevice)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 advertisementFields]);

      if ((v8 & 1) == 0
        && self->_prefRespectDeviceSupport
        && ([v6 deviceFlags] & 0x800) == 0)
      {
        if (dword_100234AB8 <= 10
          && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 10LL)))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  10LL,  "Ignoring non-share device: %@",  v6);
        }

        goto LABEL_45;
      }

      if ((CFDictionaryGetInt64Ranged(v10, @"hsStatus", 0LL, 0xFFFFFFFFLL, 0LL) & 0x24) != 0)
      {
        if (dword_100234AB8 <= 10
          && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 10LL)))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  10LL,  "Ignoring in-ear device: %@",  v6);
        }

        goto LABEL_45;
      }

      if (CFDictionaryGetInt64(v10, @"lc", 0LL))
      {
        if (dword_100234AB8 <= 10
          && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 10LL)))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  10LL,  "Ignoring lid-closed device: %@",  v6);
        }

        goto LABEL_45;
      }

      int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
      id v12 = [v11 smoothedRSSI];
      id v13 = v12;
      if ((v12 & 0x80000000) == 0)
      {
        if (dword_100234AB8 <= 10
          && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 10LL)))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  10LL,  "Ignoring invalid RSSI: %d, %@",  v13,  v6);
        }

        goto LABEL_44;
      }

      if (v8) {
        uint64_t v14 = 4294967236LL;
      }
      else {
        uint64_t v14 = 4294967251LL;
      }
      if (v14 > v12)
      {
        if (dword_100234AB8 <= 10
          && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 10LL)))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  10LL,  "Ignoring weak RSSI: %d < %d, %@",  v13,  v14,  v6);
        }

        goto LABEL_44;
      }

      int Int64Ranged = CFDictionaryGetInt64Ranged(v10, @"CnSv", 0LL, 0xFFFFFFFFLL, 0LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 bluetoothAddress]);
      id v17 = v16;
      if (Int64Ranged && [v16 length] == (id)6)
      {
        unsigned int v30 = v8;
        id v31 = v3;
        v33 = v11;
        v34 = v10;
        v35 = v6;
        uint64_t v18 = NSPrintF("%.6a", COERCE_DOUBLE([v17 bytes]));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v20 = (id)objc_claimAutoreleasedReturnValue([v32 attributeForKey:AVSystemController_PickableRoutesAttribute]);
        id v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v37;
          while (2)
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
              if (CFDictionaryGetInt64(v25, AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked, 0LL))
              {
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 objectForKeyedSubscript:AVSystemController_RouteDescriptionKey_RouteUID]);
                if ([v26 rangeOfString:v19 options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  id v6 = v35;
                  if (dword_100234AB8 <= 10
                    && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 10LL)))
                  {
                    LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  10LL,  "Ignoring already-routed device: %@",  v35);
                  }

                  int v11 = v33;
                  int v10 = v34;
                  goto LABEL_43;
                }
              }
            }

            id v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        int v10 = v34;
        id v6 = v35;
        int v11 = v33;
        id v3 = v31;
        unsigned int v8 = v30;
      }

      if (!v17)
      {
        if (dword_100234AB8 <= 90
          && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  90LL,  "Ignoring no address: %@",  v6);
        }

        goto LABEL_43;
      }

      if ([v17 length] != (id)6)
      {
        if (dword_100234AB8 <= 90
          && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 90LL)))
        {
          LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  90LL,  "Ignoring bad address: <%@>, %@",  v17,  v6);
        }

        goto LABEL_43;
      }

      uint64_t v27 = NSPrintF("%.6a", COERCE_DOUBLE([v17 bytes]));
      uint64_t v28 = (NSString *)objc_claimAutoreleasedReturnValue(v27);
      guestHeadphonesAddress = self->_guestHeadphonesAddress;
      self->_guestHeadphonesAddress = v28;

      if (v8)
      {
        if (!self->_triggeredDevice) {
          objc_storeStrong((id *)&self->_triggeredDevice, v3);
        }
      }

      else
      {
LABEL_34:
        p_triggeredNeedsSetupDevice = &self->_triggeredDevice;
      }

      objc_storeStrong((id *)p_triggeredNeedsSetupDevice, v3);
      if (dword_100234AB8 <= 30
        && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
      {
        LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _bleScannerProxPairingDeviceFound:]",  30LL,  "Triggering proximity ShareAudio (Headphones): RSSI %d, %@",  v13,  v6);
      }

      -[BTShareAudioSessionDaemon _run](self, "_run");
LABEL_43:

LABEL_44:
LABEL_45:
    }
  }
}

- (void)_pickableRoutesChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100093F34;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_pickableRoutesChanged
{
  if (self->_guestiOSWaitForRouteState == 1)
  {
    id v3 = self->_guestHeadphonesAddress;
    if (v3)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_PickableRoutesAttribute]);
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v13;
        while (2)
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            int v10 = (NSString *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) objectForKeyedSubscript:AVSystemController_RouteDescriptionKey_RouteUID]);
            if (-[NSString rangeOfString:options:](v10, "rangeOfString:options:", v3, 1LL) != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (dword_100234AB8 <= 30
                && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
              {
                LogPrintF( &dword_100234AB8,  "-[BTShareAudioSessionDaemon _pickableRoutesChanged]",  30LL,  "Guest iOS headphones found: %@",  v10);
              }

              guestHeadphonesRouteUID = self->_guestHeadphonesRouteUID;
              self->_guestHeadphonesRouteUID = v10;

              self->_int guestiOSWaitForRouteState = 4;
              -[BTShareAudioSessionDaemon _run](self, "_run");
              goto LABEL_17;
            }
          }

          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

- (void)_reportError:(id)a3
{
  id v4 = a3;
  uint64_t v8 = @"error";
  id v9 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v6 = objc_retainBlock(self->_progressHandler);
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, 50LL, v5);
  }
}

- (void)_reportProgress:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100234AB8 <= 30 && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
  {
    if ((int)v3 > 119)
    {
      if ((int)v3 <= 219)
      {
        switch((_DWORD)v3)
        {
          case 0x78:
            id v5 = "ShowPairInstructions";
            goto LABEL_39;
          case 0xC8:
            id v5 = "GuestiOSConnecting";
            goto LABEL_39;
          case 0xD2:
            id v5 = "GuestiOSAuthenticated";
            goto LABEL_39;
        }
      }

      else if ((int)v3 > 309)
      {
        if ((_DWORD)v3 == 310)
        {
          id v5 = "GuestHeadphonesConnected";
          goto LABEL_39;
        }

        if ((_DWORD)v3 == 320)
        {
          id v5 = "GuestHeadphonesWaitForRoute";
          goto LABEL_39;
        }
      }

      else
      {
        if ((_DWORD)v3 == 220)
        {
          id v5 = "GuestiOSWaitingForAccept";
          goto LABEL_39;
        }

        if ((_DWORD)v3 == 300)
        {
          id v5 = "GuestHeadphonesConnecting";
          goto LABEL_39;
        }
      }
    }

    else if ((int)v3 <= 29)
    {
      switch((_DWORD)v3)
      {
        case 0:
          id v5 = "Invalid";
          goto LABEL_39;
        case 0xA:
          id v5 = "Activated";
          goto LABEL_39;
        case 0x14:
          id v5 = "Invalidated";
          goto LABEL_39;
      }
    }

    else if ((int)v3 > 49)
    {
      if ((_DWORD)v3 == 50)
      {
        id v5 = "Failed";
        goto LABEL_39;
      }

      if ((_DWORD)v3 == 100)
      {
        id v5 = "Confirm";
        goto LABEL_39;
      }
    }

    else
    {
      if ((_DWORD)v3 == 30)
      {
        id v5 = "Interrupted";
        goto LABEL_39;
      }

      if ((_DWORD)v3 == 40)
      {
        id v5 = "Succeeded";
LABEL_39:
        LogPrintF(&dword_100234AB8, "-[BTShareAudioSessionDaemon _reportProgress:]", 30LL, "Progress: %s", v5);
        goto LABEL_40;
      }
    }

    id v5 = "?";
    goto LABEL_39;
  }

- (void)_reportProgress:(int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v10 = a4;
  if (dword_100234AB8 <= 30 && (dword_100234AB8 != -1 || _LogCategory_Initialize(&dword_100234AB8, 30LL)))
  {
    if ((int)v4 > 119)
    {
      if ((int)v4 > 219)
      {
        if ((int)v4 > 309)
        {
          id v6 = v10;
          if ((_DWORD)v4 == 310)
          {
            id v7 = "GuestHeadphonesConnected";
            goto LABEL_40;
          }

          if ((_DWORD)v4 == 320)
          {
            id v7 = "GuestHeadphonesWaitForRoute";
            goto LABEL_40;
          }
        }

        else
        {
          id v6 = v10;
          if ((_DWORD)v4 == 220)
          {
            id v7 = "GuestiOSWaitingForAccept";
            goto LABEL_40;
          }

          if ((_DWORD)v4 == 300)
          {
            id v7 = "GuestHeadphonesConnecting";
            goto LABEL_40;
          }
        }

- (void)_reportProgressTriggeredDevice:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_triggeredDevice, "bleDevice"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v5 advertisementFields]);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ((self->_prefOverrideColorCode & 0x80000000) == 0)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
LABEL_5:
    id v8 = (void *)v7;
LABEL_6:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"colorCode");
    goto LABEL_7;
  }

  if (self->_guestHeadphonesColorCode)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    goto LABEL_5;
  }

  uint64_t NSNumber = NSDictionaryGetNSNumber(v14, @"cc", 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  if (v8) {
    goto LABEL_6;
  }
LABEL_7:

  guestHeadphonesName = self->_guestHeadphonesName;
  if (guestHeadphonesName) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  guestHeadphonesName,  @"deviceName");
  }
  if (self->_prefOverrideProductID < 0)
  {
    if (!self->_guestHeadphonesProductID)
    {
      uint64_t v13 = NSDictionaryGetNSNumber(v14, @"pid", 0LL);
      int v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (!v11) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
  }

  int v11 = (void *)v10;
LABEL_14:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, @"pid");
LABEL_15:

  -[BTShareAudioSessionDaemon _reportProgress:info:](self, "_reportProgress:info:", v3, v6);
}

- (void)userConfirmed:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100094868;
  v4[3] = &unk_100206F80;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (SFDevice)darwinDevice
{
  return self->_darwinDevice;
}

- (void)setDarwinDevice:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_int mode = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
}

- (CUBluetoothDevice)wxDevice
{
  return self->_wxDevice;
}

- (void)setWxDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end