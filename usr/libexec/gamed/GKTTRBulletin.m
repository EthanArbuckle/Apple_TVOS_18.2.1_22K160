@interface GKTTRBulletin
+ (id)packFakeTTRBulletinWithInfo:(id)a3;
- (GKTTRBulletin)initWithPushNotification:(id)a3;
- (NSString)ttrURLString;
- (int64_t)ttrBulletinType;
- (void)assembleBulletin;
- (void)handleAction:(id)a3;
- (void)setTtrBulletinType:(int64_t)a3;
- (void)setTtrURLString:(id)a3;
@end

@implementation GKTTRBulletin

+ (id)packFakeTTRBulletinWithInfo:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKTTRBulletin: packFakeTTRBulletinWithInfo",  v14,  2u);
  }

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v8 = GKTTRBulletinKeyType;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKTTRBulletinKeyType]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, v8);

  uint64_t v10 = GKTTRBulletinKeyURL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKTTRBulletinKeyURL]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, v10);

  id v12 = -[NSMutableDictionary copy](v7, "copy");
  return v12;
}

- (GKTTRBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTTRBulletin: packFakeTTRBulletinWithInfo: %@",  buf,  0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKTTRBulletin;
  uint64_t v8 = -[GKBulletin initWithPushNotification:](&v14, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeySubtitle]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Internal Only] %@",  v9));
    -[GKBulletin setMessage:](v8, "setMessage:", v10);

    -[GKBulletin setTitle:](v8, "setTitle:", @"Game Center Tap-to-Radar");
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeyType]);
    -[GKTTRBulletin setTtrBulletinType:](v8, "setTtrBulletinType:", [v11 integerValue]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeyURL]);
    -[GKTTRBulletin setTtrURLString:](v8, "setTtrURLString:", v12);
  }

  return v8;
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTTRBulletin: assembleBulletin", v11, 2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKTTRBulletin ttrURLString](self, "ttrURLString"));
  -[GKBulletinAction setInfo:](v5, "setInfo:", v6);

  v7 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v7, "setType:", 0LL);
  -[GKBulletinAction setInfo:](v7, "setInfo:", &stru_10027B720);
  -[GKBulletinAction setInAlertView:](v7, "setInAlertView:", 0LL);
  -[GKBulletinAction setIsDestructive:](v7, "setIsDestructive:", 1LL);
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v8, "setType:", 0LL);
  -[GKBulletinAction setInfo:](v8, "setInfo:", &stru_10027B720);
  -[GKBulletinAction setIsDestructive:](v8, "setIsDestructive:", 1LL);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v7);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v8);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 7200.0));
  -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v10);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 2LL);
}

- (void)handleAction:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTTRBulletin: handleAction", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GKTTRBulletin;
  -[GKBulletin handleAction:](&v19, "handleAction:", v5);
  if (([v5 isEqualToString:@"GKAccepted"] & 1) != 0
    || (id v8 = [v5 isEqualToString:@"GKDefault"], (v8 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKTTRBulletin ttrURLString](self, "ttrURLString"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

    if (v10)
    {
      if (!os_log_GKGeneral) {
        id v12 = (id)GKOSLoggers(v11);
      }
      v13 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "TTRBulletin opening URL: %@", buf, 0xCu);
      }

      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___GKApplicationWorkspace,  "defaultWorkspace"));
      [v14 openURL:v10];
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers(v11);
      }
      v16 = (void *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000B8B60(v16, self);
      }
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers(v8);
    }
    v18 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Refused to upload sysdiagnose", buf, 2u);
    }
  }
}

- (int64_t)ttrBulletinType
{
  return self->_ttrBulletinType;
}

- (void)setTtrBulletinType:(int64_t)a3
{
  self->_ttrBulletinType = a3;
}

- (NSString)ttrURLString
{
  return self->_ttrURLString;
}

- (void)setTtrURLString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end