@interface MAsendPMVCancelDownload
@end

@implementation MAsendPMVCancelDownload

void ___MAsendPMVCancelDownload_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1895A2258]();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 4LL;
  if (v4 == MEMORY[0x1895F9268])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1LL;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAsendPMVCancelDownload_block_invoke",  @"Error on the cancel PMV download reply",  v5,  v6,  v7,  v8,  v16);
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_int64(v3, "Result");
    unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    stringForMACancelDownloadResult(v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAsendPMVCancelDownload_block_invoke",  @"Got the cancel PMV reply, response: %ld (%@)",  v10,  v11,  v12,  v13,  v9);
  }

  if (*(void *)(a1 + 32))
  {
    _getClientCallbackQueue();
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = ___MAsendPMVCancelDownload_block_invoke_2;
    block[3] = &unk_189FF9820;
    __int128 v18 = *(_OWORD *)(a1 + 32);
    id v15 = (id)v18;
    __int128 v20 = v18;
    dispatch_async(v14, block);
  }
}

void ___MAsendPMVCancelDownload_block_invoke_2(uint64_t a1)
{
  if (isCancelDownloadResultFailure(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)))
  {
    unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    errorStringForMACancelDownloadResult(v2);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForCancelDownloadResultWithUnderlying( v2,  0LL,  @"During software lookup: %@",  v4,  v5,  v6,  v7,  v8,  (uint64_t)v3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void ___MAsendPMVCancelDownload_block_invoke_3(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (isCancelDownloadResultFailure(v2))
  {
    errorStringForMACancelDownloadResult(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForCancelDownloadResultWithUnderlying( v2,  0LL,  @"Before software lookup: %@",  v4,  v5,  v6,  v7,  v8,  (uint64_t)v3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end