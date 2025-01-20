@interface GKFriendListCacheObject
+ (Class)entryClass;
+ (id)cacheFriendList:(id)a3 withTimeToLive:(double)a4 forProfile:(id)a5 managedObjectContext:(id)a6 commonFriends:(BOOL)a7;
+ (id)entityName;
- (NSArray)filterableFriends;
- (id)internalRepresentation;
- (id)playerIDs;
- (void)populateFriendNamesFromServerRepresentationDictionary:(id)a3;
@end

@implementation GKFriendListCacheObject

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKFriendListEntryCacheObject, a2);
}

+ (id)entityName
{
  return @"FriendList";
}

- (id)playerIDs
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendListCacheObject playerIDs]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKFriendListCacheObject playerIDs]",  [v8 UTF8String],  2430));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject entries](self, "entries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _gkValuesForKeyPath:@"playerID"]);

  return v11;
}

+ (id)cacheFriendList:(id)a3 withTimeToLive:(double)a4 forProfile:(id)a5 managedObjectContext:(id)a6 commonFriends:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v15, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKFriendListCacheObject cacheFriendList:withTimeToLive:forProfile:managedObjectContext:commonFriends:]",  v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v19 = objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v17,  "+[GKFriendListCacheObject cacheFriendList:withTimeToLive:forProfile:managedObjectContext:commonFriends:]",  [v19 UTF8String],  2440));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v20);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v22 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKFriendListCacheObject),  "initWithManagedObjectContext:",  v13);
  [v12 setFriendList:v22];
  -[GKFriendListCacheObject setExpirationDate:](v22, "setExpirationDate:", v21);
  -[GKFriendListCacheObject setCommon:](v22, "setCommon:", v7);
  -[GKFriendListCacheObject setPlayer:](v22, "setPlayer:", v12);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000CA548;
  v32[3] = &unk_100271400;
  id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v11 count]));
  id v33 = v23;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( v22,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v11,  v32,  0LL);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject player](v22, "player"));
  unsigned int v25 = [v24 isLocalPlayer];

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](v22, "playerIDs"));
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:familiarity:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "setFamiliarPlayerIDs:familiarity:",  v26,  2LL);
  }

  id v27 = [v23 copy];
  -[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]( v22,  "populateFriendNamesFromServerRepresentationDictionary:",  v27);

  v29 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v30 = (id)GKOSLoggers(v28);
    v29 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_1000D821C();
  }

  return v22;
}

- (void)populateFriendNamesFromServerRepresentationDictionary:(id)a3
{
  id v14 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v7,  "-[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]",  [v9 UTF8String],  2495));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  if ([v14 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject managedObjectContext](self, "managedObjectContext"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfilesWithPlayerIDs:inManagedObjectContext:",  v11,  v12));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000CA8FC;
    v15[3] = &unk_100271428;
    id v16 = v14;
    [v13 enumerateObjectsUsingBlock:v15];
  }
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendListCacheObject internalRepresentation]",  v5));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKFriendListCacheObject internalRepresentation]",  [v8 UTF8String],  2569));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject entries](self, "entries"));
  id v11 = [v10 count];

  v36 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v11);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject managedObjectContext](self, "managedObjectContext"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfilesWithPlayerIDs:inManagedObjectContext:",  v13,  v12));

  v32 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkDistinctValuesForKeyPath:@"lastPlayedGame"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v32 allObjects]);
  v34 = (void *)v12;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gamesForBundleIDs:context:]( &OBJC_CLASS___GKGameCacheObject,  "gamesForBundleIDs:context:",  v15,  v12));

  v31 = v16;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v16 _gkMapDictionaryWithKeyPath:@"bundleID"]);
  id v33 = v14;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkMapDictionaryWithKeyPath:@"playerID"]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject entries](self, "entries"));
  id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      v22 = 0LL;
      do
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v37 + 1) + 8 * (void)v22) playerID]);
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v23]);
          if ([v24 familiarity] == 2)
          {
            unsigned int v25 = -[GKFriendPlayerInternal initWithCacheObject:]( objc_alloc(&OBJC_CLASS___GKFriendPlayerInternal),  "initWithCacheObject:",  v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v24 lastPlayedGame]);

            if (v26)
            {
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 lastPlayedGame]);
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v27]);

              v29 = (void *)objc_claimAutoreleasedReturnValue([v28 internalRepresentation]);
              -[GKFriendPlayerInternal setLastPlayedGame:](v25, "setLastPlayedGame:", v29);
            }

            -[NSMutableArray addObject:](v36, "addObject:", v25);
          }
        }

        v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v20);
  }

  return v36;
}

- (NSArray)filterableFriends
{
  v2 = self;
  v3 = sub_100128A0C();

  type metadata accessor for GKFilterableFriend();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5);
  return (NSArray *)isa;
}

@end