@interface LSEnumerateViableBundlesOfClass
@end

@implementation LSEnumerateViableBundlesOfClass

uint64_t ___LSEnumerateViableBundlesOfClass_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 48);
  if (!v4 || *(_DWORD *)(a3 + 160) == v4)
  {
    uint64_t v5 = *(void *)(a3 + 164);
    result = _LSContainerGet();
    if ((v5 & 0x1000000040LL) == 0) {
      return (*(uint64_t (**)(void))(*(void *)(v3 + 32) + 16LL))();
    }
  }

  return result;
}

@end