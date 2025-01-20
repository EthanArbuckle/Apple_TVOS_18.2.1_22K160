@interface AppleIDAuthenticationCopyMyInfo
@end

@implementation AppleIDAuthenticationCopyMyInfo

uint64_t ___AppleIDAuthenticationCopyMyInfo_block_invoke(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = cf;
  if (a3 && *(void *)(a1 + 40))
  {
    CFRetain(a3);
    **(void **)(a1 + 40) = a3;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end