@interface LACDTOLocationProviderPersistenceDecorator
- (LACDTOLocationProviderPersistenceDecorator)initWithLocationProvider:(id)a3 store:(id)a4 cacheEnabled:(BOOL)a5;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
@end

@implementation LACDTOLocationProviderPersistenceDecorator

- (LACDTOLocationProviderPersistenceDecorator)initWithLocationProvider:(id)a3 store:(id)a4 cacheEnabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTOLocationProviderPersistenceDecorator;
  v11 = -[LACDTOLocationProviderPersistenceDecorator init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locationProvider, a3);
    objc_storeStrong((id *)&v12->_store, a4);
    v12->_isCacheEnabled = a5;
    locationState = v12->_locationState;
    v12->_locationState = 0LL;
  }

  return v12;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  locationProvider = self->_locationProvider;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke;
  v7[3] = &unk_18A368798;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[LACDTOLocationProvider checkIsInFamiliarLocationWithCompletion:]( locationProvider,  "checkIsInFamiliarLocationWithCompletion:",  v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 32)
      && (v7 = WeakRetained + 3, WeakRetained[3])
      && (int v8 = [v4 isInFamiliarLocation], v8 == objc_msgSend(*v7, "isInFamiliarLocation")))
    {
      objc_storeStrong(v6 + 3, a2);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    else
    {
      id v9 = v6[2];
      uint64_t v10 = MEMORY[0x1895F87A8];
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2;
      v17[3] = &unk_18A369030;
      id v11 = v4;
      id v18 = v11;
      __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2((uint64_t)v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      v13[1] = 3221225472LL;
      v13[2] = __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_3;
      v13[3] = &unk_18A369058;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      id v14 = v11;
      id v15 = *(id *)(a1 + 32);
      [v9 processWriteRequest:v12 completion:v13];

      objc_destroyWeak(&v16);
    }
  }
}

LACDTOMutableKVStoreWriteRequest *__86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2( uint64_t a1)
{
  v1 = -[LACDTOKVStoreValue initWithBoolValue:]( [LACDTOKVStoreValue alloc],  "initWithBoolValue:",  [*(id *)(a1 + 32) isInFamiliarLocation]);
  v2 = -[LACDTOMutableKVStoreWriteRequest initWithKey:value:]( objc_alloc(&OBJC_CLASS___LACDTOMutableKVStoreWriteRequest),  "initWithKey:value:",  1LL,  v1);
  -[LACDTOMutableKVStoreWriteRequest setBypassEntitlements:](v2, "setBypassEntitlements:", 1LL);

  return v2;
}

void __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = *(id *)(a1 + 32);
    if (v3)
    {
      LACLogDTOLocation();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_3_cold_1( (uint64_t)WeakRetained,  (uint64_t)v3,  v6);
      }

      uint64_t v7 = +[LACDTOLocationState nullInstance](&OBJC_CLASS___LACDTOLocationState, "nullInstance");

      id v5 = (id)v7;
    }

    int v8 = (void *)WeakRetained[3];
    WeakRetained[3] = v5;
    id v9 = v5;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

- (void).cxx_destruct
{
}

void __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_3_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_189219000,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ did finish query with error %{public}@",  (uint8_t *)&v3,  0x16u);
}

@end