@interface CUCoalescer
- (CUCoalescer)init;
- (OS_dispatch_queue)dispatchQueue;
- (double)leeway;
- (double)maxDelay;
- (double)minDelay;
- (id)actionHandler;
- (id)invalidationHandler;
- (void)_cancel;
- (void)_invalidate;
- (void)_timerFired;
- (void)_trigger;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)setActionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLeeway:(double)a3;
- (void)setMaxDelay:(double)a3;
- (void)setMinDelay:(double)a3;
- (void)trigger;
@end

@implementation CUCoalescer

- (CUCoalescer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUCoalescer;
  v2 = -[CUCoalescer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    *(_OWORD *)&v3->_maxDelay = xmmword_186B49C20;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_timer) {
    FatalErrorF("Timer still active during dealloc");
  }
  id actionHandler = self->_actionHandler;
  self->_id actionHandler = 0LL;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUCoalescer;
  -[CUCoalescer dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  p_triggered = &self->_triggered;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v3 & 0xFFFFFFFE, (unsigned int *)p_triggered));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__CUCoalescer_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    self->_startTime = 0.0;
    timer = self->_timer;
    if (timer)
    {
      v4 = timer;
      dispatch_source_cancel(v4);
      objc_super v5 = self->_timer;
      self->_timer = 0LL;
    }

    v6 = _Block_copy(self->_invalidationHandler);
    v7 = v6;
    if (v6) {
      (*((void (**)(void *))v6 + 2))(v6);
    }

    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;
  }

- (void)trigger
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__CUCoalescer_trigger__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_trigger
{
  if (!self->_invalidateCalled)
  {
    p_triggered = &self->_triggered;
    do
      unsigned int v4 = __ldaxr((unsigned int *)p_triggered);
    while (__stlxr(v4 | 1, (unsigned int *)p_triggered));
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v6 = Current + self->_minDelay;
    double startTime = self->_startTime;
    if (startTime == 0.0)
    {
      self->_double startTime = Current;
      double startTime = Current;
    }

    double maxDelay = self->_maxDelay;
    BOOL v9 = v6 - startTime <= maxDelay || maxDelay < 0.0;
    double v10 = maxDelay + startTime;
    if (!v9) {
      double v6 = v10;
    }
    double v11 = v6 - Current;
    if (v11 <= 0.0)
    {
      -[CUCoalescer _timerFired](self, "_timerFired");
    }

    else
    {
      int64_t v12 = (uint64_t)(v11 * 1000000000.0);
      double leeway = self->_leeway;
      if (leeway >= 0.0) {
        uint64_t v14 = (unint64_t)(leeway * 1000000000.0);
      }
      else {
        uint64_t v14 = v12 / 4;
      }
      dispatch_time_t v15 = dispatch_time(0LL, v12);
      timer = self->_timer;
      if (timer)
      {
        dispatch_source_set_timer((dispatch_source_t)timer, v15, 0xFFFFFFFFFFFFFFFFLL, v14);
      }

      else
      {
        v17 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
        v18 = self->_timer;
        self->_timer = v17;

        v19 = self->_timer;
        if (!v19) {
          FatalErrorF("Create coalesce timer failed");
        }
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __23__CUCoalescer__trigger__block_invoke;
        handler[3] = &unk_189F34238;
        handler[4] = self;
        dispatch_source_set_event_handler((dispatch_source_t)v19, handler);
        dispatch_source_set_timer((dispatch_source_t)self->_timer, v15, 0xFFFFFFFFFFFFFFFFLL, v14);
        dispatch_resume((dispatch_object_t)self->_timer);
      }
    }
  }

- (void)cancel
{
  p_triggered = &self->_triggered;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v3 & 0xFFFFFFFE, (unsigned int *)p_triggered));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __21__CUCoalescer_cancel__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_cancel
{
  self->_double startTime = 0.0;
  timer = self->_timer;
  if (timer)
  {
    unsigned int v4 = timer;
    dispatch_source_cancel(v4);
    objc_super v5 = self->_timer;
    self->_timer = 0LL;
  }

  p_triggered = &self->_triggered;
  do
    unsigned int v7 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v7 & 0xFFFFFFFE, (unsigned int *)p_triggered));
}

- (void)_timerFired
{
  timer = self->_timer;
  if (timer)
  {
    unsigned int v4 = timer;
    dispatch_source_cancel(v4);
    objc_super v5 = self->_timer;
    self->_timer = 0LL;
  }

  self->_double startTime = 0.0;
  p_triggered = &self->_triggered;
  do
    unsigned int v7 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v7 & 0xFFFFFFFE, (unsigned int *)p_triggered));
  if ((v7 & 1) != 0)
  {
    v8 = (void (**)(void))_Block_copy(self->_actionHandler);
    if (v8)
    {
      BOOL v9 = v8;
      v8[2]();
      v8 = v9;
    }
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setLeeway:(double)a3
{
  self->_double leeway = a3;
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_double maxDelay = a3;
}

- (double)minDelay
{
  return self->_minDelay;
}

- (void)setMinDelay:(double)a3
{
  self->_minDelay = a3;
}

- (void).cxx_destruct
{
}

uint64_t __21__CUCoalescer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

uint64_t __23__CUCoalescer__trigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timerFired];
}

uint64_t __22__CUCoalescer_trigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trigger];
}

uint64_t __25__CUCoalescer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

@end