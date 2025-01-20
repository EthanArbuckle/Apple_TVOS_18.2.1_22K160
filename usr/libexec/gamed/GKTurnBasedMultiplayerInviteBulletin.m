@interface GKTurnBasedMultiplayerInviteBulletin
+ (BOOL)shouldExpirePlayerList;
+ (BOOL)shouldLoadCacheList;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (void)assembleBulletin;
- (void)handleAcceptAction;
- (void)handleAction:(id)a3;
- (void)handleDeclineAction;
- (void)loadDataWithHandler:(id)a3;
@end

@implementation GKTurnBasedMultiplayerInviteBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedMultiplayerBulletin.m",  487LL,  "+[GKTurnBasedMultiplayerInviteBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100112DA0;
  v10[3] = &unk_10026B310;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v7, v10);
}

+ (BOOL)shouldLoadCacheList
{
  return 1;
}

+ (BOOL)shouldExpirePlayerList
{
  return 1;
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerInviteBulletin assembleBulletin",  buf,  2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 adamID]);
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings APP_STORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "APP_STORE"));
    id v11 = &GKNotificationCategoryActionsAppStoreDecline;
  }

  else
  {
    if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1) {
      goto LABEL_10;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "ACCEPT_INVITE_BUTTON_TITLE"));
    id v11 = &GKNotificationCategoryActionsAcceptDecline;
  }

  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
LABEL_10:
  id v12 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CLOSE_TURN_BASED_ALERT_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CLOSE_TURN_BASED_ALERT_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_10027B720);
  v14 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "DECLINE_INVITE_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v14, "setTitle:", v15);

  -[GKBulletinAction setInfo:](v14, "setInfo:", &stru_10027B720);
  -[GKBulletinAction setIsDestructive:](v14, "setIsDestructive:", 1LL);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( -[GKMultiplayerBulletin customInviteSoundPathForBundleID:]( self,  "customInviteSoundPathForBundleID:",  v17));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  if (!v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  2592000.0));
    -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v20);
  }

  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v21);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 200LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v22, v23));
  -[GKBulletin setTitle:](self, "setTitle:", v24);
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerInviteBulletin handleAction:",  buf,  2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerInviteBulletin;
  id v8 = -[GKTurnBasedMultiplayerBulletin handleAction:](&v12, "handleAction:", v5);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "bulletin handle multiplayer action: %@",  buf,  0xCu);
  }

  if (([v5 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v5 isEqualToString:@"GKDefault"])
  {
    -[GKTurnBasedMultiplayerInviteBulletin handleAcceptAction](self, "handleAcceptAction");
  }

  else if ([v5 isEqualToString:@"GKDeclined"])
  {
    -[GKTurnBasedMultiplayerInviteBulletin handleDeclineAction](self, "handleDeclineAction");
  }

  else if ([v5 isEqualToString:@"GKExpired"])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v11 expireBulletin:self];
  }
}

- (void)handleAcceptAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerInviteBulletin handleAcceptAction",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v5 reportEvent:GKReporterDomainTurnBased type:GKReporterTurnBasedAccept];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerInviteBulletin;
  -[GKTurnBasedMultiplayerBulletin acceptTurnBasedTurn](&v6, "acceptTurnBasedTurn");
}

- (void)handleDeclineAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerInviteBulletin handleDeclineAction",  v5,  2u);
  }

  -[GKTurnBasedMultiplayerBulletin declineTurnBasedInviteWithReason:](self, "declineTurnBasedInviteWithReason:", 1LL);
}

- (void)loadDataWithHandler:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerInviteBulletin loadDataWithHandler:",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedMultiplayerBulletin.m",  643LL,  "-[GKTurnBasedMultiplayerInviteBulletin loadDataWithHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100113D9C;
  v21[3] = &unk_10026B170;
  v21[4] = self;
  id v11 = v9;
  id v22 = v11;
  [v11 perform:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100113EF8;
  v19[3] = &unk_10026B170;
  v19[4] = self;
  id v12 = v11;
  id v20 = v12;
  [v12 perform:v19];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100114100;
  v16[3] = &unk_10026B030;
  id v17 = v12;
  id v18 = v5;
  id v14 = v12;
  id v15 = v5;
  [v14 notifyOnQueue:v13 block:v16];
}

@end