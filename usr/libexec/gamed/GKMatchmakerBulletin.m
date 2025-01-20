@interface GKMatchmakerBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (NSString)matchID;
- (void)executeBulletinWithBulletinController:(id)a3;
- (void)setMatchID:(id)a3;
@end

@implementation GKMatchmakerBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  v9 = (os_log_s *)os_log_GKTrace;
  BOOL v10 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v10)
  {
    LOWORD(v19) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKMatchmakerBulletin loadBulletinsForPushNotification: withHandler:",  (uint8_t *)&v19,  2u);
  }

  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v10);
  }
  v12 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "didReceiveMatchmakingPush: %@",  (uint8_t *)&v19,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v13 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountMatchmaking];

  v14 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:GKMatchmakerMatchRID]);
  if (v15)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___GKMatchmakerBulletin);
    -[GKMatchmakerBulletin setMatchID:](v16, "setMatchID:", v15);
    -[GKBulletin setBulletinType:](v16, "setBulletinType:", 1200LL);
    -[NSMutableArray addObject:](v14, "addObject:", v16);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers(0LL);
    }
    v18 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "GKMatchmakerBulletin - matchmaking push missing match-rid, did not create bulletin.",  (uint8_t *)&v19,  2u);
    }
  }

  if (v7) {
    ((void (**)(void, NSMutableArray *))v7)[2](v7, v14);
  }
}

- (void)executeBulletinWithBulletinController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKMatchmakerBulletin executeBulletinWithBulletinController:",  buf,  2u);
  }

  *(void *)buf = 0LL;
  v14 = buf;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001097C4;
  v12[3] = &unk_10026B2C8;
  v12[4] = self;
  v12[5] = buf;
  id v8 = +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v12);
  if (!v14[24])
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(v8);
    }
    BOOL v10 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerBulletin matchID](self, "matchID"));
      *(_DWORD *)id v17 = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "matchmaking push:%@ for unknown rid", v17, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end