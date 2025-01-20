@interface CBDiscovery
+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 endpoint:(id)a4 error:(id *)a5;
+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 error:(id *)a4;
- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr;
- (BOOL)bleSensorEnableRssiIncreaseScan;
- (BOOL)denyLowPowerModeScans;
- (BOOL)denyScreenLockedScans;
- (BOOL)disabledActive;
- (BOOL)disabledPending;
- (BOOL)discoveryTypesContainTypes:(id *)a3;
- (BOOL)keepAlive;
- (BOOL)needsAdvertisingAddress;
- (BOOL)needsBLEScan;
- (BOOL)needsIdentify;
- (BOOL)updateWithCBDiscovery:(id)a3;
- (CBDevice)remoteDevice;
- (CBDiscovery)init;
- (CBDiscovery)initWithXPCObject:(id)a3 error:(id *)a4;
- (CBSpatialInteractionFilter)spatialInteractionfilter;
- (NSArray)deviceFilter;
- (NSArray)discoveredDevices;
- (NSArray)oobKeys;
- (NSArray)serviceUUIDs;
- (NSArray)typeToRssiThresholds;
- (NSArray)useCaseClientIDs;
- (NSString)appID;
- (NSString)label;
- (NSString)mockID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)testListenerEndpoint;
- (OS_xpc_object)xpcSubscriberRepresentation;
- (char)bleRSSIThresholdHint;
- (char)bleSensorRssiIncreaseScanThreshold;
- (id)_ensureXPCStarted;
- (id)bluetoothStateChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)devicesBufferedHandler;
- (id)errorHandler;
- (id)finishHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)systemOverrideHandler;
- (int)bleScanRate;
- (int)bleScanRateOverride;
- (int)bleScanRateScreenOff;
- (int64_t)bluetoothState;
- (unint64_t)changeFlags;
- (unint64_t)discoveryFlags;
- (unint64_t)extraDiscoveryFlags;
- (unint64_t)updateWithXPCSubscriberInfo:(id)a3;
- (unsigned)bleRSSIThresholdOrder;
- (unsigned)bleSensorIncreaseScanRate;
- (unsigned)bleSensorIncreaseScanTimeout;
- (unsigned)bleSensorTimeoutBetweenIncreaseScan;
- (unsigned)clientID;
- (unsigned)deviceSetupState;
- (unsigned)internalFlags;
- (unsigned)memoryPressureFlags;
- (unsigned)systemOverrideFlags;
- (unsigned)useCase;
- (void)_activate;
- (void)_activateDirectStart;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_xpcReceivedDeviceFound:(id)a3;
- (void)_xpcReceivedDeviceLost:(id)a3;
- (void)_xpcReceivedDevicesBuffered:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)_xpcReceivedPowerStateChanged:(id)a3;
- (void)_xpcReceivedSystemOverrideChanged:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addDiscoveryType:(int)a3;
- (void)clearDuplicateFilterCache;
- (void)dealloc;
- (void)encodeWithXPCObject:(id)a3;
- (void)finish;
- (void)invalidate;
- (void)removeAllDiscoveryTypes;
- (void)removeDiscoveryType:(int)a3;
- (void)reportMockDeviceFound:(id)a3;
- (void)reportMockDeviceLost:(id)a3;
- (void)setAppID:(id)a3;
- (void)setBleRSSIThresholdHint:(char)a3;
- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3;
- (void)setBleScanRate:(int)a3;
- (void)setBleScanRateOverride:(int)a3;
- (void)setBleScanRateScreenOff:(int)a3;
- (void)setBleSensorEnableRssiIncreaseScan:(BOOL)a3;
- (void)setBleSensorIncreaseScanRate:(unsigned int)a3;
- (void)setBleSensorIncreaseScanTimeout:(unsigned int)a3;
- (void)setBleSensorRssiIncreaseScanThreshold:(char)a3;
- (void)setBleSensorTimeoutBetweenIncreaseScan:(unsigned int)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setChangeFlags:(unint64_t)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDenyLowPowerModeScans:(BOOL)a3;
- (void)setDenyScreenLockedScans:(BOOL)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDeviceSetupState:(unsigned __int8)a3;
- (void)setDevicesBufferedHandler:(id)a3;
- (void)setDisabledActive:(BOOL)a3;
- (void)setDisabledPending:(BOOL)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setExtraDiscoveryFlags:(unint64_t)a3;
- (void)setFinishHandler:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setKeepAlive:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMemoryPressureFlags:(unsigned int)a3;
- (void)setMockID:(id)a3;
- (void)setOobKeys:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setServiceUUIDs:(id)a3;
- (void)setSpatialInteractionFilter:(id)a3;
- (void)setSpatialInteractionfilter:(id)a3;
- (void)setSystemOverrideFlags:(unsigned int)a3;
- (void)setSystemOverrideHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTypeToRssiThresholds:(id)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUseCaseClientIDs:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation CBDiscovery

- (CBDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CBDiscovery;
  v2 = -[CBDiscovery init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBDiscovery;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = self->_mockID;
  v4 = v3;
  if (v3) {
    CBMockRemoveDiscovery(v3, self);
  }
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBDiscovery;
  -[CBDiscovery dealloc](&v6, sel_dealloc);
}

- (CBDiscovery)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = -[CBDiscovery init](self, "init");
  if (!v13)
  {
    if (!a4) {
      goto LABEL_76;
    }
    v34 = "CBDiscovery init failed";
LABEL_75:
    CBErrorF(-6756, (uint64_t)v34, v7, v8, v9, v10, v11, v12, v35);
    v32 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_70;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (!a4) {
      goto LABEL_76;
    }
    v34 = "XPC non-dict";
    goto LABEL_75;
  }

  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_bleRSSIThresholdOrder = 0;
  }

  else if (v14 == 5)
  {
    goto LABEL_76;
  }

  int v15 = CUXPCDecodeSInt64RangedEx();
  if (v15 == 6)
  {
    v13->_bleRSSIThresholdHint = 0;
  }

  else if (v15 == 5)
  {
    goto LABEL_76;
  }

  int v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v13->_bleScanRate = 0;
  }

  else if (v16 == 5)
  {
    goto LABEL_76;
  }

  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v13->_bleScanRateScreenOff = 0;
  }

  else if (v17 == 5)
  {
    goto LABEL_76;
  }

  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v13->_clientID = 0;
  }

  else if (v18 == 5)
  {
    goto LABEL_76;
  }

  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v13->_discoveryFlags = 0LL;
  }

  else if (v19 == 5)
  {
    goto LABEL_76;
  }

  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_internalFlags = 0;
  }

  else if (v20 == 5)
  {
    goto LABEL_76;
  }

  objc_opt_class();
  p_oobKeys = (id *)&v13->_oobKeys;
  if (*p_oobKeys)
  {
    if ([*p_oobKeys count])
    {
      if (!v13->_discoveryFlags)
      {
        int var0 = v13->_ucat->var0;
      }
    }
  }

  objc_opt_class();
  p_serviceUUIDs = (id *)&v13->_serviceUUIDs;
  if (*p_serviceUUIDs)
  {
    if ([*p_serviceUUIDs count])
    {
      if (!v13->_discoveryFlags)
      {
        int v24 = v13->_ucat->var0;
      }
    }
  }

  objc_opt_class();
  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v13->_useCase = 0;
  }

  else if (v25 == 5)
  {
    goto LABEL_76;
  }

  int v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v13->_bleSensorRssiIncreaseScanThreshold = 0;
  }

  else if (v26 == 5)
  {
    goto LABEL_76;
  }

  v13->_bleSensorEnableRssiIncreaseScan = 1;
  int v27 = CUXPCDecodeUInt64RangedEx();
  if (v27 == 6)
  {
    v13->_bleSensorIncreaseScanRate = 0;
  }

  else if (v27 == 5)
  {
    goto LABEL_76;
  }

  int v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v13->_bleSensorIncreaseScanTimeout = 0;
  }

  else if (v28 == 5)
  {
    goto LABEL_76;
  }

  int v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 != 6)
  {
    if (v29 != 5) {
      goto LABEL_60;
    }
LABEL_76:
    v32 = 0LL;
    goto LABEL_70;
  }

  v13->_bleSensorTimeoutBetweenIncreaseScan = 0;
LABEL_60:
  objc_opt_class();
  objc_opt_class();
  p_typeToRssiThresholds = (id *)&v13->_typeToRssiThresholds;
  if (*p_typeToRssiThresholds)
  {
    if ([*p_typeToRssiThresholds count])
    {
      if (((char)v13->_discoveryTypesInternal.bitArray[3] & 0x80000000) == 0)
      {
        int v31 = v13->_ucat->var0;
      }
    }
  }

  v32 = v13;
LABEL_70:

  return v32;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (self->_bleRSSIThresholdOrder) {
    xpc_dictionary_set_uint64(v4, "blRO", self->_bleRSSIThresholdOrder);
  }
  int64_t bleScanRate = self->_bleScanRate;
  if ((_DWORD)bleScanRate) {
    xpc_dictionary_set_int64(xdict, "blSR", bleScanRate);
  }
  int64_t bleScanRateScreenOff = self->_bleScanRateScreenOff;
  if ((_DWORD)bleScanRateScreenOff) {
    xpc_dictionary_set_int64(xdict, "blSO", bleScanRateScreenOff);
  }
  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
  CUXPCEncodeNSArrayOfNSString();
  uint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags) {
    xpc_dictionary_set_uint64(xdict, "dsFl", discoveryFlags);
  }
  if (*(_DWORD *)self->_discoveryTypesInternal.bitArray | self->_discoveryTypesInternal.bitArray[4]) {
    size_t v9 = 5LL;
  }
  else {
    size_t v9 = 1LL;
  }
  xpc_dictionary_set_data(xdict, "dsTy", &self->_discoveryTypesInternal, v9);
  uint64_t internalFlags = self->_internalFlags;
  CUXPCEncodeNSArrayOfObjects();
  CUXPCEncodeNSArrayOfObjects();
  CUXPCEncodeObject();
  uint64_t useCase = self->_useCase;
  if ((_DWORD)useCase) {
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  }
  CUXPCEncodeNSArrayOfNSString();
  if (self->_bleSensorRssiIncreaseScanThreshold) {
    xpc_dictionary_set_int64(xdict, "bsIT", self->_bleSensorRssiIncreaseScanThreshold);
  }
  if (self->_bleSensorEnableRssiIncreaseScan) {
    xpc_dictionary_set_BOOL(xdict, "bsEI", 1);
  }
  uint64_t bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
  if ((_DWORD)bleSensorIncreaseScanRate) {
    xpc_dictionary_set_uint64(xdict, "bsIS", bleSensorIncreaseScanRate);
  }
  uint64_t bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
  if ((_DWORD)bleSensorIncreaseScanTimeout) {
    xpc_dictionary_set_uint64(xdict, "bsTO", bleSensorIncreaseScanTimeout);
  }
  uint64_t bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
  if ((_DWORD)bleSensorTimeoutBetweenIncreaseScan) {
    xpc_dictionary_set_uint64(xdict, "bsBT", bleSensorTimeoutBetweenIncreaseScan);
  }
  CUXPCEncodeObject();
  CUXPCEncodeNSArrayOfObjects();
}

- (id)description
{
  return -[CBDiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  v40[2] = 0LL;
  NSAppendPrintF_safe();
  id v4 = 0LL;
  if (self->_discoveryFlags)
  {
    v40[1] = v4;
    CUPrintFlags64();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v5 = v4;

    id v4 = v5;
  }

  v40[0] = v4;
  CBDiscoveryTypesAppendString((uint64_t)v40, (uint64_t)", DsTy", (uint64_t)&self->_discoveryTypesInternal);
  id v6 = v40[0];

  if (self->_bleScanRate)
  {
    NSAppendPrintF_safe();
    id v7 = v6;

    id v6 = v7;
  }

  if (self->_bleScanRateScreenOff)
  {
    NSAppendPrintF_safe();
    id v8 = v6;

    id v6 = v8;
  }

  if (self->_bleScanRateOverride)
  {
    NSAppendPrintF_safe();
    id v9 = v6;

    id v6 = v9;
  }

  if (self->_bleRSSIThresholdHint)
  {
    NSAppendPrintF_safe();
    id v10 = v6;

    id v6 = v10;
  }

  if (self->_bleRSSIThresholdOrder)
  {
    NSAppendPrintF_safe();
    id v11 = v6;

    id v6 = v11;
  }

  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
  {
    v13 = deviceFilter;
    CUPrintNSObjectOneLine();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v14 = v6;

    id v6 = v14;
  }

  if (self->_deviceSetupState)
  {
    NSAppendPrintF_safe();
    id v15 = v6;

    id v6 = v15;
  }

  oobKeys = self->_oobKeys;
  if (oobKeys)
  {
    int v17 = oobKeys;
    CUPrintNSObjectOneLine();
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v18 = v6;

    id v6 = v18;
  }

  serviceUUIDs = self->_serviceUUIDs;
  if (serviceUUIDs)
  {
    int v20 = serviceUUIDs;
    CUPrintNSObjectOneLine();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v21 = v6;

    id v6 = v21;
  }

  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    v37 = remoteDevice;
    NSAppendPrintF_safe();
    id v23 = v6;

    id v6 = v23;
  }

  unsigned int useCase = self->_useCase;
  if (useCase)
  {
    CBUseCaseToString_0(useCase);
    NSAppendPrintF_safe();
    id v25 = v6;

    id v6 = v25;
  }

  useCaseClientIDs = self->_useCaseClientIDs;
  if (useCaseClientIDs)
  {
    int v27 = useCaseClientIDs;
    CUPrintNSObjectOneLine();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v28 = v6;

    id v6 = v28;
  }

  typeToRssiThresholds = self->_typeToRssiThresholds;
  if (typeToRssiThresholds)
  {
    v30 = typeToRssiThresholds;
    CUPrintNSObjectOneLine();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v31 = v6;

    id v6 = v31;
  }

  return v6;
}

- (void)setBleScanRate:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __30__CBDiscovery_setBleScanRate___block_invoke;
  v3[3] = &unk_189FB1E00;
  int v4 = a3;
  v3[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __30__CBDiscovery_setBleScanRate___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 84);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 84) = v1;
  }
  return v1 != v3;
}

- (void)setBleScanRateScreenOff:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __39__CBDiscovery_setBleScanRateScreenOff___block_invoke;
  v3[3] = &unk_189FB1E00;
  int v4 = a3;
  v3[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __39__CBDiscovery_setBleScanRateScreenOff___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 92) = v1;
  }
  return v1 != v3;
}

- (void)setDeviceFilter:(id)a3
{
  int v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __31__CBDiscovery_setDeviceFilter___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __31__CBDiscovery_setDeviceFilter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 232LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }

  else
  {
    id v6 = v4;
    if ((v3 == 0LL) != (v4 != 0LL))
    {
      char v7 = [v3 isEqual:v4];

      if ((v7 & 1) != 0) {
        return 0LL;
      }
    }

    else
    {
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 232);
    *(void *)(v10 + 232) = v11;
  }

  return v5;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__CBDiscovery_setDiscoveryFlags___block_invoke;
  v3[3] = &unk_189FB1E28;
  v3[4] = self;
  void v3[5] = a3;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __33__CBDiscovery_setDiscoveryFlags___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 240);
  if (v1 != v3) {
    *(void *)(v2 + 240) = v1;
  }
  return v1 != v3;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB *)&self->_discoveryTypesInternal;
}

- (void)addDiscoveryType:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__CBDiscovery_addDiscoveryType___block_invoke;
  v3[3] = &unk_189FB1E00;
  v3[4] = self;
  int v4 = a3;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

uint64_t __32__CBDiscovery_addDiscoveryType___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  uint64_t result = 1LL;
  if ((v2 - 34) >= 0xFFFFFFDF)
  {
    uint64_t v4 = *(void *)(a1 + 32) + 41LL;
    unint64_t v5 = (v2 - 1);
    int v6 = 1 << (-(char)v2 & 7);
    unint64_t v7 = v5 >> 3;
    int v8 = *(unsigned __int8 *)(v4 + (v5 >> 3));
    uint64_t result = 0LL;
    if ((v6 & v8) == 0)
    {
      *(_BYTE *)(v4 + v7) = v8 | v6;
      return 1LL;
    }
  }

  return result;
}

- (void)clearDuplicateFilterCache
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__CBDiscovery_clearDuplicateFilterCache__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __40__CBDiscovery_clearDuplicateFilterCache__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 46) && (*(_BYTE *)(v1 + 43) & 0x20) != 0 && *(_DWORD *)(v1 + 80) == 524290)
  {
    if (gCBDaemonServer)
    {
      objc_msgSend((id)gCBDaemonServer, "clearDuplicateFilterCache:");
    }

    else
    {
      xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
      [*(id *)(a1 + 32) encodeWithXPCObject:xdict];
      xpc_dictionary_set_string(xdict, "mTyp", "DsCD");
      [*(id *)(a1 + 32) _ensureXPCStarted];
      uint64_t v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v3, xdict);
    }
  }

- (void)removeDiscoveryType:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35__CBDiscovery_removeDiscoveryType___block_invoke;
  v3[3] = &unk_189FB1E00;
  v3[4] = self;
  int v4 = a3;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

uint64_t __35__CBDiscovery_removeDiscoveryType___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32) + 41LL;
  unint64_t v3 = (v1 - 1);
  int v4 = 1 << (-(char)v1 & 7);
  unint64_t v5 = v3 >> 3;
  int v6 = *(unsigned __int8 *)(v2 + (v3 >> 3));
  if ((v4 & v6) == 0) {
    return 0LL;
  }
  *(_BYTE *)(v2 + v5) = v6 & ~(_BYTE)v4;
  return 1LL;
}

- (void)removeAllDiscoveryTypes
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __38__CBDiscovery_removeAllDiscoveryTypes__block_invoke;
  v2[3] = &unk_189FB49A8;
  v2[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v2);
}

BOOL __38__CBDiscovery_removeAllDiscoveryTypes__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v1 + 41);
  uint64_t v2 = v1 + 41;
  int v4 = v3 | *(unsigned __int8 *)(v2 + 4);
  if (v4)
  {
    *(_BYTE *)(v2 + 4) = 0;
    *(_DWORD *)uint64_t v2 = 0;
  }

  return v4 != 0;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setOobKeys:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __26__CBDiscovery_setOobKeys___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __26__CBDiscovery_setOobKeys___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 264LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }

  else
  {
    int v6 = v4;
    if ((v3 == 0LL) != (v4 != 0LL))
    {
      char v7 = [v3 isEqual:v4];

      if ((v7 & 1) != 0) {
        return 0LL;
      }
    }

    else
    {
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 264);
    *(void *)(v10 + 264) = v11;
  }

  return v5;
}

- (void)setServiceUUIDs:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __31__CBDiscovery_setServiceUUIDs___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __31__CBDiscovery_setServiceUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 272LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }

  else
  {
    int v6 = v4;
    if ((v3 == 0LL) != (v4 != 0LL))
    {
      char v7 = [v3 isEqual:v4];

      if ((v7 & 1) != 0) {
        return 0LL;
      }
    }

    else
    {
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 272);
    *(void *)(v10 + 272) = v11;
  }

  return v5;
}

- (void)setSpatialInteractionFilter:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __43__CBDiscovery_setSpatialInteractionFilter___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __43__CBDiscovery_setSpatialInteractionFilter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 304LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }

  else
  {
    int v6 = v4;
    if ((v3 == 0LL) != (v4 != 0LL))
    {
      char v7 = [v3 isEqual:v4];

      if ((v7 & 1) != 0) {
        return 0LL;
      }
    }

    else
    {
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 304);
    *(void *)(v10 + 304) = v11;
  }

  return v5;
}

- (void)setTypeToRssiThresholds:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __39__CBDiscovery_setTypeToRssiThresholds___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __39__CBDiscovery_setTypeToRssiThresholds___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 280LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }

  else
  {
    int v6 = v4;
    if ((v3 == 0LL) != (v4 != 0LL))
    {
      char v7 = [v3 isEqual:v4];

      if ((v7 & 1) != 0) {
        return 0LL;
      }
    }

    else
    {
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 280);
    *(void *)(v10 + 280) = v11;
  }

  return v5;
}

- (void)setUseCase:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __26__CBDiscovery_setUseCase___block_invoke;
  v3[3] = &unk_189FB1E00;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __26__CBDiscovery_setUseCase___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 80);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 80) = v1;
  }
  return v1 != v3;
}

- (void)setUseCaseClientIDs:(id)a3
{
  unsigned int v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __35__CBDiscovery_setUseCaseClientIDs___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __35__CBDiscovery_setUseCaseClientIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 216LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }

  else
  {
    int v6 = v4;
    if ((v3 == 0LL) != (v4 != 0LL))
    {
      char v7 = [v3 isEqual:v4];

      if ((v7 & 1) != 0) {
        return 0LL;
      }
    }

    else
    {
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 216);
    *(void *)(v10 + 216) = v11;
  }

  return v5;
}

- (BOOL)discoveryTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, a3);
}

- (BOOL)needsAdvertisingAddress
{
  if ((self->_discoveryFlags & 0x400020108LL) != 0) {
    return 1;
  }
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  id v4 = CBDiscoveryTypesNeedsAdvertisingAddress();
  return CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v4);
}

- (BOOL)needsBLEScan
{
  if ((self->_discoveryFlags & 0x5CFAA6C5B14FFFFFLL) != 0) {
    return 1;
  }
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  BOOL v5 = CBDiscoveryTypesBLEScan();
  if (CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v5)) {
    return 1;
  }
  serviceUUIDs = self->_serviceUUIDs;
  return serviceUUIDs && -[NSArray count](serviceUUIDs, "count");
}

- (BOOL)needsIdentify
{
  if ((self->_discoveryFlags & 0x201400020108LL) != 0) {
    return 1;
  }
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  id v4 = CBDiscoveryTypesNeedsIdentify();
  return CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v4);
}

- (BOOL)updateWithCBDiscovery:(id)a3
{
  id v4 = (char *)a3;
  int v5 = [v4 bleRSSIThresholdOrder];
  int bleRSSIThresholdOrder = self->_bleRSSIThresholdOrder;
  BOOL v7 = v5 != bleRSSIThresholdOrder;
  if (v5 == bleRSSIThresholdOrder)
  {
    id v9 = 0LL;
    char v12 = [v4 bleRSSIThresholdHint];
    uint64_t bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
    goto LABEL_5;
  }

  CUPrintFlags32();
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 bleRSSIThresholdOrder];
  CUPrintFlags32();
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  id v9 = 0LL;

  self->_int bleRSSIThresholdOrder = objc_msgSend(v4, "bleRSSIThresholdOrder", v8, v127);
  char v10 = [v4 bleRSSIThresholdHint];
  uint64_t bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
  if (v10 != self->_bleRSSIThresholdHint)
  {
LABEL_5:
    uint64_t v117 = bleRSSIThresholdHint;
    uint64_t v128 = (int)[v4 bleRSSIThresholdHint];
    CUAppendF();
    id v13 = v9;

    self->_uint64_t bleRSSIThresholdHint = objc_msgSend(v4, "bleRSSIThresholdHint", v117, v128);
    BOOL v7 = 1;
    id v9 = v13;
  }

- (unint64_t)updateWithXPCSubscriberInfo:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4 || MEMORY[0x18959FCE0](v4) != MEMORY[0x1895F9250])
  {
    unint64_t v7 = 0LL;
    goto LABEL_147;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "bleRSSIThresholdOrder");
  if (uint64 == self->_bleRSSIThresholdOrder)
  {
    unint64_t v7 = 0LL;
  }

  else
  {
    self->_int bleRSSIThresholdOrder = uint64;
    unint64_t v7 = 0x80000000000LL;
  }

  int64_t int64 = xpc_dictionary_get_int64(v5, "bleRSSIThresholdHint");
  uint64_t v9 = 127LL;
  if (v9 <= -128) {
    uint64_t v9 = -128LL;
  }
  if (v9 != self->_bleRSSIThresholdHint)
  {
    self->_uint64_t bleRSSIThresholdHint = v9;
    unint64_t v7 = 0x80000000000LL;
  }

  id v79 = 0LL;
  CUXPCDecodeNSArrayOfNSString();
  deviceFilter = self->_deviceFilter;
  id v11 = (NSArray *)0LL;
  char v12 = deviceFilter;
  if (v11 == v12)
  {

LABEL_19:
    goto LABEL_20;
  }

  id v13 = v12;
  if ((v11 == 0LL) == (v12 != 0LL))
  {

    goto LABEL_18;
  }

  char v14 = -[NSArray isEqual:](v11, "isEqual:", v12);

  if ((v14 & 1) == 0)
  {
LABEL_18:
    id v15 = (NSArray *)[v79 copy];
    id v11 = self->_deviceFilter;
    self->_deviceFilter = v15;
    unint64_t v7 = 0x80000000000LL;
    goto LABEL_19;
  }

uint64_t __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke( uint64_t a1,  int a2,  xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr) {
    return 1LL;
  }
  int v5 = string_ptr;
  if (!strcmp(string_ptr, "ApplePay"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 1uLL;
    return 1LL;
  }

  if (!strcmp(v5, "AppleTVSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 2uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "AppSignIn"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 4uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "BLEAdvertisementData"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x40000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "BLEPresent"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x20000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "CNJ"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x10000000000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "CompanionAuthentication"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x10000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "CompanionLink"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 8uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "HomePodSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x10uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "iOSSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x20uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "NearbyAction"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x80000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "NearbyInfo"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x40uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "OSR"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x800000000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "PassiveRSSI"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x100000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "ProxControl"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x200000000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "ProxRepair"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x200uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "RemoteDisplay"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x100uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "RemotePairing"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x20000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "ShareAudio"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x400uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "SIMTransfer"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x4000000000000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "TVLatencySetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x800uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "WatchSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x20000000000000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "WHASetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x1000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "WiFiPassword"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x2000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "WxSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x4000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "WxStatus"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x8000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "ObjectSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x10000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "Connections"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x200000uLL;
    return 1LL;
  }

  else if (!strcmp(v5, "Pairing"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x800000uLL;
    return 1LL;
  }

  else
  {
    if (strcmp(v5, "ScreenOff"))
    {
      int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 48LL);
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
        return 1LL;
      }

      return 1LL;
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x2000000uLL;
    return 1LL;
  }

uint64_t __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke_2( uint64_t a1,  int a2,  xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    int v5 = CBDiscoveryTypeFromCString(string_ptr);
    if ((v5 - 34) >= 0xFFFFFFDF)
    {
      unint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL) + ((unint64_t)(v5 - 1) >> 3);
      *(_BYTE *)(v6 + 32) |= 1 << (-(char)v5 & 7);
    }
  }

  return 1LL;
}

- (OS_xpc_object)xpcSubscriberRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v4 = v3;
  if (self->_bleRSSIThresholdOrder) {
    xpc_dictionary_set_uint64(v3, "bleRSSIThresholdOrder", self->_bleRSSIThresholdOrder);
  }
  int v5 = self->_deviceFilter;
  if (v5) {
    CUXPCEncodeNSArrayOfNSString();
  }

  unint64_t v6 = "Periodic";
  switch(self->_bleScanRate)
  {
    case 0:
      break;
    case 0xA:
      goto LABEL_15;
    case 0x14:
      unint64_t v6 = "Background";
      goto LABEL_15;
    case 0x1E:
      unint64_t v6 = "Low";
      goto LABEL_15;
    case 0x23:
      unint64_t v6 = "MediumLow";
      goto LABEL_15;
    case 0x28:
      unint64_t v6 = "Medium";
      goto LABEL_15;
    case 0x32:
      unint64_t v6 = "High";
      goto LABEL_15;
    case 0x3C:
      unint64_t v6 = "Max";
      goto LABEL_15;
    default:
      unint64_t v6 = "?";
LABEL_15:
      xpc_dictionary_set_string(v4, "bleScanRate", v6);
      break;
  }

  unint64_t v7 = "Periodic";
  switch(self->_bleScanRateScreenOff)
  {
    case 0:
      goto LABEL_25;
    case 0xA:
      goto LABEL_24;
    case 0x14:
      unint64_t v7 = "Background";
      goto LABEL_24;
    case 0x1E:
      unint64_t v7 = "Low";
      goto LABEL_24;
    case 0x23:
      unint64_t v7 = "MediumLow";
      goto LABEL_24;
    case 0x28:
      unint64_t v7 = "Medium";
      goto LABEL_24;
    case 0x32:
      unint64_t v7 = "High";
      goto LABEL_24;
    case 0x3C:
      unint64_t v7 = "Max";
      goto LABEL_24;
    default:
      unint64_t v7 = "?";
LABEL_24:
      xpc_dictionary_set_string(v4, "bleScanRateScreenOff", v7);
LABEL_25:
      unint64_t discoveryFlags = self->_discoveryFlags;
      if (!discoveryFlags) {
        goto LABEL_55;
      }
      xpc_object_t v9 = xpc_array_create(0LL, 0LL);
      char v10 = v9;
      if ((discoveryFlags & 1) != 0)
      {
        xpc_array_set_string(v9, 0xFFFFFFFFFFFFFFFFLL, "ApplePay");
        if ((discoveryFlags & 2) == 0)
        {
LABEL_28:
          if ((discoveryFlags & 4) == 0) {
            goto LABEL_29;
          }
          goto LABEL_99;
        }
      }

      else if ((discoveryFlags & 2) == 0)
      {
        goto LABEL_28;
      }

      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "AppleTVSetup");
      if ((discoveryFlags & 4) == 0)
      {
LABEL_29:
        if ((discoveryFlags & 0x20000000) == 0) {
          goto LABEL_30;
        }
        goto LABEL_100;
      }

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    uint64_t v6 = MEMORY[0x18959F890](v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = (id)v6;

    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __38__CBDiscovery_activateWithCompletion___block_invoke;
    block[3] = &unk_189FB1AE0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __38__CBDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  int v21 = self->_mockID;
  if (v21)
  {
    int var0 = self->_ucat->var0;
    CBMockAddOrUpdateDiscovery(v21, self);
    xpc_object_t v12 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v12) {
      v12[2](v12, 0LL);
    }
LABEL_30:

    goto LABEL_31;
  }

  if (self->_bluetoothStateChangedHandler) {
    self->_internalFlags |= 1u;
  }
  else {
    BOOL v10 = gCBDaemonServer == 0;
  }
  BOOL v11 = !v10;
  self->_direct = v11;
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Activate after invalidate", v3, v4, v5, v6, v7, v8, v19);
    xpc_object_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    int v13 = self->_ucat->var0;
    if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    int v15 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id v16 = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v15)
    {
      v15[2](v15, v12);
    }

    else
    {
      uint64_t v17 = MEMORY[0x18959F890](self->_errorHandler);
      id v18 = (void *)v17;
      if (v17) {
        (*(void (**)(uint64_t, void))(v17 + 16))(v17, v12);
      }
    }

    goto LABEL_30;
  }

  if (v11) {
    -[CBDiscovery _activateDirectStart](self, "_activateDirectStart");
  }
  else {
    -[CBDiscovery _activateXPCStart:](self, "_activateXPCStart:", 0LL);
  }
LABEL_31:
}

- (void)_activateDirectStart
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF_safe();
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__CBDiscovery__activateDirectStart__block_invoke;
  v5[3] = &unk_189FB1E78;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBDiscovery:completion:", self, v5, clientID);
}

void __35__CBDiscovery__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(dispatch_queue_s **)(v4 + 160);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__CBDiscovery__activateDirectStart__block_invoke_2;
  v7[3] = &unk_189FB1900;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __35__CBDiscovery__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void (**)(void, void))MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0LL;

  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = **(_DWORD **)(v5 + 48);
  if (*(void *)(a1 + 40))
  {
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    if (v2)
    {
      v2[2](v2, *(void *)(a1 + 40));
    }

    else
    {
      uint64_t v7 = MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 168LL));
      id v8 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 40));
      }
    }

    goto LABEL_20;
  }

  if (v6 <= 30)
  {
    if (v6 == -1)
    {
      uint64_t v5 = *(void *)(a1 + 32);
    }

    uint64_t v15 = *(unsigned int *)(v5 + 108);
    LogPrintF_safe();
  }

void __35__CBDiscovery__activateDirectStart__block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v5 discoveryTypesContainCBDiscovery:*(void *)(a1 + 32)])
  {
    int v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
      xpc_object_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      int v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    }

    [v6 setObject:v5 forKeyedSubscript:v10];
  }
}

void __35__CBDiscovery__activateDirectStart__block_invoke_2_150(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 48LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40));
}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF_safe();
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  -[CBDiscovery encodeWithXPCObject:](self, "encodeWithXPCObject:", v5);
  xpc_dictionary_set_string(v5, "mTyp", "DscA");
  -[CBDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  int v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __33__CBDiscovery__activateXPCStart___block_invoke;
  handler[3] = &unk_189FB1EA0;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);
}

uint64_t __33__CBDiscovery__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  int v38 = __Block_byref_object_copy__4;
  char v39 = __Block_byref_object_dispose__4;
  id v40 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke;
  v34[3] = &unk_189FB1C20;
  v34[4] = self;
  v34[5] = &v35;
  int v6 = (void (**)(void))MEMORY[0x18959F890](v34);
  uint64_t v7 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v8 = (void *)v36[5];
  v36[5] = v7;

  if (!v36[5])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(v4, "pwrS");
    xpc_dictionary_get_array(v4, "devA");
    xpc_object_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v9;
    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v28 = 0LL;
    int v29 = &v28;
    uint64_t v30 = 0x3032000000LL;
    BOOL v31 = __Block_byref_object_copy__4;
    char v32 = __Block_byref_object_dispose__4;
    id v33 = 0LL;
    uint64_t v22 = 0LL;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    uint64_t v25 = __Block_byref_object_copy__4;
    unint64_t v26 = __Block_byref_object_dispose__4;
    id v27 = 0LL;
    applier[0] = v5;
    applier[1] = 3221225472LL;
    applier[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke_2;
    applier[3] = &unk_189FB4A48;
    applier[4] = &v22;
    applier[5] = &v28;
    xpc_array_apply(v9, applier);
    id v11 = (void *)v23[5];
    if (v11)
    {
      id v18 = v36;
      id v19 = v11;
      xpc_object_t v12 = (CBDiscovery *)v18[5];
      v18[5] = (uint64_t)v19;
    }

    else
    {
      xpc_object_t v12 = self;
      objc_sync_enter(v12);
      objc_storeStrong((id *)&v12->_deviceMap, (id)v29[5]);
      objc_sync_exit(v12);
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

    if (!v11)
    {
LABEL_6:
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        -[NSMutableDictionary count](self->_deviceMap, "count");
        LogPrintF_safe();
      }

      char v14 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0LL;

      if (v14) {
        v14[2](v14, 0LL);
      }
      id v16 = (void *)MEMORY[0x18959F890](self->_deviceFoundHandler);
      if (v16)
      {
        deviceMap = self->_deviceMap;
        v20[0] = v5;
        v20[1] = 3221225472LL;
        v20[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke_3;
        v20[3] = &unk_189FB4A20;
        v20[4] = self;
        v20[5] = v16;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v20);
      }
    }
  }

  v6[2](v6);

  _Block_object_dispose(&v35, 8);
}

void __37__CBDiscovery__activateXPCCompleted___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 48);
    if (v3 <= 90)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
      {
        CUPrintNSError();
        xpc_object_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }

    id v10 = (void (**)(id, void))MEMORY[0x18959F890](*(void *)(v2 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0LL;

    if (v10)
    {
      v10[2](v10, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    }

    else
    {
      uint64_t v7 = MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 168LL));
      uint64_t v8 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))( v7,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
      }
    }
  }

BOOL __37__CBDiscovery__activateXPCCompleted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___CBDevice);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = -[CBDevice initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    -[CBDevice identifier](v7, "identifier");
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = v14 != 0LL;
    if (v14)
    {
      id v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      if (!v16)
      {
        id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        id v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      }

      [v16 setObject:v7 forKeyedSubscript:v14];
    }

    else
    {
      uint64_t v21 = CBErrorF(-6708, (uint64_t)"No device ID", v8, v9, v10, v11, v12, v13, v24);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8LL);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
  }

  else
  {
    BOOL v15 = 0LL;
  }

  return v15;
}

void __37__CBDiscovery__activateXPCCompleted___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 48LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40));
}

- (NSArray)discoveredDevices
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_deviceMap;
  id v4 = v3;
  if (v3)
  {
    -[NSMutableDictionary allValues](v3, "allValues");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (id)_ensureXPCStarted
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_xpcCnx;
  if (!v3)
  {
    id v4 = v2->_testListenerEndpoint;
    id v5 = v4;
    if (v4)
    {
      mach_service = xpc_connection_create_from_endpoint(v4);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v2->_dispatchQueue);
    }

    else
    {
      mach_service = xpc_connection_create_mach_service( "com.apple.bluetooth.xpc",  (dispatch_queue_t)v2->_dispatchQueue,  0LL);
    }

    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __32__CBDiscovery__ensureXPCStarted__block_invoke;
    v8[3] = &unk_189FB1EC8;
    v8[4] = v2;
    int v3 = mach_service;
    uint64_t v9 = v3;
    xpc_connection_set_event_handler(v3, v8);
    xpc_connection_activate(v3);
  }

  objc_sync_exit(v2);

  return v3;
}

void *__32__CBDiscovery__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[7] == *(void *)(a1 + 40)) {
    return (void *)[result xpcReceivedMessage:a2];
  }
  return result;
}

- (void)finish
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __21__CBDiscovery_finish__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __21__CBDiscovery_finish__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 48);
  if (*(_BYTE *)(v2 + 46))
  {
  }

  else
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v4, "mTyp", "DscF");
    [*(id *)(a1 + 32) _ensureXPCStarted];
    id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(dispatch_queue_s **)(v6 + 160);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __21__CBDiscovery_finish__block_invoke_2;
    handler[3] = &unk_189FB1EA0;
    handler[4] = v6;
    xpc_connection_send_message_with_reply(v5, v4, v7, handler);
  }

void __21__CBDiscovery_finish__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v4 = 0LL;
  }

  if (v4) {
    int v5 = 90;
  }
  else {
    int v5 = 30;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = **(_DWORD **)(v6 + 48);
  if (v5 >= v7)
  {
    if (v7 != -1 || (v8 = _LogCategory_Initialize(), uint64_t v6 = *(void *)(a1 + 32), v8))
    {
      CUPrintNSError();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      uint64_t v6 = *(void *)(a1 + 32);
    }
  }

  uint64_t v9 = MEMORY[0x18959F890](*(void *)(v6 + 248));
  uint64_t v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0LL, v4);
  }

  [*(id *)(a1 + 32) _invalidate];
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    -[CBDiscovery _lostAllDevices](self, "_lostAllDevices");
    uint64_t v4 = MEMORY[0x18959F890](self->_interruptionHandler);
    int v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    self->_bluetoothState = 1LL;
    uint64_t v6 = MEMORY[0x18959F890](self->_bluetoothStateChangedHandler);
    int v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

    -[CBDiscovery _activateXPCStart:](self, "_activateXPCStart:", 1LL);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__CBDiscovery_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CBDiscovery_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    int v7 = self->_mockID;
    if (v7) {
      CBMockRemoveDiscovery(v7, self);
    }
    if (self->_direct) {
      -[CBDiscovery _invalidateDirect](self, "_invalidateDirect");
    }
    uint64_t v4 = self;
    objc_sync_enter(v4);
    int v5 = v4->_xpcCnx;
    uint64_t v6 = v5;
    if (v5) {
      xpc_connection_cancel(v5);
    }

    objc_sync_exit(v4);
    -[CBDiscovery _invalidated](v4, "_invalidated");
  }

- (void)_invalidateDirect
{
}

void __32__CBDiscovery__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 160);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__CBDiscovery__invalidateDirect__block_invoke_2;
  block[3] = &unk_189FB1AE0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __32__CBDiscovery__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 40LL) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct)
  {
    id v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      self->_invalidateCalled = 1;
      uint64_t v17 = MEMORY[0x18959F890](v3->_invalidationHandler);
      id bluetoothStateChangedHandler = v3->_bluetoothStateChangedHandler;
      v3->_id bluetoothStateChangedHandler = 0LL;

      id deviceFoundHandler = v3->_deviceFoundHandler;
      v3->_id deviceFoundHandler = 0LL;

      id deviceLostHandler = v3->_deviceLostHandler;
      v3->_id deviceLostHandler = 0LL;

      id devicesBufferedHandler = v3->_devicesBufferedHandler;
      v3->_id devicesBufferedHandler = 0LL;

      id errorHandler = v3->_errorHandler;
      v3->_id errorHandler = 0LL;

      id finishHandler = v3->_finishHandler;
      v3->_id finishHandler = 0LL;

      id interruptionHandler = v3->_interruptionHandler;
      v3->_id interruptionHandler = 0LL;

      id invalidationHandler = v3->_invalidationHandler;
      v3->_id invalidationHandler = 0LL;

      id systemOverrideHandler = v3->_systemOverrideHandler;
      v3->_id systemOverrideHandler = 0LL;

      char v14 = (void *)v17;
      if (v17)
      {
        (*(void (**)(uint64_t))(v17 + 16))(v17);
        char v14 = (void *)v17;
      }

      self->_invalidateDone = 1;
      int var0 = v3->_ucat->var0;
      if (var0 <= 30)
      {
        if (var0 != -1 || (v16 = _LogCategory_Initialize(), char v14 = (void *)v17, v16))
        {
          LogPrintF_safe();
          char v14 = (void *)v17;
        }
      }
    }
  }

- (void)_lostAllDevices
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = (void (**)(void, void))MEMORY[0x18959F890](self->_deviceLostHandler, a2);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  deviceMap = v4->_deviceMap;
  if (v3)
  {
    -[NSMutableDictionary allValues](deviceMap, "allValues");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](v4->_deviceMap, "removeAllObjects");
    objc_sync_exit(v4);

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          int var0 = v4->_ucat->var0;
          v3[2](v3, v11);
          ++v10;
        }

        while (v8 != v10);
        uint64_t v13 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v8 = v13;
      }

      while (v13);
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](deviceMap, "removeAllObjects");
    objc_sync_exit(v4);
  }
}

- (void)reportMockDeviceFound:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __37__CBDiscovery_reportMockDeviceFound___block_invoke;
  v7[3] = &unk_189FB1900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __37__CBDiscovery_reportMockDeviceFound___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 46))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 48);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 32), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }

    uint64_t result = *(void *)(v1 + 136);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(v2 + 40));
    }
  }

  return result;
}

- (void)reportMockDeviceLost:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__CBDiscovery_reportMockDeviceLost___block_invoke;
  v7[3] = &unk_189FB1900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __36__CBDiscovery_reportMockDeviceLost___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 46))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 48);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 32), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }

    uint64_t result = *(void *)(v1 + 144);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(v2 + 40));
    }
  }

  return result;
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __40__CBDiscovery__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_189FB1AE0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __40__CBDiscovery__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    uint64_t v2 = self;
    objc_sync_enter(v2);
    BOOL changesPending = v2->_changesPending;
    v2->_BOOL changesPending = 0;
    objc_sync_exit(v2);

    int var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (!v2->_direct)
      {
        xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
        -[CBDiscovery encodeWithXPCObject:](v2, "encodeWithXPCObject:", xdict);
        xpc_dictionary_set_string(xdict, "mTyp", "DscU");
        -[CBDiscovery _ensureXPCStarted](v2, "_ensureXPCStarted");
        int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v5, xdict);
      }
    }

    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v25 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v25, v6))
    {
      CUPrintXPC();
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      id v4 = v25;
    }
  }

  if (MEMORY[0x18959FCE0](v4) == MEMORY[0x1895F9250])
  {
    -[CBDiscovery _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v25);
    goto LABEL_26;
  }

  if (v25 == (id)MEMORY[0x1895F9198])
  {
    -[CBDiscovery _interrupted](self, "_interrupted");
    goto LABEL_26;
  }

  if (v25 != (id)MEMORY[0x1895F91A0])
  {
    CUXPCDecodeNSErrorIfNeeded();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v14 = v7;
    if (v7)
    {
      id v15 = v7;

      int v16 = self->_ucat->var0;
      if (v16 > 90) {
        goto LABEL_21;
      }
    }

    else
    {
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v23);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      int v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        uint64_t v19 = MEMORY[0x18959F890](self->_errorHandler);
        int v20 = (void *)v19;
        if (v19) {
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);
        }

        goto LABEL_26;
      }
    }

    if (v16 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    goto LABEL_21;
  }

  if (!self->_invalidateCalled)
  {
    int v17 = self->_ucat->var0;
  }

  uint64_t v21 = self;
  objc_sync_enter(v21);
  xpcCnx = v21->_xpcCnx;
  v21->_xpcCnx = 0LL;

  objc_sync_exit(v21);
  -[CBDiscovery _invalidated](v21, "_invalidated");
LABEL_26:
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    int var0 = self->_ucat->var0;
LABEL_12:
    LogPrintF_safe();
LABEL_13:

    return;
  }

  int v5 = string;
  if (!strcmp(string, "DvFo"))
  {
    -[CBDiscovery _xpcReceivedDeviceFound:](self, "_xpcReceivedDeviceFound:", v8);
  }

  else if (!strcmp(v5, "DvLo"))
  {
    -[CBDiscovery _xpcReceivedDeviceLost:](self, "_xpcReceivedDeviceLost:", v8);
  }

  else if (!strcmp(v5, "DsBf"))
  {
    -[CBDiscovery _xpcReceivedDevicesBuffered:](self, "_xpcReceivedDevicesBuffered:", v8);
  }

  else if (!strcmp(v5, "PwrC"))
  {
    -[CBDiscovery _xpcReceivedPowerStateChanged:](self, "_xpcReceivedPowerStateChanged:", v8);
  }

  else
  {
    if (strcmp(v5, "SyOC"))
    {
      int v6 = self->_ucat->var0;
      goto LABEL_12;
    }

    -[CBDiscovery _xpcReceivedSystemOverrideChanged:](self, "_xpcReceivedSystemOverrideChanged:", v8);
  }

- (void)_xpcReceivedDeviceFound:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    id v18 = 0LL;
    int v5 = -[CBDevice initWithXPCObject:error:](objc_alloc(&OBJC_CLASS___CBDevice), "initWithXPCObject:error:", v4, &v18);
    id v6 = v18;
    if (v5)
    {
      -[CBDevice identifier](v5, "identifier");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        id v8 = self;
        objc_sync_enter(v8);
        deviceMap = v8->_deviceMap;
        if (!deviceMap)
        {
          uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
          uint64_t v11 = v8->_deviceMap;
          v8->_deviceMap = v10;

          deviceMap = v8->_deviceMap;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v7);
        objc_sync_exit(v8);

        int var0 = v8->_ucat->var0;
        uint64_t v13 = MEMORY[0x18959F890](v8->_deviceFoundHandler);
        __int128 v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, CBDevice *))(v13 + 16))(v13, v5);
        }

        goto LABEL_13;
      }

      int v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize())
      {
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
    }

    else
    {
      int v16 = self->_ucat->var0;
      CUPrintNSError();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    LogPrintF_safe();
    goto LABEL_13;
  }

  int v15 = self->_ucat->var0;
LABEL_15:
}

- (void)_xpcReceivedDeviceLost:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    id v15 = 0LL;
    int v5 = -[CBDevice initWithXPCObject:error:](objc_alloc(&OBJC_CLASS___CBDevice), "initWithXPCObject:error:", v4, &v15);
    id v6 = v15;
    if (v5)
    {
      -[CBDevice identifier](v5, "identifier");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        id v8 = self;
        objc_sync_enter(v8);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v7);
        objc_sync_exit(v8);

        int var0 = v8->_ucat->var0;
        uint64_t v10 = MEMORY[0x18959F890](v8->_deviceLostHandler);
        uint64_t v11 = (void *)v10;
        if (v10) {
          (*(void (**)(uint64_t, CBDevice *))(v10 + 16))(v10, v5);
        }

        goto LABEL_11;
      }

      int v14 = self->_ucat->var0;
      if (v14 > 90 || v14 == -1 && !_LogCategory_Initialize())
      {
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
    }

    else
    {
      int v13 = self->_ucat->var0;
      CUPrintNSError();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    LogPrintF_safe();
    goto LABEL_11;
  }

  int v12 = self->_ucat->var0;
LABEL_13:
}

- (void)_xpcReceivedDevicesBuffered:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    id v5 = 0LL;
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    goto LABEL_4;
  }

  int v6 = self->_ucat->var0;
  if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
  {
LABEL_4:

    return;
  }

  LogPrintF_safe();
}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  xpc_object_t xdict = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(xdict, "pwrS");
    uint64_t v4 = MEMORY[0x18959F890](self->_bluetoothStateChangedHandler);
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }
  }

  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();

      return;
    }
  }
}

- (void)_xpcReceivedSystemOverrideChanged:(id)a3
{
  xpc_object_t xdict = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    self->_bleScanRateOverride = xpc_dictionary_get_int64(xdict, "scRO");
    self->_systemOverrideFlags = xpc_dictionary_get_uint64(xdict, "syOF");
    uint64_t v4 = MEMORY[0x18959F890](self->_systemOverrideHandler);
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }
  }

  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();

      return;
    }
  }
}

+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 error:(id *)a4
{
  return (id)[a1 devicesWithDiscoveryFlags:a3 endpoint:0 error:a4];
}

+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 endpoint:(id)a4 error:(id *)a5
{
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v8, "mTyp", "DsGD");
  xpc_dictionary_set_uint64(v8, "dsFl", a3);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = dispatch_queue_create("CBDiscovery-GetDevices", v9);

  uint64_t v11 = (_xpc_endpoint_s *)v7;
  int v12 = v11;
  if (v11)
  {
    mach_service = xpc_connection_create_from_endpoint(v11);
    xpc_connection_set_target_queue(mach_service, v10);
  }

  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v10, 0LL);
  }

  xpc_connection_set_event_handler(mach_service, &__block_literal_global_5);
  xpc_connection_activate(mach_service);
  xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(mach_service, v8);
  xpc_connection_cancel(mach_service);
  if (v14)
  {
    CUXPCDecodeNSErrorIfNeeded();
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v21;
    if (v21)
    {
      id v31 = 0LL;
      if (a5) {
        *a5 = v21;
      }
    }

    else
    {
      xpc_dictionary_get_array(v14, "devA");
      int v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        uint64_t v41 = 0LL;
        v42 = &v41;
        uint64_t v43 = 0x3032000000LL;
        char v44 = __Block_byref_object_copy__4;
        v45 = __Block_byref_object_dispose__4;
        id v46 = 0LL;
        id v46 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v35 = 0LL;
        v36 = &v35;
        uint64_t v37 = 0x3032000000LL;
        int v38 = __Block_byref_object_copy__4;
        char v39 = __Block_byref_object_dispose__4;
        id v40 = 0LL;
        applier[0] = MEMORY[0x1895F87A8];
        applier[1] = 3221225472LL;
        applier[2] = __56__CBDiscovery_devicesWithDiscoveryFlags_endpoint_error___block_invoke_2;
        applier[3] = &unk_189FB4A48;
        applier[4] = &v35;
        applier[5] = &v41;
        xpc_array_apply(v29, applier);
        uint64_t v30 = (void *)v36[5];
        if (v30)
        {
          id v31 = 0LL;
          if (a5) {
            *a5 = v30;
          }
        }

        else
        {
          id v31 = (id)v42[5];
        }

        _Block_object_dispose(&v35, 8);

        _Block_object_dispose(&v41, 8);
      }

      else if (a5)
      {
        CBErrorF(-6700, (uint64_t)"No devices", v23, v24, v25, v26, v27, v28, (uint64_t)a5);
        id v31 = 0LL;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v31 = 0LL;
      }
    }
  }

  else if (a5)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v15, v16, v17, v18, v19, v20, v33);
    id v31 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v31 = 0LL;
  }

  return v31;
}

BOOL __56__CBDiscovery_devicesWithDiscoveryFlags_endpoint_error___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___CBDevice);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v6 + 40);
  id v7 = -[CBDevice initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }

  return v7 != 0LL;
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
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

- (id)devicesBufferedHandler
{
  return self->_devicesBufferedHandler;
}

- (void)setDevicesBufferedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
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

- (NSString)label
{
  return self->_label;
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (unsigned)systemOverrideFlags
{
  return self->_systemOverrideFlags;
}

- (void)setSystemOverrideFlags:(unsigned int)a3
{
  self->_systemOverrideFlags = a3;
}

- (id)systemOverrideHandler
{
  return self->_systemOverrideHandler;
}

- (void)setSystemOverrideHandler:(id)a3
{
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (char)bleRSSIThresholdHint
{
  return self->_bleRSSIThresholdHint;
}

- (void)setBleRSSIThresholdHint:(char)a3
{
  self->_uint64_t bleRSSIThresholdHint = a3;
}

- (unsigned)bleRSSIThresholdOrder
{
  return self->_bleRSSIThresholdOrder;
}

- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3
{
  self->_int bleRSSIThresholdOrder = a3;
}

- (int)bleScanRate
{
  return self->_bleScanRate;
}

- (int)bleScanRateOverride
{
  return self->_bleScanRateOverride;
}

- (void)setBleScanRateOverride:(int)a3
{
  self->_bleScanRateOverride = a3;
}

- (int)bleScanRateScreenOff
{
  return self->_bleScanRateScreenOff;
}

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_changeFlags = a3;
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (id)finishHandler
{
  return self->_finishHandler;
}

- (void)setFinishHandler:(id)a3
{
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
}

- (NSArray)oobKeys
{
  return self->_oobKeys;
}

- (NSArray)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (NSArray)typeToRssiThresholds
{
  return self->_typeToRssiThresholds;
}

- (char)bleSensorRssiIncreaseScanThreshold
{
  return self->_bleSensorRssiIncreaseScanThreshold;
}

- (void)setBleSensorRssiIncreaseScanThreshold:(char)a3
{
  self->_uint64_t bleSensorRssiIncreaseScanThreshold = a3;
}

- (BOOL)bleSensorEnableRssiIncreaseScan
{
  return self->_bleSensorEnableRssiIncreaseScan;
}

- (void)setBleSensorEnableRssiIncreaseScan:(BOOL)a3
{
  self->_BOOL bleSensorEnableRssiIncreaseScan = a3;
}

- (unsigned)bleSensorIncreaseScanRate
{
  return self->_bleSensorIncreaseScanRate;
}

- (void)setBleSensorIncreaseScanRate:(unsigned int)a3
{
  self->_int64_t bleSensorIncreaseScanRate = a3;
}

- (unsigned)bleSensorIncreaseScanTimeout
{
  return self->_bleSensorIncreaseScanTimeout;
}

- (void)setBleSensorIncreaseScanTimeout:(unsigned int)a3
{
  self->_int64_t bleSensorIncreaseScanTimeout = a3;
}

- (unsigned)bleSensorTimeoutBetweenIncreaseScan
{
  return self->_bleSensorTimeoutBetweenIncreaseScan;
}

- (void)setBleSensorTimeoutBetweenIncreaseScan:(unsigned int)a3
{
  self->_int64_t bleSensorTimeoutBetweenIncreaseScan = a3;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (BOOL)denyLowPowerModeScans
{
  return self->_denyLowPowerModeScans;
}

- (void)setDenyLowPowerModeScans:(BOOL)a3
{
  self->_denyLowPowerModeScans = a3;
}

- (BOOL)denyScreenLockedScans
{
  return self->_denyScreenLockedScans;
}

- (void)setDenyScreenLockedScans:(BOOL)a3
{
  self->_denyScreenLockedScans = a3;
}

- (unsigned)deviceSetupState
{
  return self->_deviceSetupState;
}

- (void)setDeviceSetupState:(unsigned __int8)a3
{
  self->_deviceSetupState = a3;
}

- (BOOL)disabledActive
{
  return self->_disabledActive;
}

- (void)setDisabledActive:(BOOL)a3
{
  self->_disabledActive = a3;
}

- (BOOL)disabledPending
{
  return self->_disabledPending;
}

- (void)setDisabledPending:(BOOL)a3
{
  self->_disabledPending = a3;
}

- (unint64_t)extraDiscoveryFlags
{
  return self->_extraDiscoveryFlags;
}

- (void)setExtraDiscoveryFlags:(unint64_t)a3
{
  self->_extraDiscoveryFlags = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(BOOL)a3
{
  self->_keepAlive = a3;
}

- (unsigned)memoryPressureFlags
{
  return self->_memoryPressureFlags;
}

- (void)setMemoryPressureFlags:(unsigned int)a3
{
  self->_unsigned int memoryPressureFlags = a3;
}

- (CBSpatialInteractionFilter)spatialInteractionfilter
{
  return self->_spatialInteractionfilter;
}

- (void)setSpatialInteractionfilter:(id)a3
{
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end