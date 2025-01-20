@interface CSSearchableItemAttributeSet
- (BOOL)hasLocationData;
@end

@implementation CSSearchableItemAttributeSet

- (BOOL)hasLocationData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet latitude](self, "latitude"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet longitude](self, "longitude"));
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end