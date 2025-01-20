@interface GKLeaderboardScorePlayersRequest
- (id)bagKey;
- (id)serverRequestWithService:(id)a3;
- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7;
- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5;
@end

@implementation GKLeaderboardScorePlayersRequest

- (id)bagKey
{
  return @"gk-get-leaderboard-rank";
}

- (id)serverRequestWithService:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 localPlayer]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerID]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest playerInternals](self, "playerInternals"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _gkMapWithBlock:&stru_10026FF68]);

  if (v7)
  {
    if (([v7 containsObject:v5] & 1) == 0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 arrayByAddingObject:v5]);

      v7 = (void *)v8;
    }
  }

  else
  {
    v24 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  }

  v22[0] = @"game";
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest gameBundleID](self, "gameBundleID", @"bundle-id"));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  v23[0] = v10;
  v22[1] = @"time-scope";
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest serverTimeScope](self, "serverTimeScope"));
  v23[1] = v11;
  v22[2] = @"player-scope";
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest serverPlayerScope](self, "serverPlayerScope"));
  v22[3] = @"player-ids";
  v23[2] = v12;
  v23[3] = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest identifier](self, "identifier"));

  if (v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest identifier](self, "identifier"));
LABEL_9:
    v18 = (void *)v16;
    [v14 setObject:v16 forKeyedSubscript:@"category"];

    goto LABEL_10;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest groupIdentifier](self, "groupIdentifier"));

  if (v17)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest groupIdentifier](self, "groupIdentifier"));
    goto LABEL_9;
  }

- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 clientProxy]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKLeaderboardScoreRequest+GKGameStatService.m",  310LL,  "-[GKLeaderboardScorePlayersRequest(GKGameStatService) generateScoresFromServerResponse:service:conte xt:timeToLive:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v16,  v14,  v15));

  if (v11)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100095C9C;
    v24[3] = &unk_10026C5C8;
    v24[4] = self;
    id v25 = v11;
    id v26 = v17;
    id v27 = v12;
    [v26 performOnManagedObjectContext:v24];
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100096008;
  v21[3] = &unk_10026B030;
  id v22 = v17;
  id v23 = v13;
  id v19 = v17;
  id v20 = v13;
  [v19 notifyOnQueue:v18 block:v21];
}

- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProxy]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKLeaderboardScoreRequest+GKGameStatService.m",  357LL,  "-[GKLeaderboardScorePlayersRequest(GKGameStatService) loadScoresWithService:context:handler:]"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v12,  v9,  v11));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100096238;
  v23[3] = &unk_10026BB28;
  void v23[4] = self;
  id v15 = v8;
  id v24 = v15;
  id v16 = v11;
  id v25 = v16;
  id v17 = v13;
  id v26 = v17;
  id v18 = v9;
  id v27 = v18;
  [v17 performOnQueue:v14 block:v23];

  if (v10)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100096548;
    v20[3] = &unk_10026B030;
    id v22 = v10;
    id v21 = v17;
    [v21 notifyOnQueue:v19 block:v20];
  }
}

@end