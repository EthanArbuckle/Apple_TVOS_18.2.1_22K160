@interface GKFriendRequestListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKFriendRequestListCacheObject

+ (id)entityName
{
  return @"FriendRequestList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKFriendRequestListEntryCacheObject, a2);
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRequestListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKFriendRequestListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  2930));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject managedObjectContext](self, "managedObjectContext"));
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___GKFriendRequestListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v32,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"results"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject entries](self, "entries"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _gkMapDictionaryWithKeyPath:@"playerID"]);

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000CD248;
  v30[3] = &unk_100271400;
  id v19 = v18;
  id v31 = v19;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v16,  v30,  0LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject player](self, "player"));
  unsigned int v22 = [v21 isLocalPlayer];

  if (v22) {
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:familiarity:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "setFamiliarPlayerIDs:familiarity:",  v20,  3LL);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v16 _gkMapDictionaryWithKeyPath:@"playerID"]);
  -[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]( self,  "populateFriendNamesFromServerRepresentationDictionary:",  v23);
  v24 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[GKFriendRequestListEntryCacheObject entityName]( &OBJC_CLASS___GKFriendRequestListEntryCacheObject,  "entityName"));
  v26 = -[NSFetchRequest initWithEntityName:](v24, "initWithEntityName:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"wasViewed == NO"));
  -[NSFetchRequest setPredicate:](v26, "setPredicate:", v27);

  id v28 = [v15 countForFetchRequest:v26 error:0];
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](&OBJC_CLASS___GKBadgeController, "sharedController"));
  [v29 setBadgeCount:v28 forBundleID:GKGameCenterIdentifier badgeType:1];
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRequestListCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKFriendRequestListCacheObject internalRepresentation]",  [v8 UTF8String],  2969));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject entries](self, "entries"));
  id v11 = [v10 count];

  v30 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v11);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject managedObjectContext](self, "managedObjectContext"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v29 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfilesWithPlayerIDs:inManagedObjectContext:",  v13,  v12));

  id v28 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkMapDictionaryWithKeyPath:@"playerID"]);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject entries](self, "entries"));
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 playerID]);
        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v22]);
          if ([v23 familiarity] == 3)
          {
            id v24 = [[GKFriendRequestInternal alloc] initWithCacheObject:v23];
            v25 = (void *)objc_claimAutoreleasedReturnValue([v21 date]);
            [v24 setDate:v25];

            v26 = (void *)objc_claimAutoreleasedReturnValue([v21 message]);
            [v24 setMessage:v26];

            -[NSMutableArray addObject:](v30, "addObject:", v24);
          }
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v18);
  }

  return v30;
}

@end