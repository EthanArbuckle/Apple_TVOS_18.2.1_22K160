@interface DPCGetRegisteredSubscriber
@end

@implementation DPCGetRegisteredSubscriber

BOOL ___DPCGetRegisteredSubscriber_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a2 + 128) == *(unsigned __int16 *)(a1 + 48)
    && *(unsigned __int16 *)(a2 + 130) == *(unsigned __int16 *)(a1 + 50)
    && DomainNameEqual(*(unsigned __int8 **)(*(void *)(a2 + 80) + 24LL), *(unsigned __int8 **)(a1 + 40)))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0LL;
}

@end