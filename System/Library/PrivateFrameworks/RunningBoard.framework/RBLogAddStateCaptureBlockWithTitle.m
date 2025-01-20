@interface RBLogAddStateCaptureBlockWithTitle
@end

@implementation RBLogAddStateCaptureBlockWithTitle

_DWORD *___RBLogAddStateCaptureBlockWithTitle_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 48) && *(_DWORD *)(a2 + 16) != 3) {
    return 0LL;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:v3 format:200 options:0 error:&v17];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v17;
  if (v4 && (unint64_t)([v4 length] + 200) <= 0x8000)
  {
    size_t v6 = [v4 length];
    v7 = calloc(1uLL, v6 + 200);
    _DWORD *v7 = 1;
    v7[1] = v6;
    [*(id *)(a1 + 32) UTF8String];
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)[v4 bytes], v6);
  }

  else
  {
    rbs_state_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9) {
        ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_2(a1, v5, v8);
      }
    }

    else if (v9)
    {
      ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_1(a1, v8, v10, v11, v12, v13, v14, v15);
    }

    v7 = 0LL;
  }

  return v7;
}

void ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_2(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  [a2 localizedDescription];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  BOOL v9 = v5;
  _os_log_error_impl( &dword_188634000,  a3,  OS_LOG_TYPE_ERROR,  "Error: RBLogAddStateCaptureBlockWithTitle(%@) state data format error: %@",  (uint8_t *)&v6,  0x16u);
}

@end