@interface CBSpatialInteractionSession
+ (id)dictionaryWithTokenData:(id)a3 error:(id *)a4;
- (BOOL)enableEPAForLEAdvertisement;
- (BOOL)matchesWithDevice:(id)a3;
- (BOOL)updateWithSession:(id)a3;
- (CBSpatialInteractionFilter)filter;
- (CBSpatialInteractionSession)init;
- (CBSpatialInteractionSession)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)discoveredDevices;
- (NSData)advertisingAddressData;
- (NSData)clientIdentifierData;
- (NSData)clientIrkData;
- (NSData)identifierData;
- (NSData)irkData;
- (NSData)presenceConfigData;
- (NSData)tokenData;
- (NSData)uwbConfigData;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)testListenerEndpoint;
- (char)bleRSSIThresholdHint;
- (id)_ensureXPCStarted;
- (id)advertisingAddressChangedHandler;
- (id)aopDataHandler;
- (id)bluetoothStateChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)measurementHandler;
- (id)systemOverrideHandler;
- (id)tokenChangedHandler;
- (int)advertiseRate;
- (int)scanRate;
- (int)scanRateOverride;
- (int)scanRateScreenOff;
- (int64_t)bluetoothState;
- (unsigned)bleRSSIThresholdOrder;
- (unsigned)clientID;
- (unsigned)controlFlags;
- (unsigned)internalFlags;
- (unsigned)systemOverrideFlags;
- (unsigned)uwbTokenFlags;
- (void)_activate;
- (void)_activateDirectStart;
- (void)_activateXPCCompleted:(id)a3 reactivate:(BOOL)a4;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_addPeerToken:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_reAddTokens;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_xpcReceivedAOPData:(id)a3;
- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3;
- (void)_xpcReceivedDeviceFound:(id)a3;
- (void)_xpcReceivedDeviceLost:(id)a3;
- (void)_xpcReceivedEvent:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)_xpcReceivedPowerStateChanged:(id)a3;
- (void)_xpcReceivedSystemOverrideChanged:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addPeerToken:(id)a3 completion:(id)a4;
- (void)addPeerToken:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)encodeWithXPCObject:(id)a3;
- (void)invalidate;
- (void)removePeerToken:(id)a3 completion:(id)a4;
- (void)setAdvertiseRate:(int)a3;
- (void)setAdvertiseRate:(int)a3 timeout:(double)a4;
- (void)setAdvertisingAddressChangedHandler:(id)a3;
- (void)setAdvertisingAddressData:(id)a3;
- (void)setAopDataHandler:(id)a3;
- (void)setBleRSSIThresholdHint:(char)a3;
- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setClientIdentifierData:(id)a3;
- (void)setClientIrkData:(id)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEnableEPAForLEAdvertisement:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFilter:(id)a3;
- (void)setIdentifierData:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setIrkData:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMeasurementHandler:(id)a3;
- (void)setPresenceConfigData:(id)a3;
- (void)setScanRate:(int)a3;
- (void)setScanRateOverride:(int)a3;
- (void)setScanRateScreenOff:(int)a3;
- (void)setSystemOverrideHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTokenChangedHandler:(id)a3;
- (void)setTokenData:(id)a3;
- (void)setUwbConfigData:(id)a3;
- (void)setUwbTokenFlags:(unsigned int)a3;
@end

@implementation CBSpatialInteractionSession

+ (id)dictionaryWithTokenData:(id)a3 error:(id *)a4
{
  v5 = (void *)OPACKDecodeData();
  if (!v5)
  {
    if (a4)
    {
      CUPrintErrorCode();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(312900, (uint64_t)"Decode token failed: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      id v12 = 0LL;
      goto LABEL_4;
    }

- (CBSpatialInteractionSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CBSpatialInteractionSession;
  v2 = -[CBSpatialInteractionSession init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBSpatial;
    v3 = v2;
  }

  return v2;
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
  v4.super_class = (Class)&OBJC_CLASS___CBSpatialInteractionSession;
  -[CBSpatialInteractionSession dealloc](&v4, sel_dealloc);
}

- (CBSpatialInteractionSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = -[CBSpatialInteractionSession init](self, "init");
  if (!v13)
  {
    if (!a4) {
      goto LABEL_44;
    }
    v26 = "init failed";
LABEL_43:
    CBErrorF(-6756, (uint64_t)v26, v7, v8, v9, v10, v11, v12, v27);
    v24 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (!a4) {
      goto LABEL_44;
    }
    v26 = "XPC non-dict";
    goto LABEL_43;
  }

  int v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v13->_advertiseRate = 0;
  }

  else if (v14 == 5)
  {
    goto LABEL_44;
  }

  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_clientID = 0;
  }

  else if (v15 == 5)
  {
    goto LABEL_44;
  }

  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_internalFlags = 0;
  }

  else if (v16 == 5)
  {
    goto LABEL_44;
  }

  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v13->_scanRate = 0;
  }

  else if (v17 == 5)
  {
    goto LABEL_44;
  }

  int v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v13->_scanRateOverride = 0;
  }

  else if (v18 == 5)
  {
    goto LABEL_44;
  }

  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_scanRateScreenOff = 0;
  }

  else if (v19 == 5)
  {
    goto LABEL_44;
  }

  int v20 = CUXPCDecodeSInt64RangedEx();
  if (v20 == 6)
  {
    v13->_bleRSSIThresholdHint = 0;
  }

  else if (v20 == 5)
  {
    goto LABEL_44;
  }

  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v13->_bleRSSIThresholdOrder = 0;
  }

  else if (v21 == 5)
  {
    goto LABEL_44;
  }

  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v13->_controlFlags = 0;
  }

  else if (v22 == 5)
  {
    goto LABEL_44;
  }

  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v13->_uwbTokenFlags = 0;
    goto LABEL_36;
  }

  if (v23 == 5)
  {
LABEL_44:
    v24 = 0LL;
    goto LABEL_38;
  }

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  int64_t advertiseRate = self->_advertiseRate;
  if ((_DWORD)advertiseRate) {
    xpc_dictionary_set_int64(xdict, "advR", advertiseRate);
  }
  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
  if (self->_enableEPAForLEAdvertisement) {
    xpc_dictionary_set_BOOL(xdict, "naEE", 1);
  }
  uint64_t internalFlags = self->_internalFlags;
  int64_t scanRate = self->_scanRate;
  if ((_DWORD)scanRate) {
    xpc_dictionary_set_int64(xdict, "scnR", scanRate);
  }
  int64_t scanRateOverride = self->_scanRateOverride;
  if ((_DWORD)scanRateOverride) {
    xpc_dictionary_set_int64(xdict, "scRO", scanRateOverride);
  }
  int64_t scanRateScreenOff = self->_scanRateScreenOff;
  if ((_DWORD)scanRateScreenOff) {
    xpc_dictionary_set_int64(xdict, "scRS", scanRateScreenOff);
  }
  if (self->_bleRSSIThresholdOrder) {
    xpc_dictionary_set_uint64(xdict, "blRO", self->_bleRSSIThresholdOrder);
  }
  uint64_t controlFlags = self->_controlFlags;
  if ((_DWORD)controlFlags) {
    xpc_dictionary_set_uint64(xdict, "siCF", controlFlags);
  }
  -[CBSpatialInteractionSession presenceConfigData](self, "presenceConfigData");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
    id v14 = xdict;
    uint64_t v15 = [v13 bytes];
    if (v15) {
      int v16 = (const char *)v15;
    }
    else {
      int v16 = "";
    }
    xpc_dictionary_set_data(v14, "siPC", v16, [v13 length]);
  }

  -[CBSpatialInteractionSession uwbConfigData](self, "uwbConfigData");
  int v17 = (void *)objc_claimAutoreleasedReturnValue();
  int v18 = v17;
  if (v17)
  {
    id v19 = v17;
    id v20 = xdict;
    uint64_t v21 = [v19 bytes];
    if (v21) {
      int v22 = (const char *)v21;
    }
    else {
      int v22 = "";
    }
    xpc_dictionary_set_data(v20, "siUC", v22, [v19 length]);
  }

  uint64_t uwbTokenFlags = self->_uwbTokenFlags;
  if ((_DWORD)uwbTokenFlags) {
    xpc_dictionary_set_uint64(xdict, "siUF", uwbTokenFlags);
  }
  clientIrkData = self->_clientIrkData;
  if (clientIrkData)
  {
    if (-[NSData length](clientIrkData, "length") == 16)
    {
      v25 = self->_clientIrkData;
      if (v25)
      {
        v26 = v25;
        id v27 = xdict;
        v28 = v26;
        uint64_t v29 = -[NSData bytes](v28, "bytes");
        if (v29) {
          v30 = (const char *)v29;
        }
        else {
          v30 = "";
        }
        size_t v31 = -[NSData length](v28, "length");

        xpc_dictionary_set_data(v27, "irkD", v30, v31);
      }
    }

    else
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        NSUInteger v42 = -[NSData length](self->_clientIrkData, "length");
        uint64_t v43 = 16LL;
        LogPrintF_safe();
      }
    }
  }

  clientIdentifierData = self->_clientIdentifierData;
  if (clientIdentifierData)
  {
    if (-[NSData length](clientIdentifierData, "length") == 3)
    {
      v34 = self->_clientIdentifierData;
      if (v34)
      {
        v35 = v34;
        id v36 = xdict;
        v37 = v35;
        uint64_t v38 = -[NSData bytes](v37, "bytes");
        if (v38) {
          v39 = (const char *)v38;
        }
        else {
          v39 = "";
        }
        size_t v40 = -[NSData length](v37, "length", v42, v43);

        xpc_dictionary_set_data(v36, "id", v39, v40);
      }
    }

    else
    {
      int v41 = self->_ucat->var0;
      if (v41 <= 90 && (v41 != -1 || _LogCategory_Initialize()))
      {
        -[NSData length](self->_clientIdentifierData, "length", v42, v43);
        LogPrintF_safe();
      }
    }
  }

  CUXPCEncodeObject();
}

- (id)description
{
  return -[CBSpatialInteractionSession descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t clientID = self->_clientID;
  NSAppendPrintF_safe();
  id v4 = 0LL;
  if (self->_controlFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v5 = v4;

    id v4 = v5;
  }

  advertisingAddressData = self->_advertisingAddressData;
  if (advertisingAddressData)
  {
    uint64_t v7 = advertisingAddressData;
    uint64_t clientID = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v8 = v4;

    id v4 = v8;
  }

  int advertiseRate = self->_advertiseRate;
  if (advertiseRate)
  {
    int v10 = advertiseRate - 10;
    uint64_t v11 = "Periodic";
    switch(v10)
    {
      case 0:
        break;
      case 5:
        uint64_t v11 = "PeriodicHigh";
        break;
      case 10:
        uint64_t v11 = "Background";
        break;
      case 20:
        uint64_t v11 = "Low";
        break;
      case 30:
        uint64_t v11 = "Medium";
        break;
      case 32:
        uint64_t v11 = "MediumMid";
        break;
      case 35:
        uint64_t v11 = "MediumHigh";
        break;
      case 40:
        uint64_t v11 = "High";
        break;
      case 50:
        uint64_t v11 = "Max";
        break;
      default:
        uint64_t v11 = "?";
        break;
    }

    uint64_t clientID = (uint64_t)v11;
    NSAppendPrintF_safe();
    id v12 = v4;

    id v4 = v12;
  }

  if (self->_enableEPAForLEAdvertisement)
  {
    uint64_t clientID = 1LL;
    NSAppendPrintF_safe();
    id v13 = v4;

    id v4 = v13;
  }

  int scanRate = self->_scanRate;
  if (scanRate)
  {
    int v15 = scanRate - 10;
    int v16 = "Periodic";
    switch(v15)
    {
      case 0:
        break;
      case 10:
        int v16 = "Background";
        break;
      case 20:
        int v16 = "Low";
        break;
      case 25:
        int v16 = "MediumLow";
        break;
      case 30:
        int v16 = "Medium";
        break;
      case 40:
        int v16 = "High";
        break;
      case 50:
        int v16 = "Max";
        break;
      default:
        int v16 = "?";
        break;
    }

    uint64_t clientID = (uint64_t)v16;
    NSAppendPrintF_safe();
    id v17 = v4;

    id v4 = v17;
  }

  int scanRateScreenOff = self->_scanRateScreenOff;
  if (scanRateScreenOff)
  {
    int v19 = scanRateScreenOff - 10;
    id v20 = "Periodic";
    switch(v19)
    {
      case 0:
        break;
      case 10:
        id v20 = "Background";
        break;
      case 20:
        id v20 = "Low";
        break;
      case 25:
        id v20 = "MediumLow";
        break;
      case 30:
        id v20 = "Medium";
        break;
      case 40:
        id v20 = "High";
        break;
      case 50:
        id v20 = "Max";
        break;
      default:
        id v20 = "?";
        break;
    }

    uint64_t clientID = (uint64_t)v20;
    NSAppendPrintF_safe();
    id v21 = v4;

    id v4 = v21;
  }

  int scanRateOverride = self->_scanRateOverride;
  if (scanRateOverride)
  {
    int v23 = scanRateOverride - 10;
    v24 = "Periodic";
    switch(v23)
    {
      case 0:
        break;
      case 10:
        v24 = "Background";
        break;
      case 20:
        v24 = "Low";
        break;
      case 25:
        v24 = "MediumLow";
        break;
      case 30:
        v24 = "Medium";
        break;
      case 40:
        v24 = "High";
        break;
      case 50:
        v24 = "Max";
        break;
      default:
        v24 = "?";
        break;
    }

    uint64_t clientID = (uint64_t)v24;
    NSAppendPrintF_safe();
    id v25 = v4;

    id v4 = v25;
  }

  if (self->_bleRSSIThresholdHint)
  {
    uint64_t clientID = self->_bleRSSIThresholdHint;
    NSAppendPrintF_safe();
    id v26 = v4;

    id v4 = v26;
  }

  if (self->_bleRSSIThresholdOrder)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v27 = v4;

    id v4 = v27;
  }

  identifierData = self->_identifierData;
  if (identifierData)
  {
    uint64_t clientID = identifierData;
    NSAppendPrintF_safe();
    id v29 = v4;

    id v4 = v29;
  }

  irkData = self->_irkData;
  if (irkData)
  {
    size_t v31 = irkData;
    uint64_t clientID = CUPrintNSObjectMasked();
    NSAppendPrintF_safe();
    id v32 = v4;

    id v4 = v32;
  }

  tokenData = self->_tokenData;
  if (tokenData)
  {
    v34 = tokenData;
    uint64_t clientID = CUPrintNSObjectMasked();
    NSAppendPrintF_safe();
    id v35 = v4;

    id v4 = v35;
  }

  -[CBSpatialInteractionSession uwbConfigData](self, "uwbConfigData", clientID);
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    CUPrintNSDataHex();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v37 = v4;

    id v4 = v37;
  }

  -[CBSpatialInteractionSession presenceConfigData](self, "presenceConfigData");
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    CUPrintNSDataHex();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v39 = v4;

    id v4 = v39;
  }

  if (self->_uwbTokenFlags)
  {
    NSAppendPrintF_safe();
    id v40 = v4;

    id v4 = v40;
  }

  if (self->_systemOverrideFlags)
  {
    CUPrintFlags32();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v41 = v4;

    id v4 = v41;
  }

  deviceMap = self->_deviceMap;
  if (deviceMap)
  {
    uint64_t v43 = deviceMap;
    -[NSMutableDictionary count](v43, "count");
    NSAppendPrintF_safe();
    id v44 = v4;

    id v4 = v44;
  }

  clientIrkData = self->_clientIrkData;
  if (clientIrkData)
  {
    v46 = clientIrkData;
    CUPrintNSObjectMasked();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v47 = v4;

    id v4 = v47;
  }

  clientIdentifierData = self->_clientIdentifierData;
  if (clientIdentifierData)
  {
    v49 = clientIdentifierData;
    CUPrintNSObjectMasked();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v50 = v4;

    id v4 = v50;
  }

  filter = self->_filter;
  if (filter)
  {
    v60 = filter;
    NSAppendPrintF_safe();
    id v52 = v4;

    id v4 = v52;
  }

  return v4;
}

- (BOOL)matchesWithDevice:(id)a3
{
  unsigned int v4 = [a3 deviceFlags];
  unsigned int controlFlags = self->_controlFlags;
  if ((v4 & 0x100) != 0 && (controlFlags & 0x40) != 0)
  {
    LOBYTE(v6) = 1;
  }

  else if ((v4 & 0x400) != 0 && (controlFlags & 0x100) != 0)
  {
    LOBYTE(v6) = 1;
  }

  else if ((v4 & 0x80) != 0 && (controlFlags & 0x20) != 0)
  {
    LOBYTE(v6) = 1;
  }

  else if ((v4 & 0x200) != 0 && (controlFlags & 0x80) != 0)
  {
    LOBYTE(v6) = 1;
  }

  else
  {
    return (v4 >> 11) & ((self->_controlFlags & 0x200) >> 9);
  }

  return v6;
}

- (BOOL)updateWithSession:(id)a3
{
  id v4 = a3;
  int v5 = [v4 advertiseRate];
  int advertiseRate = self->_advertiseRate;
  BOOL v7 = v5 != advertiseRate;
  if (v5 == advertiseRate)
  {
    id v9 = 0LL;
    if ([v4 controlFlags] != self->_controlFlags)
    {
LABEL_27:
      CUPrintFlags32();
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 controlFlags];
      CUPrintFlags32();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      CUAppendF();
      id v13 = v9;

      self->_unsigned int controlFlags = objc_msgSend(v4, "controlFlags", v12, v60);
      BOOL v7 = 1;
      id v9 = v13;
    }
  }

  else
  {
    id v8 = "Default";
    switch(advertiseRate)
    {
      case 0:
        break;
      case 10:
        id v8 = "Periodic";
        break;
      case 15:
        id v8 = "PeriodicHigh";
        break;
      case 20:
        id v8 = "Background";
        break;
      case 30:
        id v8 = "Low";
        break;
      case 40:
        id v8 = "Medium";
        break;
      case 42:
        id v8 = "MediumMid";
        break;
      case 45:
        id v8 = "MediumHigh";
        break;
      case 50:
        id v8 = "High";
        break;
      case 60:
        id v8 = "Max";
        break;
      default:
        id v8 = "?";
        break;
    }

    int v10 = [v4 advertiseRate];
    uint64_t v11 = "Default";
    switch(v10)
    {
      case 0:
        break;
      case 10:
        uint64_t v11 = "Periodic";
        break;
      case 15:
        uint64_t v11 = "PeriodicHigh";
        break;
      case 20:
        uint64_t v11 = "Background";
        break;
      case 30:
        uint64_t v11 = "Low";
        break;
      case 40:
        uint64_t v11 = "Medium";
        break;
      case 42:
        uint64_t v11 = "MediumMid";
        break;
      case 45:
        uint64_t v11 = "MediumHigh";
        break;
      case 50:
        uint64_t v11 = "High";
        break;
      case 60:
        uint64_t v11 = "Max";
        break;
      default:
        uint64_t v11 = "?";
        break;
    }

    v57 = v8;
    v59 = v11;
    CUAppendF();
    id v9 = 0LL;
    self->_int advertiseRate = objc_msgSend(v4, "advertiseRate", v57, v59);
  }

  if ([v4 bleRSSIThresholdHint] == self->_bleRSSIThresholdHint)
  {
    goto LABEL_30;
  }

  uint64_t bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
  uint64_t v62 = (int)[v4 bleRSSIThresholdHint];
  CUAppendF();
  id v22 = v9;

  self->_uint64_t bleRSSIThresholdHint = objc_msgSend(v4, "bleRSSIThresholdHint", bleRSSIThresholdHint, v62);
  BOOL v7 = 1;
  id v9 = v22;
  if ([v4 bleRSSIThresholdOrder] != self->_bleRSSIThresholdOrder)
  {
LABEL_30:
    CUPrintFlags32();
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 bleRSSIThresholdOrder];
    CUPrintFlags32();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v15 = v9;

    self->_bleRSSIThresholdOrder = objc_msgSend(v4, "bleRSSIThresholdOrder", v14, v61);
    BOOL v7 = 1;
    id v9 = v15;
  }

- (NSArray)discoveredDevices
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceMap;
  id v4 = v3;
  if (v3)
  {
    -[NSMutableDictionary allValues](v3, "allValues");
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v5 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)setAdvertiseRate:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __48__CBSpatialInteractionSession_setAdvertiseRate___block_invoke;
  v3[3] = &unk_189FB1E00;
  int v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __48__CBSpatialInteractionSession_setAdvertiseRate___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 88);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 88) = v1;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 24))
    {
      int v6 = **(_DWORD **)(v5 + 64);
      if (v6 <= 30)
      {
        if (v6 != -1 || (int v7 = _LogCategory_Initialize(), v5 = *(void *)(a1 + 32), v7))
        {
          LogPrintF_safe();
          uint64_t v5 = *(void *)(a1 + 32);
        }
      }
    }

    id v8 = *(void **)(v5 + 24);
    if (v8)
    {
      id v9 = v8;
      dispatch_source_cancel(v9);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 24);
      *(void *)(v10 + 24) = 0LL;
    }
  }

  return v1 != v3;
}

- (void)setAdvertiseRate:(int)a3 timeout:(double)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke;
  v4[3] = &unk_189FB6068;
  int v5 = a3;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v4);
}

BOOL __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 88);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 88) = v1;
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = **(_DWORD **)(v5 + 64);
    if (v6 <= 30)
    {
      if (v6 != -1 || (int v7 = _LogCategory_Initialize(), v5 = *(void *)(a1 + 32), v7))
      {
        LogPrintF_safe();
        uint64_t v5 = *(void *)(a1 + 32);
      }
    }

    id v8 = *(void **)(v5 + 24);
    if (v8)
    {
      id v9 = v8;
      dispatch_source_cancel(v9);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 24);
      *(void *)(v10 + 24) = 0LL;
    }

    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 136LL));
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 24);
    *(void *)(v13 + 24) = v12;
    id v15 = v12;

    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke_2;
    handler[3] = &unk_189FB1AE0;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_event_handler(v15, handler);
    CUDispatchTimerSet();
    dispatch_activate(v15);
  }

  return v1 != v3;
}

uint64_t __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[8];
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF_safe();
      uint64_t v2 = *(_DWORD ***)(a1 + 32);
    }
  }

  uint64_t v5 = v2;
  objc_sync_enter(v5);
  int v6 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (v6)
  {
    int v7 = v6;
    dispatch_source_cancel(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = 0LL;
  }

  objc_sync_exit(v5);

  return [*(id *)(a1 + 32) setAdvertiseRate:0];
}

- (void)setControlFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __47__CBSpatialInteractionSession_setControlFlags___block_invoke;
  v3[3] = &unk_189FB1E00;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __47__CBSpatialInteractionSession_setControlFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 92) = v1;
  }
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setScanRate:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43__CBSpatialInteractionSession_setScanRate___block_invoke;
  v3[3] = &unk_189FB1E00;
  int v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __43__CBSpatialInteractionSession_setScanRate___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 96);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 96) = v1;
  }
  return v1 != v3;
}

- (void)setScanRateScreenOff:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __52__CBSpatialInteractionSession_setScanRateScreenOff___block_invoke;
  v3[3] = &unk_189FB1E00;
  int v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __52__CBSpatialInteractionSession_setScanRateScreenOff___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 104);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 104) = v1;
  }
  return v1 != v3;
}

- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __56__CBSpatialInteractionSession_setBleRSSIThresholdOrder___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __56__CBSpatialInteractionSession_setBleRSSIThresholdOrder___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 82);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 82) = v1;
  }
  return v1 != v3;
}

- (void)setFilter:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__CBSpatialInteractionSession_setFilter___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __41__CBSpatialInteractionSession_setFilter___block_invoke(uint64_t a1)
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

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
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
    block[2] = __54__CBSpatialInteractionSession_activateWithCompletion___block_invoke;
    block[3] = &unk_189FB1AE0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __54__CBSpatialInteractionSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (self->_bluetoothStateChangedHandler) {
    self->_internalFlags |= 1u;
  }
  uint64_t v9 = gCBDaemonServer;
  self->_direct = gCBDaemonServer != 0;
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Activate after invalidate", v2, v3, v4, v5, v6, v7, v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    id v11 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v11)
    {
      ((void (**)(void, id))v11)[2](v11, v17);
    }

    else
    {
      uint64_t v13 = MEMORY[0x18959F890](self->_errorHandler);
      id v14 = (void *)v13;
      if (v13) {
        (*(void (**)(uint64_t, id))(v13 + 16))(v13, v17);
      }
    }
  }

  else if (v9)
  {
    -[CBSpatialInteractionSession _activateDirectStart](self, "_activateDirectStart");
  }

  else
  {
    -[CBSpatialInteractionSession _activateXPCStart:](self, "_activateXPCStart:", 0LL);
  }

- (void)_activateDirectStart
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = self;
    LogPrintF_safe();
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __51__CBSpatialInteractionSession__activateDirectStart__block_invoke;
  v5[3] = &unk_189FB1E78;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBSpatialInteractionSession:completion:", self, v5, v4);
}

void __51__CBSpatialInteractionSession__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(dispatch_queue_s **)(v4 + 136);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __51__CBSpatialInteractionSession__activateDirectStart__block_invoke_2;
  v7[3] = &unk_189FB1900;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __51__CBSpatialInteractionSession__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = (void (**)(id, void))MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 64LL);
  if (*(void *)(a1 + 40))
  {
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    if (v9)
    {
      v9[2](v9, *(void *)(a1 + 40));
    }

    else
    {
      uint64_t v5 = MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 160LL));
      id v6 = (void *)v5;
      if (v5) {
        (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 40));
      }
    }

    goto LABEL_17;
  }

  uint64_t v7 = v9;
  if (v9)
  {
    v9[2](v9, 0LL);
LABEL_17:
    uint64_t v7 = v9;
  }
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

  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  -[CBSpatialInteractionSession encodeWithXPCObject:](self, "encodeWithXPCObject:", v6);
  xpc_dictionary_set_string(v6, "mTyp", "SpIn");
  -[CBSpatialInteractionSession _ensureXPCStarted](self, "_ensureXPCStarted");
  uint64_t v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __49__CBSpatialInteractionSession__activateXPCStart___block_invoke;
  handler[3] = &unk_189FB6090;
  handler[4] = self;
  BOOL v10 = a3;
  xpc_connection_send_message_with_reply(v7, v6, dispatchQueue, handler);
}

uint64_t __49__CBSpatialInteractionSession__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2 reactivate:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_activateXPCCompleted:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v41 = 0LL;
  id v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000LL;
  id v44 = __Block_byref_object_copy__7;
  int v45 = __Block_byref_object_dispose__7;
  id v46 = 0LL;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke;
  v40[3] = &unk_189FB1C20;
  v40[4] = self;
  v40[5] = &v41;
  id v8 = (void (**)(void))MEMORY[0x18959F890](v40);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = v42[5];
  v42[5] = (id)v9;

  if (!v42[5])
  {
    id obj = 0LL;
    CUXPCDecodeNSData();
    CUXPCDecodeNSData();
    objc_storeStrong((id *)&self->_advertisingAddressData, 0LL);
    self->_bluetoothState = xpc_dictionary_get_int64(v6, "pwrS");
    id v11 = v42;
    id v38 = v42[5];
    int v12 = CUXPCDecodeNSData();
    objc_storeStrong(v11 + 5, v38);
    if (v12)
    {
      xpc_dictionary_get_array(v6, "devA");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = v13;
      if (!v13) {
        goto LABEL_9;
      }
      uint64_t v32 = 0LL;
      v33 = &v32;
      uint64_t v34 = 0x3032000000LL;
      id v35 = __Block_byref_object_copy__7;
      id v36 = __Block_byref_object_dispose__7;
      id v37 = 0LL;
      uint64_t v26 = 0LL;
      id v27 = &v26;
      uint64_t v28 = 0x3032000000LL;
      id v29 = __Block_byref_object_copy__7;
      v30 = __Block_byref_object_dispose__7;
      id v31 = 0LL;
      applier[0] = v7;
      applier[1] = 3221225472LL;
      applier[2] = __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke_2;
      applier[3] = &unk_189FB4A48;
      applier[4] = &v26;
      applier[5] = &v32;
      xpc_array_apply(v13, applier);
      uint64_t v15 = (void *)v27[5];
      if (v15)
      {
        id v22 = v42;
        id v23 = v15;
        int v16 = (CBSpatialInteractionSession *)v22[5];
        v22[5] = v23;
      }

      else
      {
        int v16 = self;
        objc_sync_enter(v16);
        objc_storeStrong((id *)&v16->_deviceMap, (id)v33[5]);
        objc_sync_exit(v16);
      }

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v32, 8);

      if (!v15)
      {
LABEL_9:
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v24 = self;
          LogPrintF_safe();
        }

        int v18 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
        id activateCompletion = self->_activateCompletion;
        self->_id activateCompletion = 0LL;

        if (v18) {
          v18[2](v18, 0LL);
        }
        if (v4)
        {
          uint64_t v20 = MEMORY[0x18959F890](self->_tokenChangedHandler);
          BOOL v21 = (void *)v20;
          if (v20) {
            (*(void (**)(uint64_t))(v20 + 16))(v20);
          }
          -[CBSpatialInteractionSession _reAddTokens](self, "_reAddTokens", v24);
        }
      }
    }
  }

  v8[2](v8);

  _Block_object_dispose(&v41, 8);
}

void __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 64);
    if (v3 <= 90)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
      {
        CUPrintNSError();
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }

    id v10 = (void (**)(id, void))MEMORY[0x18959F890](*(void *)(v2 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0LL;

    if (v10)
    {
      v10[2](v10, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    }

    else
    {
      uint64_t v7 = MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 160LL));
      id v8 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))( v7,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
      }
    }
  }

BOOL __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
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
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = v14 != 0LL;
    if (v14)
    {
      int v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      if (!v16)
      {
        id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
        int v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        int v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
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

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  id v4 = self->_xpcCnx;
  if (v4) {
    return v4;
  }
  uint64_t v5 = self->_testListenerEndpoint;
  uint64_t v6 = v5;
  if (v5)
  {
    mach_service = xpc_connection_create_from_endpoint(v5);
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
  }

  else
  {
    mach_service = xpc_connection_create_mach_service( "com.apple.bluetooth.xpc",  (dispatch_queue_t)self->_dispatchQueue,  0LL);
  }

  objc_storeStrong((id *)p_xpcCnx, mach_service);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __48__CBSpatialInteractionSession__ensureXPCStarted__block_invoke;
  v10[3] = &unk_189FB1EC8;
  v10[4] = self;
  uint64_t v8 = mach_service;
  uint64_t v11 = v8;
  xpc_connection_set_event_handler(v8, v10);
  xpc_connection_activate(v8);

  return v8;
}

void *__48__CBSpatialInteractionSession__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[9] == *(void *)(a1 + 40)) {
    return (void *)[result _xpcReceivedEvent:a2];
  }
  return result;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = self;
      LogPrintF_safe();
    }

    -[CBSpatialInteractionSession _lostAllDevices](self, "_lostAllDevices", v8);
    uint64_t v4 = MEMORY[0x18959F890](self->_interruptionHandler);
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    self->_bluetoothState = 1LL;
    uint64_t v6 = MEMORY[0x18959F890](self->_bluetoothStateChangedHandler);
    uint64_t v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

    -[CBSpatialInteractionSession _activateXPCStart:](self, "_activateXPCStart:", 1LL);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__CBSpatialInteractionSession_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__CBSpatialInteractionSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 49))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 49) = 1;
    int v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[8];
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF_safe();
        int v3 = *(_DWORD ***)(v2 + 32);
      }
    }

    uint64_t v6 = v3;
    objc_sync_enter(v6);
    uint64_t v7 = *(void **)(*(void *)(v2 + 32) + 24LL);
    if (v7)
    {
      uint64_t v8 = v7;
      dispatch_source_cancel(v8);
      uint64_t v9 = *(void *)(v2 + 32);
      uint64_t v10 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = 0LL;
    }

    objc_sync_exit(v6);

    uint64_t v11 = *(void *)(v2 + 32);
    if (*(_BYTE *)(v11 + 48))
    {
      [(id)v11 _invalidateDirect];
      uint64_t v11 = *(void *)(v2 + 32);
    }

    uint64_t v12 = *(_xpc_connection_s **)(v11 + 72);
    if (v12) {
      xpc_connection_cancel(v12);
    }
    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

- (void)_invalidateDirect
{
}

void __48__CBSpatialInteractionSession__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 136);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__CBSpatialInteractionSession__invalidateDirect__block_invoke_2;
  block[3] = &unk_189FB1AE0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __48__CBSpatialInteractionSession__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct && !self->_xpcCnx)
  {
    self->_invalidateCalled = 1;
    id advertisingAddressChangedHandler = self->_advertisingAddressChangedHandler;
    self->_id advertisingAddressChangedHandler = 0LL;

    id aopDataHandler = self->_aopDataHandler;
    self->_id aopDataHandler = 0LL;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0LL;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    uint64_t v17 = MEMORY[0x18959F890](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id measurementHandler = self->_measurementHandler;
    self->_id measurementHandler = 0LL;

    id systemOverrideHandler = self->_systemOverrideHandler;
    self->_id systemOverrideHandler = 0LL;

    id tokenChangedHandler = self->_tokenChangedHandler;
    self->_id tokenChangedHandler = 0LL;

    id v14 = (void *)v17;
    if (v17)
    {
      (*(void (**)(uint64_t))(v17 + 16))(v17);
      id v14 = (void *)v17;
    }

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (int v16 = _LogCategory_Initialize(), v14 = (void *)v17, v16))
      {
        LogPrintF_safe();
        id v14 = (void *)v17;
      }
    }
  }

- (void)addPeerToken:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __64__CBSpatialInteractionSession_addPeerToken_userInfo_completion___block_invoke;
  v15[3] = &unk_189FB2BC0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __64__CBSpatialInteractionSession_addPeerToken_userInfo_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addPeerToken:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)addPeerToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__CBSpatialInteractionSession_addPeerToken_completion___block_invoke;
  block[3] = &unk_189FB2B78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __55__CBSpatialInteractionSession_addPeerToken_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addPeerToken:*(void *)(a1 + 40) userInfo:0 completion:*(void *)(a1 + 48)];
}

- (void)_addPeerToken:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v63 = 0LL;
  v64 = &v63;
  uint64_t v65 = 0x3032000000LL;
  v66 = __Block_byref_object_copy__7;
  v67 = __Block_byref_object_dispose__7;
  id v68 = 0LL;
  v60[0] = MEMORY[0x1895F87A8];
  v60[1] = 3221225472LL;
  v60[2] = __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke;
  v60[3] = &unk_189FB1BF8;
  uint64_t v62 = &v63;
  v60[4] = self;
  id v54 = v10;
  id v61 = v54;
  id v17 = (void (**)(void))MEMORY[0x18959F890](v60);
  v53 = v17;
  if (self->_activateCalled)
  {
    int v59 = 0;
    id v18 = (void *)OPACKDecodeData();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v25 = objc_alloc_init(&OBJC_CLASS___CBSpatialInteractionPeerInfoClient);
        -[CBSpatialInteractionPeerInfoClient setTokenData:](v25, "setTokenData:", v8);
        -[CBSpatialInteractionPeerInfoClient setUserInfo:](v25, "setUserInfo:", v9);
        -[CBSpatialInteractionPeerInfoClient setUwbTokenFlags:](v25, "setUwbTokenFlags:", CFDictionaryGetInt64Ranged());
        id v52 = v9;
        uint64_t ClientID = CBXPCGetNextClientID();
        [MEMORY[0x189607968] numberWithUnsignedInt:ClientID];
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        peerMap = self->_peerMap;
        if (!peerMap)
        {
          id v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
          v30 = self->_peerMap;
          self->_peerMap = v29;

          peerMap = self->_peerMap;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](peerMap, "setObject:forKeyedSubscript:", v25, v27);
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSObjectMasked();
          id v50 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v51 = ClientID;
          LogPrintF_safe();
        }

        xpc_object_t v32 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_string(v32, "mTyp", "SpAT");
        if ((_DWORD)ClientID) {
          xpc_dictionary_set_uint64(v32, "siPI", ClientID);
        }
        if (v8)
        {
          id v33 = v8;
          id v34 = v32;
          id v35 = (const char *)[v33 bytes];
          size_t v36 = [v33 length];
          if (!v35) {
            id v35 = "";
          }

          xpc_dictionary_set_data(v34, "siTD", v35, v36);
        }

        -[CBSpatialInteractionSession _ensureXPCStarted](self, "_ensureXPCStarted", v50, v51);
        id v37 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke_130;
        handler[3] = &unk_189FB60B8;
        handler[4] = self;
        id v56 = v8;
        v57 = v27;
        id v58 = v54;
        xpc_connection_send_message_with_reply(v37, v32, dispatchQueue, handler);

        id v9 = v52;
        id v17 = v53;
      }

      else
      {
        uint64_t v49 = CBErrorF(312900, (uint64_t)"Non-dict token", v19, v20, v21, v22, v23, v24, (uint64_t)v50);
        id v25 = (CBSpatialInteractionPeerInfoClient *)v64[5];
        v64[5] = v49;
      }
    }

    else
    {
      CUPrintErrorCode();
      id v25 = (CBSpatialInteractionPeerInfoClient *)objc_claimAutoreleasedReturnValue();
      uint64_t v47 = CBErrorF(312900, (uint64_t)"Decode token failed: %@", v41, v42, v43, v44, v45, v46, (uint64_t)v25);
      v48 = (void *)v64[5];
      v64[5] = v47;
    }
  }

  else
  {
    uint64_t v39 = CBErrorF(-6745, (uint64_t)"Not activated", v11, v12, v13, v14, v15, v16, (uint64_t)v50);
    int v40 = (void *)v64[5];
    v64[5] = v39;
  }

  v17[2](v17);

  _Block_object_dispose(&v63, 8);
}

uint64_t __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 64LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

void __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke_130(void *a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v3 = a1[4];
  int v4 = **(_DWORD **)(v3 + 64);
  id v10 = (id)v2;
  if (v2)
  {
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v6 = _LogCategory_Initialize(), v3 = a1[4], v6))
      {
        CUPrintNSObjectMasked();
        int v5 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        id v7 = v5;
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        uint64_t v3 = a1[4];
      }
    }

    objc_msgSend(*(id *)(v3 + 56), "setObject:forKeyedSubscript:", 0, a1[6], v7, v9);
    (*(void (**)(void))(a1[7] + 16LL))(a1[7]);
  }

  else
  {
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectMasked();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    (*(void (**)(void))(a1[7] + 16LL))(a1[7]);
  }
}

- (void)_reAddTokens
{
  peerMap = self->_peerMap;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43__CBSpatialInteractionSession__reAddTokens__block_invoke;
  v3[3] = &unk_189FB60E0;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerMap, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __43__CBSpatialInteractionSession__reAddTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntValue];
  [v5 tokenData];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  int v8 = **(_DWORD **)(*(void *)(a1 + 32) + 64LL);
  if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectMasked();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = v6;
    LogPrintF_safe();
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v9, "mTyp", "SpAT");
  if ((_DWORD)v6) {
    xpc_dictionary_set_uint64(v9, "siPI", v6);
  }
  if (v7)
  {
    id v10 = v7;
    id v11 = v9;
    id v12 = v10;
    uint64_t v13 = [v12 bytes];
    if (v13) {
      uint64_t v14 = (const char *)v13;
    }
    else {
      uint64_t v14 = "";
    }
    size_t v15 = objc_msgSend(v12, "length", v19, v20);

    xpc_dictionary_set_data(v11, "siTD", v14, v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v19, v20);
  uint64_t v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(dispatch_queue_s **)(v17 + 136);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __43__CBSpatialInteractionSession__reAddTokens__block_invoke_2;
  handler[3] = &unk_189FB1EC8;
  handler[4] = v17;
  void handler[5] = v7;
  xpc_connection_send_message_with_reply(v16, v9, v18, handler);
}

void __43__CBSpatialInteractionSession__reAddTokens__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v3 = (void *)v2;
  if (v2) {
    int v4 = 90;
  }
  else {
    int v4 = 30;
  }
  int v5 = **(_DWORD **)(*(void *)(a1 + 32) + 64LL);
  if (v4 >= v5)
  {
    xpc_object_t v9 = (void *)v2;
    if (v5 != -1 || (int v7 = _LogCategory_Initialize(), v3 = v9, v7))
    {
      CUPrintNSObjectMasked();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      uint64_t v3 = v9;
    }
  }
}

- (void)removePeerToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke;
  block[3] = &unk_189FB2B78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v9 + 8))
  {
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    [*(id *)(v9 + 56) allKeys];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v58;
LABEL_4:
      uint64_t v14 = 0LL;
      while (1)
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(v10);
        }
        size_t v15 = *(void **)(*((void *)&v57 + 1) + 8 * v14);
        [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v15];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 tokenData];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = *(void **)(a1 + 40);
        id v19 = v17;
        id v20 = v18;
        if (v19 == v20) {
          break;
        }
        uint64_t v21 = v20;
        if ((v19 == 0LL) != (v20 != 0LL))
        {
          char v22 = [v19 isEqual:v20];

          if ((v22 & 1) != 0) {
            goto LABEL_19;
          }
        }

        else
        {
        }

        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v57 objects:v61 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_14;
        }
      }

LABEL_19:
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:0 forKeyedSubscript:v15];
      id v32 = v15;

      if (!v32) {
        goto LABEL_23;
      }
      int v33 = **(_DWORD **)(*(void *)(a1 + 32) + 64LL);
      if (v33 <= 30 && (v33 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectMasked();
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v50 = [v32 unsignedIntValue];
        LogPrintF_safe();
      }

      xpc_object_t v37 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v37, "mTyp", "SpRT");
      id v38 = *(void **)(a1 + 40);
      if (v38)
      {
        id v39 = v38;
        id v40 = v37;
        id v41 = v39;
        uint64_t v42 = [v41 bytes];
        if (v42) {
          uint64_t v43 = (const char *)v42;
        }
        else {
          uint64_t v43 = "";
        }
        size_t v44 = objc_msgSend(v41, "length", v49, v50);

        xpc_dictionary_set_data(v40, "siTD", v43, v44);
      }

      objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v49);
      uint64_t v45 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v46 = *(void *)(a1 + 32);
      uint64_t v47 = *(void **)(a1 + 40);
      v48 = *(dispatch_queue_s **)(v46 + 136);
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke_2;
      handler[3] = &unk_189FB6108;
      handler[4] = v46;
      id v55 = v47;
      id v56 = *(id *)(a1 + 48);
      xpc_connection_send_message_with_reply(v45, v37, v48, handler);
    }

    else
    {
LABEL_14:

LABEL_23:
      CBErrorF(-6727, (uint64_t)"Token not found", v23, v24, v25, v26, v27, v28, (uint64_t)v49);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      int v34 = **(_DWORD **)(*(void *)(a1 + 32) + 64LL);
      if (v34 <= 90 && (v34 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectMasked();
        id v35 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        id v52 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
      }

      (*(void (**)(void, id))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v32);
    }
  }

  else
  {
    uint64_t v29 = CBErrorF(-6745, (uint64_t)"Not activated", a3, a4, a5, a6, a7, a8, (uint64_t)v49);
    int v30 = **(_DWORD **)(*(void *)(a1 + 32) + 64LL);
    id v53 = (id)v29;
    if (v30 <= 90)
    {
      if (v30 != -1 || (v36 = _LogCategory_Initialize(), uint64_t v29 = (uint64_t)v53, v36))
      {
        CUPrintNSObjectMasked();
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        uint64_t v29 = (uint64_t)v53;
      }
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v29);
  }

void __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 64LL);
  id v9 = (id)v2;
  if (v2)
  {
    id v4 = (id)v2;
    if (v3 <= 90)
    {
      if (v3 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v9, v6))
      {
        CUPrintNSObjectMasked();
        int v5 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        id v4 = v9;
      }
    }

    (*(void (**)(void, id))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v4);
  }

  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectMasked();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL);
  }
}

- (void)_lostAllDevices
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int v3 = (void (**)(void, void))MEMORY[0x18959F890](self->_deviceLostHandler, a2);
  id v4 = self;
  objc_sync_enter(v4);
  deviceMap = v4->_deviceMap;
  if (v3)
  {
    -[NSMutableDictionary allValues](deviceMap, "allValues");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](v4->_deviceMap, "removeAllObjects");
    objc_sync_exit(v4);

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          v3[2](v3, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }

        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](deviceMap, "removeAllObjects");
    objc_sync_exit(v4);
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__CBSpatialInteractionSession__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_189FB1AE0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __56__CBSpatialInteractionSession__updateIfNeededWithBlock___block_invoke(uint64_t a1)
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
      xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
      -[CBSpatialInteractionSession encodeWithXPCObject:](v2, "encodeWithXPCObject:", xdict);
      xpc_dictionary_set_string(xdict, "mTyp", "SpIU");
      -[CBSpatialInteractionSession _ensureXPCStarted](v2, "_ensureXPCStarted");
      int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v5, xdict);
    }

    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

- (void)_xpcReceivedEvent:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v24 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v24, v6))
    {
      CUPrintXPC();
      char v22 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      id v4 = v24;
    }
  }

  if (MEMORY[0x18959FCE0](v4) == MEMORY[0x1895F9250])
  {
    -[CBSpatialInteractionSession _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v24);
    goto LABEL_26;
  }

  if (v24 == (id)MEMORY[0x1895F9198])
  {
    -[CBSpatialInteractionSession _interrupted](self, "_interrupted");
    goto LABEL_26;
  }

  if (v24 != (id)MEMORY[0x1895F91A0])
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
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v22);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      int v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        uint64_t v19 = MEMORY[0x18959F890](self->_errorHandler);
        id v20 = (void *)v19;
        if (v19) {
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);
        }

        goto LABEL_26;
      }
    }

    if (v16 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    goto LABEL_21;
  }

  if (!self->_invalidateCalled)
  {
    int v17 = self->_ucat->var0;
  }

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0LL;

  -[CBSpatialInteractionSession _invalidated](self, "_invalidated");
LABEL_26:
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    int var0 = self->_ucat->var0;
LABEL_13:
    LogPrintF_safe();
LABEL_14:

    return;
  }

  int v5 = string;
  if (!strcmp(string, "DvFo"))
  {
    -[CBSpatialInteractionSession _xpcReceivedDeviceFound:](self, "_xpcReceivedDeviceFound:", v8);
  }

  else if (!strcmp(v5, "DvLo"))
  {
    -[CBSpatialInteractionSession _xpcReceivedDeviceLost:](self, "_xpcReceivedDeviceLost:", v8);
  }

  else if (!strcmp(v5, "AdAC"))
  {
    -[CBSpatialInteractionSession _xpcReceivedAdvertisingAddressChanged:]( self,  "_xpcReceivedAdvertisingAddressChanged:",  v8);
  }

  else if (!strcmp(v5, "PwrC"))
  {
    -[CBSpatialInteractionSession _xpcReceivedPowerStateChanged:](self, "_xpcReceivedPowerStateChanged:", v8);
  }

  else if (!strcmp(v5, "SpAD"))
  {
    -[CBSpatialInteractionSession _xpcReceivedAOPData:](self, "_xpcReceivedAOPData:", v8);
  }

  else
  {
    if (strcmp(v5, "SyOC"))
    {
      int v6 = self->_ucat->var0;
      goto LABEL_13;
    }

    -[CBSpatialInteractionSession _xpcReceivedSystemOverrideChanged:](self, "_xpcReceivedSystemOverrideChanged:", v8);
  }

- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3
{
  id v4 = a3;
  CUXPCDecodeBool();
  CUXPCDecodeNSData();

  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSDataAddress();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

  objc_storeStrong((id *)&self->_advertisingAddressData, 0LL);
  uint64_t v6 = MEMORY[0x18959F890](self->_advertisingAddressChangedHandler);
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

- (void)_xpcReceivedAOPData:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    CUXPCDecodeNSData();
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

- (void)_xpcReceivedDeviceFound:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    id v24 = 0LL;
    id v5 = -[CBDevice initWithXPCObject:error:](objc_alloc(&OBJC_CLASS___CBDevice), "initWithXPCObject:error:", v4, &v24);
    id v6 = v24;
    if (v5)
    {
      peerMap = self->_peerMap;
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[CBDevice spatialInteractionPeerID](v5, "spatialInteractionPeerID"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](peerMap, "objectForKeyedSubscript:", v8);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      [v9 tokenData];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 || -[CBSpatialInteractionSession matchesWithDevice:](self, "matchesWithDevice:", v5))
      {
        -[CBDevice setSpatialInteractionTokenData:](v5, "setSpatialInteractionTokenData:", v10);
        [v9 userInfo];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBDevice setSpatialInteractionUserInfo:](v5, "setSpatialInteractionUserInfo:", v11);

        -[CBDevice setSpatialInteractionUWBTokenFlags:]( v5,  "setSpatialInteractionUWBTokenFlags:",  [v9 uwbTokenFlags]);
        -[CBDevice identifier](v5, "identifier");
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          uint64_t v13 = self;
          objc_sync_enter(v13);
          deviceMap = v13->_deviceMap;
          if (!deviceMap)
          {
            id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
            int v16 = v13->_deviceMap;
            v13->_deviceMap = v15;

            deviceMap = v13->_deviceMap;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v12);
          objc_sync_exit(v13);

          int var0 = v13->_ucat->var0;
          uint64_t v18 = MEMORY[0x18959F890](v13->_deviceFoundHandler);
          uint64_t v19 = (void *)v18;
          if (v18) {
            (*(void (**)(uint64_t, CBDevice *))(v18 + 16))(v18, v5);
          }
        }

        else
        {
          int v22 = self->_ucat->var0;
        }
      }

      else
      {
        int v23 = self->_ucat->var0;
      }
    }

    else
    {
      int v21 = self->_ucat->var0;
      CUPrintNSError();
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

LABEL_18:
    goto LABEL_19;
  }

  int v20 = self->_ucat->var0;
LABEL_19:
}

- (void)_xpcReceivedDeviceLost:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    id v16 = 0LL;
    id v5 = -[CBDevice initWithXPCObject:error:](objc_alloc(&OBJC_CLASS___CBDevice), "initWithXPCObject:error:", v4, &v16);
    id v6 = v16;
    if (v5)
    {
      -[CBDevice identifier](v5, "identifier");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        id v8 = self;
        objc_sync_enter(v8);
        -[NSMutableDictionary objectForKeyedSubscript:](v8->_deviceMap, "objectForKeyedSubscript:", v7);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v7);
        objc_sync_exit(v8);

        int var0 = v8->_ucat->var0;
        if (v9)
        {
          uint64_t v11 = MEMORY[0x18959F890](v8->_deviceLostHandler);
          uint64_t v12 = (void *)v11;
          if (v11) {
            (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
          }
        }

        else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

        goto LABEL_13;
      }

      int v15 = self->_ucat->var0;
      if (v15 > 90 || v15 == -1 && !_LogCategory_Initialize())
      {
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
    }

    else
    {
      int v14 = self->_ucat->var0;
      CUPrintNSError();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    LogPrintF_safe();
    goto LABEL_13;
  }

  int v13 = self->_ucat->var0;
LABEL_15:
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
    self->_int scanRateOverride = xpc_dictionary_get_int64(xdict, "scRO");
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

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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

- (unsigned)systemOverrideFlags
{
  return self->_systemOverrideFlags;
}

- (id)systemOverrideHandler
{
  return self->_systemOverrideHandler;
}

- (void)setSystemOverrideHandler:(id)a3
{
}

- (int)advertiseRate
{
  return self->_advertiseRate;
}

- (id)advertisingAddressChangedHandler
{
  return self->_advertisingAddressChangedHandler;
}

- (void)setAdvertisingAddressChangedHandler:(id)a3
{
}

- (NSData)advertisingAddressData
{
  return self->_advertisingAddressData;
}

- (void)setAdvertisingAddressData:(id)a3
{
}

- (id)aopDataHandler
{
  return self->_aopDataHandler;
}

- (void)setAopDataHandler:(id)a3
{
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_enableEPAForLEAdvertisement = a3;
}

- (id)measurementHandler
{
  return self->_measurementHandler;
}

- (void)setMeasurementHandler:(id)a3
{
}

- (int)scanRate
{
  return self->_scanRate;
}

- (int)scanRateOverride
{
  return self->_scanRateOverride;
}

- (void)setScanRateOverride:(int)a3
{
  self->_int scanRateOverride = a3;
}

- (int)scanRateScreenOff
{
  return self->_scanRateScreenOff;
}

- (id)tokenChangedHandler
{
  return self->_tokenChangedHandler;
}

- (void)setTokenChangedHandler:(id)a3
{
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setTokenData:(id)a3
{
}

- (NSData)uwbConfigData
{
  return (NSData *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setUwbConfigData:(id)a3
{
}

- (NSData)presenceConfigData
{
  return (NSData *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setPresenceConfigData:(id)a3
{
}

- (unsigned)uwbTokenFlags
{
  return self->_uwbTokenFlags;
}

- (void)setUwbTokenFlags:(unsigned int)a3
{
  self->_uint64_t uwbTokenFlags = a3;
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

- (NSData)clientIrkData
{
  return (NSData *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setClientIrkData:(id)a3
{
}

- (NSData)clientIdentifierData
{
  return (NSData *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setClientIdentifierData:(id)a3
{
}

- (CBSpatialInteractionFilter)filter
{
  return self->_filter;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (NSData)identifierData
{
  return self->_identifierData;
}

- (void)setIdentifierData:(id)a3
{
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
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