@interface BSXPCDecodeObject
@end

@implementation BSXPCDecodeObject

BOOL ___BSXPCDecodeObject_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  _BSXPCDecodeObjectFromContext(*(void *)(a1 + 32), v5, 0LL, *(void *)(a1 + 48), 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }

  else
  {
    rbs_coder_log();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___BSXPCDecodeObject_block_invoke_cold_1((uint64_t)v5, a2, v7);
    }
  }

  return v6 != 0LL;
}

BOOL ___BSXPCDecodeObject_block_invoke_180(uint64_t a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BSXPCDecodeObjectForKey(*(void *)(a1 + 32), v3, *(void *)(a1 + 56), 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v3);
  }

  return v4 != 0LL;
}

void ___BSXPCDecodeObject_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( &dword_185F67000,  log,  OS_LOG_TYPE_ERROR,  "Array element %zu failed to decode: %@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_0();
}

@end