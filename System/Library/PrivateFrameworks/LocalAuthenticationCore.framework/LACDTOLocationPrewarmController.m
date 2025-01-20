@interface LACDTOLocationPrewarmController
- (LACDTOLocationPrewarmController)initWithLocationProvider:(id)a3 strategy:(id)a4 workQueue:(id)a5;
- (void)_prewarmWithCompletion:(id)a3;
- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4;
- (void)prewarmWithCompletion:(id)a3;
@end

@implementation LACDTOLocationPrewarmController

- (LACDTOLocationPrewarmController)initWithLocationProvider:(id)a3 strategy:(id)a4 workQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTOLocationPrewarmController;
  v12 = -[LACDTOLocationPrewarmController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationProvider, a3);
    objc_storeStrong((id *)&v13->_strategy, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  if (LACDarwinNotificationsEqual(a4, @"com.apple.springboard.lockstate"))
  {
    objc_initWeak(&location, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __77__LACDTOLocationPrewarmController_notificationCenter_didReceiveNotification___block_invoke;
    v6[3] = &unk_18A368B68;
    objc_copyWeak(&v7, &location);
    dispatch_async(workQueue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

void __77__LACDTOLocationPrewarmController_notificationCenter_didReceiveNotification___block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained prewarmWithCompletion:&__block_literal_global_13];
    id WeakRetained = v2;
  }
}

- (void)prewarmWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if (self->_running)
  {
    LACLogDTOLocation();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[LACDTOLocationPrewarmController prewarmWithCompletion:].cold.1(v5);
    }

    v4[2](v4, 1LL);
  }

  else
  {
    self->_running = 1;
    objc_initWeak(&location, self);
    LACLogDTOLocation();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "Will start location prewarm", buf, 2u);
    }

    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __57__LACDTOLocationPrewarmController_prewarmWithCompletion___block_invoke;
    v7[3] = &unk_18A36A068;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    -[LACDTOLocationPrewarmController _prewarmWithCompletion:](self, "_prewarmWithCompletion:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __57__LACDTOLocationPrewarmController_prewarmWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLocation();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromLACDTOLocationPrewarmResult(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = 138543362;
      v8 = v6;
      _os_log_impl( &dword_189219000,  v5,  OS_LOG_TYPE_DEFAULT,  "Did finish location prewarm with result: %{public}@",  (uint8_t *)&v7,  0xCu);
    }

    WeakRetained[8] = 0;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)_prewarmWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  strategy = self->_strategy;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke;
  v7[3] = &unk_18A36A090;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[LACDTOLocationPrewarmStrategy checkNeedsPrewarmWithCompletion:](strategy, "checkNeedsPrewarmWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      id v6 = (void *)*((void *)WeakRetained + 2);
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke_2;
      v7[3] = &unk_18A368BB0;
      id v8 = *(id *)(a1 + 32);
      [v6 checkIsInFamiliarLocationWithCompletion:v7];
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }
}

uint64_t __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void).cxx_destruct
{
}

- (void)prewarmWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_189219000, log, OS_LOG_TYPE_DEBUG, "Ignoring redundant prewarm request", v1, 2u);
}

@end