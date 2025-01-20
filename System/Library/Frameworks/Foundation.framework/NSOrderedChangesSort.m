@interface NSOrderedChangesSort
@end

@implementation NSOrderedChangesSort

uint64_t ___NSOrderedChangesSort_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  [**(id **)(a1 + 40) objectAtIndex:*(void *)(a1 + 48) + a2],  objc_msgSend(**(id **)(a1 + 40), "objectAtIndex:", *(void *)(a1 + 48) + a3));
}

@end