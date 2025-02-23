@interface LSGetDMFPolicyNoCache
@end

@implementation LSGetDMFPolicyNoCache

void ___LSGetDMFPolicyNoCache_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    LaunchServices::DMFSupport::getLog(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___LSGetDMFPolicyNoCache_block_invoke_cold_1(a1, (uint64_t)v8, v9);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0LL;
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  }
}

void ___LSGetDMFPolicyNoCache_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Error requesting DMF policy for bundle ID %{private}@: %{public}@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1();
}

@end