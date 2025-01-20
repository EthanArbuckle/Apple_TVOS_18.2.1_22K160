@interface LACDTOPolicyProcessorEmptyPasscode
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOPolicyProcessorEmptyPasscode)initWithCredentialStore:(id)a3 device:(id)a4;
- (void)_processAndEvaluateRequest:(id)a3 completion:(id)a4;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOPolicyProcessorEmptyPasscode

- (LACDTOPolicyProcessorEmptyPasscode)initWithCredentialStore:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTOPolicyProcessorEmptyPasscode;
  v9 = -[LACDTOPolicyProcessorEmptyPasscode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (BOOL)canProcessRequest:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1081];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  LACLogDTOProcessor();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_189219000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __78__LACDTOPolicyProcessorEmptyPasscode_processRequest_configuration_completion___block_invoke;
  v13[3] = &unk_18A368F18;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v10;
  id v14 = v12;
  -[LACDTOPolicyProcessorEmptyPasscode _processAndEvaluateRequest:completion:]( self,  "_processAndEvaluateRequest:completion:",  v8,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __78__LACDTOPolicyProcessorEmptyPasscode_processRequest_configuration_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTOProcessor();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 138543362;
    id v7 = WeakRetained;
    _os_log_impl(&dword_189219000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_processAndEvaluateRequest:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!-[LACDTOPolicyProcessorEmptyPasscode canProcessRequest:](self, "canProcessRequest:", v6))
  {
LABEL_6:
    +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);

    goto LABEL_7;
  }

  if (!-[LACDTODeviceInfoProvider hasPasscodeSetForUser:]( self->_device,  "hasPasscodeSetForUser:",  [v6 evaluationUserId]))
  {
    [v6 options];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInteger:1000];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKey:v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v17 BOOLValue];

    if (!v18)
    {
      objc_initWeak((id *)buf, self);
      store = self->_store;
      v20 = +[LACSecureData secureDataWithData:](&OBJC_CLASS___LACSecureData, "secureDataWithData:", 0LL);
      uint64_t v21 = MEMORY[0x1895F87A8];
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke;
      v28[3] = &unk_18A368F40;
      id v22 = v6;
      id v29 = v22;
      __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke((uint64_t)v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      v24[1] = 3221225472LL;
      v24[2] = __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke_2;
      v24[3] = &unk_18A368F68;
      objc_copyWeak(&v27, (id *)buf);
      v26 = v7;
      id v25 = v22;
      -[LACCredentialStore setValue:forCredential:completion:]( store,  "setValue:forCredential:completion:",  v20,  v23,  v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  id v8 = objc_alloc(MEMORY[0x189603FC8]);
  [v6 options];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (void *)[v8 initWithDictionary:v9];

  LACLogDTOProcessor();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v31 = self;
    __int16 v32 = 1024;
    int v33 = 1081;
    __int16 v34 = 1024;
    int v35 = [v6 evaluationUserId];
    _os_log_impl( &dword_189219000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Removing %d option because user %d has passcode",  buf,  0x18u);
  }

  [MEMORY[0x189607968] numberWithInteger:1081];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setObject:0 forKeyedSubscript:v12];

  [v6 updateOptions:v10];
  v13 = +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", v6);
  v7[2](v7, v13);

LABEL_7:
}

LACMutableCredentialRequest *__76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke( uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACMutableCredentialRequest);
  -[LACMutableCredentialRequest setCredential:](v2, "setCredential:", -1LL);
  [*(id *)(a1 + 32) externalizedContext];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACMutableCredentialRequest setExternalizedContext:](v2, "setExternalizedContext:", v3);

  -[LACMutableCredentialRequest setUserID:](v2, "setUserID:", [*(id *)(a1 + 32) evaluationUserId]);
  return v2;
}

void __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    LACLogDTOProcessor();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      int v9 = 138543618;
      id v10 = WeakRetained;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_189219000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed err=%{public}@", (uint8_t *)&v9, 0x16u);
    }

    +[LACEvaluationResult resultWithFailure:](&OBJC_CLASS___LACEvaluationResult, "resultWithFailure:", v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", *(void *)(a1 + 32));
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void).cxx_destruct
{
}

@end