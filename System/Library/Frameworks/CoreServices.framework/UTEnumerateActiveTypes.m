@interface UTEnumerateActiveTypes
@end

@implementation UTEnumerateActiveTypes

uint64_t ___UTEnumerateActiveTypes_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(a3 + 8) & 1) != 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

@end