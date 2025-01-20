@interface GKProfileService
+ (Class)interfaceClass;
+ (id)profileRequestForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4;
+ (unint64_t)requiredEntitlements;
- (void)fetchProfilesForPlayerIDs:(id)a3 familiarity:(int)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)getFriendSupportPageURLWithHandler:(id)a3;
- (void)getOcelotStateForCurrentAppWithHandler:(id)a3;
- (void)getProfilesForPlayerIDs:(id)a3 discardingStaleData:(BOOL)a4 handler:(id)a5;
- (void)getProfilesForPlayerIDs:(id)a3 handler:(id)a4;
- (void)loadProfilesForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6;
- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5;
- (void)setOcelotStateForCurrentApp;
- (void)updateChallengedGames:(id)a3 forPlayers:(id)a4 group:(id)a5;
- (void)updateGames:(id)a3 forPlayers:(id)a4 group:(id)a5 updater:(id)a6;
- (void)updateLastPlayedGames:(id)a3 forPlayers:(id)a4 group:(id)a5;
@end

@implementation GKProfileService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKProfileServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 2LL;
}

+ (id)profileRequestForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4
{
  v10 = @"player-ids";
  id v11 = a3;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-details"];
  if ((a4 & 8) == 0)
  {
    if ((a4 & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-stats"];
    if ((a4 & 0x80) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"check-friend-invitation-ability"];
    goto LABEL_4;
  }

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-emails"];
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-emails-hashed"];
  if ((a4 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((a4 & 0x80) != 0) {
    goto LABEL_7;
  }
LABEL_4:
  id v8 = [v7 copy];

  return v8;
}

- (void)updateGames:(id)a3 forPlayers:(id)a4 group:(id)a5 updater:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v11 count]));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100021BCC;
  v23[3] = &unk_10026BFE8;
  id v15 = v10;
  id v24 = v15;
  id v16 = v14;
  id v25 = v16;
  id v17 = v11;
  id v26 = v17;
  [v17 enumerateObjectsUsingBlock:v23];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);
  if ([v18 count])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100021C7C;
    v19[3] = &unk_10026C088;
    v19[4] = self;
    id v20 = v18;
    id v21 = v16;
    id v22 = v13;
    [v12 perform:v19];
  }
}

- (void)updateLastPlayedGames:(id)a3 forPlayers:(id)a4 group:(id)a5
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
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "GKProfileService: updateLastPlayedGames:",  v14,  2u);
  }

  -[GKProfileService updateGames:forPlayers:group:updater:]( self,  "updateGames:forPlayers:group:updater:",  v8,  v9,  v11,  &stru_10026C0C8);
}

- (void)updateChallengedGames:(id)a3 forPlayers:(id)a4 group:(id)a5
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
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "GKProfileService: updateChallengedGames:",  v14,  2u);
  }

  -[GKProfileService updateGames:forPlayers:group:updater:]( self,  "updateGames:forPlayers:group:updater:",  v8,  v9,  v11,  &stru_10026C0E8);
}

- (void)fetchProfilesForPlayerIDs:(id)a3 familiarity:(int)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v37 = a3;
  id v12 = a6;
  id v13 = a7;
  v36 = v13;
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v13);
  }
  id v15 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKProfileService: fetchProfilesForPlayerIDs",  buf,  2u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  148LL,  "-[GKProfileService fetchProfilesForPlayerIDs:familiarity:responseKind:context:handler:]"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v16,  v12,  v17));

  *(void *)buf = 0LL;
  v59 = buf;
  uint64_t v60 = 0x2020000000LL;
  BOOL v61 = a5 == 2;
  v56[0] = 0LL;
  v56[1] = v56;
  v56[2] = 0x2020000000LL;
  char v57 = 0;
  id v20 = &OBJC_CLASS___GKFriendRecommendationInternal_ptr;
  switch((int)v10)
  {
    case 1:
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___GKLocalPlayerInternal, v19);
      char v22 = 0;
      goto LABEL_9;
    case 2:
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___GKFriendPlayerInternal, v19);
      char v22 = 1;
LABEL_9:
      char v23 = 1;
      goto LABEL_12;
    case 3:
      id v20 = &OBJC_CLASS___GKFriendRequestInternal_ptr;
      goto LABEL_11;
    case 4:
      goto LABEL_11;
    default:
      id v20 = &OBJC_CLASS___GKPlayerInternal_ptr;
LABEL_11:
      uint64_t v21 = objc_opt_class(*v20, v19);
      char v22 = 0;
      char v23 = 0;
LABEL_12:
      id v24 = self;
      unsigned __int8 v25 = +[GKPlayerProfileCacheObject piecesToLoadForFamiliarity:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "piecesToLoadForFamiliarity:",  v10);
      v35 = v12;
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v37));
      [v26 removeObject:GKAnonymousPlayerID];
      [v26 removeObject:GKUnknownPlayerID];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10002246C;
      v43[3] = &unk_10026C138;
      id v27 = (id)objc_claimAutoreleasedReturnValue([v26 allObjects]);
      id v44 = v27;
      v49 = buf;
      unsigned __int8 v53 = v25;
      v50 = v56;
      int v52 = a5;
      id v28 = v26;
      id v45 = v28;
      char v54 = v23;
      char v55 = v22;
      id v29 = v18;
      id v46 = v29;
      id v30 = v37;
      uint64_t v51 = v21;
      id v47 = v30;
      v48 = v24;
      [v29 performOnManagedObjectContext:v43];
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v24, "clientProxy"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 replyQueue]);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100022A74;
      v38[3] = &unk_10026C160;
      id v33 = v36;
      id v40 = v33;
      id v34 = v29;
      id v39 = v34;
      v41 = v56;
      v42 = buf;
      [v34 notifyOnQueue:v32 block:v38];

      _Block_object_dispose(v56, 8);
      _Block_object_dispose(buf, 8);

      return;
  }

- (void)loadProfilesForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  281LL,  "-[GKProfileService loadProfilesForPlayerIDs:pieces:context:handler:]"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v13,  v11,  v14));

  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  v40[3] = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v10));
  [v16 removeObject:GKAnonymousPlayerID];
  [v16 removeObject:GKUnknownPlayerID];
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _gkMapWithBlock:&stru_10026C1A0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyQueue]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100022E50;
  v31[3] = &unk_10026C2F8;
  id v20 = v17;
  id v32 = v20;
  id v21 = v11;
  id v33 = v21;
  id v22 = v16;
  id v34 = v22;
  unsigned __int8 v39 = a4;
  id v23 = v15;
  id v35 = v23;
  id v24 = v12;
  v36 = self;
  id v37 = v24;
  v38 = v40;
  [v23 performOnQueue:v19 block:v31];

  unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 replyQueue]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10002375C;
  v28[3] = &unk_10026C320;
  id v27 = v23;
  id v29 = v27;
  id v30 = v40;
  [v27 notifyOnQueue:v26 block:v28];

  _Block_object_dispose(v40, 8);
}

- (void)setOcelotStateForCurrentApp
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v2));

  objc_msgSend(v4, "setIsOcelot:", objc_msgSend(v3, "isArcadeApp"));
}

- (void)getOcelotStateForCurrentAppWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  (*((void (**)(id, id))a3 + 2))(v5, [v6 isOcelot]);
}

- (void)getProfilesForPlayerIDs:(id)a3 handler:(id)a4
{
}

- (void)getProfilesForPlayerIDs:(id)a3 discardingStaleData:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v9);
  }
  id v12 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKProfileService: getProfilesForPlayerIDs",  buf,  2u);
  }

  dispatch_queue_t v13 = dispatch_queue_create("com.apple.gamed.getProfiles.results", 0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v8 count]));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "primaryCredentialForEnvironment:conformsToMultiUserRestrictions:gameID:",  objc_msgSend(v16, "environment"),  0,  0));

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  426LL,  "-[GKProfileService getProfilesForPlayerIDs:discardingStaleData:handler:]"));
  v38 = v17;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 playerInternal]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playerID]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v18,  v20));

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100023E2C;
  v49[3] = &unk_10026C528;
  id v24 = v13;
  v50 = v24;
  id v25 = v14;
  id v51 = v25;
  id v26 = v21;
  id v52 = v26;
  id v27 = v8;
  id v53 = v27;
  char v54 = self;
  id v28 = v10;
  id v55 = v28;
  BOOL v56 = a4;
  [v26 performOnQueue:v23 block:v49];

  if (v28)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 bundleIdentifier]);

    if (v30)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 replyQueue]);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100024C1C;
      v45[3] = &unk_10026BEC8;
      v45[4] = self;
      id v46 = v27;
      id v47 = v30;
      id v48 = v26;
      [v48 performOnQueue:v33 block:v45];
    }

    else
    {
      id v34 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v35 = (id)GKOSLoggers(v31);
        id v34 = (os_log_s *)os_log_GKGeneral;
      }

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_10002D438();
      }
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 replyQueue]);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100024DE0;
    v39[3] = &unk_10026B0A8;
    id v40 = v26;
    v41 = v24;
    id v42 = v27;
    id v43 = v25;
    id v44 = v28;
    [v40 notifyOnQueue:v37 block:v39];
  }
}

- (void)getFriendSupportPageURLWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  550LL,  "-[GKProfileService getFriendSupportPageURLWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 storeBag]);

  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000251AC;
    v16[3] = &unk_10026B080;
    id v17 = v8;
    v18 = self;
    id v19 = v6;
    [v19 perform:v16];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 replyQueue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000253B0;
  v13[3] = &unk_10026B030;
  id v14 = v6;
  id v15 = v4;
  id v11 = v6;
  id v12 = v4;
  [v11 notifyOnQueue:v10 block:v13];
}

- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKProfileServicePrivate, "serviceFromService:", self));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000254E4;
  v13[3] = &unk_10026C5A0;
  id v14 = v8;
  id v12 = v8;
  [v11 loadScopedPlayerIDs:v10 gameBundleIDs:v9 handler:v13];
}

@end