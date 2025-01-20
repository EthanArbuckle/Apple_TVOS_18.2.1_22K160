@interface GKChallengeReceivedBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKChallengeReceivedBulletin)init;
- (unint64_t)launchEventType;
- (void)assembleBulletin;
- (void)handleAction:(id)a3;
- (void)handleDeclineAction;
- (void)notifyClient:(id)a3;
@end

@implementation GKChallengeReceivedBulletin

- (GKChallengeReceivedBulletin)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKChallengeReceivedBulletin;
  return -[GKChallengeBulletin init](&v3, "init");
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKChallengeReceivedBulletin loadBulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  [a1 expireChallengeList];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v11 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountChallengeReceived];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"di"]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _gkValuesForKeyPath:@"ci"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

  v15 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v12 count]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKChallengeService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v16,  0LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeBulletin.m",  504LL,  "+[GKChallengeReceivedBulletin loadBulletinsForPushNotification:withHandler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v18));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100121570;
  v29[3] = &unk_10026BB28;
  id v20 = v17;
  id v30 = v20;
  id v21 = v14;
  id v31 = v21;
  id v22 = v6;
  id v32 = v22;
  id v23 = v19;
  id v33 = v23;
  v24 = v15;
  v34 = v24;
  [v23 perform:v29];
  if (v8)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100121AD8;
    v26[3] = &unk_10026B030;
    id v28 = v8;
    v27 = v24;
    [v23 notifyOnQueue:v25 block:v26];
  }
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
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin notifyClient:", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  [v5 challengeReceived:v8];
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
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKChallengeReceivedBulletin assembleBulletin",  buf,  2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___GKChallengeReceivedBulletin;
  -[GKChallengeBulletin assembleBulletin](&v24, "assembleBulletin");
  v5 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 adamID]);
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_STORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CHALLENGE_RECEIVED_LAUNCH_STORE"));
    v11 = &GKNotificationCategoryActionsAppStoreDecline;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CHALLENGE_RECEIVED_LAUNCH_GAME"));
    v11 = &GKNotificationCategoryActionsLaunchGameDecline;
  }

  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
  v12 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CHALLENGE_RECEIVED_DECLINE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CHALLENGE_RECEIVED_DECLINE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setIsDestructive:](v12, "setIsDestructive:", 1LL);
  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_10027B720);
  v14 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CHALLENGE_RECEIVED_IGNORE"));
  -[GKBulletinAction setTitle:](v14, "setTitle:", v15);

  -[GKBulletinAction setInfo:](v14, "setInfo:", &stru_10027B720);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v12);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin originatorPlayer](self, "originatorPlayer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 displayNameWithOptions:0]);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 message]);

  if ([v19 length])
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_1_PLAYER_2_CUSTOM_MESSAGE_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_1_PLAYER_2_CUSTOM_MESSAGE_FORMAT"));
    id v21 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v20, v17, v19);
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_FORMAT"));
    id v21 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v20, v17, v23);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[GKBulletin setMessage:](self, "setMessage:", v22);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 801LL);
}

- (unint64_t)launchEventType
{
  return 0LL;
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKChallengeReceivedBulletin handleAction:",  buf,  2u);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKChallengeReceivedBulletin;
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

  else if ([v5 isEqualToString:@"GKDeclined"])
  {
    -[GKChallengeReceivedBulletin handleDeclineAction](self, "handleDeclineAction");
  }
}

- (void)handleDeclineAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  BOOL v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKChallengeReceivedBulletin handleDeclineAction",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v5);
  }
  id v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "challenge received handling decline action %@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKChallengeService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v11,  0LL));
    v14 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v12 abortChallenges:v13 handler:0];
  }
}

@end