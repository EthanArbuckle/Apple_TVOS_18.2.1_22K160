@interface __NSCFURLLocalSessionConnection
- (__NSCFURLLocalSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (uint64_t)withDelegateAndPendingCompletion:(uint64_t)result;
- (uint64_t)withLoaderOnQueue:(uint64_t)result;
- (void)_ackBytes:(int64_t)a3;
- (void)_alternatePathAvailable:(int)a3;
- (void)_captureTransportConnection:(shared_ptr<TransportConnection>)a3 extraBytes:(id)a4;
- (void)_capturedSocketInputStream:(id)a3 outputStream:(id)a4;
- (void)_conditionalRequirementsChanged:(BOOL)a3;
- (void)_connectionIsWaitingWithReason:(int64_t)a3;
- (void)_didFinishWithError:(id)a3;
- (void)_didReceiveChallenge:(id)a3;
- (void)_didReceiveData:(id)a3;
- (void)_didReceiveInformationalResponse:(id)a3;
- (void)_didReceiveResponse:(id)a3 sniff:(BOOL)a4;
- (void)_didSendBodyData:(UploadProgressInfo *)a3;
- (void)_didUseCachedResponse;
- (void)_needNewBodyStream;
- (void)_needNewBodyStreamFromOffset:(int64_t)a3;
- (void)_redirectRequest:(id)a3 redirectResponse:(id)a4 completion:(id)a5;
- (void)_tick;
- (void)_tick_sniffNow;
- (void)_willSendRequestForEstablishedConnection:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)expectedProgressTargetChanged;
- (void)resume;
- (void)setBytesPerSecondLimit:(int64_t)a3;
- (void)setIsDownload:(BOOL)a3;
- (void)setPoolPriority:(int64_t)a3;
- (void)setPriorityHint:(float)a3 incremental:(BOOL)a4;
- (void)suspend;
- (void)withLoaderAsync:(id)a3;
@end

@implementation __NSCFURLLocalSessionConnection

- (__NSCFURLLocalSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  *(void *)&v25[1] = self;
  *(void *)&v25[9] = &OBJC_CLASS_____NSCFURLLocalSessionConnection;
  v5 = (__NSCFURLLocalSessionConnection *)objc_msgSendSuper2( (objc_super *)&v25[1],  sel_initWithTask_delegate_delegateQueue_,  a3,  a4,  a5);
  v7 = v5;
  if (v5)
  {
    v5->_didReceiveResponseDisposition = 0LL;
    v25[0] = 3;
    task = v5->super._task;
    if (task)
    {
      uint64_t internalDelegateWrapper = (uint64_t)task->_internalDelegateWrapper;
    }

    else
    {
      uint64_t internalDelegateWrapper = 0LL;
    }

    if (-[__NSCFURLSessionDelegateWrapper _willSendRequestForEstablishedConnection]( internalDelegateWrapper,  v6))
    {
      char v11 = 11;
      v25[0] = 11;
    }

    else
    {
      char v11 = 3;
    }

    v12 = v7->super._task;
    if (!v12) {
      goto LABEL_33;
    }
    publicDelegateWrapper = v12->_internalDelegateWrapper;
    if (publicDelegateWrapper || (publicDelegateWrapper = v12->_publicDelegateWrapper) != 0LL)
    {
      if ((-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withError]( publicDelegateWrapper,  v10) & 1) != 0 || (-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withError]( publicDelegateWrapper->_fallbackDelegateWrapper,  v10) & 1) != 0 || (-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withoutError]( publicDelegateWrapper,  v10) & 1) != 0 || (-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withoutError]( publicDelegateWrapper->_fallbackDelegateWrapper,  v10) & 1) != 0)
      {
        goto LABEL_20;
      }

      v12 = v7->super._task;
      if (!v12)
      {
LABEL_33:
        v20 = (SessionConnectionLoadable *)operator new(0x20uLL);
        v20->var0 = (void **)off_189C05C10;
        v20->var1 = (void **)&unk_189C05D10;
        v20->var2 = (void **)&unk_189C05DD0;
        v20->var3 = v7;
        v7->_loaderClient = v20;
        CFAllocatorRef v21 = CFGetAllocator(v7);
        v22 = (URLConnectionLoader_Classic *)MEMORY[0x186E12804](v21, 224LL, 0LL);
        *(_OWORD *)v22 = 0u;
        *((_OWORD *)v22 + 1) = 0u;
        *((_OWORD *)v22 + 2) = 0u;
        *((_OWORD *)v22 + 3) = 0u;
        *((_OWORD *)v22 + 4) = 0u;
        *((_OWORD *)v22 + 5) = 0u;
        *((_OWORD *)v22 + 6) = 0u;
        *((_OWORD *)v22 + 7) = 0u;
        *((_OWORD *)v22 + 8) = 0u;
        *((_OWORD *)v22 + 9) = 0u;
        *((_OWORD *)v22 + 10) = 0u;
        *((_OWORD *)v22 + 11) = 0u;
        *((_OWORD *)v22 + 12) = 0u;
        *((_OWORD *)v22 + 13) = 0u;
        URLConnectionLoader_Classic::URLConnectionLoader_Classic( v22,  (InterfaceRequiredForLoader *)v7->_loaderClient,  (const ConfigFlags *)v25,  (__NSURLSessionLocal *)-[NSURLSessionTask session](v7->super._task, "session"),  (dispatch_object_s *)v7->super._workQueue);
        v7->_loader = (URLConnectionLoader *)v22;
        v7->_state = 0;
        v24[0] = MEMORY[0x1895F87A8];
        v24[1] = 3221225472LL;
        v24[2] = __71____NSCFURLLocalSessionConnection_initWithTask_delegate_delegateQueue___block_invoke;
        v24[3] = &unk_189C1A548;
        v24[4] = v7;
        -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v7, (const char *)v24);
        return v7;
      }
    }

    v14 = v12->_internalDelegateWrapper;
    if (!v14 && (v14 = v12->_publicDelegateWrapper) == 0LL
      || (-[__NSCFURLSessionDelegateWrapper check_isWaitingForConnectivity]((unsigned __int8 *)v14, v10) & 1) == 0
      && !-[__NSCFURLSessionDelegateWrapper check_isWaitingForConnectivity]( (unsigned __int8 *)v14->_fallbackDelegateWrapper,  v10))
    {
LABEL_21:
      v15 = v7->super._task;
      if (v15)
      {
        v16 = v15->_internalDelegateWrapper;
        if ((v16 || (v16 = v15->_publicDelegateWrapper) != 0LL)
          && ((-[__NSCFURLSessionDelegateWrapper check__conditionalRequirementsChanged]((unsigned __int8 *)v16, v10) & 1) != 0
           || -[__NSCFURLSessionDelegateWrapper check__conditionalRequirementsChanged]( (unsigned __int8 *)v16->_fallbackDelegateWrapper,  v10)))
        {
          v11 |= 0x20u;
          v25[0] = v11;
        }

        v17 = v7->super._task;
        if (v17)
        {
          v18 = v17->_internalDelegateWrapper;
          if ((v18 || (v18 = v17->_publicDelegateWrapper) != 0LL)
            && ((-[__NSCFURLSessionDelegateWrapper check__alternatePathAvailable]((unsigned __int8 *)v18, v10) & 1) != 0
             || -[__NSCFURLSessionDelegateWrapper check__alternatePathAvailable]( (unsigned __int8 *)v18->_fallbackDelegateWrapper,  v19)))
          {
            v25[0] = v11 | 0x40;
          }
        }
      }

      goto LABEL_33;
    }

- (void)_tick
{
  if (!a1) {
    return;
  }
  int v2 = *(_DWORD *)(a1 + 136);
  if ((v2 - 1) >= 2)
  {
    if (v2 != 3)
    {
      if (!v2)
      {
        *(_DWORD *)(a1 + 136) = 1;
        uint64_t v17 = MEMORY[0x1895F87A8];
        uint64_t v18 = 3221225472LL;
        v19 = __51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke;
        v20 = &unk_189C05850;
        uint64_t v3 = *(void *)(a1 + 80);
        uint64_t v21 = a1;
        if (v3) {
          uint64_t v4 = v3 + 48;
        }
        else {
          uint64_t v4 = 0LL;
        }
        v5 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 136LL))(v4);
        __51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke((uint64_t)&v17, v5);
        (*(void (**)(const char *))(*(void *)v5 + 144LL))(v5);
      }

      return;
    }

    if (*(void *)(a1 + 128))
    {
      -[__NSCFURLSessionConnection _tossCache](a1);
      v8 = *(dispatch_object_s **)(a1 + 152);
      if (v8)
      {
        dispatch_release(v8);
        *(void *)(a1 + 152) = 0LL;
      }

      v9 = *(void **)(a1 + 160);
      if (v9)
      {

        *(void *)(a1 + 160) = 0LL;
      }
    }

    if (*(void *)(a1 + 152)) {
      __assert_rtn( "-[__NSCFURLLocalSessionConnection _tick_finishing]",  "SessionConnection.mm",  892,  "_sniffData == NULL");
    }
    v10 = -[__NSCFURLSessionConnection _cachedResponse](a1);
    if (v10)
    {
      uint64_t v17 = MEMORY[0x1895F87A8];
      uint64_t v18 = 3221225472LL;
      v19 = __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke;
      v20 = &unk_189C05978;
      uint64_t v21 = a1;
      v22 = v10;
LABEL_40:
      -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:](a1, (uint64_t)&v17);
      return;
    }

    *(_DWORD *)(a1 + 136) = 4;
    uint64_t v17 = MEMORY[0x1895F87A8];
    uint64_t v18 = 3221225472LL;
    v19 = __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke;
    v20 = &unk_189C05928;
LABEL_39:
    uint64_t v21 = a1;
    goto LABEL_40;
  }

  v6 = *(dispatch_data_s **)(a1 + 152);
  if (v6)
  {
    if (dispatch_data_get_size(v6) > 0x1FF || v2 != 1) {
      -[__NSCFURLLocalSessionConnection _tick_sniffNow]((void *)a1);
    }
  }

  else
  {
    char v11 = *(dispatch_data_s **)(a1 + 104);
    if (v11)
    {
      if (v2 == 2)
      {
        uint64_t v12 = 0LL;
        *(void *)(a1 + 144) = 0LL;
        char v11 = *(dispatch_data_s **)(a1 + 104);
      }

      else
      {
        uint64_t v12 = *(void *)(a1 + 144);
      }

      size_t size = dispatch_data_get_size(v11);
      if (v12 >= 1 && size < v12) {
        return;
      }
      size_t v15 = size;
      *(void *)(a1 + 104) = 0LL;
      -[__NSCFURLSessionConnection _appendDataToCache:](a1, v11);
      int v16 = *(_DWORD *)(a1 + 192);
      *(_DWORD *)(a1 + 192) = v16 + 1;
      uint64_t v17 = MEMORY[0x1895F87A8];
      uint64_t v18 = 3221225472LL;
      v19 = __48____NSCFURLLocalSessionConnection__tick_running__block_invoke;
      v20 = &unk_189C05900;
      int v24 = v16;
      v22 = v11;
      size_t v23 = v15;
      goto LABEL_39;
    }

    if (v2 == 2)
    {
      *(_DWORD *)(a1 + 136) = 3;
      -[__NSCFURLLocalSessionConnection _tick](a1);
    }
  }

- (void)_didSendBodyData:(UploadProgressInfo *)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __52____NSCFURLLocalSessionConnection__didSendBodyData___block_invoke;
  v3[3] = &unk_189C059C8;
  v3[4] = self;
  UploadProgressInfo v4 = *a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (uint64_t)withDelegateAndPendingCompletion:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    UploadProgressInfo v4 = *(dispatch_queue_s **)(result + 16);
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "_workQueue is NULL", v5, 2u);
        UploadProgressInfo v4 = (dispatch_queue_s *)v3[2];
      }

      else
      {
        UploadProgressInfo v4 = 0LL;
      }
    }

    dispatch_assert_queue_V2(v4);
    ++v3[14];
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v3[3]);
  }

  return result;
}

- (void)_didReceiveResponse:(id)a3 sniff:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_didCheckMixedReplace)
  {
    if (!self->_isMixedReplace) {
      goto LABEL_11;
    }
  }

  else
  {
    self->_didCheckMixedReplace = 1;
    uint64_t v7 = *(void *)([a3 _inner] + 88);
    BOOL v8 = v7 && (*(_WORD *)(v7 + 297) & 0x8000) != 0;
    self->_isMixedReplace = v8;
    if (!v8) {
      goto LABEL_11;
    }
  }

  -[__NSCFURLSessionConnection _tossCache]((uint64_t)self);
  if (self->_sniffResponse) {
    -[__NSCFURLLocalSessionConnection _tick_sniffNow](self);
  }
LABEL_11:
  if (v4
    && !self->super._isFromCache
    && (v9 = -[NSURLSessionTask currentRequest](self->super._task, "currentRequest"),
        HTTPSniffing::checkRequestAndUpdateResponseForSniffingPurposes((HTTPSniffing *)v9, (_CFURLRequest *)a3, v10)))
  {
    self->_sniffData = (OS_dispatch_data *)dispatch_data_create("", 0LL, 0LL, 0LL);
    self->_sniffResponse = (NSURLResponse *)[a3 copy];
  }

  else
  {
    if (self->_isMixedReplace) {
      -[__NSCFURLLocalSessionConnection suspend](self, "suspend");
    }
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke;
    v11[3] = &unk_189C05978;
    v11[4] = a3;
    v11[5] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v11);
  }

- (void)_didReceiveData:(id)a3
{
  if (a3 && dispatch_data_get_size((dispatch_data_t)a3))
  {
    if (self->_sniffData)
    {
      conCatData((dispatch_object_t *)&self->_sniffData, (dispatch_data_s *)a3);
    }

    else
    {
      conCatData((dispatch_object_t *)&self->_pendingData, (dispatch_data_s *)a3);
      if (self->_maxDataSegmentCount)
      {
        uint64_t v12 = 0LL;
        v13 = &v12;
        uint64_t v14 = 0x2020000000LL;
        uint64_t v15 = 0LL;
        uint64_t v8 = 0LL;
        v9 = &v8;
        uint64_t v10 = 0x2020000000LL;
        uint64_t v11 = 0LL;
        pendingData = (dispatch_data_s *)self->_pendingData;
        applier[0] = MEMORY[0x1895F87A8];
        applier[1] = 3221225472LL;
        applier[2] = __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke;
        applier[3] = &unk_189C16CA8;
        applier[4] = &v12;
        applier[5] = &v8;
        dispatch_data_apply(pendingData, applier);
        if (v13[3] > self->_maxDataSegmentCoalesceThreshhold && v9[3] > self->_maxDataSegmentCount)
        {
          alloc = (dispatch_object_s *)dispatch_data_create_alloc();
          if (alloc) {
            dispatch_release(alloc);
          }
        }

        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v12, 8);
      }
    }

    -[__NSCFURLLocalSessionConnection _tick]((uint64_t)self);
  }

- (void)_tick_sniffNow
{
  if (a1)
  {
    int v2 = (_CFURLResponse *)a1[20];
    uint64_t v3 = (dispatch_object_s *)a1[19];
    a1[20] = 0LL;
    a1[19] = 0LL;
    if (v3) {
      CFRetain(v3);
    }
    uint64_t v4 = *(void *)(-[_CFURLResponse _inner](v2, "_inner") + 88);
    v5 = (const __CFData *)v3;
    if (v4)
    {
      v5 = (const __CFData *)v3;
      if (((*(unsigned __int16 *)(v4 + 297) | (*(unsigned __int8 *)(v4 + 299) << 16)) & 0x10000) != 0)
      {
        v6 = CFURLDataDecoderCreateWithResponse((const __CFAllocator *)*MEMORY[0x189604DB0], v2);
        v5 = (const __CFData *)v3;
        if (v6)
        {
          uint64_t v7 = v6;
          char v11 = 0;
          uint64_t v8 = CFURLDataDecoderDecodeData((uint64_t)v6, (uint64_t)v3, (uint64_t)&v11);
          if (v8) {
            v5 = (const __CFData *)v8;
          }
          else {
            v5 = (const __CFData *)v3;
          }
          if (v3) {
            BOOL v9 = v8 == 0;
          }
          else {
            BOOL v9 = 1;
          }
          if (!v9)
          {
            uint64_t v10 = (const __CFData *)v8;
            CFRelease(v3);
            v5 = v10;
          }

          CFRelease(v7);
        }
      }
    }

    URLResponse::guessMIMEType((URLResponse *)-[_CFURLResponse _inner](v2, "_inner"), v5);
    if (v5) {
      CFRelease(v5);
    }
    [a1 _didReceiveResponse:v2 sniff:0];
    [a1 _didReceiveData:v3];

    dispatch_release(v3);
  }

- (void)suspend
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __42____NSCFURLLocalSessionConnection_suspend__block_invoke;
  v2[3] = &unk_189C05850;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v2);
}

- (void)withLoaderAsync:(id)a3
{
  workQueue = (dispatch_queue_s *)self->super._workQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __51____NSCFURLLocalSessionConnection_withLoaderAsync___block_invoke;
  v4[3] = &unk_189C1A2E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (uint64_t)withLoaderOnQueue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = *(void *)(result + 80);
    if (v3) {
      uint64_t v4 = v3 + 48;
    }
    else {
      uint64_t v4 = 0LL;
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 136LL))(v4);
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5);
    return (*(uint64_t (**)(uint64_t))(*(void *)v5 + 144LL))(v5);
  }

  return result;
}

- (void)resume
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __41____NSCFURLLocalSessionConnection_resume__block_invoke;
  v2[3] = &unk_189C05850;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v2);
}

- (void)_ackBytes:(int64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __45____NSCFURLLocalSessionConnection__ackBytes___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  v3[4] = a3;
  -[__NSCFURLLocalSessionConnection withLoaderOnQueue:]((uint64_t)self, (uint64_t)v3);
}

- (void)_didFinishWithError:(id)a3
{
  if (self->_state <= 1)
  {
    if (a3)
    {
      self->_state = 3;
      self->_pendingError = (NSError *)[a3 copy];
    }

    else
    {
      self->_state = 2;
    }
  }

  if (self->super._delegate && self->super._workQueue)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __55____NSCFURLLocalSessionConnection__didFinishWithError___block_invoke;
    v4[3] = &unk_189C05928;
    v4[4] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
  }

  -[__NSCFURLLocalSessionConnection _tick]((uint64_t)self);
}

- (void)dealloc
{
  loader = self->_loader;
  if (loader)
  {
    (*((void (**)(URLConnectionLoader *, SEL))loader->var0 + 1))(loader, a2);
    self->_loader = 0LL;
  }

  loaderClient = self->_loaderClient;
  if (loaderClient)
  {
    (*((void (**)(SessionConnectionLoadable *, SEL))loaderClient->var0 + 1))(loaderClient, a2);
    self->_loaderClient = 0LL;
  }

  pendingError = self->_pendingError;
  if (pendingError)
  {

    self->_pendingError = 0LL;
  }

  pendingData = (dispatch_object_s *)self->_pendingData;
  if (pendingData)
  {
    dispatch_release(pendingData);
    self->_pendingData = 0LL;
  }

  sniffData = (dispatch_object_s *)self->_sniffData;
  if (sniffData)
  {
    dispatch_release(sniffData);
    self->_sniffData = 0LL;
  }

  sniffResponse = self->_sniffResponse;
  if (sniffResponse)
  {

    self->_sniffResponse = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS_____NSCFURLLocalSessionConnection;
  -[__NSCFURLSessionConnection dealloc](&v9, sel_dealloc);
}

- (void)cancel
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __41____NSCFURLLocalSessionConnection_cancel__block_invoke;
  v2[3] = &unk_189C05850;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v2);
}

- (void)setIsDownload:(BOOL)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __49____NSCFURLLocalSessionConnection_setIsDownload___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__LoaderInterface_____8l;
  BOOL v4 = a3;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v3);
}

- (void)setPoolPriority:(int64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __51____NSCFURLLocalSessionConnection_setPoolPriority___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  void v3[4] = a3;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v3);
}

- (void)setPriorityHint:(float)a3 incremental:(BOOL)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __63____NSCFURLLocalSessionConnection_setPriorityHint_incremental___block_invoke;
  v4[3] = &__block_descriptor_37_e29_v16__0__LoaderInterface_____8l;
  float v5 = a3;
  BOOL v6 = a4;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v4);
}

- (void)setBytesPerSecondLimit:(int64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __58____NSCFURLLocalSessionConnection_setBytesPerSecondLimit___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  void v3[4] = a3;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v3);
}

- (void)expectedProgressTargetChanged
{
}

- (void)_didUseCachedResponse
{
  self->super._isFromCache = 1;
}

- (void)_didReceiveInformationalResponse:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __68____NSCFURLLocalSessionConnection__didReceiveInformationalResponse___block_invoke;
  v3[3] = &unk_189C05978;
  void v3[4] = a3;
  void v3[5] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_willSendRequestForEstablishedConnection:(id)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke;
  v4[3] = &unk_189C059F0;
  void v4[4] = self;
  void v4[5] = a4;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
}

- (void)_connectionIsWaitingWithReason:(int64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __66____NSCFURLLocalSessionConnection__connectionIsWaitingWithReason___block_invoke;
  v3[3] = &unk_189C05A18;
  void v3[4] = self;
  void v3[5] = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_conditionalRequirementsChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __67____NSCFURLLocalSessionConnection__conditionalRequirementsChanged___block_invoke;
  v3[3] = &unk_189C05A40;
  BOOL v4 = a3;
  void v3[4] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_alternatePathAvailable:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __59____NSCFURLLocalSessionConnection__alternatePathAvailable___block_invoke;
  v3[3] = &unk_189C05A68;
  void v3[4] = self;
  int v4 = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_redirectRequest:(id)a3 redirectResponse:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke;
  v5[3] = &unk_189C05AB8;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = self;
  v5[7] = a5;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v5);
}

- (void)_didReceiveChallenge:(id)a3
{
  uint64_t v3 = (NSURLAuthenticationChallenge *)a3;
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "_CFURLProtectionSpace");
  if (!v5)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v12 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v12,  OS_LOG_TYPE_ERROR,  "_isPasswordBasedChallenge called with nil protection space",  buf,  2u);
    }

    goto LABEL_14;
  }

  uint64_t v6 = v5;
  if ((*(_DWORD *)(v6 + 72) - 1) > 5 || self->_didCheckCredentialsSuppliedInURL)
  {
LABEL_14:
    char v10 = 0;
    goto LABEL_15;
  }

  self->_didCheckCredentialsSuppliedInURL = 1;
  uint64_t v7 = -[NSURLSessionTask currentRequest_URL](self->super._task, "currentRequest_URL");
  uint64_t v8 = -[NSURL user](v7, "user");
  uint64_t v9 = -[NSURL password](v7, "password");
  char v10 = 0;
  if (v8 && v9)
  {
    char v10 = 1;
    char v11 = +[NSURLCredential credentialWithUser:password:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithUser:password:persistence:",  v8,  v9,  1LL);
    self->_actuallyTriedCredentialsSuppliedInURL = 1;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke;
    v14[3] = &unk_189C1A610;
    v14[4] = self;
    v14[5] = v3;
    v14[6] = v11;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v14);
  }

- (void)_needNewBodyStream
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke;
  v2[3] = &unk_189C05928;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v2);
}

- (void)_needNewBodyStreamFromOffset:(int64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke;
  v3[3] = &unk_189C05A18;
  void v3[4] = self;
  void v3[5] = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_capturedSocketInputStream:(id)a3 outputStream:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __75____NSCFURLLocalSessionConnection__capturedSocketInputStream_outputStream___block_invoke;
  v4[3] = &unk_189C05BA8;
  void v4[4] = self;
  void v4[5] = a3;
  void v4[6] = a4;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
}

- (void)_captureTransportConnection:(shared_ptr<TransportConnection>)a3 extraBytes:(id)a4
{
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3321888768LL;
  v11[2] = __74____NSCFURLLocalSessionConnection__captureTransportConnection_extraBytes___block_invoke;
  v11[3] = &unk_189C05BD0;
  uint64_t v5 = *(void *)a3.__ptr_;
  int v4 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  v11[4] = self;
  void v11[6] = v5;
  uint64_t v12 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }

  v11[5] = a3.__cntrl_;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v11);
  uint64_t v8 = v12;
  if (v12)
  {
    uint64_t v9 = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

@end