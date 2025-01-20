@interface LSCopyPluginsWithURL
@end

@implementation LSCopyPluginsWithURL

void ___LSCopyPluginsWithURL_block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  v6 = (void *)MEMORY[0x186E2A59C]();
  if (_LSAliasMatchesPath_NoIO( **(void ***)(a1 + 48),  *a3,  *(void **)(a1 + 32),  2LL * (*(_BYTE *)(a1 + 56) != 0)))
  {
    v7 = *(__CFArray **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (!v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605228]);
      v7 = *(__CFArray **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }

    CFArrayAppendValue(v7, (const void *)[MEMORY[0x189607968] numberWithUnsignedInt:a2]);
  }

  objc_autoreleasePoolPop(v6);
}

@end