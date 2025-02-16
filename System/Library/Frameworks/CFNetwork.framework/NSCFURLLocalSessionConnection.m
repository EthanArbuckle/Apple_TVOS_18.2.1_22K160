@interface NSCFURLLocalSessionConnection
@end

@implementation NSCFURLLocalSessionConnection

void __71____NSCFURLLocalSessionConnection_initWithTask_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x186E1578C]();
  -[__NSCFURLLocalSessionConnection _tick](*(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

uint64_t __51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8LL, 1);
  }
  uint64_t v6 = [Property _metrics];
  id v7 = *(id *)(a1 + 32);
  if (v7) {
    id v7 = objc_getProperty(v7, v5, 8LL, 1);
  }
  -[__CFN_TaskMetrics nextTransaction:withNewRequest:](v6, 1025, (void *)[v7 currentRequest]);
  return (*(uint64_t (**)(const char *, void))(*(void *)a2 + 16LL))( a2,  *(void *)(*(void *)(a1 + 32) + 8LL));
}

void __52____NSCFURLLocalSessionConnection__didSendBodyData___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = [MEMORY[0x189607968] numberWithLongLong:a1[5]];
    uint64_t v6 = [MEMORY[0x189607968] numberWithLongLong:a1[6]];
    objc_msgSend( a2,  "connection:sentBodyBytes:totalBytes:expectedBytes:",  v4,  v5,  v6,  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", a1[7]));
  }

  uint64_t v7 = a1[4];
  if (v7)
  {
    --*(void *)(v7 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v7);
  }

void __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "connection:didReceiveResponse:completion:");
  }

  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }

uint64_t __51____NSCFURLLocalSessionConnection_withLoaderAsync___block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __42____NSCFURLLocalSessionConnection_suspend__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v3 = *(void *)(v2 + 96);
  *(void *)(v2 + 96) = v3 + 1;
  if (!v3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 32LL))(a2);
  }
  return result;
}

void __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_2( uint64_t a1,  __int128 *a2)
{
  uint64_t v4 = *(_BYTE **)(a1 + 32);
  if (v4[168])
  {
    [v4 resume];
    uint64_t v4 = *(_BYTE **)(a1 + 32);
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_3;
  v5[3] = &unk_189C13648;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = v4;
  __int128 v8 = *a2;
  uint64_t v9 = *((void *)a2 + 2);
  if (v4)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v10[3] = &unk_189C1A2E8;
    v10[4] = v4;
    v10[5] = v5;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v4, (const char *)v10);
  }

uint64_t __41____NSCFURLLocalSessionConnection_resume__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v3 = *(void *)(v2 + 96) - 1LL;
  *(void *)(v2 + 96) = v3;
  if (!v3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40LL))(a2);
  }
  return result;
}

uint64_t __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return -[__NSCFURLLocalSessionConnection _tick](*(void *)(a1 + 32));
}

uint64_t __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 48) + 176LL) = *(void *)(a1 + 64);
  *(void *)(*(void *)(a1 + 48) + 184LL) = *(void *)(a1 + 72);
  if (*(_BYTE *)(a1 + 56)) {
    return objc_msgSend( *(id *)(a1 + 48),  "_didFinishWithError:",  objc_msgSend(MEMORY[0x189607A70], "errorWithDomain:code:userInfo:", *MEMORY[0x189607740], -999, 0));
  }
  *(void *)(*(void *)(a1 + 48) + 144LL) = 0LL;
  uint64_t result = [*(id *)(a1 + 40) expectedContentLength];
  uint64_t v3 = result;
  int v4 = *(unsigned __int8 *)(a1 + 57);
  if (*(_BYTE *)(a1 + 57))
  {
    uint64_t result = [*(id *)(a1 + 40) _inner];
    if (*(_DWORD *)(result + 72) == 2)
    {
      int v4 = 0;
    }

    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        uint64_t result = [*(id *)(a1 + 40) statusCode];
        int v4 = result != 206;
      }

      else
      {
        int v4 = 1;
      }
    }
  }

  if (*(_BYTE *)(a1 + 59)) {
    *(void *)(*(void *)(a1 + 48) + 144LL) = v3;
  }
  if (v4) {
    uint64_t result = -[__NSCFURLSessionConnection _setupForCache:expectedLength:response:]( *(void *)(a1 + 48),  v3,  *(void **)(a1 + 40));
  }
  if (*(_BYTE *)(a1 + 60))
  {
    *(_DWORD *)(*(void *)(a1 + 48) + 136LL) = 4;
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      v5[0] = MEMORY[0x1895F87A8];
      v5[1] = 3221225472LL;
      v5[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke;
      v5[3] = &unk_189C05850;
      void v5[4] = result;
      return [(id)result withLoaderAsync:v5];
    }
  }

  return result;
}

void __48____NSCFURLLocalSessionConnection__tick_running__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (nw_settings_get_signposts_enabled())
    {
      uint64_t v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_getProperty(v5, v4, 8LL, 1);
      }
      kdebug_trace();
    }

    LODWORD(v7) = *(_DWORD *)(a1 + 56);
    objc_msgSend( a2,  "connection:didReceiveData:completion:",  MEMORY[0x1895F87A8],  3221225472,  __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_2,  &unk_189C058D8,  *(void *)(a1 + 32),  a2,  *(void *)(a1 + 48),  v7);
  }

  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      --*(void *)(v6 + 112);
      -[__NSCFURLLocalSessionConnection _tick](v6);
    }
  }

  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_2(int8x16_t *a1, const char *a2)
{
  id Property = (id)a1[2].i64[0];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8LL, 1);
  }
  [Property _consumePendingBytesReceivedEncoded];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_3;
  v5[3] = &unk_189C058D8;
  __int32 v8 = a1[3].i32[2];
  uint64_t v7 = a1[3].i64[0];
  int8x16_t v4 = a1[2];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  if (v4.i64[0])
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v9[3] = &unk_189C1A2E8;
    v9[4] = v4.i64[0];
    v9[5] = v5;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v4.i64[0], (const char *)v9);
  }

uint64_t __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_3(uint64_t a1)
{
  if (nw_settings_get_signposts_enabled())
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3) {
      objc_getProperty(v3, v2, 8LL, 1);
    }
    kdebug_trace();
  }

  return [*(id *)(a1 + 40) _ackBytes:*(void *)(a1 + 48)];
}

uint64_t __45____NSCFURLLocalSessionConnection__ackBytes___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 152LL))(a2, *(void *)(result + 32));
  }
  return result;
}

void __55____NSCFURLLocalSessionConnection__didFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }

void __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int8x16_t v6 = *(__CFError **)(v5 + 128);
    if (v6)
    {
      uint64_t v7 = cfnTranslateCFError(v6, (void *)objc_msgSend(*(id *)(v5 + 8), "currentRequest_URL"));
      uint64_t v5 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    [a2 connection:v5 didFinishLoadingWithError:v7];
  }

  __int32 v8 = *(dispatch_queue_t **)(a1 + 32);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke_2;
  v9[3] = &unk_189C1A548;
  v9[4] = v8;
  -[__NSCFURLSessionConnection withWorkQueueAsync:](v8, (const char *)v9);
}

void *__51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke;
    v2[3] = &unk_189C05850;
    v2[4] = result;
    return (void *)[result withLoaderAsync:v2];
  }

  return result;
}

void __43____NSCFURLLocalSessionConnection__cleanup__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_object_s **)(v2 + 16);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke_2;
  v15[3] = &unk_189C1A548;
  v15[4] = v2;
  std::allocate_shared[abi:nn180100]<CoreSchedulingSetOneOff,std::allocator<CoreSchedulingSetOneOff>,NSObject  {objcproto17OS_dispatch_queue}*&,void({block_pointer}&)(void),void>( &v16,  v3,  v15);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80LL);
  v13 = v16;
  v14 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }

  (*(void (**)(uint64_t, dispatch_object_s ***))(*(void *)v4 + 16LL))(v4, &v13);
  uint64_t v7 = v14;
  if (v14)
  {
    __int32 v8 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  v10 = v17;
  if (v17)
  {
    v11 = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

void __43____NSCFURLLocalSessionConnection__cleanup__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
}

uint64_t __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (a2)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    uint64_t v4 = 3221225472LL;
    uint64_t v5 = __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_2;
    unint64_t v6 = &unk_189C05950;
    uint64_t v7 = v2;
    return objc_msgSend(a2, "connection:willCacheResponse:responseCallback:");
  }

  else if (v2)
  {
    --*(void *)(v2 + 112);
    return -[__NSCFURLLocalSessionConnection _tick](v2);
  }

  return result;
}

void __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 32);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_3;
  v3[3] = &unk_189C1A270;
  v3[4] = v2;
  v3[5] = a2;
  if (v2)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v4[3] = &unk_189C1A2E8;
    v4[4] = v2;
    v4[5] = v3;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](v2, (const char *)v4);
  }

uint64_t __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_3(uint64_t a1)
{
  return -[__NSCFURLSessionConnection _storeCachedResponse:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void __74____NSCFURLLocalSessionConnection__captureTransportConnection_extraBytes___block_invoke( void *a1,  void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = (std::__shared_weak_count *)a1[7];
    uint64_t v11 = a1[6];
    unint64_t v12 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        unint64_t v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }

    [a2 connection:v3 didReceiveTCPConnection:&v11 extraBytes:a1[5]];
    uint64_t v7 = v12;
    if (v12)
    {
      __int32 v8 = (unint64_t *)&v12->__shared_owners_;
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

  else
  {
    (*(void (**)(void))(*(void *)a1[6] + 152LL))(a1[6]);
  }

  uint64_t v10 = a1[4];
  if (v10)
  {
    --*(void *)(v10 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v10);
  }

void __75____NSCFURLLocalSessionConnection__capturedSocketInputStream_outputStream___block_invoke( uint64_t a1,  void *a2)
{
  if (a2)
  {
    [a2 connection:*(void *)(a1 + 32) didReceiveSocketInputStream:*(void *)(a1 + 40) outputStream:*(void *)(a1 + 48)];
  }

  else
  {
    [*(id *)(a1 + 40) close];
    [*(id *)(a1 + 48) close];
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }

void __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = [*(id *)(v2 + 8) currentRequest];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_2;
    v7[3] = &unk_189C05B80;
    uint64_t v6 = *(void *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    v7[5] = a2;
    [a2 connection:v2 request:v5 needsNewBodyStreamFromOffset:v6 callback:v7];
  }

  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }

void __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_3;
  v3[3] = &unk_189C1A610;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  __int128 v4 = v2;
  uint64_t v5 = a2;
  if ((void)v2)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v6[3] = &unk_189C1A2E8;
    v6[4] = v2;
    v6[5] = v3;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v2, (const char *)v6);
  }

uint64_t __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_4;
  v3[3] = &unk_189C05AE0;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

uint64_t __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 56LL))(a2, *(void *)(a1 + 40));
}

void __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = [*(id *)(v2 + 8) currentRequest];
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_2;
    v6[3] = &unk_189C05B80;
    v6[4] = *(void *)(a1 + 32);
    v6[5] = a2;
    [a2 connection:v2 request:v5 needsNewBodyStreamCallback:v6];
  }

  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }

void __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_3;
  v3[3] = &unk_189C1A610;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  __int128 v4 = v2;
  uint64_t v5 = a2;
  if ((void)v2)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v6[3] = &unk_189C1A2E8;
    v6[4] = v2;
    v6[5] = v3;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v2, (const char *)v6);
  }

uint64_t __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_4;
  v3[3] = &unk_189C05AE0;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

uint64_t __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 56LL))(a2, *(void *)(a1 + 40));
}

uint64_t __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2;
  v3[3] = &unk_189C05AE0;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "connection:challenged:authCallback:");
  }

  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v6 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) _loggableDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a3;
    _os_log_impl(&dword_18298D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ auth completion disp=%d cred=%p", buf, 0x1Cu);
  }

  if (a2 == 1)
  {
    if ([*(id *)(a1 + 40) previousFailureCount] < 1) {
      a2 = 1LL;
    }
    else {
      a2 = 3LL;
    }
  }

  __int32 v8 = *(dispatch_queue_t **)(a1 + 32);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_64;
  v9[3] = &unk_189C05B30;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  uint64_t v12 = a3;
  uint64_t v13 = a2;
  uint64_t v11 = v8;
  if (v8)
  {
    *(void *)buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    *(void *)&buf[24] = &unk_189C1A2E8;
    v15 = v8;
    v16 = v9;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](v8, buf);
  }

uint64_t __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_64(int8x16_t *a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2_65;
  v3[3] = &unk_189C05B08;
  void v3[4] = a1[2].i64[1];
  uint64_t v5 = a1[4].i64[0];
  int8x16_t v1 = a1[3];
  int8x16_t v4 = vextq_s8(v1, v1, 8uLL);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1.i64[0], (uint64_t)v3);
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2_65(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (const void *)[*(id *)(a1 + 32) _createCFAuthChallenge];
  switch(*(void *)(a1 + 56))
  {
    case 0LL:
      (*(void (**)(uint64_t, uint64_t, const void *))(*(void *)a2 + 80))( a2,  [*(id *)(a1 + 40) _CFURLCredential],  v5);
      if (v5) {
        goto LABEL_9;
      }
      return;
    case 1LL:
      (*(void (**)(uint64_t, const void *))(*(void *)a2 + 72LL))(a2, v5);
      goto LABEL_11;
    case 2LL:
      id Property = *(id *)(a1 + 48);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 8LL, 1);
      }
      [Property cancel];
      goto LABEL_8;
    case 3LL:
      (*(void (**)(uint64_t, const void *))(*(void *)a2 + 88LL))(a2, v5);
LABEL_11:
      if (!v5) {
        return;
      }
      goto LABEL_9;
    default:
LABEL_8:
      if (v5) {
LABEL_9:
      }
        CFRelease(v5);
      return;
  }

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int8x16_t v4 = (const void *)[*(id *)(a1 + 32) _createCFAuthChallenge];
  (*(void (**)(uint64_t, uint64_t, const void *))(*(void *)a2 + 80))( a2,  [*(id *)(a1 + 40) _CFURLCredential],  v4);
  if (v4) {
    CFRelease(v4);
  }
}

void __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke( void *a1,  void *a2)
{
  uint64_t v2 = (dispatch_queue_t *)a1[6];
  if (a2)
  {
    objc_msgSend( a2,  "connection:wasRedirected:newRequest:responseCallback:",  MEMORY[0x1895F87A8],  3221225472,  __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_3,  &unk_189C05A90,  v2,  a2,  a1[4],  a1[5],  a1[7]);
  }

  else
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_2;
    v3[3] = &unk_189C1A298;
    void v3[4] = a1[7];
    if (v2)
    {
      v4[0] = MEMORY[0x1895F87A8];
      v4[1] = 3221225472LL;
      v4[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
      v4[3] = &unk_189C1A2E8;
      v4[4] = v2;
      v4[5] = v3;
      -[__NSCFURLSessionConnection withWorkQueueAsync:](v2, (const char *)v4);
    }
  }

uint64_t __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  if (!a2) {
    goto LABEL_9;
  }
  objc_opt_class();
  id v4 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v5 = (void *)objc_msgSend( MEMORY[0x189607A50],  "componentsWithURL:resolvingAgainstBaseURL:",  objc_msgSend(a2, "URL"),  0);
    if (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", 0x18C5B2C68))
    {
      uint64_t v6 = &kCFURLSchemeHTTPS;
LABEL_7:
      [v5 setScheme:*v6];
      id v4 = (id)[a2 mutableCopy];
      objc_msgSend(v4, "setURL:", objc_msgSend(v5, "URL"));
      goto LABEL_8;
    }

    id v4 = a2;
    if (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", 0x18C5B2C30))
    {
      uint64_t v6 = &kCFURLSchemeHTTP;
      goto LABEL_7;
    }
  }

uint64_t __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 64) + 16LL))( *(void *)(a1 + 64),  *(void *)(a1 + 56));
}

void __59____NSCFURLLocalSessionConnection__alternatePathAvailable___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 connection:*(void *)(a1 + 32) alternatePathAvailable:*(unsigned int *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }

void __67____NSCFURLLocalSessionConnection__conditionalRequirementsChanged___block_invoke( uint64_t a1,  void *a2)
{
  if (a2) {
    objc_msgSend(a2, "connection:_conditionalRequirementsChanged:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }

void __66____NSCFURLLocalSessionConnection__connectionIsWaitingWithReason___block_invoke( uint64_t a1,  void *a2)
{
  if (a2) {
    [a2 connection:*(void *)(a1 + 32) waitingWithReason:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }

void __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = [*(id *)(v3 + 8) currentRequest];
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_3;
    v6[3] = &unk_189C07858;
    __int128 v7 = *(_OWORD *)(a1 + 32);
    objc_msgSend(a2, "connection:_willSendRequestForEstablishedConnection:completion:", v3, v5, v6);
  }

  else
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_2;
    v8[3] = &unk_189C1A298;
    v8[4] = *(void *)(a1 + 40);
    if (v3)
    {
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
      v9[3] = &unk_189C1A2E8;
      void v9[4] = v3;
      void v9[5] = v8;
      -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v3, (const char *)v9);
    }
  }

uint64_t __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_4;
  v5[3] = &unk_189C1A2E8;
  uint64_t v3 = *(dispatch_queue_t **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  void v5[4] = a2;
  void v5[5] = v4;
  if (v3)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v6[3] = &unk_189C1A2E8;
    void v6[4] = v3;
    v6[5] = v5;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](v3, (const char *)v6);
  }

uint64_t __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += a5;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return 1LL;
}

uint64_t __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke_2( uint64_t a1,  int a2,  uint64_t a3,  void *__src,  size_t __n)
{
  return 1LL;
}

void __68____NSCFURLLocalSessionConnection__didReceiveInformationalResponse___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }

uint64_t __64____NSCFURLLocalSessionConnection_expectedProgressTargetChanged__block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 128LL))(a2);
}

uint64_t __58____NSCFURLLocalSessionConnection_setBytesPerSecondLimit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 120LL))(a2, *(void *)(a1 + 32));
}

uint64_t __63____NSCFURLLocalSessionConnection_setPriorityHint_incremental___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, float))(*(void *)a2 + 112LL))( a2,  *(unsigned __int8 *)(a1 + 36),  *(float *)(a1 + 32));
}

void __51____NSCFURLLocalSessionConnection_setPoolPriority___block_invoke(uint64_t a1, uint64_t a2)
{
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, (const void *)(a1 + 32));
  (*(void (**)(uint64_t, CFNumberRef))(*(void *)a2 + 104LL))(a2, v3);
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t __49____NSCFURLLocalSessionConnection_setIsDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 48LL))(a2, *(unsigned __int8 *)(a1 + 32));
}

void __41____NSCFURLLocalSessionConnection_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(int *)(v2 + 136) <= 1)
  {
    uint64_t v4 = *(dispatch_object_s **)(v2 + 16);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __41____NSCFURLLocalSessionConnection_cancel__block_invoke_2;
    v15[3] = &unk_189C1A548;
    v15[4] = v2;
    std::allocate_shared[abi:nn180100]<CoreSchedulingSetOneOff,std::allocator<CoreSchedulingSetOneOff>,NSObject  {objcproto17OS_dispatch_queue}*&,void({block_pointer}&)(void),void>( &v16,  v4,  v15);
    uint64_t v13 = v16;
    uint64_t v14 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }

    (*(void (**)(uint64_t, dispatch_object_s ***))(*(void *)a2 + 24LL))(a2, &v13);
    __int128 v7 = v14;
    if (v14)
    {
      uint64_t v8 = (unint64_t *)&v14->__shared_owners_;
      do
        unint64_t v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

    int8x16_t v10 = v17;
    if (v17)
    {
      __int128 v11 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }

uint64_t __41____NSCFURLLocalSessionConnection_cancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_didFinishWithError:",  objc_msgSend(MEMORY[0x189607A70], "errorWithDomain:code:userInfo:", *MEMORY[0x189607740], -999, 0));
}

@end