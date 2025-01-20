@interface NSURLRequest
- (unint64_t)asset_rangeOffset;
@end

@implementation NSURLRequest

- (unint64_t)asset_rangeOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLProtocol propertyForKey:inRequest:]( &OBJC_CLASS___NSURLProtocol,  "propertyForKey:inRequest:",  @"AssetRequetPropertyRangeOffset",  self));
  id v3 = [v2 unsignedLongLongValue];

  return (unint64_t)v3;
}

@end