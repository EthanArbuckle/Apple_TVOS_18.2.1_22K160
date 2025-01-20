@interface LSBundleFindWithNode
@end

@implementation LSBundleFindWithNode

BOOL ___LSBundleFindWithNode_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _LSBundleMatchesNode( **(void ***)(a1 + 40),  *(_DWORD *)a3,  *(void *)(a3 + 8),  *(void **)(a1 + 32),  *(void *)(a1 + 48)) != 0;
}

uint64_t ___LSBundleFindWithNode_block_invoke_91(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  uint64_t result = _LSBundleMatchesNode( **(void ***)(a1 + 64),  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL),  *(void **)(a1 + 32),  *(void *)(a1 + 72));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    *a5 = 1;
  }

  return result;
}

void ___LSBundleFindWithNode_block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  v9 = (void *)MEMORY[0x186E2A59C]();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = _LSAliasMatchesPath_NoIO( **(void ***)(a1 + 64),  **(_DWORD **)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                             + 24LL),
                                                                 *(void **)(a1 + 32),
                                                                 0LL);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
    *a5 = 1;
  }
  objc_autoreleasePoolPop(v9);
}

@end