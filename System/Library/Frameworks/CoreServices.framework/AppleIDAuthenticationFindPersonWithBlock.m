@interface AppleIDAuthenticationFindPersonWithBlock
@end

@implementation AppleIDAuthenticationFindPersonWithBlock

void ___AppleIDAuthenticationFindPersonWithBlock_block_invoke(uint64_t a1, const __CFArray *a2, int a3)
{
  v11[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    v6 = (os_log_s *)AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v11[0]) = 67109120;
      HIDWORD(v11[0]) = a3;
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_ERROR,  "SFAppleIDClientCopyPersonInfo failed with error %d\n",  (uint8_t *)v11,  8u);
    }

    v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  }

  else
  {
    v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    if (Mutable)
    {
      CFErrorRef v8 = Mutable;
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 0x40000000LL;
      v11[2] = ___ZL41handleSFAppleIDClientCopyPersonInfoResultPK9__CFArrayiU13block_pointerFvS1_hP9__CFErrorE_block_invoke;
      v11[3] = &__block_descriptor_tmp_54;
      v11[4] = Mutable;
      CFArrayApplyBlock(a2, (uint64_t)v11);
      (*(void (**)(uint64_t, CFErrorRef, uint64_t, void))(v4 + 16))(v4, v8, 1LL, 0LL);
      goto LABEL_11;
    }

    v7 = v9;
  }

  CFErrorRef v8 = CFErrorCreate(v7, @"CSIdentityErrorDomain", -11LL, 0LL);
  (*(void (**)(uint64_t, void, uint64_t, CFErrorRef))(v4 + 16))(v4, 0LL, 1LL, v8);
  if (!v8)
  {
    if (!a2) {
      return;
    }
    goto LABEL_7;
  }

@end