@interface LACDTORatchetStateMonitor
- (LACDTOEventBus)eventBus;
- (LACDTORatchetState)ratchetState;
- (LACDTORatchetStateMonitor)initWithRatchetStateProvider:(id)a3 workQueue:(id)a4;
- (void)_scheduleNextStatusCheck;
- (void)handleEvent:(id)a3 sender:(id)a4;
- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5;
- (void)ratchetStateCompositeWithCompletion:(id)a3;
- (void)ratchetStateWithCompletion:(id)a3;
- (void)setEventBus:(id)a3;
- (void)setRatchetState:(id)a3;
@end

@implementation LACDTORatchetStateMonitor

- (LACDTORatchetStateMonitor)initWithRatchetStateProvider:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTORatchetStateMonitor;
  v9 = -[LACDTORatchetStateMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ratchetStateProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)setRatchetState:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  p_ratchetState = (id *)&self->_ratchetState;
  if (-[LACDTORatchetState isEqual:](self->_ratchetState, "isEqual:", v5))
  {
    if (!-[LACTimer isRunning](self->_timer, "isRunning")) {
      -[LACDTORatchetStateMonitor _scheduleNextStatusCheck](self, "_scheduleNextStatusCheck");
    }
  }

  else
  {
    LACLogDTOState();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *p_ratchetState;
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "Ratchet state changed from: %{public}@ to %{public}@",  (uint8_t *)&v13,  0x16u);
    }

    id v9 = *p_ratchetState;
    objc_storeStrong((id *)&self->_ratchetState, a3);
    uint64_t v10 = [v9 rawValue];
    if (v10 != [*p_ratchetState rawValue])
    {
      v11 = -[LACDTOEvent initWithRawValue:value:]( objc_alloc(&OBJC_CLASS___LACDTOEvent),  "initWithRawValue:value:",  0LL,  self->_ratchetState);
      -[LACDTORatchetStateMonitor eventBus](self, "eventBus");
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 dispatchEvent:v11 sender:self];
    }

    -[LACDTORatchetStateMonitor _scheduleNextStatusCheck](self, "_scheduleNextStatusCheck");
  }
}

- (void)handleEvent:(id)a3 sender:(id)a4
{
  if ([a3 rawValue]) {
    -[LACDTORatchetStateMonitor ratchetStateWithCompletion:]( self,  "ratchetStateWithCompletion:",  &__block_literal_global_7);
  }
}

- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5
{
}

- (void)ratchetStateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56__LACDTORatchetStateMonitor_ratchetStateWithCompletion___block_invoke;
  v7[3] = &unk_18A368A00;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[LACDTORatchetStateProvider ratchetStateWithCompletion:](ratchetStateProvider, "ratchetStateWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__LACDTORatchetStateMonitor_ratchetStateWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5) {
      [WeakRetained setRatchetState:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __65__LACDTORatchetStateMonitor_ratchetStateCompositeWithCompletion___block_invoke;
  v7[3] = &unk_18A368A28;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[LACDTORatchetStateProvider ratchetStateCompositeWithCompletion:]( ratchetStateProvider,  "ratchetStateCompositeWithCompletion:",  v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__LACDTORatchetStateMonitor_ratchetStateCompositeWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v5)
    {
      [v8 ratchetState];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [WeakRetained setRatchetState:v7];
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)_scheduleNextStatusCheck
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[LACTimer isRunning](self->_timer, "isRunning"))
  {
    -[LACTimer cancel](self->_timer, "cancel");
    timer = self->_timer;
    self->_timer = 0LL;
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___LACTimer);
  id v5 = self->_timer;
  self->_timer = v4;

  -[LACDTORatchetStateMonitor ratchetState](self, "ratchetState");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 effectiveDuration];
  double v8 = v7;

  LACLogDTOTimers();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v15 = v8;
    _os_log_impl(&dword_189219000, v9, OS_LOG_TYPE_DEFAULT, "Schedule ratchet state check in %.2f", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v10 = self->_timer;
  workQueue = self->_workQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __53__LACDTORatchetStateMonitor__scheduleNextStatusCheck__block_invoke;
  v12[3] = &unk_18A368B68;
  objc_copyWeak(&v13, (id *)buf);
  -[LACTimer dispatchAfter:inQueue:block:](v10, "dispatchAfter:inQueue:block:", workQueue, v12, v8);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __53__LACDTORatchetStateMonitor__scheduleNextStatusCheck__block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_189219000, v2, OS_LOG_TYPE_DEFAULT, "Performing ratchet state query", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained ratchetStateWithCompletion:&__block_literal_global_5];
}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void).cxx_destruct
{
}

@end