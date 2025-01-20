@interface GKGameServicePrivate
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthenticationForSelector:(SEL)a3;
- (id)ampController;
- (id)cachedGamesPlayed:(id)a3 context:(id)a4;
- (id)internalGameSummariesFromResults:(id)a3 limit:(id)a4;
- (void)addGameActivityForActivityType:(id)a3 BundleID:(id)a4 userInfo:(id)a5 handler:(id)a6;
- (void)clearAppMetadataCacheWithCompletion:(id)a3;
- (void)clearGlobalGameCacheWithHandler:(id)a3;
- (void)fetchActivitiesForBundleID:(id)a3 ascending:(BOOL)a4 handler:(id)a5;
- (void)fetchGameMetadataForBundleIDs:(id)a3 responseKind:(int)a4 context:(id)a5 handler:(id)a6;
- (void)fetchGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)fetchGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)fetchGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchInstalledGameIdCacheWithHandler:(id)a3;
- (void)fetchOnDeviceMultiplayerGamesInContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5;
- (void)fetchRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchTopGamesInContext:(id)a3 handler:(id)a4;
- (void)getAppMetadataForBundleIDs:(id)a3 adamIDs:(id)a4 withCompletion:(id)a5;
- (void)getFriendListAccessForAllGames:(id)a3;
- (void)getGameInstallDataForBundleIDs:(id)a3 withCompletion:(id)a4;
- (void)getGameMetadataForBundleIDs:(id)a3 handler:(id)a4;
- (void)getGameStatsForPlayer:(id)a3 bundleIDs:(id)a4 handler:(id)a5;
- (void)getGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 handler:(id)a5;
- (void)getGamesPlayedMetaData:(id)a3 handler:(id)a4;
- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 handler:(id)a5;
- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 withinSecs:(id)a5 handler:(id)a6;
- (void)getGamesWithAchievementStatsForPlayer:(id)a3 handler:(id)a4;
- (void)getOnDeviceMultiplayerGamesForBundleIDs:(id)a3 handler:(id)a4;
- (void)getTopGamesWithHandler:(id)a3;
- (void)loadGameMetadataForBundleIDs:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 context:(id)a5 handler:(id)a6;
- (void)loadGamesForPlayer:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadOnDeviceMultiplayerGamesWithContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5;
- (void)loadRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadTopGamesWithContext:(id)a3 handler:(id)a4;
- (void)removeAllGameActivitiesForBundleID:(id)a3 handler:(id)a4;
- (void)removeAllGameActivitiesWithHandler:(id)a3;
- (void)removeGameForBundleID:(id)a3 handler:(id)a4;
- (void)restoreGameIdCacheWithHandler:(id)a3;
- (void)scanInstalledGamesForPlayer:(id)a3 transaction:(id)a4;
- (void)submitFriendListAccess:(id)a3 value:(id)a4 handler:(id)a5;
- (void)triggerGameActivityForChallenge:(id)a3 bundleID:(id)a4 handler:(id)a5;
@end

@implementation GKGameServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKGameServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x100000LL;
}

- (id)cachedGamesPlayed:(id)a3 context:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"playerID == %@",  a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GamesPlayed _gkFetchRequest](&OBJC_CLASS___GamesPlayed, "_gkFetchRequest"));
  [v7 setPredicate:v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 executeFetchRequest:v7 error:0]);
  if ([v8 count])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    if ((unint64_t)[v8 count] >= 2)
    {
      unint64_t v10 = 1LL;
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v10]);
        [v5 deleteObject:v11];

        ++v10;
      }

      while (v10 < (unint64_t)[v8 count]);
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (void)submitFriendListAccess:(id)a3 value:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[GKPlayerGameSettingsNetworkRequest initWithBundleID:value:]( objc_alloc(&OBJC_CLASS___GKPlayerGameSettingsNetworkRequest),  "initWithBundleID:value:",  v10,  v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003D674;
  v15[3] = &unk_10026D3C0;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v12 writeToNetwork:v11 clientProxy:v13 handler:v15];
}

- (void)getGamesPlayedMetaData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  626LL,  "-[GKGameServicePrivate getGamesPlayedMetaData:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003DA60;
  v18[3] = &unk_10026D438;
  id v10 = v6;
  id v19 = v10;
  id v11 = v7;
  id v22 = v11;
  id v12 = v9;
  id v20 = v12;
  v21 = self;
  [v12 performOnManagedObjectContext:v18];
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10003E8FC;
    v15[3] = &unk_10026B310;
    id v16 = v12;
    id v17 = v11;
    [v16 notifyOnQueue:v14 block:v15];
  }
}

- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 handler:(id)a5
{
}

- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 withinSecs:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers(v13);
  }
  id v16 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v34 = self;
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "getGamesPlayedSummaries called from:%@ for: %@",  buf,  0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10003EBA8;
  v27[3] = &unk_10026D488;
  id v18 = v10;
  id v28 = v18;
  id v19 = v17;
  id v29 = v19;
  id v20 = v12;
  id v30 = v20;
  v31 = self;
  id v21 = v11;
  id v32 = v21;
  [v19 performOnManagedObjectContext:v27];
  if (v14)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10003F64C;
    v24[3] = &unk_10026B310;
    id v25 = v19;
    id v26 = v14;
    [v25 notifyOnQueue:v23 block:v24];
  }
}

- (void)getGameInstallDataForBundleIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameInstallDataFetcher createAndReturnError:]( &OBJC_CLASS___GKGameInstallDataFetcher,  "createAndReturnError:",  &v18));
  id v9 = v18;
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003F7FC;
    block[3] = &unk_10026B030;
    id v17 = v7;
    id v16 = v9;
    dispatch_async(v11, block);

    id v12 = v17;
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10003F810;
    v13[3] = &unk_10026C550;
    v13[4] = self;
    id v14 = v7;
    [v8 fetchGameInstallInfoFor:v6 completionHandler:v13];
    id v12 = v14;
  }
}

- (id)ampController
{
  return +[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller");
}

- (void)getAppMetadataForBundleIDs:(id)a3 adamIDs:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  903LL,  "-[GKGameServicePrivate getAppMetadataForBundleIDs:adamIDs:withCompletion:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10003FAC8;
  v23[3] = &unk_10026BEC8;
  v23[4] = self;
  id v13 = v12;
  id v24 = v13;
  id v25 = v8;
  id v26 = v9;
  id v14 = v9;
  id v15 = v8;
  [v13 perform:v23];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10003FDDC;
  v20[3] = &unk_10026B030;
  id v21 = v13;
  id v22 = v10;
  id v18 = v13;
  id v19 = v10;
  [v18 notifyOnQueue:v17 block:v20];
}

- (void)clearAppMetadataCacheWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  940LL,  "-[GKGameServicePrivate clearAppMetadataCacheWithCompletion:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003FFA0;
  v15[3] = &unk_10026B170;
  void v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100040120;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (id)internalGameSummariesFromResults:(id)a3 limit:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameServicePrivate internalGameSummariesFromResults:limit:]",  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "-[GKGameServicePrivate internalGameSummariesFromResults:limit:]",  [v12 UTF8String],  968));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v5 count])
  {
    id v15 = [v5 count];
    id v31 = v6;
    if (v6)
    {
      id v16 = [v6 longValue];
      if (v16 >= [v5 count]) {
        id v15 = [v5 count];
      }
      else {
        id v15 = [v6 longValue];
      }
    }

    id v17 = v15;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v32 = v5;
    id v18 = v5;
    id v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v34;
      uint64_t v22 = GKGameCenterIdentifier;
LABEL_10:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(void **)(*((void *)&v33 + 1) + 8 * v23);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleID]);
        unsigned __int8 v26 = [v25 isEqualToString:v22];

        if ((v26 & 1) == 0)
        {
          v27 = -[GKGameSummaryInternal initWithGameSummary:]( objc_alloc(&OBJC_CLASS___GKGameSummaryInternal),  "initWithGameSummary:",  v24);
          -[NSMutableArray addObject:](v14, "addObject:", v27);
          id v28 = -[NSMutableArray count](v14, "count");

          if (v28 >= v17) {
            break;
          }
        }

        if (v20 == (id)++v23)
        {
          id v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v20) {
            goto LABEL_10;
          }
          break;
        }
      }
    }

    id v6 = v31;
    id v5 = v32;
  }

  id v29 = -[NSMutableArray copy](v14, "copy");

  return v29;
}

- (BOOL)requiresAuthenticationForSelector:(SEL)a3
{
  if (sel_isEqual("getTopGamesWithHandler:", a3)) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKGameServicePrivate;
  return -[GKService requiresAuthenticationForSelector:](&v6, "requiresAuthenticationForSelector:", a3);
}

- (void)fetchTopGamesInContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1004LL,  "-[GKGameServicePrivate fetchTopGamesInContext:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v8,  v6,  v9));

  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  char v28 = 0;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000406B4;
  v21[3] = &unk_10026D518;
  id v11 = v10;
  id v22 = v11;
  uint64_t v23 = v25;
  id v24 = v27;
  [v11 performOnManagedObjectContext:v21];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000407B0;
  v16[3] = &unk_10026C160;
  id v14 = v7;
  id v18 = v14;
  id v15 = v11;
  id v17 = v15;
  id v19 = v27;
  id v20 = v25;
  [v15 notifyOnQueue:v13 block:v16];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

- (void)loadTopGamesWithContext:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1028LL,  "-[GKGameServicePrivate loadTopGamesWithContext:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v8,  v7,  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000409F0;
  v21[3] = &unk_10026B170;
  void v21[4] = self;
  id v13 = v10;
  id v22 = v13;
  [v13 performOnQueue:v12 block:v21];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100040C64;
  v18[3] = &unk_10026B030;
  id v19 = v13;
  id v20 = v6;
  id v16 = v13;
  id v17 = v6;
  [v16 notifyOnQueue:v15 block:v18];
}

- (void)getTopGamesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1065LL,  "-[GKGameServicePrivate getTopGamesWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100040E3C;
  v14[3] = &unk_10026B170;
  v14[4] = self;
  id v7 = v6;
  id v15 = v7;
  [v7 perform:v14];
  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10004133C;
    v10[3] = &unk_10026B148;
    id v11 = v7;
    id v12 = self;
    id v13 = v4;
    [v11 notifyOnQueue:v9 block:v10];
  }
}

- (void)fetchOnDeviceMultiplayerGamesInContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1122LL,  "-[GKGameServicePrivate fetchOnDeviceMultiplayerGamesInContext:forBundleIDs:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v11,  v8,  v12));

  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  char v33 = 0;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  char v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100041810;
  void v25[3] = &unk_10026D5E0;
  id v14 = v9;
  id v26 = v14;
  id v15 = v13;
  id v27 = v15;
  char v28 = v30;
  id v29 = v32;
  [v15 performOnManagedObjectContext:v25];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100041A80;
  v20[3] = &unk_10026C160;
  id v18 = v10;
  id v22 = v18;
  id v19 = v15;
  id v21 = v19;
  uint64_t v23 = v32;
  id v24 = v30;
  [v19 notifyOnQueue:v17 block:v20];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

- (void)loadOnDeviceMultiplayerGamesWithContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1160LL,  "-[GKGameServicePrivate loadOnDeviceMultiplayerGamesWithContext:forBundleIDs:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v11,  v10,  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100041CEC;
  void v25[3] = &unk_10026B080;
  id v26 = v8;
  id v27 = self;
  id v16 = v13;
  id v28 = v16;
  id v17 = v8;
  [v16 performOnQueue:v15 block:v25];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyQueue]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100041FEC;
  v22[3] = &unk_10026B030;
  id v23 = v16;
  id v24 = v9;
  id v20 = v16;
  id v21 = v9;
  [v20 notifyOnQueue:v19 block:v22];
}

- (void)getOnDeviceMultiplayerGamesForBundleIDs:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1192LL,  "-[GKGameServicePrivate getOnDeviceMultiplayerGamesForBundleIDs:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000421E4;
  v17[3] = &unk_10026B080;
  v17[4] = self;
  id v10 = v9;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  [v10 perform:v17];
  if (v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100042750;
    v14[3] = &unk_10026B030;
    id v16 = v7;
    id v15 = v10;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)scanInstalledGamesForPlayer:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000428A0;
  v12[3] = &unk_10026B080;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [v11 performOnQueue:v9 block:v12];
}

- (void)fetchGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  char v40 = 0;
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x2020000000LL;
  BOOL v38 = a5 == 2;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1311LL,  "-[GKGameServicePrivate fetchGamesForPlayer:includeInstalled:responseKind:context:handler:]"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v15,  v13,  v16));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10004318C;
  v29[3] = &unk_10026D6E8;
  id v18 = v12;
  id v30 = v18;
  char v33 = v37;
  __int128 v34 = v39;
  int v35 = a5;
  id v19 = v17;
  BOOL v36 = a4;
  id v31 = v19;
  id v32 = self;
  [v19 performOnManagedObjectContext:v29];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100043710;
  v24[3] = &unk_10026C160;
  id v22 = v14;
  id v26 = v22;
  id v23 = v19;
  id v25 = v23;
  id v27 = v39;
  id v28 = v37;
  [v23 notifyOnQueue:v21 block:v24];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

- (void)loadGamesForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1386LL,  "-[GKGameServicePrivate loadGamesForPlayer:context:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v11,  v9,  v12));

  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  void v27[3] = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10004398C;
  v22[3] = &unk_10026D840;
  id v14 = v8;
  id v23 = v14;
  id v15 = v13;
  id v24 = v15;
  id v25 = self;
  id v26 = v27;
  [v15 performOnManagedObjectContext:v22];
  if (v10)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100044480;
    v18[3] = &unk_10026B878;
    id v20 = v10;
    id v21 = v27;
    id v19 = v15;
    [v19 notifyOnQueue:v17 block:v18];
  }

  _Block_object_dispose(v27, 8);
}

- (void)getGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1477LL,  "-[GKGameServicePrivate getGamesForPlayer:includeInstalled:handler:]"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 playerID]);
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKLocalPlayerInternal internalRepresentation]( &OBJC_CLASS___GKLocalPlayerInternal,  "internalRepresentation"));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 context]);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100044754;
    void v30[3] = &unk_10026B670;
    id v8 = v13;
    id v31 = v8;
    [v14 performBlockAndWait:v30];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 replyQueue]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10004479C;
  void v25[3] = &unk_10026D930;
  void v25[4] = self;
  id v17 = v8;
  id v26 = v17;
  BOOL v29 = a4;
  id v18 = v9;
  id v28 = v18;
  id v19 = v11;
  id v27 = v19;
  [v19 performOnQueue:v16 block:v25];

  if (v18)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000450EC;
    v22[3] = &unk_10026B030;
    id v24 = v18;
    id v23 = v19;
    [v23 notifyOnQueue:v21 block:v22];
  }
}

- (void)fetchGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1559LL,  "-[GKGameServicePrivate fetchGameStatsForPlayer:bundleIdentifiers:responseKind:context:handler:]"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v16,  v14,  v17));

  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x2020000000LL;
  BOOL v42 = a5 == 2;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  char v40 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000453F8;
  v31[3] = &unk_10026D980;
  id v37 = [v13 count];
  int v35 = v41;
  id v19 = v12;
  id v32 = v19;
  id v20 = v13;
  id v33 = v20;
  BOOL v36 = v39;
  int v38 = a5;
  id v21 = v18;
  id v34 = v21;
  [v21 performOnManagedObjectContext:v31];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000456EC;
  v26[3] = &unk_10026C160;
  id v24 = v15;
  id v28 = v24;
  id v25 = v21;
  id v27 = v25;
  BOOL v29 = v39;
  id v30 = v41;
  [v25 notifyOnQueue:v23 block:v26];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

- (void)loadGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1612LL,  "-[GKGameServicePrivate loadGameStatsForPlayer:bundleIdentifiers:context:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v14,  v13,  v15));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10004592C;
  void v27[3] = &unk_10026C5C8;
  id v28 = v11;
  id v29 = v10;
  id v17 = v16;
  id v30 = v17;
  id v31 = self;
  id v18 = v10;
  id v19 = v11;
  [v17 performOnManagedObjectContext:v27];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000462AC;
  v24[3] = &unk_10026B030;
  id v25 = v17;
  id v26 = v12;
  id v22 = v17;
  id v23 = v12;
  [v22 notifyOnQueue:v21 block:v24];
}

- (void)getGameStatsForPlayer:(id)a3 bundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1711LL,  "-[GKGameServicePrivate getGameStatsForPlayer:bundleIDs:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100046510;
  v24[3] = &unk_10026DB00;
  id v15 = v12;
  id v25 = v15;
  id v16 = v8;
  id v26 = v16;
  id v27 = self;
  id v17 = v9;
  id v28 = v17;
  id v18 = v10;
  id v29 = v18;
  [v15 performOnQueue:v14 block:v24];

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 replyQueue]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100046E44;
    v21[3] = &unk_10026B030;
    id v23 = v18;
    id v22 = v15;
    [v22 notifyOnQueue:v20 block:v21];
  }
}

- (void)fetchGameMetadataForBundleIDs:(id)a3 responseKind:(int)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v12);
  }
  id v15 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKGameService: fetchGameMetadataForBundleIDs:",  buf,  2u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1782LL,  "-[GKGameServicePrivate fetchGameMetadataForBundleIDs:responseKind:context:handler:]"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v16,  v11,  v17));

  *(void *)buf = 0LL;
  v39 = buf;
  uint64_t v40 = 0x2020000000LL;
  BOOL v41 = a4 == 2;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x2020000000LL;
  char v37 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100047154;
  void v30[3] = &unk_10026DB28;
  id v19 = v10;
  id v31 = v19;
  id v33 = buf;
  id v34 = v36;
  int v35 = a4;
  id v20 = v18;
  id v32 = v20;
  [v20 performOnManagedObjectContext:v30];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 replyQueue]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10004747C;
  void v25[3] = &unk_10026C160;
  id v23 = v13;
  id v27 = v23;
  id v24 = v20;
  id v26 = v24;
  id v28 = v36;
  id v29 = buf;
  [v24 notifyOnQueue:v22 block:v25];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(buf, 8);
}

- (void)loadGameMetadataForBundleIDs:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v10);
  }
  id v13 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "GKGameService: loadGameMetadataForBundleIDs:",  buf,  2u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1836LL,  "-[GKGameServicePrivate loadGameMetadataForBundleIDs:context:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v14,  v9,  v15));

  *(void *)buf = 0LL;
  id v31 = buf;
  uint64_t v32 = 0x2020000000LL;
  uint64_t v33 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100047730;
  void v25[3] = &unk_10026D840;
  id v17 = v8;
  id v26 = v17;
  id v18 = v16;
  id v27 = v18;
  id v28 = self;
  id v29 = buf;
  [v18 performOnManagedObjectContext:v25];
  if (v11)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 replyQueue]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100047DFC;
    v21[3] = &unk_10026B878;
    id v23 = v11;
    id v24 = buf;
    id v22 = v18;
    [v22 notifyOnQueue:v20 block:v21];
  }

  _Block_object_dispose(buf, 8);
}

- (void)getGameMetadataForBundleIDs:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKGameService: getGameMetadataForBundleIDs:",  buf,  2u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100048020;
  v21[3] = &unk_10026DC68;
  void v21[4] = self;
  id v14 = v6;
  id v22 = v14;
  id v15 = v8;
  id v25 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  [v16 perform:v21];
  if (v15)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004865C;
    v18[3] = &unk_10026B030;
    id v20 = v15;
    id v19 = v16;
    [v19 notifyOnQueue:v17 block:v18];
  }
}

- (void)fetchRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100048788;
  v11[3] = &unk_10026B0F8;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [v9 performBlock:v11];
}

- (void)loadRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  1976LL,  "-[GKGameServicePrivate loadRatingForGameDescriptor:context:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v11,  v9,  v12));

  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  v31[3] = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100048BB0;
  void v25[3] = &unk_10026DD08;
  id v14 = v8;
  id v26 = v14;
  id v27 = self;
  id v15 = v13;
  id v28 = v15;
  id v16 = v9;
  id v29 = v16;
  id v30 = v31;
  [v15 perform:v25];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100049024;
  v21[3] = &unk_10026B878;
  id v19 = v10;
  id v23 = v19;
  id v24 = v31;
  id v20 = v15;
  id v22 = v20;
  [v20 notifyOnQueue:v18 block:v21];

  _Block_object_dispose(v31, 8);
}

- (void)fetchGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100049128;
  v10[3] = &unk_10026B148;
  id v11 = a3;
  id v12 = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  [a4 performBlock:v10];
}

- (void)loadGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  2044LL,  "-[GKGameServicePrivate loadGamesWithAchievementStatsForPlayer:context:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v11,  v9,  v12));

  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  v29[3] = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000494F4;
  v24[3] = &unk_10026D840;
  id v14 = v8;
  id v25 = v14;
  id v15 = v13;
  id v26 = v15;
  id v27 = self;
  id v28 = v29;
  [v15 performOnManagedObjectContext:v24];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100049B5C;
  v20[3] = &unk_10026B878;
  id v18 = v10;
  id v22 = v18;
  id v23 = v29;
  id v19 = v15;
  id v21 = v19;
  [v19 notifyOnQueue:v17 block:v20];

  _Block_object_dispose(v29, 8);
}

- (void)getGamesWithAchievementStatsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  2093LL,  "-[GKGameServicePrivate getGamesWithAchievementStatsForPlayer:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100049D88;
  v19[3] = &unk_10026B080;
  id v12 = v9;
  id v20 = v12;
  id v13 = v6;
  id v21 = v13;
  id v22 = self;
  [v12 performOnQueue:v11 block:v19];

  if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004A658;
    v16[3] = &unk_10026B030;
    id v18 = v7;
    id v17 = v12;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)removeGameForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  2155LL,  "-[GKGameServicePrivate removeGameForBundleID:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004A88C;
    v16[3] = &unk_10026B080;
    id v17 = v9;
    id v18 = self;
    id v19 = v6;
    [v17 performOnQueue:v11 block:v16];
  }

  if (v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10004AB78;
    v14[3] = &unk_10026B120;
    id v15 = v7;
    [v9 notifyOnQueue:v13 block:v14];
  }
}

- (void)fetchInstalledGameIdCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  2189LL,  "-[GKGameServicePrivate fetchInstalledGameIdCacheWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v5,  0LL));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004ACE0;
  v16[3] = &unk_10026C810;
  id v7 = v6;
  id v17 = v7;
  [v7 performOnManagedObjectContext:v16];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004AEA4;
  v12[3] = &unk_10026B148;
  id v13 = v7;
  id v14 = self;
  id v15 = v4;
  id v10 = v4;
  id v11 = v7;
  [v11 notifyOnQueue:v9 block:v12];
}

- (void)restoreGameIdCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_10004D1E0(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  id v16 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 availableGameIdentifiers]);
  id v18 = -[NSMutableSet initWithArray:](v16, "initWithArray:", v17);

  -[NSMutableSet removeObject:](v18, "removeObject:", GKWidgetIdentifier);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10004B078;
  v22[3] = &unk_10026D3C0;
  id v23 = v18;
  id v24 = v5;
  id v20 = v18;
  id v21 = v5;
  -[GKGameService storeGameForBundleIDs:completion:](self, "storeGameForBundleIDs:completion:", v19, v22);
}

- (void)clearGlobalGameCacheWithHandler:(id)a3
{
  id v25 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  2231LL,  "-[GKGameServicePrivate clearGlobalGameCacheWithHandler:]"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v4,  v6));

  v38[0] = objc_opt_class(&OBJC_CLASS___GKCDLoadedGame, v8);
  v38[1] = objc_opt_class(&OBJC_CLASS___GKGameListCacheObject, v9);
  v38[2] = objc_opt_class(&OBJC_CLASS___GKGameRecordCacheObject, v10);
  v38[3] = objc_opt_class(&OBJC_CLASS___GKGameCacheObject, v11);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 4LL));
  id v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _gkFetchRequest]);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_10004B370;
        v29[3] = &unk_10026DDD0;
        id v30 = v18;
        id v19 = v7;
        id v31 = v19;
        uint64_t v32 = v17;
        id v20 = v18;
        [v19 performOnManagedObjectContext:v29];
      }

      id v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v14);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 replyQueue]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10004B510;
  v26[3] = &unk_10026B030;
  id v27 = v7;
  id v28 = v25;
  id v23 = v7;
  id v24 = v25;
  [v23 notifyOnQueue:v22 block:v26];
}

- (void)getFriendListAccessForAllGames:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10004B83C;
    v12[3] = &unk_10026DEC8;
    void v12[4] = self;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
    id v13 = v5;
    id v14 = &stru_10026DE10;
    [v5 performOnManagedObjectContext:v12];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 replyQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10004C0E0;
    v9[3] = &unk_10026B310;
    id v10 = v5;
    id v11 = v4;
    id v8 = v5;
    [v8 notifyOnQueue:v7 block:v9];
  }
}

- (void)triggerGameActivityForChallenge:(id)a3 bundleID:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKChallengeServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  v11,  v12,  v13));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004C274;
  v17[3] = &unk_10026DF40;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [v14 getLeaderboardChallengeDetailsForChallengeID:v10 allowStaleData:1 completionHandler:v17];
}

- (void)addGameActivityForActivityType:(id)a3 BundleID:(id)a4 userInfo:(id)a5 handler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[GKGameActivityInternal initWithActivityType:bundleID:andUserInfo:]( objc_alloc(&OBJC_CLASS___GKGameActivityInternal),  "initWithActivityType:bundleID:andUserInfo:",  v12,  v11,  v10);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](&OBJC_CLASS___GKGameService, "sharedGameActivityStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004CA40;
  v16[3] = &unk_10026B120;
  id v17 = v9;
  id v15 = v9;
  [v14 add:v13 completionHandler:v16];
}

- (void)fetchActivitiesForBundleID:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](&OBJC_CLASS___GKGameService, "sharedGameActivityStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004CB04;
  v11[3] = &unk_10026DF68;
  id v12 = v7;
  id v10 = v7;
  [v9 fetchActivitiesWithBundleID:v8 ascending:v5 completionHandler:v11];
}

- (void)removeAllGameActivitiesWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](&OBJC_CLASS___GKGameService, "sharedGameActivityStore"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004CBA0;
  v6[3] = &unk_10026B120;
  id v7 = v3;
  id v5 = v3;
  [v4 removeAllActivitiesWithCompletionHandler:v6];
}

- (void)removeAllGameActivitiesForBundleID:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](&OBJC_CLASS___GKGameService, "sharedGameActivityStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004CC5C;
  v9[3] = &unk_10026B120;
  id v10 = v5;
  id v8 = v5;
  [v7 removeActivitiesForBundleID:v6 completionHandler:v9];
}

@end