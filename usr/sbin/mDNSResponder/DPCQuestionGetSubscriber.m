@interface DPCQuestionGetSubscriber
@end

@implementation DPCQuestionGetSubscriber

BOOL ___DPCQuestionGetSubscriber_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) == *(_DWORD *)(*(void *)(a2 + 56) + 96LL)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0LL;
}

@end