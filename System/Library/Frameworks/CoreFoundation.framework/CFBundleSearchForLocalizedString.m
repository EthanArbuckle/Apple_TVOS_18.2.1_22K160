@interface CFBundleSearchForLocalizedString
@end

@implementation CFBundleSearchForLocalizedString

uint64_t ___CFBundleSearchForLocalizedString_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = ___CFBundleSearchForLocalizedString_block_invoke_2;
  v6[3] = &unk_1899ECCD8;
  uint64_t v9 = a2;
  uint64_t v10 = a4;
  __int128 v4 = *(_OWORD *)(a1 + 32);
  __int128 v8 = *(_OWORD *)(a1 + 48);
  __int128 v7 = v4;
  return CFDictionaryApply(a3, (uint64_t)v6);
}

uint64_t ___CFBundleSearchForLocalizedString_block_invoke_2( uint64_t a1,  const void *a2,  CFTypeRef cf1,  _BYTE *a4)
{
  uint64_t result = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if ((_DWORD)result)
  {
    if (*(void *)(a1 + 48))
    {
      uint64_t result = (uint64_t)CFRetain(a2);
      **(void **)(a1 + 48) = result;
    }

    if (*(void *)(a1 + 56))
    {
      uint64_t result = (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 64));
      **(void **)(a1 + 56) = result;
    }

    *a4 = 1;
    **(_BYTE **)(a1 + 72) = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  return result;
}

@end