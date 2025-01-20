@interface CacheDeletePurgeSpaceWithInfo
@end

@implementation CacheDeletePurgeSpaceWithInfo

void ___CacheDeletePurgeSpaceWithInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = ___CacheDeletePurgeSpaceWithInfo_block_invoke_2;
  v6[3] = &unk_18A065D40;
  __int128 v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  __int128 v7 = v5;
  [a2 clientPurge:v3 replyBlock:v6];
}

void ___CacheDeletePurgeSpaceWithInfo_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  CDGetLogHandle((uint64_t)"client");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [v3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl( &dword_1874E4000,  v4,  OS_LOG_TYPE_DEFAULT,  "_CacheDeletePurgeSpaceWithInfo purged: %{public}@ bytes from %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void ___CacheDeletePurgeSpaceWithInfo_block_invoke_234(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [a2 description];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v8 = v3;
    _os_log_error_impl(&dword_1874E4000, v4, OS_LOG_TYPE_ERROR, "Failed to purge space: %{public}@", buf, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    __int128 v5 = @"CACHE_DELETE_ERROR";
    v6 = v3;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

@end