@interface MSUUpdateBrainAssetLoader(SUCoreBorderMSUUpdateBrainAssetLoader)
- (void)SUCoreBorder_loadUpdateBrainWithMAOptions:()SUCoreBorderMSUUpdateBrainAssetLoader clientOptionsFromPolicy:progressHandler:;
@end

@implementation MSUUpdateBrainAssetLoader(SUCoreBorderMSUUpdateBrainAssetLoader)

- (void)SUCoreBorder_loadUpdateBrainWithMAOptions:()SUCoreBorderMSUUpdateBrainAssetLoader clientOptionsFromPolicy:progressHandler:
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _SUCoreBorder_MSUFunctionAtBegin(@"loadUpdateBrainWithMAOptions", 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 simAction];
    if (v13 == 3)
    {
      uint64_t v32 = *MEMORY[0x1896110A8];
      v33[0] = *MEMORY[0x189611098];
      [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v13 == 1)
      {
        [v12 buildErrorWithDescription:@"SUCoreError created by SUCoreBorder_loadUpdateBrainWithMAOptions"];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0LL;
        if (!v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }

      [MEMORY[0x189612778] sharedDiag];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v12];
      [v18 trackAnomaly:@"SUCoreBorder_loadUpdateBrainWithMAOptions" forReason:v19 withResult:8113 withError:0];

      v15 = 0LL;
    }

    v14 = 0LL;
    if (!v10)
    {
LABEL_5:
      [MEMORY[0x1896127A0] sharedLogger];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 oslog];
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        __int16 v30 = 2114;
        v31 = v14;
        _os_log_impl( &dword_187A54000,  v17,  OS_LOG_TYPE_DEFAULT,  "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@",  buf,  0x16u);
      }

      goto LABEL_12;
    }

@end