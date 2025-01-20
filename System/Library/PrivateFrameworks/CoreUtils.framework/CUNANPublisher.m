@interface CUNANPublisher
- (BOOL)dataPathEnabled;
- (CUNANEndpoint)mockEndpoint;
- (CUNANPublisher)init;
- (NSArray)dataSessions;
- (NSData)customData;
- (NSDictionary)textInfo;
- (NSString)description;
- (NSString)label;
- (NSString)mockID;
- (NSString)mockPeerEndpointString;
- (NSString)name;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)dataSessionEndedHandler;
- (id)dataSessionStartedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)receiveHandler;
- (int)port;
- (unsigned)controlFlags;
- (unsigned)trafficFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)_updateServiceSpecificInfo;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)generateStatisticsReportWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)publisher:(id)a3 dataIndicatedForHandle:(id)a4 serviceSpecificInfo:(id)a5;
- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5;
- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6;
- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)publisherStarted:(id)a3;
- (void)reportIssue:(id)a3;
- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)setControlFlags:(unsigned int)a3;
- (void)setCustomData:(id)a3;
- (void)setDataPathEnabled:(BOOL)a3;
- (void)setDataSessionEndedHandler:(id)a3;
- (void)setDataSessionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMockEndpoint:(id)a3;
- (void)setMockID:(id)a3;
- (void)setMockPeerEndpointString:(id)a3;
- (void)setName:(id)a3;
- (void)setPort:(int)a3;
- (void)setReceiveHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTextInfo:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)updateLinkStatus:(int)a3;
@end

@implementation CUNANPublisher

- (CUNANPublisher)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUNANPublisher;
  v2 = -[CUNANPublisher init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataPathEnabled = 1;
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_ucat = (LogCategory *)&gLogCategory_CUNANPublisher;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  v3 = self->_mockID;
  v4 = v3;
  if (v3) {
    CUNANMockRemovePublisher(v3, self);
  }
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUNANPublisher;
  -[CUNANPublisher dealloc](&v6, sel_dealloc);
}

- (NSArray)dataSessions
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sessions;
  v4 = v3;
  if (v3)
  {
    v5 = -[NSMutableDictionary allValues](v3, "allValues");
  }

  else
  {
    v5 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (NSString)description
{
  CFMutableStringRef v3 = 0LL;
  NSAppendPrintF(&v3);
  return (NSString *)v3;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)setTextInfo:(id)a3
{
  id v5 = a3;
  textInfo = self->_textInfo;
  v7 = (NSDictionary *)v5;
  v8 = textInfo;
  if (v8 == v7)
  {
  }

  else
  {
    v9 = v8;
    if ((v7 == 0LL) != (v8 != 0LL))
    {
      char v10 = -[NSDictionary isEqual:](v7, "isEqual:", v8);

      if ((v10 & 1) != 0) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_textInfo, a3);
    if (self->_wfaPublisher)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __30__CUNANPublisher_setTextInfo___block_invoke;
      block[3] = &unk_189F34238;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__CUNANPublisher_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void))a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      serviceType = self->_serviceType;
      CUPrintFlags(self->_trafficFlags, byte_186B4ACE3, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary count](self->_textInfo, "count");
      NSPrintF();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUNANPublisher _activateWithCompletion:]",  0x1Eu,  (uint64_t)"Activate: serviceType=%@, name='%@', port=%d, trafficFlags=%@, customData=%@, textInfo=%@",  v8,  v9,  v10,  v11,  (char)serviceType);

      goto LABEL_6;
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
  block[2] = __28__CUNANPublisher_invalidate__block_invoke;
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

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANPublisher _invalidate]",  0x1Eu,  (uint64_t)"Invalidate\n",  v2,  v3,  v4,  v5,  v8);
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_wfaPublisher
    && !-[NSMutableDictionary count](self->_sessions, "count"))
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id dataSessionStartedHandler = self->_dataSessionStartedHandler;
    self->_id dataSessionStartedHandler = 0LL;

    id dataSessionEndedHandler = self->_dataSessionEndedHandler;
    self->_id dataSessionEndedHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v7 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id receiveHandler = self->_receiveHandler;
    self->_id receiveHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_9:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANPublisher _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v9,  v10,  v11,  v12,  v14);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_9;
      }
    }
  }

- (void)generateStatisticsReportWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke;
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
  v7[2] = __30__CUNANPublisher_reportIssue___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke;
  v15[3] = &unk_189F32D28;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

- (void)updateLinkStatus:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __35__CUNANPublisher_updateLinkStatus___block_invoke;
  v4[3] = &unk_189F32F60;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_updateServiceSpecificInfo
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      name = self->_name;
      NSPrintF();
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUNANPublisher _updateServiceSpecificInfo]",  0x1Eu,  (uint64_t)"Update SSI: name=%@, customData=%@, textInfo=%@",  v5,  v6,  v7,  v8,  (char)name);

      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)publisherStarted:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__CUNANPublisher_publisherStarted___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __51__CUNANPublisher_publisher_failedToStartWithError___block_invoke;
  v5[3] = &unk_189F317F8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __49__CUNANPublisher_publisher_terminatedWithReason___block_invoke;
  v5[3] = &unk_189F317F8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __79__CUNANPublisher_publisher_receivedMessage_fromSubscriberID_subscriberAddress___block_invoke;
  v14[3] = &unk_189F32CB0;
  v14[4] = self;
  id v15 = v10;
  unsigned __int8 v17 = a5;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(dispatchQueue, v14);
}

- (void)publisher:(id)a3 dataIndicatedForHandle:(id)a4 serviceSpecificInfo:(id)a5
{
  id v6 = a4;
  [v6 initiatorDataAddress];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 data];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 datapathID];

  _WiFiAwareCreateEndpointIdentifier(v8);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANPublisher publisher:dataIndicatedForHandle:serviceSpecificInfo:]",  0x1Eu,  (uint64_t)"WFA DataSession indicated: '%@', %@\n",  v9,  v10,  v11,  v12,  (char)self->_serviceType);
  }

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __91__CUNANPublisher_publisher_dataConfirmedForHandle_localInterfaceIndex_serviceSpecificInfo___block_invoke;
  block[3] = &unk_189F31490;
  block[4] = self;
  id v18 = v10;
  unsigned int v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)_publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v39 = a3;
  id v10 = a4;
  id v11 = a6;
  [v10 initiatorDataAddress];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 data];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 datapathID];
  _WiFiAwareCreateEndpointIdentifier(v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]",  0x5Au,  (uint64_t)"### WFA DataSession confirmed missing identifier\n",  v15,  v16,  v17,  v18,  v38);
      goto LABEL_25;
    }

    goto LABEL_25;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v14);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v26 = objc_alloc_init(&OBJC_CLASS___CUNANEndpoint);
    -[CUNANEndpoint setIdentifier:](v26, "setIdentifier:", v14);
    -[CUNANEndpoint setServiceType:](v26, "setServiceType:", self->_serviceType);
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___CUNANDataSession);
    -[CUNANDataSession setDispatchQueue:](v27, "setDispatchQueue:", self->_dispatchQueue);
    -[CUNANDataSession setIdentifier:](v27, "setIdentifier:", v14);
    if (self->_label) {
      -[CUNANDataSession setLabel:](v27, "setLabel:");
    }
    -[CUNANDataSession setLocalInterfaceIndex:](v27, "setLocalInterfaceIndex:", v7);
    -[CUNANDataSession setPeerEndpoint:](v27, "setPeerEndpoint:", v26);
    -[CUNANDataSession setTrafficFlags:](v27, "setTrafficFlags:", self->_trafficFlags);
    -[CUNANDataSession setWfaDataSessionServer:](v27, "setWfaDataSessionServer:", v10);
    uint64_t v32 = self->_ucat;
    if (v32->var0 > 30) {
      goto LABEL_20;
    }
    if (v32->var0 == -1)
    {
      uint64_t v32 = self->_ucat;
    }

    LogPrintF( (uint64_t)v32,  (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]",  0x1Eu,  (uint64_t)"DataSession started: %@\n",  v28,  v29,  v30,  v31,  (char)v27);
LABEL_20:
    uint64_t v33 = self;
    objc_sync_enter(v33);
    sessions = self->_sessions;
    if (!sessions)
    {
      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      v36 = self->_sessions;
      self->_sessions = v35;

      sessions = self->_sessions;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v27, v14);
    objc_sync_exit(v33);

    id dataSessionStartedHandler = (void (**)(id, CUNANDataSession *))v33->_dataSessionStartedHandler;
    if (dataSessionStartedHandler) {
      dataSessionStartedHandler[2](dataSessionStartedHandler, v27);
    }

    goto LABEL_25;
  }

  v24 = self->_ucat;
  if (v24->var0 <= 90)
  {
    if (v24->var0 == -1)
    {
      v24 = self->_ucat;
    }

    LogPrintF( (uint64_t)v24,  (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]",  0x5Au,  (uint64_t)"### WFA DataSession confirmed for existing session: %@\n",  v20,  v21,  v22,  v23,  (char)v14);
  }

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__CUNANPublisher_publisher_dataTerminatedForHandle_reason___block_invoke;
  block[3] = &unk_189F32C60;
  block[4] = self;
  id v11 = v7;
  int64_t v12 = a5;
  id v9 = v7;
  dispatch_async(dispatchQueue, block);
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_unsigned int controlFlags = a3;
}

- (NSData)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
}

- (BOOL)dataPathEnabled
{
  return self->_dataPathEnabled;
}

- (void)setDataPathEnabled:(BOOL)a3
{
  self->_dataPathEnabled = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (CUNANEndpoint)mockEndpoint
{
  return self->_mockEndpoint;
}

- (void)setMockEndpoint:(id)a3
{
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
}

- (NSString)mockPeerEndpointString
{
  return self->_mockPeerEndpointString;
}

- (void)setMockPeerEndpointString:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSDictionary)textInfo
{
  return self->_textInfo;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_unsigned int trafficFlags = a3;
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

- (id)dataSessionStartedHandler
{
  return self->_dataSessionStartedHandler;
}

- (void)setDataSessionStartedHandler:(id)a3
{
}

- (id)dataSessionEndedHandler
{
  return self->_dataSessionEndedHandler;
}

- (void)setDataSessionEndedHandler:(id)a3
{
}

- (id)receiveHandler
{
  return self->_receiveHandler;
}

- (void)setReceiveHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __59__CUNANPublisher_publisher_dataTerminatedForHandle_reason___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40LL))
  {
    [*(id *)(a1 + 40) initiatorDataAddress];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 data];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) datapathID];
    uint64_t v33 = _WiFiAwareCreateEndpointIdentifier(v3);

    uint64_t v8 = (const char *)(*(_DWORD *)(a1 + 48) + 312370);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(int **)(v9 + 32);
    if (*v10 <= 30)
    {
      if (*v10 != -1) {
        goto LABEL_4;
      }
      BOOL v13 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (v13)
      {
        id v10 = *(int **)(v9 + 32);
LABEL_4:
        LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke",  0x1Eu,  (uint64_t)"WFA DataSession terminated: '%@', %@, %#m\n",  v4,  v5,  v6,  v7,  *(void *)(v9 + 120));
        id v11 = (void *)v33;
        uint64_t v9 = *(void *)(a1 + 32);
        if (!v33)
        {
LABEL_5:
          int64_t v12 = *(int **)(v9 + 32);
          if (*v12 > 90)
          {
LABEL_24:

            return;
          }

          if (*v12 == -1)
          {
            BOOL v32 = _LogCategory_Initialize((uint64_t)v12, 0x5Au);
            id v11 = (void *)v33;
            if (!v32) {
              goto LABEL_24;
            }
            int64_t v12 = *(int **)(*(void *)(a1 + 32) + 32LL);
          }

          LogPrintF( (uint64_t)v12,  (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke",  0x5Au,  (uint64_t)"### WFA DataSession terminated missing identifier: %#m\n",  v4,  v5,  v6,  v7,  (char)v8);
LABEL_23:
          id v11 = (void *)v33;
          goto LABEL_24;
        }

void *__91__CUNANPublisher_publisher_dataConfirmedForHandle_localInterfaceIndex_serviceSpecificInfo___block_invoke( uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[5]) {
    return (void *)[result _publisher:*(void *)(a1 + 40) dataConfirmedForHandle:*(void *)(a1 + 48) localInterfaceIndex:*(unsigned int *)(a1 + 64) serviceSpecificInfo:*(void *)(a1 + 56)];
  }
  return result;
}

void __79__CUNANPublisher_publisher_receivedMessage_fromSubscriberID_subscriberAddress___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    uint64_t v3 = _Block_copy(*(const void **)(v1 + 168));
    if (!v3)
    {
LABEL_8:

      return;
    }

    int64_t v12 = (void (**)(id, void, CUNANEndpoint *))v3;
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CUNANEndpoint);
    [*(id *)(a1 + 40) data];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WiFiAwareCreateEndpointIdentifier(v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUNANEndpoint setIdentifier:](v4, "setIdentifier:", v6);

    -[CUNANEndpoint setInstanceID:](v4, "setInstanceID:", *(unsigned __int8 *)(a1 + 56));
    -[CUNANEndpoint setMacAddress:](v4, "setMacAddress:", *(void *)(a1 + 40));
    id v11 = *(int **)(*(void *)(a1 + 32) + 32LL);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        id v11 = *(int **)(*(void *)(a1 + 32) + 32LL);
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUNANPublisher publisher:receivedMessage:fromSubscriberID:subscriberAddress:]_block_invoke",  0x1Eu,  (uint64_t)"Received message: EP %@, Data %@",  v7,  v8,  v9,  v10,  (char)v4);
    }

void __49__CUNANPublisher_publisher_terminatedWithReason___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 40))
  {
    uint64_t v10 = *(int **)(v8 + 32);
    if (*v10 > 30) {
      goto LABEL_8;
    }
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v11)
      {
LABEL_8:
        uint64_t v27 = (void (**)(id, void))_Block_copy(*(const void **)(v8 + 8));
        uint64_t v12 = *(void *)(a1 + 32);
        BOOL v13 = *(void **)(v12 + 8);
        *(void *)(v12 + 8) = 0LL;

        uint64_t v18 = *(void *)(a1 + 40);
        if (v27)
        {
          if (v18 == 2)
          {
            v27[2](v27, 0LL);
LABEL_12:
            uint64_t v19 = *(void *)(a1 + 32);
            uint64_t v20 = *(void **)(v19 + 40);
            *(void *)(v19 + 40) = 0LL;

            [*(id *)(a1 + 32) _invalidated];
LABEL_22:

            return;
          }

          NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v27)[2](v27, v21);
        }

        else if (v18 == 2)
        {
          goto LABEL_12;
        }

        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void *)(v22 + 136);
        if (v23)
        {
          (*(void (**)(void))(v23 + 16))();
          uint64_t v22 = *(void *)(a1 + 32);
        }

        if (*(_BYTE *)(v22 + 16)) {
          goto LABEL_22;
        }
        uint64_t v24 = *(int **)(v22 + 32);
        if (*v24 <= 30)
        {
          if (*v24 == -1)
          {
            BOOL v25 = _LogCategory_Initialize((uint64_t)v24, 0x1Eu);
            uint64_t v22 = *(void *)(a1 + 32);
            if (!v25) {
              goto LABEL_21;
            }
            uint64_t v24 = *(int **)(v22 + 32);
          }

          LogPrintF( (uint64_t)v24,  (uint64_t)"-[CUNANPublisher publisher:terminatedWithReason:]_block_invoke",  0x1Eu,  (uint64_t)"WFAPublisher restarting after unexpected termination\n",  v14,  v15,  v16,  v17,  v26);
          uint64_t v22 = *(void *)(a1 + 32);
        }

void __51__CUNANPublisher_publisher_failedToStartWithError___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 40)) {
    return;
  }
  uint64_t v10 = (const char *)(*(_DWORD *)(a1 + 40) + 312300);
  BOOL v11 = *(int **)(v8 + 32);
  if (*v11 <= 90)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v12) {
        goto LABEL_7;
      }
      BOOL v11 = *(int **)(v8 + 32);
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUNANPublisher publisher:failedToStartWithError:]_block_invoke",  0x5Au,  (uint64_t)"### WFAPublisher start failed: '%@', %#m\n",  a5,  a6,  a7,  a8,  *(void *)(v8 + 120));
    uint64_t v8 = *(void *)(a1 + 32);
  }

void __35__CUNANPublisher_publisherStarted___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 40)) {
    return;
  }
  uint64_t v10 = *(int **)(v8 + 32);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v8 + 32);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNANPublisher publisherStarted:]_block_invoke",  0x1Eu,  (uint64_t)"WFAPublisher started: '%@'\n",  a5,  a6,  a7,  a8,  *(void *)(v8 + 120));
    uint64_t v8 = *(void *)(a1 + 32);
  }

uint64_t __44__CUNANPublisher__updateServiceSpecificInfo__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (a2)
  {
    uint64_t v8 = result;
    result = *(void *)(*(void *)(result + 32) + 32LL);
    if (*(int *)result <= 90)
    {
      char v9 = a2;
      if (*(_DWORD *)result != -1) {
        return LogPrintF_safe( result,  (uint64_t)"-[CUNANPublisher _updateServiceSpecificInfo]_block_invoke",  0x5Au,  (uint64_t)"### Update SSI failed: errorCode=%d",  a5,  a6,  a7,  a8,  v9);
      }
      result = _LogCategory_Initialize(result, 0x5Au);
      if ((_DWORD)result)
      {
        result = *(void *)(*(void *)(v8 + 32) + 32LL);
        return LogPrintF_safe( result,  (uint64_t)"-[CUNANPublisher _updateServiceSpecificInfo]_block_invoke",  0x5Au,  (uint64_t)"### Update SSI failed: errorCode=%d",  a5,  a6,  a7,  a8,  v9);
      }
    }
  }

  return result;
}

void __35__CUNANPublisher_updateLinkStatus___block_invoke(uint64_t a1)
{
  id v12 = *(id *)(*(void *)(a1 + 32) + 40LL);
  [*(id *)(*(void *)(a1 + 32) + 24) allValues];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 firstObject];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 wfaDataSessionServer];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    BOOL v9 = v4 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    uint64_t v10 = *(int **)(*(void *)(a1 + 32) + 32LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(*(void *)(a1 + 32) + 32LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNANPublisher updateLinkStatus:]_block_invoke",  0x5Au,  (uint64_t)"### Update link status without underlying data session",  v5,  v6,  v7,  v8,  v11);
    }
  }

  else
  {
    [v12 updateLinkStatus:*(_DWORD *)(a1 + 40) == 1 forDataSession:v4];
  }

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = 0LL;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__4847;
  BOOL v32 = __Block_byref_object_dispose__4848;
  id v33 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_24;
  aBlock[3] = &unk_189F32BC0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v27 = &v28;
  aBlock[4] = v3;
  id v26 = *(id *)(a1 + 56);
  uint64_t v4 = (void (**)(void))_Block_copy(aBlock);
  id v5 = *(id *)(*(void *)(a1 + 32) + 40LL);
  if (!v5)
  {
    uint64_t v18 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5A7LL);
    uint64_t v13 = (void *)v29[5];
    v29[5] = v18;
    goto LABEL_12;
  }

  [*(id *)(a1 + 40) discoveryResult];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 publishID];
    [v7 publisherAddress];
  }

  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) instanceID];
    [*(id *)(a1 + 40) macAddress];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    uint64_t v19 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    uint64_t v20 = (void *)v29[5];
    v29[5] = v19;

    goto LABEL_11;
  }

  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(int **)(v14 + 32);
  if (*v15 <= 30)
  {
    if (*v15 == -1)
    {
      BOOL v16 = _LogCategory_Initialize((uint64_t)v15, 0x1Eu);
      uint64_t v14 = *(void *)(a1 + 32);
      if (!v16) {
        goto LABEL_10;
      }
      id v15 = *(int **)(v14 + 32);
    }

    LogPrintF( (uint64_t)v15,  (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_2",  0x1Eu,  (uint64_t)"SendMessage start: EP %@, Data %.12@",  v9,  v10,  v11,  v12,  *(void *)(a1 + 40));
    uint64_t v14 = *(void *)(a1 + 32);
  }

uint64_t __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_24( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    uint64_t v9 = (void *)result;
    uint64_t v10 = *(int **)(*(void *)(result + 32) + 32LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(v9[4] + 32LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke",  0x5Au,  (uint64_t)"### SendMessage failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_4;
  block[3] = &unk_189F31528;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = *(dispatch_queue_s **)(v3 + 72);
  block[1] = 3221225472LL;
  uint64_t v10 = a2;
  block[4] = v3;
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v5, block);
}

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_4( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = a1[8];
  if (v9)
  {
    uint64_t v10 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)(v9 + 312300));
    id v15 = *(int **)(a1[4] + 32LL);
    id v17 = (id)v10;
    if (*v15 <= 90)
    {
      if (*v15 == -1)
      {
        id v15 = *(int **)(a1[4] + 32LL);
      }

      LogPrintF( (uint64_t)v15,  (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_4",  0x5Au,  (uint64_t)"### SendMessage failed: EP %@, Data %.12@, %{error}",  v11,  v12,  v13,  v14,  a1[5]);
    }

void __30__CUNANPublisher_reportIssue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  if (v2)
  {
    uint64_t v3 = *(void **)(v1 + 24);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __30__CUNANPublisher_reportIssue___block_invoke_2;
    v5[3] = &unk_189F31440;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    id v4 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v5];
  }

void __30__CUNANPublisher_reportIssue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 32) reportIssue:*(void *)(a1 + 40) forDataSession:v4];
    id v4 = v5;
  }
}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  id v4 = *(id *)(v2 + 40);
  [v3 allValues];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 firstObject];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 wfaDataSessionServer];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D4LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0LL, v10);
  }

  else
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_189F31418;
    uint64_t v11 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v11;
    [v4 generateStatisticsReportForDataSession:v7 completionHandler:v12];
  }
}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  id v7 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 72LL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_3;
  block[3] = &unk_189F316E0;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_3(void *a1)
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

uint64_t __29__CUNANPublisher__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

uint64_t __28__CUNANPublisher_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __41__CUNANPublisher_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __30__CUNANPublisher_setTextInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateServiceSpecificInfo];
}

@end