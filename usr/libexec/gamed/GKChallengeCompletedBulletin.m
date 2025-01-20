@interface GKChallengeCompletedBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKChallengeCompletedBulletin)init;
- (unint64_t)launchEventType;
- (void)assembleBulletin;
- (void)handleAction:(id)a3;
- (void)notifyClient:(id)a3;
@end

@implementation GKChallengeCompletedBulletin

- (GKChallengeCompletedBulletin)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKChallengeCompletedBulletin;
  return -[GKChallengeBulletin init](&v3, "init");
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42 = v7;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v7);
  }
  v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKChallengeCompletedBulletin loadBulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  [a1 expireChallengeList];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v10 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountChallengeCompleted];

  v43 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"di"]);
  id v12 = [v11 count];
  v13 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v12);
  v41 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v12);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v44 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v12);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"ci"]);
        if (v20)
        {
          -[NSMutableArray addObject:](v44, "addObject:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"pl"]);
          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v21));
            if (!v22) {
              goto LABEL_15;
            }
          }

          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v23));

            if (!v22)
            {
LABEL_15:
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              if (v21)
              {
                -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v22, v21);
              }

              else
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
                -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v22, v24);
              }
            }
          }

          [v22 addObject:v20];
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }

    while (v16);
  }

  v25 = v14;

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeBulletin.m",  334LL,  "+[GKChallengeCompletedBulletin loadBulletinsForPushNotification:withHandler:]"));
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pushCredentialForEnvironment:", objc_msgSend(v40, "environment")));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 playerInternal]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 playerID]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v40 transactionGroupWithName:v26 forPlayerID:v30]);

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100120190;
  v51[3] = &unk_10026B608;
  v52 = v44;
  id v32 = v40;
  id v53 = v32;
  v33 = v44;
  [v31 performOnManagedObjectContext:v51];
  v34 = (void *)objc_claimAutoreleasedReturnValue([v32 replyQueue]);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100120524;
  v45[3] = &unk_10026B0A8;
  id v46 = v32;
  v47 = v13;
  id v48 = v43;
  v49 = v41;
  id v50 = v42;
  id v35 = v42;
  v36 = v41;
  id v37 = v43;
  v38 = v13;
  id v39 = v32;
  [v31 notifyOnQueue:v34 block:v45];
}

- (void)notifyClient:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKChallengeCompletedBulletin notifyClient:",  v9,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  [v5 challengeCompleted:v8];
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKChallengeCompletedBulletin assembleBulletin",  buf,  2u);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GKChallengeCompletedBulletin;
  -[GKChallengeBulletin assembleBulletin](&v18, "assembleBulletin");
  v5 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 adamID]);
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_STORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CHALLENGE_RECEIVED_LAUNCH_STORE"));
    v11 = &GKNotificationCategoryActionsAppStoreIgnore;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CHALLENGE_RECEIVED_LAUNCH_GAME"));
    v11 = &GKNotificationCategoryActionsLaunchGameIgnore;
  }

  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
  id v12 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CHALLENGE_RECEIVED_IGNORE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_10027B720);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_CHALLENGE_REMOTELY_COMPLETED_BANNER_OUT_OF_GAME_1_PLAYER_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_CHALLENGE_REMOTELY_COMPLETED_BANNER_OUT_OF_GAME_1_PLAYER_FORMAT"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin receiverPlayer](self, "receiverPlayer"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 displayNameWithOptions:0]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v14, v16));
  -[GKBulletin setMessage:](self, "setMessage:", v17);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 800LL);
}

- (unint64_t)launchEventType
{
  return 1LL;
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKChallengeCompletedBulletin handleAction:",  buf,  2u);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKChallengeCompletedBulletin;
  id v8 = -[GKBulletin handleAction:](&v11, "handleAction:", v5);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle challenge action: %@", buf, 0xCu);
  }

  if (([v5 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v5 isEqualToString:@"GKDefault"])
  {
    -[GKChallengeBulletin handleAcceptAction](self, "handleAcceptAction");
  }
}

@end