@interface GKTurnBasedExchangeReplyInternal
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKTurnBasedExchangeReplyInternal

- (void)updateWithCacheObject:(id)a3
{
  id v17 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedExchangeReplyInternal(Cache) updateWithCacheObject:]",  v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v7,  "-[GKTurnBasedExchangeReplyInternal(Cache) updateWithCacheObject:]",  [v9 UTF8String],  439));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  -[GKTurnBasedExchangeReplyInternal setRecipientIndex:]( self,  "setRecipientIndex:",  [v17 recipientIndex]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v17 localizableMessage]);
  id v13 = +[NSPropertyListSerialization _gkTypesafePropertyListWithData:withClass:]( &OBJC_CLASS___NSPropertyListSerialization,  "_gkTypesafePropertyListWithData:withClass:",  v11,  objc_opt_class(&OBJC_CLASS___NSDictionary, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[GKTurnBasedExchangeReplyInternal setLocalizableMessage:](self, "setLocalizableMessage:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v17 data]);
  -[GKTurnBasedExchangeReplyInternal setData:](self, "setData:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v17 replyDate]);
  -[GKTurnBasedExchangeReplyInternal setReplyDate:](self, "setReplyDate:", v16);
}

@end