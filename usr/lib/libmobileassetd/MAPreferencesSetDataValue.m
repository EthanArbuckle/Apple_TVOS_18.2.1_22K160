@interface MAPreferencesSetDataValue
@end

@implementation MAPreferencesSetDataValue

void ___MAPreferencesSetDataValue_block_invoke(uint64_t a1)
{
  char v2 = 1;
  do
  {
    CFPreferencesSetAppValue(*(CFStringRef *)(a1 + 32), *(CFPropertyListRef *)(a1 + 40), @"com.apple.MobileAsset");
    int v3 = CFPreferencesAppSynchronize(@"com.apple.MobileAsset");
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 40);
    if (v3)
    {
      if (v9) {
        v10 = @"[MA_PREFS] {%@} [%@] | Completed operation to update preference %@ %@ to data";
      }
      else {
        v10 = @"[MA_PREFS] {%@} [%@] | Completed operation to update preference %@ %@ to nil (clear)";
      }
      _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetDataValue_block_invoke",  v10,  v4,  v5,  v6,  v7,  (uint64_t)@"com.apple.MobileAsset");
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    }

    else if (v9)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetDataValue_block_invoke",  @"[MA_PREFS] {%@} [%@] | attemptsMade:%d | Unable to synchronize after setting preference %@ %@ to data",  v4,  v5,  v6,  v7,  v8);
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"_MAPreferencesSetDataValue_block_invoke",  @"[MA_PREFS] {%@} [%@] | attemptsMade:%d | Unable to synchronize after setting preference %@ %@ to nil (clear)",  v4,  v5,  v6,  v7,  v8);
    }

    char v11 = v2 & (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == 0);
    char v2 = 0;
  }

  while ((v11 & 1) != 0);
}

@end