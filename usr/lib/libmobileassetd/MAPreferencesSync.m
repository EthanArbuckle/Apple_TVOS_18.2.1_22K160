@interface MAPreferencesSync
@end

@implementation MAPreferencesSync

BOOL ___MAPreferencesSync_block_invoke(uint64_t a1)
{
  BOOL result = syncPreferences(*(void **)(a1 + 32), *(void **)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

@end