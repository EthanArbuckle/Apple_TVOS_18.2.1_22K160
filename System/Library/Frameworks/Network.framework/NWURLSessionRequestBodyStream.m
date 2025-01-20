@interface NWURLSessionRequestBodyStream
- (int64_t)countOfBytesSent;
- (void)close;
- (void)pollStream;
- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation NWURLSessionRequestBodyStream

- (int64_t)countOfBytesSent
{
  if (self) {
    return *(void *)(self + 24);
  }
  return self;
}

- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v9 = (__CFRunLoop *)[MEMORY[0x189601EC0] resourceLoaderRunLoop];
  v10 = (const void *)*MEMORY[0x1896051B0];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
  v12[3] = &unk_189BB7FC8;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  CFRunLoopPerformBlock(v9, v10, v12);
  CFRunLoopWakeUp(v9);
}

- (void)close
{
  v3 = (__CFRunLoop *)[MEMORY[0x189601EC0] resourceLoaderRunLoop];
  v4 = (const void *)*MEMORY[0x1896051B0];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__NWURLSessionRequestBodyStream_close__block_invoke;
  block[3] = &unk_189BC93A0;
  block[4] = self;
  CFRunLoopPerformBlock(v3, v4, block);
  CFRunLoopWakeUp(v3);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke;
  block[3] = &unk_189BC75E8;
  id v12 = v6;
  unint64_t v13 = a4;
  block[4] = self;
  v7 = (void *)MEMORY[0x189601EC0];
  id v8 = v6;
  v9 = (__CFRunLoop *)[v7 resourceLoaderRunLoop];
  if (CFRunLoopGetCurrent() == v9)
  {
    __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke((uint64_t)block);
    v10 = v8;
  }

  else
  {
    CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x1896051B0], block);
    CFRunLoopWakeUp(v9);
    v10 = v12;
  }
}

- (void).cxx_destruct
{
}

void __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ((unint64_t)(v2 - 1) < 2)
  {
    -[NWURLSessionRequestBodyStream pollStream](*(void *)(a1 + 32));
  }

  else if (v2 == 8)
  {
    v5 = objc_alloc(&OBJC_CLASS___NWURLError);
    if (v5)
    {
      uint64_t v6 = *MEMORY[0x189607740];
      v11.receiver = v5;
      v11.super_class = (Class)&OBJC_CLASS___NWURLError;
      id v10 = objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v6, -1021, 0);
    }

    else
    {
      id v10 = 0LL;
    }

    [*(id *)(a1 + 40) streamError];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setUnderlyingError:v7];
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v9 = *(void *)(v8 + 40);
    }
    else {
      uint64_t v9 = 0LL;
    }
    -[NWURLSessionReadRequest putError:](v9, v10);
  }

  else if (v2 == 16)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 40);
      if (v4)
      {
        *(_BYTE *)(v4 + 8) = 1;
        -[NWURLSessionReadRequest tryFulfillRequest](v4);
      }
    }
  }

- (void)pollStream
{
  if (a1)
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    if (Current != (CFRunLoopRef)[MEMORY[0x189601EC0] resourceLoaderRunLoop]) {
      __assert_rtn( "-[NWURLSessionRequestBodyStream pollStream]",  "NWURLSessionRequest.m",  353,  "CFRunLoopGetCurrent() == NSURLConnection.resourceLoaderRunLoop");
    }
    if ([*(id *)(a1 + 16) hasBytesAvailable])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (v3)
      {
        if (*(void *)(v3 + 32))
        {
          uint64_t v4 = *(void *)(v3 + 24);
          if (v4)
          {
            alloc = (dispatch_data_s *)dispatch_data_create_alloc();
            subrange = 0LL;
            while (1)
            {
              uint64_t v7 = [*(id *)(a1 + 16) read:&subrange[v15] maxLength:v4];
              uint64_t v8 = v7;
              if (v7 <= 0) {
                break;
              }
              subrange += v7;
              v4 -= v7;
              if (!v4 || ([*(id *)(a1 + 16) hasBytesAvailable] & 1) == 0) {
                goto LABEL_11;
              }
            }

            if (!v7)
            {
LABEL_11:
              uint64_t v9 = [*(id *)(a1 + 16) streamStatus];
              char v11 = v8 < 1 || v9 == 5;
              if (subrange) {
                subrange = (char *)dispatch_data_create_subrange(alloc, 0LL, (size_t)subrange);
              }
              -[NWURLSessionReadRequest putData:complete:](*(void *)(a1 + 40), subrange, v11);
              goto LABEL_20;
            }

            id v12 = objc_alloc(&OBJC_CLASS___NWURLError);
            if (v12)
            {
              uint64_t v13 = *MEMORY[0x189607740];
              v16.receiver = v12;
              v16.super_class = (Class)&OBJC_CLASS___NWURLError;
              subrange = (char *)objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v13, -1021, 0);
            }

            else
            {
              subrange = 0LL;
            }

            [*(id *)(a1 + 16) streamError];
            unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [subrange setUnderlyingError:v14];
            -[NWURLSessionReadRequest putError:](*(void *)(a1 + 40), subrange);

LABEL_20:
          }
        }
      }
    }
  }

uint64_t __38__NWURLSessionRequestBodyStream_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 16);
  }
  else {
    uint64_t v3 = 0LL;
  }
  [v3 close];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 16);
  }
  else {
    v5 = 0LL;
  }
  return [v5 setDelegate:0];
}

void __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 8))
    {
LABEL_3:
      uint64_t v3 = *(_OWORD **)(v2 + 40);
      goto LABEL_4;
    }

    *(_BYTE *)(v2 + 8) = 1;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 16);
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  objc_msgSend(v6, "setDelegate:");
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    uint64_t v7 = (void *)v7[2];
  }
  uint64_t v8 = (void *)MEMORY[0x189604008];
  uint64_t v9 = v7;
  [v8 currentRunLoop];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 scheduleInRunLoop:v10 forMode:*MEMORY[0x189603A40]];

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(void **)(v11 + 16);
  }
  else {
    id v12 = 0LL;
  }
  [v12 open];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    goto LABEL_3;
  }
  uint64_t v3 = 0LL;
LABEL_4:
  __int128 v13 = *(_OWORD *)(a1 + 48);
  newValue[0] = MEMORY[0x1895F87A8];
  newValue[1] = 3221225472LL;
  newValue[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2;
  newValue[3] = &unk_189BB7FA0;
  newValue[4] = v2;
  id v15 = *(id *)(a1 + 40);
  if (v3)
  {
    v3[1] = v13;
    objc_setProperty_nonatomic_copy(v3, v4, newValue, 32LL);
    -[NWURLSessionReadRequest tryFulfillRequest]((uint64_t)v3);
  }

  -[NWURLSessionRequestBodyStream pollStream](*(void *)(a1 + 32));
}

void __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2( uint64_t a1,  void *a2,  char a3,  void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    id v10 = *(dispatch_queue_s **)(v9 + 32);
  }
  else {
    id v10 = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_3;
  block[3] = &unk_189BC0A70;
  id v15 = v7;
  uint64_t v16 = v9;
  id v11 = *(id *)(a1 + 40);
  char v19 = a3;
  id v17 = v8;
  id v18 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

uint64_t __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_3( uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      *(void *)(v2 + 24) += dispatch_data_get_size(*(dispatch_data_t *)(a1 + 32));
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

@end