@interface CUTCPConnection
- ($4FF8D77539A8BD95DCE0A545902499A9)peerAddr;
- ($4FF8D77539A8BD95DCE0A545902499A9)selfAddr;
- (BOOL)_activateDirectAndReturnError:(id *)a3;
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_readStatus;
- (BOOL)_readableData;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingToBonjourDevice:(id)a3 error:(id *)a4;
- (BOOL)_startConnectingToDestination:(id)a3 error:(id *)a4;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (CUBonjourDevice)destinationBonjour;
- (CUNANDataSession)nanDataSession;
- (CUNetLinkManager)netLinkManager;
- (CUTCPConnection)init;
- (NSString)destinationString;
- (NSString)interfaceName;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (double)connectTimeoutSecs;
- (double)dataTimeoutSecs;
- (id)description;
- (id)errorHandler;
- (id)flowControlChangedHandler;
- (id)invalidationHandler;
- (id)serverInvalidationHandler;
- (id)socketEventHandler;
- (int)defaultPort;
- (int)flowControlState;
- (int)keepAliveIdleSeconds;
- (int)keepAliveIntervalSeconds;
- (int)keepAliveMaxCount;
- (int)keepAliveSeconds;
- (int)socketFD;
- (unsigned)flags;
- (unsigned)netTransportType;
- (unsigned)trafficFlags;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_logMetrics;
- (void)_netLinkStateChanged;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads:(BOOL)a3;
- (void)_processSocketEvents;
- (void)_processWrites:(BOOL)a3;
- (void)_updateTrafficRegistration;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)readWithRequest:(id)a3;
- (void)setConnectTimeoutSecs:(double)a3;
- (void)setDataTimeoutSecs:(double)a3;
- (void)setDefaultPort:(int)a3;
- (void)setDestinationBonjour:(id)a3;
- (void)setDestinationString:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFlowControlChangedHandler:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setKeepAliveIdleSeconds:(int)a3;
- (void)setKeepAliveIntervalSeconds:(int)a3;
- (void)setKeepAliveMaxCount:(int)a3;
- (void)setKeepAliveSeconds:(int)a3;
- (void)setLabel:(id)a3;
- (void)setNanDataSession:(id)a3;
- (void)setNetLinkManager:(id)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)setSocketEventHandler:(id)a3;
- (void)setSocketFD:(int)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUTCPConnection

- (CUTCPConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUTCPConnection;
  v2 = -[CUTCPConnection init](&v6, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    else {
      int v3 = 9;
    }
    v2->_rawIOLogLevel = v3;
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUTCPConnection;
    pthread_mutex_init(&v2->_mutex, 0LL);
    v4 = v2;
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
  v4.super_class = (Class)&OBJC_CLASS___CUTCPConnection;
  -[CUTCPConnection dealloc](&v4, sel_dealloc);
}

- (id)description
{
  CFMutableStringRef v14 = 0LL;
  NSAppendPrintF(&v14);
  int v3 = v14;
  objc_super v4 = v3;
  label = self->_label;
  if (label)
  {
    CFMutableStringRef v13 = v3;
    v10 = label;
    NSAppendPrintF(&v13);
    objc_super v6 = v13;

    objc_super v4 = v6;
  }

  CFMutableStringRef v12 = v4;
  NSAppendPrintF(&v12);
  v7 = v12;

  if (self->_trafficFlags)
  {
    CFMutableStringRef v11 = v7;
    NSAppendPrintF(&v11);
    v8 = v11;

    v7 = v8;
  }

  return v7;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)setTrafficFlags:(unsigned int)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_activateCalled && !self->_trafficFlagsPending)
    {
      self->_trafficFlagsPending = 1;
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __35__CUTCPConnection_setTrafficFlags___block_invoke;
      block[3] = &unk_189F34238;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }

  pthread_mutex_unlock(p_mutex);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  self->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __42__CUTCPConnection_activateWithCompletion___block_invoke;
  v8[3] = &unk_189F33060;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);
  pthread_mutex_unlock(p_mutex);
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  self->_activateCalled = 1;
  pthread_mutex_unlock(&self->_mutex);
  return -[CUTCPConnection _activateDirectAndReturnError:](self, "_activateDirectAndReturnError:", a3);
}

- (BOOL)_activateDirectAndReturnError:(id *)a3
{
  self->_activateTicks = mach_absolute_time();
  int socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_15;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_15:
        id v35 = 0LL;
        -[CUTCPConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v35);
        id v23 = v35;
        if (!v23)
        {
          activateCompletion = (void (**)(id, void))self->_activateCompletion;
          if (!activateCompletion)
          {
LABEL_19:
            v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
            readRequests = self->_readRequests;
            self->_readRequests = v25;

            v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
            writeRequests = self->_writeRequests;
            self->_writeRequests = v27;

            id v15 = 0LL;
LABEL_20:
            BOOL v29 = 1;
            goto LABEL_21;
          }

          activateCompletion[2](activateCompletion, 0LL);
          id v13 = self->_activateCompletion;
          self->_activateCompletion = 0LL;
LABEL_18:

          goto LABEL_19;
        }

        goto LABEL_23;
      }

      ucat = self->_ucat;
      int socketFD = self->_socketFD;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _activateDirectAndReturnError:]",  0x1Eu,  (uint64_t)"Activate with socket %d\n",  v5,  v6,  v7,  v8,  socketFD);
    goto LABEL_15;
  }

  destinationBonjour = self->_destinationBonjour;
  if (destinationBonjour)
  {
    unsigned int flags = self->_flags;
    self->_unsigned int flags = flags | 0x200;
    if ((flags & 0x100) != 0)
    {
      v34[1] = 0LL;
      -[CUTCPConnection _startConnectingToBonjourDevice:error:](self, "_startConnectingToBonjourDevice:error:");
      id v23 = 0LL;
      if (!v23) {
        goto LABEL_19;
      }
LABEL_23:
      id v15 = v23;
      goto LABEL_26;
    }

    v34[0] = 0LL;
    id v13 = -[CUBonjourDevice copyConnectionStringWithFlags:error:]( destinationBonjour,  "copyConnectionStringWithFlags:error:",  0LL,  v34);
    id v14 = v34[0];
    id v15 = v14;
    if (v13)
    {
      id v33 = v14;
      -[CUTCPConnection _startConnectingToDestination:error:](self, "_startConnectingToDestination:error:", v13, &v33);
      id v16 = v33;

      if (!v16) {
        goto LABEL_18;
      }
      id v15 = v16;
    }

    goto LABEL_25;
  }

  destinationString = self->_destinationString;
  if (!destinationString)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    if (!v15) {
      goto LABEL_20;
    }
    goto LABEL_26;
  }

  self->_flags |= 0x200u;
  id v32 = 0LL;
  v22 = destinationString;
  -[CUTCPConnection _startConnectingToDestination:error:](self, "_startConnectingToDestination:error:", v22, &v32);
  id v15 = v32;

  if (!v15) {
    goto LABEL_19;
  }
LABEL_26:
  v31 = self->_ucat;
  if (v31->var0 > 60) {
    goto LABEL_30;
  }
  if (v31->var0 != -1) {
    goto LABEL_28;
  }
  if (_LogCategory_Initialize((uint64_t)v31, 0x3Cu))
  {
    v31 = self->_ucat;
LABEL_28:
    LogPrintF( (uint64_t)v31,  (uint64_t)"-[CUTCPConnection _activateDirectAndReturnError:]",  0x3Cu,  (uint64_t)"### Activate direct failed: %{error}\n",  v17,  v18,  v19,  v20,  (char)v15);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CUTCPConnection_invalidate__block_invoke;
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
    if (ucat->var0 != -1)
    {
LABEL_4:
      NSPrintF();
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _invalidate]",  0x1Eu,  (uint64_t)"Invalidating: peer=%@, self=%@",  v5,  v6,  v7,  v8,  (char)v4);

      goto LABEL_6;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }

- (void)_invalidated
{
  if (!self->_invalidateDone
    && !self->_connector
    && !self->_readSource
    && !self->_writeSource
    && !self->_socketEventsSource
    && !self->_readRequestCurrent
    && !-[NSMutableArray count](self->_readRequests, "count")
    && !self->_writeRequestCurrent
    && !-[NSMutableArray count](self->_writeRequests, "count")
    && !self->_netLinkEndpoint)
  {
    int socketFD = self->_socketFD;
    if ((socketFD & 0x80000000) == 0)
    {
      if (close(socketFD) && *__error()) {
        __error();
      }
      self->_int socketFD = -1;
    }

    -[CUWiFiManager invalidate](self->_wifiTrafficManager, "invalidate");
    wifiTrafficManager = self->_wifiTrafficManager;
    self->_wifiTrafficManager = 0LL;

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

    id flowControlChangedHandler = self->_flowControlChangedHandler;
    self->_id flowControlChangedHandler = 0LL;

    id v9 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id v10 = self->_serverInvalidationHandler;
    self->_serverInvalidationHandler = 0LL;

    id socketEventHandler = self->_socketEventHandler;
    self->_id socketEventHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_22:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v12,  v13,  v14,  v15,  v17);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_22;
      }
    }
  }

- (BOOL)_startConnectingToBonjourDevice:(id)a3 error:(id *)a4
{
  id v10 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _startConnectingToBonjourDevice:error:]",  0x1Eu,  (uint64_t)"Connecting to '%@'\n",  v6,  v7,  v8,  v9,  (char)v10);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (BOOL)_startConnectingToDestination:(id)a3 error:(id *)a4
{
  id v10 = a3;
  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_5;
  }
  if (ucat->var0 != -1) {
    goto LABEL_3;
  }
  if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
  {
    ucat = self->_ucat;
LABEL_3:
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _startConnectingToDestination:error:]",  0x1Eu,  (uint64_t)"Connecting to '%@'\n",  v6,  v7,  v8,  v9,  (char)v10);
  }

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int socketFD = self->_socketFD;
  int v56 = 1;
  if (setsockopt(socketFD, 0xFFFF, 4130, &v56, 4u))
  {
    if (!*__error())
    {
      uint64_t InterfaceInfo = 4294960596LL;
      goto LABEL_57;
    }

    uint64_t InterfaceInfo = *__error();
    if ((_DWORD)InterfaceInfo) {
      goto LABEL_57;
    }
  }

  uint64_t InterfaceInfo = SocketSetNonBlocking(self->_socketFD, 1);
  if ((_DWORD)InterfaceInfo) {
    goto LABEL_57;
  }
  int v7 = self->_socketFD;
  int v55 = 1;
  if (setsockopt(v7, 6, 1, &v55, 4u))
  {
    if (!*__error())
    {
      uint64_t InterfaceInfo = 4294960596LL;
      goto LABEL_57;
    }

    uint64_t InterfaceInfo = *__error();
    if ((_DWORD)InterfaceInfo) {
      goto LABEL_57;
    }
  }

  uint64_t InterfaceInfo = SocketSetNotSentLowWatermark(self->_socketFD, 0x4000uLL);
  if ((_DWORD)InterfaceInfo) {
    goto LABEL_57;
  }
  if ((self->_flags & 8) != 0)
  {
    int v8 = self->_socketFD;
    int v54 = 1;
    if (setsockopt(v8, 0xFFFF, 4131, &v54, 4u))
    {
      if (!*__error())
      {
        uint64_t InterfaceInfo = 4294960596LL;
        goto LABEL_57;
      }

      uint64_t InterfaceInfo = *__error();
      if ((_DWORD)InterfaceInfo) {
        goto LABEL_57;
      }
    }
  }

  double dataTimeoutSecs = self->_dataTimeoutSecs;
  if (dataTimeoutSecs > 0.0)
  {
    uint64_t InterfaceInfo = SocketSetTCPTimeout(self->_socketFD, (int)dataTimeoutSecs);
    if ((_DWORD)InterfaceInfo) {
      goto LABEL_57;
    }
  }

  int keepAliveIdleSeconds = self->_keepAliveIdleSeconds;
  if (keepAliveIdleSeconds < 1)
  {
    int keepAliveSeconds = self->_keepAliveSeconds;
    if (keepAliveSeconds >= 1)
    {
      if (keepAliveSeconds <= 3) {
        int keepAliveSeconds = 3;
      }
      uint64_t InterfaceInfo = SocketSetKeepAliveEx( self->_socketFD,  (1431655766 * (unint64_t)keepAliveSeconds) >> 32,  (1431655766 * (unint64_t)keepAliveSeconds) >> 32,  3);
      if ((_DWORD)InterfaceInfo) {
        goto LABEL_57;
      }
      if ((self->_flags & 2) != 0)
      {
        int v11 = self->_socketFD;
        int v52 = 1;
        int v12 = &v52;
LABEL_27:
        if (!setsockopt(v11, 6, 529, v12, 4u)) {
          goto LABEL_40;
        }
        if (*__error())
        {
          int v18 = *__error();
          if (!v18) {
            goto LABEL_40;
          }
        }

        else
        {
          LOBYTE(v18) = -44;
        }

        ucat = self->_ucat;
        if (ucat->var0 > 60) {
          goto LABEL_40;
        }
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _setupIOAndReturnError:]",  0x3Cu,  (uint64_t)"### Set TCP_KEEPALIVE_OFFLOAD failed: %#m\n",  v14,  v15,  v16,  v17,  v18);
      }
    }
  }

  else
  {
    uint64_t InterfaceInfo = SocketSetKeepAliveEx( self->_socketFD,  keepAliveIdleSeconds,  self->_keepAliveIntervalSeconds,  self->_keepAliveMaxCount);
    if ((_DWORD)InterfaceInfo) {
      goto LABEL_57;
    }
    if ((self->_flags & 2) != 0)
    {
      int v11 = self->_socketFD;
      int v53 = 1;
      int v12 = &v53;
      goto LABEL_27;
    }
  }

- (void)_netLinkStateChanged
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__CUTCPConnection__netLinkStateChanged__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_processSocketEvents
{
  socketEventsSource = self->_socketEventsSource;
  if (!socketEventsSource) {
    return;
  }
  unsigned int data = dispatch_source_get_data((dispatch_source_t)socketEventsSource);
  char v5 = data;
  uint64_t v6 = (data >> 4) & 0x800 | (((data >> 8) & 1) << 10);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      NSPrintF();
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _processSocketEvents]",  0x1Eu,  (uint64_t)"Socket events: raw 0x%llX, flags %@",  v8,  v9,  v10,  v11,  v5);

      goto LABEL_6;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }

- (void)_logMetrics
{
  v24[6] = *MEMORY[0x1895F89C0];
  if (CoreAnalyticsLibrary_sOnce_8444 != -1) {
    dispatch_once(&CoreAnalyticsLibrary_sOnce_8444, &__block_literal_global_8445);
  }
  if (CoreAnalyticsLibrary_sLib_8446 && dlsym((void *)CoreAnalyticsLibrary_sLib_8446, "AnalyticsSendEvent"))
  {
    v23[0] = @"connectTimeoutSecs";
    [MEMORY[0x189607968] numberWithInt:(int)self->_connectTimeoutSecs];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    v23[1] = @"dataTimeoutSecs";
    [MEMORY[0x189607968] numberWithInt:(int)self->_dataTimeoutSecs];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v5;
    v23[2] = @"durationSecs";
    uint64_t v6 = (void *)MEMORY[0x189607968];
    uint64_t v7 = mach_absolute_time();
    [v6 numberWithUnsignedLongLong:UpTicksToSeconds(v7 - self->_activateTicks)];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v8;
    v23[3] = @"error";
    firstError = self->_firstError;
    if (firstError)
    {
      id v10 = objc_alloc(NSString);
      v2 = -[NSError domain](self->_firstError, "domain");
      uint64_t v11 = (__CFString *)[v10 initWithFormat:@"%@:%d", v2, -[NSError code](self->_firstError, "code")];
    }

    else
    {
      uint64_t v11 = @"nil";
    }

    v24[3] = v11;
    v23[4] = @"ifname";
    uint64_t v12 = [NSString stringWithUTF8String:self->_ifName];
    unsigned int v13 = (void *)v12;
    label = @"?";
    if (v12) {
      uint64_t v15 = (const __CFString *)v12;
    }
    else {
      uint64_t v15 = @"?";
    }
    v23[5] = @"label";
    if (self->_label) {
      label = (const __CFString *)self->_label;
    }
    v24[4] = v15;
    v24[5] = label;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:6];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (firstError)
    {
    }

    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_19;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    NSPrintF();
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _logMetrics]",  0x1Eu,  (uint64_t)"Metrics: %@",  v19,  v20,  v21,  v22,  (char)v18);

LABEL_19:
    softLinkAnalyticsSendEvent_8455(@"com.apple.cutcp", v16);
  }

- (void)_updateTrafficRegistration
{
  v15[1] = *MEMORY[0x1895F89C0];
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  uint64_t trafficFlags = self->_trafficFlags;
  self->_trafficFlagsPending = 0;
  pthread_mutex_unlock(p_mutex);
  if ((self->_flags & 0x200) == 0 || self->_netTransportType != 4 || (_DWORD)trafficFlags == self->_trafficFlagsApplied) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _updateTrafficRegistration]",  0x1Eu,  (uint64_t)"Update traffic: %##a, %#{flags}\n",  v5,  v6,  v7,  v8,  (_BYTE)self - 88);
  }

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__CUTCPConnection_readWithRequest___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_processReads:(BOOL)a3
{
  BOOL v21 = a3;
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
      if (v21)
      {
        if (v4)
        {
          int readSuspended = self->_readSuspended;
        }

        else
        {
          BOOL v20 = -[CUTCPConnection _readStatus](self, "_readStatus");
          int readSuspended = self->_readSuspended;
          if (v20)
          {
            if (!self->_readSuspended)
            {
              self->_int readSuspended = 1;
              dispatch_suspend((dispatch_object_t)self->_readSource);
            }

            goto LABEL_33;
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
  uint64_t v22 = a3;
  if ([v22 bufferBytes])
  {
    v22[1] = [v22 bufferBytes];
    [v22 setData:0];
  }

  else
  {
    [v22 bufferData];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      [v22 bufferData];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v6 = [v5 length];
      unint64_t v7 = [v22 maxLength];

      if (v6 < v7)
      {
        uint64_t v8 = [v22 maxLength];
        [v22 bufferData];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setLength:v8];
      }
    }

    else
    {
      id v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithLength:", objc_msgSend(v22, "maxLength"));
      [v22 setBufferData:v10];
    }

    id v11 = [v22 bufferData];
    v22[1] = [v11 mutableBytes];

    [v22 bufferData];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setData:v12];
  }

  uint64_t v13 = (void *)v22[2];
  v22[2] = 0LL;
  v22[3] = 0LL;

  [v22 setStatusFlags:0];
  unsigned int rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    uint64_t v16 = v22;
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      uint64_t v16 = v22;
    }

    char v17 = [v16 minLength];
    [v22 maxLength];
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _prepareReadRequest:]",  rawIOLogLevel,  (uint64_t)"Read prepared (%zu min, %zu max)\n",  v18,  v19,  v20,  v21,  v17);
  }

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!self->_invalidateCalled && !self->_firstError) {
    objc_storeStrong((id *)&self->_firstError, a3);
  }
  netLinkManager = self->_netLinkManager;
  if (netLinkManager && self->_netLinkEndpoint)
  {
    -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
    unint64_t v7 = self->_netLinkManager;
    self->_netLinkManager = 0LL;
  }

  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        NSPrintF();
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _abortReadsWithError:]",  0x1Eu,  (uint64_t)"Abort reads: peer=%@, self=%@, error=%@",  v11,  v12,  v13,  v14,  (char)v9);

        goto LABEL_13;
      }

      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }

- (BOOL)_readableData
{
  do
    ssize_t v3 = recv(self->_socketFD, &v5, 1uLL, 2);
  while (v3 < 0 && *__error() && *__error() == 4);
  return v3 > 0;
}

- (BOOL)_readStatus
{
  while (1)
  {
    ssize_t v3 = recv(self->_socketFD, &v9, 1uLL, 2);
    if ((v3 & 0x8000000000000000LL) == 0) {
      break;
    }
    if (!*__error())
    {
      uint64_t v4 = 4294960596LL;
      goto LABEL_11;
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
LABEL_11:
      id errorHandler = (void (**)(id, void *))self->_errorHandler;
      if (errorHandler)
      {
LABEL_12:
        NSErrorWithOSStatusF((const char *)v4);
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        errorHandler[2](errorHandler, v7);

        id v8 = self->_errorHandler;
        goto LABEL_14;
      }

      goto LABEL_13;
    }
  }

  if (v3) {
    return 1;
  }
  id errorHandler = (void (**)(id, void *))self->_errorHandler;
  if (errorHandler)
  {
    uint64_t v4 = 4294960543LL;
    goto LABEL_12;
  }

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  char v17 = a3;
  id v6 = a4;
  unsigned int rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    char v9 = v17;
    if (ucat->var0 != -1)
    {
LABEL_3:
      char v10 = [v9 length];
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _completeReadRequest:error:]",  rawIOLogLevel,  (uint64_t)"Read completed: %zu byte(s), %{error}\n",  v11,  v12,  v13,  v14,  v10);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      char v9 = v17;
      goto LABEL_3;
    }
  }

- (void)writeWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__CUTCPConnection_writeWithRequest___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = objc_alloc_init(&OBJC_CLASS___CUWriteRequest);
  -[CUWriteRequest setEndOfData:](v5, "setEndOfData:", 1LL);
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    uint64_t v7 = 3221225472LL;
    id v8 = __48__CUTCPConnection_writeEndOfDataWithCompletion___block_invoke;
    char v9 = &unk_189F33060;
    id v11 = v4;
    char v10 = v5;
    -[CUWriteRequest setCompletion:](v10, "setCompletion:", &v6);
  }

  -[CUTCPConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);
}

- (void)_processWrites:(BOOL)a3
{
  if (a3)
  {
    int flowControlState = self->_flowControlState;
    if (flowControlState != 10)
    {
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      ucat = self->_ucat;
      if (ucat->var0 <= rawIOLogLevel)
      {
        if (ucat->var0 != -1)
        {
          if (flowControlState) {
            goto LABEL_6;
          }
          goto LABEL_11;
        }

        if (_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel))
        {
          ucat = self->_ucat;
          unsigned int rawIOLogLevel = self->_rawIOLogLevel;
          int flowControlState = self->_flowControlState;
          if (flowControlState)
          {
LABEL_6:
            if (flowControlState == 20)
            {
              id v11 = "Closed";
            }

            else if (flowControlState == 10)
            {
              id v11 = "Open";
            }

            else
            {
              id v11 = "?";
            }

            goto LABEL_14;
          }

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (char *)a3;
  [v6 dataArray];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
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
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    uint64_t v15 = v6 + 16;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v35;
      uint64_t v15 = v6 + 16;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(id *)(*((void *)&v34 + 1) + 8 * i);
          *(void *)uint64_t v15 = [v19 bytes];
          *((void *)v15 + 1) = [v19 length];
          v15 += 16;
        }

        uint64_t v16 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
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

    int rawIOLogLevel = self->_rawIOLogLevel;
    if (gLogCategory_CUTCPConnection > rawIOLogLevel
      || gLogCategory_CUTCPConnection == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUTCPConnection, rawIOLogLevel))
    {
      goto LABEL_27;
    }

    int v26 = *((_DWORD *)v6 + 70);
    if (v26)
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = 16LL * v26;
      uint64_t v29 = (uint64_t *)(*((void *)v6 + 34) + 8LL);
      do
      {
        uint64_t v30 = *v29;
        v29 += 2;
        v27 += v30;
        v28 -= 16LL;
      }

      while (v28);
    }

    unsigned int v31 = self->_rawIOLogLevel;
    ucat = self->_ucat;
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      unsigned int v31 = self->_rawIOLogLevel;
      int v26 = *((_DWORD *)v6 + 70);
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _prepareWriteRequest:error:]",  v31,  (uint64_t)"Write prepared (%d iov, %zu total)\n",  v21,  v22,  v23,  v24,  v26);
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
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!self->_invalidateCalled && !self->_firstError) {
    objc_storeStrong((id *)&self->_firstError, a3);
  }
  netLinkManager = self->_netLinkManager;
  if (netLinkManager && self->_netLinkEndpoint)
  {
    -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
    uint64_t v7 = self->_netLinkManager;
    self->_netLinkManager = 0LL;
  }

  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        NSPrintF();
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        int v26 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _abortWritesWithError:]",  0x1Eu,  (uint64_t)"Abort writes: peer=%@, self=%@, error=%@",  v11,  v12,  v13,  v14,  (char)v9);

        goto LABEL_13;
      }

      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v15 = a3;
  id v10 = a4;
  unsigned int rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPConnection _completeWriteRequest:error:]",  rawIOLogLevel,  (uint64_t)"Write completed: %{error}\n",  v6,  v7,  v8,  v9,  (char)v10);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      goto LABEL_3;
    }
  }

- ($4FF8D77539A8BD95DCE0A545902499A9)peerAddr
{
  retstr->var0 = *(sockaddr *)&self[15].var2.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[15].var2.sin6_addr + 8);
  return self;
}

- ($4FF8D77539A8BD95DCE0A545902499A9)selfAddr
{
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[16].var2.sin6_addr + 8);
  retstr->var0 = *(sockaddr *)&self[16].var2.sin6_flowinfo;
  return self;
}

- (double)connectTimeoutSecs
{
  return self->_connectTimeoutSecs;
}

- (void)setConnectTimeoutSecs:(double)a3
{
  self->_double connectTimeoutSecs = a3;
}

- (double)dataTimeoutSecs
{
  return self->_dataTimeoutSecs;
}

- (void)setDataTimeoutSecs:(double)a3
{
  self->_double dataTimeoutSecs = a3;
}

- (CUBonjourDevice)destinationBonjour
{
  return self->_destinationBonjour;
}

- (void)setDestinationBonjour:(id)a3
{
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
}

- (int)defaultPort
{
  return self->_defaultPort;
}

- (void)setDefaultPort:(int)a3
{
  self->_int defaultPort = a3;
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

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (id)flowControlChangedHandler
{
  return self->_flowControlChangedHandler;
}

- (void)setFlowControlChangedHandler:(id)a3
{
}

- (int)flowControlState
{
  return self->_flowControlState;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (int)keepAliveSeconds
{
  return self->_keepAliveSeconds;
}

- (void)setKeepAliveSeconds:(int)a3
{
  self->_int keepAliveSeconds = a3;
}

- (int)keepAliveIdleSeconds
{
  return self->_keepAliveIdleSeconds;
}

- (void)setKeepAliveIdleSeconds:(int)a3
{
  self->_int keepAliveIdleSeconds = a3;
}

- (int)keepAliveIntervalSeconds
{
  return self->_keepAliveIntervalSeconds;
}

- (void)setKeepAliveIntervalSeconds:(int)a3
{
  self->_keepAliveIntervalSeconds = a3;
}

- (int)keepAliveMaxCount
{
  return self->_keepAliveMaxCount;
}

- (void)setKeepAliveMaxCount:(int)a3
{
  self->_keepAliveMaxCount = a3;
}

- (NSString)label
{
  return self->_label;
}

- (CUNANDataSession)nanDataSession
{
  return self->_nanDataSession;
}

- (void)setNanDataSession:(id)a3
{
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNetLinkManager:(id)a3
{
}

- (unsigned)netTransportType
{
  return self->_netTransportType;
}

- (id)socketEventHandler
{
  return self->_socketEventHandler;
}

- (void)setSocketEventHandler:(id)a3
{
}

- (int)socketFD
{
  return self->_socketFD;
}

- (void)setSocketFD:(int)a3
{
  self->_int socketFD = a3;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
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

void __48__CUTCPConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __36__CUTCPConnection_writeWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 112))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeWriteRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 72) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[76] & 0x80000000) == 0) {
      [v4 _processWrites:0];
    }
  }

void __35__CUTCPConnection_readWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 112))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeReadRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 40) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[76] & 0x80000000) == 0) {
      [v4 _processReads:0];
    }
  }

void __39__CUTCPConnection__netLinkStateChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 200LL);
  if (!v2) {
    return;
  }
  int v7 = [v2 state];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(int **)(v8 + 216);
  if (*v9 <= 20)
  {
    if (*v9 != -1)
    {
LABEL_4:
      LogPrintF( (uint64_t)v9,  (uint64_t)"-[CUTCPConnection _netLinkStateChanged]_block_invoke",  0x14u,  (uint64_t)"NetLink state changed: %##a, %s\n",  v3,  v4,  v5,  v6,  v8 - 88);
      goto LABEL_7;
    }

    if (_LogCategory_Initialize((uint64_t)v9, 0x14u))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(int **)(v8 + 216);
      goto LABEL_4;
    }
  }

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _netLinkStateChanged];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites:1];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processSocketEvents];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __29__CUTCPConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void __42__CUTCPConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  id v9 = 0LL;
  [v5 _activateDirectAndReturnError:&v9];
  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = 0LL;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

uint64_t __35__CUTCPConnection_setTrafficFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrafficRegistration];
}

@end