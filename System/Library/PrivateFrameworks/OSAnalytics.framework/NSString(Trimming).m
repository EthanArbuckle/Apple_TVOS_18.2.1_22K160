@interface NSString(Trimming)
- (id)stringByTrimming;
- (id)stringByTrimmingColumnSensitive;
@end

@implementation NSString(Trimming)

- (id)stringByTrimming
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 stringByTrimmingCharactersInSet:v2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stringByTrimmingColumnSensitive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 stringByTrimmingCharactersInSet:v2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v3 isEqualToString:@"^"])
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"{column %lu}", objc_msgSend(a1, "length"));

    v3 = (void *)v4;
  }

  return v3;
}

@end