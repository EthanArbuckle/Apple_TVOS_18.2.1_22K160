@interface SUCorePurge
+ (void)_trackPurgeBegin:(id)a3;
+ (void)_trackPurgeBegin:(id)a3 withIdentifier:(id)a4;
+ (void)_trackPurgeEnd:(id)a3;
+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4;
+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
+ (void)_trackPurgeEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
+ (void)checkForAssetsOfType:(id)a3 completion:(id)a4;
+ (void)checkForAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)checkForExistingAssetsWithPolicy:(id)a3 completion:(id)a4;
+ (void)checkForExistingAssetsWithPolicy:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)checkForExistingPrepare:(id)a3;
+ (void)checkForExistingPrepareWithCompletionQueue:(id)a3 completion:(id)a4;
+ (void)previousUpdateState:(BOOL *)a3 tetheredRestore:(BOOL *)a4 failedBackward:(BOOL *)a5 failedForward:(BOOL *)a6;
+ (void)removeAllAssetsOfType:(id)a3 completion:(id)a4;
+ (void)removeAllAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)removeAllAssetsOfTypes:(id)a3 completion:(id)a4;
+ (void)removeAllAssetsOfTypes:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)removeAllUpdateContent:(id)a3;
+ (void)removeAllUpdateContentWithCompletionQueue:(id)a3 completion:(id)a4;
+ (void)removeAllUpdateContentWithPolicy:(id)a3 completion:(id)a4;
+ (void)removeAllUpdateContentWithPolicy:(id)a3 completionQueue:(id)a4 completion:(id)a5;
@end

@implementation SUCorePurge

+ (void)previousUpdateState:(BOOL *)a3 tetheredRestore:(BOOL *)a4 failedBackward:(BOOL *)a5 failedForward:(BOOL *)a6
{
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v26 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  +[SUCorePurge _trackPurgeBegin:]( &OBJC_CLASS___SUCorePurge,  "_trackPurgeBegin:",  @"MSURetrievePreviousUpdateState");
  if (SUCoreBorder_MSURetrievePreviousUpdateState())
  {
    switch(v26)
    {
      case 0u:
        [MEMORY[0x1896127A0] sharedLogger];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 oslog];
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "[PURGE] MSU previous update state:kMSUUpdateStateNone [tethered restore]",  buf,  2u);
        }

        if (!a4) {
          goto LABEL_30;
        }
        v13 = 0LL;
        *a4 = 1;
        break;
      case 1u:
        [MEMORY[0x1896127A0] sharedLogger];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 oslog];
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl( &dword_187A54000,  v21,  OS_LOG_TYPE_DEFAULT,  "[PURGE] MSU previous update state:kMSUUpdateStateSuccessful [successful OTA]",  v24,  2u);
        }

        if (!a3) {
          goto LABEL_30;
        }
        v13 = 0LL;
        *a3 = 1;
        break;
      case 2u:
        [MEMORY[0x1896127A0] sharedLogger];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 oslog];
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl( &dword_187A54000,  v16,  OS_LOG_TYPE_DEFAULT,  "[PURGE] MSU previous update state:kMSUUpdateStateFailedBackward [OTA attempt failed back to previous OS]",  v23,  2u);
        }

        if (!a5) {
          goto LABEL_30;
        }
        v13 = 0LL;
        *a5 = 1;
        break;
      case 3u:
        [MEMORY[0x1896127A0] sharedLogger];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 oslog];
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl( &dword_187A54000,  v18,  OS_LOG_TYPE_DEFAULT,  "[PURGE] MSU previous update state:kMSUUpdateStateFailedForward [OTA attempt encountered failure but continue d to the new OS]",  v22,  2u);
        }

        if (a6)
        {
          v13 = 0LL;
          *a6 = 1;
        }

        else
        {
LABEL_30:
          v13 = 0LL;
        }

        break;
      default:
        [MEMORY[0x189612760] sharedCore];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unknown previous update state: %d",  v26);
        [v14 buildError:8116 underlying:0 description:v19];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
    }
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 buildError:8802 underlying:0 description:@"MSURetrievePreviousUpdateState failed to provide state"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  }

  +[SUCorePurge _trackPurgeEnd:withResult:withError:]( SUCorePurge,  "_trackPurgeEnd:withResult:withError:",  @"MSURetrievePreviousUpdateState",  [v13 code],  v13);
  [MEMORY[0x189612760] endTransaction:v10 withName:@"purge.PreviousUpdateState"];
}

+ (void)checkForExistingPrepare:(id)a3
{
}

+ (void)checkForExistingPrepareWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x189612760] beginTransactionWithName:@"purge.CheckForExistingPrepare"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189612760] sharedCore];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 buildError:8113 underlying:0 description:@"checkForExistingPrepare not yet supported by MSU SPI"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 trackError:@"[PURGE]" forReason:@"checkForExistingPrepare not yet supported" withResult:8113 withError:v9];

  if (v6)
  {
    [MEMORY[0x189612760] sharedCore];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 selectCompletionQueue:v5];
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__SUCorePurge_checkForExistingPrepareWithCompletionQueue_completion___block_invoke;
    block[3] = &unk_18A0EF8F8;
    id v16 = v6;
    id v14 = v9;
    id v15 = v7;
    dispatch_async(v12, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:v7 withName:@"purge.CheckForExistingPrepare"];
  }
}

uint64_t __69__SUCorePurge_checkForExistingPrepareWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"purge.CheckForExistingPrepare"];
}

+ (void)checkForExistingAssetsWithPolicy:(id)a3 completion:(id)a4
{
}

+ (void)checkForExistingAssetsWithPolicy:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x189612760];
  id v10 = a3;
  [v9 beginTransactionWithName:@"purge.CheckForExistingAssets"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)[v10 copy];

  [v12 softwareUpdateAssetType];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke;
  v18[3] = &unk_18A0F0EB8;
  id v19 = v12;
  id v20 = v7;
  id v21 = v11;
  id v22 = v8;
  id v14 = v11;
  id v15 = v7;
  id v16 = v8;
  id v17 = v12;
  +[SUCorePurge checkForAssetsOfType:withCompletionQueue:completion:]( &OBJC_CLASS___SUCorePurge,  "checkForAssetsOfType:withCompletionQueue:completion:",  v13,  0LL,  v18);
}

void __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke( id *a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [a1[4] documentationAssetType];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_2;
  v10[3] = &unk_18A0F0E90;
  id v15 = a1[7];
  id v11 = v6;
  id v12 = a1[5];
  id v13 = v5;
  id v14 = a1[6];
  id v8 = v5;
  id v9 = v6;
  +[SUCorePurge checkForAssetsOfType:withCompletionQueue:completion:]( &OBJC_CLASS___SUCorePurge,  "checkForAssetsOfType:withCompletionQueue:completion:",  v7,  0LL,  v10);
}

void __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 64))
  {
    id v7 = *(id *)(a1 + 32);
    id v8 = v7;
    if (v6 && !v7) {
      id v8 = v6;
    }
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 selectCompletionQueue:*(void *)(a1 + 40)];
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_3;
    block[3] = &unk_18A0F0490;
    id v17 = *(id *)(a1 + 64);
    id v13 = v5;
    id v14 = *(id *)(a1 + 48);
    id v15 = v8;
    id v16 = *(id *)(a1 + 56);
    id v11 = v8;
    dispatch_async(v10, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 56) withName:@"purge.CheckForExistingAssets"];
  }
}

uint64_t __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_3( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 56) withName:@"purge.CheckForExistingAssets"];
}

+ (void)checkForAssetsOfType:(id)a3 completion:(id)a4
{
}

+ (void)checkForAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x189612760] sharedCore];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 waitedOperationQueue];
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke;
  block[3] = &unk_18A0F03F0;
  id v17 = v8;
  id v18 = v9;
  id v16 = v7;
  id v12 = v8;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(v11, block);
}

void __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v2 = (void *)[objc_alloc(MEMORY[0x1896110F0]) initWithType:*(void *)(a1 + 32)];
  [v2 setDoNotBlockBeforeFirstUnlock:1];
  [v2 returnTypes:1];
  uint64_t v3 = [v2 queryMetaDataSync];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to query for installed %@ assets (MAQuery domain)", *(void *)(a1 + 32)];
    [MEMORY[0x189612760] sharedCore];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 buildError:v4 underlying:0 description:v5];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189612778] sharedDiag];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 trackError:@"[PURGE]" forReason:v5 withResult:v4 withError:v7];

    id v9 = 0LL;
    if (!*(void *)(a1 + 48)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  [v2 assetIds];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896127A0] sharedLogger];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v9 count];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [v9 count];
    id v15 = @"s";
    *(_DWORD *)buf = 134218754;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    if (v14 == 1) {
      id v15 = &stru_18A0F22B0;
    }
    uint64_t v25 = v13;
    __int16 v26 = 2114;
    v27 = v15;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "[PURGE] MobileAsset found %ld installed %{public}@ asset%{public}@, assetIDs: %{public}@",  buf,  0x2Au);
  }

  if (*(void *)(a1 + 48))
  {
    if (v9 && ![v9 count])
    {

      id v7 = 0LL;
      id v9 = 0LL;
    }

    else
    {
      id v7 = 0LL;
    }

uint64_t __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke_216(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

+ (void)removeAllUpdateContent:(id)a3
{
}

+ (void)removeAllUpdateContentWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x189612760] sharedCore];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v7,  "buildError:underlying:description:",  8123,  0,  @"removeAllUpdateContent method has been deprecated, use removeAllUpdateContentWithPolicy instead");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v9,  "trackError:forReason:withResult:withError:",  @"PURGE",  @"removeAllUpdateContent method has been deprecated, use removeAllUpdateContentWithPolicy instead",  8123,  v8);

  if (v6)
  {
    [MEMORY[0x189612760] sharedCore];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 selectCompletionQueue:v5];
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __68__SUCorePurge_removeAllUpdateContentWithCompletionQueue_completion___block_invoke;
    v12[3] = &unk_18A0EFB00;
    id v14 = v6;
    id v13 = v8;
    dispatch_async(v11, v12);
  }
}

uint64_t __68__SUCorePurge_removeAllUpdateContentWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

+ (void)removeAllUpdateContentWithPolicy:(id)a3 completion:(id)a4
{
}

+ (void)removeAllUpdateContentWithPolicy:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x189612760] beginTransactionWithName:@"purge.RemoveAllUpdateContentWithPolicy"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189612760] sharedCore];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 waitedOperationQueue];
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke;
  v17[3] = &unk_18A0EFAD8;
  id v18 = v8;
  id v19 = v10;
  id v20 = v7;
  id v21 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(v12, v17);
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v25 = 0LL;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  __int16 v28 = __Block_byref_object_copy__7;
  id v29 = __Block_byref_object_dispose__7;
  uint64_t v2 = MEMORY[0x1895F87A8];
  id v30 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_221;
  v21[3] = &unk_18A0F0EE0;
  id v24 = a1[7];
  id v22 = a1[4];
  id v23 = a1[5];
  uint64_t v3 = (void *)MEMORY[0x1895B1904](v21);
  +[SUCorePurge _trackPurgeBegin:](&OBJC_CLASS___SUCorePurge, "_trackPurgeBegin:", @"MSUPurgeSuspendedUpdate");
  uint64_t v4 = SUCoreBorder_MSUPurgeSuspendedUpdate();
  id v5 = (void *)v26[5];
  v26[5] = v4;

  uint64_t v6 = [(id)v26[5] code];
  +[SUCorePurge _trackPurgeEnd:withResult:withError:]( &OBJC_CLASS___SUCorePurge,  "_trackPurgeEnd:withResult:withError:",  @"MSUPurgeSuspendedUpdate",  v6,  v26[5]);
  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [a1[6] assetTypeSummary];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    id v32 = v9;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[PURGE] removeAllUpdateContentWithPolicy is using provided policy asset types: %{public}@",  buf,  0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  [a1[6] softwareUpdateAssetType];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [a1[6] softwareUpdateAssetType];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v12];
  }

  [a1[6] documentationAssetType];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    [a1[6] documentationAssetType];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v14];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v10;
    _os_log_impl( &dword_187A54000,  v16,  OS_LOG_TYPE_DEFAULT,  "[PURGE] removing all assets with types: %{public}@",  buf,  0xCu);
  }

  +[SUCorePurge _trackPurgeBegin:](&OBJC_CLASS___SUCorePurge, "_trackPurgeBegin:", @"MAPurgeAll");
  v18[0] = v2;
  v18[1] = 3221225472LL;
  v18[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_224;
  v18[3] = &unk_18A0EF9E8;
  id v20 = &v25;
  id v17 = v3;
  id v19 = v17;
  SUCoreBorder_MAPurgeAll(v10, v18);

  _Block_object_dispose(&v25, 8);
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_221( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 48))
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 selectCompletionQueue:*(void *)(a1 + 32)];
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_2;
    block[3] = &unk_18A0EF8F8;
    id v9 = *(id *)(a1 + 48);
    id v7 = v3;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"purge.RemoveAllUpdateContentWithPolicy"];
  }
}

uint64_t __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_2( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"purge.RemoveAllUpdateContentWithPolicy"];
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_224( uint64_t a1,  void *a2)
{
  id v4 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:]( SUCorePurge,  "_trackPurgeEnd:withResult:withError:",  @"MAPurgeAll",  [v4 code],  v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  if (!v7) {
    objc_storeStrong(v6, a2);
  }
  [MEMORY[0x1896127A0] sharedLogger];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[PURGE] PreSUStaging: not supported for this platform; nothing to purge",
      v10,
      2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

+ (void)removeAllAssetsOfType:(id)a3 completion:(id)a4
{
}

+ (void)removeAllAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x189603F18];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_msgSend([v8 alloc], "initWithObjects:", v11, 0);

  [a1 removeAllAssetsOfTypes:v12 withCompletionQueue:v10 completion:v9];
}

+ (void)removeAllAssetsOfTypes:(id)a3 completion:(id)a4
{
}

+ (void)removeAllAssetsOfTypes:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x189612760] beginTransactionWithName:@"purge.RemoveAssetsOfType"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896127A0] sharedLogger];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v7;
    _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "[PURGE] removing all assets with types: %{public}@",  buf,  0xCu);
  }

  +[SUCorePurge _trackPurgeBegin:](&OBJC_CLASS___SUCorePurge, "_trackPurgeBegin:", @"MAPurgeAll");
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke;
  v16[3] = &unk_18A0F0EE0;
  id v18 = v10;
  id v19 = v9;
  id v17 = v8;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  SUCoreBorder_MAPurgeAll(v7, v16);
}

void __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:]( SUCorePurge,  "_trackPurgeEnd:withResult:withError:",  @"MAPurgeAll",  [v3 code],  v3);
  if (*(void *)(a1 + 48))
  {
    [MEMORY[0x189612760] sharedCore];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 selectCompletionQueue:*(void *)(a1 + 32)];
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_18A0EF8F8;
    id v9 = *(id *)(a1 + 48);
    id v7 = v3;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"purge.RemoveAssetsOfType"];
  }
}

uint64_t __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"purge.RemoveAssetsOfType"];
}

+ (void)_trackPurgeBegin:(id)a3
{
}

+ (void)_trackPurgeBegin:(id)a3 withIdentifier:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x189612778];
  id v6 = a4;
  id v7 = a3;
  [v5 sharedDiag];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 trackBegin:v7 atLevel:1 forModule:@"purge" withIdentifier:v6];
}

+ (void)_trackPurgeEnd:(id)a3
{
}

+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4
{
}

+ (void)_trackPurgeEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
}

+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v9 = (void *)MEMORY[0x189612778];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [v9 sharedDiag];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 trackEnd:v12 atLevel:1 forModule:@"purge" withIdentifier:v11 withResult:a5 withError:v10];
}

@end