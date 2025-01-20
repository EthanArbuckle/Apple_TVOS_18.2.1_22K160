@interface GTSharedMemoryTransport
@end

@implementation GTSharedMemoryTransport

id __34__GTSharedMemoryTransport_connect__block_invoke(uint64_t a1)
{
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[52])
  {
    objc_msgSend( *(id *)(a1 + 40),  "setError:",  +[GTError_capture errorWithDomain:code:userInfo:]( GTError_capture,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  32,  0));
    uint64_t v3 = 0LL;
    return objc_msgSend( *(id *)(a1 + 40),  "setResult:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  }

  unsigned int v5 = [v2 connected];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 && !*(_BYTE *)(v6 + 304))
  {
    uint64_t v3 = 1LL;
    return objc_msgSend( *(id *)(a1 + 40),  "setResult:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  }

  uint64_t v11 = 0LL;
  if (*(_DWORD *)(v6 + 300) == 2)
  {
    if (([(id)v6 _serverConnect:&v11] & 1) == 0)
    {
      v7 = *(_BYTE **)(a1 + 32);
LABEL_13:
      [v7 _tearDownSharedMemory];
      uint64_t v9 = 0LL;
      goto LABEL_14;
    }
  }

  else if (([(id)v6 _clientConnect:&v11] & 1) == 0)
  {
    v7 = *(_BYTE **)(a1 + 32);
    if (!v7[304]) {
      goto LABEL_13;
    }
    uint64_t v11 = 0LL;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __34__GTSharedMemoryTransport_connect__block_invoke_2;
    v10[3] = &unk_20E0C8;
    v10[4] = v7;
    dispatch_async(global_queue, v10);
    v7 = *(_BYTE **)(a1 + 32);
    if (!v7[304]) {
      goto LABEL_13;
    }
  }

  uint64_t v9 = 1LL;
LABEL_14:
  [*(id *)(a1 + 40) setError:v11];
  return objc_msgSend( *(id *)(a1 + 40),  "setResult:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
}

id __34__GTSharedMemoryTransport_connect__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _clientConnect:0] & 1) == 0)
  {
    do
      usleep(0x3D090u);
    while (![*(id *)(a1 + 32) _clientConnect:0]);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 304LL) = 0;
  id result = [*(id *)(*(void *)(a1 + 32) + 312) count];
  if (result)
  {
    uint64_t v3 = 0LL;
    unsigned int v4 = 1;
    do
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 312) objectAtIndex:v3];
      uint64_t v6 = *(void **)(a1 + 32);
      id v7 = [v5 message];
      id v8 = [v5 replyTo];
      id v9 = [v5 queue];
      id v10 = [v5 timeout];
      id v11 = [v5 replyBlock];
      v13.receiver = v6;
      v13.super_class = (Class)&OBJC_CLASS___GTSharedMemoryTransport_capture;
      objc_msgSendSuper2(&v13, "send:inReplyTo:error:replyQueue:timeout:handler:", v7, v8, 0, v9, v10, v11);
      uint64_t v3 = v4;
      id result = [*(id *)(*(void *)(a1 + 32) + 312) count];
    }

    while ((unint64_t)result > v4++);
  }

  return result;
}

id __48__GTSharedMemoryTransport__createAndRunSources___block_invoke(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (*(_BYTE *)(v1 + 52))
  {
    *(_BYTE *)(*(void *)(*(void *)(*((void *)result + 5) + 8LL) + 40LL) + 24LL) = 1;
  }

  else
  {
    unsigned int v2 = atomic_load((unsigned int *)(v1 + 48));
    atomic_store(v2, *(unsigned int **)(*((void *)result + 4) + 232LL));
    return [*((id *)result + 4) _dequeueIncomingMessages];
  }

  return result;
}

void *__45__GTSharedMemoryTransport_setRelayTransport___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 272LL);
  if (v1 != (void *)result[5])
  {
    unsigned int v2 = result;

    *(void *)(v2[4] + 272LL) = (id)v2[5];
    uint64_t v3 = v2[4];
    if (*(void *)(v3 + 272)) {
      unsigned int v4 = &selRef__relayPacket;
    }
    else {
      unsigned int v4 = &selRef__accumulateMessageBytes;
    }
    *(void *)(v3 + 288) = *v4;
    id result = [(id)v2[4] methodForSelector:*(void *)(v2[4] + 288)];
    *(void *)(v2[4] + 280LL) = result;
    if (!*(void *)(v2[4] + 280LL)) {
      __assert_rtn("-[GTSharedMemoryTransport setRelayTransport:]_block_invoke", ", 0, "_consumeBytesIMP"");
    }
  }

  return result;
}

void *__34__GTSharedMemoryTransport_setUrl___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[5] + 8LL);
  if ((void *)result[4] != v1)
  {
    unsigned int v2 = result;

    *(void *)(v2[5] + 8LL) = (id)v2[4];
    id result = objc_msgSend(objc_msgSend(*(id *)(v2[5] + 8), "scheme"), "isEqualToString:", @"dysmtdeferred");
    uint64_t v3 = v2[5];
    if ((_DWORD)result) {
      BOOL v4 = *(_DWORD *)(v3 + 300) != 2;
    }
    else {
      BOOL v4 = 0;
    }
    *(_BYTE *)(v3 + 304) = v4;
  }

  return result;
}

@end