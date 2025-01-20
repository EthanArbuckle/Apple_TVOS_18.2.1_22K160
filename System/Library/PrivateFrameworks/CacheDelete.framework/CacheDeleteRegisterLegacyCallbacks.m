@interface CacheDeleteRegisterLegacyCallbacks
@end

@implementation CacheDeleteRegisterLegacyCallbacks

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (*(uint64_t (**)(void))(v2 + 16))();
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_error_impl( &dword_1874E4000,  v4,  OS_LOG_TYPE_ERROR,  "%@ has a PURGEABLE property, but the callback is NULL",  buf,  0xCu);
    }

    uint64_t v3 = 0LL;
  }

  getRootVolume();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  v3,  @"CACHE_DELETE_VOLUME",  @"CACHE_DELETE_AMOUNT",  v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:2];

  return v7;
}

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke_216(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v6 = [v5 longLongValue];
    if (v6 == -1)
    {
      CDGetLogHandle((uint64_t)"client");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1874E4000,  v7,  OS_LOG_TYPE_ERROR,  "Boot volume not included in info dict, returning nil",  buf,  2u);
      }

      uint64_t v8 = 0LL;
      goto LABEL_18;
    }
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v22 = 420;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v5;
      _os_log_error_impl(&dword_1874E4000, v9, OS_LOG_TYPE_ERROR, "%d num is not a number: %@", buf, 0x12u);
    }

    uint64_t v6 = 0LL;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  CDGetLogHandle((uint64_t)"client");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)v22 = v13;
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = v6;
      __int16 v23 = 1024;
      int v24 = a2;
      _os_log_impl(&dword_1874E4000, v12, OS_LOG_TYPE_DEFAULT, "calling %@'s purge with %lld at urgency %d", buf, 0x1Cu);
    }

    uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    CDGetLogHandle((uint64_t)"client");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)v22 = v15;
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = v14;
      _os_log_impl(&dword_1874E4000, v12, OS_LOG_TYPE_DEFAULT, "%@ returned: %lld", buf, 0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(void *)v22 = v18;
      _os_log_error_impl( &dword_1874E4000,  v12,  OS_LOG_TYPE_ERROR,  "%@ has a PURGE property, but the callback is NULL",  buf,  0xCu);
    }

    uint64_t v14 = 0LL;
  }

  getRootVolume();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  v14,  @"CACHE_DELETE_VOLUME",  @"CACHE_DELETE_AMOUNT",  v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  uint64_t v8 = [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:2];

LABEL_18:
  return v8;
}

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke_217(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 longLongValue];
  if (v6 == -1)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v7, a2);
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v15;
        _os_log_error_impl( &dword_1874E4000,  v11,  OS_LOG_TYPE_ERROR,  "%@ has periodic property in CacheDelete.plist, but a NULL callback",  buf,  0xCu);
      }

      uint64_t v9 = 0LL;
    }

    getRootVolume();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  v9,  @"CACHE_DELETE_VOLUME",  @"CACHE_DELETE_AMOUNT",  v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:2];
  }

  return v10;
}

@end