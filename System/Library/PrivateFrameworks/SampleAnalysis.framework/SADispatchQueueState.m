@interface SADispatchQueueState
+ (id)classDictionaryKey;
- (id)debugDescription;
@end

@implementation SADispatchQueueState

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dispatchQueue];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  id v5 = objc_alloc(MEMORY[0x189607940]);
  [v4 debugDescription];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SARecipeState thread](self, "thread");
  [v7 debugDescription];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v5 initWithFormat:@"%@ (%@)", v6, v8];
  v10 = -[SARecipeState threadState](self, "threadState");
  [v10 startTimestamp];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 endTimestamp];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = [v10 startSampleIndex];
  if (v11 == v12)
  {
    [v10 startTimestamp];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 debugDescription];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 appendFormat:@" at sample index %lu\n%@", v13, v16];
  }

  else
  {
    uint64_t v14 = [v10 endSampleIndex];
    [v10 startTimestamp];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 debugDescription];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 endTimestamp];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 debugDescription];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 appendFormat:@" at sample indexes %lu-%lu\nstart:%@\n  end:%@", v13, v14, v16, v18];
  }

  v19 = (void *)[v9 copy];
  return v19;
}

+ (id)classDictionaryKey
{
  return @"SADispatchQueueState";
}

@end