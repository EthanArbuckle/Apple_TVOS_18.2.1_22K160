@interface LACSharedModeDataSourceTaskDecorator
- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4;
- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 runtime:(id)a4 replyQueue:(id)a5;
- (double)_timeoutForRequestWithOptions:(id)a3;
- (id)_sharedModeBackgroundTaskWithOptions:(id)a3;
- (id)_sharedModeFromBackgroundTaskResult:(id)a3;
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceTaskDecorator

- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___LACSharedModeDataSourceTaskDecoratorRuntime);
  v9 = -[LACSharedModeDataSourceTaskDecorator initWithDataSource:runtime:replyQueue:]( self,  "initWithDataSource:runtime:replyQueue:",  v7,  v8,  v6);

  return v9;
}

- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 runtime:(id)a4 replyQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACSharedModeDataSourceTaskDecorator;
  v12 = -[LACSharedModeDataSourceTaskDecorator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_runtime, a4);
    objc_storeStrong((id *)&v13->_replyQueue, a5);
  }

  return v13;
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  LACLogSharedMode();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  -[LACSharedModeDataSourceTaskDecorator _sharedModeBackgroundTaskWithOptions:]( self,  "_sharedModeBackgroundTaskWithOptions:",  v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACSharedModeDataSourceTaskDecorator _timeoutForRequestWithOptions:](self, "_timeoutForRequestWithOptions:", v6);
  double v11 = v10;
  replyQueue = self->_replyQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __78__LACSharedModeDataSourceTaskDecorator_fetchSharedModeWithOptions_completion___block_invoke;
  v15[3] = &unk_18A3687C0;
  objc_copyWeak(&v18, &location);
  id v13 = v7;
  id v17 = v13;
  id v14 = v9;
  id v16 = v14;
  [v14 runWithTimeout:replyQueue queue:v15 completion:v11];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __78__LACSharedModeDataSourceTaskDecorator_fetchSharedModeWithOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _sharedModeFromBackgroundTaskResult:v3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogSharedMode();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 48));
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2114;
      v12 = v6;
      _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ did finish query %{public}@",  (uint8_t *)&v9,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

- (id)_sharedModeBackgroundTaskWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(&OBJC_CLASS___LACBackgroundTask);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke;
  v9[3] = &unk_18A368810;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = -[LACBackgroundTask initWithIdentifier:worker:]( v5,  "initWithIdentifier:worker:",  @"SharedModeStateQuery",  v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 1);
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke_2;
    v8[3] = &unk_18A3687E8;
    id v9 = v3;
    [v6 fetchSharedModeWithOptions:v7 completion:v8];
  }
}

void __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = -[LACBackgroundTaskResult initWithValue:]( objc_alloc(&OBJC_CLASS___LACBackgroundTaskResult),  "initWithValue:",  v3);

  (*(void (**)(uint64_t, LACBackgroundTaskResult *))(v2 + 16))(v2, v4);
}

- (id)_sharedModeFromBackgroundTaskResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 value];
  if (v5
    && (id v6 = (void *)v5,
        [v4 value],
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    -[LACSharedModeDataSourceTaskDecoratorRuntime resetMaxValue](self->_runtime, "resetMaxValue");
    uint64_t v9 = [v4 value];
  }

  else
  {
    [v4 error];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [v4 error];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 domain];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v12 isEqualToString:@"LACBackgroundTaskErrorDomain"])
      {
        [v4 error];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 code];

        if (v14 == 2) {
          -[LACSharedModeDataSourceTaskDecoratorRuntime halveMaxValue](self->_runtime, "halveMaxValue");
        }
      }

      else
      {
      }

      LACLogSharedMode();
      objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[LACSharedModeDataSourceTaskDecorator _sharedModeFromBackgroundTaskResult:].cold.1((uint64_t)self, v4, v15);
      }
    }

    uint64_t v9 = +[LACSharedMode defaultSharedMode](&OBJC_CLASS___LACSharedMode, "defaultSharedMode");
  }

  id v16 = (void *)v9;

  return v16;
}

- (double)_timeoutForRequestWithOptions:(id)a3
{
  int v4 = [a3 isPreflight];
  runtime = self->_runtime;
  if (v4) {
    -[LACSharedModeDataSourceTaskDecoratorRuntime minValue](runtime, "minValue");
  }
  else {
    -[LACSharedModeDataSourceTaskDecoratorRuntime maxValue](runtime, "maxValue");
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)_sharedModeFromBackgroundTaskResult:(os_log_s *)a3 .cold.1( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [a2 error];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl( &dword_189219000,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@ query finished with error %{public}@",  (uint8_t *)&v6,  0x16u);
}

@end