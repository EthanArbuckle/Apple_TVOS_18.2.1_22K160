@interface LACDTOLocationProviderKVSAdapter
- (LACDTOLocationProviderKVSAdapter)initWithKVStore:(id)a3;
- (NSString)description;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
@end

@implementation LACDTOLocationProviderKVSAdapter

- (LACDTOLocationProviderKVSAdapter)initWithKVStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOLocationProviderKVSAdapter;
  v6 = -[LACDTOLocationProviderKVSAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_kvStore, a3);
  }

  return v7;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOLostMode();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  kvStore = self->_kvStore;
  __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2;
  v9[3] = &unk_18A3688A8;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  -[LACDTOKVStore processReadRequest:completion:](kvStore, "processReadRequest:completion:", v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

LACDTOMutableKVStoreReadRequest *__76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke()
{
  v0 = -[LACDTOMutableKVStoreReadRequest initWithKey:]( objc_alloc(&OBJC_CLASS___LACDTOMutableKVStoreReadRequest),  "initWithKey:",  1LL);
  -[LACDTOMutableKVStoreReadRequest setBypassEntitlements:](v0, "setBypassEntitlements:", 1LL);
  return v0;
}

void __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOLocation();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1( (uint64_t)WeakRetained,  (uint64_t)v6,  v8);
      }

      uint64_t v9 = *(void *)(a1 + 32);
      +[LACDTOLocationState nullInstance](&OBJC_CLASS___LACDTOLocationState, "nullInstance");
      id v10 = (LACDTOLocationState *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, LACDTOLocationState *))(v9 + 16))(v9, v10);
    }

    else
    {
      LACLogDTOLostMode();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = WeakRetained;
        _os_log_impl(&dword_189219000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v12 = [v5 BOOLValue];
      uint64_t v13 = *(void *)(a1 + 32);
      id v10 = -[LACDTOLocationState initWithRawValue:confirmed:]( objc_alloc(&OBJC_CLASS___LACDTOLocationState),  "initWithRawValue:confirmed:",  v12,  0LL);
      (*(void (**)(uint64_t, LACDTOLocationState *))(v13 + 16))(v13, v10);
    }
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
}

void __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_189219000,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ did finish query with error: (%{public}@)",  (uint8_t *)&v3,  0x16u);
}

@end