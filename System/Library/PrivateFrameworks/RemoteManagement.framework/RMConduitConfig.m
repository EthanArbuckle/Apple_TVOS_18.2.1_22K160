@interface RMConduitConfig
- (id)reportDetails;
@end

@implementation RMConduitConfig

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitConfig lastReceivedPushTimestamp](self, "lastReceivedPushTimestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"lastReceivedPushTimestamp");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitConfig lastReceivedCommandToken](self, "lastReceivedCommandToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"lastReceivedCommandToken");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitConfig lastReceivedDeclarationsToken](self, "lastReceivedDeclarationsToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"lastReceivedDeclarationsToken");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitConfig lastReceivedServerTokensTimestamp](self, "lastReceivedServerTokensTimestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"lastReceivedServerTokensTimestamp");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitConfig state](self, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 reportDetails]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"state");

  id v10 = -[NSMutableDictionary copy](v3, "copy");
  return v10;
}

@end