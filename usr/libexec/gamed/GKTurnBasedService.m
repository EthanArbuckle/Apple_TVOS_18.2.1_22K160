@interface GKTurnBasedService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (id)_requestForTurnBasedSubmitValues:(id)a3 withServerLabel:(id)a4 sessionID:(id)a5;
- (id)privateDatabase;
- (id)turnsForParticipantIndexes:(id)a3 turnTimeout:(double)a4;
- (void)_determineCompatibleBundleIDForAppID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 platform:(id)a6 withCompletionHandler:(id)a7;
- (void)_determineCompatibleGamesForMatches:(id)a3 dispatchGroup:(id)a4;
- (void)_determineTurnBasedBadgeCountFromList:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)_updateGamesForTurnBasedMatches:(id)a3 dispatchGroup:(id)a4;
- (void)_updatePlayersForMatches:(id)a3 group:(id)a4;
- (void)acceptInviteForTurnBasedMatch:(id)a3 handler:(id)a4;
- (void)cancelExchange:(id)a3 withMessage:(id)a4 match:(id)a5 handler:(id)a6;
- (void)completeTurnBasedMatch:(id)a3 scores:(id)a4 achievements:(id)a5 handler:(id)a6;
- (void)createTurnBasedGameForMatchRequest:(id)a3 individualMessages:(id)a4 handler:(id)a5;
- (void)declineInviteForTurnBasedMatch:(id)a3 handler:(id)a4;
- (void)fetchDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)fetchTurnBasedMatchesForGame:(id)a3 context:(id)a4 handler:(id)a5;
- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 handler:(id)a5;
- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 prefetchOnly:(BOOL)a5 handler:(id)a6;
- (void)getNextTurnBasedEventWithHandler:(id)a3;
- (void)getTurnBasedMatchesAndCompatibleBundleID:(BOOL)a3 handler:(id)a4;
- (void)getTurnBasedMatchesWithHandler:(id)a3;
- (void)loadDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 context:(id)a5 handler:(id)a6;
- (void)loadTurnBasedMatchesForGame:(id)a3 loadDetails:(BOOL)a4 prefetchOnly:(BOOL)a5 context:(id)a6 handler:(id)a7;
- (void)loadURLWithTBGMatch:(id)a3 player:(id)a4 matchRequest:(id)a5 handler:(id)a6;
- (void)removeTurnBasedMatch:(id)a3 handler:(id)a4;
- (void)replyToExchange:(id)a3 withMessage:(id)a4 data:(id)a5 match:(id)a6 handler:(id)a7;
- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 forMatch:(id)a8 handler:(id)a9;
- (void)resignFromTurnBasedGame:(id)a3 outcome:(unint64_t)a4 handler:(id)a5;
- (void)saveDataForTurnBasedMatch:(id)a3 resolvedExchangeIDs:(id)a4 handler:(id)a5;
- (void)saveRecord:(id)a3 withHandler:(id)a4;
- (void)sendExchangeToParticipants:(id)a3 data:(id)a4 message:(id)a5 timeout:(double)a6 match:(id)a7 handler:(id)a8;
- (void)sendReminderToParticipants:(id)a3 message:(id)a4 match:(id)a5 handler:(id)a6;
- (void)sendRequest:(id)a3 forBagKey:(id)a4 exchange:(id)a5 matchID:(id)a6 responseHandler:(id)a7;
- (void)submitTurnForTurnBasedMatch:(id)a3 nextParticipantIndexes:(id)a4 turnTimeout:(double)a5 handler:(id)a6;
@end

@implementation GKTurnBasedService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKTurnBasedServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 256LL;
}

- (void)getTurnBasedMatchesWithHandler:(id)a3
{
}

- (id)turnsForParticipantIndexes:(id)a3 turnTimeout:(double)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10);
        v20[1] = @"turn-timeout";
        v21[0] = v11;
        v20[0] = @"next-turn-on-slot";
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber _gkServerTimeInterval:](&OBJC_CLASS___NSNumber, "_gkServerTimeInterval:", a4));
        v21[1] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
        [v6 addObject:v13];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v8);
  }

  return v6;
}

- (void)createTurnBasedGameForMatchRequest:(id)a3 individualMessages:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v58 = a4;
  id v8 = a5;
  v54 = v8;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v91 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "TBGame - createTurnBasedGameForMatchRequest, matchRequest = %@",  buf,  0xCu);
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 recipients]);
  id v12 = [v11 count];

  if (v12)
  {
    __int128 v74 = 0uLL;
    __int128 v75 = 0uLL;
    __int128 v72 = 0uLL;
    __int128 v73 = 0uLL;
    id obj = (id)objc_claimAutoreleasedReturnValue([v7 recipients]);
    id v13 = [obj countByEnumeratingWithState:&v72 objects:v89 count:16];
    if (!v13) {
      goto LABEL_34;
    }
    id v15 = v13;
    v56 = v7;
    uint64_t v16 = *(void *)v73;
    __int128 v17 = &_ss10ArraySliceVMn_ptr;
    while (1)
    {
      __int128 v18 = 0LL;
      do
      {
        if (*(void *)v73 != v16) {
          objc_enumerationMutation(obj);
        }
        __int128 v19 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)v18);
        uint64_t v20 = objc_opt_class(v17[511], v14);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        {
          v87[0] = @"player-id";
          id v21 = v19;
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 hostPlayerInternal]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 playerID]);
          v88[0] = v23;
          v87[1] = @"guest-id";
          v24 = v17;
          v25 = (void *)objc_claimAutoreleasedReturnValue([v21 guestIdentifier]);
          v88[1] = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  2LL));

          __int128 v17 = v24;
LABEL_16:

          goto LABEL_17;
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue([v19 playerID]);
        id v21 = (id)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:v22]);
        if (v21 || (id v21 = (id)objc_claimAutoreleasedReturnValue([v56 inviteMessage])) != 0)
        {
          v85[0] = @"player-id";
          v85[1] = @"invite-message";
          v86[0] = v22;
          v86[1] = v21;
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v86,  v85,  2LL));
          goto LABEL_16;
        }

        v83 = @"player-id";
        v84 = v22;
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
LABEL_17:

        [v59 addObject:v26];
        __int128 v18 = (char *)v18 + 1;
      }

      while (v15 != v18);
      id v27 = [obj countByEnumeratingWithState:&v72 objects:v89 count:16];
      id v15 = v27;
      if (!v27)
      {
        id v7 = v56;
        goto LABEL_34;
      }
    }
  }

  __int128 v70 = 0uLL;
  __int128 v71 = 0uLL;
  __int128 v68 = 0uLL;
  __int128 v69 = 0uLL;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 recipientPlayerIDs]);
  id v28 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v69;
    do
    {
      v31 = 0LL;
      do
      {
        if (*(void *)v69 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:v32]);
        if (v33 || (v33 = (void *)objc_claimAutoreleasedReturnValue([v7 inviteMessage])) != 0)
        {
          v80[0] = @"player-id";
          v80[1] = @"invite-message";
          v81[0] = v32;
          v81[1] = v33;
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  2LL));
        }

        else
        {
          v78 = @"player-id";
          uint64_t v79 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
        }

        [v59 addObject:v34];

        v31 = (char *)v31 + 1;
      }

      while (v29 != v31);
      id v35 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
      id v29 = v35;
    }

    while (v35);
  }

- (void)_updateGamesForTurnBasedMatches:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000809B4;
    v9[3] = &unk_10026B080;
    v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v6 _gkDistinctValuesForKeyPath:@"bundleID"]);
    id v11 = v6;
    id v8 = v10;
    [v7 perform:v9];
  }
}

- (void)_determineCompatibleGamesForMatches:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8)
  {
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  224LL,  "-[GKTurnBasedService _determineCompatibleGamesForMatches:dispatchGroup:]"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v10));

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v9));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v9));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100080F50;
    v45[3] = &unk_10026F830;
    id v14 = v12;
    id v46 = v14;
    id v48 = v9;
    id v15 = v13;
    id v47 = v15;
    v25 = v6;
    [v6 enumerateObjectsUsingBlock:v45];
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = v14;
    id v27 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v42;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v16;
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * v16);
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v17]);
          id v19 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v38;
            do
            {
              for (i = 0LL; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v38 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472LL;
                v35[2] = sub_100081240;
                v35[3] = &unk_10026BEC8;
                v35[4] = self;
                v35[5] = v17;
                v35[6] = v23;
                id v36 = v15;
                [v11 perform:v35];
              }

              id v20 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
            }

            while (v20);
          }

          uint64_t v16 = v29 + 1;
        }

        while ((id)(v29 + 1) != v27);
        id v27 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }

      while (v27);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10008154C;
    v30[3] = &unk_10026BEC8;
    id v31 = v11;
    uint64_t v32 = self;
    id v6 = v25;
    id v33 = v25;
    id v34 = v7;
    id v24 = v11;
    [v34 perform:v30];
  }
}

- (void)_determineCompatibleBundleIDForAppID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 platform:(id)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  296LL,  "-[GKTurnBasedService _determineCompatibleBundleIDForAppID:bundleVersion:shortBundleVersion:platform: withCompletionHandler:]"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v17));

  [v18 setObject:v12 forKeyedSubscript:@"bundleID"];
  [v18 setObject:v13 forKeyedSubscript:@"bundleVersion"];
  [v18 setObject:v14 forKeyedSubscript:@"shortBundleVersion"];
  [v18 setObject:v15 forKeyedSubscript:@"platform"];
  if (v12 && v13 | v14)
  {
    v33[0] = @"bundle-id";
    v33[1] = @"bundle-version";
    v34[0] = v12;
    v34[1] = v13;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v19));

    if (v14) {
      [v20 setObject:v14 forKeyedSubscript:@"short-bundle-version"];
    }
    id v21 = [v15 integerValue];
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor stringForPlatform:](&OBJC_CLASS___GKGameDescriptor, "stringForPlatform:", v21));
      [v20 setObject:v22 forKeyedSubscript:@"platform"];
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10008196C;
    v29[3] = &unk_10026BEC8;
    v29[4] = self;
    id v30 = v20;
    id v31 = v12;
    id v32 = v18;
    id v23 = v20;
    [v32 perform:v29];
  }

  if (v16)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyQueue]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100081E1C;
    v26[3] = &unk_10026B030;
    id v28 = v16;
    id v27 = v18;
    [v27 notifyOnQueue:v25 block:v26];
  }
}

- (void)_determineTurnBasedBadgeCountFromList:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100081F94;
  v12[3] = &unk_10026B0F8;
  id v13 = a4;
  id v14 = v8;
  id v15 = self;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  [v11 performBlock:v12];
}

- (void)loadTurnBasedMatchesForGame:(id)a3 loadDetails:(BOOL)a4 prefetchOnly:(BOOL)a5 context:(id)a6 handler:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  416LL,  "-[GKTurnBasedService loadTurnBasedMatchesForGame:loadDetails:prefetchOnly:context:handler:]"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10008242C;
  v17[3] = &unk_10026B0F8;
  id v18 = v11;
  id v19 = self;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v13, v17);
}

- (void)fetchTurnBasedMatchesForGame:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  469LL,  "-[GKTurnBasedService fetchTurnBasedMatchesForGame:context:handler:]"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100082C80;
  v15[3] = &unk_10026B0F8;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v11, v15);
}

- (void)getTurnBasedMatchesAndCompatibleBundleID:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  502LL,  "-[GKTurnBasedService getTurnBasedMatchesAndCompatibleBundleID:handler:]"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000831E4;
  v9[3] = &unk_10026F9E8;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v7, v9);
}

- (void)_updatePlayersForMatches:(id)a3 group:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083F9C;
  v7[3] = &unk_10026B170;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [a4 perform:v7];
}

- (void)fetchDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  640LL,  "-[GKTurnBasedService fetchDetailsForTurnBasedMatchIDs:includeGameData:responseKind:context:handler:]"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100084718;
  v19[3] = &unk_10026FB00;
  id v20 = v13;
  id v21 = self;
  int v24 = a5;
  BOOL v25 = a4;
  id v22 = v12;
  id v23 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v13;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v15, v19);
}

- (void)loadDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  706LL,  "-[GKTurnBasedService loadDetailsForTurnBasedMatchIDs:includeGameData:context:handler:]"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100084EFC;
  v17[3] = &unk_10026FB98;
  id v18 = v11;
  id v19 = self;
  BOOL v22 = a4;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v13, v17);
}

- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 prefetchOnly:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  772LL,  "-[GKTurnBasedService getDetailsForTurnBasedMatchIDs:includeGameData:prefetchOnly:handler:]"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100085824;
  v15[3] = &unk_10026FC60;
  id v16 = v10;
  id v17 = v11;
  BOOL v18 = a5;
  void v15[4] = self;
  BOOL v19 = a4;
  id v13 = v10;
  id v14 = v11;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v12, v15);
}

- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 handler:(id)a5
{
}

- (void)acceptInviteForTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  833LL,  "-[GKTurnBasedService acceptInviteForTurnBasedMatch:handler:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 matchID]);
  id v12 = &off_1001F2000;
  if (v11)
  {
    id v35 = v10;
    id v38 = v7;
    __int128 v37 = v8;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v13 clearTurnBasedBulletinsForMatchID:v11];

    id v36 = self;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 credential]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 playerInternal]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 playerID]);

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue([v6 participants]);
    id v19 = [v18 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
          int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 playerID]);
          if ([v24 isEqualToString:v17])
          {
            BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v23 status]);
            unsigned int v26 = [v25 isEqualToString:@"Invited"];

            if (!v26)
            {
              id v8 = v37;
              id v10 = v35;
              self = v36;
              goto LABEL_15;
            }
          }

          else
          {
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }

      while (v20);
    }

    self = v36;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v36, "clientProxy"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 replyQueue]);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100086474;
    v44[3] = &unk_10026BB28;
    id v10 = v35;
    id v45 = v35;
    id v46 = v11;
    id v47 = v6;
    id v8 = v37;
    id v48 = v37;
    id v49 = v36;
    [v45 performOnQueue:v28 block:v44];

    id v18 = v45;
LABEL_15:

    id v7 = v38;
    id v12 = &off_1001F2000;
  }

  else
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v10 setError:v29];
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 replyQueue]);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = *((void *)v12 + 449);
  v39[2] = sub_10008682C;
  v39[3] = &unk_10026B0F8;
  id v40 = v11;
  id v41 = v10;
  __int128 v42 = self;
  id v43 = v7;
  id v32 = v7;
  id v33 = v10;
  id v34 = v11;
  [v33 notifyOnQueue:v31 block:v39];
}

- (void)declineInviteForTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  926LL,  "-[GKTurnBasedService declineInviteForTurnBasedMatch:handler:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 matchID]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v12 clearTurnBasedBulletinsForMatchID:v11];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10008708C;
    v26[3] = &unk_10026BB28;
    id v27 = v10;
    id v28 = v11;
    id v29 = v6;
    id v30 = v8;
    id v31 = self;
    [v27 performOnQueue:v14 block:v26];
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v10 setError:v15];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  void v21[2] = sub_100087478;
  v21[3] = &unk_10026B0F8;
  id v22 = v11;
  id v23 = v10;
  int v24 = self;
  id v25 = v7;
  id v18 = v7;
  id v19 = v10;
  id v20 = v11;
  [v19 notifyOnQueue:v17 block:v21];
}

- (void)removeTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  989LL,  "-[GKTurnBasedService removeTurnBasedMatch:handler:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 matchID]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v12 clearTurnBasedBulletinsForMatchID:v11];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100087ADC;
    v26[3] = &unk_10026BEC8;
    id v27 = v10;
    id v28 = v11;
    id v29 = v8;
    id v30 = self;
    [v27 performOnQueue:v14 block:v26];
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v10 setError:v15];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  void v21[2] = sub_100087E18;
  v21[3] = &unk_10026B0F8;
  id v22 = v11;
  id v23 = v10;
  int v24 = self;
  id v25 = v6;
  id v18 = v6;
  id v19 = v10;
  id v20 = v11;
  [v19 notifyOnQueue:v17 block:v21];
}

- (void)submitTurnForTurnBasedMatch:(id)a3 nextParticipantIndexes:(id)a4 turnTimeout:(double)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1042LL,  "-[GKTurnBasedService submitTurnForTurnBasedMatch:nextParticipantIndexes:turnTimeout:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 matchID]);
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v17 clearTurnBasedBulletinsForMatchID:v16];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyQueue]);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000882B4;
    v31[3] = &unk_10026F290;
    id v32 = v15;
    id v33 = v16;
    id v34 = v10;
    id v35 = self;
    id v36 = v11;
    double v38 = a5;
    id v37 = v13;
    [v32 performOnQueue:v19 block:v31];
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v15 setError:v20];
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 replyQueue]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100088774;
  v26[3] = &unk_10026B0F8;
  id v27 = v16;
  id v28 = v15;
  id v29 = self;
  id v30 = v12;
  id v23 = v12;
  id v24 = v15;
  id v25 = v16;
  [v24 notifyOnQueue:v22 block:v26];
}

- (void)saveDataForTurnBasedMatch:(id)a3 resolvedExchangeIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1117LL,  "-[GKTurnBasedService saveDataForTurnBasedMatch:resolvedExchangeIDs:handler:]"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 matchID]);
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v15 clearTurnBasedBulletinsForMatchID:v14];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100088E10;
    v29[3] = &unk_10026E350;
    id v30 = v13;
    id v31 = v14;
    id v32 = v8;
    id v33 = v9;
    id v34 = v11;
    id v35 = self;
    [v30 performOnQueue:v17 block:v29];
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v13 setError:v18];
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 replyQueue]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100089264;
  v24[3] = &unk_10026B0F8;
  id v25 = v14;
  id v26 = v13;
  id v27 = self;
  id v28 = v10;
  id v21 = v10;
  id v22 = v13;
  id v23 = v14;
  [v22 notifyOnQueue:v20 block:v24];
}

- (void)resignFromTurnBasedGame:(id)a3 outcome:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1177LL,  "-[GKTurnBasedService resignFromTurnBasedGame:outcome:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 matchID]);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100089800;
    v27[3] = &unk_10026EA58;
    id v28 = v12;
    id v29 = v13;
    id v31 = self;
    unint64_t v32 = a4;
    id v30 = v10;
    [v28 performOnQueue:v15 block:v27];
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v12 setError:v16];
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100089B48;
  v22[3] = &unk_10026B0F8;
  id v23 = v13;
  id v24 = v12;
  id v25 = self;
  id v26 = v8;
  id v19 = v8;
  id v20 = v12;
  id v21 = v13;
  [v20 notifyOnQueue:v18 block:v22];
}

- (id)_requestForTurnBasedSubmitValues:(id)a3 withServerLabel:(id)a4 sessionID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v25 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 playerID]);
        if (v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v16]);
          if (!v17)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            [v17 setObject:v16 forKeyedSubscript:@"player-id"];
            id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            [v17 setObject:v18 forKeyedSubscript:v8];

            [v9 setObject:v17 forKeyedSubscript:v16];
          }

          id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v8]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 serverRepresentation]);
          [v19 addObject:v20];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }

    while (v12);
  }

  if ([v9 count])
  {
    id v21 = v25;
    v30[0] = @"session-id";
    v30[1] = @"players";
    v31[0] = v25;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
    v31[1] = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
  }

  else
  {
    id v23 = 0LL;
    id v21 = v25;
  }

  return v23;
}

- (void)completeTurnBasedMatch:(id)a3 scores:(id)a4 achievements:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1260LL,  "-[GKTurnBasedService completeTurnBasedMatch:scores:achievements:handler:]"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v15));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 matchID]);
  if (v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v18 clearTurnBasedBulletinsForMatchID:v17];

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v33 = v13;
    id v20 = v12;
    id v21 = v11;
    id v22 = v10;
    id v23 = v14;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 replyQueue]);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10008A498;
    v41[3] = &unk_10026BB28;
    id v42 = v16;
    id v43 = v17;
    id v44 = v22;
    id v45 = v23;
    id v46 = self;
    [v42 performOnQueue:v24 block:v41];

    id v14 = v23;
    id v10 = v22;
    id v11 = v21;
    id v12 = v20;
    id v13 = v33;
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    [v16 setError:v25];
  }

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 replyQueue]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  void v34[2] = sub_10008A928;
  v34[3] = &unk_10026E1E8;
  id v35 = v17;
  id v36 = self;
  id v37 = v16;
  id v38 = v11;
  id v39 = v12;
  id v40 = v13;
  id v28 = v13;
  id v29 = v12;
  id v30 = v11;
  id v31 = v16;
  id v32 = v17;
  [v31 notifyOnQueue:v27 block:v34];
}

- (void)sendExchangeToParticipants:(id)a3 data:(id)a4 message:(id)a5 timeout:(double)a6 match:(id)a7 handler:(id)a8
{
  id v36 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v38 = a8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 matchID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1361LL,  "-[GKTurnBasedService sendExchangeToParticipants:data:message:timeout:match:handler:]"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 context]);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_10008B4AC;
  v53[3] = &unk_10026BDB0;
  id v22 = v17;
  id v54 = v22;
  id v23 = v20;
  id v55 = v23;
  [v21 performBlockAndWait:v53];

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyQueue]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10008B544;
  v44[3] = &unk_10026E120;
  id v45 = v16;
  id v46 = v36;
  double v52 = a6;
  id v47 = v15;
  id v48 = v14;
  id v49 = v18;
  __int128 v50 = self;
  id v26 = v23;
  id v51 = v26;
  id v37 = v18;
  id v27 = v14;
  id v28 = v15;
  id v29 = v36;
  id v30 = v16;
  [v26 performOnQueue:v25 block:v44];

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 replyQueue]);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10008B7B0;
  v39[3] = &unk_10026B0F8;
  id v40 = v26;
  id v41 = v22;
  id v42 = self;
  id v43 = v38;
  id v33 = v38;
  id v34 = v22;
  id v35 = v26;
  [v35 notifyOnQueue:v32 block:v39];
}

- (void)sendRequest:(id)a3 forBagKey:(id)a4 exchange:(id)a5 matchID:(id)a6 responseHandler:(id)a7
{
  id v27 = a3;
  id v26 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1417LL,  "-[GKTurnBasedService sendRequest:forBagKey:exchange:matchID:responseHandler:]"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v16));

  if (v13)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyQueue]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    void v34[2] = sub_10008BEB0;
    v34[3] = &unk_10026E350;
    id v35 = v17;
    id v36 = v13;
    id v37 = v15;
    id v38 = v27;
    id v39 = v26;
    id v40 = self;
    [v35 performOnQueue:v19 block:v34];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10008C0D0;
  v28[3] = &unk_10026B0A8;
  id v29 = v13;
  id v30 = v17;
  id v31 = self;
  id v32 = v12;
  id v33 = v14;
  id v22 = v14;
  id v23 = v12;
  id v24 = v17;
  id v25 = v13;
  [v24 notifyOnQueue:v21 block:v28];
}

- (void)cancelExchange:(id)a3 withMessage:(id)a4 match:(id)a5 handler:(id)a6
{
  v17[0] = @"session-id";
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 matchID]);
  v18[0] = v14;
  v18[1] = v13;
  v17[1] = @"request-id";
  v17[2] = @"notification-message";
  v18[2] = v12;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 matchID]);
  -[GKTurnBasedService sendRequest:forBagKey:exchange:matchID:responseHandler:]( self,  "sendRequest:forBagKey:exchange:matchID:responseHandler:",  v15,  @"gk-tb-cancel-request",  v13,  v16,  v10);
}

- (void)replyToExchange:(id)a3 withMessage:(id)a4 data:(id)a5 match:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v21[0] = @"session-id";
  id v15 = a7;
  id v16 = a6;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 matchID]);
  v22[0] = v17;
  v22[1] = v12;
  v21[1] = @"request-id";
  void v21[2] = @"notification-message";
  v22[2] = v13;
  v21[3] = @"data";
  id v18 = v14;
  if (!v14) {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v22[3] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));
  if (!v14) {

  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 matchID]);
  -[GKTurnBasedService sendRequest:forBagKey:exchange:matchID:responseHandler:]( self,  "sendRequest:forBagKey:exchange:matchID:responseHandler:",  v19,  @"gk-tb-send-reply",  v12,  v20,  v15);
}

- (void)getNextTurnBasedEventWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void, void, void, void))v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "getNextTurnBasedEventWithHandler called",  (uint8_t *)&v22,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 gameDescriptor]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 acceptedInviteManager]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 turnBasedInviteForGame:v9]);
  id v13 = v12;
  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 matchID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 exchangeID]);
  }

  else
  {
    id v15 = 0LL;
    id v14 = 0LL;
  }

  signed int v16 = [v13 pushCommand];
  id v17 = [v13 userTapped];
  if (v5)
  {
    id v18 = v17;
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers(v17);
    }
    id v20 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v21 = @"NO";
      int v22 = 138413058;
      id v23 = v14;
      __int16 v24 = 2112;
      if ((_DWORD)v18) {
        id v21 = @"YES";
      }
      id v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "getNextTurnBasedEventWithHandler matchID: %@ exchangeID:%@ command: %ld userTapped:%@",  (uint8_t *)&v22,  0x2Au);
    }

    ((void (**)(void, void *, void *, void, id, void))v5)[2](v5, v14, v15, v16, v18, 0LL);
  }
}

- (void)sendReminderToParticipants:(id)a3 message:(id)a4 match:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1519LL,  "-[GKTurnBasedService sendReminderToParticipants:message:match:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  signed int v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v34[0] = @"session-id";
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 matchID]);

  v35[0] = v17;
  v35[1] = v11;
  v34[1] = @"localized-message";
  void v34[2] = @"participants";
  v35[2] = v10;
  v34[3] = @"push-token";
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 pushToken]);
  id v19 = v18;
  if (!v18) {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v35[3] = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  4LL));
  if (!v18) {

  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10008CCCC;
  v29[3] = &unk_10026BEC8;
  id v21 = v16;
  id v30 = v21;
  id v22 = v20;
  id v31 = v22;
  id v32 = self;
  id v23 = v15;
  id v33 = v23;
  [v23 perform:v29];
  if (v12)
  {
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyQueue]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10008CDE4;
    v26[3] = &unk_10026B030;
    id v28 = v12;
    id v27 = v23;
    [v27 notifyOnQueue:v25 block:v26];
  }
}

- (void)loadURLWithTBGMatch:(id)a3 player:(id)a4 matchRequest:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"loadRecordURL"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v15, @"bundle-id");

  signed int v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleVersion]);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v17, @"bundle-version");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v18, @"playerID");

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleShortVersion]);

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleShortVersion]);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v22, @"short-bundle-version");
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 adamID]);

  if (v24)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 adamID]);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v26, @"adam-id");
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 matchID]);

  if (v27)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 matchID]);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v28, @"session-id");
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v29, @"turn-count");

  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", &off_1002879D0, @"invite-type");
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  0LL));
  id v31 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"com.apple.legacygaming.invites",  CKCurrentUserDefaultName);
  id v32 = -[CKRecord initWithRecordType:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:zoneID:",  @"LegacyMultiplayerInvites",  v31);
  -[CKRecord setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v30, @"connectionData");
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10008D1F0;
  v40[3] = &unk_10026B080;
  id v41 = v32;
  id v42 = self;
  id v33 = v13;
  id v43 = v33;
  id v34 = v32;
  [v33 perform:v40];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10008D408;
  v37[3] = &unk_10026B030;
  id v38 = v33;
  id v39 = v10;
  id v35 = v33;
  id v36 = v10;
  [v35 notifyOnQueue:&_dispatch_main_q block:v37];
}

- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 forMatch:(id)a8 handler:(id)a9
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1606LL,  "-[GKTurnBasedService reserveShareParticipantSlots:minPlayerCount:maxPlayerCount:andInvitePlayers:wit hMessage:forMatch:handler:]"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v18));

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  void v34[2] = sub_10008D6A4;
  v34[3] = &unk_10026FCF0;
  int64_t v40 = a3;
  int64_t v41 = a4;
  int64_t v42 = a5;
  id v35 = v16;
  id v36 = v14;
  id v37 = v15;
  id v38 = self;
  id v22 = v19;
  id v39 = v22;
  id v23 = v15;
  id v24 = v14;
  id v25 = v16;
  [v22 performOnQueue:v21 block:v34];

  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 replyQueue]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  void v31[2] = sub_10008DA48;
  v31[3] = &unk_10026B030;
  id v32 = v22;
  id v33 = v17;
  id v28 = v22;
  id v29 = v17;
  [v28 notifyOnQueue:v27 block:v31];
}

- (id)privateDatabase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.socialgaming.sessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 privateCloudDatabase]);

  return v3;
}

- (void)saveRecord:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v19 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  id v10 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v8,  "initWithRecordsToSave:recordIDsToDelete:",  v9,  0LL);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  -[CKModifyRecordsOperation setConfiguration:](v10, "setConfiguration:", v11);

  -[CKModifyRecordsOperation setSavePolicy:](v10, "setSavePolicy:", 1LL);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008DC60;
  v15[3] = &unk_10026FD18;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v10, "setModifyRecordsCompletionBlock:", v15);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedService privateDatabase](self, "privateDatabase"));
  [v14 addOperation:v10];
}

@end