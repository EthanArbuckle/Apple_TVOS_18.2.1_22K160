@interface GKLeaderboardScoreRequest
- (id)bagKey;
- (id)leaderboardForServerRepresentations:(id)a3;
- (id)scoreForServerRepresentation:(id)a3 leaderboard:(id)a4;
- (id)serverPlayerScope;
- (id)serverRequestWithService:(id)a3;
- (id)serverTimeScope;
- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7;
- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5;
- (void)updatePlayersForLeaderboard:(id)a3 service:(id)a4 handler:(id)a5;
@end

@implementation GKLeaderboardScoreRequest

- (id)serverTimeScope
{
  id v2 = -[GKLeaderboardScoreRequest timeScope](self, "timeScope");
  v3 = @"all-time";
  if (v2 == (id)1) {
    v3 = @"this-week";
  }
  if (v2) {
    return (id)v3;
  }
  else {
    return @"today";
  }
}

- (id)serverPlayerScope
{
  else {
    return @"all";
  }
}

- (id)bagKey
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The concrete subclass must override -[GKLeaderboardScoreRequest bagKey]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardS coreRequest+GKGameStatService.m"));
  id v4 = objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v2,  "-[GKLeaderboardScoreRequest(GKGameStatService) bagKey]",  [v4 UTF8String],  46));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v5);
  return 0LL;
}

- (id)serverRequestWithService:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The concrete subclass must override -[GKLeaderboardScoreRequest serverRequestWithService:]"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardS coreRequest+GKGameStatService.m"));
  id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v3,  "-[GKLeaderboardScoreRequest(GKGameStatService) serverRequestWithService:]",  [v5 UTF8String],  52));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v6);
  return 0LL;
}

- (id)leaderboardForServerRepresentations:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GKLeaderboardInternal internalRepresentation]( &OBJC_CLASS___GKLeaderboardInternal,  "internalRepresentation"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"category-title"]);
  [v4 setLocalizedTitle:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"leaderboard-size"]);
  objc_msgSend(v4, "setMaxRank:", objc_msgSend(v6, "unsignedIntegerValue"));

  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"global-alltime-info"]);
  if (!v7) {
    id v7 = v3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"category-name"]);
  [v4 setIdentifier:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"group-category-name"]);
  [v4 setGroupIdentifier:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"rank"]);
  objc_msgSend(v4, "setOverallRank:", objc_msgSend(v10, "unsignedIntegerValue"));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"leaderboard-size"]);
  objc_msgSend(v4, "setOverallRankCount:", objc_msgSend(v11, "unsignedIntegerValue"));

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"friend-rank"]);
  objc_msgSend(v4, "setFriendRank:", (unsigned __int16)objc_msgSend(v12, "unsignedIntegerValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"num-friends-ranked"]);
  objc_msgSend(v4, "setFriendRankCount:", (unsigned __int16)objc_msgSend(v13, "unsignedIntegerValue"));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"category-image-urls"]);
  [v4 setIcons:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"last-submitted"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v15));
  [v4 setLastSubmittedDate:v16];

  return v4;
}

- (id)scoreForServerRepresentation:(id)a3 leaderboard:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKScoreInternal internalRepresentation](&OBJC_CLASS___GKScoreInternal, "internalRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v7 setLeaderboardIdentifier:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 groupIdentifier]);
  [v7 setGroupLeaderboardIdentifier:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"player-id"]);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerInternal internalRepresentation](&OBJC_CLASS___GKPlayerInternal, "internalRepresentation"));
    [v11 setPlayerID:v10];
  }

  else
  {
    v11 = 0LL;
  }

  [v7 setPlayer:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rank"]);
  objc_msgSend(v7, "setRank:", objc_msgSend(v12, "integerValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"timestamp"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v13));
  [v7 setDate:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"score-value"]);
  objc_msgSend(v7, "setValue:", objc_msgSend(v15, "unsignedLongLongValue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"formatted-score-value"]);
  [v7 setFormattedValue:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"context"]);
  objc_msgSend(v7, "setContext:", objc_msgSend(v17, "unsignedLongLongValue"));

  return v7;
}

- (void)updatePlayersForLeaderboard:(id)a3 service:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 scores]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 playerScore]);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 playerScore]);
    [v11 addObject:v13];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 _gkValuesForKeyPath:@"player.playerID"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKAnonymousPlayerInternal internalRepresentation]( &OBJC_CLASS___GKAnonymousPlayerInternal,  "internalRepresentation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKProfileService, "serviceFromService:", v9));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000948C0;
  v20[3] = &unk_10026C8B0;
  id v21 = v11;
  id v22 = v15;
  id v23 = v8;
  id v17 = v8;
  id v18 = v15;
  id v19 = v11;
  [v16 getProfilesForPlayerIDs:v14 handler:v20];
}

- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The concrete subclass must override -[GKLeaderboardScoreRequest generateScoresFromServerResponse:service:context:timeToLive:handler:]",  a4,  a5,  a7,  a6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardS coreRequest+GKGameStatService.m"));
  id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v7,  "-[GKLeaderboardScoreRequest(GKGameStatService) generateScoresFromServerResponse:service:context:timeToLive:handler:]",  [v9 UTF8String],  146));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v10);
}

- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The concrete subclass must override -[GKLeaderboardScoreRequest loadScoresForClient:context:handler:]",  a4,  a5));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardS coreRequest+GKGameStatService.m"));
  id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v5,  "-[GKLeaderboardScoreRequest(GKGameStatService) loadScoresWithService:context:handler:]",  [v7 UTF8String],  153));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v8);
}

@end