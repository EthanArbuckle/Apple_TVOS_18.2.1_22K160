@interface CURetrier
- (CURetrier)init;
- (OS_dispatch_queue)dispatchQueue;
- (double)interval;
- (double)leeway;
- (double)startTime;
- (id)actionHandler;
- (id)invalidationHandler;
- (void)failed;
- (void)failedDirect;
- (void)invalidate;
- (void)invalidateDirect;
- (void)setActionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterval:(double)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLeeway:(double)a3;
- (void)setStartTime:(double)a3;
- (void)start;
- (void)startDirect;
- (void)succeeded;
- (void)succeededDirect;
@end

@implementation CURetrier

- (CURetrier)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CURetrier;
  v2 = -[CURetrier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    *(_OWORD *)&v3->_interval = xmmword_186B49C50;
    v4 = v3;
  }

  return v3;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __23__CURetrier_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidateDirect
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v8 = retryTimer;
      dispatch_source_cancel(v8);
      v7 = self->_retryTimer;
      self->_retryTimer = 0LL;
    }
  }

- (void)start
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __18__CURetrier_start__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)startDirect
{
  if (!self->_invalidateCalled)
  {
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v4 = retryTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_retryTimer;
      self->_retryTimer = 0LL;
    }

    self->_startTime = CFAbsoluteTimeGetCurrent();
    objc_super v6 = (void (**)(void))_Block_copy(self->_actionHandler);
    if (v6)
    {
      v7 = v6;
      v6[2]();
      objc_super v6 = v7;
    }
  }

- (void)failed
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __19__CURetrier_failed__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)failedDirect
{
  if (!self->_invalidateCalled)
  {
    double leeway = self->_leeway;
    if (leeway < 0.0) {
      double leeway = self->_interval / 10.0;
    }
    double v4 = self->_startTime + self->_interval + (double)arc4random() / 4294967300.0 * leeway + 0.0;
    double v5 = v4 - CFAbsoluteTimeGetCurrent();
    if (v5 <= 0.0)
    {
      -[CURetrier startDirect](self, "startDirect");
    }

    else
    {
      retryTimer = self->_retryTimer;
      if (retryTimer)
      {
        v7 = retryTimer;
        dispatch_source_cancel(v7);
        v8 = self->_retryTimer;
        self->_retryTimer = 0LL;
      }

      v9 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      v10 = self->_retryTimer;
      self->_retryTimer = v9;

      v11 = self->_retryTimer;
      if (!v11) {
        FatalErrorF("Create retry timer failed");
      }
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __25__CURetrier_failedDirect__block_invoke;
      handler[3] = &unk_189F34238;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
      v12 = self->_retryTimer;
      dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(v5 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
      dispatch_resume((dispatch_object_t)self->_retryTimer);
    }
  }

- (void)succeeded
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__CURetrier_succeeded__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)succeededDirect
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    double v5 = retryTimer;
    dispatch_source_cancel(v5);
    double v4 = self->_retryTimer;
    self->_retryTimer = 0LL;
  }

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setLeeway:(double)a3
{
  self->_double leeway = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
}

uint64_t __22__CURetrier_succeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) succeededDirect];
}

uint64_t __25__CURetrier_failedDirect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startDirect];
}

uint64_t __19__CURetrier_failed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) failedDirect];
}

uint64_t __18__CURetrier_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startDirect];
}

uint64_t __23__CURetrier_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateDirect];
}

@end