@interface NSCFURLSessionConnection
@end

@implementation NSCFURLSessionConnection

uint64_t __66____NSCFURLSessionConnection_initWithTask_delegate_delegateQueue___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40LL))(a2);
  *(void *)(*(void *)(a1 + 32) + 64LL) = result;
  return result;
}

uint64_t __51____NSCFURLSessionConnection__storeCachedResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 16))( a2,  [*(id *)(a1 + 32) _CFCachedURLResponse],  *(void *)(*(void *)(a1 + 40) + 8));
}

@end