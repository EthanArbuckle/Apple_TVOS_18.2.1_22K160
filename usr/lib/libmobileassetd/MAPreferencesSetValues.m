@interface MAPreferencesSetValues
@end

@implementation MAPreferencesSetValues

void ___MAPreferencesSetValues_block_invoke(uint64_t a1)
{
  for (char i = 1; ; char i = 0)
  {
    char v3 = i;
    [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_781];
    BOOL v4 = syncPreferences(*(void **)(a1 + 40), *(void **)(a1 + 48));
    if (v4) {
      break;
    }
    _MobileAssetLog( v4,  6,  (uint64_t)"_MAPreferencesSetValues_block_invoke",  @"%@ attempts:%d | Unable to synchronize after setting preferences with values %@",  v5,  v6,  v7,  v8,  *(void *)(a1 + 56));
    if ((v3 & 1) == 0) {
      return;
    }
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetValues_block_invoke",  @"%@ Completed operation to update preferences with values %@",  v5,  v6,  v7,  v8,  *(void *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
}

void ___MAPreferencesSetValues_block_invoke_2(id a1, NSString *a2, id a3, BOOL *a4)
{
}

@end