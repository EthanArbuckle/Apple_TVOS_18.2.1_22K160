@interface AppleIDAuthenticationCopyAppleIDsWithBlock
@end

@implementation AppleIDAuthenticationCopyAppleIDsWithBlock

void ___AppleIDAuthenticationCopyAppleIDsWithBlock_block_invoke(uint64_t a1, const void *a2, int a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    v6 = (os_log_s *)AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_ERROR,  "SFAppleIDClientCopyMyAppleID failed with error %d\n",  (uint8_t *)v11,  8u);
    }

    v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  }

  else
  {
    v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    if (Mutable)
    {
      CFErrorRef v8 = Mutable;
      if (a2) {
        CFArrayAppendValue(Mutable, a2);
      }
      (*(void (**)(uint64_t, CFErrorRef, void))(v4 + 16))(v4, v8, 0LL);
      goto LABEL_13;
    }

    v7 = v9;
  }

  CFErrorRef v8 = CFErrorCreate(v7, @"CSIdentityErrorDomain", -11LL, 0LL);
  (*(void (**)(uint64_t, void, CFErrorRef))(v4 + 16))(v4, 0LL, v8);
  if (!v8)
  {
    if (!a2) {
      return;
    }
    goto LABEL_7;
  }

@end