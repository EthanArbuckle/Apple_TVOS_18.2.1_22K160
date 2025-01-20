@interface MAPreferencesSetStringValue
@end

@implementation MAPreferencesSetStringValue

void ___MAPreferencesSetStringValue_block_invoke(uint64_t a1)
{
  int v2 = 1;
  while (1)
  {
    _MAPreferencesSetKeyForValue(*(void **)(a1 + 32), *(void **)(a1 + 40));
    BOOL v3 = syncPreferences(*(void **)(a1 + 48), *(void **)(a1 + 56));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 64);
    if (v3) {
      break;
    }
    if (v8) {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetStringValue_block_invoke",  @"%@ attempts:%d | Unable to synchronize after setting preference %@ to string '%@'",  v4,  v5,  v6,  v7,  v9);
    }
    else {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetStringValue_block_invoke",  @"%@ attempts:%d | Unable to synchronize after setting preference %@ to nil (clear)",  v4,  v5,  v6,  v7,  v9);
    }
    if (++v2 != 2) {
      return;
    }
  }

  if (v8) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetStringValue_block_invoke",  @"%@ Completed operation to update preference %@ to string '%@'",  v4,  v5,  v6,  v7,  v9);
  }
  else {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetStringValue_block_invoke",  @"%@ Completed operation to update preference %@ to nil (clear)",  v4,  v5,  v6,  v7,  *(void *)(a1 + 64));
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
}

@end