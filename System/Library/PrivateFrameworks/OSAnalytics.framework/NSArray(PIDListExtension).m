@interface NSArray(PIDListExtension)
- (id)sortedPids;
@end

@implementation NSArray(PIDListExtension)

- (id)sortedPids
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 componentsJoinedByString:@","];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end