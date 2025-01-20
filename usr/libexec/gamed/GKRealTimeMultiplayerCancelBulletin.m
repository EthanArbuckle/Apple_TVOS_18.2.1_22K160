@interface GKRealTimeMultiplayerCancelBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (id)removeAndReturnAssociatedInvite;
- (void)assembleBulletin;
- (void)copyDataFromAssociatedBulletin:(id)a3;
@end

@implementation GKRealTimeMultiplayerCancelBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRealTimeMultiplayerBulletin.m",  1043LL,  "+[GKRealTimeMultiplayerCancelBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10011C6E0;
  v10[3] = &unk_10026B310;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v7, v10);
}

- (void)copyDataFromAssociatedBulletin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerCancelBulletin copyDataFromAssociatedBulletin",  v12,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 originatorPlayer]);
  -[GKGameplayBulletin setOriginatorPlayer:](self, "setOriginatorPlayer:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 gameName]);
  -[GKBulletin setGameName:](self, "setGameName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 originatorPlayerID]);
  -[GKGameplayBulletin setOriginatorPlayerID:](self, "setOriginatorPlayerID:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 gameDescriptor]);
  -[GKBulletin setGameDescriptor:](self, "setGameDescriptor:", v11);
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
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerCancelBulletin assembleBulletin",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v5);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 404LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v6, v7));
  -[GKBulletin setTitle:](self, "setTitle:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayNameWithOptions:0]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE_ALIAS_1_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE_ALIAS_1_FORMAT"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v11,  v10));
    -[GKBulletin setMessage:](self, "setMessage:", v12);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE"));
    -[GKBulletin setMessage:](self, "setMessage:", v11);
  }
}

- (id)removeAndReturnAssociatedInvite
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerCancelBulletin removeAndReturnAssociatedInvite",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v6 = [v5 getBulletinsOfType:objc_opt_class(GKRealTimeMultiplayerInitiateBulletin)];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)v11),  (void)v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sessionToken]);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
        unsigned __int8 v15 = [v13 isEqualToData:v14];

        if ((v15 & 1) != 0)
        {
          [v5 withdrawBulletin:v12];
          goto LABEL_15;
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_15:

  return v12;
}

@end