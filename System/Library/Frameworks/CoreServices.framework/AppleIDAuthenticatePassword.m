@interface AppleIDAuthenticatePassword
@end

@implementation AppleIDAuthenticatePassword

uint64_t ___AppleIDAuthenticatePassword_block_invoke(uint64_t a1, char a2, CFTypeRef cf)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      if (cf)
      {
        CFRetain(cf);
        v4 = *(void **)(a1 + 40);
      }

      void *v4 = cf;
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end