@interface MAsendPMVDownload
@end

@implementation MAsendPMVDownload

void ___MAsendPMVDownload_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1895A2258]();
  int64_t int64 = xpc_dictionary_get_int64(v3, "Result");
  if (v4 == MEMORY[0x1895F9268])
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAsendPMVDownload_block_invoke",  @"PMV download failed due to XPC",  v6,  v7,  v8,  v9,  v26);
    unint64_t v10 = 1LL;
  }

  else
  {
    unint64_t v10 = int64;
    if (int64 == 13)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAsendPMVDownload_block_invoke",  @"Will retry download PMV, after %ld seconds",  v6,  v7,  v8,  v9,  2LL);
        dispatch_time_t v11 = dispatch_time(0LL, 2000000000LL);
        getRetryXpcDelayQueue();
        v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = ___MAsendPMVDownload_block_invoke_2;
        block[3] = &unk_189FF9600;
        id v28 = *(id *)(a1 + 32);
        id v29 = *(id *)(a1 + 40);
        dispatch_after(v11, v12, block);

        v13 = 0LL;
LABEL_16:
        v22 = 0LL;
        goto LABEL_17;
      }

      unint64_t v10 = 13LL;
    }
  }

  if (!MAIsDownloadResultFailure(v10))
  {
    uint64_t v24 = getLoadDictionaryFromMessage(v3, @"productMarketingVersions");
    if (v24) {
      v13 = (void *)v24;
    }
    else {
      v13 = (void *)MEMORY[0x189604A60];
    }
    uint64_t v25 = *(void *)(a1 + 40);
    if (v25) {
      (*(void (**)(uint64_t, unint64_t, void *, void))(v25 + 16))(v25, v10, v13, 0LL);
    }
    goto LABEL_16;
  }

  uint64_t v14 = objc_opt_class();
  getLoadClassFromMessage(v3, @"CFNetworkError", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  errorStringForMADownloadResult(v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MAErrorForDownloadResultWithUnderlying( v10,  v15,  @"Failed downloading SoftwareLookup: %@",  v17,  v18,  v19,  v20,  v21,  (uint64_t)v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v23 = *(void *)(a1 + 40);
  if (v23) {
    (*(void (**)(uint64_t, unint64_t, void, void *))(v23 + 16))(v23, v10, 0LL, v22);
  }

  v13 = 0LL;
LABEL_17:
}

void ___MAsendPMVDownload_block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = ___MAsendPMVDownload_block_invoke_3;
  v2[3] = &unk_189FF97D0;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  _MAsendPMVDownload(v1, 0LL, v2);
}

uint64_t ___MAsendPMVDownload_block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end