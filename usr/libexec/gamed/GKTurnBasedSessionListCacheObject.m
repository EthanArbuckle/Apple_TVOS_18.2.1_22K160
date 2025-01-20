@interface GKTurnBasedSessionListCacheObject
+ (Class)entryClass;
+ (id)entityName;
+ (void)expireListsForSessionID:(id)a3 context:(id)a4;
- (id)internalRepresentation;
- (id)sessionIDs;
- (id)sessions;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKTurnBasedSessionListCacheObject

+ (id)entityName
{
  return @"TurnBasedSessionList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKTurnBasedSessionEntryCacheObject, a2);
}

- (id)sessionIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject entries](self, "entries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _gkValuesForKeyPath:@"sessionID"]);

  return v3;
}

- (id)sessions
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionListCacheObject sessions]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKTurnBasedSessionListCacheObject sessions]",  [v8 UTF8String],  4237));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject sessionIDs](self, "sessionIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject managedObjectContext](self, "managedObjectContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]( &OBJC_CLASS___GKTurnBasedSessionCacheObject,  "sessionsWithSessionIDs:inContext:",  v10,  v11));

  return v12;
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionListCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKTurnBasedSessionListCacheObject internalRepresentation]",  [v8 UTF8String],  4244));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject sessions](self, "sessions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) internalRepresentation]);
        [v11 addObject:v17];

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  return v11;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionListCacheObject updateWithServerRepresentation:expirationDate:]",  v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "-[GKTurnBasedSessionListCacheObject updateWithServerRepresentation:expirationDate:]",  [v12 UTF8String],  4257));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___GKTurnBasedSessionListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v41,  "updateWithServerRepresentation:expirationDate:",  v6,  v33);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject managedObjectContext](self, "managedObjectContext"));
  v32 = v6;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"sessions"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v15 count]));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject entries](self, "entries"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _gkMapDictionaryWithKeyPath:@"sessionID"]);

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000D4598;
  v38[3] = &unk_100271370;
  id v19 = v16;
  id v39 = v19;
  id v20 = v18;
  id v40 = v20;
  v30 = v15;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v15,  v38,  0LL);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 allKeys]);
  v31 = (void *)v14;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]( &OBJC_CLASS___GKTurnBasedSessionCacheObject,  "sessionsWithSessionIDs:inContext:",  v21,  v14));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 sessionID]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v28]);
        [v27 updateWithServerRepresentation:v29];
      }

      id v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }

    while (v24);
  }
}

+ (void)expireListsForSessionID:(id)a3 context:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v7, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKTurnBasedSessionListCacheObject expireListsForSessionID:context:]",  v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v11 = objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v9,  "+[GKTurnBasedSessionListCacheObject expireListsForSessionID:context:]",  [v11 UTF8String],  4294));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"sessionID = %@",  v15));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheObject objectsMatchingPredicate:context:]( &OBJC_CLASS___GKTurnBasedSessionEntryCacheObject,  "objectsMatchingPredicate:context:",  v13,  v5));

  [v14 enumerateObjectsUsingBlock:&stru_100271650];
}

@end