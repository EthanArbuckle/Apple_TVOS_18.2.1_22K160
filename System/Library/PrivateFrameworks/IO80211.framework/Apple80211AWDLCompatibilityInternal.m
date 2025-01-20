@interface Apple80211AWDLCompatibilityInternal
@end

@implementation Apple80211AWDLCompatibilityInternal

uint64_t ___Apple80211AWDLCompatibilityInternal_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -3931;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t ___Apple80211AWDLCompatibilityInternal_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -3931;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end