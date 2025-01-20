@interface ADSynchronizedHomeAnalyticsIds
- (ADSynchronizedHomeAnalyticsIds)initWithHomeEphemeralSeeds:(id)a3;
- (id)description;
- (unint64_t)_populateNullAggregationIdsWithCreationTime:(id)a3 today:(id)a4;
@end

@implementation ADSynchronizedHomeAnalyticsIds

- (ADSynchronizedHomeAnalyticsIds)initWithHomeEphemeralSeeds:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADSynchronizedHomeAnalyticsIds;
  return -[ADSynchronizedIds initWithEphemeralSeeds:andAggregationIds:]( &v4,  "initWithEphemeralSeeds:andAggregationIds:",  a3,  0LL);
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](self, "ephemeralSeeds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"homeEphemeralSeeds:(%@)",  v2));

  return v3;
}

- (unint64_t)_populateNullAggregationIdsWithCreationTime:(id)a3 today:(id)a4
{
  return 0LL;
}

@end