@interface MAensureExtension
@end

@implementation MAensureExtension

void ___MAensureExtension_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }
  }

uint64_t ___MAensureExtension_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

@end