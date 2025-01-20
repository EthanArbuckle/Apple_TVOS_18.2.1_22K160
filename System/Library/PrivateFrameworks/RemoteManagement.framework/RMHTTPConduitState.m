@interface RMHTTPConduitState
- (id)reportDetails;
@end

@implementation RMHTTPConduitState

- (id)reportDetails
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RMHTTPConduitState;
  id v3 = -[RMConduitState reportDetails](&v18, "reportDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduitState chosenAuthenticationScheme](self, "chosenAuthenticationScheme"));
  [v5 setObject:v6 forKeyedSubscript:@"chosenAuthenticationScheme"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduitState localRetryAfterDate](self, "localRetryAfterDate"));
  [v5 setObject:v7 forKeyedSubscript:@"localRetryAfterDate"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[RMHTTPConduitState numberOfConsecutiveAuthErrors](self, "numberOfConsecutiveAuthErrors")));
  [v5 setObject:v8 forKeyedSubscript:@"numberOfConsecutiveAuthErrors"];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[RMHTTPConduitState numberOfConsecutiveErrors](self, "numberOfConsecutiveErrors")));
  [v5 setObject:v9 forKeyedSubscript:@"numberOfConsecutiveErrors"];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[RMHTTPConduitState numberOfConsecutiveFailures](self, "numberOfConsecutiveFailures")));
  [v5 setObject:v10 forKeyedSubscript:@"numberOfConsecutiveFailures"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduitState pushEnvironment](self, "pushEnvironment"));
  [v5 setObject:v11 forKeyedSubscript:@"pushEnvironment"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduitState pushTopic](self, "pushTopic"));
  [v5 setObject:v12 forKeyedSubscript:@"pushTopic"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduitState referralBaseURL](self, "referralBaseURL"));
  [v5 setObject:v13 forKeyedSubscript:@"referralBaseURL"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[RMHTTPConduitState referralCount](self, "referralCount")));
  [v5 setObject:v14 forKeyedSubscript:@"referralCount"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduitState serverRetryAfterDate](self, "serverRetryAfterDate"));
  [v5 setObject:v15 forKeyedSubscript:@"serverRetryAfterDate"];

  id v16 = [v5 copy];
  return v16;
}

@end