@interface LACDTOLocationMonitor
- (LACDTOLocationMonitor)initWithLocationProvider:(id)a3 workQueue:(id)a4;
- (LACDTOLocationMonitorDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)startMonitoringWithReason:(id)a3;
- (void)stopMonitoringWithReason:(id)a3;
@end

@implementation LACDTOLocationMonitor

- (LACDTOLocationMonitor)initWithLocationProvider:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTOLocationMonitor;
  v9 = -[LACDTOLocationMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)startMonitoringWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[LACTimer isRunning](self->_timer, "isRunning"))
  {
    LACLogDTOTimers();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[LACDTOLocationMonitor startMonitoringWithReason:].cold.1((uint64_t)self, v5);
    }
  }

  else
  {
    v6 = objc_alloc_init(&OBJC_CLASS___LACTimer);
    timer = self->_timer;
    self->_timer = v6;

    LACLogDTOTimers();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v14 = self;
      __int16 v15 = 2048;
      uint64_t v16 = 0x4024000000000000LL;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_189219000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ starting monitor with an interval of %.2f secs with reason: %{public}@",  buf,  0x20u);
    }

    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v9 = self->_timer;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke;
    v11[3] = &unk_18A368B68;
    objc_copyWeak(&v12, (id *)buf);
    -[LACTimer dispatchAfter:inQueue:repeat:block:]( v9,  "dispatchAfter:inQueue:repeat:block:",  workQueue,  1LL,  v11,  10.0);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LACLogDTOTimers();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = WeakRetained;
      _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ performing scheduled query", buf, 0xCu);
    }

    id v4 = (void *)WeakRetained[1];
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke_1;
    v5[3] = &unk_18A36A598;
    objc_copyWeak(&v6, v1);
    [v4 checkIsInFamiliarLocationWithCompletion:v5];
    objc_destroyWeak(&v6);
  }
}

void __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke_1(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 4);
    [v5 locationMonitor:v4 didReceiveLocationState:v6];
  }
}

- (void)stopMonitoringWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  LACLogDTOTimers();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl( &dword_189219000,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ stopping monitor with reason: %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  -[LACTimer cancel](self->_timer, "cancel");
  timer = self->_timer;
  self->_timer = 0LL;
}

- (LACDTOLocationMonitorDelegate)delegate
{
  return (LACDTOLocationMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)startMonitoringWithReason:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_189219000,  a2,  OS_LOG_TYPE_DEBUG,  "%{public}@ ignoring redundant request to start",  (uint8_t *)&v2,  0xCu);
}

@end