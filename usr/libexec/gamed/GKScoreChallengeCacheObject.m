@interface GKScoreChallengeCacheObject
+ (id)entityName;
- (BOOL)hasDetails;
- (Class)classForInternalRepresentation;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKScoreChallengeCacheObject

+ (id)entityName
{
  return @"ScoreChallenge";
}

- (BOOL)hasDetails
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKScoreChallengeCacheObject;
  if (!-[GKChallengeCacheObject hasDetails](&v6, "hasDetails")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject value](self, "value"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (Class)classForInternalRepresentation
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKScoreChallengeInternal, a2);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKScoreChallengeCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKScoreChallengeCacheObject internalRepresentation]",  [v8 UTF8String],  4703));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___GKScoreChallengeCacheObject;
  id v10 = -[GKChallengeCacheObject internalRepresentation](&v25, "internalRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKScoreInternal internalRepresentation](&OBJC_CLASS___GKScoreInternal, "internalRepresentation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject identifier](self, "identifier"));
  [v12 setLeaderboardIdentifier:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
  [v12 setGroupLeaderboardIdentifier:v14];

  objc_msgSend(v12, "setRank:", -[GKScoreChallengeCacheObject rank](self, "rank"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject value](self, "value"));
  objc_msgSend(v12, "setValue:", objc_msgSend(v15, "longLongValue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject formattedValue](self, "formattedValue"));
  [v12 setFormattedValue:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject date](self, "date"));
  [v12 setDate:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject context](self, "context"));
  objc_msgSend(v12, "setContext:", objc_msgSend(v18, "longLongValue"));

  [v11 setScore:v12];
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[GKLeaderboardInternal internalRepresentation]( &OBJC_CLASS___GKLeaderboardInternal,  "internalRepresentation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject identifier](self, "identifier"));
  [v19 setIdentifier:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
  [v19 setGroupIdentifier:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject localizedTitle](self, "localizedTitle"));
  [v19 setLocalizedTitle:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  [v19 setIcons:v23];

  [v11 setLeaderboard:v19];
  return v11;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  objc_super v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKScoreChallengeCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKScoreChallengeCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  4731));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___GKScoreChallengeCacheObject;
  -[GKChallengeCacheObject updateWithServerRepresentation:](&v29, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"score"]);
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"leaderboard-id"]);
    -[GKScoreChallengeCacheObject setIdentifier:](self, "setIdentifier:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"leaderboard-group-id"]);
    -[GKScoreChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"rank"]);
    -[GKScoreChallengeCacheObject setRank:](self, "setRank:", [v16 integerValue]);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"value"]);
    -[GKScoreChallengeCacheObject setValue:](self, "setValue:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"formatted-score-value"]);
    -[GKScoreChallengeCacheObject setFormattedValue:](self, "setFormattedValue:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"timestamp"]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v19));
    -[GKScoreChallengeCacheObject setDate:](self, "setDate:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"context"]);
    -[GKScoreChallengeCacheObject setContext:](self, "setContext:", v21);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"leaderboard-category"]);
  v23 = v22;
  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"category-name"]);
    -[GKScoreChallengeCacheObject setIdentifier:](self, "setIdentifier:", v24);

    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"group-category-name"]);
    -[GKScoreChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"category-title"]);
    -[GKScoreChallengeCacheObject setLocalizedTitle:](self, "setLocalizedTitle:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"category-image-urls"]);
    if (v27) {
      id v28 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v27);
    }
  }
}

@end