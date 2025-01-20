@interface LACDTOLocationController
- (LACDTOEventBus)eventBus;
- (LACDTOLocationController)initWithLocationProvider:(id)a3 monitor:(id)a4 workQueue:(id)a5;
- (LACDTOLocationState)locationState;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
- (void)locationMonitor:(id)a3 didReceiveLocationState:(id)a4;
- (void)pendingEvaluationControllerDidStartTrackingPendingEvaluations:(id)a3;
- (void)pendingEvaluationControllerDidStopTrackingPendingEvaluations:(id)a3;
- (void)setEventBus:(id)a3;
- (void)setLocationState:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation LACDTOLocationController

- (LACDTOLocationController)initWithLocationProvider:(id)a3 monitor:(id)a4 workQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTOLocationController;
  v12 = -[LACDTOLocationController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationProvider, a3);
    objc_storeStrong((id *)&v13->_monitor, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
    -[LACDTOLocationMonitor setDelegate:](v13->_monitor, "setDelegate:", v13);
  }

  return v13;
}

- (void)setLocationState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  -[LACDTOLocationController workQueue](self, "workQueue");
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  p_locationState = &self->_locationState;
  if (!-[LACDTOLocationState isEqual:](self->_locationState, "isEqual:", v5))
  {
    v8 = *p_locationState;
    objc_storeStrong((id *)&self->_locationState, a3);
    if (v8)
    {
      BOOL v9 = -[LACDTOLocationState isInFamiliarLocation](v8, "isInFamiliarLocation");
      if (v9 != -[LACDTOLocationState isInFamiliarLocation](*p_locationState, "isInFamiliarLocation"))
      {
        LACLogDTOState();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138543874;
          v14 = self;
          __int16 v15 = 2112;
          v16 = v8;
          __int16 v17 = 2112;
          id v18 = v5;
          _os_log_impl( &dword_189219000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ DSLMode changed from: %@ to %@",  (uint8_t *)&v13,  0x20u);
        }

        id v11 = -[LACDTOEvent initWithRawValue:value:]( objc_alloc(&OBJC_CLASS___LACDTOEvent),  "initWithRawValue:value:",  1LL,  v5);
        v12 = -[LACDTOLocationController eventBus](self, "eventBus");
        [v12 dispatchEvent:v11 sender:self];
      }
    }
  }
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[LACDTOLocationController workQueue](self, "workQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  LACLogDTOLocation();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  locationProvider = self->_locationProvider;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __68__LACDTOLocationController_checkIsInFamiliarLocationWithCompletion___block_invoke;
  v9[3] = &unk_18A368798;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  -[LACDTOLocationProvider checkIsInFamiliarLocationWithCompletion:]( locationProvider,  "checkIsInFamiliarLocationWithCompletion:",  v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __68__LACDTOLocationController_checkIsInFamiliarLocationWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLocation();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %@", (uint8_t *)&v6, 0x16u);
    }

    [WeakRetained setLocationState:v3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)pendingEvaluationControllerDidStartTrackingPendingEvaluations:(id)a3
{
}

- (void)pendingEvaluationControllerDidStopTrackingPendingEvaluations:(id)a3
{
}

- (void)locationMonitor:(id)a3 didReceiveLocationState:(id)a4
{
  if (self->_monitor == a3) {
    -[LACDTOLocationController setLocationState:](self, "setLocationState:", a4);
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
}

- (LACDTOLocationState)locationState
{
  return self->_locationState;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end