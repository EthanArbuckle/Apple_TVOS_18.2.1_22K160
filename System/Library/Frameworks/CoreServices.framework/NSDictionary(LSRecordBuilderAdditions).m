@interface NSDictionary(LSRecordBuilderAdditions)
- (uint64_t)_LS_BoolForKey:()LSRecordBuilderAdditions;
- (uint64_t)_LS_integerForKey:()LSRecordBuilderAdditions;
@end

@implementation NSDictionary(LSRecordBuilderAdditions)

- (uint64_t)_LS_BoolForKey:()LSRecordBuilderAdditions
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

- (uint64_t)_LS_integerForKey:()LSRecordBuilderAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  [a1 objectForKey:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0LL;
  }

  uint64_t v8 = [v6 integerValue];

  return v8;
}

@end