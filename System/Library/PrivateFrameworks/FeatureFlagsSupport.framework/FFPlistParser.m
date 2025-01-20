@interface FFPlistParser
- (id)parseSubscriptionsFromDictionary:(id)a3;
@end

@implementation FFPlistParser

- (id)parseSubscriptionsFromDictionary:(id)a3
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"SubscriptionClass"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"SubscriptionContents"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 isEqualToString:@"FFMinimumPhaseInReleaseSubscription"])
  {
    v6 = +[FFMinimumPhaseInReleaseSubscription decodeFromDictionary:]( &OBJC_CLASS___FFMinimumPhaseInReleaseSubscription,  "decodeFromDictionary:",  v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end