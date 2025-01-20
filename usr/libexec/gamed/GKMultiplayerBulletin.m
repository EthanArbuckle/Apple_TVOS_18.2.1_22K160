@interface GKMultiplayerBulletin
+ (BOOL)shouldProcessNotification;
- (GKMultiplayerBulletin)initWithPushNotification:(id)a3;
- (id)URLContext;
- (id)customInviteSoundPathForBundleID:(id)a3;
- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4;
- (void)setGameInviteMessage;
@end

@implementation GKMultiplayerBulletin

+ (BOOL)shouldProcessNotification
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(a1);
  }
  v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKMultiplayerBulletin shouldProcessNotification",  buf,  2u);
  }

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___GKMultiplayerBulletin;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  BOOL v6 = [v5 multiplayerAllowedPlayerType] != 0;

  return v6;
}

- (id)URLContext
{
  return GKContextInvite;
}

- (GKMultiplayerBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKMultiplayerBulletin initWithPushNotification:",  buf,  2u);
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___GKMultiplayerBulletin;
  objc_super v8 = -[GKBulletin initWithPushNotification:](&v21, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"g"]);
    -[GKGameplayBulletin setReceiverGuestPlayerID:](v8, "setReceiverGuestPlayerID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"i"]);
    -[GKGameplayBulletin setReceiverPlayerID:](v8, "setReceiverPlayerID:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"I"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
      -[GKGameplayBulletin setOriginatorPlayerID:](v8, "setOriginatorPlayerID:", v13);
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0) {
        -[GKGameplayBulletin setOriginatorPlayerID:](v8, "setOriginatorPlayerID:", v11);
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"G"]);
    -[GKGameplayBulletin setOriginatorGuestPlayerID:](v8, "setOriginatorGuestPlayerID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"d"]);
    v17 = -[GKGameDescriptor initWithPushDictionary:]( objc_alloc(&OBJC_CLASS___GKGameDescriptor),  "initWithPushDictionary:",  v16);
    -[GKBulletin setGameDescriptor:](v8, "setGameDescriptor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:GKInviteCompatibleVersionsKey]);
    -[GKGameplayBulletin setCompatibleVersions:](v8, "setCompatibleVersions:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:GKInviteCompatibleShortVersionsKey]);
    -[GKGameplayBulletin setCompatibleShortVersions:](v8, "setCompatibleShortVersions:", v19);
  }

  return v8;
}

- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (os_log_s *)os_log_GKTrace;
  BOOL v11 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKMultiplayerBulletin loadLocalizedGameNameForBundleID: handler:",  buf,  2u);
  }

  if (v8)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v12,  0LL));
    id v22 = v6;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10010DB34;
    v17[3] = &unk_10026C8B0;
    id v18 = v6;
    v19 = self;
    id v20 = v8;
    [v13 getGameMetadataForBundleIDs:v14 handler:v17];
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v15 = (id)GKOSLoggers(v11);
    }
    v16 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10010DFA8((uint64_t)v6, v16);
    }
  }
}

- (void)setGameInviteMessage
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "GKMultiplayerBulletin setGameInviteMessage original message:  %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 displayNameWithOptions:0]);

  if (![v9 length] || !objc_msgSend(v7, "length")) {
    -[GKBulletin setMessage:](self, "setMessage:", 0LL);
  }
  unsigned int v10 = -[GKGameplayBulletin gameLocation](self, "gameLocation");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  id v12 = [v11 length];
  if (v10 == 2)
  {
    if (v12) {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_STORE_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_STORE_FORMAT"));
    }
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_STORE_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_STORE_FORMAT"));
    }
  }

  else if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_FORMAT"));
  }

  else
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_FORMAT"));
  }

  uint64_t v14 = (void *)v13;

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v9, v15));
  -[GKBulletin setMessage:](self, "setMessage:", v16);

  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v17);
  }
  v19 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    id v20 = v19;
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
    *(_DWORD *)buf = 138412290;
    v23 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "GKMultiplayerBulletin setGameInviteMessage: %@",  buf,  0xCu);
  }
}

- (id)customInviteSoundPathForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKMultiplayerBulletin customInviteSoundPathForBundleID:",  v15,  2u);
  }

  uint64_t v7 = GKGetBundlePathForIdentifier(v4);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v8));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 _gkPathForInviteSound]);
  BOOL v11 = (void *)v10;
  id v12 = &stru_10027B720;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  uint64_t v13 = v12;

  return v13;
}

@end