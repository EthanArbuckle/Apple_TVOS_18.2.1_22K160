@interface GKGameRecordCacheObject
+ (id)entityName;
+ (id)fetchSortDescriptors;
+ (id)recordForGame:(id)a3 playerProfile:(id)a4;
+ (id)recordsForGames:(id)a3 playerProfile:(id)a4;
+ (id)relationshipKeyPathsForPrefetch;
- (id)internalRepresentation;
- (void)updateAchievementsWithServerRepresentation:(id)a3;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKGameRecordCacheObject

+ (id)recordsForGames:(id)a3 playerProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKGameRecordCacheObject recordsForGames:playerProfile:]",  v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "+[GKGameRecordCacheObject recordsForGames:playerProfile:]",  [v12 UTF8String],  1926));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  if (v6 && [v5 count])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 managedObjectContext]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 gameRecords]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _gkMapDictionaryWithKeyPath:@"game.bundleID"]);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000C75E0;
    v21[3] = &unk_100271328;
    id v22 = v16;
    id v23 = v14;
    id v24 = v6;
    id v17 = v14;
    id v18 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 _gkMapWithBlock:v21]);
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

+ (id)recordForGame:(id)a3 playerProfile:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "recordsForGames:playerProfile:", v8, v6, v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  return v10;
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameRecordCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKGameRecordCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  1958));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___GKGameRecordCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v26,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"timestamp"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v15));
  -[GKGameRecordCacheObject setLastPlayedDate:](self, "setLastPlayedDate:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"rank"]);
  -[GKGameRecordCacheObject setRank:](self, "setRank:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"leaderboard-size"]);
  -[GKGameRecordCacheObject setMaxRank:](self, "setMaxRank:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"friend-rank"]);
  -[GKGameRecordCacheObject setFriendRank:](self, "setFriendRank:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"num-friends-ranked"]);
  -[GKGameRecordCacheObject setMaxFriendRank:](self, "setMaxFriendRank:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"num-achieved"]);
  -[GKGameRecordCacheObject setAchievements:](self, "setAchievements:", v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"achievements-score"]);
  -[GKGameRecordCacheObject setAchievementPoints:](self, "setAchievementPoints:", v22);

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"user-default-leaderboard-category"]);
  if ([v23 length])
  {
    -[GKGameRecordCacheObject setDefaultLeaderboardIdentifier:](self, "setDefaultLeaderboardIdentifier:", v23);
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"game-metadata"]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"default-leaderboard-category"]);
    -[GKGameRecordCacheObject setDefaultLeaderboardIdentifier:](self, "setDefaultLeaderboardIdentifier:", v25);
  }
}

- (void)updateAchievementsWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameRecordCacheObject updateAchievementsWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKGameRecordCacheObject updateAchievementsWithServerRepresentation:]",  [v10 UTF8String],  1982));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKGameRecordCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v16,  "updateWithServerRepresentation:expirationDate:",  v4,  0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"timestamp"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v12));
  -[GKGameRecordCacheObject setLastPlayedDate:](self, "setLastPlayedDate:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"num-achieved"]);
  -[GKGameRecordCacheObject setAchievements:](self, "setAchievements:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievements-score"]);
  -[GKGameRecordCacheObject setAchievementPoints:](self, "setAchievementPoints:", v15);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameRecordCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKGameRecordCacheObject internalRepresentation]",  [v8 UTF8String],  1992));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  return +[GKGameRecordInternal internalRepresentationForCacheObject:]( &OBJC_CLASS___GKGameRecordInternal,  "internalRepresentationForCacheObject:",  self);
}

+ (id)entityName
{
  return @"GameRecord";
}

+ (id)fetchSortDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"lastPlayedDate",  0LL));
  v8[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"purchaseDate",  0LL));
  v8[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"game.bundleID",  1LL));
  v8[2] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"timeStamp",  0LL));
  v8[3] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));

  return v6;
}

+ (id)relationshipKeyPathsForPrefetch
{
  return +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"game", 0LL);
}

@end