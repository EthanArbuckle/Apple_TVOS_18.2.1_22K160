@interface LSCheckAllContainerStates
@end

@implementation LSCheckAllContainerStates

uint64_t ___LSCheckAllContainerStates_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a3 + 2))
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    return _LSContainerCheckState(**(void ***)(result + 40), a2, a3, 0LL, 0LL);
  }

  return result;
}

@end