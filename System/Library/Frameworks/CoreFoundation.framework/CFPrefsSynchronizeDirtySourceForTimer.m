@interface CFPrefsSynchronizeDirtySourceForTimer
@end

@implementation CFPrefsSynchronizeDirtySourceForTimer

uint64_t ___CFPrefsSynchronizeDirtySourceForTimer_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) createDiskWrite];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

@end