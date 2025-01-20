@interface MSUUpdateBrainAssetLoader
@end

@implementation MSUUpdateBrainAssetLoader

void __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  _SUCoreBorder_MSUFunctionAtEnd(@"loadUpdateBrainWithMAOptions", 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 simAction];
    if (v9 == 3)
    {
      uint64_t v29 = *MEMORY[0x1896110A8];
      uint64_t v30 = *MEMORY[0x189611098];
      [MEMORY[0x189603F68] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v9 == 1)
      {
        [v8 buildErrorWithDescription:@"SUCoreError created by SUCoreBorder_loadUpdateBrainWithMAOptions"];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0LL;
LABEL_10:
        if (*(void *)(a1 + 32))
        {
          [MEMORY[0x189612760] sharedCore];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 completionQueue];
          v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1895F87A8];
          v21[1] = 3221225472LL;
          v21[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_253;
          v21[3] = &unk_18A0EF8F8;
          v24 = (os_log_s *)*(id *)(a1 + 32);
          id v22 = v11;
          id v23 = v10;
          dispatch_async(v17, v21);

          v18 = v24;
        }

        else
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 oslog];
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v32 = v11;
            __int16 v33 = 2114;
            id v34 = v10;
            _os_log_impl( &dword_187A54000,  v18,  OS_LOG_TYPE_DEFAULT,  "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@",  buf,  0x16u);
          }
        }

        goto LABEL_15;
      }

      [MEMORY[0x189612778] sharedDiag];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v8];
      [v14 trackAnomaly:@"SUCoreBorder_loadUpdateBrainWithMAOptions" forReason:v15 withResult:8113 withError:0];

      v11 = 0LL;
    }

    v10 = 0LL;
    goto LABEL_10;
  }

  if (*(void *)(a1 + 32))
  {
    [MEMORY[0x189612760] sharedCore];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 completionQueue];
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_2;
    block[3] = &unk_18A0EF8F8;
    id v28 = *(id *)(a1 + 32);
    id v26 = v5;
    id v27 = v6;
    dispatch_async(v13, block);

    v11 = v28;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v5;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl( &dword_187A54000,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@",  buf,  0x16u);
    }
  }

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_253( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_255( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

@end