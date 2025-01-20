@interface RMMDMConduitState
- (id)reportDetails;
@end

@implementation RMMDMConduitState

- (id)reportDetails
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RMMDMConduitState;
  id v3 = -[RMConduitState reportDetails](&v12, "reportDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduitState localRetryAfterDate](self, "localRetryAfterDate"));
  [v5 setObject:v6 forKeyedSubscript:@"localRetryAfterDate"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[RMMDMConduitState numberOfConsecutiveErrors](self, "numberOfConsecutiveErrors")));
  [v5 setObject:v7 forKeyedSubscript:@"numberOfConsecutiveErrors"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[RMMDMConduitState numberOfConsecutiveFailures](self, "numberOfConsecutiveFailures")));
  [v5 setObject:v8 forKeyedSubscript:@"numberOfConsecutiveFailures"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduitState serverRetryAfterDate](self, "serverRetryAfterDate"));
  [v5 setObject:v9 forKeyedSubscript:@"serverRetryAfterDate"];

  id v10 = [v5 copy];
  return v10;
}

@end