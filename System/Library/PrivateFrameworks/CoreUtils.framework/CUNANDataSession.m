@interface CUNANDataSession
- ($4FF8D77539A8BD95DCE0A545902499A9)peerAddress;
- (BOOL)_dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5 error:(id *)a6;
- (CUNANDataSession)init;
- (CUNANEndpoint)peerEndpoint;
- (NSString)description;
- (NSString)identifier;
- (NSString)label;
- (NSString)peerAddressString;
- (NSString)peerEndpointString;
- (OS_dispatch_queue)dispatchQueue;
- (WiFiAwareDataSession)wfaDataSessionClient;
- (WiFiAwarePublisher)publisher;
- (WiFiAwarePublisherDataSessionHandle)wfaDataSessionServer;
- (id)descriptionWithLevel:(int)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)terminationHandler;
- (unsigned)controlFlags;
- (unsigned)localInterfaceIndex;
- (unsigned)trafficFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_terminateServerDataSession;
- (void)activateWithCompletion:(id)a3;
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)dealloc;
- (void)generateStatisticsReportWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)reportIssue:(id)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocalInterfaceIndex:(unsigned int)a3;
- (void)setPeerAddress:(id *)a3;
- (void)setPeerEndpoint:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setTerminationHandler:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)setWfaDataSessionServer:(id)a3;
- (void)updateLinkStatus:(int)a3;
@end

@implementation CUNANDataSession

- (CUNANDataSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUNANDataSession;
  v2 = -[CUNANDataSession init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUNANDataSession;
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
  v4.super_class = (Class)&OBJC_CLASS___CUNANDataSession;
  -[CUNANDataSession dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[CUNANDataSession descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v12 = 0LL;
  NSAppendPrintF(&v12);
  objc_super v5 = v12;
  v6 = v5;
  if (self->_peerAddress.sa.sa_family)
  {
    CFMutableStringRef v11 = v5;
    NSAppendPrintF(&v11);
    v7 = v11;

    v6 = v7;
  }

  if (a3 <= 20)
  {
    CFMutableStringRef v10 = v6;
    NSAppendPrintF(&v10);
    v8 = v10;

    v6 = v8;
  }

  return v6;
}

- (NSString)peerAddressString
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3[0] = 0;
  SockAddrToString((uint64_t)&self->_peerAddress, 1, v3);
  [NSString stringWithUTF8String:v3];
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)peerEndpointString
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3[0] = 0;
  SockAddrToString((uint64_t)&self->_peerAddress, 0, v3);
  [NSString stringWithUTF8String:v3];
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPeerEndpoint:(id)a3
{
  id v7 = a3;
  [v7 identifier];
  objc_super v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;
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
  v7[2] = __43__CUNANDataSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  aBlock = (void (**)(void))a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      peerEndpoint = self->_peerEndpoint;
      CUPrintFlags(self->_controlFlags, byte_186B4AA3C, 1);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintFlags(self->_trafficFlags, byte_186B4ACE3, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUNANDataSession _activateWithCompletion:]",  0x1Eu,  (uint64_t)"Activate: endpoint=%@, controlFlags=%@, trafficFlags=%@",  v7,  v8,  v9,  v10,  (char)peerEndpoint);

      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUNANDataSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANDataSession _invalidate]",  0x1Eu,  (uint64_t)"Invalidate\n",  v2,  v3,  v4,  v5,  v8);
    }

- (void)_invalidated
{
  if (!self->_invalidateDone && !self->_wfaDataSessionClient && !self->_wfaDataSessionServer)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id terminationHandler = self->_terminationHandler;
    self->_id terminationHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANDataSession _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v7,  v8,  v9,  v10,  v12);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }

- (void)generateStatisticsReportWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)reportIssue:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __32__CUNANDataSession_reportIssue___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)updateLinkStatus:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __37__CUNANDataSession_updateLinkStatus___block_invoke;
  v4[3] = &unk_189F32F60;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_terminateServerDataSession
{
  uint64_t v7 = self->_wfaDataSessionServer;
  if (v7)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANDataSession _terminateServerDataSession]",  0x1Eu,  (uint64_t)"WFA DataSession terminate start\n",  v3,  v4,  v5,  v6,  v10);
    }

- (void)dataSessionRequestStarted:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__CUNANDataSession_dataSessionRequestStarted___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __55__CUNANDataSession_dataSession_failedToStartWithError___block_invoke;
  v5[3] = &unk_189F317F8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __80__CUNANDataSession_dataSession_confirmedForPeerDataAddress_serviceSpecificInfo___block_invoke;
  v15[3] = &unk_189F32D00;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (BOOL)_dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  [a4 ipv6LinkLocalAddress];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 length];
  if (v13 == 16)
  {
    *(void *)&self->_peerAddress.v6.sin6_addr.__u6_addr16[1] = 0LL;
    *(void *)&self->_peerAddress.v4.sin_port = 0LL;
    HIWORD(self->_peerAddress.v6.sin6_scope_id) = 0;
    *(void *)((char *)&self->_peerAddress.v6.sin6_addr.__u6_addr32[2] + 2) = 0LL;
    *(_WORD *)&self->_peerAddress.sa.sa_len = 7708;
    self->_peerAddress.v6.sin6_addr = *(in6_addr *)[v12 bytes];
    self->_peerAddress.v6.sin6_scope_id = [v10 localInterfaceIndex];
    self->_peerAddress.v4.sin_port = __rev16([v11 servicePort]);
    self->_localInterfaceIndex = [v10 localInterfaceIndex];
  }

  else if (a6)
  {
    [v12 length];
    NSErrorWithOSStatusF((const char *)0xFFFFE5A9LL);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13 == 16;
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __53__CUNANDataSession_dataSession_terminatedWithReason___block_invoke;
  v5[3] = &unk_189F317F8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
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

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
}

- (void)setLocalInterfaceIndex:(unsigned int)a3
{
  self->_localInterfaceIndex = a3;
}

- ($4FF8D77539A8BD95DCE0A545902499A9)peerAddress
{
  retstr->var0 = *(sockaddr *)((char *)&self[4].var2.sin6_addr + 8);
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = (in6_addr)self[5].var0;
  return self;
}

- (void)setPeerAddress:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_peerAddress.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_peerAddress.sa = var0;
}

- (CUNANEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (id)terminationHandler
{
  return self->_terminationHandler;
}

- (void)setTerminationHandler:(id)a3
{
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_unsigned int trafficFlags = a3;
}

- (WiFiAwareDataSession)wfaDataSessionClient
{
  return self->_wfaDataSessionClient;
}

- (WiFiAwarePublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (WiFiAwarePublisherDataSessionHandle)wfaDataSessionServer
{
  return self->_wfaDataSessionServer;
}

- (void)setWfaDataSessionServer:(id)a3
{
}

- (void).cxx_destruct
{
}

void __53__CUNANDataSession_dataSession_terminatedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 104)) {
    return;
  }
  uint64_t v3 = (const char *)(*(_DWORD *)(a1 + 40) + 312370);
  uint64_t v4 = *(int **)(v1 + 24);
  if (*v4 <= 30)
  {
    if (*v4 == -1)
    {
      BOOL v10 = _LogCategory_Initialize(*(void *)(v1 + 24), 0x1Eu);
      uint64_t v1 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_7;
      }
      uint64_t v4 = *(int **)(v1 + 24);
    }

    [*(id *)(v1 + 88) identifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v4,  (uint64_t)"-[CUNANDataSession dataSession:terminatedWithReason:]_block_invoke",  0x1Eu,  (uint64_t)"WFA DataSession terminated: %@, %#m\n",  v6,  v7,  v8,  v9,  (char)v5);

    uint64_t v1 = *(void *)(a1 + 32);
  }

void __80__CUNANDataSession_dataSession_confirmedForPeerDataAddress_serviceSpecificInfo___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 104)) {
    return;
  }
  uint64_t v3 = *(int **)(v2 + 24);
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(*(void *)(v2 + 24), 0x1Eu);
      uint64_t v2 = *(void *)(a1 + 32);
      if (!v9) {
        goto LABEL_6;
      }
      uint64_t v3 = *(int **)(v2 + 24);
    }

    [*(id *)(v2 + 88) identifier];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) servicePort];
    [*(id *)(a1 + 56) localInterfaceIndex];
    LogPrintF_safe( (uint64_t)v3,  (uint64_t)"-[CUNANDataSession dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:]_block_invoke",  0x1Eu,  (uint64_t)"WFA DataSession confirmed: id=%@, mac=%@, port=%d, ifindex=%u",  v5,  v6,  v7,  v8,  (char)v4);

    uint64_t v2 = *(void *)(a1 + 32);
  }

void __55__CUNANDataSession_dataSession_failedToStartWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 104)) {
    return;
  }
  uint64_t v3 = (const char *)(*(_DWORD *)(a1 + 40) + 312300);
  uint64_t v4 = *(int **)(v1 + 24);
  if (*v4 <= 90)
  {
    if (*v4 == -1)
    {
      BOOL v10 = _LogCategory_Initialize(*(void *)(v1 + 24), 0x5Au);
      uint64_t v1 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_7;
      }
      uint64_t v4 = *(int **)(v1 + 24);
    }

    [*(id *)(v1 + 88) identifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v4,  (uint64_t)"-[CUNANDataSession dataSession:failedToStartWithError:]_block_invoke",  0x5Au,  (uint64_t)"### WFA DataSession start failed: %@, %#m\n",  v6,  v7,  v8,  v9,  (char)v5);

    uint64_t v1 = *(void *)(a1 + 32);
  }

void __46__CUNANDataSession_dataSessionRequestStarted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 104))
  {
    uint64_t v2 = *(int **)(v1 + 24);
    if (*v2 <= 30)
    {
      if (*v2 != -1)
      {
LABEL_4:
        [*(id *)(v1 + 88) identifier];
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)v2,  (uint64_t)"-[CUNANDataSession dataSessionRequestStarted:]_block_invoke",  0x1Eu,  (uint64_t)"WFA DataSession request started: %@\n",  v3,  v4,  v5,  v6,  (char)v8);

        return;
      }

      if (_LogCategory_Initialize(*(void *)(v1 + 24), 0x1Eu))
      {
        uint64_t v1 = *(void *)(a1 + 32);
        uint64_t v2 = *(int **)(v1 + 24);
        goto LABEL_4;
      }
    }
  }

void __47__CUNANDataSession__terminateServerDataSession__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 48);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __47__CUNANDataSession__terminateServerDataSession__block_invoke_2;
  v4[3] = &unk_189F317F8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void __47__CUNANDataSession__terminateServerDataSession__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 120)) {
    return;
  }
  BOOL v10 = *(int **)(v8 + 24);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      BOOL v10 = *(int **)(v8 + 24);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNANDataSession _terminateServerDataSession]_block_invoke_2",  0x1Eu,  (uint64_t)"WFA DataSession terminate completed: %#m\n",  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
  }

void __37__CUNANDataSession_updateLinkStatus___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104LL);
  if (!v2)
  {
    id v11 = *(id *)(*(void *)(a1 + 32) + 112LL);
    id v7 = *(id *)(*(void *)(a1 + 32) + 120LL);
    if (v11) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24LL);
      if (*v9 <= 90)
      {
        if (*v9 == -1)
        {
          uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24LL);
        }

        LogPrintF( (uint64_t)v9,  (uint64_t)"-[CUNANDataSession updateLinkStatus:]_block_invoke",  0x5Au,  (uint64_t)"### Update link status without underlying data session",  v3,  v4,  v5,  v6,  v10);
      }
    }

    else
    {
      [v11 updateLinkStatus:*(_DWORD *)(a1 + 40) == 1 forDataSession:v7];
    }

void __32__CUNANDataSession_reportIssue___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104LL);
  if (!v2)
  {
    id v11 = *(id *)(*(void *)(a1 + 32) + 112LL);
    id v7 = *(id *)(*(void *)(a1 + 32) + 120LL);
    if (v11) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24LL);
      if (*v9 <= 90)
      {
        if (*v9 == -1)
        {
          uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24LL);
        }

        LogPrintF( (uint64_t)v9,  (uint64_t)"-[CUNANDataSession reportIssue:]_block_invoke",  0x5Au,  (uint64_t)"### Report issue without underlying data session",  v3,  v4,  v5,  v6,  v10);
      }
    }

    else
    {
      [v11 reportIssue:*(void *)(a1 + 40) forDataSession:v7];
    }

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104LL);
  if (v2)
  {
    uint64_t v3 = v2;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_189F31418;
    uint64_t v4 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v4;
    [v3 generateStatisticsReportWithCompletionHandler:v16];
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v5 + 112);
    uint64_t v6 = *(void **)(v5 + 120);
    if (v3) {
      BOOL v7 = v6 == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = (void *)*MEMORY[0x189607670];
      id v10 = v6;
      id v11 = v3;
      NSErrorF_safe(v9, (const char *)0xFFFFE5D4LL);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v12);
    }

    else
    {
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_4;
      v14[3] = &unk_189F31418;
      v14[4] = v5;
      id v15 = *(id *)(a1 + 40);
      id v13 = v6;
      [v3 generateStatisticsReportForDataSession:v13 completionHandler:v14];
    }
  }
}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  BOOL v7 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 48LL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3;
  block[3] = &unk_189F316E0;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  BOOL v7 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 48LL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_5;
  block[3] = &unk_189F316E0;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  if (v3)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)(v3 + 312300));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v4);
  }

  else
  {
    (*(void (**)(void, void, void))(v1 + 16))(a1[5], a1[4], 0LL);
  }

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  if (v3)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)(v3 + 312300));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v4);
  }

  else
  {
    (*(void (**)(void, void, void))(v1 + 16))(a1[5], a1[4], 0LL);
  }

uint64_t __30__CUNANDataSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __43__CUNANDataSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

@end