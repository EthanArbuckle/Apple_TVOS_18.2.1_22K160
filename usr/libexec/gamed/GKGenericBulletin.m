@interface GKGenericBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (void)assembleBulletinFromPushNotification:(id)a3;
@end

@implementation GKGenericBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKGenericBulletin loadBulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v11 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountTurnBased];

  v12 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  id v13 = [objc_alloc((Class)a1) initWithPushNotification:v6];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"i"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  if (v14)
  {
    id v21 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pushCredentialForEnvironment:", objc_msgSend(v15, "environment")));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 playerInternal]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playerID]);
    unsigned int v20 = [v19 isEqualToString:v14];

    id v6 = v21;
    if (v20)
    {
      [v13 assembleBulletinFromPushNotification:v21];
      -[NSMutableArray addObject:](v12, "addObject:", v13);
    }
  }

  if (v8) {
    ((void (**)(void, NSMutableArray *))v8)[2](v8, v12);
  }
}

- (void)assembleBulletinFromPushNotification:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKGenericBulletin assembleBulletinFromPushNotification:",  buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"b"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"u"]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"t"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"m"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"n"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"y"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"o"]);
  v14 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 1LL);
  -[GKBulletinAction setTitle:](v14, "setTitle:", v12);
  if (v9) {
    v15 = v9;
  }
  else {
    v15 = v8;
  }
  -[GKBulletinAction setInfo:](v14, "setInfo:", v15);
  if ([v13 integerValue] == (id)2)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
    -[GKBulletinAction setType:](v16, "setType:", 0LL);
    -[GKBulletinAction setTitle:](v16, "setTitle:", v11);
    -[GKBulletinAction setInfo:](v16, "setInfo:", &stru_10027B720);
    -[GKBulletin setDismissAction:](self, "setDismissAction:", v16);
  }

  -[GKBulletin setMessage:](self, "setMessage:", v10);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
  -[GKBulletin setSoundPath:](self, "setSoundPath:", 0LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v17);

  -[GKBulletin setTitle:](self, "setTitle:", v18);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v14);
  -[GKBulletin setBulletinType:](self, "setBulletinType:", 1LL);
}

@end