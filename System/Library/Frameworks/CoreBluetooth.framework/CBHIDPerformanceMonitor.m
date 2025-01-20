@interface CBHIDPerformanceMonitor
- (CBHIDPerformanceMonitor)init;
- (NSArray)devices;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)workQueue;
- (double)intervalMs;
- (double)testSeconds;
- (id)excessiveIntervalHandler;
- (id)invalidationHandler;
- (id)summaryHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDevices:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExcessiveIntervalHandler:(id)a3;
- (void)setIntervalMs:(double)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSummaryHandler:(id)a3;
- (void)setTestSeconds:(double)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CBHIDPerformanceMonitor

- (CBHIDPerformanceMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CBHIDPerformanceMonitor;
  v2 = -[CBHIDPerformanceMonitor init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    uint64_t v4 = dispatch_get_global_queue(0LL, 0LL);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __50__CBHIDPerformanceMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_189FB2B50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __50__CBHIDPerformanceMonitor_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v12 = (void (**)(id, void *))a3;
  CBErrorF(-6735, (uint64_t)"Not supported on this platform", v3, v4, v5, v6, v7, v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }

  v12[2](v12, v9);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__CBHIDPerformanceMonitor_invalidate__block_invoke;
  block[3] = &unk_189FB1AE0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__CBHIDPerformanceMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      uint64_t v3 = self;
    }

    else
    {
      uint64_t v3 = self;
    }

    -[CBHIDPerformanceMonitor _invalidated](v3, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    uint64_t v8 = MEMORY[0x18959F890](self->_invalidationHandler, a2);
    id excessiveIntervalHandler = self->_excessiveIntervalHandler;
    self->_id excessiveIntervalHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id summaryHandler = self->_summaryHandler;
    self->_id summaryHandler = 0LL;

    uint64_t v6 = (void *)v8;
    if (v8)
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
      uint64_t v6 = (void *)v8;
    }

    self->_invalidateDone = 1;
    if (gLogCategory_CBHIDPerf <= 30)
    {
      if (gLogCategory_CBHIDPerf != -1 || (v7 = _LogCategory_Initialize(), uint64_t v6 = (void *)v8, v7))
      {
        LogPrintF_safe();
        uint64_t v6 = (void *)v8;
      }
    }
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

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (id)excessiveIntervalHandler
{
  return self->_excessiveIntervalHandler;
}

- (void)setExcessiveIntervalHandler:(id)a3
{
}

- (double)intervalMs
{
  return self->_intervalMs;
}

- (void)setIntervalMs:(double)a3
{
  self->_intervalMs = a3;
}

- (id)summaryHandler
{
  return self->_summaryHandler;
}

- (void)setSummaryHandler:(id)a3
{
}

- (double)testSeconds
{
  return self->_testSeconds;
}

- (void)setTestSeconds:(double)a3
{
  self->_testSeconds = a3;
}

- (void).cxx_destruct
{
}

@end