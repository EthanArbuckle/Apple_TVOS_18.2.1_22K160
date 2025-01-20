@interface LSBundleDataIsIncomplete
@end

@implementation LSBundleDataIsIncomplete

void ___LSBundleDataIsIncomplete_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, _BYTE *a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v7 = _LSGetPlugin(*(void *)(a1 + 32), a3);
  if (v7 && !*(_DWORD *)(v7 + 132))
  {
    if ((*(_BYTE *)(v7 + 156) & 1) != 0 && *(_DWORD *)(v7 + 12))
    {
      _LSDefaultLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)_CSStringCopyCFString();
        int v10 = 134218242;
        uint64_t v11 = a3;
        __int16 v12 = 2114;
        v13 = v9;
        _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEFAULT,  "First-party plugin %llx (%{public}@) is malformed. Skipping during incompleteness check.",  (uint8_t *)&v10,  0x16u);
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      *a4 = 1;
    }
  }

@end