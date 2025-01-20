@interface PHAssetCollection
+ (id)slideshowCompatibleSubtypes;
+ (int64_t)parentTypeForSubtype:(int64_t)a3;
- (BOOL)isSlideshowCompatible;
@end

@implementation PHAssetCollection

- (BOOL)isSlideshowCompatible
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection slideshowCompatibleSubtypes]( &OBJC_CLASS___PHAssetCollection,  "slideshowCompatibleSubtypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype")));
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

+ (id)slideshowCompatibleSubtypes
{
  return &off_1000D1C60;
}

+ (int64_t)parentTypeForSubtype:(int64_t)a3
{
  if (a3 > 199)
  {
    if ((unint64_t)(a3 - 200) <= 0x13 && ((1LL << (a3 + 56)) & 0x83FFF) != 0
      || (unint64_t)(a3 - 1000000205) <= 0xE && ((1LL << (a3 + 51)) & 0x6281) != 0)
    {
      return 2LL;
    }

    if (a3 == 1050000590) {
      return 4LL;
    }
    return 0LL;
  }

  int64_t result = 1LL;
  return result;
}

@end