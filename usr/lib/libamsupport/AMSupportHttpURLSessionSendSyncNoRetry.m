@interface AMSupportHttpURLSessionSendSyncNoRetry
@end

@implementation AMSupportHttpURLSessionSendSyncNoRetry

uint64_t ___AMSupportHttpURLSessionSendSyncNoRetry_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[a3 allHeaderFields];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [a3 statusCode];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end