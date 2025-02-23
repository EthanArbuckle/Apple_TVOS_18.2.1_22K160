@interface LACDTOLostModeProviderKVSAdapter
- (LACDTOLostModeProviderKVSAdapter)initWithKVStore:(id)a3;
- (NSString)description;
- (void)lostModeStateWithCompletion:(id)a3;
@end

@implementation LACDTOLostModeProviderKVSAdapter

- (LACDTOLostModeProviderKVSAdapter)initWithKVStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOLostModeProviderKVSAdapter;
  v6 = -[LACDTOLostModeProviderKVSAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_kvStore, a3);
  }

  return v7;
}

- (void)lostModeStateWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOLostMode();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  kvStore = self->_kvStore;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __64__LACDTOLostModeProviderKVSAdapter_lostModeStateWithCompletion___block_invoke;
  v8[3] = &unk_18A3688A8;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  -[LACDTOKVStore valueForKey:completion:](kvStore, "valueForKey:completion:", 2LL, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __64__LACDTOLostModeProviderKVSAdapter_lostModeStateWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLostMode();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_3_cold_1( (uint64_t)WeakRetained,  (uint64_t)v6,  v9);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      +[LACDTOLostModeState nullInstance](&OBJC_CLASS___LACDTOLostModeState, "nullInstance");
      v11 = (LACDTOLostModeState *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = WeakRetained;
        _os_log_impl(&dword_189219000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      v11 = -[LACDTOLostModeState initWithIsInLostMode:]( [LACDTOLostModeState alloc],  "initWithIsInLostMode:",  [v5 BOOLValue]);
    }

    v12 = v11;
    (*(void (**)(uint64_t, LACDTOLostModeState *))(v10 + 16))(v10, v11);
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
}

@end