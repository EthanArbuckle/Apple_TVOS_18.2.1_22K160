@interface SCDynamicStoreReconnect
@end

@implementation SCDynamicStoreReconnect

uint64_t ____SCDynamicStoreReconnect_block_invoke(uint64_t a1)
{
  uint64_t result = __SCDynamicStoreAddSession(*(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

@end