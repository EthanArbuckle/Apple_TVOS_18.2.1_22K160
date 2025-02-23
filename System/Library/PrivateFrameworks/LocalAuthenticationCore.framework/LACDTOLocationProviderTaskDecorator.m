@interface LACDTOLocationProviderTaskDecorator
- (LACBackgroundTask)locationStateBackgroundTask;
- (LACDTOLocationProviderTaskDecorator)initWithLocationProvider:(id)a3 workQueue:(id)a4;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (id)_locationStateFromBackgroundTaskResult:(id)a3;
- (void)_runLocationStateBackgroundTask:(double)a3 completion:(id)a4;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
- (void)setLocationStateBackgroundTask:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation LACDTOLocationProviderTaskDecorator

- (LACDTOLocationProviderTaskDecorator)initWithLocationProvider:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTOLocationProviderTaskDecorator;
  v9 = -[LACDTOLocationProviderTaskDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  id v5 = a3;
  -[LACDTOLocationProviderTaskDecorator workQueue](self, "workQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[LACDTOLocationProviderTaskDecorator _runLocationStateBackgroundTask:completion:]( self,  "_runLocationStateBackgroundTask:completion:",  v5,  1.0);
}

- (LACBackgroundTask)locationStateBackgroundTask
{
  locationStateBackgroundTask = self->_locationStateBackgroundTask;
  if (!locationStateBackgroundTask)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(&OBJC_CLASS___LACBackgroundTask);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke;
    v8[3] = &unk_18A368BD8;
    objc_copyWeak(&v9, &location);
    id v5 = -[LACBackgroundTask initWithIdentifier:worker:]( v4,  "initWithIdentifier:worker:",  @"LocationStateQuery",  v8);
    v6 = self->_locationStateBackgroundTask;
    self->_locationStateBackgroundTask = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    locationStateBackgroundTask = self->_locationStateBackgroundTask;
  }

  return locationStateBackgroundTask;
}

void __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[LACDTOSignpostEvent locationStatusQueryWillStart]( &OBJC_CLASS___LACDTOSignpostEvent,  "locationStatusQueryWillStart");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 send];

    v6 = (void *)WeakRetained[1];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke_2;
    v7[3] = &unk_18A368BB0;
    id v8 = v3;
    [v6 checkIsInFamiliarLocationWithCompletion:v7];
  }
}

void __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  v4 = +[LACDTOSignpostEvent locationStatusQueryDidFinish](&OBJC_CLASS___LACDTOSignpostEvent, "locationStatusQueryDidFinish");
  [v4 send];

  uint64_t v5 = *(void *)(a1 + 32);
  v6 = -[LACBackgroundTaskResult initWithValue:]( objc_alloc(&OBJC_CLASS___LACBackgroundTaskResult),  "initWithValue:",  v3);

  (*(void (**)(uint64_t, LACBackgroundTaskResult *))(v5 + 16))(v5, v6);
}

- (void)_runLocationStateBackgroundTask:(double)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  objc_initWeak(&location, self);
  LACLogDTOLocation();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2048;
    double v18 = a3;
    _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will perform query with %.2f sec timeout",  buf,  0x16u);
  }

  -[LACDTOLocationProviderTaskDecorator locationStateBackgroundTask](self, "locationStateBackgroundTask");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __82__LACDTOLocationProviderTaskDecorator__runLocationStateBackgroundTask_completion___block_invoke;
  v11[3] = &unk_18A368C00;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [v8 runWithTimeout:workQueue queue:v11 completion:a3];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __82__LACDTOLocationProviderTaskDecorator__runLocationStateBackgroundTask_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    [WeakRetained _locationStateFromBackgroundTaskResult:v7];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (id)_locationStateFromBackgroundTaskResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = [v4 value];
  if (v5
    && (id v6 = (void *)v5,
        [v4 value],
        id v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v9 = [v4 value];
  }

  else
  {
    [v4 error];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      LACLogDTOLocation();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        [v4 error];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        double v18 = v12;
        _os_log_impl( &dword_189219000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ query finished with error %{public}@",  (uint8_t *)&v15,  0x16u);
      }
    }

    uint64_t v9 = +[LACDTOLocationState nullInstance](&OBJC_CLASS___LACDTOLocationState, "nullInstance");
  }

  id v13 = (void *)v9;

  return v13;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setLocationStateBackgroundTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end