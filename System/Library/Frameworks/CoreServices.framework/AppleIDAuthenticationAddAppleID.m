@interface AppleIDAuthenticationAddAppleID
@end

@implementation AppleIDAuthenticationAddAppleID

uint64_t ___AppleIDAuthenticationAddAppleID_block_invoke(uint64_t a1, int a2, int a3, int a4, CFTypeRef cf)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    if (cf)
    {
      CFRetain(cf);
      v6 = *(void **)(a1 + 40);
    }

    void *v6 = cf;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end