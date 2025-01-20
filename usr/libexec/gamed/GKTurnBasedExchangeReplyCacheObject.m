@interface GKTurnBasedExchangeReplyCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKTurnBasedExchangeReplyCacheObject

+ (id)entityName
{
  return @"TurnBasedExchangeReply";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedExchangeReplyCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKTurnBasedExchangeReplyCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  4193));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GKTurnBasedExchangeReplyCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v19, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"slot"]);
  v13 = v12;
  if (v12) {
    -[GKTurnBasedExchangeReplyCacheObject setRecipientIndex:]( self,  "setRecipientIndex:",  [v12 integerValue]);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"message"]);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v14,  100LL,  0LL,  0LL));
    -[GKTurnBasedExchangeReplyCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", v15);
  }

  else
  {
    -[GKTurnBasedExchangeReplyCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", 0LL);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"data"]);
  -[GKTurnBasedExchangeReplyCacheObject setData:](self, "setData:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sent-at"]);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v17));
    -[GKTurnBasedExchangeReplyCacheObject setReplyDate:](self, "setReplyDate:", v18);
  }
}

- (id)internalRepresentation
{
  return 0LL;
}

@end