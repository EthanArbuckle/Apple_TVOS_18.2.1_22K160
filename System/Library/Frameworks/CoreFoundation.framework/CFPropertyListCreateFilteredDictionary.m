@interface CFPropertyListCreateFilteredDictionary
@end

@implementation CFPropertyListCreateFilteredDictionary

BOOL ____CFPropertyListCreateFilteredDictionary_block_invoke(uint64_t a1, const __CFString *a2, _BYTE *a3)
{
  BOOL result = __CFPropertyListFilterKeyHasWildcard(a2);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -1LL;
    *a3 = 1;
  }

  return result;
}

@end