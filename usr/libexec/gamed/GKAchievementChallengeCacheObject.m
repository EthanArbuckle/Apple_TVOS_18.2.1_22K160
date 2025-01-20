@interface GKAchievementChallengeCacheObject
+ (id)entityName;
- (BOOL)hasDetails;
- (Class)classForInternalRepresentation;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementChallengeCacheObject

+ (id)entityName
{
  return @"AchievementChallenge";
}

- (BOOL)hasDetails
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementChallengeCacheObject hasDetails]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKAchievementChallengeCacheObject hasDetails]",  [v8 UTF8String],  4785));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKAchievementChallengeCacheObject;
  if (!-[GKChallengeCacheObject hasDetails](&v14, "hasDetails")) {
    return 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject identifier](self, "identifier"));
  if (v10)
  {
    BOOL v11 = 1;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
    BOOL v11 = v12 != 0LL;
  }

  return v11;
}

- (Class)classForInternalRepresentation
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKAchievementChallengeInternal, a2);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementChallengeCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKAchievementChallengeCacheObject internalRepresentation]",  [v8 UTF8String],  4796));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject list](self, "list"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 player]);

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___GKAchievementChallengeCacheObject;
  id v12 = -[GKChallengeCacheObject internalRepresentation](&v24, "internalRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKAchievementInternal internalRepresentation]( &OBJC_CLASS___GKAchievementInternal,  "internalRepresentation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject identifier](self, "identifier"));
  [v14 setIdentifier:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
  [v14 setGroupIdentifier:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject date](self, "date"));
  [v14 setLastReportedDate:v17];

  -[GKAchievementChallengeCacheObject percentComplete](self, "percentComplete");
  [v14 setPercentComplete:v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 internalRepresentation]);
  [v14 setPlayer:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject title](self, "title"));
  [v14 setTitle:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject maximumPoints](self, "maximumPoints"));
  objc_msgSend(v14, "setMaximumPoints:", (unsigned __int16)objc_msgSend(v21, "integerValue"));

  objc_msgSend(v14, "setHidden:", -[GKAchievementChallengeCacheObject hidden](self, "hidden"));
  objc_msgSend(v14, "setReplayable:", -[GKAchievementChallengeCacheObject replayable](self, "replayable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  [v14 setIcons:v22];

  [v13 setAchievement:v14];
  return v13;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementChallengeCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKAchievementChallengeCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  4821));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___GKAchievementChallengeCacheObject;
  -[GKChallengeCacheObject updateWithServerRepresentation:](&v29, "updateWithServerRepresentation:", v4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement"]);
  v13 = v12;
  if (v12)
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"achievement-id"]);
    -[GKAchievementChallengeCacheObject setIdentifier:](self, "setIdentifier:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"achievement-group-id"]);
    -[GKAchievementChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"achievement-pct"]);
    [v16 floatValue];
    -[GKAchievementChallengeCacheObject setPercentComplete:](self, "setPercentComplete:");

    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"timestamp"]);
    float v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v17));
    -[GKAchievementChallengeCacheObject setDate:](self, "setDate:", v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"achievement-description"]);
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"achievement-id"]);
    -[GKAchievementChallengeCacheObject setIdentifier:](self, "setIdentifier:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"group-achievement-id"]);
    -[GKAchievementChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"achievement-image-urls"]);
    if (v23) {
      id v24 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v23);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"achievement-title"]);
    -[GKAchievementChallengeCacheObject setTitle:](self, "setTitle:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"achievement-max-value"]);
    -[GKAchievementChallengeCacheObject setMaximumPoints:](self, "setMaximumPoints:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"achievement-display-unachieved"]);
    -[GKAchievementChallengeCacheObject setHidden:]( self,  "setHidden:",  [v27 BOOLValue] ^ 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"is-recyclable"]);
    -[GKAchievementChallengeCacheObject setReplayable:](self, "setReplayable:", [v28 BOOLValue]);
  }
}

@end