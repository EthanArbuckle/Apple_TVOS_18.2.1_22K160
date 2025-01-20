@interface GKRealTimeMultiplayerInitiateBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)isReconnect;
- (GKRealTimeMultiplayerInitiateBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerInitiateBulletin)initWithPushNotification:(id)a3;
- (void)assembleBulletin;
- (void)encodeWithCoder:(id)a3;
- (void)handleAcceptAction;
- (void)handleAction:(id)a3;
- (void)handleDeclineAction;
- (void)loadDataWithHandler:(id)a3;
- (void)parseClientData:(id)a3;
- (void)setIsReconnect:(BOOL)a3;
@end

@implementation GKRealTimeMultiplayerInitiateBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRealTimeMultiplayerBulletin.m",  300LL,  "+[GKRealTimeMultiplayerInitiateBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10011765C;
  v10[3] = &unk_10026B310;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v7, v10);
}

- (GKRealTimeMultiplayerInitiateBulletin)initWithPushNotification:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin initWithPushNotification:",  buf,  2u);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerInitiateBulletin;
  id v8 = -[GKRealTimeMultiplayerBulletin initWithPushNotification:](&v11, "initWithPushNotification:", v5);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKInviteIsReinvite]);
    v8->_isReconnect = [v9 BOOLValue];
  }

  return v8;
}

- (GKRealTimeMultiplayerInitiateBulletin)initWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin initWithCoder:",  buf,  2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerInitiateBulletin;
  id v8 = -[GKRealTimeMultiplayerBulletin initWithCoder:](&v12, "initWithCoder:", v5);
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"isReconnect"];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_isReconnect = [v10 BOOLValue];
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin encodeWithCoder:",  buf,  2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerInitiateBulletin;
  -[GKRealTimeMultiplayerBulletin encodeWithCoder:](&v9, "encodeWithCoder:", v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKRealTimeMultiplayerInitiateBulletin isReconnect](self, "isReconnect")));
  [v5 encodeObject:v8 forKey:@"isReconnect"];
}

- (void)parseClientData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v15[0] = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin parseClientData:",  (uint8_t *)v15,  2u);
  }

  if ((unint64_t)[v5 length] >= 2)
  {
    id v8 = v5;
    -[GKRealTimeMultiplayerBulletin setServerHosted:]( self,  "setServerHosted:",  *((unsigned __int8 *)[v8 bytes] + 1));
    objc_super v9 = (char *)[v8 length];
    unsigned __int8 v10 = -[GKRealTimeMultiplayerBulletin inviteVersionFromMessage:]( self,  "inviteVersionFromMessage:",  v8);
    if (!v10)
    {
      objc_super v11 = v9 - 2;
      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    objc_super v11 = v9 - 4;
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v10));
    -[GKRealTimeMultiplayerBulletin setInviteVersion:](self, "setInviteVersion:", v12);

    if (v11)
    {
LABEL_8:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 2, v11));
      v14 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v13, 4LL);
      -[GKBulletin setMessage:](self, "setMessage:", v14);
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
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin assembleBulletin:",  buf,  2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 adamID]);
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings APP_STORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "APP_STORE"));
    objc_super v11 = &GKNotificationCategoryActionsAppStoreDecline;
  }

  else
  {
    if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1) {
      goto LABEL_10;
    }
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "ACCEPT_INVITE_BUTTON_TITLE"));
    objc_super v11 = &GKNotificationCategoryActionsAcceptDecline;
  }

  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
LABEL_10:
  objc_super v12 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "DECLINE_INVITE_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_10027B720);
  -[GKBulletinAction setInAlertView:](v12, "setInAlertView:", 0LL);
  -[GKBulletinAction setIsDestructive:](v12, "setIsDestructive:", 1LL);
  v14 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "DECLINE_INVITE_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v14, "setTitle:", v15);

  -[GKBulletinAction setInfo:](v14, "setInfo:", &stru_10027B720);
  id v16 = -[GKBulletinAction setIsDestructive:](v14, "setIsDestructive:", 1LL);
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers(v16);
  }
  v18 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "assembleBulletin: - Bulletin Action Set", v32, 2u);
  }

  -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleIdentifier]);
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[GKRealTimeMultiplayerBulletin customInviteSoundPathForBundleID:]( self,  "customInviteSoundPathForBundleID:",  v20));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
  -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v22);

  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v12);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v23);

  id v24 = -[GKBulletin setBulletinType:](self, "setBulletinType:", 400LL);
  if (!os_log_GKGeneral) {
    id v25 = (id)GKOSLoggers(v24);
  }
  v26 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "assembleBulletin: - Bulletin Data Set", v31, 2u);
  }

  if (-[GKRealTimeMultiplayerInitiateBulletin isReconnect](self, "isReconnect")) {
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_RECONNECT_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_RECONNECT_NOTIFICATION_TITLE"));
  }
  else {
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  }
  v28 = (void *)v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v28, v29));
  -[GKBulletin setTitle:](self, "setTitle:", v30);
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin handleAction:",  buf,  2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerInitiateBulletin;
  id v8 = -[GKBulletin handleAction:](&v12, "handleAction:", v5);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  unsigned __int8 v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "bulletin handle multiplayer action: %@ bulletin: %@",  buf,  0x16u);
  }

  if (([v5 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v5 isEqualToString:@"GKDefault"])
  {
    -[GKRealTimeMultiplayerInitiateBulletin handleAcceptAction](self, "handleAcceptAction");
  }

  else if (([v5 isEqualToString:@"GKDeclined"] & 1) != 0 {
         || [v5 isEqualToString:@"GKDismissed"])
  }
  {
    -[GKRealTimeMultiplayerInitiateBulletin handleDeclineAction](self, "handleDeclineAction");
  }

  else if ([v5 isEqualToString:@"GKExpired"])
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
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
    LOWORD(v21) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin handleAcceptAction",  (uint8_t *)&v21,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 acceptedInviteManager]);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 1)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
    id v11 = [v10 integerValue];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    id v13 = [v12 maximumInviteVersionSupported];

    if (v11 <= v13)
    {
      [v9 addMultiplayerInvite:self];
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
      [v20 reportEvent:GKReporterDomainInvite type:GKReporterInviteAcceptUser];

      [v7 acceptMultiplayerGameInvite];
    }

    else
    {
      -[GKRealTimeMultiplayerBulletin declineInviteWithReason:](self, "declineInviteWithReason:", 5LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientNotification](self, "clientNotification"));
      [v7 declineInviteWithNotification:v14];

      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers(v15);
      }
      id v17 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
        int v21 = 138412290;
        v22 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Cannot handle an invite with invite version: (%@).",  (uint8_t *)&v21,  0xCu);
      }

      [v9 declineMultiplayerInvite:self];
    }
  }
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
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin handleDeclineAction",  v5,  2u);
  }

  -[GKRealTimeMultiplayerBulletin declineInviteWithReason:](self, "declineInviteWithReason:", 1LL);
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerInitiateBulletin loadDataWithHandler:",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRealTimeMultiplayerBulletin.m",  571LL,  "-[GKRealTimeMultiplayerInitiateBulletin loadDataWithHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100119304;
  v21[3] = &unk_10026B170;
  v21[4] = self;
  id v11 = v9;
  id v22 = v11;
  [v11 perform:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100119460;
  v19[3] = &unk_10026B170;
  v19[4] = self;
  id v12 = v11;
  id v20 = v12;
  [v12 perform:v19];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100119668;
  v16[3] = &unk_10026B030;
  id v17 = v12;
  id v18 = v5;
  id v14 = v12;
  id v15 = v5;
  [v14 notifyOnQueue:v13 block:v16];
}

- (BOOL)isReconnect
{
  return self->_isReconnect;
}

- (void)setIsReconnect:(BOOL)a3
{
  self->_isReconnect = a3;
}

@end