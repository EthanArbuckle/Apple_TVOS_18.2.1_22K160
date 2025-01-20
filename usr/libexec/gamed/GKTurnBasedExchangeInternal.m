@interface GKTurnBasedExchangeInternal
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKTurnBasedExchangeInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedExchangeInternal(Cache) updateWithCacheObject:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKTurnBasedExchangeInternal(Cache) updateWithCacheObject:]",  [v10 UTF8String],  406));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 session]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 participants]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 recipients]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 array]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000FB0B0;
  v31[3] = &unk_100272790;
  id v32 = v13;
  id v16 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 _gkMapWithBlock:v31]);
  -[GKTurnBasedExchangeInternal setRecipientIndexes:](self, "setRecipientIndexes:", v17);

  -[GKTurnBasedExchangeInternal setSenderIndex:]( self,  "setSenderIndex:",  [v4 senderIndex]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 exchangeID]);
  -[GKTurnBasedExchangeInternal setExchangeID:](self, "setExchangeID:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 statusString]);
  -[GKTurnBasedExchangeInternal setStatusString:](self, "setStatusString:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
  -[GKTurnBasedExchangeInternal setData:](self, "setData:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 localizableMessage]);
  id v23 = +[NSPropertyListSerialization _gkTypesafePropertyListWithData:withClass:]( &OBJC_CLASS___NSPropertyListSerialization,  "_gkTypesafePropertyListWithData:withClass:",  v21,  objc_opt_class(&OBJC_CLASS___NSDictionary, v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[GKTurnBasedExchangeInternal setLocalizableMessage:](self, "setLocalizableMessage:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 sendDate]);
  -[GKTurnBasedExchangeInternal setSendDate:](self, "setSendDate:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 timeoutDate]);
  -[GKTurnBasedExchangeInternal setTimeoutDate:](self, "setTimeoutDate:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 completionDate]);
  -[GKTurnBasedExchangeInternal setCompletionDate:](self, "setCompletionDate:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 replies]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 array]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 _gkMapWithBlock:&stru_100272838]);
  -[GKTurnBasedExchangeInternal setReplies:](self, "setReplies:", v30);
}

@end