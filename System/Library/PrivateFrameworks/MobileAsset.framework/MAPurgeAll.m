@interface MAPurgeAll
@end

@implementation MAPurgeAll

uint64_t ___MAPurgeAll_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

@end