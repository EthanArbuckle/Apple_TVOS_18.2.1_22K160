@interface AppleIDAuthenticationForgetAppleIDWithBlock
@end

@implementation AppleIDAuthenticationForgetAppleIDWithBlock

void ___AppleIDAuthenticationForgetAppleIDWithBlock_block_invoke(uint64_t a1)
{
  CFErrorRef v2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"CSIdentityErrorDomain", -114LL, 0LL);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (v2) {
    CFRelease(v2);
  }
}

@end