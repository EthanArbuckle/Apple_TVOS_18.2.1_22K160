@interface CUBluetoothClassicConnection
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_processReadStatus;
- (BOOL)_runBTSessionStart;
- (BOOL)_runConnectStart;
- (BOOL)_runOpenChannelStart;
- (BOOL)_runSetupChannel;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingAndReturnError:(id *)a3;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4;
- (CBL2CAPChannel)l2capChannel;
- (CUBluetoothClassicConnection)init;
- (NSString)destinationPeer;
- (NSString)destinationService;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)serverInvalidationHandler;
- (unsigned)connectionFlags;
- (unsigned)requiredServices;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_btEnsureStopped;
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
- (void)dealloc;
- (void)invalidate;
- (void)readWithRequest:(id)a3;
- (void)setConnectionFlags:(unsigned int)a3;
- (void)setDestinationPeer:(id)a3;
- (void)setDestinationService:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setL2capChannel:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRequiredServices:(unsigned int)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUBluetoothClassicConnection

- (CUBluetoothClassicConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUBluetoothClassicConnection;
  v2 = -[CUBluetoothClassicConnection init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUBluetoothClassicConnection;
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
  v4.super_class = (Class)&OBJC_CLASS___CUBluetoothClassicConnection;
  -[CUBluetoothClassicConnection dealloc](&v4, sel_dealloc);
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
  v7[2] = __55__CUBluetoothClassicConnection_activateWithCompletion___block_invoke;
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
        BOOL v19 = -[CUBluetoothClassicConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v40);
        writeRequests = (NSMutableArray *)v40;
        if (v19)
        {
          v25 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
          id activateCompletion = self->_activateCompletion;
          self->_id activateCompletion = 0LL;

          if (v25) {
            v25[2](v25, 0LL);
          }

          goto LABEL_18;
        }

        v27 = self->_ucat;
        if (v27->var0 <= 90)
        {
          if (v27->var0 != -1)
          {
LABEL_15:
            LogPrintF( (uint64_t)v27,  (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]",  0x5Au,  (uint64_t)"### Activate failed: %{error}\n",  v20,  v21,  v22,  v23,  (char)writeRequests);
            goto LABEL_23;
          }

          if (_LogCategory_Initialize((uint64_t)v27, 0x5Au))
          {
            v27 = self->_ucat;
            goto LABEL_15;
          }
        }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__CUBluetoothClassicConnection_invalidate__block_invoke;
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

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _invalidate]",  0x1Eu,  (uint64_t)"Invalidating\n",  v2,  v3,  v4,  v5,  v15);
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_btSession
    && !self->_btSessionAttaching
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
LABEL_17:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v8,  v9,  v10,  v11,  v13);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_17;
      }
    }
  }

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  destinationPeer = self->_destinationPeer;
  if (destinationPeer)
  {
    -[CUBluetoothClassicConnection _run](self, "_run", a3);
  }

  else if (a3)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return destinationPeer != 0LL;
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5 = -[CBL2CAPChannel socketFD](self->_l2capChannel, "socketFD");
  if (v5 < 0)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v20 = (void *)*MEMORY[0x189607670];
    uint64_t v7 = 4294960596LL;
    goto LABEL_13;
  }

  unsigned int v6 = v5;
  self->_socketFD = v5;
  int v26 = 1;
  if (!setsockopt(v5, 0xFFFF, 4130, &v26, 4u)) {
    goto LABEL_5;
  }
  if (!*__error())
  {
    uint64_t v7 = 4294960596LL;
    goto LABEL_11;
  }

  uint64_t v7 = *__error();
  if ((_DWORD)v7)
  {
LABEL_11:
    if (!a3) {
      return 0;
    }
    uint64_t v20 = (void *)*MEMORY[0x189607670];
LABEL_13:
    NSErrorF_safe(v20, (const char *)v7);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v17 = 0;
LABEL_14:
    *a3 = v21;
    return v17;
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
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _reportError:]",  0x5Au,  (uint64_t)"Error: %{error}\n",  v4,  v5,  v6,  v7,  v9);
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
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          uint64_t state = self->_state;
          switch((int)state)
          {
            case 0:
              int v8 = 10;
              goto LABEL_20;
            case 10:
              BOOL v9 = -[CUBluetoothClassicConnection _runBTSessionStart](self, "_runBTSessionStart");
              goto LABEL_18;
            case 11:
              if (self->_btSession)
              {
                int v8 = 12;
                goto LABEL_20;
              }

              int v8 = 11;
              break;
            case 12:
              BOOL v9 = -[CUBluetoothClassicConnection _runConnectStart](self, "_runConnectStart");
              goto LABEL_18;
            case 13:
              if (self->_btConnected)
              {
                int v8 = 14;
                goto LABEL_20;
              }

              int v8 = 13;
              break;
            case 14:
              if ((self->_connectionFlags & 2) != 0) {
                int v8 = 19;
              }
              else {
                int v8 = 15;
              }
              goto LABEL_20;
            case 15:
              BOOL v9 = -[CUBluetoothClassicConnection _runOpenChannelStart](self, "_runOpenChannelStart");
              goto LABEL_18;
            case 16:
              if (self->_l2capChannel)
              {
                int v8 = 17;
LABEL_20:
                self->_uint64_t state = v8;
              }

              else
              {
                int v8 = 16;
              }

              break;
            case 17:
              int v8 = 18;
              goto LABEL_20;
            case 18:
              BOOL v9 = -[CUBluetoothClassicConnection _runSetupChannel](self, "_runSetupChannel");
LABEL_18:
              int v8 = self->_state;
              if (!v9) {
                break;
              }
              ++v8;
              goto LABEL_20;
            case 19:
              timeoutTimer = self->_timeoutTimer;
              if (timeoutTimer)
              {
                uint64_t v12 = timeoutTimer;
                dispatch_source_cancel(v12);
                char v13 = self->_timeoutTimer;
                self->_timeoutTimer = 0LL;
              }

              id v14 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
              id activateCompletion = self->_activateCompletion;
              self->_id activateCompletion = 0LL;

              if (v14) {
                v14[2](v14, 0LL);
              }
              if ((self->_connectionFlags & 2) == 0)
              {
                -[CUBluetoothClassicConnection _processReads:](self, "_processReads:", 0LL);
                -[CUBluetoothClassicConnection _processWrites](self, "_processWrites");
              }

              int v8 = self->_state;
              break;
            default:
              return;
          }

          if (v8 == (_DWORD)state) {
            return;
          }
          ucat = self->_ucat;
        }

        while (ucat->var0 > 30);
        if (ucat->var0 == -1) {
          break;
        }
LABEL_24:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _run]",  0x1Eu,  (uint64_t)"State: %s -> %s\n",  v2,  v3,  v4,  v5,  (char)off_189F30988[state]);
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_24;
      }
    }
  }

  -[CUBluetoothClassicConnection _invalidated](self, "_invalidated");
}

- (BOOL)_runBTSessionStart
{
  uint64_t v6 = _btSessionEventCallback;
  uint64_t v2 = self;
  int v3 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue[0])( (uint64_t)v2->_ucat->var4,  (uint64_t)&v6,  (uint64_t)v2,  v2->_dispatchQueue);
  if (v3)
  {
    CFRelease(v2);
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)(v3 + 310000));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothClassicConnection _reportError:](v2, "_reportError:", v4);
  }

  else
  {
    v2->_btSessionAttaching = 1;
    v2->_btSessionStarted = 1;
  }

  return v3 == 0;
}

- (BOOL)_runConnectStart
{
  v37[2] = *MEMORY[0x1895F89C0];
  int v3 = self->_destinationPeer;
  if (!v3)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v31);

    BOOL v29 = 0;
    goto LABEL_29;
  }

  id v36 = 0LL;
  uint64_t v4 = -[CUBluetoothClassicConnection _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v3, &v36);
  id v5 = v36;
  uint64_t v6 = v5;
  if (v4)
  {
    int v7 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])( (uint64_t)v4,  (uint64_t)self->_btDeviceAddrStr,  32LL);
    uint64_t v12 = (v7 + 310000);
    if (v7) {
      BOOL v13 = (_DWORD)v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      uint64_t v32 = (void *)*MEMORY[0x189607670];
LABEL_36:
      NSErrorF_safe(v32, (const char *)v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v33);

      goto LABEL_37;
    }

    if (!self->_btServiceAddCallbacks)
    {
      int v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks[0])( (uint64_t)self->_btSession,  (uint64_t)_btServiceEventHandler,  (uint64_t)self);
      if (v14)
      {
        uint64_t v12 = (v14 + 310000);
        if (v14 != -310000)
        {
          uint64_t v32 = (void *)*MEMORY[0x189607670];
          goto LABEL_36;
        }
      }

      self->_btServiceAddCallbacks = 1;
    }

    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_16;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _runConnectStart]",  0x1Eu,  (uint64_t)"Connect: %@\n",  v8,  v9,  v10,  v11,  (char)v3);
LABEL_16:
    if ((self->_connectionFlags & 4) != 0)
    {
      v37[0] = 0LL;
      v37[1] = 0LL;
      int v16 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])( (uint64_t)v4,  4294956991LL,  32LL,  (uint64_t)v37);
      if (v16 != 2) {
        goto LABEL_23;
      }
      id v21 = self->_ucat;
      if (v21->var0 <= 30)
      {
        if (v21->var0 == -1)
        {
          id v21 = self->_ucat;
        }

        LogPrintF( (uint64_t)v21,  (uint64_t)"-[CUBluetoothClassicConnection _runConnectStart]",  0x1Eu,  (uint64_t)"Connect Tipi failed, retrying in normal mode",  v17,  v18,  v19,  v20,  v34);
      }
    }

- (BOOL)_runOpenChannelStart
{
  return 1;
}

- (BOOL)_runSetupChannel
{
  id v6 = 0LL;
  BOOL v3 = -[CUBluetoothClassicConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v6);
  id v4 = v6;
  if (!v3) {
    -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v4);
  }

  return v3;
}

- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v22 = 0LL;
  id v6 = a3;
  int v7 = (char *)[v6 UTF8String];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v20 = (void *)*MEMORY[0x189607670];
    uint64_t v17 = 4294960591LL;
    goto LABEL_24;
  }

  uint64_t v11 = v7;
  if (!StringToUUIDEx(v7, 0xFFFFFFFFFFFFFFFFLL, 0, 0LL, &v23, v8, v9, v10))
  {
    int v16 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier[0])( (uint64_t)self->_btSession,  (uint64_t)&v23,  (uint64_t)&v22);
    if (v16 == -310000) {
      uint64_t v17 = 4294960596LL;
    }
    else {
      uint64_t v17 = (v16 + 310000);
    }
    if (!v16) {
      goto LABEL_14;
    }
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v20 = (void *)*MEMORY[0x189607670];
LABEL_24:
    NSErrorF_safe(v20, (const char *)v17);
    uint64_t v18 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

  uint64_t v12 = TextToHardwareAddress(v11, 0xFFFFFFFFFFFFFFFFLL, 6LL, v21);
  if ((_DWORD)v12)
  {
    if (a4)
    {
      uint64_t v14 = v12;
      char v15 = (void *)*MEMORY[0x189607670];
      goto LABEL_20;
    }

- (void)_btEnsureStopped
{
  if (self->_btServiceAddCallbacks)
  {
    self->_btServiceAddCallbacks = 0;
    btSession = self->_btSession;
    if (btSession) {
      ((void (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks[0])( (uint64_t)btSession,  (uint64_t)_btServiceEventHandler);
    }
  }

  if (self->_btSession)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _btEnsureStopped]",  0x1Eu,  (uint64_t)"BTSession detach\n",  v2,  v3,  v4,  v5,  v9);
    }

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__CUBluetoothClassicConnection_readWithRequest___block_invoke;
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
          BOOL v19 = -[CUBluetoothClassicConnection _processReadStatus](self, "_processReadStatus");
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
  id v21 = a3;
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
      uint64_t v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithLength:", objc_msgSend(v21, "maxLength"));
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
  if (ucat->var0 <= 9)
  {
    char v15 = v21;
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      char v15 = v21;
    }

    char v16 = [v15 minLength];
    [v21 maxLength];
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _prepareReadRequest:]",  9u,  (uint64_t)"Read prepared (%zu min, %zu max)\n",  v17,  v18,  v19,  v20,  v16);
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
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _abortReadsWithError:]",  0x1Eu,  (uint64_t)"Abort reads: %{error}\n",  v4,  v5,  v6,  v7,  (char)v8);
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
        NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)v4);
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
      NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE59FLL);
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
  if (ucat->var0 <= 9)
  {
    id v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      char v9 = [v8 length];
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _completeReadRequest:error:]",  9u,  (uint64_t)"Read completed: %zu byte(s), %{error}\n",  v10,  v11,  v12,  v13,  v9);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
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
  v7[2] = __49__CUBluetoothClassicConnection_writeWithRequest___block_invoke;
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
    id v8 = __61__CUBluetoothClassicConnection_writeEndOfDataWithCompletion___block_invoke;
    char v9 = &unk_189F33060;
    uint64_t v10 = v5;
    id v11 = v4;
    -[CUWriteRequest setCompletion:](v5, "setCompletion:", &v6);
  }

  -[CUBluetoothClassicConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);
}

- (void)_processWrites
{
  p_writeRequestCurrent = &self->_writeRequestCurrent;
  int v4 = 4;
  uint64_t v5 = (void *)*MEMORY[0x189607670];
  do
  {
    uint64_t v6 = *p_writeRequestCurrent;
    if (!v6)
    {
      uint64_t v13 = -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      if (!v13)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }

        uint64_t v6 = 0LL;
        goto LABEL_37;
      }

      uint64_t v6 = (CUWriteRequest *)v13;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0LL);
      id v24 = 0LL;
      -[CUBluetoothClassicConnection _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v6, &v24);
      id v14 = v24;
      if (v14)
      {
        uint64_t v15 = v14;
        goto LABEL_24;
      }

      objc_storeStrong((id *)p_writeRequestCurrent, v6);
    }

    id v11 = (const char *)SocketWriteData(self->_socketFD, (const iovec **)&v6->_iop, &v6->_ion);
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 != -1) {
        goto LABEL_5;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 9u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _processWrites]",  9u,  (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n",  v7,  v8,  v9,  v10,  self->_socketFD);
      }
    }

    if ((_DWORD)v11)
    {
      if ((_DWORD)v11 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }

      else
      {
        NSErrorF_safe(v5, v11);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothClassicConnection _abortWritesWithError:](self, "_abortWritesWithError:", v23);
      }

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (char *)a3;
  [v6 dataArray];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (!v7)
  {
    *((void *)v6 + 34) = v6 + 16;
    LODWORD(v12) = [v6 bytesIOCount];
    goto LABEL_14;
  }

  unint64_t v9 = [v7 count];
  if (v9 <= [v6 bytesIOMaxCount])
  {
    uint64_t v13 = v6 + 16;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v16 = v6 + 16;
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v34;
      uint64_t v16 = v6 + 16;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v14);
          }
          id v20 = *(id *)(*((void *)&v33 + 1) + 8 * i);
          *(void *)uint64_t v16 = [v20 bytes];
          *((void *)v16 + 1) = [v20 length];
          v16 += 16;
        }

        uint64_t v17 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v17);
    }

    *((void *)v6 + 34) = v13;
    unint64_t v12 = (unint64_t)(v16 - v13) >> 4;
LABEL_14:
    *((_DWORD *)v6 + 70) = v12;
    *((void *)v6 + 36) = 0LL;
    uint64_t v21 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = 0LL;

    if (gLogCategory_CUBluetoothClassicConnection > 9
      || gLogCategory_CUBluetoothClassicConnection == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBluetoothClassicConnection, 9u))
    {
      goto LABEL_27;
    }

    int v26 = *((_DWORD *)v6 + 70);
    if (v26)
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = 16LL * v26;
      BOOL v29 = (uint64_t *)(*((void *)v6 + 34) + 8LL);
      do
      {
        uint64_t v30 = *v29;
        v29 += 2;
        v27 += v30;
        v28 -= 16LL;
      }

      while (v28);
    }

    ucat = self->_ucat;
    if (ucat->var0 > 9) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      int v26 = *((_DWORD *)v6 + 70);
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _prepareWriteRequest:error:]",  9u,  (uint64_t)"Write prepared (%d iov, %zu total)\n",  v22,  v23,  v24,  v25,  v26);
LABEL_27:
    BOOL v11 = 1;
    goto LABEL_28;
  }

  if (a4)
  {
    uint64_t v10 = (void *)*MEMORY[0x189607670];
    [v6 bytesIOMaxCount];
    NSErrorF_safe(v10, (const char *)0xFFFFE594LL);
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v11 = 0;
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
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _abortWritesWithError:]",  0x1Eu,  (uint64_t)"Abort writes: %{error}\n",  v4,  v5,  v6,  v7,  (char)v8);
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
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothClassicConnection _completeWriteRequest:error:]",  9u,  (uint64_t)"Write completed: %{error}\n",  v6,  v7,  v8,  v9,  (char)v10);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (unsigned)connectionFlags
{
  return self->_connectionFlags;
}

- (void)setConnectionFlags:(unsigned int)a3
{
  self->_connectionFlags = a3;
}

- (NSString)destinationPeer
{
  return self->_destinationPeer;
}

- (void)setDestinationPeer:(id)a3
{
}

- (NSString)destinationService
{
  return self->_destinationService;
}

- (void)setDestinationService:(id)a3
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

- (unsigned)requiredServices
{
  return self->_requiredServices;
}

- (void)setRequiredServices:(unsigned int)a3
{
  self->_requiredServices = a3;
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

void __61__CUBluetoothClassicConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __49__CUBluetoothClassicConnection_writeWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 68))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeWriteRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 144) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[26] & 0x80000000) == 0) {
      [v4 _processWrites];
    }
  }

void __48__CUBluetoothClassicConnection_readWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 68))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeReadRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 96) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[26] & 0x80000000) == 0) {
      [v4 _processReads:0];
    }
  }

void __48__CUBluetoothClassicConnection__runConnectStart__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1 == (void *)v2[14])
  {
    if (v1)
    {
      uint64_t v4 = v1;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void **)(v5 + 112);
      *(void *)(v5 + 112) = 0LL;

      uint64_t v2 = *(void **)(a1 + 40);
    }

    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5BELL);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _reportError:v7];
  }

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __42__CUBluetoothClassicConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void __55__CUBluetoothClassicConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  id v9 = 0LL;
  [v5 activateDirectAndReturnError:&v9];
  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = 0LL;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

@end