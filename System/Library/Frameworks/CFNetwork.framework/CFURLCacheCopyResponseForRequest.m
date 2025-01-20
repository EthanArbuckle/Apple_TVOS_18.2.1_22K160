@interface CFURLCacheCopyResponseForRequest
@end

@implementation CFURLCacheCopyResponseForRequest

uint64_t ____CFURLCacheCopyResponseForRequest_block_invoke(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFTypeRef v3 = CFRetain(cf);
  }
  else {
    CFTypeRef v3 = 0LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end