@interface CUNANSubscriber
- (CUNANSubscriber)init;
- (NSArray)discoveredEndpoints;
- (NSString)description;
- (NSString)label;
- (NSString)mockID;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)descriptionWithLevel:(int)a3;
- (id)endpointChangedHandler;
- (id)endpointFoundHandler;
- (id)endpointLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)receiveHandler;
- (unsigned)changeFlags;
- (unsigned)controlFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_lostAllEndpoints;
- (void)_subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)_subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)reportMockEndpointFound:(id)a3;
- (void)reportMockEndpointLost:(id)a3;
- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpointChangedHandler:(id)a3;
- (void)setEndpointFoundHandler:(id)a3;
- (void)setEndpointLostHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMockID:(id)a3;
- (void)setReceiveHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)subscriber:(id)a3 receivedMessage:(id)a4 fromPublishID:(unsigned __int8)a5 address:(id)a6;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberStarted:(id)a3;
@end

@implementation CUNANSubscriber

- (CUNANSubscriber)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUNANSubscriber;
  v2 = -[CUNANSubscriber init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUNANSubscriber;
    pthread_mutex_init(&v2->_mutex, 0LL);
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = self->_mockID;
  v4 = v3;
  if (v3) {
    CUNANMockRemoveSubscriber(v3, self);
  }
  pthread_mutex_destroy(&self->_mutex);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUNANSubscriber;
  -[CUNANSubscriber dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[CUNANSubscriber descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v21 = 0LL;
  v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__5162;
  v25 = __Block_byref_object_dispose__5163;
  id v26 = 0LL;
  id obj = 0LL;
  serviceType = self->_serviceType;
  NSAppendPrintF((CFMutableStringRef *)&obj);
  objc_storeStrong(&v26, obj);
  changeFlags = (NSString *)self->_changeFlags;
  if ((_DWORD)changeFlags)
  {
    objc_super v6 = v22;
    id v19 = v22[5];
    serviceType = changeFlags;
    v14 = &unk_186B4AA5A;
    NSAppendPrintF((CFMutableStringRef *)&v19);
    objc_storeStrong(v6 + 5, v19);
  }

  v7 = v22;
  id v18 = v22[5];
  uint64_t v13 = -[NSMutableDictionary count](self->_wfaEndpoints, "count", serviceType, v14);
  NSAppendPrintF((CFMutableStringRef *)&v18);
  objc_storeStrong(v7 + 5, v18);
  if (a3 <= 20)
  {
    v8 = v22;
    id v17 = v22[5];
    NSAppendPrintF((CFMutableStringRef *)&v17);
    objc_storeStrong(v8 + 5, v17);
    wfaEndpoints = self->_wfaEndpoints;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __40__CUNANSubscriber_descriptionWithLevel___block_invoke;
    v15[3] = &unk_189F314D8;
    int v16 = a3;
    v15[4] = &v21;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( wfaEndpoints,  "enumerateKeysAndObjectsUsingBlock:",  v15,  v13);
  }

  id v10 = v22[5];
  _Block_object_dispose(&v21, 8);

  return v10;
}

- (NSArray)discoveredEndpoints
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  wfaEndpoints = self->_wfaEndpoints;
  if (wfaEndpoints)
  {
    -[NSMutableDictionary allValues](wfaEndpoints, "allValues");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v5 = (void *)MEMORY[0x189604A58];
  }

  pthread_mutex_unlock(p_mutex);
  return (NSArray *)v5;
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
  v7[2] = __42__CUNANSubscriber_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  aBlock = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANSubscriber _activateWithCompletion:]",  0x1Eu,  (uint64_t)"Activate '%@', %#{flags}\n",  v4,  v5,  v6,  v7,  (char)self->_serviceType);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
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
  block[2] = __29__CUNANSubscriber_invalidate__block_invoke;
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
    if (ucat->var0 > 30) {
      goto LABEL_6;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        v14 = self->_mockID;
        if (v14) {
          CUNANMockRemoveSubscriber(v14, self);
        }
        if (self->_startedCalled)
        {
          -[WiFiAwareSubscriber stop](self->_wfaSubscriber, "stop");
        }

        else
        {
          v12 = self->_ucat;
          if (v12->var0 <= 30)
          {
            if (v12->var0 == -1)
            {
              v12 = self->_ucat;
            }

            LogPrintF( (uint64_t)v12,  (uint64_t)"-[CUNANSubscriber _invalidate]",  0x1Eu,  (uint64_t)"Deferring stop until start completes",  v8,  v9,  v10,  v11,  v13);
          }
        }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_wfaSubscriber)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id endpointFoundHandler = self->_endpointFoundHandler;
    self->_id endpointFoundHandler = 0LL;

    id endpointLostHandler = self->_endpointLostHandler;
    self->_id endpointLostHandler = 0LL;

    id endpointChangedHandler = self->_endpointChangedHandler;
    self->_id endpointChangedHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id receiveHandler = self->_receiveHandler;
    self->_id receiveHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANSubscriber _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v10,  v11,  v12,  v13,  v15);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }

- (void)_lostAllEndpoints
{
  if (self->_endpointLostHandler)
  {
    wfaEndpoints = self->_wfaEndpoints;
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __36__CUNANSubscriber__lostAllEndpoints__block_invoke;
    v4[3] = &unk_189F31500;
    v4[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wfaEndpoints, "enumerateKeysAndObjectsUsingBlock:", v4);
  }

  pthread_mutex_lock(&self->_mutex);
  -[NSMutableDictionary removeAllObjects](self->_wfaEndpoints, "removeAllObjects");
  pthread_mutex_unlock(&self->_mutex);
}

- (void)reportMockEndpointFound:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__CUNANSubscriber_reportMockEndpointFound___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)reportMockEndpointLost:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__CUNANSubscriber_reportMockEndpointLost___block_invoke;
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
  v15[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke;
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

- (void)subscriberStarted:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__CUNANSubscriber_subscriberStarted___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __53__CUNANSubscriber_subscriber_failedToStartWithError___block_invoke;
  v5[3] = &unk_189F317F8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __51__CUNANSubscriber_subscriber_terminatedWithReason___block_invoke;
  v5[3] = &unk_189F317F8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__CUNANSubscriber_subscriber_receivedDiscoveryResult___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v47 = a3;
  id v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      [v6 publisherAddress];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 data];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 publishID];
      [v6 serviceName];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 serviceSpecificInfo];
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]",  9u,  (uint64_t)"WFA discovery result: PA <%@>, PI %u, SV '%@', SI <%@>\n",  v11,  v12,  v13,  v14,  (char)v9);

      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __70__CUNANSubscriber_subscriber_lostDiscoveryResultForPublishID_address___block_invoke;
  v13[3] = &unk_189F32CB0;
  v13[4] = self;
  id v14 = v8;
  unsigned __int8 v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)_subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v35 = a3;
  id v7 = a5;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      [v7 data];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]",  9u,  (uint64_t)"WFA lost result: PA <%@>, PI %u\n",  v10,  v11,  v12,  v13,  (char)v9);

      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)subscriber:(id)a3 receivedMessage:(id)a4 fromPublishID:(unsigned __int8)a5 address:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __68__CUNANSubscriber_subscriber_receivedMessage_fromPublishID_address___block_invoke;
  v14[3] = &unk_189F32CB0;
  v14[4] = self;
  id v15 = v10;
  unsigned __int8 v17 = a5;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(dispatchQueue, v14);
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_unsigned int changeFlags = a3;
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

- (NSString)label
{
  return self->_label;
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)endpointFoundHandler
{
  return self->_endpointFoundHandler;
}

- (void)setEndpointFoundHandler:(id)a3
{
}

- (id)endpointLostHandler
{
  return self->_endpointLostHandler;
}

- (void)setEndpointLostHandler:(id)a3
{
}

- (id)endpointChangedHandler
{
  return self->_endpointChangedHandler;
}

- (void)setEndpointChangedHandler:(id)a3
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

void __68__CUNANSubscriber_subscriber_receivedMessage_fromPublishID_address___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    uint64_t v3 = _Block_copy(*(const void **)(v1 + 200));
    if (!v3)
    {
LABEL_8:

      return;
    }

    id v12 = (void (**)(id, void, CUNANEndpoint *))v3;
    id v4 = objc_alloc_init(&OBJC_CLASS___CUNANEndpoint);
    [*(id *)(a1 + 40) data];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WiFiAwareCreateEndpointIdentifier(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUNANEndpoint setIdentifier:](v4, "setIdentifier:", v6);

    -[CUNANEndpoint setInstanceID:](v4, "setInstanceID:", *(unsigned __int8 *)(a1 + 56));
    -[CUNANEndpoint setMacAddress:](v4, "setMacAddress:", *(void *)(a1 + 40));
    uint64_t v11 = *(int **)(*(void *)(a1 + 32) + 96LL);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        uint64_t v11 = *(int **)(*(void *)(a1 + 32) + 96LL);
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUNANSubscriber subscriber:receivedMessage:fromPublishID:address:]_block_invoke",  0x1Eu,  (uint64_t)"Received message: EP %@, Data %@",  v7,  v8,  v9,  v10,  (char)v4);
    }

void *__70__CUNANSubscriber_subscriber_lostDiscoveryResultForPublishID_address___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[14]) {
    return (void *)[result _subscriber:*(void *)(a1 + 40) lostDiscoveryResultForPublishID:*(unsigned __int8 *)(a1 + 56) address:*(void *)(a1 + 48)];
  }
  return result;
}

void *__54__CUNANSubscriber_subscriber_receivedDiscoveryResult___block_invoke(void *a1)
{
  result = (void *)a1[4];
  if (result[14]) {
    return (void *)[result _subscriber:a1[5] receivedDiscoveryResult:a1[6]];
  }
  return result;
}

void __51__CUNANSubscriber_subscriber_terminatedWithReason___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 112))
  {
    uint64_t v10 = *(int **)(v8 + 96);
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
        uint64_t v28 = (void (**)(id, void))_Block_copy(*(const void **)(v8 + 8));
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = *(void **)(v12 + 8);
        *(void *)(v12 + 8) = 0LL;

        uint64_t v14 = *(void *)(a1 + 40);
        if (v28)
        {
          if (v14 == 2)
          {
            v28[2](v28, 0LL);
LABEL_15:
            uint64_t v17 = *(void *)(a1 + 32);
            uint64_t v18 = *(void **)(v17 + 112);
            *(void *)(v17 + 112) = 0LL;

            [*(id *)(a1 + 32) _invalidated];
LABEL_16:

            return;
          }

          NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v28)[2](v28, v15);
        }

        else if (v14 == 2)
        {
          goto LABEL_15;
        }

        id v16 = *(_BYTE **)(a1 + 32);
        if (v16[16]) {
          goto LABEL_15;
        }
        [v16 _lostAllEndpoints];
        uint64_t v23 = *(void *)(a1 + 32);
        uint64_t v24 = *(void *)(v23 + 184);
        if (v24)
        {
          (*(void (**)(void))(v24 + 16))();
          uint64_t v23 = *(void *)(a1 + 32);
        }

        uint64_t v25 = *(int **)(v23 + 96);
        if (*v25 <= 30)
        {
          if (*v25 == -1)
          {
            BOOL v26 = _LogCategory_Initialize((uint64_t)v25, 0x1Eu);
            uint64_t v23 = *(void *)(a1 + 32);
            if (!v26) {
              goto LABEL_23;
            }
            uint64_t v25 = *(int **)(v23 + 96);
          }

          LogPrintF( (uint64_t)v25,  (uint64_t)"-[CUNANSubscriber subscriber:terminatedWithReason:]_block_invoke",  0x1Eu,  (uint64_t)"WFASubscriber restarting after unexpected termination\n",  v19,  v20,  v21,  v22,  v27);
          uint64_t v23 = *(void *)(a1 + 32);
        }

void __53__CUNANSubscriber_subscriber_failedToStartWithError___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 112))
  {
    uint64_t v10 = (const char *)(*(_DWORD *)(a1 + 40) + 312300);
    BOOL v11 = *(int **)(v8 + 96);
    if (*v11 > 90) {
      goto LABEL_7;
    }
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v12)
      {
LABEL_7:
        *(_BYTE *)(v8 + 88) = 1;
        uint64_t v24 = (void (**)(id, void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 8LL));
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void **)(v13 + 8);
        *(void *)(v13 + 8) = 0LL;

        if (v24)
        {
          NSErrorWithOSStatusF(v10);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          v24[2](v24, v19);
        }

        uint64_t v20 = *(void *)(a1 + 32);
        if (!*(_BYTE *)(v20 + 16)) {
          goto LABEL_15;
        }
        uint64_t v21 = *(int **)(v20 + 96);
        if (*v21 <= 30)
        {
          if (*v21 == -1)
          {
            BOOL v22 = _LogCategory_Initialize((uint64_t)v21, 0x1Eu);
            uint64_t v20 = *(void *)(a1 + 32);
            if (!v22) {
              goto LABEL_14;
            }
            uint64_t v21 = *(int **)(v20 + 96);
          }

          LogPrintF( (uint64_t)v21,  (uint64_t)"-[CUNANSubscriber subscriber:failedToStartWithError:]_block_invoke",  0x1Eu,  (uint64_t)"WFASubscriber stop after start completed",  v15,  v16,  v17,  v18,  v23);
          uint64_t v20 = *(void *)(a1 + 32);
        }

void __37__CUNANSubscriber_subscriberStarted___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 112))
  {
    uint64_t v10 = *(int **)(v8 + 96);
    if (*v10 > 30) {
      goto LABEL_7;
    }
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v11)
      {
LABEL_7:
        *(_BYTE *)(v8 + 88) = 1;
        id v23 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 8LL));
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void **)(v12 + 8);
        *(void *)(v12 + 8) = 0LL;

        uint64_t v18 = v23;
        if (v23)
        {
          (*((void (**)(id, void))v23 + 2))(v23, 0LL);
          uint64_t v18 = v23;
        }

        uint64_t v19 = *(void *)(a1 + 32);
        if (!*(_BYTE *)(v19 + 16)) {
          goto LABEL_15;
        }
        uint64_t v20 = *(int **)(v19 + 96);
        if (*v20 <= 30)
        {
          if (*v20 == -1)
          {
            BOOL v21 = _LogCategory_Initialize((uint64_t)v20, 0x1Eu);
            uint64_t v19 = *(void *)(a1 + 32);
            if (!v21) {
              goto LABEL_14;
            }
            uint64_t v20 = *(int **)(v19 + 96);
          }

          LogPrintF( (uint64_t)v20,  (uint64_t)"-[CUNANSubscriber subscriberStarted:]_block_invoke",  0x1Eu,  (uint64_t)"WFASubscriber stop after start completed",  v14,  v15,  v16,  v17,  v22);
          uint64_t v19 = *(void *)(a1 + 32);
        }

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__5162;
  uint64_t v32 = __Block_byref_object_dispose__5163;
  id v33 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_2;
  aBlock[3] = &unk_189F32BC0;
  uint64_t v3 = *(void *)(a1 + 32);
  char v27 = &v28;
  aBlock[4] = v3;
  id v26 = *(id *)(a1 + 56);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  id v5 = *(id *)(*(void *)(a1 + 32) + 112LL);
  if (!v5)
  {
    uint64_t v18 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5A7LL);
    uint64_t v13 = (void *)v29[5];
    v29[5] = v18;
    goto LABEL_12;
  }

  [*(id *)(a1 + 40) discoveryResult];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v15 = *(int **)(v14 + 96);
  if (*v15 <= 30)
  {
    if (*v15 == -1)
    {
      BOOL v16 = _LogCategory_Initialize((uint64_t)v15, 0x1Eu);
      uint64_t v14 = *(void *)(a1 + 32);
      if (!v16) {
        goto LABEL_10;
      }
      uint64_t v15 = *(int **)(v14 + 96);
    }

    LogPrintF( (uint64_t)v15,  (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke",  0x1Eu,  (uint64_t)"SendMessage start: EP %@, Data %.12@",  v9,  v10,  v11,  v12,  *(void *)(a1 + 40));
    uint64_t v14 = *(void *)(a1 + 32);
  }

uint64_t __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    uint64_t v9 = (void *)result;
    uint64_t v10 = *(int **)(*(void *)(result + 32) + 96LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(v9[4] + 96LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_2",  0x5Au,  (uint64_t)"### SendMessage failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_4;
  block[3] = &unk_189F31528;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = *(dispatch_queue_s **)(v3 + 128);
  block[1] = 3221225472LL;
  uint64_t v10 = a2;
  block[4] = v3;
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v5, block);
}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_4( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = a1[8];
  if (v9)
  {
    uint64_t v10 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)(v9 + 312300));
    uint64_t v15 = *(int **)(a1[4] + 96LL);
    id v17 = (id)v10;
    if (*v15 <= 90)
    {
      if (*v15 == -1)
      {
        uint64_t v15 = *(int **)(a1[4] + 96LL);
      }

      LogPrintF( (uint64_t)v15,  (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_4",  0x5Au,  (uint64_t)"### SendMessage failed: EP %@, Data %.12@, %{error}",  v11,  v12,  v13,  v14,  a1[5]);
    }

uint64_t __42__CUNANSubscriber_reportMockEndpointLost___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(int **)(v1 + 96);
    if (*v3 > 30) {
      goto LABEL_7;
    }
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(*(void *)(v1 + 96), 0x1Eu);
      uint64_t v1 = *(void *)(v2 + 32);
      if (!v9)
      {
LABEL_7:
        result = *(void *)(v1 + 168);
        if (result) {
          return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(v2 + 40));
        }
        return result;
      }

      uint64_t v3 = *(int **)(v1 + 96);
    }

    CUDescriptionWithLevel(*(void **)(v2 + 40), 50LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUNANSubscriber reportMockEndpointLost:]_block_invoke",  0x1Eu,  (uint64_t)"Mock Endpoint Lost: %@",  v5,  v6,  v7,  v8,  (char)v4);

    uint64_t v1 = *(void *)(v2 + 32);
    goto LABEL_7;
  }

  return result;
}

uint64_t __43__CUNANSubscriber_reportMockEndpointFound___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(int **)(v1 + 96);
    if (*v3 > 30) {
      goto LABEL_7;
    }
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(*(void *)(v1 + 96), 0x1Eu);
      uint64_t v1 = *(void *)(v2 + 32);
      if (!v9)
      {
LABEL_7:
        result = *(void *)(v1 + 160);
        if (result) {
          return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(v2 + 40));
        }
        return result;
      }

      uint64_t v3 = *(int **)(v1 + 96);
    }

    CUDescriptionWithLevel(*(void **)(v2 + 40), 50LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUNANSubscriber reportMockEndpointFound:]_block_invoke",  0x1Eu,  (uint64_t)"Mock Endpoint found: %@",  v5,  v6,  v7,  v8,  (char)v4);

    uint64_t v1 = *(void *)(v2 + 32);
    goto LABEL_7;
  }

  return result;
}

void __36__CUNANSubscriber__lostAllEndpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(int **)(v6 + 96);
  if (*v7 <= 10)
  {
    if (*v7 == -1)
    {
      BOOL v13 = _LogCategory_Initialize(*(void *)(v6 + 96), 0xAu);
      uint64_t v6 = *(void *)(a1 + 32);
      if (!v13) {
        goto LABEL_5;
      }
      uint64_t v7 = *(int **)(v6 + 96);
    }

    CUDescriptionWithLevel(v5, 50LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v7,  (uint64_t)"-[CUNANSubscriber _lostAllEndpoints]_block_invoke",  0xAu,  (uint64_t)"Endpoint lost: %@\n",  v9,  v10,  v11,  v12,  (char)v8);

    uint64_t v6 = *(void *)(a1 + 32);
  }

uint64_t __29__CUNANSubscriber_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __42__CUNANSubscriber_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

void __40__CUNANSubscriber_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  else {
    uint64_t v3 = 30LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v4 + 40);
  CUDescriptionWithLevel(a3, v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF((CFMutableStringRef *)&obj);
  objc_storeStrong((id *)(v4 + 40), obj);
}

@end