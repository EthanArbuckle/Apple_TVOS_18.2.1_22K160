@interface GTTransportMessageReplyContinuation
@end

@implementation GTTransportMessageReplyContinuation

uint64_t __53__GTTransportMessageReplyContinuation_dispatchError___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    result = (*(uint64_t (**)(void))(*(void *)(v1 + 16) + 16LL))();
    *(_BYTE *)(*(void *)(v2 + 32) + 24LL) = 1;
  }

  return result;
}

@end