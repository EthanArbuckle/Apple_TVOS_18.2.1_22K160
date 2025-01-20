@interface GKTurnBasedExchangeCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 participants:(id)a4;
@end

@implementation GKTurnBasedExchangeCacheObject

+ (id)entityName
{
  return @"TurnBasedExchange";
}

- (void)updateWithServerRepresentation:(id)a3 participants:(id)a4
{
  id v6 = a3;
  id v58 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedExchangeCacheObject updateWithServerRepresentation:participants:]",  v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "-[GKTurnBasedExchangeCacheObject updateWithServerRepresentation:participants:]",  [v12 UTF8String],  4116));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  v67.receiver = self;
  v67.super_class = (Class)&OBJC_CLASS___GKTurnBasedExchangeCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v67, "updateWithServerRepresentation:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"request-id"]);
  v57 = v14;
  if ([v14 length]) {
    v15 = v14;
  }
  else {
    v15 = 0LL;
  }
  -[GKTurnBasedExchangeCacheObject setExchangeID:](self, "setExchangeID:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"status"]);
  -[GKTurnBasedExchangeCacheObject setStatusString:](self, "setStatusString:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"data"]);
  -[GKTurnBasedExchangeCacheObject setData:](self, "setData:", v17);

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"message"]);
  v56 = (void *)v18;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v18,  100LL,  0LL,  0LL));
    -[GKTurnBasedExchangeCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", v19);
  }

  else
  {
    -[GKTurnBasedExchangeCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", 0LL);
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"sent-at"]);
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v20));
    -[GKTurnBasedExchangeCacheObject setSendDate:](self, "setSendDate:", v21);
  }

  uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"timeout-at"]);
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v22));
    -[GKTurnBasedExchangeCacheObject setTimeoutDate:](self, "setTimeoutDate:", v23);
  }

  uint64_t v24 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"completed-at"]);
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v24));
    -[GKTurnBasedExchangeCacheObject setCompletionDate:](self, "setCompletionDate:", v25);
  }

  v53 = (void *)v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"from-slot"]);
  v27 = v26;
  if (v26) {
    -[GKTurnBasedExchangeCacheObject setSenderIndex:](self, "setSenderIndex:", [v26 integerValue]);
  }
  v52 = v27;
  v54 = (void *)v22;
  v55 = (void *)v20;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"to-slots"]);
  if (v28)
  {
    id v29 = [v58 count];
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    v31 = v28;
    id v32 = v28;
    id v33 = [v32 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v64;
      do
      {
        for (i = 0LL; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v64 != v35) {
            objc_enumerationMutation(v32);
          }
          int64_t v37 = (int64_t)[*(id *)(*((void *)&v63 + 1) + 8 * (void)i) integerValue];
          if ((v37 & 0x8000000000000000LL) == 0 || v37 < (uint64_t)v29)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:v37]);
            [v30 addObject:v38];
          }
        }

        id v34 = [v32 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }

      while (v34);
    }

    -[GKTurnBasedExchangeCacheObject setRecipients:](self, "setRecipients:", v30);
    v28 = v31;
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedExchangeCacheObject managedObjectContext](self, "managedObjectContext"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedExchangeCacheObject replies](self, "replies"));
  [v39 _gkDeleteObjects:v40];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"replies"]);
  if ([v41 count])
  {
    v50 = v28;
    id v51 = v6;
    v42 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [v41 count]);
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v43 = v41;
    id v44 = [v43 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v60;
      do
      {
        for (j = 0LL; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)j);
          v49 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKTurnBasedExchangeReplyCacheObject),  "initWithManagedObjectContext:",  v39);
          -[GKTurnBasedExchangeReplyCacheObject updateWithServerRepresentation:]( v49,  "updateWithServerRepresentation:",  v48);
          -[GKTurnBasedExchangeReplyCacheObject setExchange:](v49, "setExchange:", self);
          -[NSMutableOrderedSet addObject:](v42, "addObject:", v49);
        }

        id v45 = [v43 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }

      while (v45);
    }

    -[GKTurnBasedExchangeCacheObject setReplies:](self, "setReplies:", v42);
    v28 = v50;
    id v6 = v51;
  }
}

- (id)internalRepresentation
{
  return 0LL;
}

@end