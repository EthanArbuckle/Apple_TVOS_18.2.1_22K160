@interface LACDTOLostModeProviderAKAdapter
- (LACDTOLostModeProviderAKAdapter)initWithWorkQueue:(id)a3 deviceInfo:(id)a4;
- (NSString)description;
- (void)_lostModeStateWithCompletion:(id)a3;
- (void)lostModeStateWithCompletion:(id)a3;
@end

@implementation LACDTOLostModeProviderAKAdapter

- (LACDTOLostModeProviderAKAdapter)initWithWorkQueue:(id)a3 deviceInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTOLostModeProviderAKAdapter;
  v9 = -[LACDTOLostModeProviderAKAdapter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_deviceInfo, a4);
  }

  return v10;
}

- (void)lostModeStateWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(id, LACDTOLostModeState *))a3;
  lostModeState = self->_lostModeState;
  if (lostModeState)
  {
    [MEMORY[0x189603F50] now];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = -[LACDTOLostModeState isValid:](lostModeState, "isValid:", v6);

    if (v7)
    {
      LACLogDTOLostMode();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_lostModeState;
        *(_DWORD *)buf = 138543618;
        v16 = self;
        __int16 v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will use cached value %@", buf, 0x16u);
      }

      v4[2](v4, self->_lostModeState);
      goto LABEL_11;
    }

    v10 = self->_lostModeState;
  }

  else
  {
    v10 = 0LL;
  }

  self->_lostModeState = 0LL;

  LACLogDTOLostMode();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_189219000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke;
  v12[3] = &unk_18A369558;
  objc_copyWeak(&v14, (id *)buf);
  v13 = v4;
  -[LACDTOLostModeProviderAKAdapter _lostModeStateWithCompletion:](self, "_lostModeStateWithCompletion:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
LABEL_11:
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2;
    v10[3] = &unk_18A369530;
    id v11 = v6;
    objc_super v12 = v8;
    id v14 = *(id *)(a1 + 32);
    id v13 = v5;
    dispatch_async(v9, v10);
  }
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  LACLogDTOLostMode();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2_cold_1(a1, v2, v5);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    +[LACDTOLostModeState nullInstance](&OBJC_CLASS___LACDTOLostModeState, "nullInstance");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl( &dword_189219000,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ did finish query with value: %@",  (uint8_t *)&v10,  0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16LL), *(id *)(a1 + 48));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

- (void)_lostModeStateWithCompletion:(id)a3
{
  id v4 = a3;
  +[LACError errorWithCode:](&OBJC_CLASS___LACError, "errorWithCode:", -1020LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0LL, v5);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2_cold_1( uint64_t a1,  uint64_t *a2,  os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl( &dword_189219000,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ did finish query with error: %{public}@",  (uint8_t *)&v5,  0x16u);
}

@end