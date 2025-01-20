@interface GKLeaderboardSetCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKLeaderboardSetCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKLeaderboardSetCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKLeaderboardSetCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  2094));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___GKLeaderboardSetCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v31, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"set-name"]);
  -[GKLeaderboardSetCacheObject setIdentifier:](self, "setIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"set-group-name"]);
  -[GKLeaderboardSetCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"set-title"]);
  -[GKLeaderboardSetCacheObject setTitle:](self, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  if (!v15)
  {
    v16 = objc_alloc(&OBJC_CLASS___GKLeaderboardTitleMapListCacheObject);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject managedObjectContext](self, "managedObjectContext"));
    v18 = -[GKCacheObject initWithManagedObjectContext:](v16, "initWithManagedObjectContext:", v17);
    -[GKLeaderboardSetCacheObject setLeaderboardTitleMapList:](self, "setLeaderboardTitleMapList:", v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"set-image-urls"]);
  if (v19) {
    id v20 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v19);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"leaderboards"]);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v21 count]));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 entries]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 _gkMapDictionaryWithKeyPath:@"identifier"]);
  [v22 addEntriesFromDictionary:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000C875C;
  v28[3] = &unk_100271370;
  id v29 = v22;
  v30 = self;
  id v27 = v22;
  [v26 updateEntriesWithRepresentations:v21 entryForRepresentation:v28 reuseEntriesByIndex:0];
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKLeaderboardSetCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKLeaderboardSetCacheObject internalRepresentation]",  [v8 UTF8String],  2135));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKLeaderboardSetInternal internalRepresentation]( &OBJC_CLASS___GKLeaderboardSetInternal,  "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject identifier](self, "identifier"));
  [v10 setIdentifier:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject groupIdentifier](self, "groupIdentifier"));
  [v10 setGroupIdentifier:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject title](self, "title"));
  [v10 setTitle:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetCacheObject leaderboardTitleMapList](self, "leaderboardTitleMapList"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 entries]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 _gkMapDictionaryWithKeyPath:@"identifier" valueKeyPath:@"localizedTitle"]);
  [v10 setLeaderboardIdentifiers:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  [v10 setIcons:v17];

  return v10;
}

+ (id)entityName
{
  return @"LeaderboardSet";
}

@end