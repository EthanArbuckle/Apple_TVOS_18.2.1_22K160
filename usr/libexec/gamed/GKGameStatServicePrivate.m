@interface GKGameStatServicePrivate
+ (Class)interfaceClass;
+ (id)currentFriendsPlayedList:(id)a3;
+ (id)filterUnreportedAndHiddenAchievements:(id)a3 includeUnreported:(BOOL)a4 includeHidden:(BOOL)a5;
+ (unint64_t)requiredEntitlements;
- (id)currentLocalPlayer;
- (id)ensureGameObject:(id)a3 gameDescriptor:(id)a4;
- (id)ensureGameObjectsForDescriptors:(id)a3 moc:(id)a4;
- (id)existingReengagementAchievement:(id)a3 context:(id)a4;
- (id)findAchievementInternal:(id)a3 identifier:(id)a4 context:(id)a5 existingPercent:(double)a6 existingDate:(id)a7;
- (id)getCachedAcievementListForLocalPlayer:(id)a3 context:(id)a4;
- (id)processReengagementResults:(id)a3 localPlayer:(id)a4 expirationDate:(id)a5 context:(id)a6;
- (void)clearAchievementsCacheWithHandler:(id)a3;
- (void)clearLeaderboardsCacheWithHandler:(id)a3;
- (void)expireGamesFriendsPlayed;
- (void)getAchievementLeaderboardForRequest:(id)a3 handler:(id)a4;
- (void)getEntriesForLeaderboard:(id)a3 fetchOptions:(unint64_t)a4 gameDescriptor:(id)a5 localPlayer:(id)a6 playerScope:(int64_t)a7 timeScope:(int64_t)a8 range:(_NSRange)a9 players:(id)a10 handler:(id)a11;
- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 fetchOptions:(unint64_t)a5 withinSecs:(int64_t)a6 matchingBundleIDs:(id)a7 handler:(id)a8;
- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 withinSecs:(int64_t)a5 matchingBundleIDs:(id)a6 handler:(id)a7;
- (void)getHypotheticalLeaderboardRanksForScores:(id)a3 forGameDescriptor:(id)a4 handler:(id)a5;
- (void)getReengagementAchievement:(id)a3;
- (void)getReengagementAchievements:(id)a3;
- (void)loadAchievementsForGameWithProfileFetchOptions:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 profileFetchOptions:(unint64_t)a7 withCompletionHandler:(id)a8;
- (void)loadGamesFriendsPlayed:(id)a3 matchingBundleIDs:(id)a4 handler:(id)a5;
- (void)loadReengagementAchievements:(id)a3 handler:(id)a4;
@end

@implementation GKGameStatServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKGameStatServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x100000LL;
}

+ (id)filterUnreportedAndHiddenAchievements:(id)a3 includeUnreported:(BOOL)a4 includeHidden:(BOOL)a5
{
  id v7 = a3;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100062970;
  v14 = &unk_10026EB18;
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v16 = a4;
  BOOL v17 = a5;
  v8 = v15;
  [v7 enumerateKeysAndObjectsUsingBlock:&v11];

  id v9 = -[NSMutableDictionary copy](v8, "copy", v11, v12, v13, v14);
  return v9;
}

- (void)loadAchievementsForGameWithProfileFetchOptions:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 profileFetchOptions:(unint64_t)a7 withCompletionHandler:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100062B70;
  v15[3] = &unk_10026EC08;
  BOOL v16 = self;
  id v17 = a3;
  BOOL v20 = a5;
  BOOL v21 = a6;
  id v18 = a4;
  id v19 = a8;
  id v12 = v19;
  id v13 = v18;
  id v14 = v17;
  -[GKGameStatService getAchievementsForGameDescriptor:players:handler:]( v16,  "getAchievementsForGameDescriptor:players:handler:",  v14,  v13,  v15);
}

- (void)getEntriesForLeaderboard:(id)a3 fetchOptions:(unint64_t)a4 gameDescriptor:(id)a5 localPlayer:(id)a6 playerScope:(int64_t)a7 timeScope:(int64_t)a8 range:(_NSRange)a9 players:(id)a10 handler:(id)a11
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a10;
  id v18 = a11;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  2840LL,  "-[GKGameStatServicePrivate getEntriesForLeaderboard:fetchOptions:gameDescriptor:localPlayer:playerSc ope:timeScope:range:players:handler:]"));
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100063288;
  v35[3] = &unk_10026EC30;
  v35[4] = self;
  id v36 = v14;
  id v37 = v15;
  id v38 = v16;
  int64_t v42 = a8;
  _NSRange v43 = a9;
  int64_t v41 = a7;
  id v39 = v17;
  id v21 = v20;
  id v40 = v21;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  [v21 perform:v35];
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 replyQueue]);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100063420;
  v32[3] = &unk_10026B030;
  id v33 = v21;
  id v34 = v18;
  id v28 = v21;
  id v29 = v18;
  [v28 notifyOnQueue:v27 block:v32];
}

- (void)getAchievementLeaderboardForRequest:(id)a3 handler:(id)a4
{
}

- (void)getHypotheticalLeaderboardRanksForScores:(id)a3 forGameDescriptor:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v9)
    {
      if ([v8 count])
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceFromService:]( &OBJC_CLASS___GKGameServicePrivate,  "serviceFromService:",  self));
        BOOL v20 = v11;
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_10006369C;
        v15[3] = &unk_10026EC80;
        id v19 = v10;
        id v16 = v8;
        id v17 = v9;
        id v18 = self;
        [v12 getGameStatsForPlayer:0 bundleIDs:v13 handler:v15];
      }

      else
      {
        (*((void (**)(id, void *, void))v10 + 2))(v10, &__NSArray0__struct, 0LL);
      }
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
    }
  }
}

- (id)currentLocalPlayer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "primaryCredentialForEnvironment:conformsToMultiUserRestrictions:gameID:",  objc_msgSend(v4, "environment"),  0,  0));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerInternal]);

  return v6;
}

- (id)ensureGameObjectsForDescriptors:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _gkMapWithBlock:&stru_10026ECA0]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gamesForBundleIDs:context:]( &OBJC_CLASS___GKGameCacheObject,  "gamesForBundleIDs:context:",  v7,  v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100063B58;
  v11[3] = &unk_10026ECC8;
  id v12 = v5;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:v11];

  return v8;
}

- (id)ensureGameObject:(id)a3 gameDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle-id"]);
  id v8 = (GKGameCacheObject *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gameForBundleID:context:]( &OBJC_CLASS___GKGameCacheObject,  "gameForBundleID:context:",  v7,  v5));
  if (v8
    || (id v8 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKGameCacheObject),  "initWithManagedObjectContext:",  v5),  -[GKGameCacheObject setBundleID:](v8, "setBundleID:", v7),  v8))
  {
    -[GKGameCacheObject updateWithGameDescriptor:](v8, "updateWithGameDescriptor:", v6);
  }

  return v8;
}

- (void)loadGamesFriendsPlayed:(id)a3 matchingBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  uint64_t v12 = GKBagKeyGamesFriendsPlayed;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100063D74;
  v16[3] = &unk_10026ED60;
  id v17 = v8;
  id v18 = v9;
  v16[4] = self;
  id v14 = v8;
  id v15 = v9;
  [v11 issueRequest:v10 bagKey:v12 clientProxy:v13 handler:v16];
}

+ (id)currentFriendsPlayedList:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FriendsPlayedGameList _gkFetchRequest](&OBJC_CLASS___FriendsPlayedGameList, "_gkFetchRequest"));
  id v26 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v4 error:&v26]);
  id v6 = v26;
  id v7 = v6;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(v6);
    }
    id v9 = (os_log_s *)os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v28 = v7;
    id v10 = "Could not fetch data from cache: %@";
    v11 = v9;
    uint32_t v12 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
LABEL_7:
    id v13 = 0LL;
    goto LABEL_8;
  }

  id v15 = [v5 count];
  uint64_t v16 = (uint64_t)v15;
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers(v15);
  }
  id v18 = (void *)os_log_GKDaemon;
  BOOL v19 = os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO);
  if (v19)
  {
    BOOL v20 = v18;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
    *(_DWORD *)buf = 138412290;
    id v28 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "currentCacheCount: %@", buf, 0xCu);
  }

  if (!v16)
  {
    if (!os_log_GKGeneral) {
      id v24 = (id)GKOSLoggers(v19);
    }
    id v25 = (os_log_s *)os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v10 = "No gameFriendsPlayed data in cache, hitting server";
    v11 = v25;
    uint32_t v12 = 2;
    goto LABEL_6;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
  if (v16 >= 2)
  {
    for (uint64_t i = 1LL; i != v16; ++i)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:i]);
      [v3 deleteObject:v23];
    }
  }

- (void)expireGamesFriendsPlayed
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  v4 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Expiring games friends played", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  3110LL,  "-[GKGameStatServicePrivate expireGamesFriendsPlayed]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameStatServicePrivate currentLocalPlayer](self, "currentLocalPlayer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playerID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v5,  v7));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100064D74;
  v9[3] = &unk_10026C810;
  v9[4] = self;
  [v8 performOnManagedObjectContext:v9];
}

- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 withinSecs:(int64_t)a5 matchingBundleIDs:(id)a6 handler:(id)a7
{
}

- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 fetchOptions:(unint64_t)a5 withinSecs:(int64_t)a6 matchingBundleIDs:(id)a7 handler:(id)a8
{
  id v13 = a4;
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameStatServicePrivate currentLocalPlayer](self, "currentLocalPlayer"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKFriendServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v17,  v16));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100064FB8;
  v23[3] = &unk_10026EDB0;
  id v28 = v15;
  int64_t v29 = a3;
  int64_t v30 = a6;
  id v24 = v13;
  id v25 = self;
  id v26 = v16;
  id v27 = v14;
  id v19 = v14;
  id v20 = v16;
  id v21 = v13;
  id v22 = v15;
  [v18 getFriendsForPlayer:v20 commonFriends:0 handler:v23];
}

- (id)getCachedAcievementListForLocalPlayer:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "localPlayerInManagedObjectContext:",  v5));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gameForBundleID:context:]( &OBJC_CLASS___GKGameCacheObject,  "gameForBundleID:context:",  v6,  v5));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 achievementLists]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 achievementLists]);
  [v10 intersectSet:v11];

  uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 anyObject]);
  return v12;
}

- (id)findAchievementInternal:(id)a3 identifier:(id)a4 context:(id)a5 existingPercent:(double)a6 existingDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheObject fetchRequestForContext:]( &OBJC_CLASS___GKAchievementDescriptionListCacheObject,  "fetchRequestForContext:",  v14));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"game.bundleID == %@",  v12));
  [v16 setPredicate:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 executeFetchRequest:v16 error:0]);
  if (![v18 count])
  {
    id v30 = 0LL;
    goto LABEL_35;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[GKGameStatServicePrivate getCachedAcievementListForLocalPlayer:context:]( self,  "getCachedAcievementListForLocalPlayer:context:",  v12,  v14));
  id v51 = v12;
  id v52 = v15;
  v50 = v16;
  v53 = v19;
  v54 = v18;
  if (v19)
  {
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 entries]);
    id v21 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v21)
    {
      id v22 = v21;
      id v23 = 0LL;
      uint64_t v24 = *(void *)v60;
      do
      {
        for (uint64_t i = 0LL; i != v22; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v60 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
          unsigned int v28 = [v27 isEqualToString:v13];

          if (v28)
          {
            id v29 = v26;

            id v23 = v29;
          }
        }

        id v22 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }

      while (v22);

      if (v23) {
        goto LABEL_18;
      }
    }

    else
    {
    }

    [v53 expire];
  }

  id v23 = 0LL;
LABEL_18:
  v31 = (void *)objc_claimAutoreleasedReturnValue([v54 objectAtIndexedSubscript:0]);
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 entries]);
  id v33 = [v32 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v33)
  {
    id v34 = v33;
    v48 = v31;
    id v49 = v14;
    v35 = 0LL;
    uint64_t v36 = *(void *)v56;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v56 != v36) {
          objc_enumerationMutation(v32);
        }
        id v38 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
        unsigned int v40 = [v39 isEqualToString:v13];

        if (v40)
        {
          id v41 = v38;

          v35 = v41;
        }
      }

      id v34 = [v32 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }

    while (v34);

    if (v35)
    {
      int64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v35 internalRepresentation]);
      [v23 percentComplete];
      double v44 = v43;
      id v14 = v49;
      if (v44 >= a6)
      {
        [v23 percentComplete];
        [v42 setPercentComplete:v45];
        v46 = (void *)objc_claimAutoreleasedReturnValue([v23 lastReportedDate]);
        [v42 setLastReportedDate:v46];
      }

      else
      {
        *(float *)&double v44 = a6;
        [v23 setPercentComplete:v44];
        [v23 setLastReportedDate:v52];
        [v42 setPercentComplete:a6];
        [v42 setLastReportedDate:v52];
      }

      v31 = v48;
      id v30 = v42;
    }

    else
    {
      id v30 = 0LL;
      v31 = v48;
      id v14 = v49;
    }
  }

  else
  {

    v35 = 0LL;
    id v30 = 0LL;
  }

  id v12 = v51;
  id v15 = v52;
  uint64_t v16 = v50;
  id v18 = v54;
LABEL_35:

  return v30;
}

- (id)existingReengagementAchievement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ReengagementAchievementEntry _gkFetchRequest]( &OBJC_CLASS___ReengagementAchievementEntry,  "_gkFetchRequest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"playerID == %@",  v5));
  [v7 setPredicate:v8];

  id v23 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v7 error:&v23]);
  id v10 = v23;
  v11 = v10;
  if (v10)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v10);
    }
    id v13 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Could not fetch reengagement data from cache: %@",  buf,  0xCu);
    }

    id v14 = 0LL;
  }

  else
  {
    uint64_t v15 = (uint64_t)[v9 count];
    id v14 = (void *)v15;
    if (v15)
    {
      if (v15 >= 2)
      {
        if (!os_log_GKGeneral) {
          id v16 = (id)GKOSLoggers(v15);
        }
        id v17 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          id v18 = v17;
          id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
          *(_DWORD *)buf = 138412290;
          id v25 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "more than one reengagementAchievement need to cleanup: %@",  buf,  0xCu);
        }

        uint64_t v20 = 1LL;
        do
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v20]);
          [v6 deleteObject:v21];

          ++v20;
        }

        while (v14 != (void *)v20);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);
    }
  }

  return v14;
}

- (id)processReengagementResults:(id)a3 localPlayer:(id)a4 expirationDate:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"achievements"]);
    if ([v15 count])
    {
      id v47 = v12;
      v46 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"game"]);
      uint64_t v45 = objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"bundle-id"]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
      uint64_t v43 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"achievement-id"]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"achievement-pct"]);
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"timestamp"]);
      [v41 doubleValue];
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  v18 / 1000.0));
      uint64_t v20 = v11;
      id v21 = (void *)v19;
      v48 = v20;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 playerID]);
      id v23 = (ReengagementAchievementEntry *)objc_claimAutoreleasedReturnValue( -[GKGameStatServicePrivate existingReengagementAchievement:context:]( self,  "existingReengagementAchievement:context:",  v22,  v13));

      double v44 = v14;
      int64_t v42 = v15;
      if (v23)
      {
        if (!os_log_GKGeneral) {
          id v25 = (id)GKOSLoggers(v24);
        }
        id v26 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Using existing reengagement entry: %@",  buf,  0xCu);
        }

        id v27 = (void *)v45;
        unsigned int v28 = (void *)v43;
      }

      else
      {
        if (!os_log_GKGeneral) {
          id v34 = (id)GKOSLoggers(v24);
        }
        unsigned int v40 = self;
        v35 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Creating new reengagement entry", buf, 2u);
        }

        uint64_t v36 = objc_alloc(&OBJC_CLASS___ReengagementAchievementEntry);
        id v37 = (void *)objc_claimAutoreleasedReturnValue(+[ReengagementAchievementEntry entity](&OBJC_CLASS___ReengagementAchievementEntry, "entity"));
        id v23 = -[ReengagementAchievementEntry initWithEntity:insertIntoManagedObjectContext:]( v36,  "initWithEntity:insertIntoManagedObjectContext:",  v37,  v13);

        id v27 = (void *)v45;
        -[ReengagementAchievementEntry setBundleID:](v23, "setBundleID:", v45);
        unsigned int v28 = (void *)v43;
        -[ReengagementAchievementEntry setIdentifier:](v23, "setIdentifier:", v43);
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v48 playerID]);
        -[ReengagementAchievementEntry setPlayerID:](v23, "setPlayerID:", v38);

        self = v40;
      }

      -[ReengagementAchievementEntry setPercentComplete:](v23, "setPercentComplete:", v17);
      -[ReengagementAchievementEntry setLastReportedDate:](v23, "setLastReportedDate:", v21);
      -[ReengagementAchievementEntry setExpirationDate:](v23, "setExpirationDate:", v47);
      [v17 doubleValue];
      id v31 = (id)objc_claimAutoreleasedReturnValue( -[GKGameStatServicePrivate findAchievementInternal:identifier:context:existingPercent:existingDate:]( self,  "findAchievementInternal:identifier:context:existingPercent:existingDate:",  v27,  v28,  v13,  v21));

      id v12 = v47;
      id v11 = v48;
      id v14 = v44;
      uint64_t v15 = v42;
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v32 = (id)GKOSLoggers(0LL);
      }
      id v33 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Zero reengagement achievements from server",  buf,  2u);
      }

      id v31 = 0LL;
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v29 = (id)GKOSLoggers(0LL);
    }
    id v30 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Zero server results for reengagement", buf, 2u);
    }

    id v31 = 0LL;
  }

  return v31;
}

- (void)loadReengagementAchievements:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000663A8;
  v13[3] = &unk_10026EE50;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v11 = v6;
  id v12 = v7;
  [v9 issueRequest:v8 bagKey:@"gk-reengagement-achievements" clientProxy:v10 handler:v13];
}

- (void)getReengagementAchievements:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100066C84;
  v5[3] = &unk_10026EE78;
  id v6 = a3;
  id v4 = v6;
  -[GKGameStatServicePrivate getReengagementAchievement:](self, "getReengagementAchievement:", v5);
}

- (void)getReengagementAchievement:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "primaryCredentialForEnvironment:conformsToMultiUserRestrictions:gameID:",  objc_msgSend(v6, "environment"),  0,  0));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerInternal]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  3420LL,  "-[GKGameStatServicePrivate getReengagementAchievement:]"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 playerID]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v9,  v10));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100066E10;
    v14[3] = &unk_10026D328;
    v14[4] = self;
    id v15 = v8;
    id v16 = v11;
    id v17 = v4;
    id v12 = v11;
    id v13 = v8;
    [v12 performOnManagedObjectContext:v14];
  }
}

- (void)clearAchievementsCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  3455LL,  "-[GKGameStatServicePrivate clearAchievementsCacheWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100067520;
  v18[3] = &unk_10026C810;
  id v7 = v6;
  id v19 = v7;
  [v7 performOnManagedObjectContext:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000675EC;
  v16[3] = &unk_10026C810;
  id v8 = v7;
  id v17 = v8;
  [v8 performOnManagedObjectContext:v16];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 replyQueue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000676B8;
  v13[3] = &unk_10026B030;
  id v14 = v8;
  id v15 = v4;
  id v11 = v8;
  id v12 = v4;
  [v11 notifyOnQueue:v10 block:v13];
}

- (void)clearLeaderboardsCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameStatService.m",  3484LL,  "-[GKGameStatServicePrivate clearLeaderboardsCacheWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006786C;
  v15[3] = &unk_10026C810;
  id v7 = v6;
  id v16 = v7;
  [v7 performOnManagedObjectContext:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100067938;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

@end