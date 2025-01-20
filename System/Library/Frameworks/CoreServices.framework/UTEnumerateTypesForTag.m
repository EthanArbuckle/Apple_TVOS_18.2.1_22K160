@interface UTEnumerateTypesForTag
@end

@implementation UTEnumerateTypesForTag

uint64_t ___UTEnumerateTypesForTag_block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if ((a3 & 3) == 0 && (a3 & 0xFFFFFFFC) != 0)
  {
    uint64_t v3 = result;
    result = CSStoreGetUnit();
    if (result) {
      return (*(uint64_t (**)(void))(*(void *)(v3 + 40) + 16LL))();
    }
  }

  return result;
}

@end