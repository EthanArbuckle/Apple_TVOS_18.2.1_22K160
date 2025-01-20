@interface AppleIDAuthenticationCopyCertificateInfo
@end

@implementation AppleIDAuthenticationCopyCertificateInfo

uint64_t ___AppleIDAuthenticationCopyCertificateInfo_block_invoke(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = cf;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      if (a3)
      {
        CFRetain(a3);
        v6 = *(void **)(a1 + 40);
      }

      void *v6 = a3;
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end