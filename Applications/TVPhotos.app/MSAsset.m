@interface MSAsset
- (BOOL)representsVideo;
@end

@implementation MSAsset

- (BOOL)representsVideo
{
  unint64_t v2 = (unint64_t)-[MSAsset mediaAssetType](self, "mediaAssetType");
  return v2 == 7 || (v2 & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

@end