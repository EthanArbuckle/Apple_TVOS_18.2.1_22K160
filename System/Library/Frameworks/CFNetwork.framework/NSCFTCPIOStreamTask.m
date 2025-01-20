@interface NSCFTCPIOStreamTask
@end

@implementation NSCFTCPIOStreamTask

__n128 __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke( __n128 *a1,  uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 32LL, 0LL);
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  __n128 result = a1[2];
  *(void *)uint64_t v4 = off_189C0A4D0;
  *(void *)(v4 + 8) = a2;
  *(__n128 *)(v4 + 16) = result;
  return result;
}

__n128 __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_2( __n128 *a1,  uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 32LL, 0LL);
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  __n128 result = a1[2];
  *(void *)uint64_t v4 = off_189C0A770;
  *(void *)(v4 + 8) = a2;
  *(__n128 *)(v4 + 16) = result;
  return result;
}

uint64_t __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 152LL, 0LL);
  uint64_t v5 = v4;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 128) = 0u;
  *(void *)(v4 + 144) = 0LL;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(void *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  __NSCFTCPIOReadStream::__NSCFTCPIOReadStream(v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v5;
}

uint64_t __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 120LL, 0LL);
  uint64_t v5 = v4;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(void *)(v4 + 112) = 0LL;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(void *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  __NSCFTCPIOWriteStream::__NSCFTCPIOWriteStream(v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v5;
}

uint64_t __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_5( uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_cleanupAndBreakCycles");
}

void __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v6 = (dispatch_queue_s *)[*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2;
  block[3] = &unk_189C16170;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v10 = a2;
  block[4] = v7;
  block[5] = a3;
  __int128 v9 = *(_OWORD *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v2 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _loggableDescription];
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl( &dword_18298D000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ auth completion disp=%d cred=%p",  (uint8_t *)&v7,  0x1Cu);
  }

  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_dealWithSessionClientCertAuth:credential:completionHandler:",  *(void *)(a1 + 64),  *(void *)(a1 + 40),  *(void *)(a1 + 56));
}

void __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v6 = (dispatch_queue_s *)[*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2;
  block[3] = &unk_189C16170;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v10 = a2;
  block[4] = v7;
  block[5] = a3;
  __int128 v9 = *(_OWORD *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v2 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _loggableDescription];
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl( &dword_18298D000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ auth completion disp=%d cred=%p",  (uint8_t *)&v7,  0x1Cu);
  }

  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_dealWithSessionTrustAuth:credential:completionHandler:",  *(void *)(a1 + 64),  *(void *)(a1 + 40),  *(void *)(a1 + 56));
}

uint64_t __31____NSCFTCPIOStreamTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel");
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result <= 1)
  {
    [*(id *)(a1 + 32) setState:2];
    *(_DWORD *)(*(void *)(a1 + 32) + 852LL) = 3;
    objc_msgSend( *(id *)(a1 + 32),  "setError:",  objc_msgSend(MEMORY[0x189607A70], "errorWithDomain:code:userInfo:", *MEMORY[0x189607740], -999, 0));
    return objc_msgSend(*(id *)(a1 + 32), "_onqueue_checkForCompletion");
  }

  return result;
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __50____NSCFTCPIOStreamTask__onqueue_processReadWork___block_invoke( uint64_t a1,  uint64_t a2,  char a3,  uint64_t a4,  int a5)
{
  uint64_t v8 = (void *)MEMORY[0x189607688];
  if (a5)
  {
    __int16 v9 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:a5 userInfo:0];
    if ((a3 & 1) != 0)
    {
LABEL_3:
      BOOL v10 = 1;
      goto LABEL_8;
    }
  }

  else
  {
    __int16 v9 = 0LL;
    if ((a3 & 1) != 0) {
      goto LABEL_3;
    }
  }

  BOOL v10 = [v9 domain] == *v8 && objc_msgSend(v9, "code") == 57;
LABEL_8:
  *(_BYTE *)(*(void *)(a1 + 32) + 908LL) = v10;
  uint64_t v11 = *(void *)(a1 + 32);
  if (!a2 && *(_BYTE *)(v11 + 908)) {
    __int16 v9 = 0LL;
  }
  -[CFNetworkTimer setTimer:](*(void *)(v11 + 920), 0.0);
  uint64_t v12 = [*(id *)(a1 + 32) state];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v12 == 1)
  {
    *(void *)(v14 + 64) = a2;
    *(void *)(*(void *)(a1 + 40) + 32LL) = v9;
    [*(id *)(*(void *)(a1 + 32) + 840) addObject:*(void *)(a1 + 40)];
  }

  else if (!*(_BYTE *)(v14 + 40))
  {
    (*(void (**)(void))(*(void *)(v14 + 56) + 16LL))();
  }

  objc_setProperty_nonatomic(*(id *)(a1 + 32), v13, 0LL, 936LL);
  *(_BYTE *)(*(void *)(a1 + 32) + 880LL) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

uint64_t __51____NSCFTCPIOStreamTask__onqueue_processWriteWork___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    uint64_t v4 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:a3 userInfo:0];
  }
  else {
    uint64_t v4 = 0LL;
  }
  -[CFNetworkTimer setTimer:](*(void *)(*(void *)(a1 + 32) + 912LL), 0.0);
  uint64_t v5 = [*(id *)(a1 + 32) state];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v5 == 1)
  {
    *(void *)(v7 + 32) = v4;
    [*(id *)(*(void *)(a1 + 32) + 840) addObject:*(void *)(a1 + 40)];
  }

  else if (!*(_BYTE *)(v7 + 40))
  {
    (*(void (**)(void))(*(void *)(v7 + 64) + 16LL))();
  }

  objc_setProperty_nonatomic(*(id *)(a1 + 32), v6, 0LL, 928LL);
  *(_BYTE *)(*(void *)(a1 + 32) + 905LL) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_ioTick__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 857LL) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

void __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 768LL) + 64LL))(*(void *)(*(void *)(a1 + 32) + 768LL));
  __int128 v67 = 0uLL;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(std::__shared_weak_count_vtbl **)(v3 + 784);
  if (v4)
  {
    std::allocate_shared[abi:nn180100]<TCPIO_Delegate,std::allocator<TCPIO_Delegate>,std::shared_ptr<TransportConnectionObjCPP> &,void>( &v66,  v4,  *(std::__shared_weak_count **)(v3 + 792));
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v66 + 1);
    v6 = (TCPIO_Delegate *)v66;
    __int128 v67 = v66;
    uint64_t v3 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v5 = 0LL;
    v6 = 0LL;
  }

  uint64_t v7 = [(id)v3 error];
  uint64_t v8 = *(_BYTE **)(a1 + 32);
  uint64_t v9 = MEMORY[0x1895F87A8];
  if (v7 || v8[881])
  {
    uint64_t v10 = [v8 error];
    uint64_t v11 = *(void **)(a1 + 32);
    if (v10)
    {
      uint64_t v12 = _CFStreamErrorFromCFError((__CFError *)[v11 error]);
    }

    else
    {
      uint64_t v14 = v11 + 108;
      uint64_t v12 = v11[108];
      uint64_t v13 = v14[1];
    }

    uint64_t v60 = v9;
    uint64_t v61 = 3221225472LL;
    v62 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_3;
    v63 = &__block_descriptor_48_e26__v16__0____CFReadStream__8l;
    uint64_t v64 = v12;
    uint64_t v65 = v13;
    v15 = (void *)CFReadStreamCreate();
    if (v6) {
      TCPIO_Delegate::closeReadSide(v6);
    }
  }

  else
  {
    uint64_t v53 = MEMORY[0x1895F87A8];
    uint64_t v54 = 3321888768LL;
    v55 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_4;
    v56 = &unk_189C0A3E8;
    v58 = v6;
    v59 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        unint64_t v38 = __ldxr(p_shared_owners);
      while (__stxr(v38 + 1, p_shared_owners));
    }

    uint64_t v57 = v2;
    v15 = (void *)CFReadStreamCreate();
    if (v59)
    {
      v39 = &v59->__shared_owners_;
      do
        unint64_t v40 = __ldaxr((unint64_t *)v39);
      while (__stlxr(v40 - 1, (unint64_t *)v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
      }
    }
  }

  uint64_t v16 = [*(id *)(a1 + 32) error];
  v17 = *(_BYTE **)(a1 + 32);
  if (v16 || v17[906])
  {
    uint64_t v18 = [v17 error];
    v19 = *(void **)(a1 + 32);
    if (v18)
    {
      uint64_t v20 = _CFStreamErrorFromCFError((__CFError *)[v19 error]);
    }

    else
    {
      v22 = v19 + 111;
      uint64_t v20 = v19[111];
      uint64_t v21 = v22[1];
    }

    uint64_t v47 = v9;
    uint64_t v48 = 3221225472LL;
    v49 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_35;
    v50 = &__block_descriptor_48_e27__v16__0____CFWriteStream__8l;
    uint64_t v51 = v20;
    uint64_t v52 = v21;
    v23 = (void *)CFWriteStreamCreate();
    if ((void)v67) {
      TCPIO_Delegate::closeWriteSide((TCPIO_Delegate *)v67);
    }
  }

  else
  {
    v45[7] = v9;
    v45[8] = 3321888768LL;
    v45[9] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2_38;
    v45[10] = &unk_189C0A440;
    __int128 v46 = v67;
    if (*((void *)&v67 + 1))
    {
      v41 = (unint64_t *)(*((void *)&v67 + 1) + 8LL);
      do
        unint64_t v42 = __ldxr(v41);
      while (__stxr(v42 + 1, v41));
    }

    v45[11] = v2;
    v23 = (void *)CFWriteStreamCreate();
    if (*((void *)&v46 + 1))
    {
      v43 = (unint64_t *)(*((void *)&v46 + 1) + 8LL);
      do
        unint64_t v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        (*(void (**)(void))(**((void **)&v46 + 1) + 16LL))(*((void *)&v46 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v46 + 1));
      }
    }
  }

  [*(id *)(a1 + 32) setState:3];
  v24 = *(void **)(a1 + 32);
  if (v24)
  {
    uint64_t v25 = v24[88];
    if (!v25) {
      uint64_t v25 = v24[87];
    }
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  v45[0] = v9;
  v45[1] = 3221225472LL;
  v45[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_39;
  v45[3] = &unk_189C10E30;
  v45[5] = v15;
  v45[6] = v23;
  v45[4] = v24;
  -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:]( v25,  v24,  v15,  v23,  v45);
  if (v15) {
    CFRelease(v15);
  }
  if (v23) {
    CFRelease(v23);
  }
  uint64_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = *(void *)(v26 + 768);
  if (v27)
  {
    (*(void (**)(uint64_t))(*(void *)v27 + 32LL))(v27);
    __int128 v66 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](*(void *)(a1 + 32) + 768LL, &v66);
    v28 = (std::__shared_weak_count *)*((void *)&v66 + 1);
    if (*((void *)&v66 + 1))
    {
      v29 = (unint64_t *)(*((void *)&v66 + 1) + 8LL);
      do
        unint64_t v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }

    uint64_t v26 = *(void *)(a1 + 32);
  }

  __int128 v66 = 0uLL;
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](v26 + 784, &v66);
  v31 = (std::__shared_weak_count *)*((void *)&v66 + 1);
  if (*((void *)&v66 + 1))
  {
    v32 = (unint64_t *)(*((void *)&v66 + 1) + 8LL);
    do
      unint64_t v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  v34 = (std::__shared_weak_count *)*((void *)&v67 + 1);
  if (*((void *)&v67 + 1))
  {
    v35 = (unint64_t *)(*((void *)&v67 + 1) + 8LL);
    do
      unint64_t v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }

__n128 __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_3(__n128 *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 32LL, 0LL);
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  __n128 result = a1[2];
  *(void *)uint64_t v4 = off_189C0A4D0;
  *(void *)(v4 + 8) = a2;
  *(__n128 *)(v4 + 16) = result;
  return result;
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 152LL, 0LL);
  uint64_t v5 = v4;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 128) = 0u;
  *(void *)(v4 + 144) = 0LL;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(void *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  __NSCFTCPIOReadStream::__NSCFTCPIOReadStream(v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    uint64_t v9 = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v5;
}

__n128 __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_35(__n128 *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 32LL, 0LL);
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  __n128 result = a1[2];
  *(void *)uint64_t v4 = off_189C0A770;
  *(void *)(v4 + 8) = a2;
  *(__n128 *)(v4 + 16) = result;
  return result;
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2_38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 120LL, 0LL);
  uint64_t v5 = v4;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(void *)(v4 + 112) = 0LL;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(void *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  __NSCFTCPIOWriteStream::__NSCFTCPIOWriteStream(v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    uint64_t v9 = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v5;
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_cleanupAndBreakCycles");
}

void __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 906LL) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 784);
  if (v3)
  {
    (*(void (**)(void))(**(void **)(v3 + 24) + 144LL))(*(void *)(v3 + 24));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v4 = v2 + 888;
  *(void *)uint64_t v4 = 1LL;
  *(_DWORD *)(v4 + 8) = 57;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = v5[88];
    if (!v6) {
      uint64_t v6 = v5[87];
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_2;
  v7[3] = &unk_189C1A548;
  v7[4] = v5;
  -[__NSCFURLSessionDelegateWrapper writeClosedForStreamTask:completionHandler:](v6, v5, v7);
}

uint64_t __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

_BYTE *__44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_2(uint64_t a1)
{
  __n128 result = *(_BYTE **)(a1 + 32);
  if (result[881]) {
    return (_BYTE *)objc_msgSend(result, "_onqueue_checkForCompletion");
  }
  return result;
}

void __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 881LL) = 1;
  uint64_t v1 = *(void *)(a1 + 32) + 864LL;
  *(void *)uint64_t v1 = 1LL;
  *(_DWORD *)(v1 + 8) = 57;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v2[88];
    if (!v3) {
      uint64_t v3 = v2[87];
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_2;
  v4[3] = &unk_189C1A548;
  v4[4] = v2;
  -[__NSCFURLSessionDelegateWrapper readClosedForStreamTask:completionHandler:](v3, v2, v4);
}

uint64_t __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

_BYTE *__43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_2(uint64_t a1)
{
  __n128 result = *(_BYTE **)(a1 + 32);
  if (result[906]) {
    return (_BYTE *)objc_msgSend(result, "_onqueue_checkForCompletion");
  }
  return result;
}

uint64_t __55____NSCFTCPIOStreamTask__onqueue_startSecureConnection__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  return result;
}

uint64_t __54____NSCFTCPIOStreamTask__onqueue_stopSecureConnection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 768LL) + 56LL))(*(void *)(*(void *)(a1 + 32) + 768LL));
}

uint64_t __45____NSCFTCPIOStreamTask_stopSecureConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_stopSecureConnection");
}

uint64_t __46____NSCFTCPIOStreamTask_startSecureConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_startSecureConnection");
}

uint64_t __62____NSCFTCPIOStreamTask_copyStreamProperty_completionHandler___block_invoke(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = *(void *)(*(void *)(a1[5] + 784LL) + 24LL);
    (*(void (**)(uint64_t))(*(void *)v2 + 216LL))(v2);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

uint64_t __34____NSCFTCPIOStreamTask_closeRead__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_closeRead");
}

uint64_t __35____NSCFTCPIOStreamTask_closeWrite__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_closeWrite");
}

uint64_t __39____NSCFTCPIOStreamTask_captureStreams__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_captureStreams");
}

void __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 > 1 || *(int *)(v3 + 852) > 2 || *(_BYTE *)(v3 + 857))
  {
    uint64_t v4 = [(id)v3 session];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_2;
    v18[3] = &unk_189C1A2E8;
    uint64_t v5 = *(void *)(a1 + 48);
    v18[4] = *(void *)(a1 + 32);
    v18[5] = v5;
    -[NSURLSession runDelegateBlock:](v4, v18);
  }

  else
  {
    uint64_t v6 = *(int *)(v3 + 896);
    if ((_DWORD)v6)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v6 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
    }

    else
    {
      uint64_t v7 = objc_alloc(&OBJC_CLASS_____NSCFURLLocalStreamTaskWorkWrite);
      if (v7)
      {
        uint64_t v8 = -[__NSCFURLLocalStreamTaskWorkWrite init](v7, "init");
        uint64_t v9 = v8;
        if (v8) {
          *(void *)(v8 + 8) = "writeData";
        }
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      *(void *)(v9 + 48) = *(id *)(a1 + 40);
      *(void *)(v9 + 16) = *(void *)(a1 + 56);
      *(void *)(v9 + 24) = 0LL;
      unint64_t v10 = *(uint64_t **)(a1 + 32);
      uint64_t v11 = v10[114];
      if (!v11 || !*(_DWORD *)(v11 + 48))
      {
        -[CFNetworkTimer setTimer:](v10[114], *(double *)(a1 + 56));
        uint64_t v13 = *(void **)(a1 + 32);
        if (v13) {
          objc_setProperty_nonatomic(v13, v12, (id)v9, 928LL);
        }
        *(_BYTE *)(v9 + 41) = 1;
        unint64_t v10 = *(uint64_t **)(a1 + 32);
      }

      objc_initWeak(&location, (id)[v10 session]);
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 3221225472LL;
      aBlock[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_3;
      aBlock[3] = &unk_189C16120;
      objc_copyWeak(&v16, &location);
      aBlock[4] = *(void *)(a1 + 48);
      *(void *)(v9 + 64) = _Block_copy(aBlock);
      [*(id *)(*(void *)(a1 + 32) + 832) addObject:v9];

      if ([*(id *)(a1 + 32) state] != 1)
      {
        uint64_t v14 = *(_DWORD **)(a1 + 32);
        if (v14[213] == 2) {
          objc_msgSend(v14, "_onqueue_ioTick");
        }
      }

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }

uint64_t __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 32), "_onqueue_errorOrCancelError"));
}

void __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_4;
  v6[3] = &unk_189C1A2E8;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v6);
}

uint64_t __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 > 1 || *(int *)(v3 + 852) > 2 || *(_BYTE *)(v3 + 857))
  {
    uint64_t v4 = [(id)v3 session];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2;
    v15[3] = &unk_189C1A2E8;
    __int128 v16 = *(_OWORD *)(a1 + 32);
    -[NSURLSession runDelegateBlock:](v4, v15);
  }

  else
  {
    uint64_t v5 = *(int *)(v3 + 872);
    if ((_DWORD)v5)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v5 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
    }

    else
    {
      uint64_t v6 = -[__NSCFURLLocalStreamTaskWorkRead init](objc_alloc(&OBJC_CLASS_____NSCFURLLocalStreamTaskWorkRead), "init");
      v6->super._static_description = "readData";
      *(_DWORD *)(&v6->super._timerStarted + 3) = *(void *)(a1 + 48);
      v6->_minBytes = *(void *)(a1 + 56);
      v6->super._timeout = *(double *)(a1 + 64);
      v6->super._timeoutTime = 0.0;
      uint64_t v7 = *(uint64_t **)(a1 + 32);
      uint64_t v8 = v7[115];
      if (!v8 || !*(_DWORD *)(v8 + 48))
      {
        -[CFNetworkTimer setTimer:](v7[115], *(double *)(a1 + 64));
        unint64_t v10 = *(void **)(a1 + 32);
        if (v10) {
          objc_setProperty_nonatomic(v10, v9, v6, 936LL);
        }
        v6->super._timerStarted = 1;
        uint64_t v7 = *(uint64_t **)(a1 + 32);
      }

      objc_initWeak(&location, (id)[v7 session]);
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 3221225472LL;
      aBlock[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3;
      aBlock[3] = &unk_189C160D0;
      objc_copyWeak(&v13, &location);
      aBlock[4] = *(void *)(a1 + 40);
      v6->_completion = _Block_copy(aBlock);
      [*(id *)(*(void *)(a1 + 32) + 832) addObject:v6];

      if ([*(id *)(a1 + 32) state] != 1)
      {
        uint64_t v11 = *(_DWORD **)(a1 + 32);
        if (v11[213] == 2) {
          objc_msgSend(v11, "_onqueue_ioTick");
        }
      }

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

uint64_t __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  0,  0,  objc_msgSend(*(id *)(a1 + 32), "_onqueue_errorOrCancelError"));
}

void __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3( uint64_t a1,  uint64_t a2,  char a3,  uint64_t a4)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4;
  v10[3] = &unk_189C160A8;
  uint64_t v9 = *(void *)(a1 + 32);
  v10[5] = a4;
  v10[6] = v9;
  char v11 = a3;
  v10[4] = a2;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v10);
}

uint64_t __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 40));
}

uint64_t __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

uint64_t __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

uint64_t __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

uint64_t __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

@end