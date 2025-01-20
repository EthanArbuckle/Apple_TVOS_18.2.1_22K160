@interface RMConduitState
- (id)reportDetails;
@end

@implementation RMConduitState

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitState enrollmentToken](self, "enrollmentToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"enrollmentToken");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  -[RMConduitState errorState](self, "errorState")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"errorState");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitState lastReceivedCommandToken](self, "lastReceivedCommandToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"lastReceivedCommandToken");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitState lastReceivedDeclarationsToken](self, "lastReceivedDeclarationsToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"lastReceivedDeclarationsToken");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitState lastReceivedServerTokensTimestamp](self, "lastReceivedServerTokensTimestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"lastReceivedServerTokensTimestamp");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitState lastProcessedCommandToken](self, "lastProcessedCommandToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"lastProcessedCommandToken");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMConduitState lastProcessedDeclarationsToken](self, "lastProcessedDeclarationsToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"lastProcessedDeclarationsToken");

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[RMConduitState lastReceivedServerTokensFromServerTimestamp]( self,  "lastReceivedServerTokensFromServerTimestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"lastReceivedServerTokensFromServerTimestamp");

  id v12 = -[NSMutableDictionary copy](v3, "copy");
  return v12;
}

@end