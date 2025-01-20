@interface __NSCFTCPIOStreamTask
- (BOOL)_onqueue_sendSessionChallenge:(id)a3 completionHandler:(id)a4;
- (BOOL)_onqueue_usingProxy;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)shouldDoWorkConsideringTlsState;
- (NSData)_initialDataPayload;
- (__NSCFTCPIOStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6;
- (__NSCFTCPIOStreamTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6;
- (id).cxx_construct;
- (id)_onqueue_errorOrCancelError;
- (id)workQueue;
- (void)_onSessionQueue_cleanupAndBreakCycles;
- (void)_onSessionQueue_disavow;
- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4;
- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4 shouldWaitForTls:(BOOL)a5;
- (void)_onqueue_adjustLoadingPoolPriority;
- (void)_onqueue_adjustPoolPriority;
- (void)_onqueue_callbackCompletedWork;
- (void)_onqueue_cancel;
- (void)_onqueue_captureStreams;
- (void)_onqueue_checkForCompletion;
- (void)_onqueue_cleanUpConnectionEstablishmentState;
- (void)_onqueue_closeRead;
- (void)_onqueue_closeWrite;
- (void)_onqueue_connectionEstablishedWithError:(id)a3 callbackReferent:(id)a4;
- (void)_onqueue_dealWithSessionClientCertAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_dealWithSessionTrustAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_ioTick;
- (void)_onqueue_needClientCert:(id)a3 completionHandler:(id)a4;
- (void)_onqueue_needServerTrust:(id)a3 completionHandler:(id)a4;
- (void)_onqueue_postConnectConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_preConnectionConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_processReadWork:(id)a3;
- (void)_onqueue_processWriteWork:(id)a3;
- (void)_onqueue_resume;
- (void)_onqueue_setTransportConnection:(shared_ptr<TransportConnection>)a3;
- (void)_onqueue_startSecureConnection;
- (void)_onqueue_stopSecureConnection;
- (void)_onqueue_suspend;
- (void)_onqueue_timeoutOccured;
- (void)_onqueue_tlsCompletion;
- (void)_onqueue_tlsDisabled;
- (void)cancel;
- (void)captureStreams;
- (void)closeRead;
- (void)closeWrite;
- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)set_initialDataPayload:(id)a3;
- (void)startSecureConnection;
- (void)stopSecureConnection;
- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation __NSCFTCPIOStreamTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFTCPIOStreamTask;
  if (-[__NSCFTCPIOStreamTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (__NSCFTCPIOStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6
{
  id v11 = objc_alloc_init(MEMORY[0x189607A50]);
  [v11 setScheme:0x18C5B2B50];
  [v11 setHost:a3];
  objc_msgSend(v11, "setPort:", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", a4));
  v12 = -[NSURLRequest initWithURL:]([NSURLRequest alloc], "initWithURL:", [v11 URL]);
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS_____NSCFTCPIOStreamTask;
  v13 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( &v40,  sel_initWithOriginalRequest_ident_taskGroup_,  v12,  0LL,  a5);
  uint64_t v14 = (uint64_t)v13;
  if (v13)
  {
    -[NSURLSessionTask updateCurrentRequest:](v13, "updateCurrentRequest:", v12);
    *(void *)(v14 + 760) = _Block_copy(a6);
    *(void *)(v14 + 944) = dispatch_queue_create("com.apple.CFNetwork.StreamTaskConnection", 0LL);
    v15 = (void *)nw_context_copy_implicit_context();
    nw_queue_context_target_dispatch_queue();
    nw_release(v15);
    v16 = (char *)operator new(0x50uLL);
    *((void *)v16 + 1) = 0LL;
    *((void *)v16 + 2) = 0LL;
    *(void *)v16 = off_189C0A900;
    TransportConnectionObjCPP::TransportConnectionObjCPP( (TransportConnectionObjCPP *)(v16 + 24),  *(dispatch_object_s **)(v14 + 944));
    *(void *)&__int128 location = v16 + 24;
    *((void *)&location + 1) = v16;
    std::shared_ptr<HTTPEngine>::__enable_weak_this[abi:nn180100]<HTTPEngine,HTTPEngine,void>( (uint64_t)&location,  (void *)v16 + 4,  (uint64_t)(v16 + 24));
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](v14 + 784, &location);
    v17 = (std::__shared_weak_count *)*((void *)&location + 1);
    if (*((void *)&location + 1))
    {
      v18 = (unint64_t *)(*((void *)&location + 1) + 8LL);
      do
        unint64_t v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    std::allocate_shared[abi:nn180100]<TCPIO_Establish,std::allocator<TCPIO_Establish>,__NSCFTCPIOStreamTask *&,void>( &location,  v14);
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](v14 + 768, &location);
    v20 = (std::__shared_weak_count *)*((void *)&location + 1);
    if (*((void *)&location + 1))
    {
      v21 = (unint64_t *)(*((void *)&location + 1) + 8LL);
      do
        unint64_t v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }

    (*(void (**)(void, id, int64_t))(**(void **)(v14 + 768) + 16LL))( *(void *)(v14 + 768),  a3,  a4);
    v23 = objc_alloc_init(&OBJC_CLASS_____CFN_TransactionMetrics);
    v24 = (void *)(*(uint64_t (**)(void))(**(void **)(*(void *)(v14 + 784) + 24LL) + 248LL))(*(void *)(*(void *)(v14 + 784) + 24LL));
    if (v23)
    {
      objc_setProperty_atomic(v23, v25, v24, 88LL);
      *(_WORD *)&v23->_scheduledOriginLoad = 257;
    }

    v26 = (void *)[(id)v14 _metrics];
    if (v26) {
      v26 = (void *)v26[5];
    }
    [v26 addObject:v23];
    v27 = (void *)[(id)v14 _metrics];
    if (v27) {
      objc_setProperty_atomic(v27, v28, v23, 96LL);
    }

    *(void *)(v14 + 832) = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
    [(id)v14 setState:1];
    *(_DWORD *)(v14 + 852) = 0;
    objc_initWeak((id *)&location, (id)v14);
    v29 = objc_alloc(&OBJC_CLASS___CFNetworkTimer);
    v30 = (dispatch_queue_s *)[(id)v14 workQueue];
    uint64_t v31 = MEMORY[0x1895F87A8];
    v37[0] = MEMORY[0x1895F87A8];
    v37[1] = 3221225472LL;
    v37[2] = __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke;
    v37[3] = &unk_189C1A3C0;
    objc_copyWeak(&v38, (id *)&location);
    *(void *)(v14 + 912) = -[CFNetworkTimer initWithQueue:completionHandler:](v29, v30, v37);
    v32 = objc_alloc(&OBJC_CLASS___CFNetworkTimer);
    v33 = (dispatch_queue_s *)[(id)v14 workQueue];
    v35[0] = v31;
    v35[1] = 3221225472LL;
    v35[2] = __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke_2;
    v35[3] = &unk_189C1A3C0;
    objc_copyWeak(&v36, (id *)&location);
    *(void *)(v14 + 920) = -[CFNetworkTimer initWithQueue:completionHandler:](v32, v33, v35);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)&location);
  }

  return (__NSCFTCPIOStreamTask *)v14;
}

- (id)workQueue
{
  id result = self->_workQueueForStreamTask;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS_____NSCFTCPIOStreamTask;
    return -[NSURLSessionTask workQueue](&v4, sel_workQueue);
  }

  return result;
}

- (__NSCFTCPIOStreamTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6
{
  cntrl = (dispatch_object_s *)a4.__cntrl_;
  ptr = a4.__ptr_;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS_____NSCFTCPIOStreamTask;
  v9 = -[NSURLSessionTask initWithTask:](&v38, sel_initWithTask_, a3, a4.__ptr_, a4.__cntrl_, a5, a6);
  if (v9)
  {
    v10 = *(OS_dispatch_queue **)(*(void *)ptr + 120LL);
    if (v10) {
      dispatch_retain(*(dispatch_object_t *)(*(void *)ptr + 120LL));
    }
    v9->_workQueueForStreamTask = v10;
    v9->_disavow = _Block_copy(a5);
    id v11 = -[__NSCFTCPIOStreamTask workQueue](v9, "workQueue");
    v12 = (char *)operator new(0x50uLL);
    *((void *)v12 + 1) = 0LL;
    *((void *)v12 + 2) = 0LL;
    *(void *)v12 = off_189C0A900;
    TransportConnectionObjCPP::TransportConnectionObjCPP((TransportConnectionObjCPP *)(v12 + 24), v11);
    *(void *)&__int128 location = v12 + 24;
    *((void *)&location + 1) = v12;
    std::shared_ptr<HTTPEngine>::__enable_weak_this[abi:nn180100]<HTTPEngine,HTTPEngine,void>( (uint64_t)&location,  (void *)v12 + 4,  (uint64_t)(v12 + 24));
    p_ios = &v9->_ios;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&v9->_ios, &location);
    uint64_t v14 = (std::__shared_weak_count *)*((void *)&location + 1);
    if (*((void *)&location + 1))
    {
      v15 = (unint64_t *)(*((void *)&location + 1) + 8LL);
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }

    v17 = p_ios->__ptr_;
    uint64_t v18 = *(void *)ptr;
    unint64_t v19 = (std::__shared_weak_count *)*((void *)ptr + 1);
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        unint64_t v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
      std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)v17 + 3, v18, (uint64_t)v19);
      unint64_t v22 = (unint64_t *)&v19->__shared_owners_;
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    else
    {
      std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)v17 + 3, v18, 0LL);
    }

    if (cntrl)
    {
      *((void *)p_ios->__ptr_ + 6) = cntrl;
      dispatch_retain(cntrl);
    }

    v9->_connectionState = 2;
    -[NSURLSessionTask setState:](v9, "setState:", 0LL);
    std::allocate_shared[abi:nn180100]<TCPIO_Establish,std::allocator<TCPIO_Establish>,__NSCFTCPIOStreamTask *&,void>( &location,  (uint64_t)v9);
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&v9->_establish, &location);
    v24 = (std::__shared_weak_count *)*((void *)&location + 1);
    if (*((void *)&location + 1))
    {
      v25 = (unint64_t *)(*((void *)&location + 1) + 8LL);
      do
        unint64_t v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }

    v9->_pendingWork = (NSMutableArray *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
    objc_initWeak((id *)&location, v9);
    v27 = objc_alloc(&OBJC_CLASS___CFNetworkTimer);
    v28 = -[__NSCFTCPIOStreamTask workQueue](v9, "workQueue");
    uint64_t v29 = MEMORY[0x1895F87A8];
    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke;
    v35[3] = &unk_189C1A3C0;
    objc_copyWeak(&v36, (id *)&location);
    v9->_writeTimer = (CFNetworkTimer *)-[CFNetworkTimer initWithQueue:completionHandler:](v27, v28, v35);
    v30 = objc_alloc(&OBJC_CLASS___CFNetworkTimer);
    uint64_t v31 = -[__NSCFTCPIOStreamTask workQueue](v9, "workQueue");
    v33[0] = v29;
    v33[1] = 3221225472LL;
    v33[2] = __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke_2;
    v33[3] = &unk_189C1A3C0;
    objc_copyWeak(&v34, (id *)&location);
    v9->_readTimer = (CFNetworkTimer *)-[CFNetworkTimer initWithQueue:completionHandler:](v30, v31, v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)&location);
  }

  return v9;
}

- (void)dealloc
{
  p_establish = &self->_establish;
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)-[NSURLSessionTask session](self, "session"), (uint64_t)self);
  if (p_establish->__ptr_)
  {
    (*(void (**)(TCPIO_EstablishBase *))(*(void *)p_establish->__ptr_ + 32LL))(p_establish->__ptr_);
    __int128 v9 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)p_establish, &v9);
    objc_super v4 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1))
    {
      objc_super v5 = (unint64_t *)(*((void *)&v9 + 1) + 8LL);
      do
        unint64_t v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }

  workQueueForStreamTask = (dispatch_object_s *)self->_workQueueForStreamTask;
  if (workQueueForStreamTask)
  {
    dispatch_release(workQueueForStreamTask);
    self->_workQueueForStreamTask = 0LL;
  }

  self->_pendingWork = 0LL;
  self->__initialDataPayload = 0LL;

  self->_currentWriteTask = 0LL;
  self->_currentReadTask = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSCFTCPIOStreamTask;
  -[NSURLSessionTask dealloc](&v8, sel_dealloc);
}

- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v11 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
  block[3] = &unk_189C160F8;
  block[4] = self;
  block[5] = a6;
  block[6] = a3;
  block[7] = a4;
  *(double *)&block[8] = a5;
  dispatch_async(v11, block);
}

- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  __int128 v9 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke;
  v10[3] = &unk_189C16148;
  v10[5] = a3;
  v10[6] = a5;
  v10[4] = self;
  *(double *)&v10[7] = a4;
  dispatch_async(v9, v10);
}

- (void)captureStreams
{
  self->_captureStreamsUponCompletion = 1;
  if ((objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v3 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "[API MISUSE]: Capture streams called on a URLSessionStreamTask after task has completed",  buf,  2u);
      }
    }

    else
    {
      objc_super v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __39____NSCFTCPIOStreamTask_captureStreams__block_invoke;
      block[3] = &unk_189C1A548;
      block[4] = self;
      dispatch_async(v4, block);
    }
  }

- (void)closeWrite
{
  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v3 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "[API MISUSE]: Attempting to closeWrite on a URLSessionStreamTask after task has completed",  buf,  2u);
    }
  }

  else
  {
    objc_super v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __35____NSCFTCPIOStreamTask_closeWrite__block_invoke;
    block[3] = &unk_189C1A548;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)closeRead
{
  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v3 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "[API MISUSE]: Attempting to closeRead on a URLSessionStreamTask after task has completed",  buf,  2u);
    }
  }

  else
  {
    objc_super v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __34____NSCFTCPIOStreamTask_closeRead__block_invoke;
    block[3] = &unk_189C1A548;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4
{
  v7 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62____NSCFTCPIOStreamTask_copyStreamProperty_completionHandler___block_invoke;
  block[3] = &unk_189C1A480;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(v7, block);
}

- (void)startSecureConnection
{
  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v3 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "[API MISUSE]: Attempting to startSecureConnection on a URLSessionStreamTask after task has completed",  buf,  2u);
    }
  }

  else if ((objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "_allowTCPIOConnectionStreamTask") & 1) != 0 || !self->_ios.__ptr_)
  {
    self->_secure = 1;
  }

  else
  {
    objc_super v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __46____NSCFTCPIOStreamTask_startSecureConnection__block_invoke;
    block[3] = &unk_189C1A548;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)stopSecureConnection
{
  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v3 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "[API MISUSE]: Attempting to stopSecureConnection on a URLSessionStreamTask after task has completed",  buf,  2u);
    }
  }

  else
  {
    objc_super v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __45____NSCFTCPIOStreamTask_stopSecureConnection__block_invoke;
    block[3] = &unk_189C1A548;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)_onqueue_stopSecureConnection
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __54____NSCFTCPIOStreamTask__onqueue_stopSecureConnection__block_invoke;
  v3[3] = &unk_189C1A548;
  v3[4] = self;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:]( self,  "_onqueue_addBlockOp:description:",  v3,  "stopSecureConnection");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  self->_secure = 0;
}

- (void)_onqueue_startSecureConnection
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __55____NSCFTCPIOStreamTask__onqueue_startSecureConnection__block_invoke;
  v3[3] = &unk_189C1A548;
  v3[4] = self;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:]( self,  "_onqueue_addBlockOp:description:",  v3,  "startSecureConnection");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  self->_secure = 1;
}

- (void)_onqueue_closeRead
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke;
  v4[3] = &unk_189C1A548;
  v4[4] = self;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_3;
  v3[3] = &unk_189C1A298;
  v3[4] = v4;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "closeRead");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
}

- (void)_onqueue_closeWrite
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke;
  v4[3] = &unk_189C1A548;
  v4[4] = self;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_3;
  v3[3] = &unk_189C1A298;
  v3[4] = v4;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "closeWrite");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
}

- (void)_onqueue_captureStreams
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke;
  v4[3] = &unk_189C1A548;
  v4[4] = self;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2;
  v3[3] = &unk_189C1A2E8;
  v3[4] = self;
  void v3[5] = v4;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:shouldWaitForTls:]( self,  "_onqueue_addBlockOp:description:shouldWaitForTls:",  v3,  "captureStreams",  1LL);
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
}

- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4
{
}

- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4 shouldWaitForTls:(BOOL)a5
{
  v7 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]( (uint64_t)&OBJC_CLASS_____NSCFURLLocalStreamTaskWorkBlockOp,  a3,  (uint64_t)a4);
  if (v7) {
    *((_BYTE *)v7 + 56) = a5;
  }
  -[NSMutableArray addObject:](self->_pendingWork, "addObject:", v7);
}

- (BOOL)shouldDoWorkConsideringTlsState
{
  return !self->_secure || self->_goneSecure;
}

- (void)_onqueue_ioTick
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (self->_doingWorkOnThisQueue)
  {
    v3 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __40____NSCFTCPIOStreamTask__onqueue_ioTick__block_invoke;
    block[3] = &unk_189C1A548;
    block[4] = self;
    dispatch_async(v3, block);
    return;
  }

  if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateSuspended && self->_connectionState >= 2)
  {
    if (self->_doingWorkOnThisQueue) {
      __assert_rtn( "-[__NSCFTCPIOStreamTask _onqueue_ioTick]",  "LocalTCPIOStreamTask.mm",  1916,  "_doingWorkOnThisQueue == false");
    }
    self->_doingWorkOnThisQueue = 1;
    if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateSuspended)
    {
      pendingWork = self->_pendingWork;
      self->_pendingWork = (NSMutableArray *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingWork,  "countByEnumeratingWithState:objects:count:",  &v13,  v22,  16LL);
      if (!v5) {
        goto LABEL_31;
      }
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (1)
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(pendingWork);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_opt_class();
          if (v10 == objc_opt_class())
          {
            if (!self->_writeInProgress
              && -[__NSCFTCPIOStreamTask shouldDoWorkConsideringTlsState](self, "shouldDoWorkConsideringTlsState"))
            {
              -[__NSCFTCPIOStreamTask _onqueue_processWriteWork:](self, "_onqueue_processWriteWork:", v9);
              continue;
            }

            goto LABEL_28;
          }

          if (v10 == objc_opt_class())
          {
            if (!self->_readInProgress
              && -[__NSCFTCPIOStreamTask shouldDoWorkConsideringTlsState](self, "shouldDoWorkConsideringTlsState"))
            {
              -[__NSCFTCPIOStreamTask _onqueue_processReadWork:](self, "_onqueue_processReadWork:", v9);
              continue;
            }

            goto LABEL_28;
          }

          if (v10 != objc_opt_class())
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
            {
              uint64_t v11 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              uint64_t v19 = v11;
              __int16 v20 = 2112;
              uint64_t v21 = v9;
              _os_log_fault_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "class %@ not  known for %@",  buf,  0x16u);
            }

- (void)_onqueue_timeoutOccured
{
  self->_writeError.domain = 1LL;
  self->_writeError.error = 60;
  self->_readError.domain = 1LL;
  self->_readError.error = 60;
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:self->_writeError.error userInfo:0];
  currentWriteTask = self->_currentWriteTask;
  if (currentWriteTask)
  {
    (*((void (**)(void))currentWriteTask->_completion + 2))();
    self->_currentWriteTask->super._hasBeenCalledBack = 1;
    objc_setProperty_nonatomic(self, v4, 0LL, 928LL);
  }

  currentReadTask = self->_currentReadTask;
  if (currentReadTask)
  {
    (*((void (**)(void))currentReadTask->_completion + 2))();
    self->_currentReadTask->super._hasBeenCalledBack = 1;
    objc_setProperty_nonatomic(self, v6, 0LL, 936LL);
  }

  self->_writeInProgress = 0;
  self->_readInProgress = 0;
  -[CFNetworkTimer setTimer:]((uint64_t)self->_writeTimer, 0.0);
  -[CFNetworkTimer setTimer:]((uint64_t)self->_readTimer, 0.0);
}

- (void)_onqueue_callbackCompletedWork
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  completedSuspendedWork = self->_completedSuspendedWork;
  uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( completedSuspendedWork,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(completedSuspendedWork);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        if (v8 == objc_opt_class())
        {
          (*(void (**)(void))(*(void *)(v7 + 64) + 16LL))();
        }

        else
        {
          uint64_t v9 = *(void **)(v7 + 64);
          (*(void (**)(void))(*(void *)(v7 + 56) + 16LL))();
        }
      }

      uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( completedSuspendedWork,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v4);
  }

  self->_completedSuspendedWork = 0LL;
}

- (void)_onqueue_processWriteWork:(id)a3
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, a3, 928LL);
  }
  if (-[NSURLSessionTask error](self, "error")
    || -[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (!*((_BYTE *)a3 + 40)) {
      (*(void (**)(void, NSError *))(*((void *)a3 + 8) + 16LL))( *((void *)a3 + 8),  -[NSURLSessionTask error](self, "error"));
    }
    goto LABEL_7;
  }

  size_t v5 = [*((id *)a3 + 6) length];
  SEL v6 = (void *)*((void *)a3 + 6);
  if (!v5)
  {

    (*(void (**)(void, void))(*((void *)a3 + 8) + 16LL))(*((void *)a3 + 8), 0LL);
LABEL_7:
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    return;
  }

  dispatch_data_t v7 = dispatch_data_create((const void *)[v6 bytes], v5, 0, 0);

  double v8 = *((double *)a3 + 2);
  self->_writeInProgress = v8 != 0.0;
  if (!*((_BYTE *)a3 + 41)) {
    -[CFNetworkTimer setTimer:]((uint64_t)self->_writeTimer, v8);
  }
  ptr = self->_ios.__ptr_;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __51____NSCFTCPIOStreamTask__onqueue_processWriteWork___block_invoke;
  v10[3] = &unk_189C0A478;
  v10[4] = self;
  v10[5] = a3;
  TransportConnectionObjCPP::write((uint64_t)ptr, (uint64_t)v7, (uint64_t)v10);
  dispatch_release(v7);
}

- (void)_onqueue_processReadWork:(id)a3
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, a3, 936LL);
  }
  if (-[NSURLSessionTask error](self, "error"))
  {
    (*(void (**)(void, void, void, NSError *))(*((void *)a3 + 7) + 16LL))( *((void *)a3 + 7),  0LL,  0LL,  -[NSURLSessionTask error](self, "error"));
    goto LABEL_8;
  }

  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted || self->_receivedEof)
  {
    (*(void (**)(void, void, uint64_t, void))(*((void *)a3 + 7) + 16LL))( *((void *)a3 + 7),  0LL,  1LL,  0LL);
    goto LABEL_8;
  }

  if (!*((_DWORD *)a3 + 11) && !*((_DWORD *)a3 + 12))
  {
    (*(void (**)(void, uint64_t, void, void))(*((void *)a3 + 7) + 16))( *((void *)a3 + 7),  [MEMORY[0x189603F48] data],  0,  0);
LABEL_8:
    if (!*((_BYTE *)a3 + 40)) {
      -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    }
    return;
  }

  double v5 = *((double *)a3 + 2);
  self->_readInProgress = v5 != 0.0;
  if (!*((_BYTE *)a3 + 41)) {
    -[CFNetworkTimer setTimer:]((uint64_t)self->_readTimer, v5);
  }
  ptr = self->_ios.__ptr_;
  uint64_t v7 = *((unsigned int *)a3 + 11);
  uint64_t v8 = *((unsigned int *)a3 + 12);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __50____NSCFTCPIOStreamTask__onqueue_processReadWork___block_invoke;
  v9[3] = &unk_189C0A4A0;
  v9[4] = self;
  v9[5] = a3;
  TransportConnectionObjCPP::read((uint64_t)ptr, v7, v8, (uint64_t)v9);
}

- (id)_onqueue_errorOrCancelError
{
  if (!-[NSURLSessionTask error](self, "error")) {
    -[NSURLSessionTask setError:]( self,  "setError:",  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607740] code:-999 userInfo:0]);
  }
  return -[NSURLSessionTask error](self, "error");
}

- (BOOL)_onqueue_usingProxy
{
  if (__CFNUseNWHTTPSProxies::useProxyOnce != -1) {
    dispatch_once(&__CFNUseNWHTTPSProxies::useProxyOnce, &__block_literal_global_11_4737);
  }
  if (__CFNUseNWHTTPSProxies::useNWHTTPSProxy) {
    return 0;
  }
  if (-[NSURLSessionTask _proxySettings](self, "_proxySettings"))
  {
    uint64_t v4 = -[NSURLSessionTask _proxySettings](self, "_proxySettings");
    if (!v4)
    {
      SEL v6 = 0LL;
      goto LABEL_13;
    }

    double v5 = (__CFDictionary *)CFRetain(v4);
    goto LABEL_11;
  }

  if (!__sProxyOverrideDict || (SEL v6 = (__CFDictionary *)CFRetain((CFTypeRef)__sProxyOverrideDict)) == 0LL)
  {
    double v5 = CFNetworkCopySystemProxySettings();
LABEL_11:
    SEL v6 = v5;
  }

- (void)_onqueue_resume
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v3 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "[API MISUSE]: Resuming URLSessionStreamTaskk after task has completed",  (uint8_t *)&v44,  2u);
    }

    return;
  }

  p_establish = &self->_establish;
  if (!self->_establish.__ptr_)
  {
    -[__NSCFTCPIOStreamTask _onqueue_cancel](self, "_onqueue_cancel");
    return;
  }

  if (-[NSURLSessionTask _TCPConnectionMetadata](self, "_TCPConnectionMetadata"))
  {
    ptr = self->_ios.__ptr_;
    cntrl = self->_ios.__cntrl_;
    if (cntrl)
    {
      uint64_t v7 = (unint64_t *)((char *)cntrl + 8);
      do
        unint64_t v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
      do
        unint64_t v9 = __ldaxr(v7);
      while (__stlxr(v9 - 1, v7));
      if (!v9)
      {
        (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16LL))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }

    if (ptr)
    {
      __int128 v11 = self->_ios.__ptr_;
      uint64_t v10 = self->_ios.__cntrl_;
      *(void *)&__int128 v44 = v11;
      *((void *)&v44 + 1) = v10;
      if (v10)
      {
        __int128 v12 = (unint64_t *)((char *)v10 + 8);
        do
          unint64_t v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
      }

      (*(void (**)(void, uint64_t, NSData *))(**((void **)v11 + 3) + 200LL))( *((void *)v11 + 3),  0x18C5ACD08LL,  -[NSURLSessionTask _TCPConnectionMetadata](self, "_TCPConnectionMetadata", (void)v44, *((void *)&v44 + 1)));
      if (v10)
      {
        __int128 v14 = (unint64_t *)((char *)v10 + 8);
        do
          unint64_t v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          (*(void (**)(__shared_weak_count *))(*(void *)v10 + 16LL))(v10);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
        }
      }
    }
  }

  if (self->__initialDataPayload)
  {
    v17 = self->_ios.__ptr_;
    uint64_t v16 = self->_ios.__cntrl_;
    if (v16)
    {
      uint64_t v18 = (unint64_t *)((char *)v16 + 8);
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
      do
        unint64_t v20 = __ldaxr(v18);
      while (__stlxr(v20 - 1, v18));
      if (!v20)
      {
        (*(void (**)(__shared_weak_count *))(*(void *)v16 + 16LL))(v16);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v16);
      }
    }

    if (v17)
    {
      uint64_t v21 = self->_ios.__ptr_;
      unint64_t v22 = self->_ios.__cntrl_;
      *(void *)&__int128 v44 = v21;
      *((void *)&v44 + 1) = v22;
      if (v22)
      {
        uint64_t v23 = (unint64_t *)((char *)v22 + 8);
        do
          unint64_t v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }

      (*(void (**)(void, uint64_t, NSData *))(**((void **)v21 + 3) + 200LL))( *((void *)v21 + 3),  0x18C5AC560LL,  self->__initialDataPayload);
      if (v22)
      {
        v25 = (unint64_t *)((char *)v22 + 8);
        do
          unint64_t v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          (*(void (**)(__shared_weak_count *))(*(void *)v22 + 16LL))(v22);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v22);
        }
      }
    }
  }

  if (-[__NSCFTCPIOStreamTask _onqueue_usingProxy](self, "_onqueue_usingProxy", (void)v44, *((void *)&v44 + 1)))
  {
    uint64_t v27 = HTTPProtocol::_instantiateProtocol(*MEMORY[0x189604DB0], &self->super, 0LL, 1);
    if (v27)
    {
      v28 = (char *)v27;
      CFRetain(v28);
      *(void *)&__int128 v44 = v28 + 16;
      uint64_t v29 = operator new(0x20uLL);
      void *v29 = off_189C0CE68;
      v29[1] = 0LL;
      v29[2] = 0LL;
      v29[3] = v28 + 16;
      *((void *)&v44 + 1) = v29;
      p_httpProtocol = &self->_httpProtocol;
      std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_httpProtocol, &v44);
      uint64_t v31 = (std::__shared_weak_count *)*((void *)&v44 + 1);
      if (*((void *)&v44 + 1))
      {
        v32 = (unint64_t *)(*((void *)&v44 + 1) + 8LL);
        do
          unint64_t v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }

      id v34 = p_httpProtocol->__ptr_;
      if (p_httpProtocol->__ptr_)
      {
        v35 = p_establish->__ptr_;
        id v36 = self->_establish.__cntrl_;
        if (v36)
        {
          v37 = (unint64_t *)((char *)v36 + 8);
          do
            unint64_t v38 = __ldxr(v37);
          while (__stxr(v38 + 1, v37));
          if (v35) {
            uint64_t v39 = (uint64_t)v35 + 24;
          }
          else {
            uint64_t v39 = 0LL;
          }
          std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)v34 + 101, v39, (uint64_t)v36);
          do
            unint64_t v40 = __ldaxr(v37);
          while (__stlxr(v40 - 1, v37));
          if (!v40)
          {
            (*(void (**)(__shared_weak_count *))(*(void *)v36 + 16LL))(v36);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v36);
          }
        }

        else
        {
          if (v35) {
            uint64_t v41 = (uint64_t)v35 + 24;
          }
          else {
            uint64_t v41 = 0LL;
          }
          std::shared_ptr<__CFString const>::operator=[abi:nn180100]( (void *)v34 + 101,  v41,  (uint64_t)self->_establish.__cntrl_);
        }

        (*(void (**)(HTTPProtocol *, void))(*(void *)p_httpProtocol->__ptr_ + 88LL))( p_httpProtocol->__ptr_,  0LL);
        CFRelease(v28);
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        v42 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          v43 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription", (void)v44);
          LODWORD(v44) = 138543362;
          *(void *)((char *)&v44 + 4) = v43;
          _os_log_impl( &dword_18298D000,  v42,  OS_LOG_TYPE_DEFAULT,  "Proxy configured for Stream%{public}@",  (uint8_t *)&v44,  0xCu);
        }

        goto LABEL_64;
      }

      CFRelease(v28);
    }
  }

  if (self->_connectionState == 2)
  {
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }

  else
  {
    -[__NSURLSessionLocal addConnectionlessTask:]((uint64_t)-[NSURLSessionTask session](self, "session"), (uint64_t)self);
    (*(void (**)(TCPIO_EstablishBase *, BOOL))(*(void *)p_establish->__ptr_ + 24LL))( p_establish->__ptr_,  self->_secure != 0);
    self->_connectionState = 1;
  }

- (void)_onqueue_cancel
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke;
  v4[3] = &unk_189C1A548;
  v4[4] = self;
  if (self->_connectionState > 1)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke_2;
    v3[3] = &unk_189C1A298;
    v3[4] = v4;
    -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "Cancel");
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }

  else
  {
    __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke((uint64_t)v4);
  }

- (void)_onqueue_checkForCompletion
{
  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateCanceling)
  {
    p_ios = &self->_ios;
    if (self->_ios.__ptr_)
    {
      if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateSuspended) {
        -[NSURLSessionTask setState:](self, "setState:", 2LL);
      }
      ptr = p_ios->__ptr_;
      if (p_ios->__ptr_)
      {
        if (self->_secure)
        {
          (*(void (**)(TCPIO_EstablishBase *))(*(void *)self->_establish.__ptr_ + 56LL))(self->_establish.__ptr_);
          self->_secure = 0;
          self->_goneSecure = 0;
          ptr = p_ios->__ptr_;
        }

        uint64_t v6 = *((void *)ptr + 3);
        if (v6 && !*((_BYTE *)ptr + 40))
        {
          *((_BYTE *)ptr + 40) = 1;
          (*(void (**)(uint64_t, void))(*(void *)v6 + 152LL))(v6, 0LL);
        }

        self->_connectionState = 4;
        __int128 v10 = 0uLL;
        std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_ios, &v10);
        uint64_t v7 = (std::__shared_weak_count *)*((void *)&v10 + 1);
        if (*((void *)&v10 + 1))
        {
          unint64_t v8 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
          do
            unint64_t v9 = __ldaxr(v8);
          while (__stlxr(v9 - 1, v8));
          if (!v9)
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
      }

      if (self->_captureStreamsUponCompletion)
      {
        -[NSURLSessionTask _resetTaskDelegate]((uint64_t)self, v4);
      }

      else
      {
        -[NSURLSession _onqueue_didCompleteTask:withError:]( (uint64_t)-[NSURLSessionTask session](self, "session"),  self,  -[NSURLSessionTask error](self, "error"));
        -[__NSURLSessionLocal removeUnresumedTask:]( (uint64_t)-[NSURLSessionTask session](self, "session"),  (uint64_t)self);
      }

      -[NSURLSessionTask setState:](self, "setState:", 3LL);
      -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    }
  }

- (void)cancel
{
  uint64_t v3 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31____NSCFTCPIOStreamTask_cancel__block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onqueue_preConnectionConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (__CFNUseNWHTTPSProxies::useProxyOnce != -1) {
    dispatch_once(&__CFNUseNWHTTPSProxies::useProxyOnce, &__block_literal_global_11_4737);
  }
  if (__CFNUseNWHTTPSProxies::useNWHTTPSProxy)
  {
    unint64_t v9 = -[NSURLRequest URL](-[NSURLSessionTask originalRequest](self, "originalRequest"), "URL");
    if (v9) {
      ProxyConnectionEstablishment::SetProxyURL((const __CFURL *)v9, (uint64_t)a3, (uint64_t)a4);
    }
    if (-[NSURLSessionTask _proxySettings](self, "_proxySettings"))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      __int128 v10 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138543362;
        __int128 v12 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
        _os_log_debug_impl( &dword_18298D000,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}@ has custom proxy settings",  (uint8_t *)&v11,  0xCu);
      }

      ProxyConnectionEstablishment::SetProxies( (uint64_t)a3,  (uint64_t)a4,  (uint64_t)-[NSURLSessionTask _proxySettings](self, "_proxySettings"));
    }
  }

  (*((void (**)(id))a5 + 2))(a5);
}

- (void)_onqueue_dealWithSessionTrustAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5
{
  if ((unint64_t)(a3 - 2) < 2)
  {
    (*((void (**)(id, uint64_t, uint64_t, id))a5 + 2))(a5, 2LL, 1LL, a4);
    -[__NSCFTCPIOStreamTask _onqueue_cancel](self, "_onqueue_cancel");
  }

  else if (a3 == 1)
  {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0LL, 0LL);
  }

  else if (!a3)
  {
    if (a4) {
      uint64_t v5 = 1LL;
    }
    else {
      uint64_t v5 = 2LL;
    }
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, v5, 0LL);
  }

- (BOOL)_onqueue_sendSessionChallenge:(id)a3 completionHandler:(id)a4
{
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    int v9 = -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge]((uint64_t)internalDelegateWrapper, a2);
    __int128 v10 = self->super._internalDelegateWrapper;
    if (v10)
    {
      if (!v9)
      {
LABEL_9:
        if ((-[__NSCFURLSessionDelegateWrapper didReceiveChallenge]((uint64_t)v10, v8) & 1) != 0)
        {
          publicDelegateWrapper = self->super._internalDelegateWrapper;
          if (!publicDelegateWrapper) {
            publicDelegateWrapper = self->super._publicDelegateWrapper;
          }
          goto LABEL_12;
        }

        return 0;
      }
    }

    else
    {
      __int128 v10 = self->super._publicDelegateWrapper;
      if ((v9 & 1) == 0) {
        goto LABEL_9;
      }
    }

- (void)_onqueue_needServerTrust:(id)a3 completionHandler:(id)a4
{
  self->_receivedServerTrustChallenge = 1;
  if (-[NSURLSessionTask state](self, "state") < NSURLSessionTaskStateCanceling)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke;
    v7[3] = &unk_189C16198;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = a4;
    if (!-[__NSCFTCPIOStreamTask _onqueue_sendSessionChallenge:completionHandler:]( self,  "_onqueue_sendSessionChallenge:completionHandler:",  a3,  v7)) {
      (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
    }
  }

  else
  {
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0LL, 1LL);
  }

- (void)_onqueue_needClientCert:(id)a3 completionHandler:(id)a4
{
  if (-[NSURLSessionTask state](self, "state") < NSURLSessionTaskStateCanceling)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke;
    v7[3] = &unk_189C16198;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = a4;
    if (!-[__NSCFTCPIOStreamTask _onqueue_sendSessionChallenge:completionHandler:]( self,  "_onqueue_sendSessionChallenge:completionHandler:",  a3,  v7)) {
      (*((void (**)(id, void))a4 + 2))(a4, 0LL);
    }
  }

  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

- (void)_onqueue_dealWithSessionClientCertAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5
{
  if ((unint64_t)(a3 - 2) < 2)
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
    -[__NSCFTCPIOStreamTask _onqueue_cancel](self, "_onqueue_cancel");
    return;
  }

  if (a3 == 1)
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
    return;
  }

  if (!a3)
  {
    if (a4)
    {
      CFMutableArrayRef Mutable = (CFMutableArrayRef)[a4 _CFURLCredential];
      if (!Mutable) {
        goto LABEL_18;
      }
      if (*((_DWORD *)Mutable + 12) == 3)
      {
        uint64_t v7 = (char *)Mutable + 16;
        unint64_t v8 = (const void *)(*(uint64_t (**)(uint64_t))(*((void *)Mutable + 2) + 120LL))((uint64_t)Mutable + 16);
        if (v8)
        {
          CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
          CFArrayAppendValue(Mutable, v8);
          int v9 = (const __CFArray *)(*(uint64_t (**)(char *))(*(void *)v7 + 112LL))(v7);
          __int128 v10 = v9;
          if (!v9 || CFArrayGetCount(v9) < 1) {
            goto LABEL_18;
          }
          CFTypeRef v16 = CFRetain(v10);
          unint64_t Count = CFArrayGetCount(v10);
          CFIndex v12 = Count;
          int64_t v17 = Count;
          if (Count - 1 > 0x1FFFFFFFFFFFFFFDLL)
          {
            uint64_t v18 = 0LL;
            goto LABEL_24;
          }

          if (Count > 0x1E)
          {
            uint64_t v13 = (const void **)malloc(8 * Count);
            uint64_t v18 = v13;
            if (!v13) {
              goto LABEL_24;
            }
          }

          else
          {
            uint64_t v13 = (const void **)v19;
            uint64_t v18 = (const void **)v19;
          }

          v21.__int128 location = 0LL;
          v21.length = v12;
          CFArrayGetValues(v10, v21, v13);
LABEL_24:
          int64_t v20 = 0LL;
          while (1)
          {
            int64_t v15 = v20;
            if (v20 >= v17) {
              break;
            }
            ++v20;
            CFArrayAppendValue(Mutable, v18[v15]);
          }

          CFContainerEnumeratorBase::~CFContainerEnumeratorBase((CFContainerEnumeratorBase *)&v16);
          goto LABEL_18;
        }
      }
    }

    CFMutableArrayRef Mutable = 0LL;
LABEL_18:
    (*((void (**)(id, CFMutableArrayRef))a5 + 2))(a5, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

- (void)_onqueue_postConnectConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
}

- (void)_onqueue_setTransportConnection:(shared_ptr<TransportConnection>)a3
{
  ptr = a3.__ptr_;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v5 = self->_ios.__ptr_;
  uint64_t v6 = *(void *)a3.__ptr_;
  uint64_t v7 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)v5 + 3, v6, (uint64_t)v7);
    __int128 v10 = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  else
  {
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)v5 + 3, v6, 0LL);
  }

  uint64_t v12 = *((void *)self->_ios.__ptr_ + 3);
  uint64_t v13 = *(OS_dispatch_queue **)(v12 + 120);
  if (v13) {
    dispatch_retain(*(dispatch_object_t *)(v12 + 120));
  }
  self->_workQueueForStreamTask = v13;
  if (self->_secure)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    char v14 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      CFTypeRef v16 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      _os_log_impl(&dword_18298D000, v14, OS_LOG_TYPE_DEFAULT, "Stream%{public}@ enabling TLS", (uint8_t *)&v15, 0xCu);
    }

    (*(void (**)(void, uint64_t))(**(void **)ptr + 24LL))(*(void *)ptr, 1LL);
  }

- (void)_onqueue_tlsCompletion
{
  if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateCompleted
    && (objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    self->_goneSecure = 1;
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }

- (void)_onqueue_tlsDisabled
{
  if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateCompleted
    && (objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    self->_goneSecure = 0;
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }

- (void)_onqueue_cleanUpConnectionEstablishmentState
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (self->_receivedServerTrustChallenge)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v3 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v10) = 138543362;
      *(void *)((char *)&v10 + 4) = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      _os_log_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_DEFAULT,  "Stream%{public}@ is complete and received server trust, marking as secure",  (uint8_t *)&v10,  0xCu);
    }

    self->_goneSecure = 1;
  }

  if (self->_httpProtocol.__ptr_)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v4 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      LODWORD(v10) = 138543362;
      *(void *)((char *)&v10 + 4) = v5;
      _os_log_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_DEFAULT,  "Stream%{public}@ has completed HTTP protocol connection establishment",  (uint8_t *)&v10,  0xCu);
    }

    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)self->_httpProtocol.__ptr_ + 101, 0LL, 0LL);
    __int128 v10 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_httpProtocol, &v10);
    uint64_t v6 = (std::__shared_weak_count *)*((void *)&v10 + 1);
    if (*((void *)&v10 + 1))
    {
      uint64_t v7 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
      do
        unint64_t v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }

  ptr = self->_ios.__ptr_;
  if (ptr) {
    TransportConnection::rstConnectionEstablishmentDelegate(*((TransportConnection **)ptr + 3));
  }
}

- (void)_onqueue_connectionEstablishedWithError:(id)a3 callbackReferent:(id)a4
{
  int var1 = a3.var1;
  int64_t var0 = a3.var0;
  $C9A20311543CE7131523B4F7AC24AF8E valuePtr = a3;
  if (-[NSURLSessionTask error](self, "error"))
  {
    -[NSURLSession _onqueue_didCompleteTask:withError:]( (uint64_t)-[NSURLSessionTask session](self, "session"),  self,  -[NSURLSessionTask error](self, "error"));
    -[NSURLSessionTask setState:](self, "setState:", 3LL);
    return;
  }

  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
  }

  else
  {
    internalDelegateWrapper = 0LL;
  }

  if (!-[__NSCFURLSessionDelegateWrapper didBecomeInputOutputStream]( (uint64_t)internalDelegateWrapper,  v8)
    || !objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "_allowTCPIOConnectionStreamTask"))
  {
    if (var0 && var1)
    {
      -[NSURLSessionTask setError:]( self,  "setError:",  __cfnCreateCFErrorWithStreamError((CFAllocatorRef)*MEMORY[0x189604DB0], (int *)&valuePtr));
      self->_connectionState = 4;
      self->_secure = 0;
      -[__NSCFTCPIOStreamTask _onqueue_checkForCompletion](self, "_onqueue_checkForCompletion");
    }

    else
    {
      self->_connectionState = 2;
    }

    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    return;
  }

  uint64_t v10 = MEMORY[0x1895F87A8];
  if (!var0 || !var1)
  {
    std::allocate_shared[abi:nn180100]<TCPIO_Delegate,std::allocator<TCPIO_Delegate>,std::shared_ptr<TransportConnectionObjCPP> &,void>( &v41,  (std::__shared_weak_count_vtbl *)self->_ios.__ptr_,  (std::__shared_weak_count *)self->_ios.__cntrl_);
    uint64_t v35 = v10;
    uint64_t v36 = 3321888768LL;
    v37 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_3;
    unint64_t v38 = &unk_189C0A3E8;
    __int128 v14 = v41;
    __int128 v40 = v41;
    if (*((void *)&v41 + 1))
    {
      int v15 = (unint64_t *)(*((void *)&v41 + 1) + 8LL);
      do
        unint64_t v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }

    id v39 = a4;
    uint64_t v11 = (void *)CFReadStreamCreate();
    v33[7] = v10;
    v33[8] = 3321888768LL;
    v33[9] = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_4;
    v33[10] = &unk_189C0A440;
    __int128 v34 = v14;
    if (*((void *)&v14 + 1))
    {
      uint64_t v17 = (unint64_t *)(*((void *)&v14 + 1) + 8LL);
      do
        unint64_t v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }

    v33[11] = a4;
    uint64_t v12 = (void *)CFWriteStreamCreate();
    if (*((void *)&v34 + 1))
    {
      unint64_t v19 = (unint64_t *)(*((void *)&v34 + 1) + 8LL);
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        (*(void (**)(void))(**((void **)&v34 + 1) + 16LL))(*((void *)&v34 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
      }
    }

    if (*((void *)&v40 + 1))
    {
      CFRange v21 = (unint64_t *)(*((void *)&v40 + 1) + 8LL);
      do
        unint64_t v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        (*(void (**)(void))(**((void **)&v40 + 1) + 16LL))(*((void *)&v40 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v40 + 1));
      }
    }

    uint64_t v23 = (std::__shared_weak_count *)*((void *)&v41 + 1);
    if (*((void *)&v41 + 1))
    {
      unint64_t v24 = (unint64_t *)(*((void *)&v41 + 1) + 8LL);
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    -[NSURLSessionTask setState:](self, "setState:", 3LL);
    goto LABEL_40;
  }

  uint64_t v47 = MEMORY[0x1895F87A8];
  uint64_t v48 = 3221225472LL;
  v49 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke;
  v50 = &__block_descriptor_48_e26__v16__0____CFReadStream__8l;
  $C9A20311543CE7131523B4F7AC24AF8E v51 = valuePtr;
  uint64_t v11 = (void *)CFReadStreamCreate();
  uint64_t v42 = v10;
  uint64_t v43 = 3221225472LL;
  __int128 v44 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_2;
  uint64_t v45 = &__block_descriptor_48_e27__v16__0____CFWriteStream__8l;
  $C9A20311543CE7131523B4F7AC24AF8E v46 = valuePtr;
  uint64_t v12 = (void *)CFWriteStreamCreate();
  -[NSURLSessionTask setState:](self, "setState:", 3LL);
  if (self)
  {
LABEL_40:
    publicDelegateWrapper = self->super._internalDelegateWrapper;
    if (!publicDelegateWrapper) {
      publicDelegateWrapper = self->super._publicDelegateWrapper;
    }
    goto LABEL_42;
  }

  publicDelegateWrapper = 0LL;
LABEL_42:
  v33[0] = v10;
  v33[1] = 3221225472LL;
  v33[2] = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_5;
  v33[3] = &unk_189C10E30;
  v33[5] = v11;
  v33[6] = v12;
  void v33[4] = self;
  -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:]( (uint64_t)publicDelegateWrapper,  self,  v11,  v12,  v33);
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
  ptr = self->_establish.__ptr_;
  if (ptr)
  {
    (*(void (**)(TCPIO_EstablishBase *))(*(void *)ptr + 32LL))(ptr);
    __int128 v41 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_establish, &v41);
    uint64_t v27 = (std::__shared_weak_count *)*((void *)&v41 + 1);
    if (*((void *)&v41 + 1))
    {
      v28 = (unint64_t *)(*((void *)&v41 + 1) + 8LL);
      do
        unint64_t v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
  }

  __int128 v41 = 0uLL;
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_ios, &v41);
  v30 = (std::__shared_weak_count *)*((void *)&v41 + 1);
  if (*((void *)&v41 + 1))
  {
    uint64_t v31 = (unint64_t *)(*((void *)&v41 + 1) + 8LL);
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

- (void)_onqueue_suspend
{
  self->_completedSuspendedWork = (NSMutableArray *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
  -[NSURLSessionTask setState:](self, "setState:", 1LL);
}

- (void)_onqueue_adjustPoolPriority
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412546;
    uint64_t v4 = objc_opt_class();
    __int16 v5 = 2080;
    Name = sel_getName(a2);
    _os_log_fault_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "%@ - %s - can only be used with -captureStreams",  (uint8_t *)&v3,  0x16u);
  }

- (void)_onqueue_adjustLoadingPoolPriority
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412546;
    uint64_t v4 = objc_opt_class();
    __int16 v5 = 2080;
    Name = sel_getName(a2);
    _os_log_fault_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "%@ - %s - can only be used with -captureStreams",  (uint8_t *)&v3,  0x16u);
  }

- (void)_onSessionQueue_disavow
{
  disavow = (void (**)(id, __NSCFTCPIOStreamTask *))self->_disavow;
  if (disavow)
  {
    self->_disavow = 0LL;
    disavow[2](disavow, self);
    _Block_release(disavow);
  }

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  writeTimer = self->_writeTimer;
  if (writeTimer)
  {
    -[CFNetworkTimer cancelTimer]((uint64_t)writeTimer);

    self->_writeTimer = 0LL;
  }

  readTimer = self->_readTimer;
  if (readTimer)
  {
    -[CFNetworkTimer cancelTimer]((uint64_t)readTimer);

    self->_readTimer = 0LL;
  }

  objc_setProperty_nonatomic(self, a2, 0LL, 936LL);
  objc_setProperty_nonatomic(self, v5, 0LL, 928LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFTCPIOStreamTask;
  -[NSURLSessionTask _onSessionQueue_cleanupAndBreakCycles](&v6, sel__onSessionQueue_cleanupAndBreakCycles);
}

- (NSData)_initialDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 808LL, 1);
}

- (void)set_initialDataPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 96) = 0LL;
  *((void *)self + 97) = 0LL;
  *((void *)self + 98) = 0LL;
  *((void *)self + 99) = 0LL;
  *((void *)self + 102) = 0LL;
  *((void *)self + 103) = 0LL;
  return self;
}

@end