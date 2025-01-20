@interface LSBundleRemove
@end

@implementation LSBundleRemove

void ___LSBundleRemove_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  v5 = (void *)MEMORY[0x186E2A59C]();
  objc_autoreleasePoolPop(v5);
}

uint64_t ___LSBundleRemove_block_invoke_2(uint64_t a1)
{
  return _LSClaimRemove(*(void **)(a1 + 32));
}

uint64_t ___LSBundleRemove_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  return _UTTypeRemove(*(void **)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    v5 = *(__CFDictionary **)(a1 + 40);
    if (v5) {
      LSPluginAddInfoToPayloadDict(*(void **)(a1 + 32), v5, a3, 0LL, 0);
    }
  }

  _LSPluginRemove(*(void **)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_5(uint64_t a1, uint64_t a2, int a3)
{
}

uint64_t ___LSBundleRemove_block_invoke_7(uint64_t a1, uint64_t a2, int a3)
{
  return _LSPlistRemove(*(void *)(a1 + 32), a3);
}

@end