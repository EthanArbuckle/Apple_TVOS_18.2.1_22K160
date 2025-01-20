@interface SKSetupCaptiveNetworkJoinClient
- (BOOL)_runNetworkRelayPeerStart;
- (SKSetupCaptiveNetworkJoinClient)init;
- (void)_captiveProbeRequest;
- (void)_captiveProbeResponse:(id)a3;
- (void)_invalidate;
- (void)_networkRelayEnsureStopped;
- (void)_postEvent:(id)a3;
- (void)_run;
- (void)_runAWDLFoundDevice:(id)a3;
- (void)_runAWDLFoundTimerStart;
- (void)_runAWDLStart;
- (void)_runCaptiveNetworkLoginResponse:(id)a3;
- (void)_runCaptiveNetworkLoginStart;
- (void)_runNetworkRelaySelfStart;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5;
- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4;
@end

@implementation SKSetupCaptiveNetworkJoinClient

- (SKSetupCaptiveNetworkJoinClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupCaptiveNetworkJoinClient);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)_invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinClient;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_captiveProbeRequest
{
  v7[1] = *MEMORY[0x1895F89C0];
  int var0 = self->super._ucat->var0;
  objc_super v6 = @"timeoutSeconds";
  v7[0] = &unk_18A289328;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __55__SKSetupCaptiveNetworkJoinClient__captiveProbeRequest__block_invoke;
  v5[3] = &unk_18A282118;
  v5[4] = self;
  -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:]( self,  "sendRequestID:requestMessage:options:responseHandler:",  @"_cnPb",  MEMORY[0x189604A60],  v4,  v5);
}

- (void)_captiveProbeResponse:(id)a3
{
}

- (void)_networkRelayEnsureStopped
{
  awdlBrowser = self->_awdlBrowser;
  self->_awdlBrowser = 0LL;

  awdlTimer = self->_awdlTimer;
  if (awdlTimer)
  {
    v5 = awdlTimer;
    dispatch_source_cancel(v5);
    objc_super v6 = self->_awdlTimer;
    self->_awdlTimer = 0LL;
  }

  networkRelayTimer = self->_networkRelayTimer;
  if (networkRelayTimer)
  {
    v8 = networkRelayTimer;
    dispatch_source_cancel(v8);
    v9 = self->_networkRelayTimer;
    self->_networkRelayTimer = 0LL;
  }

  v18 = self->_nrDeviceManager;
  v10 = self->_nrDeviceIdentifier;
  if (v18) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v17 = -[NRDeviceIdentifier nrDeviceIdentifier](v10, "nrDeviceIdentifier");
      LogPrintF();

      -[NRDeviceManager unregisterDevice:](v18, "unregisterDevice:", v10, v17);
    }

    else
    {
      -[NRDeviceManager unregisterDevice:](v18, "unregisterDevice:", v10, v16);
    }
  }

  nrDeviceIdentifier = self->_nrDeviceIdentifier;
  self->_nrDeviceIdentifier = 0LL;

  nrDeviceManager = self->_nrDeviceManager;
  self->_nrDeviceManager = 0LL;

  nrDeviceMonitor = self->_nrDeviceMonitor;
  self->_nrDeviceMonitor = 0LL;
}

- (void)_postEvent:(id)a3
{
  id v4 = a3;
  if ([v4 eventType] == 201)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SKSetupCaptiveNetworkJoinClient _captiveProbeRequest](self, "_captiveProbeRequest", v4);
    }

    else
    {
      -[SKSetupCaptiveNetworkJoinClient _captiveProbeRequest](self, "_captiveProbeRequest", v6);
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SKSetupCaptiveNetworkJoinClient;
    -[SKSetupBase _postEvent:](&v7, sel__postEvent_, v4);
  }
}

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    objc_super v3 = "?";
    id v4 = "User";
    v5 = off_18A2816C8;
    uint64_t v6 = "-[SKSetupCaptiveNetworkJoinClient _run]";
    objc_super v7 = "State: %s -> %s";
    while (1)
    {
      int runState = self->super._runState;
      switch(runState)
      {
        case 0:
          int v9 = 11;
          goto LABEL_27;
        case 11:
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  0LL,  1LL,  1LL,  &__block_literal_global_628);
          goto LABEL_25;
        case 12:
          int v10 = -[SKConnection state](self->super._skCnx, "state");
          int v9 = self->super._runState;
          if (v10 != 1) {
            break;
          }
          goto LABEL_26;
        case 13:
          -[SKSetupCaptiveNetworkJoinClient _runAWDLStart](self, "_runAWDLStart");
          goto LABEL_25;
        case 14:
          if (self->_awdlAdvertiserPeerStarted)
          {
            int v9 = 15;
            goto LABEL_27;
          }

          int v9 = 14;
          break;
        case 15:
          -[SKSetupCaptiveNetworkJoinClient _runAWDLFoundTimerStart](self, "_runAWDLFoundTimerStart");
          goto LABEL_25;
        case 16:
          if (!self->_awdlPeerDevice)
          {
            int v9 = 16;
            break;
          }

          uint64_t v11 = 30LL;
          awdlTimer = self->_awdlTimer;
          if (awdlTimer) {
            goto LABEL_23;
          }
          int v9 = 16;
          goto LABEL_26;
        case 17:
          BOOL v13 = -[SKSetupCaptiveNetworkJoinClient _runNetworkRelayPeerStart](self, "_runNetworkRelayPeerStart");
          int v9 = self->super._runState;
          if (!v13) {
            break;
          }
          goto LABEL_26;
        case 18:
          if (self->_networkRelayPeerIPStr)
          {
            int v9 = 19;
            goto LABEL_27;
          }

          int v9 = 18;
          break;
        case 19:
          -[SKSetupCaptiveNetworkJoinClient _runNetworkRelaySelfStart](self, "_runNetworkRelaySelfStart");
          goto LABEL_25;
        case 20:
          if (!self->_networkRelayProxyInterface)
          {
            int v9 = 20;
            break;
          }

          uint64_t v11 = 33LL;
          awdlTimer = self->_networkRelayTimer;
          if (awdlTimer)
          {
LABEL_23:
            v14 = v4;
            v15 = v3;
            uint64_t v16 = v7;
            v17 = v6;
            v18 = v5;
            v19 = awdlTimer;
            dispatch_source_cancel(v19);
            Class v20 = (&self->super.super.isa)[v11];
            (&self->super.super.isa)[v11] = 0LL;

            v5 = v18;
            uint64_t v6 = v17;
            objc_super v7 = v16;
            objc_super v3 = v15;
            id v4 = v14;
LABEL_25:
            int v9 = self->super._runState;
          }

          else
          {
            int v9 = 20;
          }

- (void)_runAWDLStart
{
  v20[2] = *MEMORY[0x1895F89C0];
  p_awdlBrowser = &self->_awdlBrowser;
  -[CUBonjourBrowser invalidate](self->_awdlBrowser, "invalidate");
  awdlPeerDevice = self->_awdlPeerDevice;
  self->_awdlPeerDevice = 0LL;

  id v5 = objc_alloc_init(MEMORY[0x18960ED20]);
  objc_storeStrong((id *)p_awdlBrowser, v5);
  [v5 setChangeFlags:0xFFFFFFFFLL];
  [v5 setDispatchQueue:self->super._dispatchQueue];
  [v5 setDomain:@"local."];
  [v5 setInterfaceName:@"awdl0"];
  [v5 setServiceType:@"_setupkit._tcp"];
  uint64_t v6 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke;
  v15[3] = &unk_18A281658;
  v15[4] = v5;
  v15[5] = self;
  [v5 setDeviceFoundHandler:v15];
  v14[0] = v6;
  v14[1] = 3221225472LL;
  v14[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_2;
  v14[3] = &unk_18A281680;
  v14[4] = v5;
  v14[5] = self;
  [v5 setDeviceChangedHandler:v14];
  int var0 = self->super._ucat->var0;
  [v5 activate];
  *(void *)((char *)v20 + 5) = 0LL;
  v20[0] = 0LL;
  RandomString();
  v8 = (void *)[objc_alloc(NSString) initWithUTF8String:v20];
  objc_storeStrong((id *)&self->_awdlName, v8);
  int v9 = self->super._ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
  {
    v12 = v8;
    LogPrintF();
  }

  self->_awdlAdvertiserPeerStarted = 0;
  v18 = @"_nm";
  v19 = v8;
  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1, v12);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = @"timeoutSeconds";
  v17 = &unk_18A289328;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472LL;
  v13[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_3;
  v13[3] = &unk_18A282118;
  v13[4] = self;
  -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:]( self,  "sendRequestID:requestMessage:options:responseHandler:",  @"_awSt",  v10,  v11,  v13);
}

- (void)_runAWDLFoundTimerStart
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->super._dispatchQueue);
  awdlTimer = self->_awdlTimer;
  self->_awdlTimer = v3;
  id v5 = v3;

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __58__SKSetupCaptiveNetworkJoinClient__runAWDLFoundTimerStart__block_invoke;
  v6[3] = &unk_18A2820C0;
  v6[4] = v5;
  v6[5] = self;
  dispatch_source_set_event_handler(v5, v6);
  CUDispatchTimerSet();
  dispatch_activate(v5);
}

- (void)_runAWDLFoundDevice:(id)a3
{
  id v13 = a3;
  [v13 name];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  awdlName = self->_awdlName;
  objc_super v7 = v5;
  v8 = awdlName;
  if (v7 == v8)
  {
  }

  else
  {
    int v9 = v8;
    if ((v7 == 0LL) == (v8 != 0LL))
    {

LABEL_13:
      int var0 = self->super._ucat->var0;
      goto LABEL_11;
    }

    char v10 = -[NSString isEqual:](v7, "isEqual:", v8);

    if ((v10 & 1) == 0) {
      goto LABEL_13;
    }
  }

  int v11 = self->super._ucat->var0;
  objc_storeStrong((id *)&self->_awdlPeerDevice, a3);
  -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
LABEL_11:
}

- (BOOL)_runNetworkRelayPeerStart
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (CUGetInterfaceAddresses())
  {
    NSErrorF_safe();
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSetupBase _completeWithError:](self, "_completeWithError:", v11);

    return 0;
  }

  else
  {
    int v3 = SockAddrToString();
    BOOL v4 = v3 == 0;
    if (v3)
    {
      NSErrorF_safe();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", v6);
    }

    else
    {
      [NSString stringWithUTF8String:v19];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = @"_ip";
      v18 = v5;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = @"timeoutSeconds";
      uint64_t v16 = &unk_18A289328;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectOneLine();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }

      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelayPeerStart__block_invoke;
      v13[3] = &unk_18A2816A8;
      v13[4] = self;
      id v14 = v5;
      id v9 = v5;
      -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:]( self,  "sendRequestID:requestMessage:options:responseHandler:",  @"_ntRl",  v6,  v7,  v13);
    }
  }

  return v4;
}

- (void)_runNetworkRelaySelfStart
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v41 = 0LL;
  v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy__582;
  v45 = __Block_byref_object_dispose__583;
  id v46 = 0LL;
  uint64_t v3 = MEMORY[0x1895F87A8];
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke;
  v40[3] = &unk_18A2820E8;
  v40[4] = self;
  v40[5] = &v41;
  BOOL v4 = (void (**)(void))MEMORY[0x1895CC3E8](v40, a2);
  id v5 = self->_nrDeviceManager;
  if (!v5)
  {
    id v5 = (NRDeviceManager *)[MEMORY[0x189611A28] copySharedDeviceManager];
    if (!v5)
    {
      uint64_t v31 = NSErrorF_safe();
      id v5 = (NRDeviceManager *)v42[5];
      v42[5] = (id)v31;
      goto LABEL_27;
    }

    objc_storeStrong((id *)&self->_nrDeviceManager, v5);
  }

  p_nrDeviceIdentifier = &self->_nrDeviceIdentifier;
  objc_super v7 = self->_nrDeviceIdentifier;
  if (v7)
  {
    int var0 = self->super._ucat->var0;
    if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v33 = -[NRDeviceIdentifier nrDeviceIdentifier](v7, "nrDeviceIdentifier");
      LogPrintF();
    }

    -[NRDeviceManager unregisterDevice:](v5, "unregisterDevice:", v7, v33);
    id v9 = *p_nrDeviceIdentifier;
    *p_nrDeviceIdentifier = 0LL;
  }

  char v10 = (void *)[MEMORY[0x189611A20] newEphemeralDeviceIdentifier];
  if (v10)
  {
    objc_storeStrong((id *)&self->_nrDeviceIdentifier, v10);
    id v11 = objc_alloc_init(MEMORY[0x189611A40]);
    v12 = -[NSString UTF8String](self->_networkRelayPeerIPStr, "UTF8String");
    if (v12)
    {
      uint64_t v38 = 0LL;
      if (StringToSockAddr())
      {
        uint64_t v25 = NSErrorF_safe();
        id v14 = v42[5];
        v42[5] = (id)v25;
      }

      else
      {
        id v13 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v39 length:v38];
        [v11 setAwdlAddressData:v13];

        if (-[NSData length](self->super._pskData, "length"))
        {
          -[NSData bytes](self->super._pskData, "bytes");
          -[NSData length](self->super._pskData, "length");
          CryptoHKDF();
          id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603F48]), "initWithBytes:length:", v47, 32, v47);
        }

        else
        {
          skCnx = self->super._skCnx;
          uint64_t v16 = v42;
          id obj = v42[5];
          -[SKConnection deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:]( skCnx,  "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:",  "NetworkRelaySalt",  16LL,  "NetworkRelayInfo",  16LL,  32LL,  &obj);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v16 + 5, obj);
        }

        if (v14)
        {
          [v11 setOutOfBandKey:v14];
          id v17 = objc_alloc_init(MEMORY[0x189611A38]);
          [v17 setAllowedLinkTypes:&unk_18A289220];
          [v17 setAllowedLinkSubtypes:&unk_18A289238];
          [v17 setProxyCapability:2];
          v18 = (void *)[objc_alloc(MEMORY[0x189611A30]) initWithDeviceIdentifier:*p_nrDeviceIdentifier delegate:self queue:self->super._dispatchQueue];
          if (v18)
          {
            objc_storeStrong((id *)&self->_nrDeviceMonitor, v18);
            int v19 = self->super._ucat->var0;
            if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
            {
              v33 = v10;
              v34 = v12;
              LogPrintF();
            }

            dispatchQueue = self->super._dispatchQueue;
            v36[0] = v3;
            v36[1] = 3221225472LL;
            v36[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_74;
            v36[3] = &unk_18A281CC8;
            v36[4] = self;
            -[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]( v5,  "registerDevice:properties:operationalproperties:queue:completionBlock:",  v10,  v11,  v17,  dispatchQueue,  v36,  v33,  v34);
            dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->super._dispatchQueue);
            objc_storeStrong((id *)&self->_networkRelayTimer, v21);
            handler[0] = v3;
            handler[1] = 3221225472LL;
            handler[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_2;
            handler[3] = &unk_18A2820C0;
            handler[4] = v21;
            handler[5] = self;
            dispatch_source_set_event_handler(v21, handler);
            CUDispatchTimerSet();
            dispatch_activate(v21);
          }

          else
          {
            uint64_t v29 = NSErrorF_safe();
            id v30 = v42[5];
            v42[5] = (id)v29;
          }
        }

        else
        {
          v26 = v42;
          id v27 = v42[5];
          if (v27)
          {
            id v28 = v27;
            id v17 = v26[5];
            v26[5] = v28;
          }

          else
          {
            uint64_t v32 = NSErrorF_safe();
            id v17 = v42[5];
            v42[5] = (id)v32;
          }
        }
      }
    }

    else
    {
      uint64_t v23 = NSErrorF_safe();
      id v24 = v42[5];
      v42[5] = (id)v23;
    }
  }

  else
  {
    uint64_t v22 = NSErrorF_safe();
    id v11 = v42[5];
    v42[5] = (id)v22;
  }

LABEL_27:
  v4[2](v4);

  _Block_object_dispose(&v41, 8);
}

- (void)_runCaptiveNetworkLoginStart
{
  v7[1] = *MEMORY[0x1895F89C0];
  int var0 = self->super._ucat->var0;
  uint64_t v6 = @"timeoutSeconds";
  v7[0] = &unk_18A289328;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __63__SKSetupCaptiveNetworkJoinClient__runCaptiveNetworkLoginStart__block_invoke;
  v5[3] = &unk_18A282118;
  v5[4] = self;
  -[SKSetupBase sendRequestID:requestMessage:options:responseHandler:]( self,  "sendRequestID:requestMessage:options:responseHandler:",  @"_cnLg",  MEMORY[0x189604A60],  v4,  v5);
}

- (void)_runCaptiveNetworkLoginResponse:(id)a3
{
  id v9 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v5];
      if (v6)
      {
        objc_super v7 = self->_networkRelayProxyInterface;
        if (v7)
        {
          v8 = -[SKEventCaptiveNetworkPresent initWithCaptiveURL:interfaceIdentifier:ssid:]( objc_alloc(&OBJC_CLASS___SKEventCaptiveNetworkPresent),  "initWithCaptiveURL:interfaceIdentifier:ssid:",  v6,  v7,  v4);
          -[SKSetupBase _reportEvent:](self, "_reportEvent:", v8);
          self->_captiveNetworkLoginDone = 1;
          -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
        }

        else
        {
          NSErrorF_safe();
          v8 = (SKEventCaptiveNetworkPresent *)objc_claimAutoreleasedReturnValue();
          -[SKSetupBase _completeWithError:](self, "_completeWithError:", v8);
        }
      }

      else
      {
        NSErrorF_safe();
        objc_super v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        -[SKSetupBase _completeWithError:](self, "_completeWithError:", v7, v5);
      }
    }

    else
    {
      NSErrorF_safe();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", v6);
    }
  }

  else
  {
    NSErrorF_safe();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSetupBase _completeWithError:](self, "_completeWithError:", v5);
  }
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  [v10 proxyServiceInterfaceName];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    [v10 linkType];
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    [v10 linkSubtype];
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();
  }

  if (v4 && !self->_networkRelayProxyInterface && [v6 length])
  {
    objc_storeStrong((id *)&self->_networkRelayProxyInterface, v6);
    -[SKSetupCaptiveNetworkJoinClient _run](self, "_run");
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id StringFromNRLinkType = (id)createStringFromNRLinkType();
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();
  }

- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30)
  {
    v8 = v16;
    if (var0 != -1)
    {
LABEL_3:
      else {
        id v9 = "no";
      }
      [v16 linkType];
      id StringFromNRLinkType = (void *)createStringFromNRLinkType();
      [v16 linkSubtype];
      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
      [v16 proxyServiceInterfaceName];
      id v14 = StringFromNRLinkSubtype;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      id v13 = StringFromNRLinkType;
      LogPrintF();

      goto LABEL_8;
    }

    if (_LogCategory_Initialize())
    {
      v8 = v16;
      goto LABEL_3;
    }
  }

- (void).cxx_destruct
{
}

void __63__SKSetupCaptiveNetworkJoinClient__runCaptiveNetworkLoginStart__block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  id v11 = *(_DWORD ***)(a1 + 32);
  int v12 = *v11[18];
  id v19 = v10;
  if (!v10 || v9)
  {
    if (v12 <= 90)
    {
      if (v12 != -1 || (v15 = _LogCategory_Initialize(), id v11 = *(_DWORD ***)(a1 + 32), v15))
      {
        CUPrintNSError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        id v11 = *(_DWORD ***)(a1 + 32);
      }
    }

    if (v9)
    {
      [v11 _completeWithError:v9];
    }

    else
    {
      NSErrorF_safe();
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 _completeWithError:v16];
    }
  }

  else
  {
    id v13 = v10;
    if (v12 <= 30)
    {
      if (v12 != -1 || (v14 = _LogCategory_Initialize(), id v11 = *(_DWORD ***)(a1 + 32), v14))
      {
        CUPrintNSObjectOneLine();
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        id v13 = v19;
        id v11 = *(_DWORD ***)(a1 + 32);
      }

      else
      {
        id v13 = v19;
      }
    }

    objc_msgSend(v11, "_runCaptiveNetworkLoginResponse:", v13, v17);
  }
}

uint64_t __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40LL))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        CUPrintNSError();
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    return [v3 _completeWithError:*(void *)(*(void *)(v1 + 8) + 40)];
  }

  return result;
}

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_74(uint64_t a1, void *a2)
{
  id v10 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32LL));
  uint64_t v3 = v10;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[18];
  if (v10)
  {
    if (v5 <= 90 && (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6)))
    {
      CUPrintNSError();
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v10, v9);
    }

    else
    {
      objc_msgSend(v4, "_completeWithError:", v10, v8);
    }

    goto LABEL_10;
  }

  if (v5 <= 30)
  {
    if (v5 != -1 || (v7 = _LogCategory_Initialize(), uint64_t v3 = 0LL, v7))
    {
      LogPrintF();
LABEL_10:
      uint64_t v3 = v10;
    }
  }
}

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1 == (void *)v2[33])
  {
    if (v1)
    {
      int v4 = v1;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(void **)(v5 + 264);
      *(void *)(v5 + 264) = 0LL;

      uint64_t v2 = *(void **)(a1 + 40);
    }

    NSErrorF_safe();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _completeWithError:v7];
  }

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelayPeerStart__block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v24 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v24 || v8)
  {
    int v14 = *(_DWORD ***)(a1 + 32);
    int v15 = *v14[18];
    if (v15 <= 90)
    {
      if (v15 != -1 || (int v16 = _LogCategory_Initialize(), v14 = *(_DWORD ***)(a1 + 32), v16))
      {
        CUPrintNSError();
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        int v14 = *(_DWORD ***)(a1 + 32);
      }
    }

    if (v8)
    {
      [v14 _completeWithError:v8];
    }

    else
    {
      NSErrorF_safe();
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 _completeWithError:v17];
    }
  }

  else
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    uint64_t v10 = [v9 UTF8String];
    id v11 = *(id **)(a1 + 32);
    if (v10)
    {
      objc_storeStrong(v11 + 31, v9);
      int v12 = *(_DWORD ***)(a1 + 32);
      int v13 = *v12[18];
      if (v13 <= 30 && (v13 != -1 || (v18 = _LogCategory_Initialize(), int v12 = *(_DWORD ***)(a1 + 32), v18)))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 32), "_run", v21, v9);
      }

      else
      {
        objc_msgSend(v12, "_run", v20, v23);
      }
    }

    else
    {
      NSErrorF_safe();
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 _completeWithError:v19];
    }
  }
}

void __58__SKSetupCaptiveNetworkJoinClient__runAWDLFoundTimerStart__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1 == (void *)v2[30])
  {
    if (v1)
    {
      int v4 = v1;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(void **)(v5 + 240);
      *(void *)(v5 + 240) = 0LL;

      uint64_t v2 = *(void **)(a1 + 40);
    }

    NSErrorF_safe();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _completeWithError:v7];
  }

void *__48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[27]) {
    return (void *)[result _runAWDLFoundDevice:a2];
  }
  return result;
}

void *__48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[27]) {
    return (void *)[result _runAWDLFoundDevice:a2];
  }
  return result;
}

void __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_3( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = **(_DWORD **)(v9 + 144);
  if (!v15 || v8)
  {
    if (v10 <= 90)
    {
      if (v10 != -1 || (v12 = _LogCategory_Initialize(), uint64_t v9 = *(void *)(a1 + 32), v12))
      {
        CUPrintNSError();
        int v14 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        uint64_t v9 = *(void *)(a1 + 32);
      }
    }

    if (v8)
    {
      [(id)v9 _completeWithError:v8];
    }

    else
    {
      NSErrorF_safe();
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v9 _completeWithError:v13];
    }
  }

  else
  {
    if (v10 <= 30)
    {
      if (v10 != -1 || (int v11 = _LogCategory_Initialize(), v9 = *(void *)(a1 + 32), v11))
      {
        LogPrintF();
        uint64_t v9 = *(void *)(a1 + 32);
      }
    }

    *(_BYTE *)(v9 + 210) = 1;
    [*(id *)(a1 + 32) _run];
  }
}

void __55__SKSetupCaptiveNetworkJoinClient__captiveProbeRequest__block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  int v11 = *(_DWORD ***)(a1 + 32);
  int v12 = *v11[18];
  id v19 = v10;
  if (!v10 || v9)
  {
    if (v12 <= 90)
    {
      if (v12 != -1 || (v15 = _LogCategory_Initialize(), int v11 = *(_DWORD ***)(a1 + 32), v15))
      {
        CUPrintNSError();
        int v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        int v11 = *(_DWORD ***)(a1 + 32);
      }
    }

    if (v9)
    {
      [v11 _completeWithError:v9];
    }

    else
    {
      NSErrorF_safe();
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 _completeWithError:v16];
    }
  }

  else
  {
    id v13 = v10;
    if (v12 <= 30)
    {
      if (v12 != -1 || (v14 = _LogCategory_Initialize(), int v11 = *(_DWORD ***)(a1 + 32), v14))
      {
        CUPrintNSObjectOneLine();
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        id v13 = v19;
        int v11 = *(_DWORD ***)(a1 + 32);
      }

      else
      {
        id v13 = v19;
      }
    }

    objc_msgSend(v11, "_captiveProbeResponse:", v13, v17);
  }
}

@end