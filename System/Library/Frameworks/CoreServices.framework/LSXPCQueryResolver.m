@interface LSXPCQueryResolver
@end

@implementation LSXPCQueryResolver

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1895F87A8];
  v8[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v8[1] = (void (*)(void, void))3221225472LL;
  v8[2] = (void (*)(void, void))__59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2;
  v8[3] = (void (*)(void, void))&unk_189D72338;
  v8[4] = *(void (**)(void, void))(a1 + 40);
  v3 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v8);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = v2;
  v6[1] = 3221225472LL;
  v6[2] = __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119;
  v6[3] = &unk_189D781B8;
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v3 resolveQueries:v4 legacySPI:v5 completionHandler:v6];
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = a1 + 32;
  objc_storeStrong((id *)(*(void *)(v6 + 8) + 40LL), a2);
  _LSDefaultLog();
  int8x16_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2_cold_1(v5, v7, v8);
  }
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119( uint64_t a1,  void *a2,  void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    if (![*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
      goto LABEL_8;
    }

    uint64_t v8 = (void *)[v6 mutableCopy];
    [v8 addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  else
  {
    _LSDefaultLog();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
      __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119_cold_1( (uint64_t)v7,  (os_log_s *)v8);
    }
  }

LABEL_8:
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v7;
}

void __80___LSXPCQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x186E2A59C]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v3);
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8LL) + 40LL);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5(&dword_183E58000, a2, a3, "Error fetching database info from lsd: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119_cold_1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_DEBUG,  "Error resolving queries: %{public}@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

@end