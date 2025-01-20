@interface CacheDeleteCacheableForVolume
@end

@implementation CacheDeleteCacheableForVolume

void ___CacheDeleteCacheableForVolume_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    int v17 = 1331;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl( &dword_1874E4000,  v4,  OS_LOG_TYPE_DEFAULT,  "%d _CacheDeleteCacheableForVolume() calling remote clientGetState with key:%@",  buf,  0x12u);
  }

  v6 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = ___CacheDeleteCacheableForVolume_block_invoke_244;
  v11[3] = &unk_18A066050;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 56);
  id v12 = v7;
  uint64_t v14 = v8;
  __int128 v10 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v10;
  __int128 v13 = v10;
  uint64_t v15 = *(void *)(a1 + 64);
  [v3 clientGetState:v7 replyBlock:v11];
}

void ___CacheDeleteCacheableForVolume_block_invoke_244(void *a1, void *a2)
{
  uint64_t v121 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (const char *)a1[4];
    *(_DWORD *)buf = 67109634;
    int v106 = 1333;
    __int16 v107 = 2112;
    v108 = v5;
    __int16 v109 = 2112;
    uint64_t v110 = (uint64_t)v3;
    _os_log_impl( &dword_1874E4000,  v4,  OS_LOG_TYPE_DEFAULT,  "%d _CacheDeleteCacheableForVolume clientGetState: %@ : %@",  buf,  0x1Cu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v3 isEqual:MEMORY[0x189604A88]];
    v6 = (void *)MEMORY[0x189607968];
    [MEMORY[0x189603F50] distantFuture];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
    uint64_t v9 = *(void *)(a1[7] + 8LL);
    __int128 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    CDGetLogHandle((uint64_t)"client");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (const char *)a1[4];
      if (*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL)) {
        __int128 v13 = "TRUE";
      }
      else {
        __int128 v13 = "FALSE";
      }
      *(_DWORD *)buf = 67109634;
      int v106 = 1337;
      __int16 v107 = 2112;
      v108 = v12;
      __int16 v109 = 2080;
      uint64_t v110 = (uint64_t)v13;
      _os_log_impl( &dword_1874E4000,  v11,  OS_LOG_TYPE_DEFAULT,  "%d _CacheDeleteCacheableForVolume clientGetState: %@ : %s",  buf,  0x1Cu);
    }

@end