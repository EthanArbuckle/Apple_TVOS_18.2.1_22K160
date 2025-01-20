@interface CBAdvertiser
- (BOOL)enableEPAForLEAdvertisement;
- (BOOL)needsIdentify;
- (BOOL)updateWithCBAdvertiser:(id)a3;
- (CBAdvertiser)init;
- (CBAdvertiser)initWithXPCObject:(id)a3 error:(id *)a4;
- (CBDevice)mockDevice;
- (CBDevice)remoteDevice;
- (NSArray)useCaseClientIDs;
- (NSData)advertisingAddressDataConnectable;
- (NSData)advertisingAddressDataNonConnectable;
- (NSData)advertisingAddressDataNonConnectableSecondary;
- (NSData)airdropTempAuthTagData;
- (NSData)airplaySourceAuthTagData;
- (NSData)airplaySourceUWBConfigData;
- (NSData)fidoPayloadData;
- (NSData)nearbyActionAuthTagData;
- (NSData)nearbyActionExtraData;
- (NSData)nearbyActionNoWakeAuthTagData;
- (NSData)nearbyActionNoWakeConfigData;
- (NSData)nearbyActionTargetData;
- (NSData)nearbyActionV2TargetData;
- (NSData)nearbyInfoV2AuthIntegrityTagData;
- (NSData)nearbyInfoV2AuthTagData;
- (NSData)nearbyInfoV2RapportIRKData;
- (NSData)nearbyInfoV2TempAuthTagData;
- (NSData)safetyAlertsAlertData;
- (NSData)safetyAlertsAlertID;
- (NSData)safetyAlertsSignature;
- (NSData)watchSetupData;
- (NSString)label;
- (NSString)mockID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcListenerEndpoint;
- (char)dsActionMeasuredPower;
- (double)nearbyInfoStatusProgress;
- (id)_ensureXPCStarted;
- (id)advertisingAddressChangedHandler;
- (id)bluetoothStateChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)advertiseRate;
- (int64_t)bluetoothState;
- (unsigned)airdropConfigData;
- (unsigned)airdropFlags;
- (unsigned)airdropHash1;
- (unsigned)airdropHash2;
- (unsigned)airdropHash3;
- (unsigned)airdropHash4;
- (unsigned)airdropModel;
- (unsigned)airdropVersion;
- (unsigned)airplaySourceFlags;
- (unsigned)airplayTargetConfigSeed;
- (unsigned)airplayTargetFlags;
- (unsigned)airplayTargetIPv4;
- (unsigned)airplayTargetPort;
- (unsigned)clientID;
- (unsigned)dsActionFlags;
- (unsigned)dsActionTieBreaker;
- (unsigned)dsInfoVehicleConfidence;
- (unsigned)dsInfoVehicleState;
- (unsigned)heySiriConfidence;
- (unsigned)heySiriDeviceClass;
- (unsigned)heySiriPerceptualHash;
- (unsigned)heySiriProductType;
- (unsigned)heySiriRandom;
- (unsigned)heySiriSNR;
- (unsigned)internalFlags;
- (unsigned)nearbyActionColorCode;
- (unsigned)nearbyActionFlags;
- (unsigned)nearbyActionNWPrecisionFindingStatus;
- (unsigned)nearbyActionNoWakeType;
- (unsigned)nearbyActionType;
- (unsigned)nearbyActionV2Flags;
- (unsigned)nearbyActionV2Type;
- (unsigned)nearbyInfoFlags;
- (unsigned)nearbyInfoStatusTime;
- (unsigned)nearbyInfoStatusType;
- (unsigned)nearbyInfoV2DecryptedFlags;
- (unsigned)nearbyInfoV2Flags;
- (unsigned)nearbyInfoV2InvitationCounter;
- (unsigned)nearbyInfoV2InvitationRouteType;
- (unsigned)nearbyInfoV2InvitationTypes;
- (unsigned)safetyAlertsAlertIndex;
- (unsigned)safetyAlertsVersion;
- (unsigned)useCase;
- (void)_activate;
- (void)_activateDirectStart;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)_xpcReceivedPowerStateChanged:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithXPCObject:(id)a3;
- (void)invalidate;
- (void)setAdvertiseRate:(int)a3;
- (void)setAdvertisingAddressChangedHandler:(id)a3;
- (void)setAdvertisingAddressDataConnectable:(id)a3;
- (void)setAdvertisingAddressDataNonConnectable:(id)a3;
- (void)setAdvertisingAddressDataNonConnectableSecondary:(id)a3;
- (void)setAirdropConfigData:(unsigned __int8)a3;
- (void)setAirdropFlags:(unsigned __int8)a3;
- (void)setAirdropHash1:(unsigned __int16)a3;
- (void)setAirdropHash2:(unsigned __int16)a3;
- (void)setAirdropHash3:(unsigned __int16)a3;
- (void)setAirdropHash4:(unsigned __int16)a3;
- (void)setAirdropModel:(unsigned __int8)a3;
- (void)setAirdropTempAuthTagData:(id)a3;
- (void)setAirdropVersion:(unsigned __int8)a3;
- (void)setAirdrophash1:(unsigned __int16)a3;
- (void)setAirdrophash2:(unsigned __int16)a3;
- (void)setAirdrophash3:(unsigned __int16)a3;
- (void)setAirdrophash4:(unsigned __int16)a3;
- (void)setAirplaySourceAuthTagData:(id)a3;
- (void)setAirplaySourceFlags:(unsigned __int8)a3;
- (void)setAirplaySourceUWBConfigData:(id)a3;
- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3;
- (void)setAirplayTargetFlags:(unsigned __int8)a3;
- (void)setAirplayTargetIPv4:(unsigned int)a3;
- (void)setAirplayTargetPort:(unsigned __int16)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDsActionFlags:(unsigned __int8)a3;
- (void)setDsActionMeasuredPower:(char)a3;
- (void)setDsActionTieBreaker:(unsigned __int8)a3;
- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3;
- (void)setDsInfoVehicleState:(unsigned __int8)a3;
- (void)setEnableEPAForLEAdvertisement:(BOOL)a3;
- (void)setEpaTxPower:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFidoPayloadData:(id)a3;
- (void)setHeySiriConfidence:(unsigned __int8)a3;
- (void)setHeySiriDeviceClass:(unsigned __int16)a3;
- (void)setHeySiriPerceptualHash:(unsigned __int16)a3;
- (void)setHeySiriProductType:(unsigned __int8)a3;
- (void)setHeySiriRandom:(unsigned __int8)a3;
- (void)setHeySiriSNR:(unsigned __int8)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMockDevice:(id)a3;
- (void)setMockID:(id)a3;
- (void)setModel:(unsigned __int8)a3;
- (void)setNearbyActionAuthTagData:(id)a3;
- (void)setNearbyActionColorCode:(unsigned __int8)a3;
- (void)setNearbyActionExtraData:(id)a3;
- (void)setNearbyActionFlags:(unsigned int)a3;
- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3;
- (void)setNearbyActionNoWakeAuthTagData:(id)a3;
- (void)setNearbyActionNoWakeConfigData:(id)a3;
- (void)setNearbyActionNoWakeType:(unsigned __int8)a3;
- (void)setNearbyActionTargetData:(id)a3;
- (void)setNearbyActionType:(unsigned __int8)a3;
- (void)setNearbyActionV2Flags:(unsigned int)a3;
- (void)setNearbyActionV2TargetData:(id)a3;
- (void)setNearbyActionV2Type:(unsigned __int8)a3;
- (void)setNearbyInfoFlags:(unsigned int)a3;
- (void)setNearbyInfoStatusProgress:(double)a3;
- (void)setNearbyInfoStatusTime:(unsigned __int8)a3;
- (void)setNearbyInfoStatusType:(unsigned __int8)a3;
- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3;
- (void)setNearbyInfoV2AuthTagData:(id)a3;
- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3;
- (void)setNearbyInfoV2Flags:(unsigned __int8)a3;
- (void)setNearbyInfoV2InvitationCounter:(unsigned __int8)a3;
- (void)setNearbyInfoV2InvitationRouteType:(unsigned __int8)a3;
- (void)setNearbyInfoV2InvitationTypes:(unsigned __int8)a3;
- (void)setNearbyInfoV2RapportIRKData:(id)a3;
- (void)setNearbyInfoV2TempAuthTagData:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setSafetyAlertsAlertData:(id)a3;
- (void)setSafetyAlertsAlertID:(id)a3;
- (void)setSafetyAlertsAlertIndex:(unsigned __int8)a3;
- (void)setSafetyAlertsSignature:(id)a3;
- (void)setSafetyAlertsVersion:(unsigned __int8)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUseCaseClientIDs:(id)a3;
- (void)setWatchSetupData:(id)a3;
- (void)setXpcListenerEndpoint:(id)a3;
- (void)setnearbyInfoV2InvitationRouteType:(unsigned __int8)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation CBAdvertiser

- (CBAdvertiser)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CBAdvertiser;
  v2 = -[CBAdvertiser init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBAdvertiser;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = self->_mockID;
  v4 = v3;
  if (v3) {
    CBMockRemoveAdvertiser(v3, self);
  }
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBAdvertiser;
  -[CBAdvertiser dealloc](&v6, sel_dealloc);
}

- (CBAdvertiser)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[CBAdvertiser init](self, "init");

  if (!v7)
  {
    if (!a4) {
      goto LABEL_166;
    }
LABEL_162:
    NSErrorF();
    v54 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_158;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (!a4) {
      goto LABEL_166;
    }
    goto LABEL_162;
  }

  int v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_advertiseRate = 0;
  }

  else if (v8 == 5)
  {
    goto LABEL_166;
  }

  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_clientID = 0;
  }

  else if (v9 == 5)
  {
    goto LABEL_166;
  }

  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_internalFlags = 0;
  }

  else if (v10 == 5)
  {
    goto LABEL_166;
  }

  objc_opt_class();
  int v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_useCase = 0;
  }

  else if (v11 == 5)
  {
    goto LABEL_166;
  }

  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6)
  {
    v7->_airdropFlags = 0;
  }

  else if (v12 == 5)
  {
    goto LABEL_166;
  }

  int v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
  {
    v7->_airdropModel = 0;
  }

  else if (v13 == 5)
  {
    goto LABEL_166;
  }

  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_airdropVersion = 0;
  }

  else if (v14 == 5)
  {
    goto LABEL_166;
  }

  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_airdropHash1 = 0;
  }

  else if (v15 == 5)
  {
    goto LABEL_166;
  }

  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_airdropHash2 = 0;
  }

  else if (v16 == 5)
  {
    goto LABEL_166;
  }

  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v7->_airdropHash3 = 0;
  }

  else if (v17 == 5)
  {
    goto LABEL_166;
  }

  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_airdropHash4 = 0;
  }

  else if (v18 == 5)
  {
    goto LABEL_166;
  }

  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_airdropConfigData = 0;
  }

  else if (v19 == 5)
  {
    goto LABEL_166;
  }

  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_airplaySourceFlags = 0;
  }

  else if (v20 == 5)
  {
    goto LABEL_166;
  }

  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_airplayTargetConfigSeed = 0;
  }

  else if (v21 == 5)
  {
    goto LABEL_166;
  }

  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_airplayTargetFlags = 0;
  }

  else if (v22 == 5)
  {
    goto LABEL_166;
  }

  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_airplayTargetIPv4 = 0;
  }

  else if (v23 == 5)
  {
    goto LABEL_166;
  }

  int v24 = CUXPCDecodeUInt64RangedEx();
  if (v24 == 6)
  {
    v7->_airplayTargetPort = 0;
  }

  else if (v24 == 5)
  {
    goto LABEL_166;
  }

  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v7->_dsActionFlags = 0;
  }

  else if (v25 == 5)
  {
    goto LABEL_166;
  }

  int v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v7->_dsActionMeasuredPower = 0;
  }

  else if (v26 == 5)
  {
    goto LABEL_166;
  }

  int v27 = CUXPCDecodeUInt64RangedEx();
  if (v27 == 6)
  {
    v7->_dsActionTieBreaker = 0;
  }

  else if (v27 == 5)
  {
    goto LABEL_166;
  }

  int v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v7->_dsInfoVehicleConfidence = 0;
  }

  else if (v28 == 5)
  {
    goto LABEL_166;
  }

  int v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 == 6)
  {
    v7->_dsInfoVehicleState = 0;
  }

  else if (v29 == 5)
  {
    goto LABEL_166;
  }

  int v30 = CUXPCDecodeUInt64RangedEx();
  if (v30 == 6)
  {
    v7->_heySiriConfidence = 0;
  }

  else if (v30 == 5)
  {
    goto LABEL_166;
  }

  int v31 = CUXPCDecodeUInt64RangedEx();
  if (v31 == 6)
  {
    v7->_heySiriDeviceClass = 0;
  }

  else if (v31 == 5)
  {
    goto LABEL_166;
  }

  int v32 = CUXPCDecodeUInt64RangedEx();
  if (v32 == 6)
  {
    v7->_heySiriPerceptualHash = 0;
  }

  else if (v32 == 5)
  {
    goto LABEL_166;
  }

  int v33 = CUXPCDecodeUInt64RangedEx();
  if (v33 == 6)
  {
    v7->_heySiriProductType = 0;
  }

  else if (v33 == 5)
  {
    goto LABEL_166;
  }

  int v34 = CUXPCDecodeUInt64RangedEx();
  if (v34 == 6)
  {
    v7->_heySiriRandom = 0;
  }

  else if (v34 == 5)
  {
    goto LABEL_166;
  }

  int v35 = CUXPCDecodeUInt64RangedEx();
  if (v35 == 6)
  {
    v7->_heySiriSNR = 0;
  }

  else if (v35 == 5)
  {
    goto LABEL_166;
  }

  int v36 = CUXPCDecodeUInt64RangedEx();
  if (v36 == 6)
  {
    v7->_nearbyActionColorCode = 0;
  }

  else if (v36 == 5)
  {
    goto LABEL_166;
  }

  int v37 = CUXPCDecodeUInt64RangedEx();
  if (v37 == 6)
  {
    v7->_nearbyActionFlags = 0;
  }

  else if (v37 == 5)
  {
    goto LABEL_166;
  }

  int v38 = CUXPCDecodeUInt64RangedEx();
  if (v38 == 6)
  {
    v7->_nearbyActionType = 0;
  }

  else if (v38 == 5)
  {
    goto LABEL_166;
  }

  int v39 = CUXPCDecodeUInt64RangedEx();
  if (v39 == 6)
  {
    v7->_nearbyActionV2Flags = 0;
  }

  else if (v39 == 5)
  {
    goto LABEL_166;
  }

  int v40 = CUXPCDecodeUInt64RangedEx();
  if (v40 == 6)
  {
    v7->_nearbyActionV2Type = 0;
  }

  else if (v40 == 5)
  {
    goto LABEL_166;
  }

  int v41 = CUXPCDecodeUInt64RangedEx();
  if (v41 == 6)
  {
    v7->_nearbyInfoFlags = 0;
  }

  else if (v41 == 5)
  {
    goto LABEL_166;
  }

  int v42 = CUXPCDecodeUInt64RangedEx();
  if (v42 == 6)
  {
    v7->_nearbyInfoStatusTime = 0;
  }

  else if (v42 == 5)
  {
    goto LABEL_166;
  }

  int v43 = CUXPCDecodeUInt64RangedEx();
  if (v43 == 6)
  {
    v7->_nearbyInfoStatusType = 0;
  }

  else if (v43 == 5)
  {
    goto LABEL_166;
  }

  int v44 = CUXPCDecodeUInt64RangedEx();
  if (v44 == 6)
  {
    v7->_nearbyInfoV2DecryptedFlags = 0;
  }

  else if (v44 == 5)
  {
    goto LABEL_166;
  }

  int v45 = CUXPCDecodeUInt64RangedEx();
  if (v45 == 6)
  {
    v7->_nearbyInfoV2Flags = 0;
  }

  else if (v45 == 5)
  {
    goto LABEL_166;
  }

  int v46 = CUXPCDecodeUInt64RangedEx();
  if (v46 == 6)
  {
    v7->_nearbyInfoV2InvitationCounter = 0;
  }

  else if (v46 == 5)
  {
    goto LABEL_166;
  }

  int v47 = CUXPCDecodeUInt64RangedEx();
  if (v47 == 6)
  {
    v7->_nearbyInfoV2InvitationTypes = 0;
  }

  else if (v47 == 5)
  {
    goto LABEL_166;
  }

  int v48 = CUXPCDecodeUInt64RangedEx();
  if (v48 == 6)
  {
    v7->_nearbyInfoV2InvitationRouteType = 0;
  }

  else if (v48 == 5)
  {
    goto LABEL_166;
  }

  v49 = v7->_safetyAlertsAlertData;
  v50 = v49;
  if (v49 && -[NSData length](v49, "length") >= 0x1D)
  {
    if (a4)
    {
      NSErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_166;
  }

  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSDataOfLength())
  {
LABEL_166:
    v54 = 0LL;
    goto LABEL_158;
  }

  int v51 = CUXPCDecodeUInt64RangedEx();
  if (v51 == 6)
  {
    v7->_safetyAlertsVersion = 0;
  }

  else if (v51 == 5)
  {
    goto LABEL_166;
  }

  int v52 = CUXPCDecodeUInt64RangedEx();
  if (v52 == 6)
  {
    v7->_nearbyActionNoWakeType = 0;
  }

  else if (v52 == 5)
  {
    goto LABEL_166;
  }

  int v53 = CUXPCDecodeUInt64RangedEx();
  if (v53 != 6)
  {
    if (v53 != 5) {
      goto LABEL_155;
    }
    goto LABEL_166;
  }

  v7->_nearbyActionNWPrecisionFindingStatus = 0;
LABEL_155:
  v54 = v7;
LABEL_158:

  return v54;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  int64_t advertiseRate = self->_advertiseRate;
  xpc_object_t xdict = v4;
  if ((_DWORD)advertiseRate) {
    xpc_dictionary_set_int64(v4, "advR", advertiseRate);
  }
  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
  uint64_t internalFlags = self->_internalFlags;
  CUXPCEncodeObject();
  uint64_t useCase = self->_useCase;
  if ((_DWORD)useCase) {
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  }
  CUXPCEncodeNSArrayOfNSString();
  if (self->_airdropFlags) {
    xpc_dictionary_set_uint64(xdict, "adFl", self->_airdropFlags);
  }
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  if (airdropTempAuthTagData)
  {
    int v10 = airdropTempAuthTagData;
    id v11 = xdict;
    uint64_t v12 = -[NSData bytes](v10, "bytes");
    if (v12) {
      int v13 = (const char *)v12;
    }
    else {
      int v13 = "";
    }
    size_t v14 = -[NSData length](v10, "length");

    xpc_dictionary_set_data(v11, "adTa", v13, v14);
  }

  if (self->_airdropModel) {
    xpc_dictionary_set_uint64(xdict, "adMl", self->_airdropModel);
  }
  if (self->_airdropVersion) {
    xpc_dictionary_set_uint64(xdict, "adVs", self->_airdropVersion);
  }
  if (self->_airdropHash1) {
    xpc_dictionary_set_uint64(xdict, "adH1", self->_airdropHash1);
  }
  if (self->_airdropHash2) {
    xpc_dictionary_set_uint64(xdict, "adH2", self->_airdropHash2);
  }
  if (self->_airdropHash3) {
    xpc_dictionary_set_uint64(xdict, "adH3", self->_airdropHash3);
  }
  if (self->_airdropHash4) {
    xpc_dictionary_set_uint64(xdict, "adH4", self->_airdropHash4);
  }
  if (self->_airdropConfigData) {
    xpc_dictionary_set_uint64(xdict, "adCd", self->_airdropConfigData);
  }
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  if (airplaySourceAuthTagData)
  {
    int v16 = airplaySourceAuthTagData;
    id v17 = xdict;
    uint64_t v18 = -[NSData bytes](v16, "bytes");
    if (v18) {
      int v19 = (const char *)v18;
    }
    else {
      int v19 = "";
    }
    size_t v20 = -[NSData length](v16, "length");

    xpc_dictionary_set_data(v17, "apAT", v19, v20);
  }

  if (self->_airplaySourceFlags) {
    xpc_dictionary_set_uint64(xdict, "apSF", self->_airplaySourceFlags);
  }
  airplaySourceUWBConfigData = self->_airplaySourceUWBConfigData;
  if (airplaySourceUWBConfigData)
  {
    int v22 = airplaySourceUWBConfigData;
    id v23 = xdict;
    uint64_t v24 = -[NSData bytes](v22, "bytes");
    if (v24) {
      int v25 = (const char *)v24;
    }
    else {
      int v25 = "";
    }
    size_t v26 = -[NSData length](v22, "length");

    xpc_dictionary_set_data(v23, "apUW", v25, v26);
  }

  if (self->_airplayTargetConfigSeed) {
    xpc_dictionary_set_uint64(xdict, "apTC", self->_airplayTargetConfigSeed);
  }
  if (self->_airplayTargetFlags) {
    xpc_dictionary_set_uint64(xdict, "apTF", self->_airplayTargetFlags);
  }
  airplayTargetIPid v4 = self->_airplayTargetIPv4;
  if ((_DWORD)airplayTargetIPv4) {
    xpc_dictionary_set_uint64(xdict, "apTI", airplayTargetIPv4);
  }
  if (self->_airplayTargetPort) {
    xpc_dictionary_set_uint64(xdict, "apTP", self->_airplayTargetPort);
  }
  if (self->_dsActionFlags) {
    xpc_dictionary_set_uint64(xdict, "dsAF", self->_dsActionFlags);
  }
  if (self->_dsActionMeasuredPower) {
    xpc_dictionary_set_int64(xdict, "dsAP", self->_dsActionMeasuredPower);
  }
  if (self->_dsActionTieBreaker) {
    xpc_dictionary_set_uint64(xdict, "dsAT", self->_dsActionTieBreaker);
  }
  if (self->_dsInfoVehicleConfidence) {
    xpc_dictionary_set_uint64(xdict, "dsVC", self->_dsInfoVehicleConfidence);
  }
  if (self->_dsInfoVehicleState) {
    xpc_dictionary_set_uint64(xdict, "dsVS", self->_dsInfoVehicleState);
  }
  if (self->_enableEPAForLEAdvertisement) {
    xpc_dictionary_set_BOOL(xdict, "naEE", 1);
  }
  fidoPayloadData = self->_fidoPayloadData;
  if (fidoPayloadData)
  {
    int v29 = fidoPayloadData;
    id v30 = xdict;
    uint64_t v31 = -[NSData bytes](v29, "bytes");
    if (v31) {
      int v32 = (const char *)v31;
    }
    else {
      int v32 = "";
    }
    size_t v33 = -[NSData length](v29, "length");

    xpc_dictionary_set_data(v30, "fdPD", v32, v33);
  }

  if (self->_heySiriConfidence) {
    xpc_dictionary_set_uint64(xdict, "hsCf", self->_heySiriConfidence);
  }
  if (self->_heySiriDeviceClass) {
    xpc_dictionary_set_uint64(xdict, "hsDC", self->_heySiriDeviceClass);
  }
  if (self->_heySiriPerceptualHash) {
    xpc_dictionary_set_uint64(xdict, "hsPH", self->_heySiriPerceptualHash);
  }
  if (self->_heySiriProductType) {
    xpc_dictionary_set_uint64(xdict, "hsPT", self->_heySiriProductType);
  }
  if (self->_heySiriRandom) {
    xpc_dictionary_set_uint64(xdict, "hsRn", self->_heySiriRandom);
  }
  if (self->_heySiriSNR) {
    xpc_dictionary_set_uint64(xdict, "hsSN", self->_heySiriSNR);
  }
  nearbyActionAuthTagData = self->_nearbyActionAuthTagData;
  if (nearbyActionAuthTagData)
  {
    int v35 = nearbyActionAuthTagData;
    id v36 = xdict;
    uint64_t v37 = -[NSData bytes](v35, "bytes");
    if (v37) {
      int v38 = (const char *)v37;
    }
    else {
      int v38 = "";
    }
    size_t v39 = -[NSData length](v35, "length");

    xpc_dictionary_set_data(v36, "nbAT", v38, v39);
  }

  if (self->_nearbyActionColorCode) {
    xpc_dictionary_set_uint64(xdict, "naCC", self->_nearbyActionColorCode);
  }
  nearbyActionExtraData = self->_nearbyActionExtraData;
  if (nearbyActionExtraData)
  {
    int v41 = nearbyActionExtraData;
    id v42 = xdict;
    uint64_t v43 = -[NSData bytes](v41, "bytes");
    if (v43) {
      int v44 = (const char *)v43;
    }
    else {
      int v44 = "";
    }
    size_t v45 = -[NSData length](v41, "length");

    xpc_dictionary_set_data(v42, "naED", v44, v45);
  }

  uint64_t nearbyActionFlags = self->_nearbyActionFlags;
  if ((_DWORD)nearbyActionFlags) {
    xpc_dictionary_set_uint64(xdict, "nbAF", nearbyActionFlags);
  }
  nearbyActionTargetData = self->_nearbyActionTargetData;
  if (nearbyActionTargetData)
  {
    int v48 = nearbyActionTargetData;
    id v49 = xdict;
    uint64_t v50 = -[NSData bytes](v48, "bytes");
    if (v50) {
      int v51 = (const char *)v50;
    }
    else {
      int v51 = "";
    }
    size_t v52 = -[NSData length](v48, "length");

    xpc_dictionary_set_data(v49, "nbTg", v51, v52);
  }

  if (self->_nearbyActionType) {
    xpc_dictionary_set_uint64(xdict, "nbAc", self->_nearbyActionType);
  }
  uint64_t nearbyActionV2Flags = self->_nearbyActionV2Flags;
  if ((_DWORD)nearbyActionV2Flags) {
    xpc_dictionary_set_uint64(xdict, "n2AF", nearbyActionV2Flags);
  }
  nearbyActionV2TargetData = self->_nearbyActionV2TargetData;
  if (nearbyActionV2TargetData)
  {
    v55 = nearbyActionV2TargetData;
    id v56 = xdict;
    uint64_t v57 = -[NSData bytes](v55, "bytes");
    if (v57) {
      v58 = (const char *)v57;
    }
    else {
      v58 = "";
    }
    size_t v59 = -[NSData length](v55, "length");

    xpc_dictionary_set_data(v56, "n2Tg", v58, v59);
  }

  if (self->_nearbyActionV2Type) {
    xpc_dictionary_set_uint64(xdict, "n2Ac", self->_nearbyActionV2Type);
  }
  uint64_t nearbyInfoFlags = self->_nearbyInfoFlags;
  if ((_DWORD)nearbyInfoFlags) {
    xpc_dictionary_set_uint64(xdict, "nbIF", nearbyInfoFlags);
  }
  double nearbyInfoStatusProgress = self->_nearbyInfoStatusProgress;
  if (nearbyInfoStatusProgress != 0.0) {
    xpc_dictionary_set_double(xdict, "nsPr", nearbyInfoStatusProgress);
  }
  if (self->_nearbyInfoStatusTime) {
    xpc_dictionary_set_uint64(xdict, "nsTi", self->_nearbyInfoStatusTime);
  }
  if (self->_nearbyInfoStatusType) {
    xpc_dictionary_set_uint64(xdict, "nsTy", self->_nearbyInfoStatusType);
  }
  if (self->_nearbyInfoV2DecryptedFlags) {
    xpc_dictionary_set_uint64(xdict, "nb2Fe", self->_nearbyInfoV2DecryptedFlags);
  }
  if (self->_nearbyInfoV2Flags) {
    xpc_dictionary_set_uint64(xdict, "nb2F", self->_nearbyInfoV2Flags);
  }
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  if (nearbyInfoV2AuthTagData)
  {
    v63 = nearbyInfoV2AuthTagData;
    id v64 = xdict;
    uint64_t v65 = -[NSData bytes](v63, "bytes");
    if (v65) {
      v66 = (const char *)v65;
    }
    else {
      v66 = "";
    }
    size_t v67 = -[NSData length](v63, "length");

    xpc_dictionary_set_data(v64, "nb2A", v66, v67);
  }

  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  if (nearbyInfoV2AuthIntegrityTagData)
  {
    v69 = nearbyInfoV2AuthIntegrityTagData;
    id v70 = xdict;
    uint64_t v71 = -[NSData bytes](v69, "bytes");
    if (v71) {
      v72 = (const char *)v71;
    }
    else {
      v72 = "";
    }
    size_t v73 = -[NSData length](v69, "length");

    xpc_dictionary_set_data(v70, "nb2Ai", v72, v73);
  }

  if (self->_nearbyInfoV2InvitationCounter) {
    xpc_dictionary_set_uint64(xdict, "nb2Ic", self->_nearbyInfoV2InvitationCounter);
  }
  if (self->_nearbyInfoV2InvitationTypes) {
    xpc_dictionary_set_uint64(xdict, "nb2It", self->_nearbyInfoV2InvitationTypes);
  }
  if (self->_nearbyInfoV2InvitationRouteType) {
    xpc_dictionary_set_uint64(xdict, "nb2Ir", self->_nearbyInfoV2InvitationRouteType);
  }
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  if (safetyAlertsAlertData)
  {
    v75 = safetyAlertsAlertData;
    id v76 = xdict;
    uint64_t v77 = -[NSData bytes](v75, "bytes");
    if (v77) {
      v78 = (const char *)v77;
    }
    else {
      v78 = "";
    }
    size_t v79 = -[NSData length](v75, "length");

    xpc_dictionary_set_data(v76, "saAd", v78, v79);
  }

  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  if (safetyAlertsAlertID)
  {
    v81 = safetyAlertsAlertID;
    id v82 = xdict;
    uint64_t v83 = -[NSData bytes](v81, "bytes");
    if (v83) {
      v84 = (const char *)v83;
    }
    else {
      v84 = "";
    }
    size_t v85 = -[NSData length](v81, "length");

    xpc_dictionary_set_data(v82, "saAi", v84, v85);
  }

  safetyAlertsSignature = self->_safetyAlertsSignature;
  if (safetyAlertsSignature)
  {
    v87 = safetyAlertsSignature;
    id v88 = xdict;
    uint64_t v89 = -[NSData bytes](v87, "bytes");
    if (v89) {
      v90 = (const char *)v89;
    }
    else {
      v90 = "";
    }
    size_t v91 = -[NSData length](v87, "length");

    xpc_dictionary_set_data(v88, "saSg", v90, v91);
  }

  if (self->_safetyAlertsVersion) {
    xpc_dictionary_set_uint64(xdict, "saVs", self->_safetyAlertsVersion);
  }
  watchSetupData = self->_watchSetupData;
  if (watchSetupData)
  {
    v93 = watchSetupData;
    id v94 = xdict;
    uint64_t v95 = -[NSData bytes](v93, "bytes");
    if (v95) {
      v96 = (const char *)v95;
    }
    else {
      v96 = "";
    }
    size_t v97 = -[NSData length](v93, "length");

    xpc_dictionary_set_data(v94, "wsDa", v96, v97);
  }

  if (self->_nearbyActionNoWakeType) {
    xpc_dictionary_set_uint64(xdict, "nawT", self->_nearbyActionNoWakeType);
  }
  if (self->_nearbyActionNWPrecisionFindingStatus) {
    xpc_dictionary_set_uint64(xdict, "nawS", self->_nearbyActionNWPrecisionFindingStatus);
  }
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  if (nearbyActionNoWakeAuthTagData)
  {
    v99 = nearbyActionNoWakeAuthTagData;
    id v100 = xdict;
    uint64_t v101 = -[NSData bytes](v99, "bytes");
    if (v101) {
      v102 = (const char *)v101;
    }
    else {
      v102 = "";
    }
    size_t v103 = -[NSData length](v99, "length");

    xpc_dictionary_set_data(v100, "nawA", v102, v103);
  }

  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  if (nearbyActionNoWakeConfigData)
  {
    v105 = nearbyActionNoWakeConfigData;
    id v106 = xdict;
    uint64_t v107 = -[NSData bytes](v105, "bytes");
    if (v107) {
      v108 = (const char *)v107;
    }
    else {
      v108 = "";
    }
    size_t v109 = -[NSData length](v105, "length");

    xpc_dictionary_set_data(v106, "nawC", v108, v109);
  }
}

- (id)description
{
  return -[CBAdvertiser descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t clientID = self->_clientID;
  NSAppendPrintF_safe();
  id v4 = 0LL;
  objc_super v5 = v4;
  if (self->_direct)
  {
    v121 = v4;
    NSAppendPrintF_safe();
    id v6 = v121;

    objc_super v5 = v6;
  }

  int advertiseRate = self->_advertiseRate;
  if (advertiseRate)
  {
    int v8 = advertiseRate - 10;
    int v9 = "2 seconds";
    switch(v8)
    {
      case 0:
        break;
      case 5:
        int v9 = "1022.5 ms";
        break;
      case 10:
        int v9 = "350 ms";
        break;
      case 30:
        int v9 = "181.25 ms";
        break;
      case 32:
        int v9 = "120 ms";
        break;
      case 35:
        int v9 = "60 ms";
        break;
      case 40:
        int v9 = "30 ms";
        break;
      case 50:
        int v9 = "20 ms";
        break;
      default:
        int v9 = "270 ms";
        break;
    }

    uint64_t clientID = (uint64_t)v9;
    NSAppendPrintF_safe();
    id v10 = v5;

    objc_super v5 = v10;
  }

  id v11 = self->_advertisingAddressDataConnectable;
  if (v11)
  {
    uint64_t clientID = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v12 = v5;

    objc_super v5 = v12;
  }

  int v13 = self->_advertisingAddressDataNonConnectable;
  if (v13)
  {
    uint64_t clientID = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v14 = v5;

    objc_super v5 = v14;
  }

  int v15 = self->_advertisingAddressDataNonConnectableSecondary;
  if (v15)
  {
    uint64_t clientID = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v16 = v5;

    objc_super v5 = v16;
  }

  id v17 = self->_remoteDevice;
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t clientID = (uint64_t)v17;
    NSAppendPrintF_safe();
    id v19 = v5;

    objc_super v5 = v19;
  }

  unsigned int useCase = self->_useCase;
  if (useCase)
  {
    uint64_t clientID = (uint64_t)CBUseCaseToString(useCase);
    NSAppendPrintF_safe();
    id v21 = v5;

    objc_super v5 = v21;
  }

  int v22 = self->_useCaseClientIDs;
  if (v22)
  {
    uint64_t clientID = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v23 = v5;

    objc_super v5 = v23;
  }

  if (self->_airdropFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v24 = v5;

    objc_super v5 = v24;
  }

  int v25 = self->_airdropTempAuthTagData;
  if (v25)
  {
    uint64_t clientID = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v26 = v5;

    objc_super v5 = v26;
  }

  if (self->_airdropModel)
  {
    uint64_t clientID = self->_airdropModel;
    NSAppendPrintF_safe();
    id v27 = v5;

    objc_super v5 = v27;
  }

  if (self->_airdropVersion)
  {
    uint64_t clientID = self->_airdropVersion;
    NSAppendPrintF_safe();
    id v28 = v5;

    objc_super v5 = v28;
  }

  if (self->_airdropHash1)
  {
    uint64_t clientID = self->_airdropHash1;
    NSAppendPrintF_safe();
    id v29 = v5;

    objc_super v5 = v29;
  }

  if (self->_airdropHash2)
  {
    uint64_t clientID = self->_airdropHash2;
    NSAppendPrintF_safe();
    id v30 = v5;

    objc_super v5 = v30;
  }

  if (self->_airdropHash3)
  {
    uint64_t clientID = self->_airdropHash3;
    NSAppendPrintF_safe();
    id v31 = v5;

    objc_super v5 = v31;
  }

  if (self->_airdropHash4)
  {
    uint64_t clientID = self->_airdropHash4;
    NSAppendPrintF_safe();
    id v32 = v5;

    objc_super v5 = v32;
  }

  if (self->_airdropConfigData)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v33 = v5;

    objc_super v5 = v33;
  }

  int v34 = self->_airplaySourceAuthTagData;
  if (v34)
  {
    uint64_t clientID = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v35 = v5;

    objc_super v5 = v35;
  }

  if (self->_airplaySourceFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v36 = v5;

    objc_super v5 = v36;
  }

  uint64_t v37 = self->_airplaySourceUWBConfigData;
  if (v37)
  {
    uint64_t clientID = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v38 = v5;

    objc_super v5 = v38;
  }

  if (self->_airplayTargetConfigSeed)
  {
    uint64_t clientID = self->_airplayTargetConfigSeed;
    NSAppendPrintF_safe();
    id v39 = v5;

    objc_super v5 = v39;
  }

  if (self->_airplayTargetFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v40 = v5;

    objc_super v5 = v40;
  }

  if (self->_airplayTargetIPv4)
  {
    uint64_t clientID = CUPrintAddress();
    NSAppendPrintF_safe();
    id v41 = v5;

    objc_super v5 = v41;
  }

  if (self->_airplayTargetPort)
  {
    uint64_t clientID = self->_airplayTargetPort;
    NSAppendPrintF_safe();
    id v42 = v5;

    objc_super v5 = v42;
  }

  if (self->_dsActionFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v43 = v5;

    objc_super v5 = v43;
  }

  if (self->_dsActionMeasuredPower)
  {
    uint64_t clientID = self->_dsActionMeasuredPower;
    NSAppendPrintF_safe();
    id v44 = v5;

    objc_super v5 = v44;
  }

  if (self->_dsActionTieBreaker)
  {
    uint64_t clientID = self->_dsActionTieBreaker;
    NSAppendPrintF_safe();
    id v45 = v5;

    objc_super v5 = v45;
  }

  if (self->_dsInfoVehicleConfidence)
  {
    -[CBAdvertiser dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence", clientID);
    NSAppendPrintF_safe();
    id v46 = v5;

    objc_super v5 = v46;
  }

  if (self->_dsInfoVehicleState)
  {
    -[CBAdvertiser dsInfoVehicleState](self, "dsInfoVehicleState");
    NSAppendPrintF_safe();
    id v47 = v5;

    objc_super v5 = v47;
  }

  if (self->_enableEPAForLEAdvertisement)
  {
    NSAppendPrintF_safe();
    id v48 = v5;

    objc_super v5 = v48;
  }

  id v49 = self->_fidoPayloadData;
  if (v49)
  {
    CUPrintNSDataHex();
    uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v50 = v5;

    objc_super v5 = v50;
  }

  if (self->_heySiriConfidence)
  {
    NSAppendPrintF_safe();
    id v51 = v5;

    objc_super v5 = v51;
  }

  if (self->_heySiriDeviceClass)
  {
    NSAppendPrintF_safe();
    id v52 = v5;

    objc_super v5 = v52;
  }

  if (self->_heySiriPerceptualHash)
  {
    NSAppendPrintF_safe();
    id v53 = v5;

    objc_super v5 = v53;
  }

  if (self->_heySiriProductType)
  {
    NSAppendPrintF_safe();
    id v54 = v5;

    objc_super v5 = v54;
  }

  if (self->_heySiriRandom)
  {
    NSAppendPrintF_safe();
    id v55 = v5;

    objc_super v5 = v55;
  }

  if (self->_heySiriSNR)
  {
    NSAppendPrintF_safe();
    id v56 = v5;

    objc_super v5 = v56;
  }

  uint64_t v57 = self->_nearbyActionAuthTagData;
  if (v57)
  {
    CUPrintNSDataHex();
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v58 = v5;

    objc_super v5 = v58;
  }

  if (self->_nearbyActionColorCode)
  {
    NSAppendPrintF_safe();
    id v59 = v5;

    objc_super v5 = v59;
  }

  v60 = self->_nearbyActionExtraData;
  if (v60)
  {
    CUPrintNSDataHex();
    size_t v103 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v61 = v5;

    objc_super v5 = v61;
  }

  if (self->_nearbyActionFlags)
  {
    CUPrintFlags32();
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v62 = v5;

    objc_super v5 = v62;
  }

  if (self->_nearbyActionType)
  {
    NSAppendPrintF_safe();
    id v63 = v5;

    objc_super v5 = v63;
  }

  id v64 = self->_nearbyActionTargetData;
  if (v64)
  {
    CUPrintNSDataHex();
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v65 = v5;

    objc_super v5 = v65;
  }

  if (self->_nearbyActionV2Flags)
  {
    CUPrintFlags32();
    id v106 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v66 = v5;

    objc_super v5 = v66;
  }

  size_t v67 = self->_nearbyActionV2TargetData;
  if (v67)
  {
    CUPrintNSDataHex();
    uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v68 = v5;

    objc_super v5 = v68;
  }

  if (self->_nearbyActionV2Type)
  {
    NSAppendPrintF_safe();
    id v69 = v5;

    objc_super v5 = v69;
  }

  if (self->_nearbyInfoFlags)
  {
    CUPrintFlags32();
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v70 = v5;

    objc_super v5 = v70;
  }

  if (self->_nearbyInfoStatusProgress != 0.0)
  {
    NSAppendPrintF_safe();
    id v71 = v5;

    objc_super v5 = v71;
  }

  if (self->_nearbyInfoStatusTime)
  {
    NSAppendPrintF_safe();
    id v72 = v5;

    objc_super v5 = v72;
  }

  if (self->_nearbyInfoStatusType)
  {
    NSAppendPrintF_safe();
    id v73 = v5;

    objc_super v5 = v73;
  }

  if (self->_nearbyInfoV2Flags)
  {
    CUPrintFlags32();
    size_t v109 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v74 = v5;

    objc_super v5 = v74;
  }

  if (self->_nearbyInfoV2DecryptedFlags)
  {
    CUPrintFlags32();
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v75 = v5;

    objc_super v5 = v75;
  }

  id v76 = self->_nearbyInfoV2AuthTagData;
  if (v76)
  {
    CUPrintNSDataHex();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v77 = v5;

    objc_super v5 = v77;
  }

  v78 = self->_nearbyInfoV2AuthIntegrityTagData;
  if (v78)
  {
    CUPrintNSDataHex();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v79 = v5;

    objc_super v5 = v79;
  }

  if (self->_nearbyInfoV2InvitationCounter)
  {
    NSAppendPrintF_safe();
    id v80 = v5;

    objc_super v5 = v80;
  }

  if (self->_nearbyInfoV2InvitationTypes)
  {
    CUPrintFlags32();
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v81 = v5;

    objc_super v5 = v81;
  }

  if (self->_nearbyInfoV2InvitationRouteType)
  {
    NSAppendPrintF_safe();
    id v82 = v5;

    objc_super v5 = v82;
  }

  if (self->_nearbyActionNoWakeType)
  {
    NSAppendPrintF_safe();
    id v83 = v5;

    objc_super v5 = v83;
  }

  v84 = self->_safetyAlertsAlertData;
  if (v84)
  {
    CUPrintNSDataHex();
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v85 = v5;

    objc_super v5 = v85;
  }

  v86 = self->_safetyAlertsAlertID;
  if (v86)
  {
    CUPrintNSDataHex();
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v87 = v5;

    objc_super v5 = v87;
  }

  id v88 = self->_safetyAlertsSignature;
  if (v88)
  {
    CUPrintNSDataHex();
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v89 = v5;

    objc_super v5 = v89;
  }

  if (self->_safetyAlertsVersion)
  {
    NSAppendPrintF_safe();
    id v90 = v5;

    objc_super v5 = v90;
  }

  size_t v91 = self->_watchSetupData;
  if (v91)
  {
    CUPrintNSDataHex();
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v92 = v5;

    objc_super v5 = v92;
  }

  if (self->_nearbyActionNWPrecisionFindingStatus)
  {
    CUPrintFlags32();
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v93 = v5;

    objc_super v5 = v93;
  }

  id v94 = self->_nearbyActionNoWakeAuthTagData;
  if (v94)
  {
    CUPrintNSDataHex();
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v95 = v5;

    objc_super v5 = v95;
  }

  v96 = self->_nearbyActionNoWakeConfigData;
  if (v96)
  {
    CUPrintNSDataHex();
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v97 = v5;

    objc_super v5 = v97;
  }

  id v98 = v5;
  return v98;
}

- (void)setAirdropVersion:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __34__CBAdvertiser_setAirdropVersion___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __34__CBAdvertiser_setAirdropVersion___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 50);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 50) = v1;
  }
  return v1 != v3;
}

- (void)setAirdropFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__CBAdvertiser_setAirdropFlags___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdropFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 48);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 48) = v1;
  }
  return v1 != v3;
}

- (void)setAirdropTempAuthTagData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __42__CBAdvertiser_setAirdropTempAuthTagData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __42__CBAdvertiser_setAirdropTempAuthTagData___block_invoke(uint64_t a1)
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

    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 264);
    *(void *)(v10 + 264) = v11;
  }

  return v5;
}

- (void)setModel:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __25__CBAdvertiser_setModel___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __25__CBAdvertiser_setModel___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 49);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 49) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash1:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__CBAdvertiser_setAirdrophash1___block_invoke;
  v3[3] = &unk_189FB1DD8;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash1___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 80);
  if (v1 != v3) {
    *(_WORD *)(v2 + 80) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash2:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__CBAdvertiser_setAirdrophash2___block_invoke;
  v3[3] = &unk_189FB1DD8;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash2___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 82);
  if (v1 != v3) {
    *(_WORD *)(v2 + 82) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash3:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__CBAdvertiser_setAirdrophash3___block_invoke;
  v3[3] = &unk_189FB1DD8;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash3___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 84);
  if (v1 != v3) {
    *(_WORD *)(v2 + 84) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash4:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__CBAdvertiser_setAirdrophash4___block_invoke;
  v3[3] = &unk_189FB1DD8;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash4___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 86);
  if (v1 != v3) {
    *(_WORD *)(v2 + 86) = v1;
  }
  return v1 != v3;
}

- (void)setAirdropConfigData:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __37__CBAdvertiser_setAirdropConfigData___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setAirdropConfigData___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 51);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 51) = v1;
  }
  return v1 != v3;
}

- (void)setAirplaySourceFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__CBAdvertiser_setAirplaySourceFlags___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setAirplaySourceFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 52);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 52) = v1;
  }
  return v1 != v3;
}

- (void)setAirplaySourceUWBConfigData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __46__CBAdvertiser_setAirplaySourceUWBConfigData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __46__CBAdvertiser_setAirplaySourceUWBConfigData___block_invoke(uint64_t a1)
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

    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 272);
    *(void *)(v10 + 272) = v11;
  }

  return v5;
}

- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43__CBAdvertiser_setAirplayTargetConfigSeed___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __43__CBAdvertiser_setAirplayTargetConfigSeed___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 53);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 53) = v1;
  }
  return v1 != v3;
}

- (void)setAirplayTargetFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__CBAdvertiser_setAirplayTargetFlags___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setAirplayTargetFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 54);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 54) = v1;
  }
  return v1 != v3;
}

- (void)setAirplayTargetIPv4:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __37__CBAdvertiser_setAirplayTargetIPv4___block_invoke;
  v3[3] = &unk_189FB1E00;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setAirplayTargetIPv4___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 104);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 104) = v1;
  }
  return v1 != v3;
}

- (void)setAirplayTargetPort:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __37__CBAdvertiser_setAirplayTargetPort___block_invoke;
  v3[3] = &unk_189FB1DD8;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setAirplayTargetPort___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 88);
  if (v1 != v3) {
    *(_WORD *)(v2 + 88) = v1;
  }
  return v1 != v3;
}

- (void)setDsActionFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__CBAdvertiser_setDsActionFlags___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __33__CBAdvertiser_setDsActionFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 55);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 55) = v1;
  }
  return v1 != v3;
}

- (void)setDsActionMeasuredPower:(char)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__CBAdvertiser_setDsActionMeasuredPower___block_invoke;
  v3[3] = &unk_189FB1D88;
  char v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __41__CBAdvertiser_setDsActionMeasuredPower___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 56);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 56) = v1;
  }
  return v1 != v3;
}

- (void)setDsActionTieBreaker:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__CBAdvertiser_setDsActionTieBreaker___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setDsActionTieBreaker___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 57);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 57) = v1;
  }
  return v1 != v3;
}

- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43__CBAdvertiser_setDsInfoVehicleConfidence___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __43__CBAdvertiser_setDsInfoVehicleConfidence___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 58);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 58) = v1;
  }
  return v1 != v3;
}

- (void)setDsInfoVehicleState:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__CBAdvertiser_setDsInfoVehicleState___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setDsInfoVehicleState___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 59);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 59) = v1;
  }
  return v1 != v3;
}

- (void)setFidoPayloadData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __35__CBAdvertiser_setFidoPayloadData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __35__CBAdvertiser_setFidoPayloadData___block_invoke(uint64_t a1)
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

    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 280);
    *(void *)(v10 + 280) = v11;
  }

  return v5;
}

- (void)setHeySiriConfidence:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __37__CBAdvertiser_setHeySiriConfidence___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setHeySiriConfidence___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 61);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 61) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriDeviceClass:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__CBAdvertiser_setHeySiriDeviceClass___block_invoke;
  v3[3] = &unk_189FB1DD8;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setHeySiriDeviceClass___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 90);
  if (v1 != v3) {
    *(_WORD *)(v2 + 90) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriPerceptualHash:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__CBAdvertiser_setHeySiriPerceptualHash___block_invoke;
  v3[3] = &unk_189FB1DD8;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __41__CBAdvertiser_setHeySiriPerceptualHash___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 92);
  if (v1 != v3) {
    *(_WORD *)(v2 + 92) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriProductType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__CBAdvertiser_setHeySiriProductType___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setHeySiriProductType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 62);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 62) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriRandom:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__CBAdvertiser_setHeySiriRandom___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __33__CBAdvertiser_setHeySiriRandom___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 63);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 63) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriSNR:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __30__CBAdvertiser_setHeySiriSNR___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __30__CBAdvertiser_setHeySiriSNR___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 64);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 64) = v1;
  }
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setNearbyActionColorCode:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__CBAdvertiser_setNearbyActionColorCode___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __41__CBAdvertiser_setNearbyActionColorCode___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 65);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 65) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyActionExtraData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__CBAdvertiser_setNearbyActionExtraData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __41__CBAdvertiser_setNearbyActionExtraData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 296LL);
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

    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 296);
    *(void *)(v10 + 296) = v11;
  }

  return v5;
}

- (void)setNearbyInfoFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35__CBAdvertiser_setNearbyInfoFlags___block_invoke;
  v3[3] = &unk_189FB1E00;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __35__CBAdvertiser_setNearbyInfoFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 116);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 116) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoStatusProgress:(double)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __44__CBAdvertiser_setNearbyInfoStatusProgress___block_invoke;
  v3[3] = &unk_189FB1E28;
  *(double *)&void v3[5] = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __44__CBAdvertiser_setNearbyInfoStatusProgress___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 320);
  if (v1 != v3) {
    *(double *)(v2 + 320) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoStatusTime:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __40__CBAdvertiser_setNearbyInfoStatusTime___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __40__CBAdvertiser_setNearbyInfoStatusTime___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 68);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 68) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoStatusType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __40__CBAdvertiser_setNearbyInfoStatusType___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __40__CBAdvertiser_setNearbyInfoStatusType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 69);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 69) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __46__CBAdvertiser_setNearbyInfoV2DecryptedFlags___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __46__CBAdvertiser_setNearbyInfoV2DecryptedFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 71);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 71) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2Flags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __37__CBAdvertiser_setNearbyInfoV2Flags___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setNearbyInfoV2Flags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 70);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 70) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2InvitationCounter:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __49__CBAdvertiser_setNearbyInfoV2InvitationCounter___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __49__CBAdvertiser_setNearbyInfoV2InvitationCounter___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 72);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 72) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2InvitationTypes:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __47__CBAdvertiser_setNearbyInfoV2InvitationTypes___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __47__CBAdvertiser_setNearbyInfoV2InvitationTypes___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 73);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 73) = v1;
  }
  return v1 != v3;
}

- (void)setnearbyInfoV2InvitationRouteType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __51__CBAdvertiser_setnearbyInfoV2InvitationRouteType___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __51__CBAdvertiser_setnearbyInfoV2InvitationRouteType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 74);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 74) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyActionTargetData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __42__CBAdvertiser_setNearbyActionTargetData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __42__CBAdvertiser_setNearbyActionTargetData___block_invoke(uint64_t a1)
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

    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 304);
    *(void *)(v10 + 304) = v11;
  }

  return v5;
}

- (void)setNearbyActionNoWakeType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __42__CBAdvertiser_setNearbyActionNoWakeType___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __42__CBAdvertiser_setNearbyActionNoWakeType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 75);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 75) = v1;
  }
  return v1 != v3;
}

- (void)setSafetyAlertsAlertData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__CBAdvertiser_setSafetyAlertsAlertData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __41__CBAdvertiser_setSafetyAlertsAlertData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 352LL);
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

    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 352);
    *(void *)(v10 + 352) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsAlertID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[v4 copy];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __39__CBAdvertiser_setSafetyAlertsAlertID___block_invoke;
  v8[3] = &unk_189FB1E50;
  id v9 = v5;
  uint64_t v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v8);
}

BOOL __39__CBAdvertiser_setSafetyAlertsAlertID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 360LL);
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

    uint64_t v10 = a1 + 40;
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = *(id *)(v10 + 8);
    id v3 = *(id *)(v9 + 360);
    *(void *)(v9 + 360) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsSignature:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__CBAdvertiser_setSafetyAlertsSignature___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __41__CBAdvertiser_setSafetyAlertsSignature___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 368LL);
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

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 368);
    *(void *)(v10 + 368) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsVersion:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __39__CBAdvertiser_setSafetyAlertsVersion___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __39__CBAdvertiser_setSafetyAlertsVersion___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 78);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 78) = v1;
  }
  return v1 != v3;
}

- (void)setUseCase:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __27__CBAdvertiser_setUseCase___block_invoke;
  v3[3] = &unk_189FB1E00;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __27__CBAdvertiser_setUseCase___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 96);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 96) = v1;
  }
  return v1 != v3;
}

- (void)setUseCaseClientIDs:(id)a3
{
  unsigned int v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__CBAdvertiser_setUseCaseClientIDs___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __36__CBAdvertiser_setUseCaseClientIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 240LL);
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

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 240);
    *(void *)(v10 + 240) = v11;
  }

  return v5;
}

- (void)setWatchSetupData:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__CBAdvertiser_setWatchSetupData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __34__CBAdvertiser_setWatchSetupData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 376LL);
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

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 376);
    *(void *)(v10 + 376) = v11;
  }

  return v5;
}

- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __56__CBAdvertiser_setNearbyActionNWPrecisionFindingStatus___block_invoke;
  v3[3] = &unk_189FB1D88;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __56__CBAdvertiser_setNearbyActionNWPrecisionFindingStatus___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 76);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 76) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyActionNoWakeAuthTagData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __49__CBAdvertiser_setNearbyActionNoWakeAuthTagData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __49__CBAdvertiser_setNearbyActionNoWakeAuthTagData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 336LL);
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

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 336);
    *(void *)(v10 + 336) = v11;
  }

  return v5;
}

- (void)setNearbyActionNoWakeConfigData:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __48__CBAdvertiser_setNearbyActionNoWakeConfigData___block_invoke;
  v6[3] = &unk_189FB1DB0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __48__CBAdvertiser_setNearbyActionNoWakeConfigData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 344LL);
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

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 344);
    *(void *)(v10 + 344) = v11;
  }

  return v5;
}

- (void)setEpaTxPower:(BOOL)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __30__CBAdvertiser_setEpaTxPower___block_invoke;
  v3[3] = &unk_189FB1D88;
  BOOL v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __30__CBAdvertiser_setEpaTxPower___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 60);
  if (v1 != v3) {
    *(_BYTE *)(v2 + 60) = v1;
  }
  return v1 != v3;
}

- (BOOL)needsIdentify
{
  return (self->_nearbyInfoV2Flags & 4) != 0 || (self->_nearbyInfoV2DecryptedFlags & 7) != 0;
}

- (BOOL)updateWithCBAdvertiser:(id)a3
{
  id v4 = a3;
  int v5 = [v4 advertiseRate];
  int advertiseRate = self->_advertiseRate;
  BOOL v7 = v5 != advertiseRate;
  if (v5 == advertiseRate)
  {
    id v10 = 0LL;
    unsigned int v11 = [v4 useCase];
    unsigned int useCase = self->_useCase;
    if (v11 != useCase)
    {
LABEL_27:
      v343 = CBUseCaseToString(useCase);
      v398 = CBUseCaseToString(v11);
      CUAppendF();
      id v14 = v10;

      self->_unsigned int useCase = v11;
      BOOL v7 = 1;
      id v10 = v14;
    }
  }

  else
  {
    int v8 = v5;
    uint64_t v9 = "Default";
    switch(advertiseRate)
    {
      case 0:
        break;
      case 10:
        uint64_t v9 = "Periodic";
        break;
      case 15:
        uint64_t v9 = "PeriodicHigh";
        break;
      case 20:
        uint64_t v9 = "Background";
        break;
      case 30:
        uint64_t v9 = "Low";
        break;
      case 40:
        uint64_t v9 = "Medium";
        break;
      case 42:
        uint64_t v9 = "MediumMid";
        break;
      case 45:
        uint64_t v9 = "MediumHigh";
        break;
      case 50:
        uint64_t v9 = "High";
        break;
      case 60:
        uint64_t v9 = "Max";
        break;
      default:
        uint64_t v9 = "?";
        break;
    }

    int v13 = "Default";
    switch(v5)
    {
      case 0:
        break;
      case 10:
        int v13 = "Periodic";
        break;
      case 15:
        int v13 = "PeriodicHigh";
        break;
      case 20:
        int v13 = "Background";
        break;
      case 30:
        int v13 = "Low";
        break;
      case 40:
        int v13 = "Medium";
        break;
      case 42:
        int v13 = "MediumMid";
        break;
      case 45:
        int v13 = "MediumHigh";
        break;
      case 50:
        int v13 = "High";
        break;
      case 60:
        int v13 = "Max";
        break;
      default:
        int v13 = "?";
        break;
    }

    v344 = v9;
    v399 = v13;
    CUAppendF();
    id v10 = 0LL;
    self->_int advertiseRate = v8;
    unsigned int v11 = objc_msgSend(v4, "useCase", v344, v399);
    unsigned int useCase = self->_useCase;
    if (v11 != useCase) {
      goto LABEL_27;
    }
  }

  objc_msgSend(v4, "useCaseClientIDs", v343, v398);
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  useCaseClientIDs = self->_useCaseClientIDs;
  id v17 = v15;
  uint64_t v18 = useCaseClientIDs;
  if (v17 == v18)
  {

    id v55 = v17;
  }

  else
  {
    id v19 = v18;
    if ((v17 == 0LL) != (v18 != 0LL))
    {
      char v20 = -[NSArray isEqual:](v17, "isEqual:", v18);

      if ((v20 & 1) != 0)
      {
        unsigned int v21 = [v4 enableEPAForLEAdvertisement];
        BOOL enableEPAForLEAdvertisement = self->_enableEPAForLEAdvertisement;
        if (enableEPAForLEAdvertisement == v21) {
          goto LABEL_32;
        }
        goto LABEL_55;
      }
    }

    else
    {
    }

    CUPrintNSObjectOneLine();
    id v58 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v345 = v58;
    v400 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v59 = v10;

    v60 = v17;
    id v55 = self->_useCaseClientIDs;
    self->_useCaseClientIDs = v60;
    BOOL v7 = 1;
    id v10 = v59;
  }

  unsigned int v21 = [v4 enableEPAForLEAdvertisement];
  BOOL enableEPAForLEAdvertisement = self->_enableEPAForLEAdvertisement;
  if (enableEPAForLEAdvertisement == v21)
  {
LABEL_32:
    unsigned int v23 = objc_msgSend(v4, "airdropFlags", v345, v400);
    uint64_t airdropFlags = self->_airdropFlags;
    if (v23 == (_DWORD)airdropFlags) {
      goto LABEL_34;
    }
    goto LABEL_33;
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
    block[2] = __39__CBAdvertiser_activateWithCompletion___block_invoke;
    block[3] = &unk_189FB1AE0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __39__CBAdvertiser_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  int v3 = self->_mockID;
  id v14 = v3;
  if (v3)
  {
    CBMockAddOrUpdateAdvertiser(v3, self);
    id v4 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v4) {
      v4[2](v4, 0LL);
    }
LABEL_27:

    return;
  }

  if (self->_bluetoothStateChangedHandler) {
    self->_internalFlags |= 1u;
  }
  else {
    BOOL v6 = gCBDaemonServer == 0;
  }
  BOOL v7 = !v6;
  self->_direct = v7;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    uint64_t v9 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id v10 = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v9)
    {
      v9[2](v9, v4);
    }

    else
    {
      uint64_t v11 = MEMORY[0x18959F890](self->_errorHandler);
      id v12 = (void *)v11;
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, v4);
      }
    }

    goto LABEL_27;
  }

  if (v7) {
    -[CBAdvertiser _activateDirectStart](self, "_activateDirectStart");
  }
  else {
    -[CBAdvertiser _activateXPCStart:](self, "_activateXPCStart:", 0LL);
  }
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
  v5[2] = __36__CBAdvertiser__activateDirectStart__block_invoke;
  v5[3] = &unk_189FB1E78;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBAdvertiser:completion:", self, v5, clientID);
}

void __36__CBAdvertiser__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(dispatch_queue_s **)(v4 + 184);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__CBAdvertiser__activateDirectStart__block_invoke_2;
  v7[3] = &unk_189FB1900;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __36__CBAdvertiser__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = (void (**)(id, void))MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 32LL);
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
      uint64_t v5 = MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 192LL));
      id v6 = (void *)v5;
      if (v5) {
        (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 40));
      }
    }

    goto LABEL_17;
  }

  BOOL v7 = v9;
  if (v9)
  {
    v9[2](v9, 0LL);
LABEL_17:
    BOOL v7 = v9;
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

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  -[CBAdvertiser encodeWithXPCObject:](self, "encodeWithXPCObject:", v5);
  xpc_dictionary_set_string(v5, "mTyp", "AdvA");
  -[CBAdvertiser _ensureXPCStarted](self, "_ensureXPCStarted");
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __34__CBAdvertiser__activateXPCStart___block_invoke;
  handler[3] = &unk_189FB1EA0;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);
}

uint64_t __34__CBAdvertiser__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __38__CBAdvertiser__activateXPCCompleted___block_invoke;
  v11[3] = &unk_189FB1C20;
  v11[4] = self;
  v11[5] = &v12;
  xpc_object_t v5 = (void (**)(void))MEMORY[0x18959F890](v11);
  uint64_t v6 = CUXPCDecodeNSErrorIfNeeded();
  BOOL v7 = (void *)v13[5];
  v13[5] = v6;

  if (!v13[5])
  {
    CUXPCDecodeNSData();
    CUXPCDecodeNSData();
    CUXPCDecodeNSData();
    self->_bluetoothState = xpc_dictionary_get_int64(v4, "pwrS");
    int var0 = self->_ucat->var0;
    uint64_t v9 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v9) {
      v9[2](v9, 0LL);
    }
  }

  v5[2](v5);

  _Block_object_dispose(&v12, 8);
}

void __38__CBAdvertiser__activateXPCCompleted___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 32);
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
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0LL;

    if (v10)
    {
      v10[2](v10, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    }

    else
    {
      uint64_t v7 = MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 32) + 192LL));
      id v8 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))( v7,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
      }
    }
  }

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  int v4 = self->_xpcCnx;
  if (v4) {
    return v4;
  }
  uint64_t v5 = self->_xpcListenerEndpoint;
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
  v10[2] = __33__CBAdvertiser__ensureXPCStarted__block_invoke;
  v10[3] = &unk_189FB1EC8;
  v10[4] = self;
  id v8 = mach_service;
  uint64_t v11 = v8;
  xpc_connection_set_event_handler(v8, v10);
  xpc_connection_activate(v8);

  return v8;
}

void *__33__CBAdvertiser__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[5] == *(void *)(a1 + 40)) {
    return (void *)[result xpcReceivedMessage:a2];
  }
  return result;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
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

    -[CBAdvertiser _activateXPCStart:](self, "_activateXPCStart:", 1LL);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CBAdvertiser_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__CBAdvertiser_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 26))
  {
    *(_BYTE *)(v1 + 26) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 32);
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(a1 + 32), v5))
      {
        uint64_t v9 = v3;
        LogPrintF_safe();
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }

    id v6 = *(id *)(v3 + 256);
    id v10 = v6;
    if (v6) {
      CBMockRemoveAdvertiser(v6, *(void **)(a1 + 32));
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v7 + 25))
    {
      [(id)v7 _invalidateDirect];
      uint64_t v7 = *(void *)(a1 + 32);
    }

    id v8 = *(_xpc_connection_s **)(v7 + 40);
    if (v8) {
      xpc_connection_cancel(v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidated", v9);
  }

- (void)_invalidateDirect
{
}

void __33__CBAdvertiser__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 184);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__CBAdvertiser__invalidateDirect__block_invoke_2;
  block[3] = &unk_189FB1AE0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __33__CBAdvertiser__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 25LL) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct && !self->_xpcCnx)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id advertisingAddressChangedHandler = self->_advertisingAddressChangedHandler;
    self->_id advertisingAddressChangedHandler = 0LL;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0LL;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
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
    block[2] = __41__CBAdvertiser__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_189FB1AE0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __41__CBAdvertiser__updateIfNeededWithBlock___block_invoke(uint64_t a1)
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
      -[CBAdvertiser encodeWithXPCObject:](v2, "encodeWithXPCObject:", xdict);
      xpc_dictionary_set_string(xdict, "mTyp", "AdvU");
      -[CBAdvertiser _ensureXPCStarted](v2, "_ensureXPCStarted");
      int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v5, xdict);
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
  id v18 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v18, v6))
    {
      CUPrintXPC();
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      id v4 = v18;
    }
  }

  if (MEMORY[0x18959FCE0](v4) == MEMORY[0x1895F9250])
  {
    -[CBAdvertiser _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v18);
    goto LABEL_26;
  }

  if (v18 == (id)MEMORY[0x1895F9198])
  {
    -[CBAdvertiser _interrupted](self, "_interrupted");
    goto LABEL_26;
  }

  if (v18 != (id)MEMORY[0x1895F91A0])
  {
    CUXPCDecodeNSErrorIfNeeded();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;

      int v10 = self->_ucat->var0;
      if (v10 > 90) {
        goto LABEL_21;
      }
    }

    else
    {
      NSErrorF();
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      int v10 = self->_ucat->var0;
      if (v10 > 90)
      {
LABEL_21:
        uint64_t v13 = MEMORY[0x18959F890](self->_errorHandler);
        uint64_t v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, id))(v13 + 16))(v13, v9);
        }

        goto LABEL_26;
      }
    }

    if (v10 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    goto LABEL_21;
  }

  if (!self->_invalidateCalled)
  {
    int v11 = self->_ucat->var0;
  }

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0LL;

  -[CBAdvertiser _invalidated](self, "_invalidated");
LABEL_26:
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    int var0 = self->_ucat->var0;
LABEL_9:
    LogPrintF_safe();
LABEL_10:

    return;
  }

  int v5 = string;
  if (!strcmp(string, "AdAC"))
  {
    -[CBAdvertiser _xpcReceivedAdvertisingAddressChanged:](self, "_xpcReceivedAdvertisingAddressChanged:", v8);
  }

  else
  {
    if (strcmp(v5, "PwrC"))
    {
      int v6 = self->_ucat->var0;
      goto LABEL_9;
    }

    -[CBAdvertiser _xpcReceivedPowerStateChanged:](self, "_xpcReceivedPowerStateChanged:", v8);
  }

- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3
{
  id v4 = a3;
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  int var0 = self->_ucat->var0;
  uint64_t v6 = MEMORY[0x18959F890](self->_advertisingAddressChangedHandler);
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  xpc_object_t xdict = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(xdict, "pwrS");
    uint64_t v4 = MEMORY[0x18959F890](self->_bluetoothStateChangedHandler);
    int v5 = (void *)v4;
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

- (id)advertisingAddressChangedHandler
{
  return self->_advertisingAddressChangedHandler;
}

- (void)setAdvertisingAddressChangedHandler:(id)a3
{
}

- (NSData)advertisingAddressDataConnectable
{
  return self->_advertisingAddressDataConnectable;
}

- (void)setAdvertisingAddressDataConnectable:(id)a3
{
}

- (NSData)advertisingAddressDataNonConnectable
{
  return self->_advertisingAddressDataNonConnectable;
}

- (void)setAdvertisingAddressDataNonConnectable:(id)a3
{
}

- (NSData)advertisingAddressDataNonConnectableSecondary
{
  return self->_advertisingAddressDataNonConnectableSecondary;
}

- (void)setAdvertisingAddressDataNonConnectableSecondary:(id)a3
{
}

- (NSData)airplaySourceAuthTagData
{
  return self->_airplaySourceAuthTagData;
}

- (void)setAirplaySourceAuthTagData:(id)a3
{
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

- (NSData)nearbyInfoV2AuthTagData
{
  return self->_nearbyInfoV2AuthTagData;
}

- (void)setNearbyInfoV2AuthTagData:(id)a3
{
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
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

- (int)advertiseRate
{
  return self->_advertiseRate;
}

- (void)setAdvertiseRate:(int)a3
{
  self->_int advertiseRate = a3;
}

- (CBDevice)mockDevice
{
  return self->_mockDevice;
}

- (void)setMockDevice:(id)a3
{
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
}

- (unsigned)airdropFlags
{
  return self->_airdropFlags;
}

- (NSData)airdropTempAuthTagData
{
  return self->_airdropTempAuthTagData;
}

- (unsigned)airdropModel
{
  return self->_airdropModel;
}

- (void)setAirdropModel:(unsigned __int8)a3
{
  self->_uint64_t airdropModel = a3;
}

- (unsigned)airdropVersion
{
  return self->_airdropVersion;
}

- (unsigned)airdropHash1
{
  return self->_airdropHash1;
}

- (void)setAirdropHash1:(unsigned __int16)a3
{
  self->_uint64_t airdropHash1 = a3;
}

- (unsigned)airdropHash2
{
  return self->_airdropHash2;
}

- (void)setAirdropHash2:(unsigned __int16)a3
{
  self->_uint64_t airdropHash2 = a3;
}

- (unsigned)airdropHash3
{
  return self->_airdropHash3;
}

- (void)setAirdropHash3:(unsigned __int16)a3
{
  self->_uint64_t airdropHash3 = a3;
}

- (unsigned)airdropHash4
{
  return self->_airdropHash4;
}

- (void)setAirdropHash4:(unsigned __int16)a3
{
  self->_uint64_t airdropHash4 = a3;
}

- (unsigned)airdropConfigData
{
  return self->_airdropConfigData;
}

- (unsigned)airplaySourceFlags
{
  return self->_airplaySourceFlags;
}

- (NSData)airplaySourceUWBConfigData
{
  return self->_airplaySourceUWBConfigData;
}

- (unsigned)airplayTargetConfigSeed
{
  return self->_airplayTargetConfigSeed;
}

- (unsigned)airplayTargetFlags
{
  return self->_airplayTargetFlags;
}

- (unsigned)airplayTargetIPv4
{
  return self->_airplayTargetIPv4;
}

- (unsigned)airplayTargetPort
{
  return self->_airplayTargetPort;
}

- (unsigned)dsActionFlags
{
  return self->_dsActionFlags;
}

- (char)dsActionMeasuredPower
{
  return self->_dsActionMeasuredPower;
}

- (unsigned)dsActionTieBreaker
{
  return self->_dsActionTieBreaker;
}

- (unsigned)dsInfoVehicleConfidence
{
  return self->_dsInfoVehicleConfidence;
}

- (unsigned)dsInfoVehicleState
{
  return self->_dsInfoVehicleState;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_BOOL enableEPAForLEAdvertisement = a3;
}

- (NSData)fidoPayloadData
{
  return self->_fidoPayloadData;
}

- (unsigned)heySiriConfidence
{
  return self->_heySiriConfidence;
}

- (unsigned)heySiriDeviceClass
{
  return self->_heySiriDeviceClass;
}

- (unsigned)heySiriPerceptualHash
{
  return self->_heySiriPerceptualHash;
}

- (unsigned)heySiriProductType
{
  return self->_heySiriProductType;
}

- (unsigned)heySiriRandom
{
  return self->_heySiriRandom;
}

- (unsigned)heySiriSNR
{
  return self->_heySiriSNR;
}

- (NSData)nearbyActionAuthTagData
{
  return self->_nearbyActionAuthTagData;
}

- (void)setNearbyActionAuthTagData:(id)a3
{
}

- (unsigned)nearbyActionColorCode
{
  return self->_nearbyActionColorCode;
}

- (NSData)nearbyActionExtraData
{
  return self->_nearbyActionExtraData;
}

- (unsigned)nearbyActionFlags
{
  return self->_nearbyActionFlags;
}

- (void)setNearbyActionFlags:(unsigned int)a3
{
  self->_uint64_t nearbyActionFlags = a3;
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  self->_unsigned int nearbyActionType = a3;
}

- (NSData)nearbyActionTargetData
{
  return self->_nearbyActionTargetData;
}

- (unsigned)nearbyActionV2Flags
{
  return self->_nearbyActionV2Flags;
}

- (void)setNearbyActionV2Flags:(unsigned int)a3
{
  self->_uint64_t nearbyActionV2Flags = a3;
}

- (NSData)nearbyActionV2TargetData
{
  return self->_nearbyActionV2TargetData;
}

- (void)setNearbyActionV2TargetData:(id)a3
{
}

- (unsigned)nearbyActionV2Type
{
  return self->_nearbyActionV2Type;
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  self->_unsigned int nearbyActionV2Type = a3;
}

- (unsigned)nearbyInfoFlags
{
  return self->_nearbyInfoFlags;
}

- (double)nearbyInfoStatusProgress
{
  return self->_nearbyInfoStatusProgress;
}

- (unsigned)nearbyInfoStatusTime
{
  return self->_nearbyInfoStatusTime;
}

- (unsigned)nearbyInfoStatusType
{
  return self->_nearbyInfoStatusType;
}

- (unsigned)nearbyInfoV2Flags
{
  return self->_nearbyInfoV2Flags;
}

- (unsigned)nearbyInfoV2DecryptedFlags
{
  return self->_nearbyInfoV2DecryptedFlags;
}

- (unsigned)nearbyInfoV2InvitationCounter
{
  return self->_nearbyInfoV2InvitationCounter;
}

- (unsigned)nearbyInfoV2InvitationTypes
{
  return self->_nearbyInfoV2InvitationTypes;
}

- (unsigned)nearbyInfoV2InvitationRouteType
{
  return self->_nearbyInfoV2InvitationRouteType;
}

- (void)setNearbyInfoV2InvitationRouteType:(unsigned __int8)a3
{
  self->_uint64_t nearbyInfoV2InvitationRouteType = a3;
}

- (NSData)nearbyInfoV2TempAuthTagData
{
  return self->_nearbyInfoV2TempAuthTagData;
}

- (void)setNearbyInfoV2TempAuthTagData:(id)a3
{
}

- (unsigned)nearbyActionNoWakeType
{
  return self->_nearbyActionNoWakeType;
}

- (unsigned)nearbyActionNWPrecisionFindingStatus
{
  return self->_nearbyActionNWPrecisionFindingStatus;
}

- (NSData)nearbyActionNoWakeAuthTagData
{
  return self->_nearbyActionNoWakeAuthTagData;
}

- (NSData)nearbyActionNoWakeConfigData
{
  return self->_nearbyActionNoWakeConfigData;
}

- (NSData)safetyAlertsAlertData
{
  return self->_safetyAlertsAlertData;
}

- (NSData)safetyAlertsAlertID
{
  return self->_safetyAlertsAlertID;
}

- (unsigned)safetyAlertsAlertIndex
{
  return self->_safetyAlertsAlertIndex;
}

- (void)setSafetyAlertsAlertIndex:(unsigned __int8)a3
{
  self->_safetyAlertsAlertIndex = a3;
}

- (NSData)safetyAlertsSignature
{
  return self->_safetyAlertsSignature;
}

- (unsigned)safetyAlertsVersion
{
  return self->_safetyAlertsVersion;
}

- (NSData)watchSetupData
{
  return self->_watchSetupData;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (NSData)nearbyInfoV2AuthIntegrityTagData
{
  return self->_nearbyInfoV2AuthIntegrityTagData;
}

- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3
{
}

- (NSData)nearbyInfoV2RapportIRKData
{
  return self->_nearbyInfoV2RapportIRKData;
}

- (void)setNearbyInfoV2RapportIRKData:(id)a3
{
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end