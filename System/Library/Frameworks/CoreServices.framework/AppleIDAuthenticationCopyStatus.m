@interface AppleIDAuthenticationCopyStatus
@end

@implementation AppleIDAuthenticationCopyStatus

uint64_t ___AppleIDAuthenticationCopyStatus_block_invoke(uint64_t a1, char a2, CFTypeRef cf, CFTypeRef a4)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
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

  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    if (a4)
    {
      CFRetain(a4);
      v8 = *(void **)(a1 + 48);
    }

    void *v8 = a4;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

@end