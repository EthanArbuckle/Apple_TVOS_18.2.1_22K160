@interface GKGameStatService
+ (Class)interfaceClass;
+ (id)friendsRequiringHydration:(id)a3;
+ (id)getFriendsWhoHaveTheseAchievementsPredicate:(id)a3 playerID:(id)a4 gameBundleID:(id)a5;
+ (id)leaderboards:(id)a3 filteredWithIDs:(id)a4;
+ (unint64_t)requiredEntitlements;
- (id)getFriendsWhoHaveTheseAchievements:(id)a3 playerID:(id)a4 gameBundleID:(id)a5 context:(id)a6;
- (id)playerScopeName:(int64_t)a3;
- (id)timeScopeName:(int64_t)a3;
- (id)updateSigningStatusIfChanged:(id)a3;
- (void)_getRecentMatchesForGameDescriptor:(id)a3 type:(int)a4 reference:(id)a5 handler:(id)a6;
- (void)achievementsForPlayersAndGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6;
- (void)cleanUpLeaderboardTitles:(id)a3 set:(id)a4 context:(id)a5;
- (void)createLeaderboardBasedOnID:(id)a3 recipients:(id)a4 inviteMessage:(id)a5 context:(id)a6 duration:(double)a7 handler:(id)a8;
- (void)deleteLeaderboardWithID:(id)a3 handler:(id)a4;
- (void)endLeaderboardWithID:(id)a3 handler:(id)a4;
- (void)fetchAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6;
- (void)fetchLeaderboardWithRecordID:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 handler:(id)a7;
- (void)fetchRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6;
- (void)fetchRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6;
- (void)generateEntriesFromServerResponse:(id)a3 context:(id)a4 leaderboard:(id)a5 handler:(id)a6;
- (void)getAchievementDescriptionsForGameDescriptor:(id)a3 handler:(id)a4;
- (void)getAchievementsForGameDescriptor:(id)a3 players:(id)a4 handler:(id)a5;
- (void)getDefaultLeaderboardIDWithHandler:(id)a3;
- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 handler:(id)a10;
- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 locale:(id)a10 handler:(id)a11;
- (void)getLeaderboardForRequest:(id)a3 handler:(id)a4;
- (void)getLeaderboardSetsForGameDescriptor:(id)a3 handler:(id)a4;
- (void)getLeaderboardSummaryForGameDescriptor:(id)a3 localPlayer:(id)a4 baseLeaderboardID:(id)a5 leaderboardID:(id)a6 timeScope:(int64_t)a7 handler:(id)a8;
- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 leaderboardIDs:(id)a5 setIdentifier:(id)a6 handler:(id)a7;
- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 handler:(id)a6;
- (void)getPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 handler:(id)a6;
- (void)getRecentGamesWithPlayer:(id)a3 handler:(id)a4;
- (void)getRecentMatchesForGameDescriptor:(id)a3 achievementIdentifier:(id)a4 handler:(id)a5;
- (void)getRecentMatchesForGameDescriptor:(id)a3 includeCompatibleMultiplayerGames:(BOOL)a4 handler:(id)a5;
- (void)getRecentMatchesForGameDescriptor:(id)a3 leaderboardIdentifier:(id)a4 handler:(id)a5;
- (void)getRecentMatchesForGameDescriptor:(id)a3 otherPlayer:(id)a4 handler:(id)a5;
- (void)getRecentPlayersForGameDescriptor:(id)a3 handler:(id)a4;
- (void)getRecentPlayersWithHandler:(id)a3;
- (void)loadAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6;
- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 handler:(id)a11;
- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 locale:(id)a11 handler:(id)a12;
- (void)loadLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 bagKey:(id)a7 handler:(id)a8;
- (void)loadPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 playerPlayedIn:(BOOL)a6 context:(id)a7 handler:(id)a8;
- (void)loadRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6;
- (void)loadRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6;
- (void)mixinHasActiveChallengesWithLeaderboards:(id)a3 playerID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6;
- (void)primeCacheWithAchievementDescriptions:(id)a3 context:(id)a4 gameDescriptor:(id)a5 players:(id)a6 missingPlayers:(id)a7;
- (void)resetAchievementsWithHandler:(id)a3;
- (void)setDefaultLeaderboardID:(id)a3 handler:(id)a4;
- (void)startLeaderboardWithID:(id)a3 handler:(id)a4;
- (void)submitAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6;
- (void)submitInstanceScore:(int64_t)a3 context:(unint64_t)a4 leaderboard:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 handler:(id)a9;
- (void)submitScore:(int64_t)a3 context:(unint64_t)a4 leaderboardIDs:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 gameDescriptor:(id)a9 handler:(id)a10;
- (void)submitScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6;
- (void)updateLeaderboardsWithIDs:(id)a3 gameDescriptor:(id)a4 player:(id)a5 context:(id)a6 handler:(id)a7;
- (void)updatePlayersForEntries:(id)a3 localPlayerEntry:(id)a4 handler:(id)a5;
@end

@implementation GKGameStatService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKGameStatServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 16LL;
}

- (void)_getRecentMatchesForGameDescriptor:(id)a3 type:(int)a4 reference:(id)a5 handler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a3 dictionaryForRequest]);
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v13 gameDescriptor]);
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"bundle-id"]);
  v31 = (void *)v14;
  if ((_DWORD)v7 == 3)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"game.bundleID = %@ AND type = %d AND reference = %@",  v14,  3LL,  v10));
    v46[0] = @"game";
    v46[1] = @"match-type";
    v47[0] = v12;
    v47[1] = @"achievement-compatible";
    v46[2] = @"achievement-id";
    v47[2] = v10;
    v16 = v47;
    v17 = v46;
  }

  else
  {
    if ((_DWORD)v7 != 2)
    {
      if ((_DWORD)v7 == 1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"game.bundleID = %@ AND type = %d",  v14,  1LL));
        v50[0] = @"game";
        v50[1] = @"match-type";
        v51[0] = v12;
        v51[1] = @"multiplayer-compatible";
        v16 = v51;
        v17 = v50;
      }

      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"game.bundleID = %@ AND type = %d",  v14,  v7));
        v44[0] = @"game";
        v44[1] = @"match-type";
        v45[0] = v12;
        v45[1] = @"exact-match";
        v16 = v45;
        v17 = v44;
      }

      uint64_t v18 = 2LL;
      goto LABEL_12;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"game.bundleID = %@ AND type = %d AND reference = %@",  v14,  2LL,  v10));
    v48[0] = @"game";
    v48[1] = @"match-type";
    v49[0] = v12;
    v49[1] = @"leaderboard-compatible";
    v48[2] = @"leaderboard-id";
    v49[2] = v10;
    v16 = v49;
    v17 = v48;
  }

  uint64_t v18 = 3LL;
LABEL_12:
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  118LL,  "-[GKGameStatService _getRecentMatchesForGameDescriptor:type:reference:handler:]"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10004DD80;
  v36[3] = &unk_10026E0A8;
  id v24 = v21;
  id v37 = v24;
  id v25 = v15;
  id v38 = v25;
  id v26 = v19;
  id v39 = v26;
  v40 = self;
  int v43 = v7;
  id v27 = v10;
  id v41 = v27;
  id v28 = v12;
  id v42 = v28;
  [v24 performOnQueue:v23 block:v36];

  if (v11)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 replyQueue]);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10004E668;
    v32[3] = &unk_10026B148;
    id v33 = v24;
    v34 = self;
    id v35 = v11;
    [v33 notifyOnQueue:v30 block:v32];
  }
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 leaderboardIdentifier:(id)a4 handler:(id)a5
{
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 achievementIdentifier:(id)a4 handler:(id)a5
{
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 includeCompatibleMultiplayerGames:(BOOL)a4 handler:(id)a5
{
}

- (void)fetchRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10004E9CC;
  v14[3] = &unk_10026B0A8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = self;
  id v19 = a6;
  id v10 = v19;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [v11 performBlock:v14];
}

- (void)fetchRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10004EC64;
  v14[3] = &unk_10026B0A8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = self;
  id v19 = a6;
  id v10 = v19;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [v11 performBlock:v14];
}

- (void)loadRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  296LL,  "-[GKGameStatService loadRecentPlayersWithPlayer:game:context:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v14,  v12,  v15));

  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  v40[3] = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v18 = [v17 maxRecentPlayersCount];
  [v17 maxRecentPlayersTime];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10004F0AC;
  v32[3] = &unk_10026E170;
  id v39 = v18;
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -v19));
  id v33 = v20;
  id v21 = v11;
  id v34 = v21;
  id v35 = self;
  id v38 = v40;
  id v22 = v16;
  id v36 = v22;
  id v23 = v10;
  id v37 = v23;
  [v22 performOnManagedObjectContext:v32];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyQueue]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10004FBD8;
  v28[3] = &unk_10026B878;
  id v26 = v13;
  id v30 = v26;
  v31 = v40;
  id v27 = v22;
  id v29 = v27;
  [v27 notifyOnQueue:v25 block:v28];

  _Block_object_dispose(v40, 8);
}

- (void)loadRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  375LL,  "-[GKGameStatService loadRecentGamesBetweenPlayer:otherPlayer:context:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v14,  v12,  v15));

  v50[0] = 0LL;
  v50[1] = v50;
  void v50[2] = 0x2020000000LL;
  v50[3] = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v18 = [v17 maxRecentPlayersCount];
  [v17 maxRecentPlayersTime];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v19));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  void v45[2] = sub_10004FF4C;
  v45[3] = &unk_10026E198;
  id v21 = v16;
  id v46 = v21;
  id v49 = v18;
  id v22 = v20;
  id v47 = v22;
  id v23 = v11;
  id v48 = v23;
  [v12 performBlockAndWait:v45];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100050058;
  v37[3] = &unk_10026E1C0;
  id v24 = v21;
  id v38 = v24;
  id v39 = self;
  v44 = v50;
  id v25 = v12;
  id v40 = v25;
  id v26 = v10;
  id v41 = v26;
  id v27 = v23;
  id v42 = v27;
  id v28 = v22;
  id v43 = v28;
  [v24 perform:v37];
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 replyQueue]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100050A44;
  v33[3] = &unk_10026B878;
  id v31 = v13;
  id v35 = v31;
  id v36 = v50;
  id v32 = v24;
  id v34 = v32;
  [v32 notifyOnQueue:v30 block:v33];

  _Block_object_dispose(v50, 8);
}

- (void)getRecentPlayersForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  453LL,  "-[GKGameStatService getRecentPlayersForGameDescriptor:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100050C4C;
  v19[3] = &unk_10026B080;
  id v12 = v9;
  id v20 = v12;
  id v13 = v6;
  id v21 = v13;
  id v22 = self;
  [v12 performOnQueue:v11 block:v19];

  if (v7)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000513FC;
    v16[3] = &unk_10026B030;
    id v18 = v7;
    id v17 = v12;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)getRecentGamesWithPlayer:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  507LL,  "-[GKGameStatService getRecentGamesWithPlayer:handler:]"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100051610;
  v16[3] = &unk_10026B170;
  id v10 = v7;
  id v17 = v10;
  id v18 = self;
  [v10 performOnQueue:v9 block:v16];

  if (v5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100051D44;
    v13[3] = &unk_10026B030;
    id v15 = v5;
    id v14 = v10;
    [v14 notifyOnQueue:v12 block:v13];
  }
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 otherPlayer:(id)a4 handler:(id)a5
{
  if (a4) {
    -[GKGameStatService getRecentGamesWithPlayer:handler:](self, "getRecentGamesWithPlayer:handler:", a4, a5);
  }
  else {
    -[GKGameStatService getRecentPlayersForGameDescriptor:handler:]( self,  "getRecentPlayersForGameDescriptor:handler:",  a3,  a5);
  }
}

- (void)getRecentPlayersWithHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100051E68;
  v5[3] = &unk_10026E238;
  id v6 = a3;
  id v4 = v6;
  -[GKGameStatService getRecentPlayersForGameDescriptor:handler:]( self,  "getRecentPlayersForGameDescriptor:handler:",  0LL,  v5);
}

- (void)fetchAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100051F38;
  v10[3] = &unk_10026B148;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  [v8 performBlock:v10];
}

- (void)loadAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_10005225C;
  void v32[4] = sub_10005226C;
  id v33 = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  v31[3] = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  603LL,  "-[GKGameStatService loadAchievementDescriptionsForGameDescriptor:context:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v11,  v9,  v12));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100052274;
  v24[3] = &unk_10026E2D8;
  id v14 = v8;
  id v25 = v14;
  id v29 = v32;
  id v15 = v10;
  id v28 = v15;
  id v30 = v31;
  id v16 = v13;
  id v26 = v16;
  id v27 = self;
  [v16 performOnManagedObjectContext:v24];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100052BA8;
  v20[3] = &unk_10026E300;
  id v19 = v16;
  id v21 = v19;
  id v22 = v32;
  id v23 = v31;
  [v19 notifyOnQueue:v18 block:v20];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
}

+ (id)friendsRequiringHydration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v18 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"results"]);
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v8);
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"friends-with-achievement"]);
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            id v14 = 0LL;
            do
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v20 + 1) + 8 * (void)v14) objectForKeyedSubscript:@"friend-player-id"]);
              -[NSMutableSet addObject:](v4, "addObject:", v15);

              id v14 = (char *)v14 + 1;
            }

            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }

          while (v12);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v6);
  }

  id v16 = -[NSMutableSet copy](v4, "copy");
  return v16;
}

+ (id)getFriendsWhoHaveTheseAchievementsPredicate:(id)a3 playerID:(id)a4 gameBundleID:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"game.bundleID == %@",  a5));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"achievementDescription.identifier IN %@",  v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"achievementDescription.groupIdentifier IN %@",  v8));

  v19[0] = v10;
  v19[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"player.playerID == %@",  v7));
  v18[0] = v14;
  v18[1] = v9;
  v18[2] = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v15));

  return v16;
}

- (id)getFriendsWhoHaveTheseAchievements:(id)a3 playerID:(id)a4 gameBundleID:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 count])
  {
    os_signpost_id_t v13 = os_signpost_id_generate(os_log_GKPerf);
    id v14 = (os_log_s *)os_log_GKPerf;
    id v15 = v14;
    unint64_t v53 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "FriendsWhoHaveThisQuery",  "",  buf,  2u);
    }

    id v57 = v11;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[GKGameStatService getFriendsWhoHaveTheseAchievementsPredicate:playerID:gameBundleID:]( &OBJC_CLASS___GKGameStatService,  "getFriendsWhoHaveTheseAchievementsPredicate:playerID:gameBundleID:",  v9,  v10,  v11));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheObject fetchRequestForContext:]( &OBJC_CLASS___GKAchievementThatAFriendHasListCacheObject,  "fetchRequestForContext:",  v12));
    v55 = (void *)v16;
    [v17 setPredicate:v16];
    id v75 = 0LL;
    v54 = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 executeFetchRequest:v17 error:&v75]);
    id v19 = v75;
    id v20 = v19;
    if (v19)
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers(v19);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000679AC();
      }
    }

    v52 = v20;
    os_signpost_id_t spid = v13;
    id v56 = v12;
    id v58 = v10;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v18 count]));
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    id v23 = v18;
    id v24 = [v23 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v72;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v72 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 achievementDescription]);
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);

          id v31 = (void *)objc_claimAutoreleasedReturnValue([v28 achievementDescription]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 groupIdentifier]);

          if ([v30 length]) {
            [v22 setObject:v28 forKeyedSubscript:v30];
          }
          if ([v32 length]) {
            [v22 setObject:v28 forKeyedSubscript:v32];
          }
        }

        id v25 = [v23 countByEnumeratingWithState:&v71 objects:v79 count:16];
      }

      while (v25);
    }

    v51 = v23;

    v62 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    id v59 = v9;
    id obj = v9;
    id v33 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v61 = *(void *)v68;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v68 != v61) {
            objc_enumerationMutation(obj);
          }
          id v36 = (void *)objc_claimAutoreleasedReturnValue( [v22 objectForKeyedSubscript:*(void *)(*((void *)&v67 + 1) + 8 * (void)j)]);
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 entries]);
          id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v37 count]));

          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v36 entries]);
          id v40 = [v39 countByEnumeratingWithState:&v63 objects:v77 count:16];
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v64;
            do
            {
              for (k = 0LL; k != v41; k = (char *)k + 1)
              {
                if (*(void *)v64 != v42) {
                  objc_enumerationMutation(v39);
                }
                [v38 addObject:v44];
              }

              id v41 = [v39 countByEnumeratingWithState:&v63 objects:v77 count:16];
            }

            while (v41);
          }

          id v45 = [v38 copy];
          -[NSMutableArray addObject:](v62, "addObject:", v45);
        }

        id v34 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
      }

      while (v34);
    }

    id v46 = (os_log_s *)os_log_GKPerf;
    id v47 = v46;
    id v10 = v58;
    if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  spid,  "FriendsWhoHaveThisQuery",  "",  buf,  2u);
    }

    id v48 = -[NSMutableArray copy](v62, "copy");
    id v9 = v59;
    id v12 = v56;
    id v11 = v57;
  }

  else
  {
    id v48 = 0LL;
  }

  return v48;
}

- (void)getAchievementDescriptionsForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  796LL,  "-[GKGameStatService getAchievementDescriptionsForGameDescriptor:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryForRequest]);
  if (!v12)
  {
    os_signpost_id_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 gameDescriptor]);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005387C;
  v20[3] = &unk_10026C5C8;
  void v20[4] = self;
  id v14 = v12;
  id v21 = v14;
  id v15 = v9;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  [v15 performOnManagedObjectContext:v20];
  if (v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100053F3C;
    v17[3] = &unk_10026B030;
    id v19 = v6;
    id v18 = v15;
    [v18 notifyOnQueue:v16 block:v17];
  }
}

- (void)fetchAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  char v34 = 1;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  865LL,  "-[GKGameStatService fetchAchievementsForGameDescriptor:players:context:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v14,  v12,  v15));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000541D8;
  v28[3] = &unk_10026E458;
  void v28[4] = self;
  id v17 = v10;
  id v29 = v17;
  id v18 = v11;
  id v30 = v18;
  id v19 = v16;
  id v31 = v19;
  id v32 = v33;
  [v19 performOnManagedObjectContext:v28];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100054804;
  v24[3] = &unk_10026B9B0;
  id v22 = v13;
  id v26 = v22;
  id v23 = v19;
  id v25 = v23;
  __int128 v27 = v33;
  [v23 notifyOnQueue:v21 block:v24];

  _Block_object_dispose(v33, 8);
}

- (void)achievementsForPlayersAndGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  950LL,  "-[GKGameStatService achievementsForPlayersAndGameDescriptor:players:context:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v14,  v12,  v15));

  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  v34[3] = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100054ACC;
  v27[3] = &unk_10026E4C8;
  id v17 = v10;
  id v28 = v17;
  id v18 = v11;
  id v29 = v18;
  id v19 = v16;
  id v30 = v19;
  id v31 = self;
  id v20 = v13;
  id v32 = v20;
  id v33 = v34;
  [v19 performOnManagedObjectContext:v27];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000555A4;
  v24[3] = &unk_10026C320;
  id v23 = v19;
  id v25 = v23;
  id v26 = v34;
  [v23 notifyOnQueue:v22 block:v24];

  _Block_object_dispose(v34, 8);
}

- (void)loadAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue([a4 _gkMapWithBlock:&stru_10026E508]);
  -[GKGameStatService achievementsForPlayersAndGameDescriptor:players:context:handler:]( self,  "achievementsForPlayersAndGameDescriptor:players:context:handler:",  v12,  v13,  v11,  v10);
}

- (void)primeCacheWithAchievementDescriptions:(id)a3 context:(id)a4 gameDescriptor:(id)a5 players:(id)a6 missingPlayers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1065LL,  "-[GKGameStatService primeCacheWithAchievementDescriptions:context:gameDescriptor:players:missingPlayers:]"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 transactionGroupWithName:v17]);

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100055A04;
  v37[3] = &unk_10026BB28;
  void v37[4] = self;
  id v19 = v14;
  id v38 = v19;
  id v39 = v16;
  id v20 = v13;
  id v40 = v20;
  id v21 = v18;
  id v41 = v21;
  id v22 = v16;
  [v21 perform:v37];
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 replyQueue]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100055AE4;
  v30[3] = &unk_10026BE78;
  id v31 = v12;
  id v32 = v21;
  id v33 = self;
  id v34 = v19;
  id v35 = v15;
  id v36 = v20;
  id v25 = v20;
  id v26 = v15;
  id v27 = v19;
  id v28 = v21;
  id v29 = v12;
  [v29 join:v28 queue:v24 block:v30];
}

- (void)getAchievementsForGameDescriptor:(id)a3 players:(id)a4 handler:(id)a5
{
  id v8 = (GKGameDescriptor *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v11 = objc_alloc(&OBJC_CLASS___GKGameDescriptor);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 gameDescriptor]);
    id v8 = -[GKGameDescriptor initWithDictionary:](v11, "initWithDictionary:", v13);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameDescriptor bundleIdentifier](v8, "bundleIdentifier"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[GKGameDescriptor dictionaryForRequest](v8, "dictionaryForRequest"));
  id v17 = (void *)v16;
  if (v16)
  {
    if (v15)
    {
LABEL_5:
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100055F70;
      v27[3] = &unk_10026D488;
      void v27[4] = self;
      id v28 = v17;
      id v29 = v9;
      id v18 = v14;
      id v30 = v18;
      id v31 = v8;
      [v18 performOnManagedObjectContext:v27];
      if (v10)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 replyQueue]);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_10005621C;
        v24[3] = &unk_10026B030;
        id v26 = v10;
        id v25 = v18;
        [v25 notifyOnQueue:v20 block:v24];
      }

      goto LABEL_14;
    }
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v21 gameDescriptor]);

    if (v15) {
      goto LABEL_5;
    }
  }

  if (!os_log_GKGeneral) {
    id v22 = (id)GKOSLoggers(v16);
  }
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100067A48();
  }
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
  [v14 setError:v23];

LABEL_14:
}

- (void)submitAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1161LL,  "-[GKGameStatService submitAchievements:whileScreeningChallenges:withEligibleChallenges:handler:]"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  char v33 = 0;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 replyQueue]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000564B8;
  v26[3] = &unk_10026DD08;
  id v17 = v13;
  id v27 = v17;
  id v28 = self;
  id v18 = v9;
  id v29 = v18;
  id v19 = v14;
  id v30 = v19;
  id v31 = v32;
  [v17 performOnQueue:v16 block:v26];

  if (v11)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100056C0C;
    v22[3] = &unk_10026CFF8;
    id v25 = v32;
    v22[4] = self;
    id v24 = v11;
    id v23 = v17;
    [v23 notifyOnQueue:v21 block:v22];
  }

  _Block_object_dispose(v32, 8);
}

- (void)resetAchievementsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1245LL,  "-[GKGameStatService resetAchievementsWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 replyQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100056E08;
  v15[3] = &unk_10026B170;
  id v9 = v6;
  id v16 = v9;
  id v17 = self;
  [v9 performOnQueue:v8 block:v15];

  if (v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000571E4;
    v12[3] = &unk_10026B030;
    id v14 = v4;
    id v13 = v9;
    [v13 notifyOnQueue:v11 block:v12];
  }
}

- (void)getLeaderboardForRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 gameBundleID]);

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    [v6 setGameBundleID:v10];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1303LL,  "-[GKGameStatService getLeaderboardForRequest:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10005741C;
  v22[3] = &unk_10026B080;
  id v15 = v12;
  id v23 = v15;
  id v16 = v6;
  id v24 = v16;
  id v25 = self;
  [v15 performOnQueue:v14 block:v22];

  if (v7)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    void v19[2] = sub_1000575E4;
    v19[3] = &unk_10026B030;
    id v21 = v7;
    id v20 = v15;
    [v20 notifyOnQueue:v18 block:v19];
  }
}

- (void)submitScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1325LL,  "-[GKGameStatService submitScores:whileScreeningChallenges:withEligibleChallenges:handler:]"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v15 = v9;
  id v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      id v19 = 0LL;
      do
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * (void)v19) setDate:v14];
        id v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v17);
  }

  +[GKScoreSubmissionBulletin presentForScores:](&OBJC_CLASS___GKScoreSubmissionBulletin, "presentForScores:", v15);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000578D8;
  v28[3] = &unk_10026BEC8;
  id v20 = v15;
  id v29 = v20;
  id v30 = self;
  id v21 = v10;
  id v31 = v21;
  id v22 = v13;
  id v32 = v22;
  [v22 perform:v28];
  if (v11)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 replyQueue]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100057A28;
    v25[3] = &unk_10026B030;
    id v27 = v11;
    id v26 = v22;
    [v26 notifyOnQueue:v24 block:v25];
  }
}

- (void)cleanUpLeaderboardTitles:(id)a3 set:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameStatService cleanUpLeaderboardTitles:set:context:]",  v12));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "-[GKGameStatService cleanUpLeaderboardTitles:set:context:]",  [v15 UTF8String],  1353));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v7 count]));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 leaderboardTitleMapList]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 entries]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 _gkMapDictionaryWithKeyPath:@"identifier"]);
  [v17 addEntriesFromDictionary:v20];

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v21 = v7;
  id v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 baseLeaderboardID]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v27]);

        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedTitle]);
        [v26 setLocalizedTitle:v29];
      }

      id v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v23);
  }
}

- (void)fetchLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = sub_100057E40;
  v19[3] = &unk_10026E1E8;
  id v20 = a5;
  id v21 = v12;
  id v22 = v13;
  id v23 = a6;
  uint64_t v24 = self;
  id v25 = a7;
  id v14 = v25;
  id v15 = v23;
  id v16 = v13;
  id v17 = v12;
  id v18 = v20;
  [v15 performBlock:v19];
}

- (void)loadLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 bagKey:(id)a7 handler:(id)a8
{
  id v35 = a3;
  id v14 = a4;
  id v36 = a5;
  id v15 = a6;
  id v16 = a7;
  id v37 = a8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 playerID]);

  if (!v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    id v20 = objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]",  v18,  "-[GKGameStatService loadLeaderboardsForGameDescriptor:player:setIdentifier:context:bagKey:handler:]",  [v20 UTF8String],  1412));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v21);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1414LL,  "-[GKGameStatService loadLeaderboardsForGameDescriptor:player:setIdentifier:context:bagKey:handler:]"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v22,  v15,  v23));

  v51[0] = 0LL;
  v51[1] = v51;
  void v51[2] = 0x2020000000LL;
  v51[3] = 0LL;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 replyQueue]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100058370;
  v42[3] = &unk_10026E638;
  id v27 = v35;
  id v43 = v27;
  id v28 = v14;
  id v44 = v28;
  id v29 = v36;
  id v45 = v29;
  id v30 = v16;
  id v46 = v30;
  id v47 = self;
  v50 = v51;
  id v31 = v24;
  id v48 = v31;
  id v32 = v15;
  id v49 = v32;
  [v31 performOnQueue:v26 block:v42];

  if (v37)
  {
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 replyQueue]);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100058AA4;
    v38[3] = &unk_10026B878;
    id v40 = v37;
    id v41 = v51;
    id v39 = v31;
    [v39 notifyOnQueue:v34 block:v38];
  }

  _Block_object_dispose(v51, 8);
}

- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 handler:(id)a6
{
  id v10 = (GKGameDescriptor *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1503LL,  "-[GKGameStatService getLeaderboardsForGameDescriptor:player:setIdentifier:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);

  if (v10)
  {
    if (v11) {
      goto LABEL_6;
    }
  }

  else
  {
    id v18 = objc_alloc(&OBJC_CLASS___GKGameDescriptor);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 gameDescriptor]);
    id v21 = -[GKGameDescriptor initWithDictionary:](v18, "initWithDictionary:", v20);

    id v10 = v21;
    if (v11) {
      goto LABEL_6;
    }
  }

  uint64_t v58 = 0LL;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  uint64_t v61 = sub_10005225C;
  v62 = sub_10005226C;
  id v63 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 context]);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100058FC0;
  v55[3] = &unk_10026C320;
  id v56 = v15;
  id v57 = &v58;
  [v22 performBlockAndWait:v55];

  id v11 = (id)v59[5];
  _Block_object_dispose(&v58, 8);

  if (v11)
  {
LABEL_6:
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);

    if (v24)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      id v27 = v17;
      id v28 = v13;
      id v29 = v12;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 replyQueue]);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      void v44[2] = sub_1000590F4;
      v44[3] = &unk_10026E350;
      id v31 = &v45;
      id v11 = v11;
      id v45 = v11;
      id v39 = v10;
      id v46 = v10;
      id v40 = v15;
      id v32 = v15;
      id v47 = v32;
      id v48 = self;
      __int128 v33 = v29;
      id v34 = v29;
      id v13 = v28;
      id v17 = v27;
      id v49 = v34;
      id v50 = v27;
      [v32 performOnQueue:v30 block:v44];

      if (v13)
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 replyQueue]);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100059A5C;
        v41[3] = &unk_10026B030;
        id v43 = v13;
        id v42 = v32;
        [v42 notifyOnQueue:v36 block:v41];
      }

      id v12 = v33;
      id v10 = v39;
      id v15 = v40;
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v37 = (id)GKOSLoggers(v25);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100067B10();
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005909C;
      block[3] = &unk_10026B120;
      id v31 = &v52;
      id v52 = v13;
      dispatch_async(&_dispatch_main_q, block);
    }

    goto LABEL_20;
  }

  if (!os_log_GKGeneral) {
    id v38 = (id)GKOSLoggers(v23);
  }
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100067AE4();
  }
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100059044;
  v53[3] = &unk_10026B120;
  id v31 = &v54;
  id v54 = v13;
  dispatch_async(&_dispatch_main_q, v53);
  id v11 = 0LL;
LABEL_20:
}

- (void)setDefaultLeaderboardID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1597LL,  "-[GKGameStatService setDefaultLeaderboardID:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = sub_100059C6C;
  v19[3] = &unk_10026B080;
  id v12 = v6;
  id v20 = v12;
  id v21 = self;
  id v13 = v9;
  id v22 = v13;
  [v13 performOnQueue:v11 block:v19];

  if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100059FC8;
    v16[3] = &unk_10026B030;
    id v18 = v7;
    id v17 = v13;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)getDefaultLeaderboardIDWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKGameServicePrivate, "serviceFromService:", self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  id v12 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005A130;
  v10[3] = &unk_10026C5A0;
  id v11 = v4;
  id v9 = v4;
  [v5 getGameStatsForPlayer:0 bundleIDs:v8 handler:v10];
}

- (void)getLeaderboardSetsForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1644LL,  "-[GKGameStatService getLeaderboardSetsForGameDescriptor:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 dictionaryForRequest]);
  if (v10
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        id v10 = (id)objc_claimAutoreleasedReturnValue([v11 gameDescriptor]),
        v11,
        v10))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10005A3E0;
    v21[3] = &unk_10026BEA0;
    id v10 = v10;
    id v22 = v10;
    id v23 = v9;
    uint64_t v24 = self;
    [v12 performBlockAndWait:v21];

    id v13 = v22;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v9 setError:v13];
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10005AA98;
  void v18[3] = &unk_10026B030;
  id v19 = v9;
  id v20 = v6;
  id v16 = v9;
  id v17 = v6;
  [v16 notifyOnQueue:v15 block:v18];
}

- (void)updateLeaderboardsWithIDs:(id)a3 gameDescriptor:(id)a4 player:(id)a5 context:(id)a6 handler:(id)a7
{
  id v33 = a3;
  id v32 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 playerID]);

  if (!v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    id v18 = objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]",  v16,  "-[GKGameStatService updateLeaderboardsWithIDs:gameDescriptor:player:context:handler:]",  [v18 UTF8String],  1726));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v19);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1728LL,  "-[GKGameStatService updateLeaderboardsWithIDs:gameDescriptor:player:context:handler:]"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v20,  v13,  v21));

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 replyQueue]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10005AE18;
  v37[3] = &unk_10026E350;
  id v25 = v32;
  id v38 = v25;
  id v26 = v12;
  id v39 = v26;
  id v27 = v33;
  id v40 = v27;
  id v41 = self;
  id v28 = v22;
  id v42 = v28;
  id v29 = v13;
  id v43 = v29;
  [v28 performOnQueue:v24 block:v37];

  if (v14)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 replyQueue]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10005B378;
    v34[3] = &unk_10026B030;
    id v36 = v14;
    id v35 = v28;
    [v35 notifyOnQueue:v31 block:v34];
  }
}

+ (id)leaderboards:(id)a3 filteredWithIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005B48C;
    v10[3] = &unk_10026DEF0;
    id v11 = v7;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 _gkFilterWithBlock:v10]);
  }

  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)updateSigningStatusIfChanged:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  unsigned __int8 v6 = [v5 isDevSigned];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005B588;
  v8[3] = &unk_10026E770;
  unsigned __int8 v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];
  return v4;
}

- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 leaderboardIDs:(id)a5 setIdentifier:(id)a6 handler:(id)a7
{
  id v12 = (GKGameDescriptor *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  1811LL,  "-[GKGameStatService getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:]"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v17));

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 replyQueue]);

  if (v12
    || (id v21 = objc_alloc(&OBJC_CLASS___GKGameDescriptor),
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 gameDescriptor]),
        id v12 = -[GKGameDescriptor initWithDictionary:](v21, "initWithDictionary:", v23),
        v23,
        v22,
        v12))
  {
    if (v13)
    {
LABEL_6:
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);

      if (v27)
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_10005BCA4;
        v43[3] = &unk_10026E6D8;
        id v29 = v18;
        id v44 = v29;
        id v45 = self;
        id v30 = v12;
        id v46 = v30;
        id v31 = v13;
        id v47 = v31;
        id v48 = v15;
        id v49 = v14;
        id v32 = v20;
        id v50 = v32;
        [v29 performOnQueue:v32 block:v43];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_10005CEEC;
        v37[3] = &unk_10026B0A8;
        id v38 = v29;
        id v39 = self;
        id v13 = v31;
        id v40 = v13;
        id v12 = v30;
        id v41 = v12;
        id v42 = v16;
        [v38 notifyOnQueue:v32 block:v37];

        id v33 = v44;
      }

      else
      {
        if (!os_log_GKGeneral) {
          id v34 = (id)GKOSLoggers(v28);
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_100067BA0();
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10005BC4C;
        block[3] = &unk_10026B120;
        id v52 = v16;
        dispatch_async(&_dispatch_main_q, block);
        id v33 = v52;
      }

      goto LABEL_14;
    }

    uint64_t v58 = 0LL;
    id v59 = &v58;
    uint64_t v60 = 0x3032000000LL;
    uint64_t v61 = sub_10005225C;
    v62 = sub_10005226C;
    id v63 = 0LL;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 context]);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_10005BB70;
    v55[3] = &unk_10026C320;
    id v56 = v18;
    id v57 = &v58;
    [v25 performBlockAndWait:v55];

    id v26 = (id)v59[5];
    if (v26)
    {
      id v13 = v26;

      _Block_object_dispose(&v58, 8);
      goto LABEL_6;
    }

    if (!os_log_GKGeneral) {
      id v36 = (id)GKOSLoggers(0LL);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100067AE4();
    }
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10005BBF4;
    v53[3] = &unk_10026B120;
    id v54 = v16;
    dispatch_async(&_dispatch_main_q, v53);

    _Block_object_dispose(&v58, 8);
    id v13 = 0LL;
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v35 = (id)GKOSLoggers(v24);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100067B74();
    }
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_10005BB18;
    v64[3] = &unk_10026B120;
    id v65 = v16;
    dispatch_async(&_dispatch_main_q, v64);

    id v12 = 0LL;
  }

- (void)mixinHasActiveChallengesWithLeaderboards:(id)a3 playerID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count] && (_os_feature_enabled_impl("gseui", "de7bbd8e") & 1) != 0)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKChallengeServicePrivate, "serviceFromService:", self));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    void v19[2] = sub_10005D248;
    v19[3] = &unk_10026C8B0;
    id v20 = v10;
    id v21 = self;
    id v22 = v13;
    id v15 = v13;
    id v16 = v10;
    [v14 getActiveLeaderboardChallengeDetailsForPlayerID:v11 bundleID:v12 allowStaleChallengeDetailsData:1 completionHandler:v19];
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005D238;
    block[3] = &unk_10026B030;
    id v24 = v10;
    id v25 = v13;
    id v16 = v13;
    id v14 = v10;
    dispatch_async(v18, block);

    id v15 = v25;
  }
}

- (void)fetchLeaderboardWithRecordID:(id)a3 context:(id)a4 handler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005D544;
  v10[3] = &unk_10026B148;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  [v8 performBlock:v10];
}

- (void)loadPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 playerPlayedIn:(BOOL)a6 context:(id)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v37 = a8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 playerID]);

  if (!v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    id v20 = objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]",  v18,  "-[GKGameStatService loadPreviousInstanceForLeaderboard:gameDescriptor:player:playerPlayedIn:context:handler:]",  [v20 UTF8String],  2036));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v21);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2038LL,  "-[GKGameStatService loadPreviousInstanceForLeaderboard:gameDescriptor:player:playerPlayedIn:context:handler:]"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v22,  v16,  v23));

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 replyQueue]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10005D8D4;
  v41[3] = &unk_10026D7A0;
  id v42 = v14;
  id v43 = v15;
  BOOL v48 = a6;
  id v44 = v13;
  id v45 = self;
  id v27 = v24;
  id v46 = v27;
  id v47 = v16;
  id v28 = v16;
  id v29 = v13;
  id v30 = v15;
  id v31 = v14;
  [v27 performOnQueue:v26 block:v41];

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 replyQueue]);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10005DDC4;
  v38[3] = &unk_10026B030;
  id v39 = v27;
  id v40 = v37;
  id v34 = v27;
  id v35 = v37;
  [v34 notifyOnQueue:v33 block:v38];
}

- (void)getPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = (GKGameDescriptor *)a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2093LL,  "-[GKGameStatService getPreviousInstanceForLeaderboard:gameDescriptor:player:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  if (v11
    || (id v16 = objc_alloc(&OBJC_CLASS___GKGameDescriptor),
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 gameDescriptor]),
        id v11 = -[GKGameDescriptor initWithDictionary:](v16, "initWithDictionary:", v18),
        v18,
        v17,
        v11))
  {
    if (v12)
    {
LABEL_6:
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 playerID]);

      if (v22)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyQueue]);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_10005E4D8;
        v41[3] = &unk_10026BB28;
        id v26 = v15;
        id v42 = v26;
        id v43 = self;
        id v44 = v10;
        id v27 = v11;
        id v45 = v27;
        id v28 = v12;
        id v46 = v28;
        [v26 performOnQueue:v25 block:v41];

        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 replyQueue]);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_10005E97C;
        v35[3] = &unk_10026C8D8;
        id v36 = v26;
        id v40 = v13;
        id v37 = self;
        id v12 = v28;
        id v38 = v12;
        id v11 = v27;
        id v39 = v11;
        [v36 notifyOnQueue:v30 block:v35];

        id v31 = v42;
      }

      else
      {
        if (!os_log_GKGeneral) {
          id v32 = (id)GKOSLoggers(v23);
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_100067E04();
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10005E480;
        block[3] = &unk_10026B120;
        id v48 = v13;
        dispatch_async(&_dispatch_main_q, block);
        id v31 = v48;
      }

      goto LABEL_14;
    }

    uint64_t v54 = 0LL;
    v55 = &v54;
    uint64_t v56 = 0x3032000000LL;
    id v57 = sub_10005225C;
    uint64_t v58 = sub_10005226C;
    id v59 = 0LL;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 context]);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    void v51[2] = sub_10005E3A4;
    v51[3] = &unk_10026C320;
    id v52 = v15;
    unint64_t v53 = &v54;
    [v20 performBlockAndWait:v51];

    id v21 = (id)v55[5];
    if (v21)
    {
      id v12 = v21;

      _Block_object_dispose(&v54, 8);
      goto LABEL_6;
    }

    if (!os_log_GKGeneral) {
      id v34 = (id)GKOSLoggers(0LL);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100067DD8();
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10005E428;
    void v49[3] = &unk_10026B120;
    id v50 = v13;
    dispatch_async(&_dispatch_main_q, v49);

    _Block_object_dispose(&v54, 8);
    id v12 = 0LL;
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v33 = (id)GKOSLoggers(v19);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100067DAC();
    }
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_10005E34C;
    v60[3] = &unk_10026B120;
    id v61 = v13;
    dispatch_async(&_dispatch_main_q, v60);

    id v11 = 0LL;
  }

- (void)updatePlayersForEntries:(id)a3 localPlayerEntry:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));
  id v12 = v11;
  if (v8) {
    [v11 addObject:v8];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKAnonymousPlayerInternal internalRepresentation]( &OBJC_CLASS___GKAnonymousPlayerInternal,  "internalRepresentation"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 _gkValuesForKeyPath:@"player.playerID"]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKProfileService, "serviceFromService:", self));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = sub_10005ED00;
  v19[3] = &unk_10026C8B0;
  id v20 = v12;
  id v21 = v13;
  id v22 = v9;
  id v16 = v9;
  id v17 = v13;
  id v18 = v12;
  [v15 getProfilesForPlayerIDs:v14 handler:v19];
}

- (void)generateEntriesFromServerResponse:(id)a3 context:(id)a4 leaderboard:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2219LL,  "-[GKGameStatService generateEntriesFromServerResponse:context:leaderboard:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v14,  v13,  v15));

  if (v10)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10005F08C;
    v24[3] = &unk_10026C5C8;
    id v25 = v10;
    id v26 = v11;
    id v27 = v16;
    id v28 = self;
    [v27 performOnManagedObjectContext:v24];
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10005F734;
  v21[3] = &unk_10026B030;
  id v22 = v16;
  id v23 = v12;
  id v19 = v16;
  id v20 = v12;
  [v19 notifyOnQueue:v18 block:v21];
}

- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 handler:(id)a11
{
}

- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 locale:(id)a11 handler:(id)a12
{
  id v34 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a10;
  id v33 = a11;
  id v40 = a12;
  id v18 = a9;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2306LL,  "-[GKGameStatService loadEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range :players:context:locale:handler:]"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v19,  v17,  v20));

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 _gkMapWithBlock:&stru_10026E990]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 replyQueue]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  void v44[2] = sub_10005FAF4;
  v44[3] = &unk_10026E9E0;
  id v45 = v15;
  id v46 = v16;
  id v47 = v34;
  id v48 = self;
  int64_t v53 = a7;
  int64_t v54 = a6;
  _NSRange v55 = a8;
  id v49 = v22;
  id v50 = v33;
  id v25 = v21;
  id v51 = v25;
  id v52 = v17;
  id v39 = v17;
  id v37 = v33;
  id v35 = v22;
  id v26 = v34;
  id v27 = v16;
  id v28 = v15;
  [v25 performOnQueue:v24 block:v44];

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 replyQueue]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10005FFD0;
  v41[3] = &unk_10026B030;
  id v42 = v25;
  id v43 = v40;
  id v31 = v25;
  id v32 = v40;
  [v31 notifyOnQueue:v30 block:v41];
}

- (id)playerScopeName:(int64_t)a3
{
  if (a3 == 1) {
    return @"FRIENDS";
  }
  else {
    return @"ALL";
  }
}

- (id)timeScopeName:(int64_t)a3
{
  id v3 = @"AllTIME";
  if (a3 == 1) {
    id v3 = @"THISWEEK";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"TODAY";
  }
}

- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 handler:(id)a10
{
}

- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 locale:(id)a10 handler:(id)a11
{
  id v14 = a3;
  id v15 = (GKGameDescriptor *)a4;
  id v16 = a5;
  id v46 = a9;
  id v17 = a10;
  id v18 = a11;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2402LL,  "-[GKGameStatService getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range: players:locale:handler:]"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  if (v15
    || (id v21 = objc_alloc(&OBJC_CLASS___GKGameDescriptor),
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 gameDescriptor]),
        id v15 = -[GKGameDescriptor initWithDictionary:](v21, "initWithDictionary:", v23),
        v23,
        v22,
        v15))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 baseLeaderboardID]);
    id v26 = [v25 length];

    if (!v26)
    {
      if (!os_log_GKGeneral) {
        id v38 = (id)GKOSLoggers(v27);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100067F8C();
      }
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      id v40 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v39 replyQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100060798;
      block[3] = &unk_10026B120;
      id v75 = v18;
      dispatch_async(v40, block);

      id v37 = v75;
      goto LABEL_19;
    }

    if (v16)
    {
LABEL_7:
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v16 playerID]);

      if (v30)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 replyQueue]);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        void v50[2] = sub_10006093C;
        v50[3] = &unk_10026EA08;
        id v34 = v20;
        id v51 = v34;
        id v52 = self;
        id v53 = v14;
        id v15 = v15;
        int64_t v54 = v15;
        id v16 = v16;
        id v55 = v16;
        int64_t v58 = a6;
        int64_t v59 = a7;
        _NSRange v60 = a8;
        id v56 = v46;
        id v57 = v17;
        [v34 performOnQueue:v33 block:v50];

        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 replyQueue]);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_100060BFC;
        void v47[3] = &unk_10026B030;
        id v49 = v18;
        id v48 = v34;
        [v48 notifyOnQueue:v36 block:v47];

        id v37 = v51;
      }

      else
      {
        if (!os_log_GKGeneral) {
          id v41 = (id)GKOSLoggers(v31);
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_100067FE4();
        }
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472LL;
        v61[2] = sub_1000608DC;
        v61[3] = &unk_10026B120;
        id v62 = v18;
        dispatch_async(&_dispatch_main_q, v61);
        id v37 = v62;
      }

- (void)submitScore:(int64_t)a3 context:(unint64_t)a4 leaderboardIDs:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 gameDescriptor:(id)a9 handler:(id)a10
{
  id v14 = a6;
  id v15 = a8;
  id v16 = a10;
  id v17 = a9;
  id v18 = a5;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2478LL,  "-[GKGameStatService submitScore:context:leaderboardIDs:forPlayer:whileScreeningChallenges:withEligib leChallenges:gameDescriptor:handler:]"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v18));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100060E94;
  v30[3] = &unk_10026EAA8;
  id v31 = v21;
  id v32 = v14;
  id v33 = v22;
  id v34 = v20;
  id v35 = self;
  id v36 = v15;
  int64_t v38 = a3;
  unint64_t v39 = a4;
  id v37 = v16;
  id v23 = v16;
  id v24 = v15;
  id v25 = v20;
  id v26 = v22;
  id v27 = v14;
  id v28 = v21;
  -[GKGameStatService getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:]( self,  "getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:",  v17,  v27,  v26,  0LL,  v30);
}

- (void)submitInstanceScore:(int64_t)a3 context:(unint64_t)a4 leaderboard:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 handler:(id)a9
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2580LL,  "-[GKGameStatService submitInstanceScore:context:leaderboard:forPlayer:whileScreeningChallenges:withE ligibleChallenges:handler:]"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v18));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100061DB8;
  v30[3] = &unk_10026EAD0;
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v31 = v20;
  id v21 = v14;
  id v32 = v21;
  int64_t v37 = a3;
  unint64_t v38 = a4;
  id v22 = v15;
  id v33 = v22;
  id v23 = v16;
  id v34 = v23;
  id v35 = self;
  id v24 = v19;
  id v36 = v24;
  [v24 perform:v30];
  if (v17)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 replyQueue]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100062184;
    v27[3] = &unk_10026B310;
    id v28 = v24;
    id v29 = v17;
    [v28 notifyOnQueue:v26 block:v27];
  }
}

- (void)createLeaderboardBasedOnID:(id)a3 recipients:(id)a4 inviteMessage:(id)a5 context:(id)a6 duration:(double)a7 handler:(id)a8
{
  if (a8) {
    (*((void (**)(id, void, void, double))a8 + 2))(a8, 0LL, 0LL, a7);
  }
}

- (void)startLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)endLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)deleteLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)getLeaderboardSummaryForGameDescriptor:(id)a3 localPlayer:(id)a4 baseLeaderboardID:(id)a5 leaderboardID:(id)a6 timeScope:(int64_t)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (v14 && v16)
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 dictionaryForRequest]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v20, @"game");
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 playerID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, @"player-id");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v16,  @"base-leaderboard-id");
    if ([v17 length]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v17,  @"leaderboard-id");
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameStatService timeScopeName:](self, "timeScopeName:", a7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v22, @"time-scope");

    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000624B4;
    v26[3] = &unk_10026C6B8;
    void v26[4] = self;
    id v27 = v18;
    [v23 issueRequest:v19 bagKey:@"gk-get-leaderboard-summary" clientProxy:v24 handler:v26];
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  16LL,  0LL));
    (*((void (**)(id, void, void *))v18 + 2))(v18, 0LL, v25);
  }
}

@end