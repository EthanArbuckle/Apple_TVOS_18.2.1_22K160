@interface TVHKMediaItem
- (BOOL)tvh_isHighDefinition;
@end

@implementation TVHKMediaItem

- (BOOL)tvh_isHighDefinition
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaItem videoQuality](self, "videoQuality"));
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 unsignedIntegerValue] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end