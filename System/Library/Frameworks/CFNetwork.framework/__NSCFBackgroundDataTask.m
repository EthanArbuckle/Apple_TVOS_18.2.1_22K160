@interface __NSCFBackgroundDataTask
- (BOOL)isKindOfClass:(Class)a3;
- (__NSCFBackgroundDataTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (id).cxx_construct;
- (void)_onqueue_captureStream:(uint64_t)a1;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didReceiveData:(void *)a3 withCompletion:;
- (void)_onqueue_finishStream:(uint64_t)a1;
- (void)_onqueue_needNewBodyStream:(uint64_t)a3 withCompletion:;
- (void)_onqueue_startReadingFromStream;
- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
@end

@implementation __NSCFBackgroundDataTask

- (__NSCFBackgroundDataTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundDataTask;
  v6 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:]( &v8,  sel_initWithOriginalRequest_ident_taskGroup_,  a3,  a4,  a5);
  if (v6) {
    v6->_initialStream = (NSInputStream *)(id)[a3 HTTPBodyStream];
  }
  return v6;
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
  v8[3] = &unk_189C1A660;
  v8[4] = a3;
  v8[5] = self;
  v8[6] = a4;
  if (self)
  {
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
  }

  else
  {
    internalDelegateWrapper = 0LL;
  }

  -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]( (uint64_t)internalDelegateWrapper,  self,  a3,  v8);
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundDataTask;
  -[__NSCFBackgroundSessionTask _onqueue_didFinishWithError:](&v5, sel__onqueue_didFinishWithError_, a3);
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundDataTask;
  if (-[__NSCFBackgroundDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (void)dealloc
{
  ptr = self->_requestBody.__ptr_;
  if (ptr) {
    (*(void (**)(RequestBody *, SEL))(*(void *)ptr + 64LL))(ptr, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundDataTask;
  -[__NSCFBackgroundSessionTask dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 98) = 0LL;
  *((void *)self + 99) = 0LL;
  return self;
}

- (void)_onqueue_finishStream:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[(id)a1 workQueue]);
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  objc_super v4 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v21 = 138412546;
    *(void *)&v21[4] = a1;
    *(_WORD *)&v21[12] = 1024;
    *(_DWORD *)&v21[14] = a2;
    _os_log_debug_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_DEBUG,  "%@ finish reading from stream (force stop: %{BOOL}d)",  v21,  0x12u);
  }

  if (*(void *)(a1 + 784))
  {
    if (!*(void *)(a1 + 824)) {
      goto LABEL_19;
    }
    objc_super v5 = (void *)[*(id *)(a1 + 800) propertyForKey:0x18C5AC4F0];
    if (!v5) {
      goto LABEL_19;
    }
    v6 = v5;
    if (![v5 count]) {
      goto LABEL_19;
    }
    uint64_t v7 = [(id)a1 session];
    uint64_t v8 = [(id)a1 taskIdentifier];
    if (!v7) {
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    if (-[__NSURLBackgroundSession taskForIdentifier:]((id *)v7, v8))
    {
      [*(id *)(v7 + 168) setPropertyOnStreamWithIdentifier:v9 propDict:v6 propKey:0x18C5AC4F0 withReply:&__block_literal_global_165];
LABEL_19:
      if (*(_BYTE *)(a1 + 841))
      {
        *(_BYTE *)(a1 + 841) = 0;
        (*(void (**)(void))(**(void **)(a1 + 784) + 24LL))(*(void *)(a1 + 784));
      }

      (*(void (**)(void))(**(void **)(a1 + 784) + 64LL))(*(void *)(a1 + 784));
      *(void *)v21 = 0LL;
      *(void *)&v21[8] = 0LL;
      std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](a1 + 784, (__int128 *)v21);
      v15 = *(std::__shared_weak_count **)&v21[8];
      if (*(void *)&v21[8])
      {
        v16 = (unint64_t *)(*(void *)&v21[8] + 8LL);
        do
          unint64_t v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }

      *(void *)(a1 + 800) = 0LL;
      goto LABEL_27;
    }

    int v10 = [*(id *)(v7 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v11 = (os_log_s *)CFNLog::logger;
    BOOL v12 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (!v12) {
        goto LABEL_19;
      }
      uint64_t v13 = *(void *)(v7 + 128);
      *(_DWORD *)v21 = 138543618;
      *(void *)&v21[4] = v13;
      *(_WORD *)&v21[12] = 2048;
      *(void *)&v21[14] = v9;
      v14 = "ProxySession <%{public}@> Cannot set property on data task with identifier %lu because there is no such task";
    }

    else
    {
      if (!v12) {
        goto LABEL_19;
      }
      uint64_t v20 = *(void *)(v7 + 128);
      *(_DWORD *)v21 = 138543618;
      *(void *)&v21[4] = v20;
      *(_WORD *)&v21[12] = 2048;
      *(void *)&v21[14] = v9;
      v14 = "BackgroundSession <%{public}@> Cannot set property on data task with identifier %lu because there is no such task";
    }

    _os_log_debug_impl(&dword_18298D000, v11, OS_LOG_TYPE_DEBUG, v14, v21, 0x16u);
    goto LABEL_19;
  }

- (void)_onqueue_captureStream:(uint64_t)a1
{
  if (a1)
  {
    -[__NSCFBackgroundDataTask _onqueue_finishStream:](a1, 1u);
    if (a2)
    {
      objc_super v4 = (void *)[MEMORY[0x1896079B0] pipe];
      *(void *)(a1 + 816) = (id)[v4 fileHandleForReading];
      id v5 = (id)[v4 fileHandleForWriting];
      dispatch_fd_t v6 = [v5 fileDescriptor];
      uint64_t v7 = (dispatch_queue_s *)[(id)a1 workQueue];
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 3221225472LL;
      cleanup_handler[2] = __51____NSCFBackgroundDataTask__onqueue_captureStream___block_invoke;
      cleanup_handler[3] = &unk_189C12488;
      cleanup_handler[4] = v5;
      uint64_t v8 = dispatch_io_create(0LL, v6, v7, cleanup_handler);
      *(void *)(a1 + 824) = v8;
      dispatch_io_set_low_water(v8, 0xFFFFFFFFFFFFFFFFLL);
      *(void *)(a1 + 800) = a2;
      uint64_t v9 = (std::__shared_weak_count_vtbl *)CFRetain(a2);
      v31 = v9;
      int v10 = (std::__shared_weak_count *)operator new(0x20uLL);
      v10->__shared_owners_ = 0LL;
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      v10->__vftable = (std::__shared_weak_count_vtbl *)off_189C177F0;
      v10->__shared_weak_owners_ = 0LL;
      v10[1].__vftable = v9;
      v32 = v10;
      BOOL v12 = (dispatch_object_s *)[(id)a1 workQueue];
      uint64_t v13 = operator new(0xE0uLL);
      v14 = v13;
      v13[1] = 0LL;
      v13[2] = 0LL;
      *uint64_t v13 = off_189C17860;
      uint64_t v15 = (uint64_t)(v13 + 3);
      v34 = (CFAllocatedReferenceCountedObject *)v9;
      v35 = v10;
      do
        unint64_t v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
      RequestBodyStream::RequestBodyStream((uint64_t)(v13 + 3), (uint64_t *)&v34, v12, 0LL, 0x20000LL, 0, 0LL);
      do
        unint64_t v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }

      *(void *)&__int128 v30 = v15;
      *((void *)&v30 + 1) = v14;
      std::shared_ptr<HTTPEngine>::__enable_weak_this[abi:nn180100]<HTTPEngine,HTTPEngine,void>( (uint64_t)&v30,  v14 + 4,  v15);
      std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](a1 + 784, &v30);
      v18 = (std::__shared_weak_count *)*((void *)&v30 + 1);
      if (*((void *)&v30 + 1))
      {
        v19 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
        do
          unint64_t v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }

      v21 = (CoreSchedulingSet *)[(id)a1 workQueue];
      v23 = CoreSchedulingSet::createWithDispatchQueue(v21, v22);
      v34 = v23;
      v24 = (std::__shared_weak_count *)operator new(0x20uLL);
      v24->__shared_owners_ = 0LL;
      v25 = (unint64_t *)&v24->__shared_owners_;
      v24->__vftable = (std::__shared_weak_count_vtbl *)off_189C14168;
      v24->__shared_weak_owners_ = 0LL;
      v24[1].__vftable = (std::__shared_weak_count_vtbl *)v23;
      v35 = v24;
      (*(void (**)(void, CFAllocatedReferenceCountedObject *, void))(**(void **)(a1 + 784) + 40LL))( *(void *)(a1 + 784),  v23,  0LL);
      do
        unint64_t v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }

      v27 = v32;
      if (v32)
      {
        v28 = (unint64_t *)&v32->__shared_owners_;
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
  }

- (void)_onqueue_needNewBodyStream:(uint64_t)a3 withCompletion:
{
  if (a1)
  {
    uint64_t v4 = a1[88];
    if (!v4) {
      uint64_t v4 = a1[87];
    }
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __70____NSCFBackgroundDataTask__onqueue_needNewBodyStream_withCompletion___block_invoke;
    v5[3] = &unk_189C0B5F8;
    char v6 = a2;
    v5[4] = a1;
    v5[5] = a3;
    -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v4, a1, v5);
  }

- (void)_onqueue_startReadingFromStream
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)[(id)a1 workQueue]);
    uint64_t v3 = *(void *)(a1 + 784);
    v2 = *(std::__shared_weak_count **)(a1 + 792);
    v9[5] = v3;
    v9[6] = v2;
    if (v2)
    {
      p_shared_owners = (unint64_t *)&v2->__shared_owners_;
      do
        unint64_t v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }

    if (v3 && !*(_BYTE *)(a1 + 841))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      char v6 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = a1;
        _os_log_debug_impl(&dword_18298D000, v6, OS_LOG_TYPE_DEBUG, "%@ start reading from stream", buf, 0xCu);
      }

      *(_BYTE *)(a1 + 841) = 1;
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke;
      v9[3] = &unk_189C0B620;
      v9[4] = a1;
      (*(void (**)(uint64_t, void *))(*(void *)v3 + 16LL))(v3, v9);
    }

    if (v2)
    {
      uint64_t v7 = (unint64_t *)&v2->__shared_owners_;
      do
        unint64_t v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
  }

- (void)_onqueue_didReceiveData:(void *)a3 withCompletion:
{
  if (a1)
  {
    objc_msgSend(a1, "setCountOfBytesReceived:", objc_msgSend(a1, "countOfBytesReceived") + objc_msgSend(a2, "length"));
    uint64_t v6 = a1[88];
    if (!v6) {
      uint64_t v6 = a1[87];
    }
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:](v6, a1, a2, a3);
  }

@end