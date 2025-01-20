@interface NSSet
- (id)adpm_sortedKeyString;
@end

@implementation NSSet

- (id)adpm_sortedKeyString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self, "allObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@":"]);

  return v4;
}

@end