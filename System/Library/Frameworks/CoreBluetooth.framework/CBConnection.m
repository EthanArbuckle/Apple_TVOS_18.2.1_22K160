@interface CBConnection
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_processReadStatus;
- (BOOL)_runConnectStart;
- (BOOL)_runSetupChannel;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingAndReturnError:(id *)a3;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (BOOL)updateWithXPCSubscriberInfo:(id)a3;
- (CBConnection)init;
- (CBConnection)initWithXPCEventRepresentation:(id)a3 error:(id *)a4;
- (CBConnection)initWithXPCObject:(id)a3 error:(id *)a4;
- (CBDevice)peerDevice;
- (CBDevice)remoteDevice;
- (CBL2CAPChannel)l2capChannel;
- (CBServer)server;
- (NSArray)serviceUUIDs;
- (NSArray)useCaseClientIDs;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcListenerEndpoint;
- (double)connectTimeoutSeconds;
- (double)connectedTime;
- (id)_ensureXPCStarted;
- (id)bluetoothStateChangedHandler;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)pairingCompletedHandler;
- (id)pairingPromptHandler;
- (id)serverInvalidationHandler;
- (id)xpcForwardMessageReceiveHandler;
- (id)xpcSendEventHandler;
- (int64_t)bluetoothState;
- (int64_t)clientUseCase;
- (int64_t)connectionLatency;
- (int64_t)connectionScanDutyCycle;
- (unsigned)blePSM;
- (unsigned)clientID;
- (unsigned)connectionFlags;
- (unsigned)internalFlags;
- (unsigned)serviceFlags;
- (unsigned)useCase;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_pairWithOOBData:(id)a3;
- (void)_pairingGenerateOOBDataWithCompletionHandler:(id)a3;
- (void)_pairingPerformActionBLE:(int)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)_pairingPerformActionClassic:(int)a3 completionHandler:(id)a4;
- (void)_pairingPerformActionClassic:(int)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)_pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads:(BOOL)a3;
- (void)_processWrites;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)disconnectWithCompletion:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)invalidate;
- (void)pairWithOOBData:(id)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)pairingGenerateOOBDataWithCompletionHandler:(id)a3;
- (void)pairingPerformAction:(int)a3 completionHandler:(id)a4;
- (void)pairingPerformAction:(int)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)readWithCBReadRequest:(id)a3;
- (void)readWithRequest:(id)a3;
- (void)setBlePSM:(unsigned __int16)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setClientUseCase:(int64_t)a3;
- (void)setConnectTimeoutSeconds:(double)a3;
- (void)setConnectedTime:(double)a3;
- (void)setConnectionFlags:(unsigned int)a3;
- (void)setConnectionLatency:(int64_t)a3;
- (void)setConnectionScanDutyCycle:(int64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setL2capChannel:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPairingCompletedHandler:(id)a3;
- (void)setPairingPromptHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setServer:(id)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)setServiceFlags:(unsigned int)a3;
- (void)setServiceUUIDs:(id)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUseCaseClientIDs:(id)a3;
- (void)setXpcForwardMessageReceiveHandler:(id)a3;
- (void)setXpcListenerEndpoint:(id)a3;
- (void)setXpcSendEventHandler:(id)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithCBWriteRequest:(id)a3;
- (void)writeWithRequest:(id)a3;
- (void)xpcForwardMessage:(id)a3;
- (void)xpcReceivedForwardedEvent:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
- (void)xpcReceivedPairingCompleted:(id)a3;
- (void)xpcReceivedPairingPrompt:(id)a3;
@end

@implementation CBConnection

- (CBConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CBConnection;
  v2 = -[CBConnection init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    v2->_connectionLatency = -99LL;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CBConnection;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v4 = (CBConnection *)CUFatalErrorF();
    -[CBConnection initWithXPCObject:error:](v4, v5, v6, v7);
  }

  else
  {
    ucat = self->_ucat;
    if (ucat)
    {
      if ((ucat->var3 & 0x40000) != 0)
      {
        LogCategory_Remove();
        self->_ucat = 0LL;
      }
    }

    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CBConnection;
    -[CBConnection dealloc](&v8, sel_dealloc);
  }

- (CBConnection)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = -[CBConnection init](self, "init");
  if (!v13)
  {
    if (!a4) {
      goto LABEL_35;
    }
    v23 = "CBConnection init failed";
LABEL_34:
    CBErrorF(-6756, (uint64_t)v23, v7, v8, v9, v10, v11, v12, v24);
    v21 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (!a4) {
      goto LABEL_35;
    }
    v23 = "XPC non-dict";
    goto LABEL_34;
  }

  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_clientID = 0;
  }

  else if (v14 == 5)
  {
    goto LABEL_35;
  }

  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_connectionFlags = 0;
  }

  else if (v15 == 5)
  {
    goto LABEL_35;
  }

  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_internalFlags = 0;
  }

  else if (v16 == 5)
  {
    goto LABEL_35;
  }

  objc_opt_class();
  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v13->_blePSM = 0;
  }

  else if (v17 == 5)
  {
    goto LABEL_35;
  }

  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v13->_serviceFlags = 0;
  }

  else if (v18 == 5)
  {
    goto LABEL_35;
  }

  objc_opt_class();
  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_socketFD = 0;
  }

  else if (v19 == 5)
  {
    goto LABEL_35;
  }

  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_useCase = 0;
    goto LABEL_27;
  }

  if (v20 == 5)
  {
LABEL_35:
    v21 = 0LL;
    goto LABEL_29;
  }

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  uint64_t clientID = self->_clientID;
  xpc_object_t xdict = v4;
  if ((_DWORD)clientID) {
    xpc_dictionary_set_uint64(v4, "cid", clientID);
  }
  uint64_t connectionFlags = self->_connectionFlags;
  if ((_DWORD)connectionFlags) {
    xpc_dictionary_set_uint64(xdict, "CnFl", connectionFlags);
  }
  double connectTimeoutSeconds = self->_connectTimeoutSeconds;
  if (connectTimeoutSeconds != 0.0) {
    xpc_dictionary_set_double(xdict, "cnTO", connectTimeoutSeconds);
  }
  uint64_t internalFlags = self->_internalFlags;
  CUXPCEncodeObject();
  if (self->_blePSM) {
    xpc_dictionary_set_uint64(xdict, "psm", self->_blePSM);
  }
  uint64_t serviceFlags = self->_serviceFlags;
  if ((_DWORD)serviceFlags) {
    xpc_dictionary_set_uint64(xdict, "svFl", serviceFlags);
  }
  CUXPCEncodeObject();
  int64_t socketFD = self->_socketFD;
  if ((_DWORD)socketFD) {
    xpc_dictionary_set_int64(xdict, "sFD", socketFD);
  }
  uint64_t useCase = self->_useCase;
  if ((_DWORD)useCase) {
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  }
  CUXPCEncodeNSArrayOfNSString();
}

- (NSString)description
{
  blePeerUUID = self->_blePeerUUID;
  if (blePeerUUID)
  {
    id v4 = blePeerUUID;
  }

  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 identifier];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = v6;
    }

    else
    {
      -[CBDevice identifier](self->_peerDevice, "identifier");
      uint64_t v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }

    id v4 = v8;
  }

  NSAppendPrintF_safe();
  id v9 = 0LL;
  uint64_t v10 = v9;
  if (self->_blePSM)
  {
    v37 = v9;
    NSAppendPrintF_safe();
    id v11 = v37;

    uint64_t v10 = v11;
  }

  if (self->_connectionFlags)
  {
    CUPrintFlags32();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v12 = v10;

    uint64_t v10 = v12;
  }

  int64_t connectionLatency = self->_connectionLatency;
  if (connectionLatency != -99)
  {
    CBCentralManagerConnectionLatencyToString(connectionLatency);
    NSAppendPrintF_safe();
    id v14 = v10;

    uint64_t v10 = v14;
  }

  if (self->_serviceFlags)
  {
    CUPrintFlags32();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v15 = v10;

    uint64_t v10 = v15;
  }

  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    v34 = remoteDevice;
    NSAppendPrintF_safe();
    id v17 = v10;

    uint64_t v10 = v17;
  }

  if (self->_connectTimeoutSeconds != 0.0)
  {
    NSAppendPrintF_safe();
    id v18 = v10;

    uint64_t v10 = v18;
  }

  serviceUUIDs = self->_serviceUUIDs;
  if (serviceUUIDs)
  {
    int v20 = serviceUUIDs;
    CUPrintNSObjectOneLine();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v21 = v10;

    uint64_t v10 = v21;
  }

  if (self->_socketFD)
  {
    NSAppendPrintF_safe();
    id v22 = v10;

    uint64_t v10 = v22;
  }

  if (self->_useCase)
  {
    NSAppendPrintF_safe();
    id v24 = v10;

    uint64_t v10 = v24;
  }

  useCaseClientIDs = self->_useCaseClientIDs;
  if (useCaseClientIDs)
  {
    v26 = useCaseClientIDs;
    CUPrintNSObjectOneLine();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v27 = v10;

    uint64_t v10 = v27;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_get_label(dispatchQueue);
    v29 = dispatchQueue;
    NSAppendPrintF_safe();
    id v30 = v10;

    uint64_t v10 = v30;
  }

  return (NSString *)v10;
}

- (CBConnection)initWithXPCEventRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = -[CBConnection init](self, "init");
  if (!v13)
  {
    if (a4)
    {
      v26 = "CBConnection init failed";
LABEL_20:
      CBErrorF(-6756, (uint64_t)v26, v7, v8, v9, v10, v11, v12, v34);
      id v24 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __39__CBConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_189FB2B50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __39__CBConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  int v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0LL;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __40__CBConnection__activateWithCompletion___block_invoke;
  v14[3] = &unk_189FB1BF8;
  id v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void))MEMORY[0x18959F890](v14);
  if (!self->_activateCalled && !self->_invalidateCalled)
  {
    self->_activateCalled = 1;
    uint64_t v7 = (void *)MEMORY[0x18959F890](v5);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v7;

    if (self->_bluetoothStateChangedHandler) {
      self->_internalFlags |= 1u;
    }
    if (self->_pairingCompletedHandler) {
      self->_internalFlags |= 0x100u;
    }
    if (self->_pairingPromptHandler) {
      self->_internalFlags |= 0x100u;
    }
    if ((self->_connectionFlags & 0x100) != 0)
    {
      BOOL v9 = 0;
      if (self->_remoteDevice) {
        goto LABEL_17;
      }
    }

    else
    {
      BOOL v9 = self->_serviceFlags != 0;
      if (self->_remoteDevice) {
        goto LABEL_17;
      }
    }

    if (!v9)
    {
      id v13 = 0LL;
      -[CBConnection activateDirectAndReturnError:](self, "activateDirectAndReturnError:", &v13);
      id v10 = v13;
      if (v10)
      {
        id v11 = self->_activateCompletion;
        self->_id activateCompletion = 0LL;

        (*((void (**)(id, id))v5 + 2))(v5, v10);
      }

      goto LABEL_16;
    }

uint64_t __40__CBConnection__activateWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 152LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  id v46 = 0LL;
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __45__CBConnection_activateDirectAndReturnError___block_invoke;
  v40[3] = &unk_189FB1D38;
  v40[4] = self;
  v40[5] = &v41;
  v40[6] = a3;
  id v5 = (void (**)(void))MEMORY[0x18959F890](v40, a2);
  l2capChannel = self->_l2capChannel;
  if (l2capChannel)
  {
    -[CBL2CAPChannel peer](l2capChannel, "peer");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 identifier];
    id v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    self->_blePeerUUID = v8;

    self->_uint64_t blePSM = -[CBL2CAPChannel PSM](self->_l2capChannel, "PSM");
    if (self->_peerDevice)
    {
      int var0 = self->_ucat->var0;
      if (var0 > 30) {
        goto LABEL_15;
      }
    }

    else
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      -[NSUUID UUIDString](self->_blePeerUUID, "UUIDString");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBDevice setIdentifier:](v16, "setIdentifier:", v17);

      peerDevice = self->_peerDevice;
      self->_peerDevice = v16;

      int var0 = self->_ucat->var0;
      if (var0 > 30)
      {
LABEL_15:
        uint64_t v19 = (id *)(v42 + 5);
        id obj = (id)v42[5];
        BOOL v20 = -[CBConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &obj, v35, blePSM);
        objc_storeStrong(v19, obj);
        if (!v20)
        {
          BOOL v28 = 0;
          goto LABEL_23;
        }

        writeRequests = (NSMutableArray *)MEMORY[0x18959F890](self->_activateCompletion);
        id activateCompletion = self->_activateCompletion;
        self->_id activateCompletion = 0LL;

        if (writeRequests) {
          ((void (*)(NSMutableArray *, void))writeRequests[2].super.super.isa)(writeRequests, 0LL);
        }
        goto LABEL_21;
      }
    }

    if (var0 != -1 || _LogCategory_Initialize())
    {
      v35 = self->_blePeerUUID;
      uint64_t blePSM = self->_blePSM;
      LogPrintF_safe();
    }

    goto LABEL_15;
  }

  id v11 = self->_peerDevice;
  if (!v11)
  {
    uint64_t v31 = NSErrorF_safe();
    BOOL v28 = 0;
    writeRequests = (NSMutableArray *)v42[5];
    v42[5] = v31;
    goto LABEL_22;
  }

  writeRequests = (NSMutableArray *)v11;
  -[CBDevice identifier](v11, "identifier");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    uint64_t v32 = NSErrorF_safe();
    uint64_t v33 = (void *)v42[5];
    v42[5] = v32;

    BOOL v28 = 0;
    goto LABEL_22;
  }

  id v14 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v13];
  if (!v14)
  {
    uint64_t v34 = NSErrorF_safe();
    id v24 = (id)v42[5];
    v42[5] = v34;
LABEL_30:

    BOOL v28 = 0;
    goto LABEL_22;
  }

  objc_storeStrong((id *)&self->_blePeerUUID, v14);
  int v15 = self->_ucat->var0;
  if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
  {
    v35 = self->_blePeerUUID;
    uint64_t blePSM = self->_blePSM;
    LogPrintF_safe();
  }

  id v38 = 0LL;
  BOOL v22 = -[CBConnection _startConnectingAndReturnError:](self, "_startConnectingAndReturnError:", &v38, v35, blePSM);
  id v23 = v38;
  id v24 = v23;
  if (!v22)
  {
    int v30 = self->_ucat->var0;
    if (v30 <= 90 && (v30 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    if (a3)
    {
      id v24 = v24;
      *a3 = v24;
    }

    goto LABEL_30;
  }

LABEL_21:
  v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  readRequests = self->_readRequests;
  self->_readRequests = v25;

  id v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  writeRequests = self->_writeRequests;
  self->_writeRequests = v27;
  BOOL v28 = 1;
LABEL_22:

LABEL_23:
  v5[2](v5);

  _Block_object_dispose(&v41, 8);
  return v28;
}

void __45__CBConnection_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    int v2 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      int v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
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
  -[CBConnection encodeWithXPCObject:](self, "encodeWithXPCObject:", v5);
  xpc_dictionary_set_string(v5, "mTyp", "CnxA");
  -[CBConnection _ensureXPCStarted](self, "_ensureXPCStarted");
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __34__CBConnection__activateXPCStart___block_invoke;
  handler[3] = &unk_189FB1EA0;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);
}

uint64_t __34__CBConnection__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  int var0 = self->_ucat->var0;
  id v11 = (id)v4;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  id v6 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v6)
  {
    ((void (**)(void, id))v6)[2](v6, v11);
  }

  else
  {
    uint64_t v8 = MEMORY[0x18959F890](self->_errorHandler);
    BOOL v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v11);
    }
  }
}

- (void)disconnectWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__CBConnection_disconnectWithCompletion___block_invoke;
  v7[3] = &unk_189FB2B50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __41__CBConnection_disconnectWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "CnxD");
  [*(id *)(a1 + 32) _ensureXPCStarted];
  int v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 40);
  xpc_object_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 208LL);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __41__CBConnection_disconnectWithCompletion___block_invoke_2;
  handler[3] = &unk_189FB2B28;
  id v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);
}

void __41__CBConnection_disconnectWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  id v4 = self->_xpcCnx;
  if (v4) {
    return v4;
  }
  xpc_object_t v5 = self->_xpcListenerEndpoint;
  id v6 = v5;
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
  v10[2] = __33__CBConnection__ensureXPCStarted__block_invoke;
  v10[3] = &unk_189FB1EC8;
  v10[4] = self;
  id v8 = mach_service;
  id v11 = v8;
  xpc_connection_set_event_handler(v8, v10);
  xpc_connection_activate(v8);

  return v8;
}

void *__33__CBConnection__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[20] == *(void *)(a1 + 40)) {
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
    xpc_object_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    self->_bluetoothState = 1LL;
    id v6 = (void (**)(void))MEMORY[0x18959F890](self->_bluetoothStateChangedHandler);
    if (v6)
    {
      id v7 = v6;
      v6[2]();
      id v6 = v7;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CBConnection_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CBConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    connectTimeoutTimer = self->_connectTimeoutTimer;
    if (connectTimeoutTimer)
    {
      xpc_object_t v5 = connectTimeoutTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_connectTimeoutTimer;
      self->_connectTimeoutTimer = 0LL;
    }

    if (self->_peripheral)
    {
      self->_guardConnected = 0;
      -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:");
    }

    -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0LL);
    centralManager = self->_centralManager;
    self->_centralManager = 0LL;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", 0LL);
    peripheral = self->_peripheral;
    self->_peripheral = 0LL;

    NSErrorF_safe();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBConnection _reportError:](self, "_reportError:", v10);

    readSource = self->_readSource;
    if (readSource)
    {
      dispatch_source_cancel((dispatch_source_t)readSource);
      if (self->_readSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_readSource);
        self->_readSuspended = 0;
      }

      uint64_t v12 = self->_readSource;
      self->_readSource = 0LL;
    }

    writeSource = self->_writeSource;
    if (writeSource)
    {
      dispatch_source_cancel((dispatch_source_t)writeSource);
      if (self->_writeSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_writeSource);
        self->_writeSuspended = 0;
      }

      id v14 = self->_writeSource;
      self->_writeSource = 0LL;
    }

    xpcCnx = self->_xpcCnx;
    if (xpcCnx) {
      xpc_connection_cancel(xpcCnx);
    }
    -[CBConnection _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (!self->_invalidateDone
    && !self->_readSource
    && !self->_writeSource
    && !self->_readRequestCurrent
    && !-[NSMutableArray count](self->_readRequests, "count")
    && !self->_writeRequestCurrent
    && !-[NSMutableArray count](self->_writeRequests, "count")
    && !self->_xpcCnx)
  {
    int v15 = (void (**)(void))MEMORY[0x18959F890](self->_invalidationHandler);
    int v3 = (void (**)(void))MEMORY[0x18959F890](self->_serverInvalidationHandler);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0LL;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id pairingCompletedHandler = self->_pairingCompletedHandler;
    self->_id pairingCompletedHandler = 0LL;

    id pairingPromptHandler = self->_pairingPromptHandler;
    self->_id pairingPromptHandler = 0LL;

    id serverInvalidationHandler = self->_serverInvalidationHandler;
    self->_id serverInvalidationHandler = 0LL;

    id xpcForwardMessageReceiveHandler = self->_xpcForwardMessageReceiveHandler;
    self->_id xpcForwardMessageReceiveHandler = 0LL;

    id xpcSendEventHandler = self->_xpcSendEventHandler;
    self->_id xpcSendEventHandler = 0LL;

    if (v15) {
      v15[2]();
    }
    if (v3) {
      v3[2](v3);
    }
    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    else
    {
    }
  }

- (BOOL)updateWithXPCSubscriberInfo:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = v4;
  if (!v4 || MEMORY[0x18959FCE0](v4) != MEMORY[0x1895F9250])
  {
    BOOL v11 = 0;
    goto LABEL_14;
  }

  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  BOOL v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0LL;
  xpc_dictionary_get_array(v5, "serviceUUIDs");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __44__CBConnection_updateWithXPCSubscriberInfo___block_invoke;
    applier[3] = &unk_189FB4618;
    applier[4] = &v17;
    xpc_array_apply(v6, applier);
  }

  serviceUUIDs = self->_serviceUUIDs;
  BOOL v9 = (NSArray *)(id)v18[5];
  id v10 = serviceUUIDs;
  BOOL v11 = v9 != v10;
  if (v9 == v10)
  {

LABEL_12:
    goto LABEL_13;
  }

  uint64_t v12 = v10;
  if ((v9 == 0LL) == (v10 != 0LL))
  {

    goto LABEL_11;
  }

  char v13 = -[NSArray isEqual:](v9, "isEqual:", v10);

  if ((v13 & 1) == 0)
  {
LABEL_11:
    id v14 = (NSArray *)(id)v18[5];
    BOOL v9 = self->_serviceUUIDs;
    self->_serviceUUIDs = v14;
    goto LABEL_12;
  }

  BOOL v11 = 0;
LABEL_13:

  _Block_object_dispose(&v17, 8);
LABEL_14:

  return v11;
}

uint64_t __44__CBConnection_updateWithXPCSubscriberInfo___block_invoke( uint64_t a1,  int a2,  xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    xpc_object_t v5 = (void *)[objc_alloc(NSString) initWithUTF8String:string_ptr];
    if (v5)
    {
      id v6 = -[CBUUID initWithString:safe:](objc_alloc(&OBJC_CLASS___CBUUID), "initWithString:safe:", v5, 1LL);
      if (v6)
      {
        id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        if (!v7)
        {
          id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
          id v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        }

        [v7 addObject:v6];
      }
    }
  }

  return 1LL;
}

- (void)xpcForwardMessage:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __34__CBConnection_xpcForwardMessage___block_invoke;
  v7[3] = &unk_189FB1900;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __34__CBConnection_xpcForwardMessage___block_invoke(uint64_t a1)
{
  int v2 = **(_DWORD **)(*(void *)(a1 + 40) + 152LL);
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  [*(id *)(a1 + 40) encodeWithXPCObject:xdict];
  xpc_dictionary_set_string(xdict, "mTyp", "CnxF");
  xpc_dictionary_set_value(xdict, "fwdM", *(xpc_object_t *)(a1 + 32));
  uint64_t v3 = MEMORY[0x18959F890](*(void *)(*(void *)(a1 + 40) + 384LL));
  id v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, xpc_object_t))(v3 + 16))(v3, xdict);
  }

  else
  {
    [*(id *)(a1 + 40) _ensureXPCStarted];
    xpc_object_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v5, xdict);
  }
}

- (void)xpcReceivedForwardedEvent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v5 = v4;
  uint64_t v12 = v4;
  if (v4)
  {
    xpc_dictionary_get_int64(v4, "kCBMsgId");
    int var0 = self->_ucat->var0;
    uint64_t v7 = MEMORY[0x18959F890](self->_xpcForwardMessageReceiveHandler);
    id v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v12);
    }

    else
    {
      int v10 = self->_ucat->var0;
    }

    goto LABEL_9;
  }

  int v9 = self->_ucat->var0;
  if (v9 <= 90)
  {
    if (v9 != -1 || (v11 = _LogCategory_Initialize(), xpc_object_t v5 = 0LL, v11))
    {
      LogPrintF_safe();
LABEL_9:
      xpc_object_t v5 = v12;
    }
  }
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v24 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v24, v6))
    {
      CUPrintXPC();
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      id v4 = v24;
    }
  }

  if (MEMORY[0x18959FCE0](v4) == MEMORY[0x1895F9250])
  {
    -[CBConnection _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v24);
    goto LABEL_26;
  }

  if (v24 == (id)MEMORY[0x1895F9198])
  {
    -[CBConnection _interrupted](self, "_interrupted");
    goto LABEL_26;
  }

  if (v24 != (id)MEMORY[0x1895F91A0])
  {
    CUXPCDecodeNSErrorIfNeeded();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v7;
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
        BOOL v20 = (void *)v19;
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
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
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

  -[CBConnection _invalidated](self, "_invalidated");
LABEL_26:
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    int var0 = self->_ucat->var0;
LABEL_10:
    LogPrintF_safe();
LABEL_11:

    return;
  }

  xpc_object_t v5 = string;
  if (!strcmp(string, "CnxF"))
  {
    -[CBConnection xpcReceivedForwardedEvent:](self, "xpcReceivedForwardedEvent:", v8);
  }

  else if (!strcmp(v5, "PrCm"))
  {
    -[CBConnection xpcReceivedPairingCompleted:](self, "xpcReceivedPairingCompleted:", v8);
  }

  else
  {
    if (strcmp(v5, "PrPm"))
    {
      int v6 = self->_ucat->var0;
      goto LABEL_10;
    }

    -[CBConnection xpcReceivedPairingPrompt:](self, "xpcReceivedPairingPrompt:", v8);
  }

- (void)xpcReceivedPairingCompleted:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v5 = 0LL;
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  else
  {
    int v6 = self->_ucat->var0;
  }
}

- (void)xpcReceivedPairingPrompt:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18959FCE0]() == MEMORY[0x1895F9250])
  {
    objc_opt_class();
    CUXPCDecodeObject();
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

  int v7 = self->_ucat->var0;
  if (v7 > 90 || v7 == -1 && !_LogCategory_Initialize())
  {
LABEL_4:

    return;
  }

  LogPrintF_safe();
}

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (!self->_blePeerUUID)
  {
    if (a3) {
      goto LABEL_12;
    }
    return 0;
  }

  id v5 = objc_alloc(&OBJC_CLASS___CBCentralManager);
  dispatchQueue = self->_dispatchQueue;
  uint64_t v21 = @"kCBManagerNeedsRestrictedStateOperation";
  v22[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[CBCentralManager initWithDelegate:queue:options:]( v5,  "initWithDelegate:queue:options:",  self,  dispatchQueue,  v7);
  centralManager = self->_centralManager;
  self->_centralManager = v8;

  uint64_t v10 = self->_centralManager;
  if (!v10)
  {
    if (a3)
    {
LABEL_12:
      NSErrorF_safe();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v18;
      return result;
    }

    return 0;
  }

  if ((self->_connectionFlags & 0x80) != 0 || (unsigned int internalFlags = self->_internalFlags, (internalFlags & 0x100) != 0))
  {
    -[CBManager sharedPairingAgent](v10, "sharedPairingAgent");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setDelegate:self];

    unsigned int internalFlags = self->_internalFlags;
  }

  if ((internalFlags & 0x20) != 0)
  {
    uint64_t v13 = MEMORY[0x1895F87A8];
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __47__CBConnection__startConnectingAndReturnError___block_invoke;
    v20[3] = &unk_189FB1EA0;
    v20[4] = self;
    id v14 = (void *)MEMORY[0x18959F890](v20);
    id xpcForwardMessageReceiveHandler = self->_xpcForwardMessageReceiveHandler;
    self->_id xpcForwardMessageReceiveHandler = v14;

    int v16 = self->_centralManager;
    v19[0] = v13;
    v19[1] = 3221225472LL;
    v19[2] = __47__CBConnection__startConnectingAndReturnError___block_invoke_2;
    v19[3] = &unk_189FB1EA0;
    v19[4] = self;
    -[CBManager setWHBMsgReplyHandler:](v16, "setWHBMsgReplyHandler:", v19);
  }

  -[CBConnection _run](self, "_run");
  return 1;
}

void __47__CBConnection__startConnectingAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 152);
  id v9 = v3;
  if (v5 <= 30)
  {
    if (v5 == -1)
    {
      int v6 = _LogCategory_Initialize();
      uint64_t v4 = *(void *)(a1 + 32);
      if (!v6)
      {
        id v3 = v9;
        goto LABEL_6;
      }

      id v3 = v9;
    }

    id v7 = v3;
    uint64_t v8 = *(void *)(v4 + 24);
    LogPrintF_safe();
    id v3 = v9;
    uint64_t v4 = *(void *)(a1 + 32);
  }

uint64_t __47__CBConnection__startConnectingAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcForwardMessage:a2];
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5 = -[CBL2CAPChannel socketFD](self->_l2capChannel, "socketFD");
  if (v5 < 0)
  {
    if (a3) {
      goto LABEL_11;
    }
    return 0;
  }

  unsigned int v6 = v5;
  self->_int64_t socketFD = v5;
  int v22 = 1;
  if (setsockopt(v5, 0xFFFF, 4130, &v22, 4u) && (!*__error() || *__error()))
  {
    if (a3) {
      goto LABEL_11;
    }
    return 0;
  }

  if (SocketSetNonBlocking())
  {
    if (a3) {
      goto LABEL_11;
    }
    return 0;
  }

  id v7 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B60],  v6,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v7;

  id v9 = self->_readSource;
  if (!v9)
  {
    if (!a3) {
      return 0;
    }
LABEL_11:
    NSErrorF_safe();
    BOOL v15 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v15;
  }

  uint64_t v10 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __39__CBConnection__setupIOAndReturnError___block_invoke;
  handler[3] = &unk_189FB1AE0;
  void handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
  uint64_t v11 = self->_readSource;
  v20[0] = v10;
  v20[1] = 3221225472LL;
  v20[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_2;
  v20[3] = &unk_189FB1AE0;
  v20[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)v11, v20);
  dispatch_resume((dispatch_object_t)self->_readSource);
  uint64_t v12 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B90],  v6,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  writeSource = self->_writeSource;
  self->_writeSource = v12;

  id v14 = self->_writeSource;
  BOOL v15 = v14 != 0LL;
  if (v14)
  {
    v19[0] = v10;
    v19[1] = 3221225472LL;
    v19[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_3;
    v19[3] = &unk_189FB1AE0;
    v19[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v14, v19);
    int v16 = self->_writeSource;
    v18[0] = v10;
    v18[1] = 3221225472LL;
    v18[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_4;
    v18[3] = &unk_189FB1AE0;
    v18[4] = self;
    dispatch_source_set_cancel_handler((dispatch_source_t)v16, v18);
    self->_writeSuspended = 1;
  }

  else if (a3)
  {
    NSErrorF_safe();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_reportError:(id)a3
{
  id v10 = a3;
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  self->_state = 3;
  int v5 = (void (**)(void, void))MEMORY[0x18959F890](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v5)
  {
    ((void (**)(void, id))v5)[2](v5, v10);
  }

  else
  {
    id v7 = (void (**)(void, void))MEMORY[0x18959F890](self->_errorHandler);
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    if (v7) {
      ((void (**)(void, id))v7)[2](v7, v10);
    }
  }

  -[CBConnection _abortReadsWithError:](self, "_abortReadsWithError:", v10, v9);
  -[CBConnection _abortWritesWithError:](self, "_abortWritesWithError:", v10);
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      int state = self->_state;
      switch(state)
      {
        case 0:
          self->_int state = 10;
          if (state != 10) {
            goto LABEL_35;
          }
          return;
        case 10:
          CBManagerState v4 = -[CBManager state](self->_centralManager, "state");
          if (v4 == 10 || v4 == CBManagerStatePoweredOn) {
            goto LABEL_27;
          }
          goto LABEL_34;
        case 11:
          if (!-[CBConnection _runConnectStart](self, "_runConnectStart")) {
            goto LABEL_34;
          }
          goto LABEL_27;
        case 12:
          if (!self->_guardConnected) {
            goto LABEL_34;
          }
          self->_int state = 13;
          if (state == 13) {
            return;
          }
          goto LABEL_35;
        case 13:
          self->_connectedTime = CFAbsoluteTimeGetCurrent();
          goto LABEL_27;
        case 14:
          if (self->_blePSM)
          {
            -[CBPeripheral openL2CAPChannel:](self->_peripheral, "openL2CAPChannel:");
LABEL_27:
            int v6 = self->_state + 1;
            self->_int state = v6;
            if (v6 == state) {
              return;
            }
          }

          else
          {
            self->_int state = 18;
            if (state == 18) {
              return;
            }
          }

- (BOOL)_runConnectStart
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v3 = self->_blePeerUUID;
  centralManager = self->_centralManager;
  v22[0] = v3;
  [MEMORY[0x189603F18] arrayWithObjects:v22 count:1];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 firstObject];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)&self->_peripheral, v7);
    -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", self);
    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v9 = v8;
    clientBundleID = self->_clientBundleID;
    if (clientBundleID) {
      [v8 setObject:clientBundleID forKeyedSubscript:@"kCBConnectOptionClientBundleID"];
    }
    if (self->_clientUseCase)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v11 forKeyedSubscript:@"kCBOptionUsecase"];
    }

    if (self->_useCase)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v12 forKeyedSubscript:@"kCBOptionUsecase"];
    }

    if ((self->_connectionFlags & 0x40) != 0) {
      [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"kCBConnectOptionDoNoDisconnectOnEncryptionFailure"];
    }
    [MEMORY[0x189607968] numberWithInteger:self->_connectionScanDutyCycle];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v13 forKeyedSubscript:@"kCBConnectOptionConnectionScanDutyCycle"];

    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      uint64_t v19 = v3;
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    -[CBCentralManager connectPeripheral:options:]( self->_centralManager,  "connectPeripheral:options:",  v7,  v9,  v19,  v20);
    if (self->_connectTimeoutSeconds > 0.0)
    {
      BOOL v15 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      connectTimeoutTimer = self->_connectTimeoutTimer;
      self->_connectTimeoutTimer = v15;
      int v17 = v15;

      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __32__CBConnection__runConnectStart__block_invoke;
      handler[3] = &unk_189FB1900;
      void handler[4] = v17;
      void handler[5] = self;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet();
      dispatch_activate(v17);
    }
  }

  else
  {
    NSErrorF_safe();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBConnection _reportError:](self, "_reportError:", v9, v3);
  }

  return v7 != 0LL;
}

void __32__CBConnection__runConnectStart__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v8 = *(void **)(a1 + 32);
  if (v8 == *(void **)(*(void *)(a1 + 40) + 40LL))
  {
    if (v8)
    {
      id v10 = v8;
      dispatch_source_cancel(v10);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0LL;
    }

    uint64_t v13 = *(void **)(a1 + 40);
    CBErrorF(-6722, (uint64_t)"Connect timeout", a3, a4, a5, a6, a7, a8, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v13 _reportError:v15];
  }

- (BOOL)_runSetupChannel
{
  id v6 = 0LL;
  BOOL v3 = -[CBConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v6);
  id v4 = v6;
  if (!v3) {
    -[CBConnection _reportError:](self, "_reportError:", v4);
  }

  return v3;
}

- (void)pairingGenerateOOBDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __60__CBConnection_pairingGenerateOOBDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_189FB2B50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __60__CBConnection_pairingGenerateOOBDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairingGenerateOOBDataWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_pairingGenerateOOBDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  id v59 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v51[0] = MEMORY[0x1895F87A8];
  v51[1] = 3221225472LL;
  v51[2] = __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke;
  v51[3] = &unk_189FB1BF8;
  v53 = &v54;
  v51[4] = self;
  id v6 = v4;
  id v52 = v6;
  uint64_t v13 = (void (**)(void))MEMORY[0x18959F890](v51);
  if (self->_invalidateCalled)
  {
    uint64_t v43 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v7, v8, v9, v10, v11, v12, v47);
LABEL_20:
    uint64_t v21 = (CBPeripheral *)v55[5];
    v55[5] = v43;
    goto LABEL_17;
  }

  peripheral = self->_peripheral;
  if (peripheral)
  {
    uint64_t v21 = peripheral;
    goto LABEL_5;
  }

  -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
  uint64_t v21 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    uint64_t v43 = CBErrorF(-6705, (uint64_t)"No peer", v15, v16, v17, v18, v19, v20, v47);
    goto LABEL_20;
  }

uint64_t __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 152LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

void __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7 && !v6) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__CBConnection_pairingSetOOBEnabled_completionHandler___block_invoke;
  block[3] = &unk_189FB4668;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __55__CBConnection_pairingSetOOBEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairingSetOOBEnabled:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  id v49 = 0LL;
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __56__CBConnection__pairingSetOOBEnabled_completionHandler___block_invoke;
  v40[3] = &unk_189FB4690;
  v42 = &v44;
  v40[4] = self;
  BOOL v43 = v4;
  id v7 = v6;
  id v41 = v7;
  uint64_t v14 = (void (**)(void))MEMORY[0x18959F890](v40);
  if (self->_invalidateCalled)
  {
    uint64_t v36 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v8, v9, v10, v11, v12, v13, v39);
    int v22 = (CBPeripheral *)v45[5];
    v45[5] = v36;
    goto LABEL_17;
  }

  peripheral = self->_peripheral;
  if (peripheral)
  {
    int v22 = peripheral;
  }

  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    int v22 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      uint64_t v35 = CBErrorF(-6705, (uint64_t)"No peer", v16, v17, v18, v19, v20, v21, v39);
      int v22 = 0LL;
      goto LABEL_13;
    }
  }

  centralManager = self->_centralManager;
  if (centralManager)
  {
    -[CBManager sharedPairingAgent](centralManager, "sharedPairingAgent");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = v24;
    if (v24)
    {
      [v24 setDelegate:self];
      [v31 setOOBPairingEnabled:1 forPeer:v22];
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        -[CBPeer identifier](v22, "identifier");
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }

    else
    {
      uint64_t v37 = CBErrorF(-6705, (uint64_t)"No pairing agent", v25, v26, v27, v28, v29, v30, v39);
      id v38 = (void *)v45[5];
      v45[5] = v37;
    }

    goto LABEL_16;
  }

  server = self->_server;
  if (!server)
  {
    uint64_t v35 = CBErrorF(-6700, (uint64_t)"No central or server", v16, v17, v18, v19, v20, v21, v39);
LABEL_13:
    uint64_t v31 = (void *)v45[5];
    v45[5] = v35;
LABEL_16:

    goto LABEL_17;
  }

  -[CBServer pairingSetOOBEnabled:peer:completionHandler:]( server,  "pairingSetOOBEnabled:peer:completionHandler:",  v4,  v22,  v7);
LABEL_17:

  v14[2](v14);
  _Block_object_dispose(&v44, 8);
}

uint64_t __56__CBConnection__pairingSetOOBEnabled_completionHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 152LL);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  return result;
}

- (void)pairingPerformAction:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__CBConnection_pairingPerformAction_completionHandler___block_invoke;
  block[3] = &unk_189FB2A70;
  block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__CBConnection_pairingPerformAction_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v9 + 49))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    CBErrorF(-71148, (uint64_t)"Use after invalidate", a3, a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v13);
  }

  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 48);
    if (*(void *)(v9 + 32)) {
      [(id)v9 _pairingPerformActionBLE:v10 withOptions:MEMORY[0x189604A60] completionHandler:*(void *)(a1 + 40)];
    }
    else {
      [(id)v9 _pairingPerformActionClassic:v10 completionHandler:*(void *)(a1 + 40)];
    }
  }

- (void)pairingPerformAction:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __67__CBConnection_pairingPerformAction_withOptions_completionHandler___block_invoke;
  v13[3] = &unk_189FB46B8;
  id v14 = v8;
  id v15 = v9;
  int v16 = a3;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(dispatchQueue, v13);
}

void __67__CBConnection_pairingPerformAction_withOptions_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v9 + 49))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    CBErrorF(-71148, (uint64_t)"Use after invalidate", a3, a4, a5, a6, a7, a8, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v15);
  }

  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    if (*(void *)(v9 + 32)) {
      [(id)v9 _pairingPerformActionBLE:v10 withOptions:v11 completionHandler:v12];
    }
    else {
      [(id)v9 _pairingPerformActionClassic:v10 withOptions:v11 completionHandler:v12];
    }
  }

- (void)_pairingPerformActionBLE:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  id v59 = 0LL;
  uint64_t v46 = MEMORY[0x1895F87A8];
  uint64_t v47 = 3221225472LL;
  v48 = __71__CBConnection__pairingPerformActionBLE_withOptions_completionHandler___block_invoke;
  id v49 = &unk_189FB46E0;
  id v52 = &v54;
  id v50 = self;
  int v53 = a3;
  id v10 = v9;
  id v51 = v10;
  uint64_t v11 = (void (**)(void))MEMORY[0x18959F890](&v46);
  -[CBManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    uint64_t v25 = self->_peripheral;
    if (v25)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v27 = -[CBPeer identifier](v25, "identifier");
        uint64_t v28 = (void *)v27;
        else {
          uint64_t v29 = off_189FB47C0[a3];
        }
        uint64_t v44 = v27;
        uint64_t v45 = v29;
        LogPrintF_safe();
      }

      id v30 = objc_alloc_init(MEMORY[0x189603FC8]);
      if ([v8 count])
      {
        uint64_t v37 = (void *)MEMORY[0x189607968];
        [v8 objectForKeyedSubscript:@"kCBMsgArgPairingPasskey"];
        id v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "integerValue"));
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 setObject:v39 forKeyedSubscript:@"kCBMsgArgPairingPasskey"];
      }

      if ((a3 - 1) > 2)
      {
        uint64_t v40 = CBErrorF(-6705, (uint64_t)"Bad pairing action", v31, v32, v33, v34, v35, v36, v44);
        id v41 = (void *)v55[5];
        v55[5] = v40;
      }

      else
      {
        objc_msgSend( v18,  "respondToPairingRequest:type:accept:data:",  v25,  self->_pairingType,  (((_BYTE)a3 - 1) & 7) == 0,  v30,  v44,  v45,  v46,  v47,  v48,  v49,  v50);
        if (v10) {
          (*((void (**)(id, void))v10 + 2))(v10, 0LL);
        }
      }
    }

    else
    {
      uint64_t v43 = CBErrorF(-6705, (uint64_t)"No peripheral", v19, v20, v21, v22, v23, v24, v44);
      id v30 = (id)v55[5];
      v55[5] = v43;
    }
  }

  else
  {
    uint64_t v42 = CBErrorF(-6705, (uint64_t)"No pairing agent", v12, v13, v14, v15, v16, v17, v44);
    uint64_t v25 = (CBPeripheral *)v55[5];
    v55[5] = v42;
  }

  v11[2](v11);
  _Block_object_dispose(&v54, 8);
}

uint64_t __71__CBConnection__pairingPerformActionBLE_withOptions_completionHandler___block_invoke( uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL))
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = *(void *)(result + 32);
    int v3 = **(_DWORD **)(v2 + 152);
    if (v3 <= 90)
    {
      if (v3 != -1)
      {
LABEL_4:
        [*(id *)(v2 + 304) identifier];
        BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        uint64_t result = v1[5];
        if (!result) {
          return result;
        }
        return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(void *)(*(void *)(v1[6] + 8LL) + 40LL));
      }

      if (_LogCategory_Initialize())
      {
        uint64_t v2 = v1[4];
        goto LABEL_4;
      }
    }

    uint64_t result = v1[5];
    if (!result) {
      return result;
    }
    return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(void *)(*(void *)(v1[6] + 8LL) + 40LL));
  }

  return result;
}

- (void)_pairingPerformActionClassic:(int)a3 completionHandler:(id)a4
{
  uint64_t v12 = (void (**)(id, void *))a4;
  if (a3 == 1)
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    if (a3 == 3)
    {
      uint64_t v13 = "User canceled pairing";
      int v14 = -6723;
    }

    else
    {
      if (a3 != 2)
      {
        CBErrorF(-6705, (uint64_t)"Bad pairing action", v6, v7, v8, v9, v10, v11, v20);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v15);
        goto LABEL_10;
      }

      uint64_t v13 = "User rejected pairing";
      int v14 = -71146;
    }

    CBErrorF(v14, (uint64_t)v13, v6, v7, v8, v9, v10, v11, v20);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v16, "mTyp", "CnPC");
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___CBPairingInfo);
  -[CBPairingInfo setDevice:](v17, "setDevice:", self->_peerDevice);
  -[CBPairingInfo setError:](v17, "setError:", v15);
  CUXPCEncodeObject();
  -[CBConnection _ensureXPCStarted](self, "_ensureXPCStarted");
  uint64_t v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __63__CBConnection__pairingPerformActionClassic_completionHandler___block_invoke;
  handler[3] = &unk_189FB2B28;
  uint64_t v22 = v12;
  xpc_connection_send_message_with_reply(v18, v16, dispatchQueue, handler);

LABEL_10:
}

void __63__CBConnection__pairingPerformActionClassic_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_pairingPerformActionClassic:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  uint64_t v15 = (void (**)(id, void *))a5;
  if (a3 == 1)
  {
    uint64_t v18 = 0LL;
  }

  else
  {
    if (a3 == 3)
    {
      xpc_object_t v16 = "User canceled pairing";
      int v17 = -6723;
    }

    else
    {
      if (a3 != 2)
      {
        CBErrorF(-6705, (uint64_t)"Bad pairing action", v9, v10, v11, v12, v13, v14, v24);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, v18);
        goto LABEL_12;
      }

      xpc_object_t v16 = "User rejected pairing";
      int v17 = -71146;
    }

    CBErrorF(v17, (uint64_t)v16, v9, v10, v11, v12, v13, v14, v24);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v19, "mTyp", "CnPC");
  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___CBPairingInfo);
  -[CBPairingInfo setDevice:](v20, "setDevice:", self->_peerDevice);
  -[CBPairingInfo setError:](v20, "setError:", v18);
  if (v8)
  {
    [v8 objectForKeyedSubscript:@"kCBMsgArgPairingPasskey"];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPairingInfo setPin:](v20, "setPin:", v21);
  }

  CUXPCEncodeObject();
  -[CBConnection _ensureXPCStarted](self, "_ensureXPCStarted");
  uint64_t v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __75__CBConnection__pairingPerformActionClassic_withOptions_completionHandler___block_invoke;
  handler[3] = &unk_189FB2B28;
  uint64_t v26 = v15;
  xpc_connection_send_message_with_reply(v22, v19, dispatchQueue, handler);

LABEL_12:
}

void __75__CBConnection__pairingPerformActionClassic_withOptions_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)pairWithOOBData:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __32__CBConnection_pairWithOOBData___block_invoke;
  v7[3] = &unk_189FB1900;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __32__CBConnection_pairWithOOBData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairWithOOBData:*(void *)(a1 + 40)];
}

- (void)_pairWithOOBData:(id)a3
{
  id v5 = a3;
  uint64_t v37 = 0LL;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  uint64_t v40 = __Block_byref_object_copy__3;
  id v41 = __Block_byref_object_dispose__3;
  id v42 = 0LL;
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = __33__CBConnection__pairWithOOBData___block_invoke;
  v36[3] = &unk_189FB1C20;
  v36[4] = self;
  v36[5] = &v37;
  uint64_t v12 = (void (**)(void))MEMORY[0x18959F890](v36);
  if (self->_invalidateCalled)
  {
    uint64_t v30 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v6, v7, v8, v9, v10, v11, v34);
    xpc_object_t v19 = (CBPeripheral *)v38[5];
    v38[5] = v30;
  }

  else
  {
    xpc_object_t v19 = self->_peripheral;
    if (v19)
    {
      -[CBManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v20;
      if (v20)
      {
        [v20 setDelegate:self];
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          -[CBPeer identifier](v19, "identifier");
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSDataHex();
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();
        }

        objc_storeStrong((id *)&self->_pairingOOBData, a3);
        [v27 pairPeer:v19];
      }

      else
      {
        uint64_t v32 = CBErrorF(-6705, (uint64_t)"No pairing agent", v21, v22, v23, v24, v25, v26, v34);
        uint64_t v33 = (void *)v38[5];
        v38[5] = v32;
      }
    }

    else
    {
      uint64_t v31 = CBErrorF(-6705, (uint64_t)"No peer", v13, v14, v15, v16, v17, v18, v34);
      uint64_t v27 = (void *)v38[5];
      v38[5] = v31;
    }
  }

  v12[2](v12);
  _Block_object_dispose(&v37, 8);
}

void __33__CBConnection__pairWithOOBData___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

- (void)readWithCBReadRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__CBConnection_readWithCBReadRequest___block_invoke;
  v7[3] = &unk_189FB1900;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __38__CBConnection_readWithCBReadRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 49))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorF_safe();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeReadRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 104) addObject:*(void *)(a1 + 40)];
    id v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0) {
      [v4 _processReads:0];
    }
  }

- (void)_processReads:(BOOL)a3
{
  BOOL v27 = a3;
  int v4 = 0;
  p_readRequestCurrent = &self->_readRequestCurrent;
  id v6 = &OBJC_IVAR___CBReadRequest__length;
  uint64_t v28 = &self->_readRequestCurrent;
  do
  {
    uint64_t v7 = *p_readRequestCurrent;
    if (!v7)
    {
      uint64_t v8 = -[NSMutableArray firstObject](self->_readRequests, "firstObject");
      if (v8)
      {
        obja = (CBReadRequest *)v8;
        -[NSMutableArray removeObjectAtIndex:](self->_readRequests, "removeObjectAtIndex:", 0LL);
        -[CBConnection _prepareReadRequest:](self, "_prepareReadRequest:", obja);
        objc_storeStrong((id *)p_readRequestCurrent, obja);
        uint64_t v7 = obja;
        goto LABEL_5;
      }

      if (!v27) {
        goto LABEL_31;
      }
      if (v4)
      {
        if (!self->_readSuspended) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }

      if (-[CBConnection _processReadStatus](self, "_processReadStatus"))
      {
        if (!self->_readSuspended)
        {
          self->_readSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_readSource);
          uint64_t v20 = 0LL;
LABEL_18:

          return;
        }
      }

      else if (self->_readSuspended)
      {
LABEL_30:
        self->_readSuspended = 0;
        dispatch_resume((dispatch_object_t)self->_readSource);
        uint64_t v20 = 0LL;
        goto LABEL_18;
      }

- (void)_prepareReadRequest:(id)a3
{
  uint64_t v10 = a3;
  int v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithLength:", objc_msgSend(v10, "maxLength"));
  [v10 setBufferData:v4];

  id v5 = [v10 bufferData];
  v10[1] = [v5 mutableBytes];

  [v10 bufferData];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setData:v6];

  v10[3] = 0LL;
  uint64_t v7 = (void *)v10[2];
  v10[2] = 0LL;

  int var0 = self->_ucat->var0;
  if (var0 > 9) {
    goto LABEL_6;
  }
  uint64_t v9 = v10;
  if (var0 == -1)
  {
    if (_LogCategory_Initialize())
    {
      uint64_t v9 = v10;
      goto LABEL_3;
    }

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  id v6 = self->_readRequestCurrent;
  if (v6)
  {
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0LL;

    -[CBConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v6, v4);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v8 = self->_readRequests;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = v6;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v6 = (CBReadRequest *)*(id *)(*((void *)&v18 + 1) + 8 * v12);

        -[CBConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v6, v4);
        ++v12;
        uint64_t v13 = v6;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v10);
  }

  -[NSMutableArray removeAllObjects](self->_readRequests, "removeAllObjects");
  readSource = (dispatch_object_s *)self->_readSource;
  if (readSource && !self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend(readSource);
  }

  uint64_t v15 = (void (**)(void, void))MEMORY[0x18959F890](self->_errorHandler);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0LL;

  if (v15) {
    ((void (**)(void, id))v15)[2](v15, v4);
  }
  -[CBConnection _invalidated](self, "_invalidated", v17);
}

- (BOOL)_processReadStatus
{
  do
  {
    char v12 = 0;
    ssize_t v3 = recv(self->_socketFD, &v12, 1uLL, 2);
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (!v3)
      {
        uint64_t v9 = (void (**)(void, void))MEMORY[0x18959F890](self->_errorHandler);
        id errorHandler = self->_errorHandler;
        self->_id errorHandler = 0LL;

        if (v9)
        {
          NSErrorF_safe();
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void *))v9)[2](v9, v11);
        }

        return 1;
      }

      return 1;
    }

    if (!*__error()) {
      goto LABEL_9;
    }
    int v4 = *__error();
  }

  while (v4 == 4);
  if (!v4) {
    return 1;
  }
  if (v4 == 35) {
    return 0;
  }
LABEL_9:
  id v6 = (void (**)(void, void))MEMORY[0x18959F890](self->_errorHandler);
  id v7 = self->_errorHandler;
  self->_id errorHandler = 0LL;

  if (v6)
  {
    NSErrorF_safe();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v6)[2](v6, v8);
  }

  return 1;
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  char v12 = a3;
  id v6 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 9)
  {
    uint64_t v8 = v12;
    if (var0 != -1)
    {
LABEL_3:
      [v8 length];
      CUPrintNSError();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      goto LABEL_5;
    }

    if (_LogCategory_Initialize())
    {
      uint64_t v8 = v12;
      goto LABEL_3;
    }
  }

- (void)writeWithCBWriteRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__CBConnection_writeWithCBWriteRequest___block_invoke;
  v7[3] = &unk_189FB1900;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __40__CBConnection_writeWithCBWriteRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 49))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorF_safe();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeWriteRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 144) addObject:*(void *)(a1 + 40)];
    id v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0) {
      [v4 _processWrites];
    }
  }

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___CBWriteRequest);
  -[CBWriteRequest setEndOfData:](v5, "setEndOfData:", 1LL);
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    uint64_t v7 = 3221225472LL;
    id v8 = __45__CBConnection_writeEndOfDataWithCompletion___block_invoke;
    uint64_t v9 = &unk_189FB1950;
    uint64_t v10 = v5;
    id v11 = v4;
    -[CBWriteRequest setCompletion:](v5, "setCompletion:", &v6);
  }

  -[CBConnection writeWithCBWriteRequest:](self, "writeWithCBWriteRequest:", v5, v6, v7, v8, v9);
}

void __45__CBConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_processWrites
{
  p_writeRequestCurrent = &self->_writeRequestCurrent;
  id v4 = &OBJC_IVAR___CBWriteRequest__ion;
  int v5 = 4;
  uint64_t v23 = &self->_writeRequestCurrent;
  do
  {
    id v8 = *p_writeRequestCurrent;
    if (!v8)
    {
      uint64_t v15 = -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      if (!v15)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }

        id v8 = 0LL;
        goto LABEL_35;
      }

      id v8 = (CBWriteRequest *)v15;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0LL);
      id v24 = 0LL;
      -[CBConnection _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v8, &v24);
      id v16 = v24;
      if (v16)
      {
        uint64_t v6 = v16;
        goto LABEL_4;
      }

      objc_storeStrong((id *)p_writeRequestCurrent, v8);
    }

    uint64_t v9 = *(unsigned int *)((char *)&v8->super.isa + *v4);
    int v10 = SocketWriteData();
    int var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      char v12 = v4;
      uint64_t v13 = *(unsigned int *)((char *)&v8->super.isa + *v4);
      uint64_t socketFD = self->_socketFD;
      CUPrintErrorCode();
      uint64_t v21 = v13;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v4 = v12;
      uint64_t v19 = socketFD;
      uint64_t v20 = v9;
      LogPrintF_safe();

      p_writeRequestCurrent = v23;
    }

    if (v10)
    {
      if (v10 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }

      else
      {
        NSErrorF_safe();
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBConnection _abortWritesWithError:](self, "_abortWritesWithError:", v18);
      }

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  int v5 = (char *)a3;
  [v5 dataArray];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 count];
  if (v7 >= 0x11)
  {
    if (a4)
    {
      NSErrorF_safe();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v8 = v5 + 16;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v34 + 1) + 8 * i);
          *(void *)id v8 = [v14 bytes];
          *((void *)v8 + 1) = [v14 length];
          v8 += 16;
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }

      while (v11);
    }

    *((void *)v5 + 34) = v5 + 16;
    *((_DWORD *)v5 + 70) = (unint64_t)(v8 - v5 - 16) >> 4;
    *((void *)v5 + 36) = 0LL;
    uint64_t v15 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = 0LL;

    if (gLogCategory_CBConnection <= 9 && (gLogCategory_CBConnection != -1 || _LogCategory_Initialize()))
    {
      int v16 = *((_DWORD *)v5 + 70);
      if (v16)
      {
        uint64_t v17 = *((void *)v5 + 34);
        unint64_t v18 = (v16 - 1LL) & 0xFFFFFFFFFFFFFFFLL;
        if (v18 >= 4)
        {
          unint64_t v21 = v18 + 1;
          uint64_t v22 = v21 & 3;
          if ((v21 & 3) == 0) {
            uint64_t v22 = 4LL;
          }
          unint64_t v23 = v21 - v22;
          uint64_t v20 = v17 + 16 * v23;
          id v24 = (const double *)(v17 + 40);
          int64x2_t v25 = 0uLL;
          int64x2_t v26 = 0uLL;
          do
          {
            BOOL v27 = v24 - 4;
            unsigned __int128 v28 = (unsigned __int128)vld2q_f64(v27);
            unsigned __int128 v29 = (unsigned __int128)vld2q_f64(v24);
            int64x2_t v25 = vaddq_s64((int64x2_t)v28, v25);
            int64x2_t v26 = vaddq_s64((int64x2_t)v29, v26);
            v24 += 8;
            v23 -= 4LL;
          }

          while (v23);
          uint64_t v19 = vaddvq_s64(vaddq_s64(v26, v25));
        }

        else
        {
          uint64_t v19 = 0LL;
          uint64_t v20 = *((void *)v5 + 34);
        }

        uint64_t v30 = v17 + 16LL * v16;
        do
        {
          v19 += *(void *)(v20 + 8);
          v20 += 16LL;
        }

        while (v20 != v30);
      }

      int var0 = self->_ucat->var0;
    }
  }

  return v7 < 0x11;
}

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

  uint64_t v6 = self->_writeRequestCurrent;
  if (v6)
  {
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0LL;

    -[CBConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v6, v4);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = self->_writeRequests;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = v6;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v6 = (CBWriteRequest *)*(id *)(*((void *)&v18 + 1) + 8 * v12);

        -[CBConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v6, v4);
        ++v12;
        uint64_t v13 = v6;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v10);
  }

  -[NSMutableArray removeAllObjects](self->_writeRequests, "removeAllObjects");
  writeSource = (dispatch_object_s *)self->_writeSource;
  if (writeSource && !self->_writeSuspended)
  {
    self->_writeSuspended = 1;
    dispatch_suspend(writeSource);
  }

  uint64_t v15 = (void (**)(void, void))MEMORY[0x18959F890](self->_errorHandler);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0LL;

  if (v15) {
    ((void (**)(void, id))v15)[2](v15, v4);
  }
  -[CBConnection _invalidated](self, "_invalidated", v17);
}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v11 = a3;
  id v6 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

  id v8 = (void *)v11[1];
  v11[1] = v6;

  [v11 completion];
  uint64_t v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  [v11 setCompletion:0];
  if (v9) {
    v9[2](v9);
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
LABEL_2:
  }

  else
  {
    uint64_t v4 = [v7 state];
    int var0 = self->_ucat->var0;
    switch(v4)
    {
      case 1LL:
      case 4LL:
        NSErrorF_safe();
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBConnection _reportError:](self, "_reportError:", v6);

        break;
      case 5LL:
      case 10LL:
        -[CBConnection _run](self, "_run");

        break;
      default:
        goto LABEL_2;
    }
  }

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    [v6 identifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    uint64_t v9 = v7;
    uint64_t v10 = blePeerUUID;
    if (v9 != v10)
    {
      uint64_t v11 = v10;
      if ((v9 == 0LL) != (v10 != 0LL))
      {
        char v12 = -[NSUUID isEqual:](v9, "isEqual:", v10);

        if ((v12 & 1) != 0)
        {
          int var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_15;
          }
          goto LABEL_8;
        }
      }

      else
      {
      }

      int v14 = self->_ucat->var0;
      goto LABEL_26;
    }

    int var0 = self->_ucat->var0;
    if (var0 > 30)
    {
LABEL_15:
      connectTimeoutTimer = self->_connectTimeoutTimer;
      if (connectTimeoutTimer)
      {
        int v16 = connectTimeoutTimer;
        dispatch_source_cancel(v16);
        uint64_t v17 = self->_connectTimeoutTimer;
        self->_connectTimeoutTimer = 0LL;
      }

      int64_t connectionLatency = self->_connectionLatency;
      if (connectionLatency != -99)
      {
        int v19 = self->_ucat->var0;
        if (v19 <= 30
          && (v19 != -1 || (int v20 = _LogCategory_Initialize(), connectionLatency = self->_connectionLatency, v20)))
        {
          uint64_t v23 = CBCentralManagerConnectionLatencyToString(connectionLatency);
          LogPrintF_safe();
          objc_msgSend(v24, "setDesiredConnectionLatency:forPeripheral:", self->_connectionLatency, v6, v9, v23);
        }

        else
        {
          objc_msgSend(v24, "setDesiredConnectionLatency:forPeripheral:", connectionLatency, v6, v21, v22);
        }
      }

      self->_guardConnected = 1;
      -[CBConnection _run](self, "_run", v21);
LABEL_26:

      goto LABEL_27;
    }

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    [v19 identifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    uint64_t v10 = v8;
    uint64_t v11 = blePeerUUID;
    if (v10 != v11)
    {
      char v12 = v11;
      if ((v10 == 0LL) != (v11 != 0LL))
      {
        char v13 = -[NSUUID isEqual:](v10, "isEqual:", v11);

        if ((v13 & 1) != 0)
        {
          int var0 = self->_ucat->var0;
          if (var0 > 90)
          {
LABEL_15:
            if (v7)
            {
              -[CBConnection _reportError:](self, "_reportError:", v7);
            }

            else
            {
              NSErrorF_safe();
              int v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[CBConnection _reportError:](self, "_reportError:", v16);
            }

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  v64[1] = *MEMORY[0x1895F89C0];
  id v49 = a3;
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v50 = v10;
  [v10 identifier];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = 0LL;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  v58 = __Block_byref_object_copy__3;
  id v59 = __Block_byref_object_dispose__3;
  id v60 = 0LL;
  v51[0] = MEMORY[0x1895F87A8];
  v51[1] = 3221225472LL;
  v51[2] = __64__CBConnection_pairingAgent_peerDidRequestPairing_type_passkey___block_invoke;
  v51[3] = &unk_189FB4708;
  v51[4] = self;
  void v51[5] = v12;
  int v53 = &v55;
  int64_t v54 = a5;
  id v13 = v11;
  id v52 = v13;
  int v14 = (void (**)(void))MEMORY[0x18959F890](v51);
  -[CBPeer identifier](self->_peripheral, "identifier");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }

  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 identifier];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (([v12 isEqual:v17] & 1) == 0)
  {
    uint64_t v44 = CBErrorF(-6727, (uint64_t)"peer not found", v19, v20, v21, v22, v23, v24, v45);
    uint64_t v31 = (NSData *)v56[5];
    v56[5] = v44;
    goto LABEL_47;
  }

  uint64_t v31 = self->_pairingOOBData;
  int var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    if (var0 == -1)
    {
      if ((unint64_t)a5 <= 5)
      {
LABEL_8:
        uint64_t v33 = off_189FB4838[a5];
        if (v31)
        {
LABEL_9:
          CUPrintNSDataHex();
          __int128 v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }

void __64__CBConnection_pairingAgent_peerDidRequestPairing_type_passkey___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  [v6 identifier];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  -[CBPeer identifier](self->_peripheral, "identifier");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }

  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identifier];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  char v11 = [v17 isEqual:v9];
  int var0 = self->_ucat->var0;
  if ((v11 & 1) != 0)
  {
    pairingOOBint Data = self->_pairingOOBData;
    self->_pairingOOBint Data = 0LL;

    int v14 = (void (**)(void, void, void))MEMORY[0x18959F890](self->_pairingCompletedHandler);
    if (v14)
    {
      int v15 = self->_peerDevice;
      if (!v15)
      {
        int v15 = objc_alloc_init(&OBJC_CLASS___CBDevice);
        [v17 UUIDString];
        int v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBDevice setIdentifier:](v15, "setIdentifier:", v16);
      }

      ((void (**)(void, CBDevice *, void))v14)[2](v14, v15, 0LL);
    }
  }

  else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v21 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  [v8 identifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBPeer identifier](self->_peripheral, "identifier");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }

  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 identifier];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  char v14 = [v9 isEqual:v12];
  int var0 = self->_ucat->var0;
  if ((v14 & 1) != 0)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

    pairingOOBint Data = self->_pairingOOBData;
    self->_pairingOOBint Data = 0LL;

    id v17 = (void (**)(void, void, void))MEMORY[0x18959F890](self->_pairingCompletedHandler);
    if (v17)
    {
      __int128 v18 = self->_peerDevice;
      if (!v18)
      {
        __int128 v18 = objc_alloc_init(&OBJC_CLASS___CBDevice);
        [v9 UUIDString];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBDevice setIdentifier:](v18, "setIdentifier:", v19);
      }

      ((void (**)(void, CBDevice *, id))v17)[2](v17, v18, v21);
    }
  }

  else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  [v6 identifier];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CBPeer identifier](self->_peripheral, "identifier");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }

  else
  {
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identifier];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  char v11 = [v13 isEqual:v9];
  int var0 = self->_ucat->var0;
  if ((v11 & 1) != 0)
  {
LABEL_7:
    LogPrintF_safe();
    goto LABEL_9;
  }

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_25;
  }
  if (!self->_l2capChannel)
  {
    [v28 identifier];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    blePeerUUID = self->_blePeerUUID;
    char v14 = v12;
    int v15 = blePeerUUID;
    if (v14 == v15)
    {
    }

    else
    {
      int v16 = v15;
      if ((v14 == 0LL) == (v15 != 0LL))
      {

LABEL_18:
        int var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          [v28 identifier];
          char v11 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSError();
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          goto LABEL_24;
        }

        goto LABEL_25;
      }

      char v17 = -[NSUUID isEqual:](v14, "isEqual:", v15);

      if ((v17 & 1) == 0) {
        goto LABEL_18;
      }
    }

    int v18 = self->_ucat->var0;
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v26 = uint64_t v25 = v8;
      LogPrintF_safe();
    }

    if (v9)
    {
      NSErrorNestedF();
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBConnection _reportError:](self, "_reportError:", v11);
      goto LABEL_24;
    }

    id v20 = v8;
    char v11 = v20;
    if (!v20)
    {
      NSErrorF_safe();
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBConnection _reportError:](self, "_reportError:", v23);

      goto LABEL_24;
    }

    if ([v20 PSM] == self->_blePSM)
    {
      objc_storeStrong((id *)&self->_l2capChannel, a4);
      int v21 = self->_ucat->var0;
      if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v11, "peer", v25, v26);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 identifier];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v11 PSM];
        LogPrintF_safe();
      }

      -[CBConnection _run](self, "_run", v25, v26);
      goto LABEL_24;
    }

    int v24 = self->_ucat->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize())
    {
LABEL_24:

      goto LABEL_25;
    }

    objc_msgSend(v11, "PSM", v25, v26);
LABEL_6:
    LogPrintF_safe();
    goto LABEL_24;
  }

  int v10 = self->_ucat->var0;
  if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(&OBJC_CLASS___CBReadRequest);
  -[CBReadRequest setMinLength:](v5, "setMinLength:", [v4 minLength]);
  -[CBReadRequest setMaxLength:](v5, "setMaxLength:", [v4 maxLength]);
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v8 = 3221225472LL;
  id v9 = __32__CBConnection_readWithRequest___block_invoke;
  int v10 = &unk_189FB1900;
  id v11 = v4;
  id v12 = v5;
  id v6 = v4;
  -[CBReadRequest setCompletion:](v5, "setCompletion:", &v7);
  -[CBConnection readWithCBReadRequest:](self, "readWithCBReadRequest:", v5, v7, v8, v9, v10);
}

void __32__CBConnection_readWithRequest___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setData:v2];

  uint64_t v3 = [*(id *)(a1 + 40) error];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (int)*MEMORY[0x18960EDD8];
  id v6 = *(void **)(v4 + v5);
  *(void *)(v4 + v5) = v3;

  uint64_t v7 = [*(id *)(a1 + 40) length];
  *(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x18960EDE0]) = v7;
  [*(id *)(a1 + 32) completion];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setCompletion:0];
  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    uint64_t v8 = v9;
  }
}

- (void)writeWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___CBWriteRequest);
  [v4 dataArray];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBWriteRequest setDataArray:](v5, "setDataArray:", v6);

  -[CBWriteRequest setEndOfData:](v5, "setEndOfData:", [v4 endOfData]);
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  int v10 = __33__CBConnection_writeWithRequest___block_invoke;
  id v11 = &unk_189FB1900;
  id v12 = v4;
  id v13 = v5;
  id v7 = v4;
  -[CBWriteRequest setCompletion:](v5, "setCompletion:", &v8);
  -[CBConnection writeWithCBWriteRequest:](self, "writeWithCBWriteRequest:", v5, v8, v9, v10, v11);
}

void __33__CBConnection_writeWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) error];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (int)*MEMORY[0x18960EDE8];
  uint64_t v5 = *(void **)(v3 + v4);
  *(void *)(v3 + v4) = v2;

  [*(id *)(a1 + 32) completion];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setCompletion:0];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
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

- (id)pairingCompletedHandler
{
  return self->_pairingCompletedHandler;
}

- (void)setPairingCompletedHandler:(id)a3
{
}

- (id)pairingPromptHandler
{
  return self->_pairingPromptHandler;
}

- (void)setPairingPromptHandler:(id)a3
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

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_uint64_t useCase = a3;
}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (void)setUseCaseClientIDs:(id)a3
{
}

- (unsigned)blePSM
{
  return self->_blePSM;
}

- (void)setBlePSM:(unsigned __int16)a3
{
  self->_uint64_t blePSM = a3;
}

- (unsigned)connectionFlags
{
  return self->_connectionFlags;
}

- (void)setConnectionFlags:(unsigned int)a3
{
  self->_uint64_t connectionFlags = a3;
}

- (int64_t)connectionLatency
{
  return self->_connectionLatency;
}

- (void)setConnectionLatency:(int64_t)a3
{
  self->_int64_t connectionLatency = a3;
}

- (int64_t)connectionScanDutyCycle
{
  return self->_connectionScanDutyCycle;
}

- (void)setConnectionScanDutyCycle:(int64_t)a3
{
  self->_connectionScanDutyCycle = a3;
}

- (double)connectTimeoutSeconds
{
  return self->_connectTimeoutSeconds;
}

- (void)setConnectTimeoutSeconds:(double)a3
{
  self->_double connectTimeoutSeconds = a3;
}

- (CBDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (unsigned)serviceFlags
{
  return self->_serviceFlags;
}

- (void)setServiceFlags:(unsigned int)a3
{
  self->_uint64_t serviceFlags = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (int64_t)clientUseCase
{
  return self->_clientUseCase;
}

- (void)setClientUseCase:(int64_t)a3
{
  self->_clientUseCase = a3;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (double)connectedTime
{
  return self->_connectedTime;
}

- (void)setConnectedTime:(double)a3
{
  self->_connectedTime = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_unsigned int internalFlags = a3;
}

- (CBL2CAPChannel)l2capChannel
{
  return self->_l2capChannel;
}

- (void)setL2capChannel:(id)a3
{
}

- (CBServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (void)setServerInvalidationHandler:(id)a3
{
}

- (NSArray)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (void)setServiceUUIDs:(id)a3
{
}

- (id)xpcForwardMessageReceiveHandler
{
  return self->_xpcForwardMessageReceiveHandler;
}

- (void)setXpcForwardMessageReceiveHandler:(id)a3
{
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (id)xpcSendEventHandler
{
  return self->_xpcSendEventHandler;
}

- (void)setXpcSendEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end