@interface DIVerifyParams
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldValidateShadows;
- (BOOL)verifyWithError:(id *)a3;
- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4;
- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5;
- (void)setShouldValidateShadows:(BOOL)a3;
@end

@implementation DIVerifyParams

- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x189603F18];
  id v7 = a3;
  [v6 array];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DIVerifyParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v7, v8, a4);

  return v9;
}

- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DIVerifyParams;
  v9 = -[DIBaseParams initWithURL:error:](&v15, sel_initWithURL_error_, a3, a5);
  v10 = v9;
  if (!v9
    || -[DIBaseParams openExistingImageWithFlags:error:](v9, "openExistingImageWithFlags:error:", 0LL, a5)
    && (-[DIBaseParams shadowChain](v10, "shadowChain"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 addShadowURLs:v8 error:a5],
        v11,
        v12))
  {
    v13 = v10;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (BOOL)shouldValidateShadows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  -[DIBaseParams shadowChain](self, "shadowChain");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setShouldValidate:v3];
}

- (BOOL)verifyWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    v12[5] = 0LL;
    getDIOSLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v20 = 34;
    __int16 v21 = 2080;
    v22 = "-[DIVerifyParams verifyWithError:]";
    __int16 v23 = 2114;
    v24 = self;
    id v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v7);
      free(v7);
    }
  }

  else
  {
    getDIOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v20 = 34;
      __int16 v21 = 2080;
      v22 = "-[DIVerifyParams verifyWithError:]";
      __int16 v23 = 2114;
      v24 = self;
      _os_log_impl(&dword_188046000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v5;
  if (([(id)v14[5] connectWithError:a3] & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v14[5],  2LL,  a3))
  {
    [(id)v14[5] remoteProxy];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __34__DIVerifyParams_verifyWithError___block_invoke;
    v12[3] = &unk_18A1CA2E8;
    v12[4] = &v13;
    [v9 verifyWithParams:self reply:v12];

    char v10 = [(id)v14[5] completeCommandWithError:a3];
  }

  else
  {
    char v10 = 0;
  }

  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __34__DIVerifyParams_verifyWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) signalCommandCompletedWithXpcError:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end