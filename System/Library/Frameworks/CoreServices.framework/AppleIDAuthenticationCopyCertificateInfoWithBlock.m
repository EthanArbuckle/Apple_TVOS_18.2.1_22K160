@interface AppleIDAuthenticationCopyCertificateInfoWithBlock
@end

@implementation AppleIDAuthenticationCopyCertificateInfoWithBlock

void ___AppleIDAuthenticationCopyCertificateInfoWithBlock_block_invoke( uint64_t a1,  CFDictionaryRef theDict,  int a3)
{
  CFErrorRef v3 = theDict;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    v6 = (os_log_s *)AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = a3;
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_ERROR,  "SFAppleIDClientCopyCertificate failed with error %d\n",  (uint8_t *)v10,  8u);
    }

    CFErrorRef v7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"CSIdentityErrorDomain", -11LL, 0LL);
    (*(void (**)(uint64_t, void, CFErrorRef))(v4 + 16))(v4, 0LL, v7);
    if (v7) {
      CFRelease(v7);
    }
    goto LABEL_12;
  }

  if (!theDict)
  {
    v9 = (os_log_s *)AppleIDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_183E58000, v9, OS_LOG_TYPE_ERROR, "Unexpected empty certificate info\n", (uint8_t *)v10, 2u);
    }

    CFErrorRef v3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"CSIdentityErrorDomain", -11LL, 0LL);
    (*(void (**)(uint64_t, void, CFErrorRef))(v4 + 16))(v4, 0LL, v3);
LABEL_12:
    if (!v3) {
      return;
    }
    goto LABEL_13;
  }

  CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], theDict);
  (*(void (**)(uint64_t, CFDictionaryRef, void))(v4 + 16))(v4, Copy, 0LL);
  if (Copy) {
    CFRelease(Copy);
  }
LABEL_13:
  CFRelease(v3);
}

@end