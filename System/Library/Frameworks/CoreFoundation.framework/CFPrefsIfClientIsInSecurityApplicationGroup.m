@interface CFPrefsIfClientIsInSecurityApplicationGroup
@end

@implementation CFPrefsIfClientIsInSecurityApplicationGroup

uint64_t ___CFPrefsIfClientIsInSecurityApplicationGroup_block_invoke(uint64_t a1, CFTypeRef cf1, _BYTE *a3)
{
  uint64_t result = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if ((_DWORD)result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *(void *)(a1 + 40);
    *a3 = 1;
  }

  return result;
}

@end