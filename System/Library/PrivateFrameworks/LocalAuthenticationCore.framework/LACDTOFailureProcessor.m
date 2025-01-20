@interface LACDTOFailureProcessor
- (BOOL)_checkErrorRequiresUI:(id)a3;
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOFailureProcessor)initWithReplyQueue:(id)a3 ui:(id)a4;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOFailureProcessor

- (LACDTOFailureProcessor)initWithReplyQueue:(id)a3 ui:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LACDTOFailureProcessor;
  v7 = -[LACDTOFailureProcessor init](&v10, sel_init);
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_ui, a4);
  }

  return v8;
}

- (BOOL)canProcessRequest:(id)a3
{
  id v3 = a3;
  [v3 options];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1000];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) != 0)
  {
    char v8 = 0;
  }

  else
  {
    [v3 options];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInteger:1039];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKey:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v11 BOOLValue];

    char v8 = v12 ^ 1;
  }

  return v8;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7 = a5;
  +[LACEvaluationResult resultWithNext:](&OBJC_CLASS___LACEvaluationResult, "resultWithNext:", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[LACDTOFailureProcessor canProcessRequest:](self, "canProcessRequest:", v8)
    && ([v9 error], v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11)
    && ([v9 error],
        char v12 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v13 = -[LACDTOFailureProcessor _checkErrorRequiresUI:](self, "_checkErrorRequiresUI:", v12),
        v12,
        v13))
  {
    LACLogDTO();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_189219000, v14, OS_LOG_TYPE_DEFAULT, "Failure alert will appear.", buf, 2u);
    }

    ui = self->_ui;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __63__LACDTOFailureProcessor_postProcessRequest_result_completion___block_invoke;
    v16[3] = &unk_18A368880;
    id v18 = v10;
    id v17 = v9;
    -[LACUserInterfacePresenting presentUIForIdentifier:request:completion:]( ui,  "presentUIForIdentifier:request:completion:",  5LL,  v8,  v16);
  }

  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }
}

void __63__LACDTOFailureProcessor_postProcessRequest_result_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTO();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( &dword_189219000,  v4,  OS_LOG_TYPE_DEFAULT,  "Failure alert did disappear (err: %@)",  (uint8_t *)&v5,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)_checkErrorRequiresUI:(id)a3
{
  id v3 = a3;
  if (v3) {
    BOOL v4 = +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -1LL, 32LL)
  }
      || +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -8LL, 15LL)
      || +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -8LL, 29LL)
      || +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -8LL, 4LL)
      || +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -8LL, -1LL)
      || +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -4LL, 12LL)
      || +[LACError error:hasCode:subcode:](&OBJC_CLASS___LACError, "error:hasCode:subcode:", v3, -4LL, 18LL);
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end