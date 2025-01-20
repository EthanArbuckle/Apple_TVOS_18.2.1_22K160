@interface CURunLoopThread
- (BOOL)_scheduleStopThread;
- (CURunLoopThread)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)threadFinalizeHandler;
- (id)threadInitializeHandler;
- (void)_invalidated;
- (void)_threadMain;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)performBlock:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setThreadFinalizeHandler:(id)a3;
- (void)setThreadInitializeHandler:(id)a3;
@end

@implementation CURunLoopThread

- (CURunLoopThread)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CURunLoopThread;
  v2 = -[CURunLoopThread init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CURunLoopThread;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CURunLoopThread;
  -[CURunLoopThread dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__CURunLoopThread_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CURunLoopThread_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CURunLoopThread _invalidated]",  0x32u,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v13);
        goto LABEL_6;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }

- (void)performBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __32__CURunLoopThread_performBlock___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)_scheduleStopThread
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL runLoopValid = v2->_runLoopValid;
  v2->_BOOL runLoopValid = 0;
  BOOL v8 = !runLoopValid || v2->_runLoop == 0LL;
  BOOL v9 = !v8;
  if (!v8)
  {
    ucat = v2->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = v2->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CURunLoopThread _scheduleStopThread]",  0x1Eu,  (uint64_t)"Scheduling stop of RunLoop thread\n",  v3,  v4,  v5,  v6,  v14);
    }

- (void)_threadMain
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_5;
  }
  if (ucat->var0 == -1)
  {
    ucat = self->_ucat;
  }

  LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CURunLoopThread _threadMain]",  0x1Eu,  (uint64_t)"RunLoop thread starting\n",  v2,  v3,  v4,  v5,  v38);
LABEL_5:
  BOOL v8 = self;
  objc_sync_enter(v8);
  v8->_runLoop = CFRunLoopGetCurrent();
  v8->_BOOL runLoopValid = 1;
  objc_sync_exit(v8);

  memset(&context, 0, sizeof(context));
  BOOL v9 = CFRunLoopSourceCreate(0LL, 0LL, &context);
  if (v9) {
    CFRunLoopAddSource(v8->_runLoop, v9, (CFRunLoopMode)*MEMORY[0x1896051A8]);
  }
  v39 = (void *)MEMORY[0x186E432B4]();
  id threadInitializeHandler = (void (**)(void))v8->_threadInitializeHandler;
  if (threadInitializeHandler) {
    threadInitializeHandler[2]();
  }
  v11 = v8;
  objc_sync_enter(v11);
  v12 = (void *)-[NSMutableArray copy](v11->_startBlocks, "copy");
  -[NSMutableArray removeAllObjects](v11->_startBlocks, "removeAllObjects");
  startBlocks = v11->_startBlocks;
  v11->_startBlocks = 0LL;

  objc_sync_exit(v11);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v43;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x186E432B4]();
        (*(void (**)(uint64_t))(v18 + 16))(v18);
        objc_autoreleasePoolPop(v19);
      }

      uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v15);
  }

  objc_autoreleasePoolPop(v39);
  dispatchQueue = (dispatch_queue_s *)v11->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CURunLoopThread__threadMain__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = v11;
  dispatch_async(dispatchQueue, block);
  v21 = (const __CFString *)*MEMORY[0x1896051B0];
  while (1)
  {
    v22 = (void *)MEMORY[0x186E432B4]();
    CFRunLoopRunResult v23 = CFRunLoopRunInMode(v21, 1.79769313e308, 0);
    char v28 = v23;
    if (v23 == kCFRunLoopRunStopped) {
      break;
    }
    v29 = self->_ucat;
    if (v29->var0 > 10) {
      goto LABEL_22;
    }
    if (v29->var0 != -1) {
      goto LABEL_20;
    }
    if (_LogCategory_Initialize((uint64_t)v29, 0xAu))
    {
      v29 = self->_ucat;
LABEL_20:
      LogPrintF( (uint64_t)v29,  (uint64_t)"-[CURunLoopThread _threadMain]",  0xAu,  (uint64_t)"Waiting for runloop to start (%d)\n",  v24,  v25,  v26,  v27,  v28);
    }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)threadInitializeHandler
{
  return self->_threadInitializeHandler;
}

- (void)setThreadInitializeHandler:(id)a3
{
}

- (id)threadFinalizeHandler
{
  return self->_threadFinalizeHandler;
}

- (void)setThreadFinalizeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __30__CURunLoopThread__threadMain__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v9 + 48);
  if (*(_DWORD *)result != -1) {
    goto LABEL_3;
  }
  uint64_t result = _LogCategory_Initialize(result, 0x1Eu);
  uint64_t v9 = *(void *)(a1 + 32);
  if ((_DWORD)result)
  {
    uint64_t result = *(void *)(v9 + 48);
LABEL_3:
    uint64_t result = LogPrintF( result,  (uint64_t)"-[CURunLoopThread _threadMain]_block_invoke",  0x1Eu,  (uint64_t)"Started RunLoop thread\n",  a5,  a6,  a7,  a8,  v11);
    uint64_t v9 = *(void *)(a1 + 32);
  }

uint64_t __30__CURunLoopThread__threadMain__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      id v10 = *(int **)(v9 + 48);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CURunLoopThread _threadMain]_block_invoke_2",  0x1Eu,  (uint64_t)"Stopped RunLoop thread\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

void __38__CURunLoopThread__scheduleStopThread__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = (int *)v9[6];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CURunLoopThread _scheduleStopThread]_block_invoke",  0x1Eu,  (uint64_t)"Stopping RunLoop thread\n",  a5,  a6,  a7,  a8,  v13);
      uint64_t v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }

    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v11)
    {
      id v10 = (int *)v9[6];
      goto LABEL_3;
    }
  }

void __32__CURunLoopThread_performBlock___block_invoke(uint64_t a1)
{
  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[8]) {
    FatalErrorF("PerformBlock before activate");
  }
  if (v1[9]) {
    FatalErrorF("PerformBlock after invalidate");
  }
  obj = v1;
  objc_sync_enter(obj);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(__CFRunLoop **)(v3 + 16);
  if (v4 && *(_BYTE *)(v3 + 24))
  {
    CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x1896051B0], *(void **)(a1 + 40));
    CFRunLoopWakeUp(*(CFRunLoopRef *)(*(void *)(a1 + 32) + 16LL));
  }

  else
  {
    uint64_t v5 = *(void **)(v3 + 32);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v7 = *(void *)(a1 + 32);
      BOOL v8 = *(void **)(v7 + 32);
      *(void *)(v7 + 32) = v6;

      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32LL);
    }

    uint64_t v9 = _Block_copy(*(const void **)(a1 + 40));
    [v5 addObject:v9];
  }

  objc_sync_exit(obj);
}

uint64_t __29__CURunLoopThread_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  char a9)
{
  uint64_t v9 = *(void *)(result + 32);
  if (*(_BYTE *)(v9 + 9)) {
    return result;
  }
  uint64_t v10 = result;
  BOOL v11 = *(int **)(v9 + 48);
  if (*v11 <= 30)
  {
    if (*v11 != -1)
    {
LABEL_4:
      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CURunLoopThread invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v18);
      uint64_t v9 = *(void *)(v10 + 32);
      goto LABEL_6;
    }

    BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
    uint64_t v9 = *(void *)(v10 + 32);
    if (v12)
    {
      BOOL v11 = *(int **)(v9 + 48);
      goto LABEL_4;
    }
  }

uint64_t __27__CURunLoopThread_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 48);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CURunLoopThread activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

void __27__CURunLoopThread_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E432B4]();
  [*(id *)(a1 + 32) _threadMain];
  objc_autoreleasePoolPop(v2);
}

@end