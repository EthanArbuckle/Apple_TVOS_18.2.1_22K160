@interface GKFriendRecommendationListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKFriendRecommendationListCacheObject

+ (id)entityName
{
  return @"FriendRecommendationList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKFriendRecommendationListEntryCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRecommendationListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKFriendRecommendationListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  2813));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___GKFriendRecommendationListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v27,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"recommendations"]);
  v16 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v15 count]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject entries](self, "entries"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _gkMapDictionaryWithKeyPath:@"playerID"]);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000CC5F4;
  v24[3] = &unk_100271370;
  v19 = v16;
  v25 = v19;
  id v20 = v18;
  id v26 = v20;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v15,  v24,  0LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject player](self, "player"));
  unsigned int v23 = [v22 isLocalPlayer];

  if (v23) {
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:familiarity:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "setFamiliarPlayerIDs:familiarity:",  v21,  4LL);
  }
  -[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]( self,  "populateFriendNamesFromServerRepresentationDictionary:",  v19);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRecommendationListCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKFriendRecommendationListCacheObject internalRepresentation]",  [v8 UTF8String],  2852));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject entries](self, "entries"));
  id v11 = [v10 count];

  v32 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v11);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject managedObjectContext](self, "managedObjectContext"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v31 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfilesWithPlayerIDs:inManagedObjectContext:",  v13,  v12));

  v30 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkMapDictionaryWithKeyPath:@"playerID"]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListCacheObject entries](self, "entries"));
  id v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 playerID]);
        if (v22)
        {
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v22]);
          if ([v23 familiarity] == 4)
          {
            id v24 = [[GKFriendRecommendationInternal alloc] initWithCacheObject:v23];
            v25 = (void *)objc_claimAutoreleasedReturnValue([v21 reason]);
            [v24 setReason:v25];

            id v26 = (void *)objc_claimAutoreleasedReturnValue([v21 reason2]);
            [v24 setReason2:v26];

            objc_super v27 = (void *)objc_claimAutoreleasedReturnValue([v21 rid]);
            objc_msgSend(v24, "setRid:", objc_msgSend(v27, "unsignedIntegerValue"));

            v28 = (void *)objc_claimAutoreleasedReturnValue([v21 source]);
            objc_msgSend(v24, "setSource:", objc_msgSend(v28, "integerValue"));

            -[NSMutableArray addObject:](v32, "addObject:", v24);
          }
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v18);
  }

  return v32;
}

@end