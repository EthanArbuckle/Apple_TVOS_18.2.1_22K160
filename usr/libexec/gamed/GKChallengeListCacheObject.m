@interface GKChallengeListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKChallengeListCacheObject

+ (id)entityName
{
  return @"ChallengeList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKChallengeCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v32 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKChallengeListCacheObject updateWithServerRepresentation:expirationDate:]",  v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "-[GKChallengeListCacheObject updateWithServerRepresentation:expirationDate:]",  [v12 UTF8String],  4437));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___GKChallengeListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v40,  "updateWithServerRepresentation:expirationDate:",  v6,  v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeListCacheObject managedObjectContext](self, "managedObjectContext"));
  v31 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"results"]);
  id v16 = [v15 count];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v16));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      v22 = 0LL;
      do
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v36 + 1) + 8 * (void)v22) objectForKeyedSubscript:@"challenge-id"]);
        if (v23) {
          [v17 addObject:v23];
        }

        v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v20);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[GKChallengeCacheObject challengesWithChallengeIDs:context:]( &OBJC_CLASS___GKChallengeCacheObject,  "challengesWithChallengeIDs:context:",  v17,  v14));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v16));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v24 _gkMapDictionaryWithKeyPath:@"challengeID"]);
  [v25 addEntriesFromDictionary:v26];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeListCacheObject player](self, "player"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 playerID]);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000D55B0;
  v33[3] = &unk_100271370;
  id v34 = v25;
  id v35 = v28;
  id v29 = v28;
  id v30 = v25;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v18,  v33,  0LL);
}

@end