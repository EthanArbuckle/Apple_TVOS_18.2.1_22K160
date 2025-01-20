@interface RPLegacyDeviceDiscovery
- (BOOL)scanCache;
- (BOOL)targetUserSession;
- (NSSet)deviceFilter;
- (NSString)serviceType;
- (NSString)wifiSSID;
- (OS_dispatch_queue)dispatchQueue;
- (RPLegacyDeviceDiscovery)init;
- (double)timeout;
- (id)description;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)scanStateChangedHandler;
- (id)timeoutHandler;
- (int)_bleStart;
- (int)_bonjourStart;
- (int)_mdStart;
- (int)_wifiStart;
- (int)rssiThreshold;
- (unsigned)changeFlags;
- (unsigned)deviceActionType;
- (unsigned)scanRate;
- (unsigned)scanState;
- (unsigned)wifiScanFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_bleHandleDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_bleHandleDeviceFound:(id)a3;
- (void)_bleHandleDeviceLost:(id)a3;
- (void)_bonjourHandleAddOrUpdateDevice:(id)a3;
- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4;
- (void)_bonjourHandleRemoveDevice:(id)a3;
- (void)_cleanup;
- (void)_foundDevice:(id)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_lostDeviceByIdentifier:(id)a3;
- (void)_mdHandleDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_mdHandleDeviceFound:(id)a3;
- (void)_mdHandleDeviceLost:(id)a3;
- (void)_wifiHandleDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_wifiHandleDeviceFound:(id)a3;
- (void)_wifiHandleDeviceLost:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setBLEPayloadFilterData:(id)a3 mask:(id)a4;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceActionType:(unsigned __int8)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRssiThreshold:(int)a3;
- (void)setScanCache:(BOOL)a3;
- (void)setScanRate:(unsigned int)a3;
- (void)setScanStateChangedHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setWifiSSID:(id)a3;
- (void)setWifiScanFlags:(unsigned int)a3;
@end

@implementation RPLegacyDeviceDiscovery

- (RPLegacyDeviceDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPLegacyDeviceDiscovery;
  v2 = -[RPLegacyDeviceDiscovery init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_wifiScanFlags = 3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (RPLegacyDeviceDiscovery *)FatalErrorF();
    -[RPLegacyDeviceDiscovery _cleanup](v3, v4);
  }

  else
  {
    -[RPLegacyDeviceDiscovery _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___RPLegacyDeviceDiscovery;
    -[RPLegacyDeviceDiscovery dealloc](&v5, sel_dealloc);
  }

- (void)_cleanup
{
  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0LL;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0LL;

  id deviceChangedHandler = self->_deviceChangedHandler;
  self->_id deviceChangedHandler = 0LL;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0LL;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  id scanStateChangedHandler = self->_scanStateChangedHandler;
  self->_id scanStateChangedHandler = 0LL;

  id timeoutHandler = self->_timeoutHandler;
  self->_id timeoutHandler = 0LL;
}

- (id)description
{
  return 0LL;
}

- (void)setBLEPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    id v16 = v7;
    LogPrintF();
  }

  uint64_t v8 = objc_msgSend(v6, "length", v15, v16);
  if (v8 == [v7 length])
  {
    v9 = (void *)[v6 copy];
    v10 = (void *)[v7 copy];
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke;
    block[3] = &unk_18A032A28;
    block[4] = self;
    id v18 = v9;
    id v19 = v10;
    id v12 = v10;
    id v13 = v9;
    dispatch_async(dispatchQueue, block);
  }

  else
  {
    [v6 length];
    [v7 length];
    uint64_t v14 = FatalErrorF();
    __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke(v14);
  }

void __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke(uint64_t a1)
{
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __50__RPLegacyDeviceDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __50__RPLegacyDeviceDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v10 = a3;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (!self->_invalidateCalled && !self->_activateCalled)
  {
    serviceType = self->_serviceType;
    if (serviceType)
    {
      self->_activateCalled = 1;
      self->_verifyDevices = -[NSString isEqual:](serviceType, "isEqual:", @"RPLegacyServiceTypeSystem");
      if (*-[NSString UTF8String](self->_serviceType, "UTF8String") == 95)
      {
        int v5 = -[RPLegacyDeviceDiscovery _bonjourStart](self, "_bonjourStart");
        goto LABEL_15;
      }

      id v6 = self->_serviceType;
      if ((-[NSString isEqual:](v6, "isEqual:", @"RPLegacyServiceTypeNearbyAction") & 1) != 0
        || (-[NSString isEqual:](v6, "isEqual:", @"RPLegacyServiceTypeNearbyInfo") & 1) != 0
        || -[NSString isEqual:](v6, "isEqual:", @"RPLegacyServiceTypeProximityPairing"))
      {

LABEL_14:
        int v5 = -[RPLegacyDeviceDiscovery _bleStart](self, "_bleStart");
        goto LABEL_15;
      }

      int v9 = -[NSString isEqual:](v6, "isEqual:", @"RPLegacyServiceTypeSystem");

      if (v9) {
        goto LABEL_14;
      }
      if (-[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeMobileDevice"))
      {
        int v5 = -[RPLegacyDeviceDiscovery _mdStart](self, "_mdStart");
        goto LABEL_15;
      }

      if ((-[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeWACAirPlay") & 1) != 0
        || -[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeWACGeneric"))
      {
        int v5 = -[RPLegacyDeviceDiscovery _wifiStart](self, "_wifiStart");
LABEL_15:
        if (!v5) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }

      if (gLogCategory_RPLegacySupport > 90) {
        goto LABEL_20;
      }
    }
  }

- (void)_interrupted
{
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  -[RPLegacyDeviceDiscovery _lostAllDevices](self, "_lostAllDevices");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__RPLegacyDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__RPLegacyDeviceDiscovery_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    -[SFDeviceDiscovery invalidate](self->_bleDiscovery, "invalidate");
    if (self->_bonjourBrowser) {
      BonjourBrowser_Stop();
    }
    -[CUMobileDeviceDiscovery invalidate](self->_mdDiscovery, "invalidate");
    -[CUWiFiScanner invalidate](self->_wifiScanner, "invalidate");
    -[RPLegacyDeviceDiscovery _lostAllDevices](self, "_lostAllDevices");
    -[RPLegacyDeviceDiscovery _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPLegacySupport <= 50
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (!self->_bleDiscovery && !self->_bonjourBrowser && !self->_mdDiscovery && !self->_wifiScanner)
    {
      id invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler) {
        invalidationHandler[2]();
      }
      -[RPLegacyDeviceDiscovery _cleanup](self, "_cleanup");
      self->_invalidateDone = 1;
      if (gLogCategory_RPLegacySupport <= 10
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }

- (void)_foundDevice:(id)a3
{
  id v7 = a3;
  if (([v7 reported] & 1) == 0)
  {
    if (!self->_verifyDevices || (int v4 = [v7 state], v4 == 4) || v4 == 2)
    {
      [v7 setReported:1];
      id deviceFoundHandler = (void (**)(id, void *))self->_deviceFoundHandler;
      if (deviceFoundHandler)
      {
        [v7 device];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        deviceFoundHandler[2](deviceFoundHandler, v6);
      }
    }

    else
    {
      [v7 pairVerify];
    }
  }
}

- (void)_lostDeviceByIdentifier:(id)a3
{
  id v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v7);
    if ([v4 reported])
    {
      id deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
      if (deviceLostHandler)
      {
        [v4 device];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        deviceLostHandler[2](deviceLostHandler, v6);
      }
    }

    [v4 invalidate];
  }
}

- (void)_lostAllDevices
{
  devices = self->_devices;
  self->_devices = 0LL;
}

uint64_t __42__RPLegacyDeviceDiscovery__lostAllDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (int)_bleStart
{
  v3 = (SFDeviceDiscovery *)objc_alloc_init(getSFDeviceDiscoveryClass());
  bleDiscovery = self->_bleDiscovery;
  self->_bleDiscovery = v3;

  -[SFDeviceDiscovery setDeviceFilter:](self->_bleDiscovery, "setDeviceFilter:", self->_deviceFilter);
  -[SFDeviceDiscovery setDispatchQueue:](self->_bleDiscovery, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_rssiThreshold);
  -[SFDeviceDiscovery setScanCache:](self->_bleDiscovery, "setScanCache:", self->_scanCache);
  -[SFDeviceDiscovery setTargetUserSession:](self->_bleDiscovery, "setTargetUserSession:", self->_targetUserSession);
  -[SFDeviceDiscovery setTimeout:](self->_bleDiscovery, "setTimeout:", self->_timeout);
  unsigned int v5 = self->_changeFlags & 1 | (8 * ((self->_changeFlags >> 1) & 1)) | (self->_changeFlags >> 1) & 2 | (self->_changeFlags >> 3) & 4;
  if (self->_changeFlags == -1) {
    unsigned int v5 = -1;
  }
  -[SFDeviceDiscovery setChangeFlags:](self->_bleDiscovery, "setChangeFlags:", v5 | (self->_deviceActionType != 0));
  if (self->_deviceActionType
    || (-[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeNearbyAction") & 1) != 0)
  {
    uint64_t v6 = 16LL;
    goto LABEL_6;
  }

  if ((-[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeNearbyInfo") & 1) != 0) {
    goto LABEL_17;
  }
  if ((-[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeProximityPairing") & 1) != 0)
  {
    uint64_t v6 = 2LL;
LABEL_6:
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleDiscovery, "setDiscoveryFlags:", v6);
    uint64_t scanRate = self->_scanRate;
    if ((int)scanRate > 39)
    {
      if ((_DWORD)scanRate == 40)
      {
        uint64_t scanRate = 40LL;
        goto LABEL_14;
      }

      if ((_DWORD)scanRate == 50)
      {
        uint64_t scanRate = 50LL;
        goto LABEL_14;
      }
    }

    else
    {
      if ((_DWORD)scanRate == 10)
      {
LABEL_14:
        -[SFDeviceDiscovery setScanRate:](self->_bleDiscovery, "setScanRate:", scanRate);
        goto LABEL_15;
      }

      if ((_DWORD)scanRate == 20)
      {
        uint64_t scanRate = 20LL;
        goto LABEL_14;
      }
    }

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bleHandleDeviceFound:a2];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bleHandleDeviceLost:a2];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _bleHandleDeviceChanged:a2 changes:a3];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_RPLegacySupport <= 50
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_6(uint64_t a1)
{
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 200LL);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_RPLegacySupport <= 60)
    {
      uint64_t v6 = v2;
      if (gLogCategory_RPLegacySupport != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();

        return;
      }
    }
  }

  else if (gLogCategory_RPLegacySupport <= 30)
  {
    uint64_t v6 = 0LL;
    if (gLogCategory_RPLegacySupport != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    v3 = 0LL;
    if (v5) {
      goto LABEL_7;
    }
  }
}

- (void)_bleHandleDeviceFound:(id)a3
{
  id v11 = a3;
  [v11 identifier];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_14;
  }

  if (self->_deviceActionType && [v11 deviceActionType] != self->_deviceActionType)
  {
LABEL_14:
    id v7 = 0LL;
    goto LABEL_8;
  }

  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
  if (v5)
  {
    id v7 = (RPDeviceContext *)v5;
  }

  else
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___RPDevice);
    -[RPDevice setIdentifierUUID:](v6, "setIdentifierUUID:", v4);
    -[RPDevice updateWithSFDevice:changes:](v6, "updateWithSFDevice:changes:", v11, 0xFFFFFFFFLL);
    id v7 = objc_alloc_init(&OBJC_CLASS___RPDeviceContext);
    -[RPDeviceContext setDevice:](v7, "setDevice:", v6);
    -[RPDeviceContext setDiscovery:](v7, "setDiscovery:", self);
    devices = self->_devices;
    if (!devices)
    {
      int v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      id v10 = self->_devices;
      self->_devices = v9;

      devices = self->_devices;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v7, v4);
    -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7);
  }

- (void)_bleHandleDeviceLost:(id)a3
{
  id v5 = a3;
  [v5 identifier];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v4);
  }

  else if (gLogCategory_RPLegacySupport <= 90 {
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_bleHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  [v11 identifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_11;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_11:
    uint64_t v8 = 0LL;
    int v9 = 0LL;
    goto LABEL_13;
  }

  uint64_t v8 = v7;
  [v7 device];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 updateWithSFDevice:v11 changes:v4];
  if (self->_deviceActionType && [v11 deviceActionType] != self->_deviceActionType)
  {
    -[RPLegacyDeviceDiscovery _bleHandleDeviceLost:](self, "_bleHandleDeviceLost:", v11);
  }

  else if ([v8 reported])
  {
    id deviceChangedHandler = (void (**)(id, void *, void))self->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2]( deviceChangedHandler,  v9,  v4 & 1 | (2 * ((v4 >> 3) & 1)) & 0xFFFFFFDB | (4 * ((v4 >> 1) & 1)) & 0xFFFFFFDF | (32 * ((v4 >> 2) & 1)));
    }
  }

- (int)_bonjourStart
{
  p_bonjourBrowser = &self->_bonjourBrowser;
  if (self->_bonjourBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(*p_bonjourBrowser);
    *p_bonjourBrowser = 0LL;
  }

  int v4 = BonjourBrowser_Create();
  if (v4
    || (BonjourBrowser_SetDispatchQueue(),
        BonjourBrowser_SetEventHandlerBlock(),
        -[NSString UTF8String](self->_serviceType, "UTF8String"),
        (int v4 = BonjourBrowser_Start()) != 0))
  {
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (*p_bonjourBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_bonjourBrowser);
      *p_bonjourBrowser = 0LL;
    }
  }

  return v4;
}

uint64_t __40__RPLegacyDeviceDiscovery__bonjourStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _bonjourHandleEventType:a2 info:a3];
}

- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  switch(a3)
  {
    case 1u:
      -[RPLegacyDeviceDiscovery _bonjourHandleAddOrUpdateDevice:](self, "_bonjourHandleAddOrUpdateDevice:", v6);
      goto LABEL_12;
    case 2u:
      -[RPLegacyDeviceDiscovery _bonjourHandleRemoveDevice:](self, "_bonjourHandleRemoveDevice:", v6);
      goto LABEL_12;
    case 3u:
      if (self->_bonjourBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_bonjourBrowser);
        self->_bonjourBrowser = 0LL;
      }

      -[RPLegacyDeviceDiscovery _invalidated](self, "_invalidated");
      goto LABEL_12;
    case 4u:
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      -[RPLegacyDeviceDiscovery _interrupted](self, "_interrupted");
LABEL_12:
      id v6 = v7;
      break;
    default:
      break;
  }
}

- (void)_bonjourHandleAddOrUpdateDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int16 v17 = 0;
  uint64_t v16 = 0LL;
  BonjourDevice_GetDeviceID();
  if (v15)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v7 = 0LL;
    uint64_t v8 = 0LL;
    id v5 = 0LL;
  }

  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v16];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v5);
    id v6 = (RPDeviceContext *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      id v7 = v6;
      -[RPDeviceContext device](v6, "device");
      uint64_t v8 = (RPDevice *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = -[RPDevice updateWithBonjourDevice:](v8, "updateWithBonjourDevice:", v4);
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      id deviceChangedHandler = (void (**)(id, RPDevice *, uint64_t))self->_deviceChangedHandler;
      if (deviceChangedHandler) {
        deviceChangedHandler[2](deviceChangedHandler, v8, v9);
      }
    }

    else
    {
      uint64_t v8 = objc_alloc_init(&OBJC_CLASS___RPDevice);
      -[RPDevice setIdentifierUUID:](v8, "setIdentifierUUID:", v5);
      id v7 = objc_alloc_init(&OBJC_CLASS___RPDeviceContext);
      -[RPDeviceContext setDevice:](v7, "setDevice:", v8);
      -[RPDeviceContext setDiscovery:](v7, "setDiscovery:", self);
      devices = self->_devices;
      if (!devices)
      {
        id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        id v12 = self->_devices;
        self->_devices = v11;

        devices = self->_devices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v7, v5);
      -[RPDevice updateWithBonjourDevice:](v8, "updateWithBonjourDevice:", v4);
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7, v8);
      }

      else
      {
        -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7, v14);
      }
    }
  }
}

- (void)_bonjourHandleRemoveDevice:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int16 v8 = 0;
  uint64_t v7 = 0LL;
  BonjourDevice_GetDeviceID();
  if (v6)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v7];
    -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v5);
  }
}

- (int)_mdStart
{
  v3 = (CUMobileDeviceDiscovery *)objc_alloc_init(MEMORY[0x18960ED40]);
  mdDiscovery = self->_mdDiscovery;
  self->_mdDiscovery = v3;

  uint64_t v5 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke;
  v10[3] = &unk_18A033838;
  v10[4] = self;
  -[CUMobileDeviceDiscovery setDeviceFoundHandler:](self->_mdDiscovery, "setDeviceFoundHandler:", v10);
  v9[0] = v5;
  v9[1] = 3221225472LL;
  v9[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_2;
  v9[3] = &unk_18A033838;
  v9[4] = self;
  -[CUMobileDeviceDiscovery setDeviceLostHandler:](self->_mdDiscovery, "setDeviceLostHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472LL;
  v8[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_3;
  v8[3] = &unk_18A033860;
  v8[4] = self;
  -[CUMobileDeviceDiscovery setDeviceChangedHandler:](self->_mdDiscovery, "setDeviceChangedHandler:", v8);
  v7[0] = v5;
  v7[1] = 3221225472LL;
  v7[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_4;
  v7[3] = &unk_18A031A30;
  v7[4] = self;
  -[CUMobileDeviceDiscovery setInvalidationHandler:](self->_mdDiscovery, "setInvalidationHandler:", v7);
  -[CUMobileDeviceDiscovery activate](self->_mdDiscovery, "activate");
  return 0;
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mdHandleDeviceFound:a2];
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mdHandleDeviceLost:a2];
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _mdHandleDeviceChanged:a2 changes:a3];
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_mdHandleDeviceFound:(id)a3
{
  id v11 = a3;
  [v11 identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
    if (v5)
    {
      uint64_t v7 = (RPDeviceContext *)v5;
    }

    else
    {
      int v6 = objc_alloc_init(&OBJC_CLASS___RPDevice);
      -[RPDevice setIdentifierUUID:](v6, "setIdentifierUUID:", v4);
      -[RPDevice updateWithMobileDevice:](v6, "updateWithMobileDevice:", v11);
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___RPDeviceContext);
      -[RPDeviceContext setDevice:](v7, "setDevice:", v6);
      -[RPDeviceContext setDiscovery:](v7, "setDiscovery:", self);
      devices = self->_devices;
      if (!devices)
      {
        uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        id v10 = self->_devices;
        self->_devices = v9;

        devices = self->_devices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v7, v4);
      -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7);
    }
  }

  else
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v7 = 0LL;
  }
}

- (void)_mdHandleDeviceLost:(id)a3
{
  id v5 = a3;
  [v5 identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v4);
  }

  else if (gLogCategory_RPLegacySupport <= 90 {
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_mdHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  id v13 = a3;
  [v13 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }

- (int)_wifiStart
{
  v3 = (CUWiFiScanner *)objc_alloc_init(MEMORY[0x18960EDC0]);
  wifiScanner = self->_wifiScanner;
  self->_wifiScanner = v3;

  -[CUWiFiScanner setDispatchQueue:](self->_wifiScanner, "setDispatchQueue:", self->_dispatchQueue);
  -[CUWiFiScanner setScanFlags:](self->_wifiScanner, "setScanFlags:", self->_wifiScanFlags);
  -[CUWiFiScanner setSsid:](self->_wifiScanner, "setSsid:", self->_wifiSSID);
  self->_wifiAirPlayWAC = -[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeWACAirPlay");
  if (self->_changeFlags == -1) {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v5 = (self->_changeFlags >> 4) & 6 | ((self->_changeFlags & 0xA) != 0);
  }
  -[CUWiFiScanner setChangeFlags:](self->_wifiScanner, "setChangeFlags:", v5);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke;
  v11[3] = &unk_18A033888;
  v11[4] = self;
  -[CUWiFiScanner setDeviceFoundHandler:](self->_wifiScanner, "setDeviceFoundHandler:", v11);
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_2;
  v10[3] = &unk_18A033888;
  v10[4] = self;
  -[CUWiFiScanner setDeviceLostHandler:](self->_wifiScanner, "setDeviceLostHandler:", v10);
  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_3;
  v9[3] = &unk_18A0338B0;
  v9[4] = self;
  -[CUWiFiScanner setDeviceChangedHandler:](self->_wifiScanner, "setDeviceChangedHandler:", v9);
  -[CUWiFiScanner setErrorHandler:](self->_wifiScanner, "setErrorHandler:", &__block_literal_global_93);
  v8[0] = v6;
  v8[1] = 3221225472LL;
  v8[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_5;
  v8[3] = &unk_18A031A30;
  v8[4] = self;
  -[CUWiFiScanner setInvalidationHandler:](self->_wifiScanner, "setInvalidationHandler:", v8);
  -[CUWiFiScanner activate](self->_wifiScanner, "activate");
  return 0;
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _wifiHandleDeviceFound:a2];
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _wifiHandleDeviceLost:a2];
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _wifiHandleDeviceChanged:a2 changes:a3];
}

void __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (gLogCategory_RPLegacySupport <= 60
    && ((uint64_t v5 = v2, gLogCategory_RPLegacySupport != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();
  }

  else
  {
  }

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_wifiHandleDeviceFound:(id)a3
{
  id v13 = a3;
  [v13 identifier];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_15;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
  uint64_t v5 = (RPDeviceContext *)objc_claimAutoreleasedReturnValue();
  [v13 deviceIEDeviceID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = v6;
    if (self->_wifiAirPlayWAC)
    {
      int v8 = [v13 deviceIEFlags];

      if ((v8 & 0x80000000) == 0) {
        goto LABEL_5;
      }
    }

    else
    {
    }

    if (v5)
    {
      -[RPDeviceContext device](v5, "device");
      uint64_t v9 = (RPDevice *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___RPDevice);
      -[RPDevice setIdentifierUUID:](v9, "setIdentifierUUID:", v4);
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___RPDeviceContext);
      -[RPDeviceContext setDevice:](v5, "setDevice:", v9);
      -[RPDeviceContext setDiscovery:](v5, "setDiscovery:", self);
      devices = self->_devices;
      if (!devices)
      {
        uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        id v12 = self->_devices;
        self->_devices = v11;

        devices = self->_devices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v5, v4);
    }

    -[RPDevice updateWithWiFiDevice:changes:](v9, "updateWithWiFiDevice:changes:", v13, 0xFFFFFFFFLL);
    -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v5);

    goto LABEL_14;
  }

- (void)_wifiHandleDeviceLost:(id)a3
{
  id v5 = a3;
  [v5 identifier];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v4);
  }

  else if (gLogCategory_RPLegacySupport <= 90 {
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_wifiHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = a3;
  [v12 identifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (NSSet)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setDeviceFilter:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (int)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int)a3
{
  self->_rssiThreshold = a3;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (unsigned)scanRate
{
  return self->_scanRate;
}

- (void)setScanRate:(unsigned int)a3
{
  self->_uint64_t scanRate = a3;
}

- (unsigned)scanState
{
  return self->_scanState;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unsigned)wifiScanFlags
{
  return self->_wifiScanFlags;
}

- (void)setWifiScanFlags:(unsigned int)a3
{
  self->_wifiScanFlags = a3;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
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

- (id)scanStateChangedHandler
{
  return self->_scanStateChangedHandler;
}

- (void)setScanStateChangedHandler:(id)a3
{
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end