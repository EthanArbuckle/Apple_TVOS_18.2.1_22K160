@interface LSSpringBoardCall
@end

@implementation LSSpringBoardCall

void __48___LSSpringBoardCall_callWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) callSpringBoardWithCompletionHandler:*(void *)(a1 + 40)];
  }

  else if (_LSGetOSStatusFromNSError(v5) == -2026)
  {
    [*(id *)(a1 + 32) promptAndCallSpringBoardWithCompletionHandler:*(void *)(a1 + 40)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __47___LSSpringBoardCall_Private__springBoardQueue__block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LS SpringBoard call queue", v2);
  v1 = (void *)+[_LSSpringBoardCall(Private) springBoardQueue]::result;
  +[_LSSpringBoardCall(Private) springBoardQueue]::result = (uint64_t)v0;
}

void __65___LSSpringBoardCall_Private__springBoardDeadlockPreventionQueue__block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LS SpringBoard sync call deadlock prevention queue", v2);
  v1 = (void *)+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::result;
  +[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::result = (uint64_t)v0;
}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bundleIdentifier];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_189D78A08;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 64);
  [v2 openApplication:v3 withOptions:v4 clientHandle:v5 completion:v6];
}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  uint64_t v4 = (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v5 == 0LL);
  MEMORY[0x186E2AFE0](v4);
}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v2 = (uint64_t *)(a1 + 32);
  [(id)objc_opt_class() springBoardQueue];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = MEMORY[0x1895F87A8];
  uint64_t v20 = 3221225472LL;
  v21 = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_4;
  v22 = &unk_189D78A58;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *v2;
  id v23 = v4;
  uint64_t v24 = v5;
  id v25 = *(id *)(a1 + 48);
  id v26 = *(id *)(a1 + 56);
  _LSDispatchWithTimeout(v3, &v19, 10.0);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "result", v19, v20, v21, v22);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || ([v6 result],
        id v8 = (void *)objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 BOOLValue],
        v8,
        v7,
        !v9))
  {
    [v6 error];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      [v6 error];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 domain];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v12 isEqual:*MEMORY[0x189607688]])
      {
        [v6 error];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v14 = [v13 code] == 60;

        if (v14)
        {
          _LSDefaultLog();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_183E58000,  v15,  OS_LOG_TYPE_DEFAULT,  "application launch failed - timeout waiting for launch.",  buf,  2u);
          }

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_4( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5;
  v11[3] = &unk_189D78A30;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v13 = v9;
  id v10 = v3;
  id v14 = v10;
  [v4 openApplication:v5 withOptions:v6 clientHandle:v7 completion:v11];
}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) bundleIdentifier];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5_cold_1( v8,  (uint64_t)v6,  buf,  v7);
    }

    uint64_t v15 = *MEMORY[0x189607490];
    v16 = @"Unable to launch. See logs for more detail.";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  115LL,  (uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]_block_invoke",  271LL,  v9);

    id v6 = (id)v10;
  }

  uint64_t v11 = *(void *)(a1 + 48);
  if (v5) {
    BOOL v12 = v6 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  uint64_t v13 = v12;
  [MEMORY[0x189607968] numberWithBool:v13];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v14, v6);

  MEMORY[0x186E2AFE0]();
}

void __77___LSSpringBoardCall_Private__promptAndCallSpringBoardWithCompletionHandler___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) callSpringBoardWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5_cold_1( void *a1,  uint64_t a2,  uint8_t *buf,  os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Request to open %{private}@ failed error: %@",  buf,  0x16u);
}

@end