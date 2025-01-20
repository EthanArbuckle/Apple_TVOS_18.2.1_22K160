@interface CFXRegistrationPost
@end

@implementation CFXRegistrationPost

void ___CFXRegistrationPost_block_invoke(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  *(_OWORD *)v2 = *(_OWORD *)(a1 + 40);
  if (!*(_BYTE *)(a1 + 88)
    || CFXNotificationRegistrarValidateToken(*(void *)(*(void *)(a1 + 56) + 16LL), *(void *)(a1 + 64)))
  {
    __CFNOTIFICATIONCENTER_IS_CALLING_OUT_TO_AN_OBSERVER__( *(id *)(a1 + 56),  *(const char **)(a1 + 40),  *(void *)(a1 + 48),  *(void **)(a1 + 72),  *(void **)(a1 + 32),  *(void *)(a1 + 80));
  }

  CFXNotificationHandlerRelease(v2, *(void *)(a1 + 80));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  if ((*(_BYTE *)(a1 + 81) & 4) != 0) {
}
  }

@end