@interface GTTransport
@end

@implementation GTTransport

void __34__GTTransport_relayMessage_error___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48)) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24LL));
  }
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 52LL))
  {
    v2 = objc_autoreleasePoolPush();
    [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) error:0];
    objc_autoreleasePoolPop(v2);
  }

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReplyTimeout:*(unsigned int *)(a1 + 40) count:0];
}

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setObject:*(void *)(a1 + 40) forIntKey:*(unsigned int *)(a1 + 48)];
}

void __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 60)) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24LL));
  }
  if (*(_BYTE *)(*(void *)(a1 + 32) + 52LL))
  {
    v11 = objc_autoreleasePoolPush();
    objc_msgSend( *(id *)(a1 + 40),  "dispatchError:",  +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  32,  0));
    objc_autoreleasePoolPop(v11);
    v12 = (unsigned int *)(*(void *)(a1 + 32) + 48LL);
    do
      unsigned int v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    [*(id *)(a1 + 48) setEncodedAttributes:0];
  }

  else
  {
    id v16 = 0LL;
    v2 = objc_autoreleasePoolPush();
    if (*(void *)(a1 + 40)) {
      v3 = &v16;
    }
    else {
      v3 = 0LL;
    }
    id v4 = [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 48) error:v3];
    id v5 = v16;
    objc_autoreleasePoolPop(v2);
    v6 = (unsigned int *)(*(void *)(a1 + 32) + 48LL);
    do
      unsigned int v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (v4 == (id)-1LL)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        v10 = *(dispatch_queue_s **)(v9 + 24);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4;
        block[3] = &unk_20AF0;
        int v15 = *(_DWORD *)(a1 + 56);
        block[4] = v9;
        block[5] = v8;
        block[6] = v16;
        dispatch_async(v10, block);
      }
    }
  }

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) dispatchError:*(void *)(a1 + 48)];
}

uint64_t __30__GTTransport_setSynchronous___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40)) {
    v1 = &_dispatch_sync;
  }
  else {
    v1 = &_dispatch_async;
  }
  *(void *)(*(void *)(result + 32) + 96LL) = v1;
  return result;
}

id *__37__GTTransport__scheduleInvalidation___block_invoke(id *result)
{
  if (!*((void *)result[4] + 10))
  {
    v1 = result;
    *((void *)result[4] + 10) = result[5];
    return (id *)[v1[4] _invalidate];
  }

  return result;
}

void __32__GTTransport__dispatchMessage___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(_BYTE *)(v1 + 24))
  {
    char v3 = (*(uint64_t (**)(void))(*(void *)(v1 + 16) + 16LL))();
    uint64_t v4 = a1[4];
    if ((v3 & 1) != 0)
    {
      int64_t v5 = *(void *)(v4 + 32);
      if (v5)
      {
        dispatch_time_t v6 = dispatch_time(0LL, v5);
        uint64_t v7 = a1[6];
        uint64_t v8 = *(dispatch_queue_s **)(v7 + 24);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = __32__GTTransport__dispatchMessage___block_invoke_3;
        v11[3] = &unk_20A50;
        v11[4] = v7;
        v11[5] = a1[7];
        dispatch_after(v6, v8, v11);
      }
    }

    else
    {
      *(_BYTE *)(v4 + 24) = 1;
      uint64_t v9 = a1[6];
      v10 = *(dispatch_queue_s **)(v9 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __32__GTTransport__dispatchMessage___block_invoke_2;
      block[3] = &unk_20A28;
      block[4] = v9;
      int v13 = *((_DWORD *)a1 + 14);
      dispatch_async(v10, block);
    }
  }

id __32__GTTransport__dispatchMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForIntKey:*(unsigned int *)(a1 + 40)];
}

id __32__GTTransport__dispatchMessage___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReplyTimeout:*(unsigned int *)(a1 + 40) count:*(unsigned int *)(a1 + 44)];
}

id __26__GTTransport__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 dispatchError:*(void *)(*(void *)(a1 + 32) + 80)];
}

id __29__GTTransport__cancelSource___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

void *__31__GTTransport__activateSource___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(_BYTE *)(v1 + 52))
  {
    v2 = result;
    result = [*(id *)(v1 + 64) addObject:result[5]];
    *(_BYTE *)(*(void *)(v2[6] + 8LL) + 24LL) = 1;
  }

  return result;
}

void *__34__GTTransport_newSourceWithQueue___block_invoke(void *result)
{
  if (!*(_BYTE *)(result[4] + 52LL))
  {
    uint64_t v1 = result;
    result = -[GTTransportSource_tools_diagnostics _initWithQueue:transport:]( objc_alloc(&OBJC_CLASS___GTTransportSource_tools_diagnostics),  "_initWithQueue:transport:",  v1[5],  v1[4]);
    *(void *)(*(void *)(v1[6] + 8LL) + 40LL) = result;
  }

  return result;
}

id __18__GTTransport_url__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8LL);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

@end