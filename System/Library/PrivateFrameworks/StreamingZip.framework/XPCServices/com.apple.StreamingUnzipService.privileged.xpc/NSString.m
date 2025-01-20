@interface NSString
- (NSString)SZ_stringByDeletingTrailingSlashes;
@end

@implementation NSString

- (NSString)SZ_stringByDeletingTrailingSlashes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self,  "stringByAppendingPathComponent:",  @"XX_REMOVEME_XX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByDeletingLastPathComponent]);

  return (NSString *)v3;
}

@end