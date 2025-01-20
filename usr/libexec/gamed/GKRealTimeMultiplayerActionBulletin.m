@interface GKRealTimeMultiplayerActionBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)isAccept;
- (NSString)aggregateDictionaryKey;
- (NSString)debugLine;
- (NSString)notificationName;
- (id)getDebugLine;
- (id)getNotificationName;
- (void)assembleBulletin;
- (void)loadDataWithHandler:(id)a3;
- (void)setInvitedPlayerRespondedWithCompletionHandler:(id)a3;
@end

@implementation GKRealTimeMultiplayerActionBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRealTimeMultiplayerBulletin.m",  625LL,  "+[GKRealTimeMultiplayerActionBulletin loadBulletinsForPushNotification:withHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001197E0;
  v11[3] = &unk_100271938;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v8, v11);
}

- (void)loadDataWithHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerActionBulletin loadDataWithHandler",  buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRealTimeMultiplayerBulletin.m",  663LL,  "-[GKRealTimeMultiplayerActionBulletin loadDataWithHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy clientForInviteSessionToken:]( &OBJC_CLASS___GKClientProxy,  "clientForInviteSessionToken:",  v11));

  if (!v12)
  {
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers(v13);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_10011E0E4();
      if (!v5) {
        goto LABEL_12;
      }
    }

    else if (!v5)
    {
      goto LABEL_12;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"GKMultiplayerInvite",  0LL,  0LL));
    ((void (**)(void, void *))v5)[2](v5, v20);

    goto LABEL_12;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  [v15 setBundleIdentifier:v14];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10011A0B0;
  v26[3] = &unk_10026B170;
  v26[4] = self;
  id v16 = v9;
  id v27 = v16;
  [v16 perform:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10011A20C;
  v24[3] = &unk_10026B170;
  v24[4] = self;
  id v17 = v16;
  id v25 = v17;
  [v17 perform:v24];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10011A334;
  v21[3] = &unk_10026B030;
  v23 = v5;
  id v22 = v17;
  [v22 notifyOnQueue:v18 block:v21];

LABEL_12:
}

- (void)setInvitedPlayerRespondedWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers(v5);
  }
  v8 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerActionBulletin: setInvitedPlayerRespondedWithCompletionHandler",  buf,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy clientForInviteSessionToken:]( &OBJC_CLASS___GKClientProxy,  "clientForInviteSessionToken:",  v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRealTimeMultiplayerBulletin.m",  711LL,  "-[GKRealTimeMultiplayerActionBulletin setInvitedPlayerRespondedWithCompletionHandler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10011A570;
  v18[3] = &unk_100273400;
  id v13 = v10;
  id v19 = v13;
  v20 = self;
  id v14 = v12;
  id v21 = v14;
  SEL v22 = a2;
  [v14 perform:v18];
  if (v6)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10011B428;
    v15[3] = &unk_10026B030;
    id v17 = v6;
    id v16 = v14;
    [v16 notifyOnMainQueueWithBlock:v15];
  }
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerActionBulletin: assembleBulletin",  v10,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy clientForInviteSessionToken:]( &OBJC_CLASS___GKClientProxy,  "clientForInviteSessionToken:",  v5));

  -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[GKRealTimeMultiplayerBulletin customInviteSoundPathForBundleID:]( self,  "customInviteSoundPathForBundleID:",  v7));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v9);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 401LL);
}

- (NSString)aggregateDictionaryKey
{
  return 0LL;
}

- (id)getDebugLine
{
  return 0LL;
}

- (id)getNotificationName
{
  return 0LL;
}

- (BOOL)isAccept
{
  return 0;
}

- (NSString)debugLine
{
  return (NSString *)objc_getProperty(self, a2, 368LL, 1);
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 376LL, 1);
}

- (void).cxx_destruct
{
}

@end