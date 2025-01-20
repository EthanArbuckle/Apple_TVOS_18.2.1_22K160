@interface CUBLEConnection
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_processReadStatus;
- (BOOL)_runConnectStart;
- (BOOL)_runSetupChannel;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingAndReturnError:(id *)a3;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (CBL2CAPChannel)l2capChannel;
- (CUBLEConnection)init;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)label;
- (NSUUID)destinationUUID;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)serverInvalidationHandler;
- (int)connectionLatency;
- (int64_t)clientUseCase;
- (unsigned)destinationPSM;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads:(BOOL)a3;
- (void)_processWrites;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)activateWithCompletion:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)readWithRequest:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientUseCase:(int64_t)a3;
- (void)setConnectionLatency:(int)a3;
- (void)setDestinationPSM:(unsigned __int16)a3;
- (void)setDestinationUUID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setL2capChannel:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUBLEConnection

- (CUBLEConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUBLEConnection;
  v2 = -[CUBLEConnection init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUBLEConnection;
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
  v4.super_class = (Class)&OBJC_CLASS___CUBLEConnection;
  -[CUBLEConnection dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  int v20 = 12;
  v3 = self->_label;
  objc_super v4 = v3;
  objc_super v5 = "-";
  id v19 = 0LL;
  if (!v3) {
    objc_super v5 = "";
  }
  v6 = &stru_189F34A78;
  if (v3) {
    v6 = (const __CFString *)v3;
  }
  v15 = v5;
  v16 = v6;
  CUAppendF(&v19, &v20);
  id v7 = v19;
  destinationUUID = self->_destinationUUID;
  if (destinationUUID)
  {
    v9 = destinationUUID;
LABEL_8:
    id v18 = v7;
    CUAppendF(&v18, &v20);
    id v11 = v18;

    id v7 = v11;
    goto LABEL_9;
  }
  v10 = -[CBL2CAPChannel peer](self->_l2capChannel, "peer", v15, v16);
  [v10 identifier];
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    goto LABEL_8;
  }
LABEL_9:
  if (self->_destinationPSM || -[CBL2CAPChannel PSM](self->_l2capChannel, "PSM"))
  {
    id v17 = v7;
    CUAppendF(&v17, &v20);
    id v12 = v17;

    id v7 = v12;
  }

  id v13 = v7;

  return (NSString *)v13;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__CUBLEConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  l2capChannel = self->_l2capChannel;
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (l2capChannel)
  {
    if (var0 > 30) {
      goto LABEL_9;
    }
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_9:
        id v40 = 0LL;
        BOOL v18 = -[CUBLEConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v40);
        writeRequests = (NSMutableArray *)v40;
        if (v18)
        {
          v24 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
          id activateCompletion = self->_activateCompletion;
          self->_id activateCompletion = 0LL;

          if (v24) {
            v24[2](v24, 0LL);
          }

          goto LABEL_18;
        }

        v26 = self->_ucat;
        if (v26->var0 <= 90)
        {
          if (v26->var0 != -1)
          {
LABEL_15:
            LogPrintF( (uint64_t)v26,  (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]",  0x5Au,  (uint64_t)"### Activate failed: %{error}\n",  v19,  v20,  v21,  v22,  (char)writeRequests);
            goto LABEL_23;
          }

          if (_LogCategory_Initialize((uint64_t)v26, 0x5Au))
          {
            v26 = self->_ucat;
            goto LABEL_15;
          }
        }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CUBLEConnection_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _invalidate]",  0x1Eu,  (uint64_t)"Invalidating\n",  v2,  v3,  v4,  v5,  v14);
  }

- (void)_invalidated
{
  if (!self->_invalidateDone
    && !self->_readSource
    && !self->_writeSource
    && !self->_readRequestCurrent
    && !-[NSMutableArray count](self->_readRequests, "count")
    && !self->_writeRequestCurrent
    && !-[NSMutableArray count](self->_writeRequests, "count"))
  {
    serverInvalidationHandler = (void (**)(void))self->_serverInvalidationHandler;
    if (serverInvalidationHandler) {
      serverInvalidationHandler[2]();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id v7 = self->_serverInvalidationHandler;
    self->_serverInvalidationHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_14:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v8,  v9,  v10,  v11,  v13);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_14;
      }
    }
  }

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!self->_destinationUUID)
  {
    if (!a3) {
      return 0;
    }
LABEL_8:
    uint64_t v12 = 4294960591LL;
LABEL_9:
    NSErrorWithOSStatusF((const char *)v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v13;
    return result;
  }

  if (!self->_destinationPSM)
  {
    if (!a3) {
      return 0;
    }
    goto LABEL_8;
  }

  id v5 = objc_alloc(getCBCentralManagerClass());
  dispatchQueue = self->_dispatchQueue;
  getCBManagerNeedsRestrictedStateOperation();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v14 = v7;
  v15[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (CBCentralManager *)[v5 initWithDelegate:self queue:dispatchQueue options:v8];
  centralManager = self->_centralManager;
  self->_centralManager = v9;

  if (self->_centralManager)
  {
    -[CUBLEConnection _run](self, "_run");
    return 1;
  }

  if (a3)
  {
    uint64_t v12 = 4294960596LL;
    goto LABEL_9;
  }

  return 0;
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5 = -[CBL2CAPChannel socketFD](self->_l2capChannel, "socketFD");
  if (v5 < 0)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v7 = 4294960596LL;
LABEL_13:
    NSErrorWithOSStatusF((const char *)v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v9 = 0;
    goto LABEL_14;
  }

  unsigned int v6 = v5;
  self->_socketFD = v5;
  int v24 = 1;
  if (!setsockopt(v5, 0xFFFF, 4130, &v24, 4u)) {
    goto LABEL_9;
  }
  if (!*__error())
  {
    uint64_t v7 = 4294960596LL;
    if (!a3) {
      return 0;
    }
    goto LABEL_13;
  }

  uint64_t v7 = *__error();
  if ((_DWORD)v7)
  {
    if (!a3) {
      return 0;
    }
    goto LABEL_13;
  }

- (void)_reportError:(id)a3
{
  id v14 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    char v9 = (char)v14;
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _reportError:]",  0x5Au,  (uint64_t)"Error: %{error}\n",  v4,  v5,  v6,  v7,  v9);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      char v9 = (char)v14;
      goto LABEL_3;
    }
  }

- (void)_run
{
  while (1)
  {
    uint64_t state = self->_state;
    switch((int)state)
    {
      case 0:
        self->_uint64_t state = 10;
        goto LABEL_21;
      case 10:
        uint64_t v8 = -[CBCentralManager state](self->_centralManager, "state");
        if (v8 == 10 || v8 == 5) {
          goto LABEL_18;
        }
        goto LABEL_21;
      case 11:
        if (-[CUBLEConnection _runConnectStart](self, "_runConnectStart")) {
          goto LABEL_18;
        }
        goto LABEL_21;
      case 12:
        if (self->_guardConnected)
        {
          int v10 = 13;
          break;
        }

        goto LABEL_21;
      case 13:
        self->_uint64_t state = 14;
        goto LABEL_21;
      case 14:
        -[CBPeripheral openL2CAPChannel:](self->_peripheral, "openL2CAPChannel:", self->_destinationPSM);
        goto LABEL_18;
      case 15:
        if (!self->_l2capChannel) {
          goto LABEL_21;
        }
        int v10 = 16;
        break;
      case 16:
        self->_uint64_t state = 17;
        goto LABEL_21;
      case 17:
        if (!-[CUBLEConnection _runSetupChannel](self, "_runSetupChannel")) {
          goto LABEL_21;
        }
LABEL_18:
        int v10 = self->_state + 1;
        break;
      case 18:
        -[CUBLEConnection _processReads:](self, "_processReads:", 0LL);
        -[CUBLEConnection _processWrites](self, "_processWrites");
        goto LABEL_21;
      default:
        goto LABEL_21;
    }

    self->_uint64_t state = v10;
LABEL_21:
    if (self->_state == (_DWORD)state) {
      break;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1) {
        goto LABEL_24;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
LABEL_24:
        uint64_t v12 = "?";
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _run]",  0x1Eu,  (uint64_t)"State: %s -> %s\n",  v2,  v3,  v4,  v5,  (char)v12);
      }
    }
  }

- (BOOL)_runConnectStart
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = self->_destinationUUID;
  centralManager = self->_centralManager;
  v23[0] = v3;
  [MEMORY[0x189603F18] arrayWithObjects:v23 count:1];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 firstObject];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)&self->_peripheral, v7);
    -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", self);
    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
    getCBConnectPeripheralOptionClientBundleID();
    char v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      clientBundleID = self->_clientBundleID;
      if (clientBundleID)
      {
        uint64_t v11 = (void (__cdecl *)())getCBConnectPeripheralOptionClientBundleID;
        uint64_t v12 = clientBundleID;
        v11();
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v12 forKeyedSubscript:v13];
      }
    }

    getCBConnectPeripheralOptionConnectionUseCase();
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && self->_clientUseCase)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      getCBConnectPeripheralOptionConnectionUseCase();
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v19 forKeyedSubscript:v20];
    }

    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_13;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _runConnectStart]",  0x1Eu,  (uint64_t)"Connecting to %@, %##@\n",  v15,  v16,  v17,  v18,  (char)v3);
LABEL_13:
    -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", v7, v8);
    goto LABEL_14;
  }

  NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CUBLEConnection _reportError:](self, "_reportError:", v8, v3);
LABEL_14:

  return v7 != 0LL;
}

- (BOOL)_runSetupChannel
{
  id v8 = 0LL;
  BOOL v3 = -[CUBLEConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v8);
  id v4 = v8;
  if (v3)
  {
    uint64_t v5 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v5) {
      v5[2](v5, 0LL);
    }
  }

  else
  {
    -[CUBLEConnection _reportError:](self, "_reportError:", v4);
  }

  return v3;
}

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__CUBLEConnection_readWithRequest___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_processReads:(BOOL)a3
{
  BOOL v20 = a3;
  int v4 = 0;
  p_readRequestCurrent = &self->_readRequestCurrent;
  do
  {
    id v6 = *p_readRequestCurrent;
    if (v6) {
      goto LABEL_5;
    }
    uint64_t v7 = -[NSMutableArray firstObject](self->_readRequests, "firstObject");
    if (!v7)
    {
      if (v20)
      {
        if (v4)
        {
          int readSuspended = self->_readSuspended;
        }

        else
        {
          BOOL v19 = -[CUBLEConnection _processReadStatus](self, "_processReadStatus");
          int readSuspended = self->_readSuspended;
          if (v19)
          {
            if (!self->_readSuspended)
            {
              self->_int readSuspended = 1;
              dispatch_suspend((dispatch_object_t)self->_readSource);
            }

            goto LABEL_30;
          }
        }

        if (readSuspended)
        {
          self->_int readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }

- (void)_prepareReadRequest:(id)a3
{
  uint64_t v21 = a3;
  if ([v21 bufferBytes])
  {
    v21[1] = [v21 bufferBytes];
    [v21 setData:0];
  }

  else
  {
    [v21 bufferData];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      [v21 bufferData];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v6 = [v5 length];
      unint64_t v7 = [v21 maxLength];

      if (v6 < v7)
      {
        uint64_t v8 = [v21 maxLength];
        [v21 bufferData];
        char v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setLength:v8];
      }
    }

    else
    {
      int v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithLength:", objc_msgSend(v21, "maxLength"));
      [v21 setBufferData:v10];
    }

    id v11 = [v21 bufferData];
    v21[1] = [v11 mutableBytes];

    [v21 bufferData];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setData:v12];
  }

  uint64_t v13 = (void *)v21[2];
  v21[2] = 0LL;
  v21[3] = 0LL;

  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    uint64_t v15 = v21;
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      uint64_t v15 = v21;
    }

    char v16 = [v15 minLength];
    [v21 maxLength];
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _prepareReadRequest:]",  0xAu,  (uint64_t)"Read prepared (%zu min, %zu max)\n",  v17,  v18,  v19,  v20,  v16);
  }

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _abortReadsWithError:]",  0x1Eu,  (uint64_t)"Abort reads: %{error}\n",  v4,  v5,  v6,  v7,  (char)v8);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (BOOL)_processReadStatus
{
  while (1)
  {
    ssize_t v3 = recv(self->_socketFD, &v12, 1uLL, 2);
    if ((v3 & 0x8000000000000000LL) == 0) {
      break;
    }
    if (!*__error())
    {
      uint64_t v4 = 4294960596LL;
LABEL_12:
      char v9 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
      id errorHandler = self->_errorHandler;
      self->_id errorHandler = 0LL;

      if (v9)
      {
        NSErrorWithOSStatusF((const char *)v4);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v11);
      }

      return 1;
    }

    uint64_t v4 = *__error();
    if ((_DWORD)v4 != 4)
    {
      if (!(_DWORD)v4) {
        return 1;
      }
      if ((_DWORD)v4 == 35) {
        return 0;
      }
      goto LABEL_12;
    }
  }

  if (!v3)
  {
    uint64_t v6 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
    id v7 = self->_errorHandler;
    self->_id errorHandler = 0LL;

    if (v6)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE59FLL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v8);
    }
  }

  return 1;
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  uint64_t v16 = a3;
  id v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    id v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      char v9 = [v8 length];
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _completeReadRequest:error:]",  0xAu,  (uint64_t)"Read completed: %zu byte(s), %{error}\n",  v10,  v11,  v12,  v13,  v9);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
    {
      ucat = self->_ucat;
      id v8 = v16;
      goto LABEL_3;
    }
  }

- (void)writeWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__CUBLEConnection_writeWithRequest___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___CUWriteRequest);
  -[CUWriteRequest setEndOfData:](v5, "setEndOfData:", 1LL);
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    uint64_t v7 = 3221225472LL;
    id v8 = __48__CUBLEConnection_writeEndOfDataWithCompletion___block_invoke;
    char v9 = &unk_189F33060;
    id v11 = v4;
    uint64_t v10 = v5;
    -[CUWriteRequest setCompletion:](v10, "setCompletion:", &v6);
  }

  -[CUBLEConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);
}

- (void)_processWrites
{
  p_writeRequestCurrent = &self->_writeRequestCurrent;
  int v4 = 4;
  do
  {
    uint64_t v5 = *p_writeRequestCurrent;
    if (!v5)
    {
      uint64_t v12 = -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      if (!v12)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }

        uint64_t v5 = 0LL;
        goto LABEL_37;
      }

      uint64_t v5 = (CUWriteRequest *)v12;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0LL);
      id v23 = 0LL;
      -[CUBLEConnection _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v5, &v23);
      id v13 = v23;
      if (v13)
      {
        uint64_t v14 = v13;
        goto LABEL_24;
      }

      objc_storeStrong((id *)p_writeRequestCurrent, v5);
    }

    uint64_t v10 = (const char *)SocketWriteData(self->_socketFD, (const iovec **)&v5->_iop, &v5->_ion);
    ucat = self->_ucat;
    if (ucat->var0 <= 20)
    {
      if (ucat->var0 != -1) {
        goto LABEL_5;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x14u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _processWrites]",  0x14u,  (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n",  v6,  v7,  v8,  v9,  self->_socketFD);
      }
    }

    if ((_DWORD)v10)
    {
      if ((_DWORD)v10 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }

      else
      {
        NSErrorWithOSStatusF(v10);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBLEConnection _abortWritesWithError:](self, "_abortWritesWithError:", v22);
      }

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (char *)a3;
  [v6 dataArray];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (!v7)
  {
    *((void *)v6 + 34) = v6 + 16;
    LODWORD(v11) = [v6 bytesIOCount];
    goto LABEL_14;
  }

  unint64_t v9 = [v7 count];
  if (v9 <= [v6 bytesIOMaxCount])
  {
    uint64_t v12 = v6 + 16;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    uint64_t v15 = v6 + 16;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v33;
      uint64_t v15 = v6 + 16;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          *(void *)uint64_t v15 = [v19 bytes];
          *((void *)v15 + 1) = [v19 length];
          v15 += 16;
        }

        uint64_t v16 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v16);
    }

    *((void *)v6 + 34) = v12;
    unint64_t v11 = (unint64_t)(v15 - v12) >> 4;
LABEL_14:
    *((_DWORD *)v6 + 70) = v11;
    *((void *)v6 + 36) = 0LL;
    uint64_t v20 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = 0LL;

    if (gLogCategory_CUBLEConnection > 10
      || gLogCategory_CUBLEConnection == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBLEConnection, 0xAu))
    {
      goto LABEL_27;
    }

    int v25 = *((_DWORD *)v6 + 70);
    if (v25)
    {
      uint64_t v26 = 0LL;
      uint64_t v27 = 16LL * v25;
      uint64_t v28 = (uint64_t *)(*((void *)v6 + 34) + 8LL);
      do
      {
        uint64_t v29 = *v28;
        v28 += 2;
        v26 += v29;
        v27 -= 16LL;
      }

      while (v27);
    }

    ucat = self->_ucat;
    if (ucat->var0 > 10) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      int v25 = *((_DWORD *)v6 + 70);
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _prepareWriteRequest:error:]",  0xAu,  (uint64_t)"Write prepared (%d iov, %zu total)\n",  v21,  v22,  v23,  v24,  v25);
LABEL_27:
    BOOL v10 = 1;
    goto LABEL_28;
  }

  if (a4)
  {
    [v6 bytesIOMaxCount];
    NSErrorWithOSStatusF((const char *)0xFFFFE594LL);
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v10 = 0;
  }

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _abortWritesWithError:]",  0x1Eu,  (uint64_t)"Abort writes: %{error}\n",  v4,  v5,  v6,  v7,  (char)v8);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v14 = a3;
  id v10 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection _completeWriteRequest:error:]",  0xAu,  (uint64_t)"Write completed: %{error}\n",  v6,  v7,  v8,  v9,  (char)v10);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0xAu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)centralManagerDidUpdateState:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_2;
  }
  unint64_t v8 = [v13 state];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    if (v8 > 0xA) {
      id v10 = "?";
    }
    else {
      id v10 = off_189F30C98[v8];
    }
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection centralManagerDidUpdateState:]",  0x1Eu,  (uint64_t)"Bluetooth state changed: %s\n",  v4,  v5,  v6,  v7,  (char)v10);
  }

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_28;
  }
  [v6 identifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  destinationUUID = self->_destinationUUID;
  uint64_t v9 = v7;
  id v10 = destinationUUID;
  if (v9 == v10)
  {

    goto LABEL_7;
  }

  uint64_t v11 = v10;
  if ((v9 == 0LL) == (v10 != 0LL))
  {

    goto LABEL_11;
  }

  char v12 = -[NSUUID isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) != 0)
  {
LABEL_7:
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_15;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_15:
        int connectionLatency = self->_connectionLatency;
        if (!connectionLatency)
        {
LABEL_27:
          self->_guardConnected = 1;
          -[CUBLEConnection _run](self, "_run");
          goto LABEL_28;
        }

        if (connectionLatency == 3) {
          uint64_t v26 = 2LL;
        }
        else {
          uint64_t v26 = connectionLatency == 2;
        }
        uint64_t v27 = self->_ucat;
        uint64_t v28 = v35;
        if (v27->var0 <= 30)
        {
          if (v27->var0 == -1)
          {
            BOOL v30 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
            uint64_t v28 = v35;
            if (!v30) {
              goto LABEL_26;
            }
            uint64_t v27 = self->_ucat;
          }

          [v6 identifier];
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF( (uint64_t)v27,  (uint64_t)"-[CUBLEConnection centralManager:didConnectPeripheral:]",  0x1Eu,  (uint64_t)"Setting connection latency %@, %s (BT %d)\n",  v31,  v32,  v33,  v34,  (char)v29);

          uint64_t v28 = v35;
        }

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v28 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_2;
  }
  [v28 identifier];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  destinationUUID = self->_destinationUUID;
  id v10 = v8;
  uint64_t v11 = destinationUUID;
  if (v10 == v11)
  {

    goto LABEL_8;
  }

  char v12 = v11;
  if ((v10 == 0LL) == (v11 != 0LL))
  {

    goto LABEL_12;
  }

  char v13 = -[NSUUID isEqual:](v10, "isEqual:", v11);

  if ((v13 & 1) != 0)
  {
LABEL_8:
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      goto LABEL_16;
    }
    uint64_t v15 = v28;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
      {
LABEL_16:
        if (v7)
        {
          -[CUBLEConnection _reportError:](self, "_reportError:", v7);
        }

        else
        {
          NSErrorWithOSStatusF((const char *)0xFFFFE59FLL);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUBLEConnection _reportError:](self, "_reportError:", v27);
        }

        goto LABEL_2;
      }

      ucat = self->_ucat;
      uint64_t v15 = v28;
    }

    [v15 identifier];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection centralManager:didFailToConnectPeripheral:error:]",  0x5Au,  (uint64_t)"### DidFailToConnectPeripheral %@, error %{error}\n",  v17,  v18,  v19,  v20,  (char)v16);

    goto LABEL_16;
  }

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v49 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_2;
  }
  if (!self->_l2capChannel)
  {
    [v49 identifier];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    destinationUUID = self->_destinationUUID;
    uint64_t v17 = v15;
    uint64_t v18 = destinationUUID;
    if (v17 == v18)
    {
    }

    else
    {
      uint64_t v19 = v18;
      if ((v17 == 0LL) == (v18 != 0LL))
      {

        goto LABEL_18;
      }

      char v20 = -[NSUUID isEqual:](v17, "isEqual:", v18);

      if ((v20 & 1) == 0)
      {
LABEL_18:
        ucat = self->_ucat;
        if (ucat->var0 <= 60)
        {
          if (ucat->var0 == -1)
          {
            ucat = self->_ucat;
          }

          [v49 identifier];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]",  0x3Cu,  (uint64_t)"### DidOpenL2CAPChannel wrong peer: peer %@ (not %@), channel %@, error %{error}\n",  v28,  v29,  v30,  v31,  (char)v27);
        }

        goto LABEL_2;
      }
    }

    uint64_t v25 = self->_ucat;
    if (v25->var0 <= 30)
    {
      if (v25->var0 != -1)
      {
LABEL_14:
        LogPrintF( (uint64_t)v25,  (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]",  0x1Eu,  (uint64_t)"DidOpenL2CAPChannel %@, error %{error}\n",  v21,  v22,  v23,  v24,  (char)v8);
        goto LABEL_22;
      }

      if (_LogCategory_Initialize((uint64_t)v25, 0x1Eu))
      {
        uint64_t v25 = self->_ucat;
        goto LABEL_14;
      }
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

- (int)connectionLatency
{
  return self->_connectionLatency;
}

- (void)setConnectionLatency:(int)a3
{
  self->_int connectionLatency = a3;
}

- (unsigned)destinationPSM
{
  return self->_destinationPSM;
}

- (void)setDestinationPSM:(unsigned __int16)a3
{
  self->_destinationPSM = a3;
}

- (NSUUID)destinationUUID
{
  return self->_destinationUUID;
}

- (void)setDestinationUUID:(id)a3
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

- (CBL2CAPChannel)l2capChannel
{
  return self->_l2capChannel;
}

- (void)setL2capChannel:(id)a3
{
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (void)setServerInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __48__CUBLEConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __36__CUBLEConnection_writeWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 25))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeWriteRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 104) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[18] & 0x80000000) == 0) {
      [v4 _processWrites];
    }
  }

void __35__CUBLEConnection_readWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 25))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeReadRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 64) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[18] & 0x80000000) == 0) {
      [v4 _processReads:0];
    }
  }

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __29__CUBLEConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void __42__CUBLEConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = *(void **)(a1 + 32);
  id v9 = 0LL;
  [v5 activateDirectAndReturnError:&v9];
  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = 0LL;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

@end