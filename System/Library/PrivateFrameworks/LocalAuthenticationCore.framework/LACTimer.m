@interface LACTimer
- (BOOL)isRunning;
- (LACTimer)init;
- (void)_dispatchAfter:(double)a3 inQueue:(id)a4 repeat:(BOOL)a5 block:(id)a6;
- (void)cancel;
- (void)dispatchAfter:(double)a3 inQueue:(id)a4 block:(id)a5;
@end

@implementation LACTimer

- (LACTimer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LACTimer;
  result = -[LACTimer init](&v3, sel_init);
  if (result) {
    result->_timerLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)isRunning
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  timer = self->_timer;
  if (timer) {
    BOOL v5 = dispatch_source_testcancel((dispatch_source_t)timer) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
  return v5;
}

- (void)cancel
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel((dispatch_source_t)timer);
    BOOL v5 = self->_timer;
    self->_timer = 0LL;
  }

  os_unfair_lock_unlock(p_timerLock);
}

- (void)dispatchAfter:(double)a3 inQueue:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __40__LACTimer_dispatchAfter_inQueue_block___block_invoke;
  v11[3] = &unk_18A36A548;
  objc_copyWeak(&v13, &location);
  id v10 = v9;
  id v12 = v10;
  -[LACTimer dispatchAfter:inQueue:repeat:block:](self, "dispatchAfter:inQueue:repeat:block:", v8, 0LL, v11, a3);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __40__LACTimer_dispatchAfter_inQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancel];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_dispatchAfter:(double)a3 inQueue:(id)a4 repeat:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  id v10 = (dispatch_queue_s *)a4;
  id v11 = a6;
  if (a3 == 0.0)
  {
    if (v7)
    {
      LACLogDefault();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[LACTimer _dispatchAfter:inQueue:repeat:block:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    dispatch_async(v10, v11);
  }

  else
  {
    p_timerLock = &self->_timerLock;
    os_unfair_lock_lock(&self->_timerLock);
    if (self->_timer)
    {
      LACLogDefault();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[LACTimer _dispatchAfter:inQueue:repeat:block:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }

    else
    {
      v29 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 1uLL, v10);
      timer = self->_timer;
      self->_timer = v29;

      double v31 = a3 * 1000000000.0;
      dispatch_time_t v32 = dispatch_time(0LL, (uint64_t)v31);
      dispatch_source_set_timer((dispatch_source_t)self->_timer, v32, (unint64_t)v31, 0LL);
      dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v11);
      dispatch_activate((dispatch_object_t)self->_timer);
    }

    os_unfair_lock_unlock(p_timerLock);
  }
}

- (void).cxx_destruct
{
}

- (void)_dispatchAfter:(uint64_t)a3 inQueue:(uint64_t)a4 repeat:(uint64_t)a5 block:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_dispatchAfter:(uint64_t)a3 inQueue:(uint64_t)a4 repeat:(uint64_t)a5 block:(uint64_t)a6 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end