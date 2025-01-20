@interface NSIPCallbackSerialization
@end

@implementation NSIPCallbackSerialization

uint64_t __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 16LL));
  if ((v1 & 1) != 0) {
    __assert_rtn("-[_NSIPCallbackSerialization sendBeginBlock:]_block_invoke", "NSItemProvider.m", 106, "!_hasBegun");
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 16LL));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __43___NSIPCallbackSerialization_sendEndBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(uint64_t (***)(void))(a1 + 40);
  LOBYTE(v3) = atomic_load((unsigned __int8 *)(v3 + 16));
  if ((v3 & 1) != 0) {
    return v2[2]();
  }
  uint64_t result = [v2 copy];
  *(void *)(*(void *)(a1 + 32) + 8LL) = result;
  return result;
}

@end