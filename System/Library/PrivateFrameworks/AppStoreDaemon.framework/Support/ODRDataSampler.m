@interface ODRDataSampler
- (id)currentStatsString;
- (id)takeSample;
@end

@implementation ODRDataSampler

- (id)takeSample
{
  return 0LL;
}

- (id)currentStatsString
{
  id v3 = sub_10027D574(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_10027D5E0(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_10027D508(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Min:%@, Max:%@, Avg:%@",  v4,  v6,  v8));

  return v9;
}

- (void).cxx_destruct
{
}

@end