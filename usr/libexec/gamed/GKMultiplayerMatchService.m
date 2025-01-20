@interface GKMultiplayerMatchService
+ (Class)interfaceClass;
+ (id)makeBaseServerRequestForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 connInfo:(int64_t)a6;
+ (id)makePlayersDictionaryForMatchRequest:(id)a3 transportContext:(id)a4;
+ (unint64_t)requiredEntitlements;
- (BOOL)zoneNotFoundFromOperation:(id)a3 operationError:(id)a4;
- (GKPseudonymManager)pseudonymManager;
- (_TtC14GameDaemonCore13GameDaemonTTR)ttrHelper;
- (id)ensureGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 numberOfAutomatched:(int64_t)a6 moc:(id)a7 list:(id)a8;
- (id)privateDatabase;
- (void)_performRelayAction:(id)a3 request:(id)a4 handler:(id)a5;
- (void)acceptGameInvite:(id)a3 transportContext:(id)a4 handler:(id)a5;
- (void)cancelGameInviteWithHandler:(id)a3;
- (void)cancelOutstandingMatchRequestWithHandler:(id)a3;
- (void)cancelRelayRequest:(id)a3 handler:(id)a4;
- (void)convertToInternalObjects:(id)a3 results:(id)a4;
- (void)declineGameInvite:(id)a3 reason:(int64_t)a4 handler:(id)a5;
- (void)fetchDevicePushToken:(id)a3;
- (void)fetchOnDeviceMultiplayerBundleIDsForNewBundleID:(id)a3 handler:(id)a4;
- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3;
- (void)fetchPseudonymIfNeededWithTransportContext:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchTransportOverrideWithHandler:(id)a3;
- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5;
- (void)forgetParticipant:(id)a3 deviceID:(id)a4 handler:(id)a5;
- (void)getAcceptedGameInviteWithHandler:(id)a3;
- (void)getCompatibilityMatrix:(id)a3 handler:(id)a4;
- (void)getFlowRateForPlayerGroup:(int64_t)a3 handler:(id)a4;
- (void)getFlowRateForQueue:(id)a3 handler:(id)a4;
- (void)getFlowRateWithPlayerGroup:(id)a3 queueName:(id)a4 handler:(id)a5;
- (void)getInviteSessionTokenWithHandler:(id)a3;
- (void)getMultiPlayerGroups:(id)a3;
- (void)getOverallFlowRateWithHandler:(id)a3;
- (void)getPlayersForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 transportContext:(id)a6 handler:(id)a7;
- (void)getPlayersToInviteWithHandlerV2:(id)a3;
- (void)hasCanceledMultiplayerInitiateBulletinForSessionToken:(id)a3 handler:(id)a4;
- (void)hasExistingInviteSessionWithHandler:(id)a3;
- (void)initiateInvitationForMatchRequest:(id)a3 recipients:(id)a4 devicePushTokenMap:(id)a5 isNearbyInvite:(BOOL)a6 availableForMessageV2:(BOOL)a7 transportContext:(id)a8 handler:(id)a9;
- (void)initiateRelayRequest:(id)a3 handler:(id)a4;
- (void)invitePlayersForMatchRequest:(id)a3 devicePushTokenMap:(id)a4 isNearbyInvite:(BOOL)a5 transportContext:(id)a6 handler:(id)a7;
- (void)isGameCenterMultiplayerGameForBundleID:(id)a3 handler:(id)a4;
- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 availableForMessageV2:(BOOL)a6 handler:(id)a7;
- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 handler:(id)a6;
- (void)nearbyInviteWasCancelled:(id)a3;
- (void)presentNearbyInvite:(id)a3;
- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8;
- (void)removeInviteSession;
- (void)removeInviteSessionIfNeeded;
- (void)removePlayersFromGameInviteV2:(id)a3 handler:(id)a4;
- (void)requestTTRLogsWith:(id)a3 handler:(id)a4;
- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4;
- (void)saveRecord:(id)a3 shouldRetry:(BOOL)a4 withHandler:(id)a5;
- (void)saveRecord:(id)a3 withHandler:(id)a4;
- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 usePeerDiscovery:(BOOL)a6 handler:(id)a7;
- (void)sendInvitationUpdate:(id)a3 handler:(id)a4;
- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8;
- (void)setPseudonymManager:(id)a3;
- (void)setShareInvitees:(id)a3;
- (void)setShareRecordID:(id)a3;
- (void)setTtrHelper:(id)a3;
- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 handler:(id)a5;
- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 shouldRetry:(BOOL)a5 handler:(id)a6;
- (void)setupNearbyDiscovery;
- (void)startNearbyAdvertisingWithDiscoveryInfo:(id)a3 handler:(id)a4;
- (void)startNearbyBrowsingWithPlayerID:(id)a3 handler:(id)a4;
- (void)stopNearbyAdvertisingWithHandler:(id)a3;
- (void)stopNearbyBrowsingWithHandler:(id)a3;
- (void)updateCacheWithNearbyProfileDictionary:(id)a3 handler:(id)a4;
- (void)updateRelayRequest:(id)a3 handler:(id)a4;
- (void)uploadLogsForRadar:(id)a3 from:(id)a4 handler:(id)a5;
- (void)validateRequests:(id)a3 andFileMultiplayerTTRIfNeededWithContext:(id)a4;
@end

@implementation GKMultiplayerMatchService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKMultiplayerServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 128LL;
}

- (_TtC14GameDaemonCore13GameDaemonTTR)ttrHelper
{
  ttrHelper = self->_ttrHelper;
  if (!ttrHelper)
  {
    uint64_t v4 = GKGetRuntimeStrategy(0LL, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localPlayer]);

    v7 = objc_alloc(&OBJC_CLASS____TtC14GameDaemonCore13GameDaemonTTR);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    v10 = -[GameDaemonTTR initWithClientProxyBundleIdentifier:localPlayer:]( v7,  "initWithClientProxyBundleIdentifier:localPlayer:",  v9,  v6);
    v11 = self->_ttrHelper;
    self->_ttrHelper = v10;

    ttrHelper = self->_ttrHelper;
  }

  return ttrHelper;
}

- (GKPseudonymManager)pseudonymManager
{
  pseudonymManager = self->_pseudonymManager;
  if (!pseudonymManager)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___GKPseudonymManager);
    v5 = self->_pseudonymManager;
    self->_pseudonymManager = v4;

    pseudonymManager = self->_pseudonymManager;
  }

  return pseudonymManager;
}

- (void)fetchPseudonymIfNeededWithTransportContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);
    v7[2](v7, v9, 0LL);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x3032000000LL;
    v16[3] = sub_10006EB64;
    v16[4] = sub_10006EB74;
    id v17 = 0LL;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x3032000000LL;
    v14[3] = sub_10006EB64;
    v14[4] = sub_10006EB74;
    id v15 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10006EB7C;
    v10[3] = &unk_10026F218;
    v12 = v16;
    v13 = v14;
    v10[4] = self;
    v11 = v7;
    [v9 isICloudAvailableWithHandler:v10];

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

- (void)getPlayersForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 transportContext:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v34 = v15;
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers(v15);
  }
  id v17 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v48 = v12;
    __int16 v49 = 2112;
    id v50 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Get players for match request: %@, transportContext: %@",  buf,  0x16u);
  }

  -[GKMultiplayerMatchService cancelOutstandingMatchRequestWithHandler:]( self,  "cancelOutstandingMatchRequestWithHandler:",  0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  161LL,  "-[GKMultiplayerMatchService getPlayersForMatchRequest:playerCount:rematchID:transportContext:handler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v18));

  v20 = objc_alloc_init(&OBJC_CLASS___GKMatchResponse);
  -[GKMatchResponse transitionToState:](v20, "transitionToState:", 1LL);
  -[GKMatchResponse setMatchingGroup:](v20, "setMatchingGroup:", v19);
  -[GKMatchResponse setMatchRequest:](v20, "setMatchRequest:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  [v21 setCurrentMatchResponse:v20];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10006F230;
  v40[3] = &unk_10026F290;
  v40[4] = self;
  id v41 = v14;
  id v24 = v19;
  id v42 = v24;
  v25 = v20;
  v43 = v25;
  id v44 = v12;
  id v45 = v13;
  int64_t v46 = a4;
  id v26 = v13;
  id v27 = v12;
  id v28 = v14;
  [v24 performOnQueue:v23 block:v40];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 replyQueue]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10006F880;
  v35[3] = &unk_10026BB70;
  v36 = v25;
  id v37 = v24;
  v38 = self;
  id v39 = v34;
  id v31 = v34;
  id v32 = v24;
  v33 = v25;
  [v32 notifyOnQueue:v30 block:v35];
}

+ (id)makeBaseServerRequestForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 connInfo:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  v28[0] = @"min-peers";
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 minPlayers]));
  v29[0] = v11;
  v28[1] = @"max-peers";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 maxPlayers]));
  v29[1] = v12;
  v28[2] = @"requires-guest-player-capability";
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 hasGuestPlayers]));
  v29[2] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v14));

  if (a4)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    [v15 setObject:v16 forKey:@"num-players"];
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 queueName]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 queueName]);
    [v15 setObject:v18 forKey:@"queue-name"];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 properties]);
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 properties]);
      [v15 setObject:v20 forKey:@"properties"];
    }
  }

  else
  {
    v26[0] = @"bucket-id";
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 playerGroup]));
    v27[0] = v21;
    v26[1] = @"conn-info";
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
    v27[1] = v22;
    v26[2] = @"flags";
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%#.8x",  [v9 playerAttributes]));
    v27[2] = v23;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  3LL));
    [v15 addEntriesFromDictionary:v24];

    if (v10) {
      [v15 setObject:v10 forKey:@"match-id"];
    }
  }

  return v15;
}

+ (id)makePlayersDictionaryForMatchRequest:(id)a3 transportContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localPlayerID]);
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v5 localPlayerID]);
  }
  id v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 properties]);
  id v12 = @"player-id";
  if (v11)
  {
    v61[1] = @"properties";
    v62[0] = v10;
    v61[0] = @"player-id";
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 properties]);
    v62[1] = v13;
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  2LL));
  }

  else
  {
    v59 = @"player-id";
    v60 = v10;
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
  }

  id v37 = (void *)v14;
  [v42 addObject:v14];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 recipientPlayerIDs]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v15));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 representedPlayerIDs]);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 representedPlayerIDs]);
    [v16 addObjectsFromArray:v18];
  }

  v38 = v6;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = v16;
  id v19 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v50;
    v40 = v5;
    id v41 = v10;
    uint64_t v39 = *(void *)v50;
    do
    {
      v22 = 0LL;
      id v43 = v20;
      do
      {
        if (*(void *)v50 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v22);
        if (([v23 isEqualToString:v10] & 1) == 0)
        {
          id v24 = v12;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          v25 = (void *)objc_claimAutoreleasedReturnValue([v5 recipientProperties]);
          id v26 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v46;
            while (2)
            {
              for (i = 0LL; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v46 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
                id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 playerID]);
                unsigned int v32 = [v31 isEqualToString:v23];

                if (v32)
                {
                  id v12 = v24;
                  v55[0] = v24;
                  v55[1] = @"properties";
                  v56[0] = v23;
                  id v5 = v40;
                  v33 = (void *)objc_claimAutoreleasedReturnValue([v40 recipientProperties]);
                  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v30]);
                  v56[1] = v34;
                  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));
                  [v42 addObject:v35];

                  goto LABEL_25;
                }
              }

              id v27 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          id v12 = v24;
          v53 = v24;
          v54 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
          [v42 addObject:v25];
          id v5 = v40;
LABEL_25:

          id v10 = v41;
          uint64_t v21 = v39;
          id v20 = v43;
        }

        v22 = (char *)v22 + 1;
      }

      while (v22 != v20);
      id v20 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    }

    while (v20);
  }

  return v42;
}

- (void)cancelOutstandingMatchRequestWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKMultiplayerMatchService: cancelOutstandingMatchRequest",  (uint8_t *)&buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  [v8 cancelOutstandingCheckMatchStatus];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentMatchResponse]);

  if (v10 && [v10 transitionToState:5])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rid]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 matchRequest]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v12 playerGroup]));

    if (v11 && v13)
    {
      v21[0] = @"rid";
      v21[1] = @"bucket-id";
      v22[0] = v11;
      v22[1] = v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 matchingGroup]);
      if (v15)
      {
        objc_initWeak(&buf, self);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 matchingGroup]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100070320;
        v17[3] = &unk_10026F2B8;
        objc_copyWeak(&v19, &buf);
        id v18 = v14;
        [v16 perform:v17];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&buf);
      }
    }
  }

  if (v5) {
    v5[2](v5);
  }
}

- (void)getFlowRateForPlayerGroup:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]( self,  "getFlowRateWithPlayerGroup:queueName:handler:",  v7,  0LL,  v6);
}

- (void)getOverallFlowRateWithHandler:(id)a3
{
}

- (void)getFlowRateForQueue:(id)a3 handler:(id)a4
{
}

- (void)getFlowRateWithPlayerGroup:(id)a3 queueName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"handler can't be nil"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplay erMatchService.m"));
    id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (handler)\n[%s (%s:%d)]",  v12,  "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]",  [v14 UTF8String],  392));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
  }

  if (v8 && v9)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"playerGroup and queueName can't be both non-nil"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplay erMatchService.m"));
    id v18 = objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (!(playerGroup && queueName))\n[%s (%s:%d)]",  v16,  "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]",  [v18 UTF8String],  393));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v19);
  }

  if (!os_log_GKGeneral) {
    id v20 = (id)GKOSLoggers(v10);
  }
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    sub_10007EFC8();
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  396LL,  "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v21));

  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  v39[3] = 0LL;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100070830;
  v34[3] = &unk_10026E5C0;
  v34[4] = self;
  id v23 = v8;
  id v35 = v23;
  id v24 = v9;
  id v36 = v24;
  v38 = v39;
  id v25 = v22;
  id v37 = v25;
  [v25 performOnManagedObjectContext:v34];
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 replyQueue]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100071078;
  v30[3] = &unk_10026B878;
  id v28 = v11;
  id v32 = v28;
  v33 = v39;
  id v29 = v25;
  id v31 = v29;
  [v29 notifyOnQueue:v27 block:v30];

  _Block_object_dispose(v39, 8);
}

- (void)getCompatibilityMatrix:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    sub_10007F0B8();
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  467LL,  "-[GKMultiplayerMatchService getCompatibilityMatrix:handler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007128C;
  v19[3] = &unk_10026B408;
  id v12 = v6;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  v22 = self;
  [v13 performOnManagedObjectContext:v19];
  if (v8)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100071B40;
    v16[3] = &unk_10026B030;
    id v18 = v8;
    id v17 = v13;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)setShareInvitees:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchOrCreateInviteSession]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v4));
  [v6 setShareInvitees:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 shareRecordID]);
  if (v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        id v14 = 0LL;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          -[NSMutableDictionary setObject:forKey:]( v9,  "setObject:forKey:",  &stru_10027B720,  *(void *)(*((void *)&v22 + 1) + 8LL * (void)v14));
          id v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v12);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v9,  1LL,  0LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"saveInvitedPlayers"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100071DD4;
    v18[3] = &unk_10026B080;
    id v19 = v6;
    id v20 = v15;
    id v21 = self;
    id v17 = v15;
    [v16 perform:v18];
  }
}

- (void)hasExistingInviteSessionWithHandler:(id)a3
{
  id v6 = (void (**)(id, BOOL))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 inviteSession]);

  if (v6) {
    v6[2](v6, v5 != 0LL);
  }
}

- (void)setShareRecordID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 fetchOrCreateInviteSession]);

  [v6 setShareRecordID:v4];
}

- (void)initiateInvitationForMatchRequest:(id)a3 recipients:(id)a4 devicePushTokenMap:(id)a5 isNearbyInvite:(BOOL)a6 availableForMessageV2:(BOOL)a7 transportContext:(id)a8 handler:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = v17;
  if (!os_log_GKGeneral) {
    id v19 = (id)GKOSLoggers(v17);
  }
  id v20 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 138412802;
    id v44 = v13;
    __int16 v45 = 2112;
    id v46 = v16;
    __int16 v47 = 2112;
    id v48 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Initiate invitation for match request: %@\ntransportContext: %@\nrecipients: %@",  buf,  0x20u);
  }

  id v21 = objc_alloc_init(&OBJC_CLASS___GKInviteInitiateResponse);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v24 = [v23 forceRelay];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10007246C;
  v33[3] = &unk_10026F3D0;
  id v34 = v13;
  id v35 = v14;
  BOOL v41 = a6;
  id v36 = v21;
  id v37 = v15;
  v38 = self;
  id v39 = v16;
  id v40 = v18;
  BOOL v42 = a7;
  id v25 = v18;
  id v26 = v16;
  id v27 = v15;
  id v28 = v21;
  id v29 = v14;
  id v30 = v13;
  [v22 getValidNATTypeWithForceRelay:v24 withHandler:v33];
}

- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 handler:(id)a6
{
}

- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 availableForMessageV2:(BOOL)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"loadRecordURL"));
  id v17 = (void *)v16;
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v16);
  }
  id v19 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Loading a CloudKit share URL for matchRequest: %@, transportContext: %@",  buf,  0x16u);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000735B0;
  void v29[3] = &unk_10026B6E8;
  v29[4] = self;
  id v30 = v13;
  BOOL v34 = a6;
  id v31 = v14;
  id v20 = v17;
  id v32 = v20;
  id v33 = v12;
  id v21 = v12;
  id v22 = v14;
  id v23 = v13;
  [v20 perform:v29];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100074394;
  void v26[3] = &unk_10026B030;
  id v27 = v20;
  id v28 = v15;
  id v24 = v20;
  id v25 = v15;
  [v24 notifyOnQueue:&_dispatch_main_q block:v26];
}

- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 shouldRetry:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Handler not set by callers of setupInviteShareWithRecordID:rootRecord:shouldRetry:handler:."));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplay erMatchService.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (handler)\n[%s (%s:%d)]",  v13,  "-[GKMultiplayerMatchService setupInviteShareWithRecordID:rootRecord:shouldRetry:handler:]",  [v15 UTF8String],  972));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  id v17 = -[CKShare initWithRootRecord:shareID:]( objc_alloc(&OBJC_CLASS___CKShare),  "initWithRootRecord:shareID:",  v11,  v10);
  -[CKShare setPublicPermission:](v17, "setPublicPermission:", 3LL);
  id v18 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  v34[0] = v17;
  v34[1] = v11;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  id v20 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v18,  "initWithRecordsToSave:recordIDsToDelete:",  v19,  0LL);

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  -[CKModifyRecordsOperation setConfiguration:](v20, "setConfiguration:", v21);

  -[CKModifyRecordsOperation setSavePolicy:](v20, "setSavePolicy:", 1LL);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000746A8;
  void v27[3] = &unk_10026F498;
  id v31 = v11;
  id v32 = v12;
  BOOL v33 = a5;
  id v28 = v17;
  id v29 = self;
  id v30 = v10;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v25 = v17;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v20, "setModifyRecordsCompletionBlock:", v27);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService privateDatabase](self, "privateDatabase"));
  [v26 addOperation:v20];
}

- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 handler:(id)a5
{
}

- (id)privateDatabase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.socialgaming.sessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 privateCloudDatabase]);

  return v3;
}

- (void)saveRecord:(id)a3 withHandler:(id)a4
{
}

- (BOOL)zoneNotFoundFromOperation:(id)a3 operationError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 code] == (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues", 0));
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) code] == (id)26)
          {
            if (!os_log_GKGeneral) {
              id v13 = (id)GKOSLoggers(26LL);
            }
            id v14 = (os_log_s *)os_log_GKMatch;
            LOBYTE(v10) = 1;
            if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)id buf = 138412290;
              id v21 = v5;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Zone Not Found. Should retry %@ after creating zone.",  buf,  0xCu);
            }

            goto LABEL_16;
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

- (void)saveRecord:(id)a3 shouldRetry:(BOOL)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Handler not set by callers of saveRecord:shouldRetry:withHandler:."));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplay erMatchService.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (handler)\n[%s (%s:%d)]",  v10,  "-[GKMultiplayerMatchService saveRecord:shouldRetry:withHandler:]",  [v12 UTF8String],  1053));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  id v14 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v25 = v8;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  __int128 v16 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v14,  "initWithRecordsToSave:recordIDsToDelete:",  v15,  0LL);

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  -[CKModifyRecordsOperation setConfiguration:](v16, "setConfiguration:", v17);

  -[CKModifyRecordsOperation setSavePolicy:](v16, "setSavePolicy:", 1LL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  void v21[2] = sub_100074E24;
  v21[3] = &unk_10026F4C0;
  BOOL v24 = a4;
  v21[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v18 = v9;
  id v19 = v8;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v16, "setModifyRecordsCompletionBlock:", v21);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService privateDatabase](self, "privateDatabase"));
  [v20 addOperation:v16];
}

- (void)invitePlayersForMatchRequest:(id)a3 devicePushTokenMap:(id)a4 isNearbyInvite:(BOOL)a5 transportContext:(id)a6 handler:(id)a7
{
  id v11 = a3;
  id v49 = a4;
  id v12 = a6;
  id v13 = a7;
  __int128 v50 = v13;
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v13);
  }
  id v15 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v70 = v11;
    __int16 v71 = 2112;
    id v72 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Invite players for matchRequest: %@, transportContext: %@",  buf,  0x16u);
  }

  __int16 v45 = v12;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1091LL,  "-[GKMultiplayerMatchService invitePlayersForMatchRequest:devicePushTokenMap:isNearbyInvite:transport Context:handler:]"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v16));

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 recipients]);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_1000753EC;
  v67[3] = &unk_10026C348;
  id v20 = v18;
  id v68 = v20;
  [v19 enumerateObjectsUsingBlock:v67];

  if (![v20 count])
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 recipientPlayerIDs]);
    [v20 addObjectsFromArray:v21];
  }

  id v22 = [v20 count];
  id v23 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v22);
  BOOL v24 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v22);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary, v25);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 archivedSharePlayInviteeTokensFromProgrammaticInvite]);
  id v66 = 0LL;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v26,  v27,  &v66));
  id v29 = v66;

  __int128 v51 = v29;
  if (v29)
  {
    id v31 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v32 = (id)GKOSLoggers(v30);
      id v31 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_10007F474();
    }
  }

  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v33 replyQueue]);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  void v55[2] = sub_100075448;
  v55[3] = &unk_10026F538;
  id v56 = v20;
  id v57 = v49;
  v58 = v23;
  id v59 = v28;
  v60 = v24;
  id v35 = v17;
  id v61 = v35;
  v62 = self;
  BOOL v65 = a5;
  id v63 = v11;
  id v64 = v45;
  id v48 = v45;
  id v46 = v11;
  id v36 = v24;
  id v37 = v28;
  id v38 = v23;
  id v39 = v49;
  id v40 = v20;
  [v35 performOnQueue:v34 block:v55];

  BOOL v41 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([v41 replyQueue]);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100076430;
  v52[3] = &unk_10026B030;
  id v53 = v35;
  id v54 = v50;
  id v43 = v35;
  id v44 = v50;
  [v43 notifyOnQueue:v42 block:v52];
}

- (void)removePlayersFromGameInviteV2:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Remove players from game inviteV2: %@", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 inviteSession]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sessionToken]);
  id v14 = dispatch_group_create();
  id v15 = v14;
  if (v12 && v13)
  {
    dispatch_group_enter(v14);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    void v21[2] = sub_100076714;
    v21[3] = &unk_10026B938;
    id v22 = v6;
    id v23 = v12;
    id v24 = v13;
    uint64_t v25 = self;
    uint64_t v26 = v15;
    [v23 performAsync:v21];
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100076A68;
  v19[3] = &unk_10026B120;
  id v20 = v8;
  id v18 = v8;
  dispatch_group_notify(v15, v17, v19);
}

- (void)cancelGameInviteWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Cancel game invite", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 inviteSession]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1349LL,  "-[GKMultiplayerMatchService cancelGameInviteWithHandler:]"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v10));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100076C5C;
  v18[3] = &unk_10026B170;
  id v19 = v9;
  id v20 = self;
  id v12 = v9;
  [v11 perform:v18];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100076DC0;
  v16[3] = &unk_10026B310;
  void v16[4] = self;
  id v17 = v5;
  id v15 = v5;
  [v11 notifyOnQueue:v14 block:v16];
}

- (id)ensureGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 numberOfAutomatched:(int64_t)a6 moc:(id)a7 list:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = (MultiplayerGroupList *)a8;
  if (!v14)
  {
    id v15 = objc_alloc(&OBJC_CLASS___MultiplayerGroupList);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroupList entity](&OBJC_CLASS___MultiplayerGroupList, "entity"));
    id v14 = -[MultiplayerGroupList initWithEntity:insertIntoManagedObjectContext:]( v15,  "initWithEntity:insertIntoManagedObjectContext:",  v16,  v13);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroup _gkFetchRequest](&OBJC_CLASS___MultiplayerGroup, "_gkFetchRequest"));
  BOOL v41 = v11;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"id == %@",  v11));
  [v17 setPredicate:v18];

  id v37 = v17;
  id v19 = (MultiplayerGroup *)objc_claimAutoreleasedReturnValue( +[NSManagedObject _gkRetrieveCleanEntry:request:]( &OBJC_CLASS___NSManagedObject,  "_gkRetrieveCleanEntry:request:",  v13,  v17));
  if (!v19)
  {
    id v20 = objc_alloc(&OBJC_CLASS___MultiplayerGroup);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroup entity](&OBJC_CLASS___MultiplayerGroup, "entity"));
    id v19 = -[MultiplayerGroup initWithEntity:insertIntoManagedObjectContext:]( v20,  "initWithEntity:insertIntoManagedObjectContext:",  v21,  v13);

    -[MultiplayerGroupList addEntriesObject:](v14, "addEntriesObject:", v19);
  }

  id v36 = v19;
  id v38 = v14;
  id v22 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v23 = v12;
  id v24 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v43;
    do
    {
      id v27 = 0LL;
      do
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)v27);
        id v29 = objc_alloc(&OBJC_CLASS___MultiplayerGroupParticipant);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[MultiplayerGroupParticipant entity](&OBJC_CLASS___MultiplayerGroupParticipant, "entity"));
        id v31 = -[MultiplayerGroupParticipant initWithEntity:insertIntoManagedObjectContext:]( v29,  "initWithEntity:insertIntoManagedObjectContext:",  v30,  v13);

        -[MultiplayerGroupParticipant setPlayerID:](v31, "setPlayerID:", v28);
        -[NSMutableSet addObject:](v22, "addObject:", v31);

        id v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }

    while (v25);
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MultiplayerGroup entries](v36, "entries"));
  -[MultiplayerGroup removeEntries:](v36, "removeEntries:", v32);

  -[MultiplayerGroup addEntries:](v36, "addEntries:", v22);
  -[MultiplayerGroup setId:](v36, "setId:", v41);
  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  -[MultiplayerGroup setNumberOfAutomatched:](v36, "setNumberOfAutomatched:", v33);

  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  -[MultiplayerGroup setPlayedAt:](v36, "setPlayedAt:", v34);

  return v36;
}

- (void)convertToInternalObjects:(id)a3 results:(id)a4
{
  id v24 = a4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([a3 entries]);
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_opt_new(&OBJC_CLASS___GKMultiplayerGroupInternal);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 numberOfAutomatched]);
        objc_msgSend(v10, "setNumberOfAutomached:", objc_msgSend(v11, "longValue"));

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 id]);
        [v10 setGroupID:v12];

        id v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        [v10 setParticipants:v13];

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 playedAt]);
        objc_msgSend(v10, "setPlayedAt:", objc_msgSend(v14, "longValue"));

        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 entries]);
        id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v26;
          do
          {
            id v19 = 0LL;
            do
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v19);
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 participants]);
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 playerID]);
              [v21 addObject:v22];

              id v19 = (char *)v19 + 1;
            }

            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }

          while (v17);
        }

        [v24 addObject:v10];
        id v8 = (char *)v8 + 1;
      }

      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v6);
  }
}

- (void)getMultiPlayerGroups:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  [v5 setResult:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000774B8;
  v10[3] = &unk_10026D328;
  v10[4] = self;
  id v11 = v6;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  [v8 performOnManagedObjectContext:v10];
}

- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pushCredentialForEnvironment:", objc_msgSend(v18, "environment")));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playerInternal]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1492LL,  "-[GKMultiplayerMatchService putMultiPlayerGroup:participants:playedAt:bundleID:numberOfAutomatched:handler:]"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 playerID]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v21,  v22));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100078010;
  void v29[3] = &unk_10026F5C8;
  id v30 = v14;
  __int128 v31 = self;
  int64_t v35 = a5;
  int64_t v36 = a7;
  id v32 = v13;
  id v33 = v15;
  id v34 = v16;
  id v24 = v16;
  id v25 = v15;
  id v26 = v13;
  id v27 = v14;
  [v23 performOnManagedObjectContext:v29];
}

- (void)acceptGameInvite:(id)a3 transportContext:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v10);
  }
  id v13 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v36 = v8;
    __int16 v37 = 2112;
    id v38 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Accept game invite: %@, transportContext: %@",  buf,  0x16u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1525LL,  "-[GKMultiplayerMatchService acceptGameInvite:transportContext:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  id v16 = objc_alloc_init(&OBJC_CLASS___GKInviteAcceptResponse);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000785A8;
  v30[3] = &unk_10026BB28;
  void v30[4] = self;
  id v31 = v8;
  id v32 = v9;
  id v19 = v15;
  id v33 = v19;
  id v34 = v16;
  id v20 = v16;
  id v21 = v9;
  id v22 = v8;
  [v19 performOnQueue:v18 block:v30];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 replyQueue]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100078E08;
  void v27[3] = &unk_10026B030;
  id v28 = v19;
  id v29 = v11;
  id v25 = v19;
  id v26 = v11;
  [v25 notifyOnQueue:v24 block:v27];
}

- (void)declineGameInvite:(id)a3 reason:(int64_t)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);

  id v25 = (void *)v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v12,  @"s",  0LL));
  id v26 = v9;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 pushToken]);
  v29[0] = @"session-token";
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionToken]);
  v30[0] = v15;
  v29[1] = @"peer-id";
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 peerID]);
  v30[1] = v16;
  v29[2] = @"peer-push-token";
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 peerPushToken]);

  v30[2] = v17;
  void v29[3] = @"self-push-token";
  uint64_t v18 = v14;
  if (!v14) {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v30[3] = v18;
  void v29[4] = @"reason";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  void v29[5] = @"client-data";
  void v30[4] = v19;
  void v30[5] = v13;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  6LL));

  if (!v14) {
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100079164;
  void v27[3] = &unk_10026B4F8;
  id v28 = v7;
  id v23 = v7;
  [v21 issueRequest:v20 bagKey:@"gk-invitation-reject" clientProxy:v22 handler:v27];
}

- (void)getAcceptedGameInviteWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1624LL,  "-[GKMultiplayerMatchService getAcceptedGameInviteWithHandler:]"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100079244;
  v7[3] = &unk_10026B310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v5, v7);
}

- (void)hasCanceledMultiplayerInitiateBulletinForSessionToken:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKMultiplayerMatchService: hasCanceledMultiplayerInitiateBulletinForSessionToken",  v13,  2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 acceptedInviteManager]);
  id v12 = [v11 removeAndReturnQueuedCancelledInviteWithSessionToken:v5];
  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v12);
  }
}

- (void)getPlayersToInviteWithHandlerV2:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1690LL,  "-[GKMultiplayerMatchService getPlayersToInviteWithHandlerV2:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100079944;
  v14[3] = &unk_10026BDB0;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  [v7 performBlockAndWait:v14];

  if (v4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 replyQueue]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100079A90;
    v11[3] = &unk_10026B030;
    id v13 = v4;
    id v12 = v8;
    [v12 notifyOnQueue:v10 block:v11];
  }
}

- (void)getInviteSessionTokenWithHandler:(id)a3
{
  id v4 = a3;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_10006EB64;
  v13[4] = sub_10006EB74;
  id v14 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 inviteSession]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100079BFC;
  v9[3] = &unk_10026F6A8;
  id v12 = v13;
  id v7 = v6;
  id v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [v7 performAsync:v9];

  _Block_object_dispose(v13, 8);
}

- (void)removeInviteSession
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  [v2 deleteInviteSession];
}

- (void)removeInviteSessionIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchOrCreateInviteSession]);
  unsigned int v5 = [v4 shouldBeCleared];

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v6);
    }
    id v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v9 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 inviteSession]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 inviteSession]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionToken]);
      int v16 = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "ClientProxy should clear inviteSession: %@, token: %@",  (uint8_t *)&v16,  0x16u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    [v15 deleteInviteSession];
  }

- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100079F70;
  void v27[3] = &unk_10026F6D0;
  id v28 = v14;
  id v29 = v16;
  id v30 = self;
  id v31 = v17;
  id v32 = v15;
  id v33 = v18;
  id v34 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v15;
  id v24 = v17;
  id v25 = v16;
  id v26 = v14;
  [v20 getValidNATTypeWithForceRelay:0 withHandler:v27];
}

- (void)sendInvitationUpdate:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v46 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 playerTokenMap]);
  __int128 v50 = v5;
  id v51 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v51)
  {
    uint64_t v49 = *(void *)v65;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v65 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v7;
        uint64_t v8 = *(void *)(*((void *)&v64 + 1) + 8 * v7);
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 playerTokenMap]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

        id v11 = [v10 countByEnumeratingWithState:&v60 objects:v76 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v61;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v61 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
              v74[0] = @"id";
              v74[1] = @"push-token";
              v75[0] = v8;
              v75[1] = v15;
              id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v75,  v74,  2LL));
              [v6 addObject:v16];
            }

            id v12 = [v10 countByEnumeratingWithState:&v60 objects:v76 count:16];
          }

          while (v12);
        }

        uint64_t v7 = v52 + 1;
        id v5 = v50;
      }

      while ((id)(v52 + 1) != v51);
      id v51 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
    }

    while (v51);
  }

  v72[0] = @"bundle-id";
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);
  v73[0] = v18;
  v72[1] = GKSuggestedTransportVersionPushShortKey;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 transportVersionToUse]);
  v73[1] = v19;
  v72[2] = GKInviteSessionIDKey;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionID]);
  v73[2] = v20;
  id v21 = v5;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  3LL));
  id v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v22));

  v70[0] = @"session-token";
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 sessionToken]);
  v71[0] = v23;
  v70[1] = @"self-push-token";
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 pushToken]);
  id v26 = v25;
  if (!v25) {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v71[1] = v26;
  v70[2] = @"reason";
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL));
  v70[3] = @"peers";
  v71[2] = v27;
  v71[3] = v6;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v71,  v70,  4LL));
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v28));

  if (!v25) {
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v50 matchID]);
  }

  if (v30)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v50 matchID]);
    [v53 setObject:v31 forKeyedSubscript:GKMatchmakerMatchID];
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue([v50 playerTokenMap]);

  if (v32)
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v50 playerTokenMap]);
    [v53 setObject:v33 forKeyedSubscript:GKTransportPlayerTokenMapKey];
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v50 gameParticipants]);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_10007AC34;
  v58[3] = &unk_10026F6F8;
  id v36 = v34;
  id v59 = v36;
  [v35 enumerateObjectsUsingBlock:v58];

  if ([v36 count]) {
    [v53 setObject:v36 forKey:GKInviteGameParticipantsKey];
  }
  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v50 lobbyParticipants]);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  void v56[2] = sub_10007AC78;
  v56[3] = &unk_10026F6F8;
  id v39 = v37;
  id v57 = v39;
  [v38 enumerateObjectsUsingBlock:v56];

  if ([v39 count]) {
    [v53 setObject:v39 forKey:GKInviteLobbyParticipantsKey];
  }
  id v40 = [v29 setObject:v53 forKeyedSubscript:@"client-data"];
  if (!os_log_GKGeneral) {
    id v41 = (id)GKOSLoggers(v40);
  }
  __int128 v42 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    v69 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "Sending invitation update with request: %@",  buf,  0xCu);
  }

  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10007ACBC;
  v54[3] = &unk_10026B4F8;
  id v55 = v46;
  id v45 = v46;
  [v43 issueRequest:v29 bagKey:@"gk-invitation-send" clientProxy:v44 handler:v54];
}

- (void)requestTTRLogsWith:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v51 = v7;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v7);
  }
  id v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    *(_DWORD *)id buf = 138412546;
    id v70 = v6;
    __int16 v71 = 2112;
    id v72 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Request TTRLogsWith: %@, for client proxy: %@",  buf,  0x16u);
  }

  __int128 v50 = self;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 playersAndPushTokens]);
  id v15 = [v14 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v59;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v58 + 1) + 8 * (void)i) serverRepresentation]);
        [v13 addObject:v19];
      }

      id v16 = [v14 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }

    while (v16);
  }

  id v53 = v6;

  v66[0] = @"session-token";
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  v67[0] = v20;
  v66[1] = @"self-push-token";
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pushToken]);
  id v23 = v22;
  if (!v22) {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v67[1] = v23;
  v66[2] = @"reason";
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 100LL));
  v67[2] = v24;
  v67[3] = v13;
  v66[3] = @"peers";
  v66[4] = GKTTRBulletinKeyRadarID;
  uint64_t v49 = GKTTRBulletinKeyRadarID;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 radarID]);
  void v67[4] = v25;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  5LL));
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v26));

  if (!v22) {
  v56[0] = _NSConcreteStackBlock;
  }
  v56[1] = 3221225472LL;
  void v56[2] = sub_10007B3E0;
  v56[3] = &unk_10026BBE8;
  id v27 = v51;
  id v57 = v27;
  id v28 = objc_retainBlock(v56);
  uint64_t v29 = objc_claimAutoreleasedReturnValue([v53 radarID]);
  id v30 = v53;
  if (v29
    && (id v31 = (void *)v29,
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v53 requesterAlias]),
        v32,
        v31,
        v32))
  {
    v62[0] = v49;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v53 radarID]);
    v63[0] = v33;
    v62[1] = GKTTRBulletinKeyRequesterPlayerAlias;
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v53 requesterAlias]);
    v63[1] = v34;
    int64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v63,  v62,  2LL));

    id v36 = [v52 setObject:v35 forKeyedSubscript:@"client-data"];
    if (!os_log_GKGeneral) {
      id v37 = (id)GKOSLoggers(v36);
    }
    id v38 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v39 = v38;
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v50, "clientProxy"));
      *(_DWORD *)id buf = 138412546;
      id v70 = v52;
      __int16 v71 = 2112;
      id v72 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "Sending TTRLogs with request: %@, self.clientProxy: %@",  buf,  0x16u);
    }

    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v50, "clientProxy"));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_10007B468;
    v54[3] = &unk_10026B4F8;
    id v55 = v28;
    __int128 v43 = v52;
    [v41 issueRequest:v52 bagKey:@"gk-invitation-send" clientProxy:v42 handler:v54];
  }

  else
  {
    uint64_t v44 = GKInternalErrorDomain;
    __int128 v64 = @"reason";
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v53 radarID]);
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v53 requesterAlias]);
    __int16 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid GKTTRLogRequestInfo(radarID: %@, requesterAlias: %@)",  v45,  v46));
    __int128 v65 = v47;
    id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
    int64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v44,  900LL,  v48));

    id v30 = v53;
    ((void (*)(void *, void *))v28[2])(v28, v35);
    __int128 v43 = v52;
  }
}

- (void)_performRelayAction:(id)a3 request:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1905LL,  "-[GKMultiplayerMatchService _performRelayAction:request:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007B718;
  v23[3] = &unk_10026BEC8;
  id v24 = v9;
  id v25 = v8;
  id v26 = self;
  id v13 = v12;
  id v27 = v13;
  id v14 = v8;
  id v15 = v9;
  [v13 perform:v23];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10007B850;
  v20[3] = &unk_10026B030;
  id v21 = v13;
  id v22 = v10;
  id v18 = v13;
  id v19 = v10;
  [v18 notifyOnQueue:v17 block:v20];
}

- (void)initiateRelayRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007B994;
  v11[3] = &unk_10026F720;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getValidNATTypeWithForceRelay:0 withHandler:v11];
}

- (void)updateRelayRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007BBF0;
  v11[3] = &unk_10026F720;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getValidNATTypeWithForceRelay:0 withHandler:v11];
}

- (void)cancelRelayRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "relayCancel serverRequest:%@",  (uint8_t *)&v12,  0xCu);
  }

  -[GKMultiplayerMatchService _performRelayAction:request:handler:]( self,  "_performRelayAction:request:handler:",  @"gk-invitation-relay-cancel",  v6,  v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v11 reportEvent:GKReporterDomainRelay type:GKReporterRelayCancel];
}

- (void)updateCacheWithNearbyProfileDictionary:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  1970LL,  "-[GKMultiplayerMatchService updateCacheWithNearbyProfileDictionary:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"profile"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"playerID"]);
  if (v11)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10007C090;
    v18[3] = &unk_10026BEA0;
    id v19 = v11;
    id v20 = v9;
    id v21 = v10;
    [v12 performBlockAndWait:v18];
  }

  if (v6)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10007C45C;
    v15[3] = &unk_10026B030;
    id v17 = v6;
    id v16 = v9;
    [v16 notifyOnQueue:v14 block:v15];
  }
}

- (void)startNearbyBrowsingWithPlayerID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 peerDiscovery]);
    *(_DWORD *)id buf = 138412290;
    uint64_t v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "peerDiscovery (%@) startBrowsing", buf, 0xCu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10007C6F4;
  void v26[3] = &unk_10026B120;
  id v14 = v8;
  id v27 = v14;
  id v15 = objc_retainBlock(v26);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v17 = [v16 disableViceroyNearby];

  if ((v17 & 1) == 0)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 nearbyDiscovery]);
    [v19 startBrowsingWithPlayerID:v6];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v21 = [v20 fastSyncTransportEnabled];

  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 peerDiscovery]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10007C768;
    v24[3] = &unk_10026B120;
    id v25 = v15;
    [v23 startBrowsingWithCompletionHandler:v24];
  }

  else
  {
    ((void (*)(void *))v15[2])(v15);
  }
}

- (void)stopNearbyBrowsingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 peerDiscovery]);
    *(_DWORD *)id buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "peerDiscovery (%@) stopBrowsing", buf, 0xCu);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007C9AC;
  v23[3] = &unk_10026B120;
  id v11 = v5;
  id v24 = v11;
  int v12 = objc_retainBlock(v23);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v14 = [v13 disableViceroyNearby];

  if ((v14 & 1) == 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nearbyDiscovery]);
    [v16 stopBrowsing];
  }

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v18 = [v17 fastSyncTransportEnabled];

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 peerDiscovery]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    void v21[2] = sub_10007CA20;
    v21[3] = &unk_10026B120;
    id v22 = v12;
    [v20 stopBrowsingWithCompletionHandler:v21];
  }

  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

- (void)startNearbyAdvertisingWithDiscoveryInfo:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 peerDiscovery]);
    *(_DWORD *)id buf = 138412290;
    id v31 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "peerDiscovery (%@) startListening", buf, 0xCu);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10007CCB4;
  void v28[3] = &unk_10026BBE8;
  id v14 = v8;
  id v29 = v14;
  id v15 = objc_retainBlock(v28);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v17 = [v16 disableViceroyNearby];

  if ((v17 & 1) != 0)
  {
    unsigned int v18 = 0LL;
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 nearbyDiscovery]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v20 startAdvertisingWithDiscoveryInfo:v6]);
  }

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v22 = [v21 fastSyncTransportEnabled];

  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 peerDiscovery]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10007CD38;
    v25[3] = &unk_10026B030;
    id v27 = v15;
    id v26 = v18;
    [v24 startListening:v6 completionHandler:v25];
  }

  else
  {
    ((void (*)(void *, void *))v15[2])(v15, v18);
  }
}

- (void)stopNearbyAdvertisingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 peerDiscovery]);
    *(_DWORD *)id buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "peerDiscovery (%@) stopListening", buf, 0xCu);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007CF80;
  v23[3] = &unk_10026B120;
  id v11 = v5;
  id v24 = v11;
  int v12 = objc_retainBlock(v23);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v14 = [v13 disableViceroyNearby];

  if ((v14 & 1) == 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nearbyDiscovery]);
    [v16 stopAdvertising];
  }

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v18 = [v17 fastSyncTransportEnabled];

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 peerDiscovery]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    void v21[2] = sub_10007CFF4;
    v21[3] = &unk_10026B120;
    unsigned int v22 = v12;
    [v20 stopListeningWithCompletionHandler:v21];
  }

  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

- (void)presentNearbyInvite:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  [v4 presentNearbyInvite:v3];
}

- (void)nearbyInviteWasCancelled:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  [v4 nearbyInviteWasCancelled:v3];
}

- (void)fetchDevicePushToken:(id)a3
{
  id v3 = a3;
  id v4 = (void (**)(void, void))v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKMultiplayerMatchService fetchDevicePushToken",  v9,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pushToken]);

  ((void (**)(void, void *))v4)[2](v4, v8);
}

- (void)fetchOnDeviceMultiplayerBundleIDsForNewBundleID:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "fetchOnDeviceMultiplayerBundleIDsForNewBundleID: %@",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v10,  0LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10007D2D4;
  v13[3] = &unk_10026C5A0;
  id v14 = v7;
  id v12 = v7;
  [v11 getOnDeviceMultiplayerGamesForBundleIDs:v5 handler:v13];
}

- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  BOOL v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    LOWORD(v19) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "fetchOnDeviceMultiplayerBundleIDsWithHandler",  (uint8_t *)&v19,  2u);
  }

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  id v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@ Scanning installed apps",  (uint8_t *)&v19,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 availableGameIdentifiers]);
  id v13 = [v12 count];
  id v14 = v13;
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers(v13);
  }
  id v16 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v17 = v16;
    unsigned int v18 = (GKMultiplayerMatchService *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v14));
    int v19 = 138412290;
    id v20 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "found %@ installed Game Center games.",  (uint8_t *)&v19,  0xCu);
  }

  -[GKMultiplayerMatchService fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:]( self,  "fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:",  v12,  v5);
}

- (void)isGameCenterMultiplayerGameForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "isGameCenterMultiplayerGameForBundleID, bundleID: %@",  buf,  0xCu);
  }

  id v17 = v6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007D74C;
  v14[3] = &unk_10026C550;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  -[GKMultiplayerMatchService fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:]( self,  "fetchOnDeviceMultiplayerBundleIDsForNewBundleID:handler:",  v11,  v14);
}

- (void)fetchTransportOverrideWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void (**)(void, void, void, void))v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetchTransportOverrideWithHandler", v12, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 forceEnabledTransportVersions]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 forceDisabledTransportVersions]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  ((void (**)(void, void *, void *, id))v4)[2]( v4,  v8,  v10,  [v11 multiplayerHealthCheckEnabled]);
}

- (void)setupNearbyDiscovery
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v4 = [v3 disableViceroyNearby];

  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers(v5);
    }
    id v7 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Viceroy nearby is disabled. Stop setting up nearby discovery.",  buf,  2u);
    }
  }

  else
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    void v22[2] = sub_10007DAA8;
    v22[3] = &unk_10026F770;
    id v10 = v9;
    id v23 = v10;
    id v11 = objc_retainBlock(v22);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10007DD6C;
    v20[3] = &unk_10026F7C0;
    id v12 = v10;
    id v21 = v12;
    id v13 = objc_retainBlock(v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10007DF50;
    v18[3] = &unk_10026F7E8;
    id v19 = v12;
    id v14 = v12;
    id v15 = objc_retainBlock(v18);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 nearbyDiscovery]);
    [v17 setupWithPlayerFoundHandler:v11 playerLostHandler:v13 receiveDataHandler:v15];
  }

- (void)forgetParticipant:(id)a3 deviceID:(id)a4 handler:(id)a5
{
  BOOL v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nearbyDiscovery]);
  [v12 forgetParticipant:v10 deviceID:v9];

  if (v8)
  {
    v8[2](v8);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v13);
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_10007F7CC();
    }
  }
}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 usePeerDiscovery:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = v15;
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers(v15);
  }
  unsigned int v18 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v19 = @"bonjour in Viceoroy";
    if (v8) {
      id v19 = @"bonjour in gamed";
    }
    *(_DWORD *)id buf = 138412290;
    id v31 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Sending data to nearby participant with %@",  buf,  0xCu);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v21 = v20;
  if (v8)
  {
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v20 peerDiscovery]);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10007E450;
    void v28[3] = &unk_10026BBE8;
    id v23 = &v29;
    id v29 = v16;
    id v24 = v16;
    [v22 sendDataToParticipant:v12 deviceID:v13 data:v14 completionHandler:v28];
  }

  else
  {
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v20 nearbyDiscovery]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10007E468;
    void v26[3] = &unk_10026BBE8;
    id v23 = &v27;
    id v27 = v16;
    id v25 = v16;
    [v22 sendDataToParticipant:v12 deviceID:v13 data:v14 handler:v26];
  }
}

- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService pseudonymManager](self, "pseudonymManager"));
  [v8 revokePseudonym:v7 completionHandler:v6];
}

- (void)validateRequests:(id)a3 andFileMultiplayerTTRIfNeededWithContext:(id)a4
{
  id v8 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:GKSupportedTransportVersionsKey]);
  unsigned int v7 = [v6 containsObject:&off_100287970];

  if (v7) {
    -[GKMultiplayerMatchService fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:]( self,  "fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:",  &stru_10027B720,  v8,  &stru_10026F808);
  }
}

- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v12 = [v11 isInternalBuild];

  if (v12)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v13);
    }
    id v15 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138412290;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKMultiplayerService fileMultiplayerTTR with callbackIdentifier: %@",  buf,  0xCu);
    }

    uint64_t v22 = GKTTRBulletinKeyType;
    id v23 = &off_100287988;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v16));

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService ttrHelper](self, "ttrHelper"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 getURLForNewMultiplayerRadarWithCallbackIdentifier:v8 descriptionAddition:v9]);

    if (v19) {
      [v17 setObject:v19 forKeyedSubscript:GKTTRBulletinKeyURL];
    }
    if (v9) {
      [v17 setObject:v9 forKeyedSubscript:GKTTRBulletinKeySubtitle];
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKTTRInitiationBulletin packFakeTTRBulletinWithInfo:]( &OBJC_CLASS___GKTTRInitiationBulletin,  "packFakeTTRBulletinWithInfo:",  v17));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
    [v21 processIncomingTTR:v20];

    v10[2](v10);
  }
}

- (void)uploadLogsForRadar:(id)a3 from:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v12 = [v11 isInternalBuild];

  if (v12)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v13);
    }
    id v15 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKMultiplayerServicePrivate uploadLogsForRadar:",  v22,  2u);
    }

    v23[0] = GKTTRBulletinKeyType;
    v23[1] = GKTTRBulletinKeyRadarID;
    v24[0] = &off_100287988;
    v24[1] = v8;
    v23[2] = GKTTRBulletinKeyRequesterPlayerAlias;
    v24[2] = v9;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v16));

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerMatchService ttrHelper](self, "ttrHelper"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 getURLForExistingMultiplayerRadarWithRadarID:v8]);

    if (v19) {
      [v17 setObject:v19 forKeyedSubscript:GKTTRBulletinKeyURL];
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKTTRUploadRequestBulletin packFakeTTRBulletinWithInfo:]( &OBJC_CLASS___GKTTRUploadRequestBulletin,  "packFakeTTRBulletinWithInfo:",  v17));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
    [v21 processIncomingTTR:v20];

    v10[2](v10);
  }
}

- (void)setPseudonymManager:(id)a3
{
}

- (void)setTtrHelper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end