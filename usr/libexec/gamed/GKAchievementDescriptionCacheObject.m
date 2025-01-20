@interface GKAchievementDescriptionCacheObject
+ (BOOL)getIsPrereleaseFromServerRep:(id)a3;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementDescriptionCacheObject

+ (BOOL)getIsPrereleaseFromServerRep:(id)a3
{
  return [a3 BOOLValueFromKey:@"is-prerelease" defaultValue:0];
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementDescriptionCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKAchievementDescriptionCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  1764));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___GKAchievementDescriptionCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v27, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-id"]);
  -[GKAchievementDescriptionCacheObject setIdentifier:](self, "setIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"group-achievement-id"]);
  -[GKAchievementDescriptionCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-title"]);
  -[GKAchievementDescriptionCacheObject setTitle:](self, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-desc-after"]);
  -[GKAchievementDescriptionCacheObject setAchievedDescription:](self, "setAchievedDescription:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-desc-before"]);
  -[GKAchievementDescriptionCacheObject setUnachievedDescription:](self, "setUnachievedDescription:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-max-value"]);
  -[GKAchievementDescriptionCacheObject setMaximumPoints:](self, "setMaximumPoints:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-display-unachieved"]);
  -[GKAchievementDescriptionCacheObject setHidden:]( self,  "setHidden:",  [v18 BOOLValue] ^ 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"is-recyclable"]);
  -[GKAchievementDescriptionCacheObject setReplayable:](self, "setReplayable:", [v19 BOOLValue]);

  if (+[GKAchievementDescriptionCacheObject getIsPrereleaseFromServerRep:]( &OBJC_CLASS___GKAchievementDescriptionCacheObject,  "getIsPrereleaseFromServerRep:",  v4))
  {
    uint64_t v20 = 2LL;
  }

  else
  {
    uint64_t v20 = 1LL;
  }

  -[GKAchievementDescriptionCacheObject setReleaseState:](self, "setReleaseState:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"percentage-players-earned"]);
  v22 = v21;
  if (v21)
  {
    [v21 doubleValue];
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23 * 100.0));
    -[GKAchievementDescriptionCacheObject setRarityPercent:](self, "setRarityPercent:", v24);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-image-urls"]);
  if (v25) {
    id v26 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v25);
  }
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementDescriptionCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKAchievementDescriptionCacheObject internalRepresentation]",  [v8 UTF8String],  1789));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKAchievementInternal internalRepresentation]( &OBJC_CLASS___GKAchievementInternal,  "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject identifier](self, "identifier"));
  [v10 setIdentifier:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject title](self, "title"));
  [v10 setTitle:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject groupIdentifier](self, "groupIdentifier"));
  [v10 setGroupIdentifier:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject achievedDescription](self, "achievedDescription"));
  [v10 setAchievedDescription:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject unachievedDescription](self, "unachievedDescription"));
  [v10 setUnachievedDescription:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject maximumPoints](self, "maximumPoints"));
  objc_msgSend(v10, "setMaximumPoints:", (unsigned __int16)objc_msgSend(v16, "unsignedIntegerValue"));

  objc_msgSend(v10, "setHidden:", -[GKAchievementDescriptionCacheObject hidden](self, "hidden"));
  objc_msgSend(v10, "setReplayable:", -[GKAchievementDescriptionCacheObject replayable](self, "replayable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  [v10 setIcons:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject rarityPercent](self, "rarityPercent"));
  [v10 setRarityPercent:v18];

  objc_msgSend(v10, "setReleaseState:", -[GKAchievementDescriptionCacheObject releaseState](self, "releaseState"));
  return v10;
}

+ (id)entityName
{
  return @"AchievementDescription";
}

@end