@interface GKLeaderboardScoreRangeRequest
- (id)bagKey;
- (id)serverRequestWithService:(id)a3;
- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7;
- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5;
- (void)sanitizeRange;
@end

@implementation GKLeaderboardScoreRangeRequest

- (void)sanitizeRange
{
  int8x16_t v2 = *(int8x16_t *)((char *)self + OBJC_IVAR___GKLeaderboardScoreRangeRequest__range);
  int8x16_t v3 = (int8x16_t)vcgtq_u64((uint64x2_t)v2, (uint64x2_t)vdupq_n_s64(1uLL));
  *(int64x2_t *)((char *)self + OBJC_IVAR___GKLeaderboardScoreRangeRequest__range) = vsubq_s64( (int64x2_t)vandq_s8(v2, v3),  (int64x2_t)vmvnq_s8(v3));
}

- (id)bagKey
{
  return @"gk-get-leaderboard";
}

- (id)serverRequestWithService:(id)a3
{
  v20[0] = @"game";
  v18 = @"bundle-id";
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest gameBundleID](self, "gameBundleID", a3));
  v19 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  v21[0] = v5;
  v20[1] = @"time-scope";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest serverTimeScope](self, "serverTimeScope"));
  v21[1] = v6;
  v20[2] = @"player-scope";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest serverPlayerScope](self, "serverPlayerScope"));
  v21[2] = v7;
  v20[3] = @"count";
  -[GKLeaderboardScoreRangeRequest range](self, "range");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  v21[3] = v9;
  v20[4] = @"starting-rank";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKLeaderboardScoreRangeRequest range](self, "range")));
  v21[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest identifier](self, "identifier"));

  if (v13)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest identifier](self, "identifier"));
LABEL_5:
    v16 = (void *)v14;
    [v12 setObject:v14 forKeyedSubscript:@"category"];

    goto LABEL_6;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest groupIdentifier](self, "groupIdentifier"));

  if (v15)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest groupIdentifier](self, "groupIdentifier"));
    goto LABEL_5;
  }

- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 clientProxy]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKLeaderboardScoreRequest+GKGameStatService.m",  196LL,  "-[GKLeaderboardScoreRangeRequest(GKGameStatService) generateScoresFromServerResponse:service:context :timeToLive:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v16,  v14,  v15));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10009503C;
  v27[3] = &unk_10026C5C8;
  id v28 = v11;
  v29 = self;
  id v18 = v17;
  id v30 = v18;
  id v31 = v12;
  id v19 = v12;
  id v20 = v11;
  [v18 performOnManagedObjectContext:v27];
  v21 = (void *)objc_claimAutoreleasedReturnValue([v15 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000952DC;
  v24[3] = &unk_10026B030;
  id v25 = v18;
  id v26 = v13;
  id v22 = v18;
  id v23 = v13;
  [v22 notifyOnQueue:v21 block:v24];
}

- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProxy]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKLeaderboardScoreRequest+GKGameStatService.m",  240LL,  "-[GKLeaderboardScoreRangeRequest(GKGameStatService) loadScoresWithService:context:handler:]"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v12,  v9,  v11));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000954F4;
  v24[3] = &unk_10026BEC8;
  void v24[4] = self;
  id v25 = v8;
  id v15 = v13;
  id v26 = v15;
  id v27 = v9;
  id v16 = v9;
  id v17 = v8;
  [v15 performOnQueue:v14 block:v24];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100095800;
  v21[3] = &unk_10026B030;
  id v22 = v15;
  id v23 = v10;
  id v19 = v15;
  id v20 = v10;
  [v19 notifyOnQueue:v18 block:v21];
}

@end