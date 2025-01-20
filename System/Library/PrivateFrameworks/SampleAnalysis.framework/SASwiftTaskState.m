@interface SASwiftTaskState
+ (id)classDictionaryKey;
- (void)baseFunctionAddress;
@end

@implementation SASwiftTaskState

- (void)baseFunctionAddress
{
  if (result)
  {
    [result threadState];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 leafUserFrame];
    for (i = (void *)objc_claimAutoreleasedReturnValue(); ; i = v6)
    {
      v3 = v1;
      v1 = i;

      v4 = v1 ? (void *)v1[4] : 0LL;
      id v5 = v4;

      if (!v5) {
        break;
      }
      if (v1) {
        v6 = (void *)v1[4];
      }
      else {
        v6 = 0LL;
      }
    }

    uint64_t v7 = [v1 address];

    return (void *)v7;
  }

  return result;
}

+ (id)classDictionaryKey
{
  return @"SASwiftTaskState";
}

@end