@interface NSString(SZAdditions)
- (id)SZ_stringByDeletingTrailingSlashes;
@end

@implementation NSString(SZAdditions)

- (id)SZ_stringByDeletingTrailingSlashes
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 stringByDeletingLastPathComponent];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end