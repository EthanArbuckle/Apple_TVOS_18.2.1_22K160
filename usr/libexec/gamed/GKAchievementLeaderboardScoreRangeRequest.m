@interface GKAchievementLeaderboardScoreRangeRequest
- (id)bagKey;
- (id)serverRequestWithService:(id)a3;
@end

@implementation GKAchievementLeaderboardScoreRangeRequest

- (id)bagKey
{
  return @"gk-get-achievement-leaderboard";
}

- (id)serverRequestWithService:(id)a3
{
  v10[0] = @"player-scope";
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementLeaderboardScoreRangeRequest serverPlayerScope](self, "serverPlayerScope", a3));
  v11[0] = v4;
  v10[1] = @"count";
  -[GKAchievementLeaderboardScoreRangeRequest range](self, "range");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
  v11[1] = v6;
  v10[2] = @"starting-rank";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKAchievementLeaderboardScoreRangeRequest range](self, "range")));
  v10[3] = @"category";
  v11[2] = v7;
  v11[3] = @"points";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));

  return v8;
}

@end