@interface SecTrustGetNetworkFetchAllowed
@end

@implementation SecTrustGetNetworkFetchAllowed

__CFArray *__SecTrustGetNetworkFetchAllowed_block_invoke(uint64_t a1)
{
  result = SecTrustCopyOptionsFromPolicies(*(const __CFArray **)(*(void *)(a1 + 40) + 32LL));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

@end