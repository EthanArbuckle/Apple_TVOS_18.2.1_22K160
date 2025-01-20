@interface MAAsset(SUCoreBorderMAAsset)
+ (id)SUCoreBorder_loadSync:()SUCoreBorderMAAsset allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:;
+ (id)_SUCoreBorder_MAAssetResultAtBegin:()SUCoreBorderMAAsset withDescriptor:type:error:;
+ (id)_SUCoreBorder_MAAssetResultAtEnd:()SUCoreBorderMAAsset withDescriptor:type:withResult:error:;
+ (id)_SUCoreBorder_MAAttributesAtBegin:()SUCoreBorderMAAsset;
+ (id)_SUCoreBorder_MAAttributesAtEnd:()SUCoreBorderMAAsset withBaseAttributes:;
+ (id)_getSimulatedAssetForDescriptor:()SUCoreBorderMAAsset type:;
+ (uint64_t)_SUCoreBorder_MAAssetState:()SUCoreBorderMAAsset;
+ (uint64_t)_SUCoreBorder_MABoolResultAtBegin:()SUCoreBorderMAAsset;
+ (uint64_t)_SUCoreBorder_MABoolResultAtEnd:()SUCoreBorderMAAsset withResult:;
+ (void)SUCoreBorder_cancelCatalogDownload:()SUCoreBorderMAAsset completionWithCancelResult:;
+ (void)SUCoreBorder_startCatalogDownload:()SUCoreBorderMAAsset options:completionWithError:;
+ (void)_SUCoreBorder_MACancelDownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MACancelDownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:;
+ (void)_SUCoreBorder_MADownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MADownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:;
+ (void)_SUCoreBorder_MAOperationResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MAOperationResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:;
+ (void)_SUCoreBorder_MAPurgeResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MAPurgeResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:;
- (id)SUCoreBorder_attributes;
- (uint64_t)SUCoreBorder_refreshState;
- (uint64_t)SUCoreBorder_state;
- (void)SUCoreBorder_cancelDownload:()SUCoreBorderMAAsset;
- (void)SUCoreBorder_configDownload:()SUCoreBorderMAAsset completion:;
- (void)SUCoreBorder_purgeWithError:()SUCoreBorderMAAsset;
- (void)SUCoreBorder_startDownload:()SUCoreBorderMAAsset completionWithError:;
- (void)_prepAndSendDownloadFinishedSplunkEvent:()SUCoreBorderMAAsset withError:withSessionId:;
- (void)_prepAndSendDownloadStartedSplunkEvent:()SUCoreBorderMAAsset;
- (void)_setCommonSplunkFields:()SUCoreBorderMAAsset withSessionId:;
@end

@implementation MAAsset(SUCoreBorderMAAsset)

+ (void)SUCoreBorder_startCatalogDownload:()SUCoreBorderMAAsset options:completionWithError:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x1896127C8] sharedSimulator];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 begin:@"ma" atFunction:@"startCatalogDownload"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1896110E0];
  if (v11)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MADownloadResultAtBegin:withCompletion:", v11, v9);
  }

  else
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startCatalogDownload_options_completionWithError___block_invoke;
    v13[3] = &unk_18A0EFA10;
    id v14 = v9;
    [v12 startCatalogDownload:v7 options:v8 completionWithError:v13];
  }
}

+ (void)SUCoreBorder_cancelCatalogDownload:()SUCoreBorderMAAsset completionWithCancelResult:
{
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1896127C8] sharedSimulator];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 begin:@"ma" atFunction:@"cancelCatalogDownload"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = (void *)MEMORY[0x1896110E0];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MACancelDownloadResultAtBegin:withCompletion:", v8, v6);
  }

  else
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelCatalogDownload_completionWithCancelResult___block_invoke;
    v10[3] = &unk_18A0EFA38;
    id v11 = v6;
    [v9 cancelCatalogDownload:v5 then:v10];
  }
}

- (void)SUCoreBorder_startDownload:()SUCoreBorderMAAsset completionWithError:
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127C8] sharedSimulator];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 begin:@"ma" atFunction:@"startDownload"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MADownloadResultAtBegin:withCompletion:", v9, v7);
  }

  else
  {
    [v6 sessionId];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 _prepAndSendDownloadStartedSplunkEvent:v10];

    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __79__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startDownload_completionWithError___block_invoke;
    v11[3] = &unk_18A0EFA60;
    v11[4] = a1;
    id v12 = v6;
    id v13 = v7;
    [a1 startDownload:v12 completionWithError:v11];
  }
}

- (void)SUCoreBorder_purgeWithError:()SUCoreBorderMAAsset
{
  id v4 = a3;
  [MEMORY[0x1896127C8] sharedSimulator];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 begin:@"ma" atFunction:@"purgeWithError"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MAPurgeResultAtBegin:withCompletion:", v6, v4);
  }

  else
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_purgeWithError___block_invoke;
    v7[3] = &unk_18A0EFA10;
    id v8 = v4;
    [a1 purgeWithError:v7];
  }
}

- (void)SUCoreBorder_cancelDownload:()SUCoreBorderMAAsset
{
  id v4 = a3;
  [MEMORY[0x1896127C8] sharedSimulator];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 begin:@"ma" atFunction:@"cancelDownload"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MACancelDownloadResultAtBegin:withCompletion:", v6, v4);
  }

  else
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelDownload___block_invoke;
    v7[3] = &unk_18A0EFA38;
    id v8 = v4;
    [a1 cancelDownload:v7];
  }
}

- (void)SUCoreBorder_configDownload:()SUCoreBorderMAAsset completion:
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127C8] sharedSimulator];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 begin:@"ma" atFunction:@"configDownload"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MAOperationResultAtBegin:withCompletion:", v9, v7);
  }

  else
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __71__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_configDownload_completion___block_invoke;
    v10[3] = &unk_18A0EFA38;
    id v11 = v7;
    [a1 configDownload:v6 completion:v10];
  }
}

- (uint64_t)SUCoreBorder_refreshState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 begin:@"ma" atFunction:@"refreshState"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MABoolResultAtBegin:", v3);
  }

  else
  {
    uint64_t v4 = [a1 refreshState];
    [MEMORY[0x1896127C8] sharedSimulator];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 end:@"ma" atFunction:@"refreshState"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6) {
      uint64_t v4 = objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MABoolResultAtEnd:withResult:", v6, v4);
    }
  }

  return v4;
}

- (uint64_t)SUCoreBorder_state
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 begin:@"ma" atFunction:@"state"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MAAssetState:", v3);
  }

  else
  {
    uint64_t v4 = [a1 state];
    [MEMORY[0x1896127C8] sharedSimulator];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 end:@"ma" atFunction:@"state"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6) {
      uint64_t v4 = objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MAAssetState:", v6);
    }
  }

  return v4;
}

- (id)SUCoreBorder_attributes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 begin:@"ma" atFunction:@"attributes"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MAAttributesAtBegin:", v3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [a1 attributes];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127C8] sharedSimulator];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 end:@"ma" atFunction:@"attributes"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MAAttributesAtEnd:withBaseAttributes:", v6, v4);

      uint64_t v4 = (void *)v7;
    }
  }

  return v4;
}

+ (id)SUCoreBorder_loadSync:()SUCoreBorderMAAsset allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  [MEMORY[0x1896127C8] sharedSimulator];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 begin:@"ma" atFunction:@"loadSync"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1896110E0], "_SUCoreBorder_MAAssetResultAtBegin:withDescriptor:type:error:", v18, v16, a8, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v27 = v14;
    id v28 = v13;
    id v20 = v13;
    uint64_t v21 = a6;
    [MEMORY[0x1896110E0] loadSync:v20 allowingDifferences:v14 withPurpose:v15 error:a6];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127C8] sharedSimulator];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 end:@"ma" atFunction:@"loadSync"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend( MEMORY[0x1896110E0],  "_SUCoreBorder_MAAssetResultAtEnd:withDescriptor:type:withResult:error:",  v24,  v16,  a8,  v22,  v21);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v25 = v22;
    }

    v19 = v25;

    id v14 = v27;
    id v13 = v28;
  }

  return v19;
}

+ (void)_SUCoreBorder_MADownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v9 = 0LL;
    v10 = 0LL;
  }

  else
  {
    if (v7 == 1)
    {
      [MEMORY[0x1896127C8] sharedSimulator];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = 3LL;
      [v8 generateError:@"_SUCoreBorder_MADownloadResultAtBegin" ofDomain:@"com.apple.MobileAssetError.Download" withCode:3];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
      [v8 trackAnomaly:@"_SUCoreBorder_MADownloadResultAtBegin" forReason:v11 withResult:8113 withError:0];

      v10 = 0LL;
      uint64_t v9 = 35LL;
    }
  }

  [MEMORY[0x189612760] sharedCore];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 completionQueue];
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MADownloadResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_18A0EFA88;
  id v18 = v6;
  uint64_t v19 = v9;
  id v17 = v10;
  id v14 = v10;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_MADownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:
{
  id v15 = a3;
  id v9 = a5;
  v10 = a6;
  uint64_t v11 = [v15 simAction];
  if (v11 == 3)
  {
    a4 = 0LL;
    id v13 = 0LL;
    id v12 = v9;
  }

  else
  {
    if (v11 == 1)
    {
      [MEMORY[0x1896127C8] sharedSimulator];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = 3LL;
      [v12 generateError:@"_SUCoreBorder_MADownloadResultAtEnd" ofDomain:@"com.apple.MobileAssetError.Download" withCode:3];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = v9;
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v15];
      [v12 trackAnomaly:@"_SUCoreBorder_MADownloadResultAtEnd" forReason:v14 withResult:8113 withError:0];
      id v13 = v9;
    }
  }

  v10[2](v10, a4, v13);
}

+ (void)_SUCoreBorder_MAPurgeResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v9 = 0LL;
    v10 = 0LL;
  }

  else
  {
    if (v7 == 1)
    {
      [MEMORY[0x1896127C8] sharedSimulator];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = 5LL;
      [v8 generateError:@"_SUCoreBorder_MAPurgeResultAtBegin" ofDomain:@"com.apple.MobileAssetError.Purge" withCode:5];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
      [v8 trackAnomaly:@"_SUCoreBorder_MAPurgeResultAtBegin" forReason:v11 withResult:8113 withError:0];

      v10 = 0LL;
      uint64_t v9 = 6LL;
    }
  }

  [MEMORY[0x189612760] sharedCore];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 completionQueue];
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __82__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAPurgeResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_18A0EFA88;
  id v18 = v6;
  uint64_t v19 = v9;
  id v17 = v10;
  id v14 = v10;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_MAPurgeResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:
{
  id v15 = a3;
  id v9 = a5;
  v10 = a6;
  uint64_t v11 = [v15 simAction];
  if (v11 == 3)
  {
    a4 = 0LL;
    id v13 = 0LL;
    id v12 = v9;
  }

  else
  {
    if (v11 == 1)
    {
      [MEMORY[0x1896127C8] sharedSimulator];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = 5LL;
      [v12 generateError:@"_SUCoreBorder_MAPurgeResultAtEnd" ofDomain:@"com.apple.MobileAssetError.Purge" withCode:5];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = v9;
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v15];
      [v12 trackAnomaly:@"_SUCoreBorder_MAPurgeResultAtEnd" forReason:v14 withResult:8113 withError:0];
      id v13 = v9;
    }
  }

  v10[2](v10, a4, v13);
}

+ (void)_SUCoreBorder_MACancelDownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 1)
  {
    uint64_t v8 = 4LL;
  }

  else if (v7 == 3)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v9 trackAnomaly:@"_SUCoreBorder_MACancelDownloadResultAtBegin" forReason:v10 withResult:8113 withError:0];

    uint64_t v8 = 5LL;
  }

  [MEMORY[0x189612760] sharedCore];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 completionQueue];
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __91__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MACancelDownloadResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_18A0EFAB0;
  id v15 = v6;
  uint64_t v16 = v8;
  id v13 = v6;
  dispatch_async(v12, block);
}

+ (void)_SUCoreBorder_MACancelDownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:
{
  id v11 = a3;
  uint64_t v7 = a5;
  uint64_t v8 = [v11 simAction];
  if (v8 == 1)
  {
    a4 = 4LL;
  }

  else if (v8 == 3)
  {
    a4 = 0LL;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v11];
    [v9 trackAnomaly:@"_SUCoreBorder_MACancelDownloadResultAtEnd" forReason:v10 withResult:8113 withError:0];
  }

  v7[2](v7, a4);
}

+ (void)_SUCoreBorder_MAOperationResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 1)
  {
    uint64_t v8 = 2LL;
  }

  else if (v7 == 3)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v9 trackAnomaly:@"_SUCoreBorder_MAOperationResultAtBegin" forReason:v10 withResult:8113 withError:0];

    uint64_t v8 = 4LL;
  }

  [MEMORY[0x189612760] sharedCore];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 completionQueue];
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __86__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAOperationResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_18A0EFAB0;
  id v15 = v6;
  uint64_t v16 = v8;
  id v13 = v6;
  dispatch_async(v12, block);
}

+ (void)_SUCoreBorder_MAOperationResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:
{
  id v11 = a3;
  uint64_t v7 = a5;
  uint64_t v8 = [v11 simAction];
  if (v8 == 1)
  {
    a4 = 2LL;
  }

  else if (v8 == 3)
  {
    a4 = 0LL;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v11];
    [v9 trackAnomaly:@"_SUCoreBorder_MAOperationResultAtEnd" forReason:v10 withResult:8113 withError:0];
  }

  v7[2](v7, a4);
}

+ (uint64_t)_SUCoreBorder_MABoolResultAtBegin:()SUCoreBorderMAAsset
{
  id v3 = a3;
  uint64_t v4 = [v3 simAction];
  if (v4 == 1) {
    goto LABEL_5;
  }
  if (v4 != 3)
  {
    [MEMORY[0x189612778] sharedDiag];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v3];
    [v6 trackAnomaly:@"_SUCoreBorder_MABoolResultAtBegin" forReason:v7 withResult:8113 withError:0];

LABEL_5:
    uint64_t v5 = 0LL;
    goto LABEL_6;
  }

  uint64_t v5 = 1LL;
LABEL_6:

  return v5;
}

+ (uint64_t)_SUCoreBorder_MABoolResultAtEnd:()SUCoreBorderMAAsset withResult:
{
  id v5 = a3;
  uint64_t v6 = [v5 simAction];
  if (v6 == 1)
  {
    a4 = 0LL;
  }

  else if (v6 == 3)
  {
    a4 = 1LL;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v7 trackAnomaly:@"_SUCoreBorder_MABoolResultAtEnd" forReason:v8 withResult:8113 withError:0];
  }

  return a4;
}

+ (id)_SUCoreBorder_MAAssetResultAtBegin:()SUCoreBorderMAAsset withDescriptor:type:error:
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 simAction];
  if (v12 == 3)
  {
    [a1 _getSimulatedAssetForDescriptor:v11 type:a5];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v12 == 1)
    {
      [v10 buildErrorWithDescription:@"SUCoreError created by _SUCoreBorder_MAAssetResultAtBegin"];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = 0LL;
      if (!a6) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    [MEMORY[0x189612778] sharedDiag];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v10];
    [v15 trackAnomaly:@"_SUCoreBorder_MAAssetResultAtBegin" forReason:v16 withResult:8113 withError:0];

    id v14 = 0LL;
  }

  id v13 = 0LL;
  if (a6) {
LABEL_8:
  }
    *a6 = v13;
LABEL_9:

  return v14;
}

+ (id)_SUCoreBorder_MAAssetResultAtEnd:()SUCoreBorderMAAsset withDescriptor:type:withResult:error:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a7) {
    id v15 = *a7;
  }
  else {
    id v15 = 0LL;
  }
  id v16 = v15;
  uint64_t v17 = [v12 simAction];
  if (v17 == 3)
  {
    [a1 _getSimulatedAssetForDescriptor:v13 type:a5];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = v16;
    id v16 = 0LL;
  }

  else if (v17 == 1)
  {

    [v12 buildErrorWithDescription:@"SUCoreError created by _SUCoreBorder_MAAssetResultAtEnd"];
    id v18 = 0LL;
    uint64_t v19 = v16;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v12];
    [v19 trackAnomaly:@"_SUCoreBorder_MAAssetResultAtEnd" forReason:v20 withResult:8113 withError:0];

    id v18 = v14;
  }

  if (a7) {
    *a7 = v16;
  }

  return v18;
}

+ (uint64_t)_SUCoreBorder_MAAssetState:()SUCoreBorderMAAsset
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if ([v3 simAction] != 3)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v3];
    [v7 trackAnomaly:@"_SUCoreBorder_MAAssetState" forReason:v8 withResult:8113 withError:0];

    uint64_t v6 = 0LL;
    goto LABEL_20;
  }

  [v3 assetState];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 isEqualToString:@"MAUnknown"];

  if ((v5 & 1) == 0)
  {
    [v3 assetState];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v9 isEqualToString:@"MANotPresent"];

    if ((v10 & 1) != 0)
    {
      uint64_t v6 = 1LL;
      goto LABEL_17;
    }

    [v3 assetState];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v11 isEqualToString:@"MAInstalled"];

    if ((v12 & 1) != 0)
    {
      uint64_t v6 = 2LL;
      goto LABEL_17;
    }

    [v3 assetState];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = [v13 isEqualToString:@"MAInstalledNotInCatalog"];

    if ((v14 & 1) != 0)
    {
      uint64_t v6 = 3LL;
      goto LABEL_17;
    }

    [v3 assetState];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v16 = [v15 isEqualToString:@"MADownloading"];

    if ((v16 & 1) != 0)
    {
      uint64_t v6 = 4LL;
      goto LABEL_17;
    }

    [v3 assetState];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    char v18 = [v17 isEqualToString:@"MARequiredByOs"];

    if ((v18 & 1) != 0)
    {
      uint64_t v6 = 5LL;
      goto LABEL_17;
    }

    [v3 assetState];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = [v19 isEqualToString:@"MAInstalledWithOs"];

    if ((v20 & 1) != 0)
    {
      uint64_t v6 = 6LL;
      goto LABEL_17;
    }

    [MEMORY[0x189612778] sharedDiag];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event asset state, event: %@", v3];
    [v25 trackAnomaly:@"_SUCoreBorder_MAAssetState" forReason:v26 withResult:8113 withError:0];
  }

  uint64_t v6 = 0LL;
LABEL_17:
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 oslog];
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    [v3 assetState];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v28 = v23;
    __int16 v29 = 2048;
    uint64_t v30 = v6;
    _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "[BORDER_MA_STATE] using simulated state:%@ (enum:%ld)",  buf,  0x16u);
  }

LABEL_20:
  return v6;
}

+ (id)_SUCoreBorder_MAAttributesAtBegin:()SUCoreBorderMAAsset
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = [v3 simAction];
  if (v4 == 3)
  {
    id v7 = objc_alloc(MEMORY[0x189603F68]);
    [v3 assetAttributesPlist];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (void *)[v7 initWithContentsOfFile:v8];

    [MEMORY[0x1896127A0] sharedLogger];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "[BORDER_MA_ATTRIBUTES] using simulated attributes:%@",  buf,  0xCu);
    }
  }

  else
  {
    if (v4 == 1)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      char v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 oslog];
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[BORDER_MA_ATTRIBUTES] simulating missing attributes",  buf,  2u);
      }
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      char v12 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v3];
      -[os_log_s trackAnomaly:forReason:withResult:withError:]( v6,  "trackAnomaly:forReason:withResult:withError:",  @"_SUCoreBorder_MAAttributesAtBegin",  v12,  8113LL,  0LL);
    }

    id v9 = 0LL;
  }

  return v9;
}

+ (id)_SUCoreBorder_MAAttributesAtEnd:()SUCoreBorderMAAsset withBaseAttributes:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    char v10 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v6];
    id v11 = objc_alloc(MEMORY[0x189603F68]);
    [v5 assetAttributesPlist];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = (void *)[v11 initWithContentsOfFile:v12];

    [MEMORY[0x1896127A0] sharedLogger];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v13;
      _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "[BORDER_MA_ATTRIBUTES] simulating additional/replaced attributes:%@",  buf,  0xCu);
    }

    [v10 addEntriesFromDictionary:v13];
  }

  else
  {
    if (v7 == 1)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 oslog];
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[BORDER_MA_ATTRIBUTES] simulating missing attributes",  buf,  2u);
      }
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
      -[os_log_s trackAnomaly:forReason:withResult:withError:]( v9,  "trackAnomaly:forReason:withResult:withError:",  @"_SUCoreBorder_MAAttributesAtEnd",  v16,  8113LL,  0LL);
    }

    char v10 = 0LL;
  }

  return v10;
}

+ (id)_getSimulatedAssetForDescriptor:()SUCoreBorderMAAsset type:
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 2)
  {
    [v5 documentationAssetType];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 productBuildVersion];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 productVersion];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 documentationID];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 documentationAssetPurpose];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    _getNewDocumentationMAAssetAttributesDictionary(v9, v10, v11, v13, v14);
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }

  if (a4 != 1)
  {
    [MEMORY[0x189612778] sharedDiag];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackAnomaly:@"_getSimulatedAssetForDescriptor" forReason:@"unsupported SUCoreBorderMobileAssetType" withResult:8113 withError:0];
    id v15 = 0LL;
    goto LABEL_11;
  }

  [v5 softwareUpdateAssetType];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int isUpdateBrainAssetType = _isUpdateBrainAssetType(v7);

  [v6 softwareUpdateAssetType];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 productBuildVersion];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isUpdateBrainAssetType)
  {
    [v6 productVersion];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 releaseType];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 prerequisiteBuild];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 prerequisiteOSVersion];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 softwareUpdateAssetPurpose];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    _getNewSoftwareUpdateMAAssetAttributesDictionary(v9, v10, v11, v13, v14, v16, v17);
    char v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }

  [v6 softwareUpdateAssetPurpose];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  _getNewUpdateBrainMAAssetAttributesDictionary(v9, v10, v11);
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  if (!v12)
  {
    id v15 = 0LL;
    goto LABEL_13;
  }

  id v15 = (void *)[objc_alloc(MEMORY[0x1896110E0]) initWithAttributes:v12];
LABEL_11:

LABEL_13:
  return v15;
}

- (void)_setCommonSplunkFields:()SUCoreBorderMAAsset withSessionId:
{
  id v6 = a4;
  id v7 = a3;
  [a1 attributes];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKey:@"_DownloadSize"];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = (void *)*MEMORY[0x1896129D0];
  if (v17) {
    id v10 = v17;
  }
  else {
    id v10 = (id)*MEMORY[0x1896129D0];
  }
  [v7 setSafeObject:v10 forKey:*MEMORY[0x189612950]];
  [a1 attributes];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:@"AssetType"];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = v9;
  }
  [v7 setSafeObject:v13 forKey:*MEMORY[0x189612930]];
  [a1 attributes];
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKey:@"Build"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v9;
  }
  [v7 setSafeObject:v16 forKey:*MEMORY[0x1896129B8]];
  [v7 setSafeObject:v6 forKey:*MEMORY[0x1896129C8]];
}

- (void)_prepAndSendDownloadStartedSplunkEvent:()SUCoreBorderMAAsset
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  [v6 setSafeObject:*MEMORY[0x189612990] forKey:*MEMORY[0x189612968]];
  [a1 _setCommonSplunkFields:v6 withSessionId:v4];

  [MEMORY[0x189612790] sharedReporter];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 sendEvent:v6];
}

- (void)_prepAndSendDownloadFinishedSplunkEvent:()SUCoreBorderMAAsset withError:withSessionId:
{
  id v13 = a4;
  id v8 = a5;
  id v9 = (void *)objc_opt_new();
  [v9 setSafeObject:*MEMORY[0x189612988] forKey:*MEMORY[0x189612968]];
  [MEMORY[0x189607968] numberWithInt:a3];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setSafeObject:v10 forKey:*MEMORY[0x189612948]];

  if (a3)
  {
    [v13 checkedNameForCode];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setSafeObject:v11 forKey:*MEMORY[0x189612940]];
  }

  [a1 _setCommonSplunkFields:v9 withSessionId:v8];
  [MEMORY[0x189612790] sharedReporter];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 sendEvent:v9];
}

@end