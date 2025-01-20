@interface LACBackgroundTask
- (LACBackgroundTask)initWithIdentifier:(id)a3 worker:(id)a4;
- (LACBackgroundTask)initWithWorker:(id)a3;
- (LACBackgroundTaskDelegate)delegate;
- (id)description;
- (id)runSynchronouslyWithTimeout:(double)a3;
- (void)_queuedCompleteTaskWithResult:(id)a3;
- (void)_queuedRunInReplyQueue:(id)a3;
- (void)_queuedRunWithTimeout:(double)a3 replyQueue:(id)a4 completion:(id)a5;
- (void)_queuedStartWorkerIfNeeded;
- (void)_queuedStartWorkerWatchdogWithTimeout:(double)a3;
- (void)_queuedStopWorkerWatchdog;
- (void)dealloc;
- (void)runWithTimeout:(double)a3 completion:(id)a4;
- (void)runWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation LACBackgroundTask

- (LACBackgroundTask)initWithWorker:(id)a3
{
  return -[LACBackgroundTask initWithIdentifier:worker:](self, "initWithIdentifier:worker:", @"AnonymousTask", a3);
}

- (LACBackgroundTask)initWithIdentifier:(id)a3 worker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___LACBackgroundTask;
  v9 = -[LACBackgroundTask init](&v17, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    id worker = v9->_worker;
    v9->_id worker = v10;

    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:]( &OBJC_CLASS___LACConcurrencyUtilities,  "createUserInitiatedSerialQueueWithIdentifier:",  v13);
    innerQueue = v9->_innerQueue;
    v9->_innerQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_replyQueue, v9->_innerQueue);
    v9->_isWorkerRunning = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_189219000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ deallocated", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (id)runSynchronouslyWithTimeout:(double)a3
{
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_3);
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0LL;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __49__LACBackgroundTask_runSynchronouslyWithTimeout___block_invoke_5;
  v14[3] = &unk_18A368DA8;
  v16 = &v17;
  id v6 = v5;
  id v15 = v6;
  -[LACBackgroundTask runWithTimeout:completion:](self, "runWithTimeout:completion:", v14, a3);
  dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)((a3 + 0.05) * 1000000000.0));
  if (dispatch_block_wait(v6, v7))
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"Sync request timed out after %.3f secs",  *(void *)&a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[LACBackgroundTaskErrorBuilder errorWithCode:debugDescription:]( &OBJC_CLASS___LACBackgroundTaskErrorBuilder,  "errorWithCode:debugDescription:",  2LL,  v8);
    v10 = -[LACBackgroundTaskResult initWithError:]( objc_alloc(&OBJC_CLASS___LACBackgroundTaskResult),  "initWithError:",  v9);
    v11 = (void *)v18[5];
    v18[5] = (uint64_t)v10;
  }

  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __49__LACBackgroundTask_runSynchronouslyWithTimeout___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)runWithTimeout:(double)a3 completion:(id)a4
{
}

- (void)runWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  innerQueue = (dispatch_queue_s *)self->_innerQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__LACBackgroundTask_runWithTimeout_queue_completion___block_invoke;
  block[3] = &unk_18A368DD0;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a3;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __53__LACBackgroundTask_runWithTimeout_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _queuedRunWithTimeout:*(void *)(a1 + 32) replyQueue:*(void *)(a1 + 40) completion:*(double *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

- (void)_queuedRunWithTimeout:(double)a3 replyQueue:(id)a4 completion:(id)a5
{
  id v8 = (dispatch_queue_s *)a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  if (self->_currentHandler || self->_isWorkerRunning)
  {
    replyQueue = v8;
    if (!v8) {
      replyQueue = (dispatch_queue_s *)self->_replyQueue;
    }
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke;
    v14[3] = &unk_18A368DF8;
    void v14[4] = self;
    id v15 = v9;
    dispatch_async(replyQueue, v14);
  }

  else
  {
    id v11 = (OS_dispatch_queue *)v8;
    if (!v8) {
      id v11 = self->_replyQueue;
    }
    objc_storeStrong((id *)&self->_replyQueue, v11);
    id v12 = _Block_copy(v9);
    id currentHandler = self->_currentHandler;
    self->_id currentHandler = v12;

    -[LACBackgroundTask _queuedStartWorkerWatchdogWithTimeout:](self, "_queuedStartWorkerWatchdogWithTimeout:", a3);
    -[LACBackgroundTask _queuedStartWorkerIfNeeded](self, "_queuedStartWorkerIfNeeded");
  }
}

void __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke(uint64_t a1)
{
  int v2 = objc_alloc(&OBJC_CLASS___LACBackgroundTaskResult);
  +[LACBackgroundTaskErrorBuilder errorWithCode:](&OBJC_CLASS___LACBackgroundTaskErrorBuilder, "errorWithCode:", 1LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[LACBackgroundTaskResult initWithError:](v2, "initWithError:", v3);

  LACLogTask();
  dispatch_block_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_queuedStartWorkerWatchdogWithTimeout:(double)a3
{
  watchdog = self->_watchdog;
  innerQueue = self->_innerQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __59__LACBackgroundTask__queuedStartWorkerWatchdogWithTimeout___block_invoke;
  v7[3] = &unk_18A368E20;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  -[LACTimer dispatchAfter:inQueue:block:](watchdog, "dispatchAfter:inQueue:block:", innerQueue, v7, a3);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __59__LACBackgroundTask__queuedStartWorkerWatchdogWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[1]);
    [NSString stringWithFormat:@"Request '%@' timed out after %.3f secs", v6[7], *(void *)(a1 + 40)];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACBackgroundTaskErrorBuilder errorWithCode:debugDescription:]( &OBJC_CLASS___LACBackgroundTaskErrorBuilder,  "errorWithCode:debugDescription:",  2LL,  v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_t v5 = -[LACBackgroundTaskResult initWithError:]( objc_alloc(&OBJC_CLASS___LACBackgroundTaskResult),  "initWithError:",  v4);
    -[dispatch_queue_t _queuedCompleteTaskWithResult:](v6, "_queuedCompleteTaskWithResult:", v5);

    id WeakRetained = v6;
  }
}

- (void)_queuedStopWorkerWatchdog
{
  watchdog = self->_watchdog;
  if (watchdog) {
    -[LACTimer cancel](watchdog, "cancel");
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___LACTimer);
  dispatch_block_t v5 = self->_watchdog;
  self->_watchdog = v4;
}

- (void)_queuedStartWorkerIfNeeded
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_189219000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ ignoring run request because is already running",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 3);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_2;
    v5[3] = &unk_18A368E70;
    objc_copyWeak(&v6, v1);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
    objc_destroyWeak(&v6);
  }
}

void __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_block_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_3;
    v7[3] = &unk_18A368E48;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 0;
  return [*(id *)(a1 + 32) _queuedCompleteTaskWithResult:*(void *)(a1 + 40)];
}

- (void)_queuedCompleteTaskWithResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  LACLogTask();
  dispatch_block_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  [v4 error];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v7 = 16 * (v6 != 0LL);

  if (os_log_type_enabled(v5, v7))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_189219000, v5, v7, "%{public}@ finished run with result %{public}@", buf, 0x16u);
  }

  -[LACBackgroundTask _queuedStopWorkerWatchdog](self, "_queuedStopWorkerWatchdog");
  id currentHandler = self->_currentHandler;
  if (currentHandler)
  {
    id v9 = (void *)[currentHandler copy];
    id v10 = self->_currentHandler;
    self->_id currentHandler = 0LL;

    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke;
    v17[3] = &unk_18A368E98;
    id v19 = v9;
    id v18 = v4;
    id v11 = v9;
    -[LACBackgroundTask _queuedRunInReplyQueue:](self, "_queuedRunInReplyQueue:", v17);
  }

  else
  {
    -[LACBackgroundTask delegate](self, "delegate");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12 == 0LL;

    if (!v13)
    {
      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke_2;
      v14[3] = &unk_18A368EC0;
      objc_copyWeak(&v16, (id *)buf);
      id v15 = v4;
      -[LACBackgroundTask _queuedRunInReplyQueue:](self, "_queuedRunInReplyQueue:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

uint64_t __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained delegate];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 backgroundTask:v4 didCompleteTaskWithResult:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)_queuedRunInReplyQueue:(id)a3
{
  innerQueue = (dispatch_queue_s *)self->_innerQueue;
  block = (void (**)(void))a3;
  dispatch_assert_queue_V2(innerQueue);
  replyQueue = self->_replyQueue;
  if (replyQueue) {
    BOOL v6 = replyQueue == self->_innerQueue;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)replyQueue, block);
  }
}

- (id)description
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  [NSString stringWithFormat:@"identifier: %@", self->_identifier];
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 componentsJoinedByString:@"; "];
  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (LACBackgroundTaskDelegate)delegate
{
  return (LACBackgroundTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_189219000,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ failed with result %{public}@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_2();
}

@end