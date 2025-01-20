@interface LACSharedModeProcessor
- (BOOL)canProcessRequest:(id)a3;
- (LACSharedModeProcessor)initWithReplyQueue:(id)a3 dataSource:(id)a4 policyTraitsManager:(id)a5 policyCoordinator:(id)a6;
- (void)_processRequest:(id)a3 completion:(id)a4;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACSharedModeProcessor

- (LACSharedModeProcessor)initWithReplyQueue:(id)a3 dataSource:(id)a4 policyTraitsManager:(id)a5 policyCoordinator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___LACSharedModeProcessor;
  v15 = -[LACSharedModeProcessor init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_replyQueue, a3);
    objc_storeStrong((id *)&v16->_dataSource, a4);
    objc_storeStrong((id *)&v16->_policyTraitsManager, a5);
    objc_storeStrong((id *)&v16->_policyCoordinator, a6);
  }

  return v16;
}

- (BOOL)canProcessRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  LACLogSharedMode();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl( &dword_189219000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ not available in this platform",  (uint8_t *)&v6,  0xCu);
  }

  return 0;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[LACSharedModeProcessor canProcessRequest:](self, "canProcessRequest:", v8))
  {
    LACLogSharedMode();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v18 = self;
      _os_log_impl(&dword_189219000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __66__LACSharedModeProcessor_processRequest_configuration_completion___block_invoke;
    v13[3] = &unk_18A368690;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v10;
    id v14 = v8;
    -[LACSharedModeProcessor _processRequest:completion:](self, "_processRequest:completion:", v14, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", v8);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

void __66__LACSharedModeProcessor_processRequest_configuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  LACLogSharedMode();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v6 = 138543362;
    id v7 = WeakRetained;
    _os_log_impl(&dword_189219000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  v5 = +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", *(void *)(a1 + 32));
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

- (void)_processRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke;
  v16[3] = &unk_18A368F90;
  id v10 = v6;
  id v17 = v10;
  __53__LACSharedModeProcessor__processRequest_completion___block_invoke((uint64_t)v16);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke_2;
  v13[3] = &unk_18A368FE0;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  -[LACSharedModeDataSource fetchSharedModeWithOptions:completion:]( dataSource,  "fetchSharedModeWithOptions:completion:",  v11,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

LACMutableSharedModeDataSourceRequestOptions *__53__LACSharedModeProcessor__processRequest_completion___block_invoke( uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACMutableSharedModeDataSourceRequestOptions);
  [*(id *)(a1 + 32) options];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1000];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACMutableSharedModeDataSourceRequestOptions setIsPreflight:](v2, "setIsPreflight:", [v5 BOOLValue]);

  return v2;
}

void __53__LACSharedModeProcessor__processRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [*((id *)WeakRetained + 4) policyTraitsForSharedMode:v3];
    id v7 = (void *)v5[3];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke_3;
    v8[3] = &unk_18A368FB8;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v9 = *(id *)(a1 + 32);
    [v7 updatePolicyEvaluationWithTraits:v6 completion:v8];

    objc_destroyWeak(&v10);
  }
}

void __53__LACSharedModeProcessor__processRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogSharedMode();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v5 = 16 * (v3 != 0LL);
  if (os_log_type_enabled(v4, v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v7 = 138543618;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl( &dword_189219000,  v4,  v5,  "%{public}@ Policy update for shared mode finished err=%{public}@",  (uint8_t *)&v7,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void).cxx_destruct
{
}

@end