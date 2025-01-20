@interface B2PTimer
- (B2PTimer)initWithDeadlineMS:(unsigned int)a3 type:(int)a4 queue:(id)a5 block:(id)a6;
- (NSTimer)timer;
- (id)description;
- (int)type;
- (void)cancel;
- (void)start;
@end

@implementation B2PTimer

- (B2PTimer)initWithDeadlineMS:(unsigned int)a3 type:(int)a4 queue:(id)a5 block:(id)a6
{
  v10 = (dispatch_queue_s *)a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___B2PTimer;
  v12 = -[B2PTimer init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = a4;
    uint64_t v14 = MEMORY[0x1895E9D58](v11);
    id block = v13->_block;
    v13->_id block = (id)v14;

    v13->_ms = a3;
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v10);
    timerSource = v13->_timerSource;
    v13->_timerSource = (OS_dispatch_source *)v16;
  }

  return v13;
}

- (void)start
{
  timerSource = self->_timerSource;
  dispatch_time_t v4 = dispatch_time(0LL, 1000000LL * self->_ms);
  dispatch_source_set_timer((dispatch_source_t)timerSource, v4, 1000000LL * self->_ms, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  v5 = self->_timerSource;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __17__B2PTimer_start__block_invoke;
  v6[3] = &unk_18A3C1360;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v5, v6);
  dispatch_resume((dispatch_object_t)self->_timerSource);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __17__B2PTimer_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*((void *)WeakRetained + 2) + 16LL))();
    v2 = v3;
  }
}

- (void)cancel
{
}

- (id)description
{
  id v3 = (void *)NSString;
  dispatch_time_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %s (%u ms)>", v5, stringForB2PTimerType(self->_type), self->_ms];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)type
{
  return self->_type;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end