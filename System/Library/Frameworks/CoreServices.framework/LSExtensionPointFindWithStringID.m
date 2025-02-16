@interface LSExtensionPointFindWithStringID
@end

@implementation LSExtensionPointFindWithStringID

void ___LSExtensionPointFindWithStringID_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7 = _LSGetExtensionPointData(*(void *)(a1 + 32), a3);
  if (v7)
  {
    uint64_t v8 = v7;
    if (*(_DWORD *)(v7 + 44) == *(_DWORD *)(a1 + 56))
    {
      int v9 = *(_DWORD *)(a1 + 60);
      if (v9)
      {
        if (*(_DWORD *)(v7 + 56) != v9) {
          return;
        }
      }

      else
      {
        _LSDefaultLog();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          ___LSExtensionPointFindWithStringID_block_invoke_cold_1(a3, v10, v11, v12, v13, v14, v15, v16);
        }
      }

      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v8;
      *a4 = 1;
    }
  }

void ___LSExtensionPointFindWithStringID_block_invoke_1( uint64_t a1,  uint64_t a2,  _DWORD *a3,  uint64_t a4,  _BYTE *a5)
{
  if (a3[10] == *(_DWORD *)(a1 + 48) && a3[11] == *(_DWORD *)(a1 + 52))
  {
    int v9 = *(_DWORD *)(a1 + 56);
    if (v9)
    {
      if (a3[14] != v9) {
        return;
      }
    }

    else
    {
      _LSDefaultLog();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        ___LSExtensionPointFindWithStringID_block_invoke_cold_1(a2, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
    *a5 = 1;
  }

void ___LSExtensionPointFindWithStringID_block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_0_7( &dword_183E58000,  a2,  a3,  "No extension point parent specified, returning first extension point found id: %u",  a5,  a6,  a7,  a8,  0);
}

@end