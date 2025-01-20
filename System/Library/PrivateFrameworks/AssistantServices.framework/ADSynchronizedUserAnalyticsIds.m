@interface ADSynchronizedUserAnalyticsIds
- (ADSynchronizedUserAnalyticsIds)initWithUserEphemeralSeeds:(id)a3 andUserAggregationIds:(id)a4;
- (id)description;
@end

@implementation ADSynchronizedUserAnalyticsIds

- (ADSynchronizedUserAnalyticsIds)initWithUserEphemeralSeeds:(id)a3 andUserAggregationIds:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADSynchronizedUserAnalyticsIds;
  return -[ADSynchronizedIds initWithEphemeralSeeds:andAggregationIds:]( &v5,  "initWithEphemeralSeeds:andAggregationIds:",  a3,  a4);
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](self, "ephemeralSeeds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds aggregationIds](self, "aggregationIds"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"userEphemeralSeeds:(%@) userAggregationIds:(%@)",  v3,  v4));

  return v5;
}

@end