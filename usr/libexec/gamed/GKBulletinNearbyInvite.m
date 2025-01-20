@interface GKBulletinNearbyInvite
- (GKBulletinNearbyInvite)initWithPlayer:(id)a3 localizedGameName:(id)a4 inviteDictionary:(id)a5;
- (NSDictionary)inviteDictionary;
- (void)handleAction:(id)a3;
- (void)setInviteDictionary:(id)a3;
@end

@implementation GKBulletinNearbyInvite

- (GKBulletinNearbyInvite)initWithPlayer:(id)a3 localizedGameName:(id)a4 inviteDictionary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v11 reportEvent:GKReporterDomainInviteInitiateType type:GKNearbyInviteInitiate];

  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v12);
  }
  v14 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "GKBulletinNearbyInvite: initWithPlayer: localizedGameName: inviteDictionary",  buf,  2u);
  }

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___GKBulletinNearbyInvite;
  v15 = -[GKMultiplayerBulletin initWithPushNotification:](&v39, "initWithPushNotification:", &__NSDictionary0__struct);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"adamID"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"bundleID"]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"inviteMessage"]);
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v8 displayNameWithOptions:0]);
    -[GKBulletin setMessage:](v15, "setMessage:", v18);
    -[GKBulletin setGameName:](v15, "setGameName:", v9);
    -[GKGameplayBulletin setOriginatorPlayer:](v15, "setOriginatorPlayer:", v8);
    -[GKMultiplayerBulletin setGameInviteMessage](v15, "setGameInviteMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](v15, "message"));

    if (v19)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings GAME_INVITE_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "GAME_INVITE_NOTIFICATION_TITLE"));
      v37 = v18;
      v21 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[GKBulletin setDate:](v15, "setDate:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  600.0));
      -[GKBulletin setExpirationDate:](v15, "setExpirationDate:", v23);

      -[GKBulletin setHasSound:](v15, "setHasSound:", 1LL);
      v24 = (void *)objc_claimAutoreleasedReturnValue( -[GKMultiplayerBulletin customInviteSoundPathForBundleID:]( v15,  "customInviteSoundPathForBundleID:",  v17));
      -[GKBulletin setSoundPath:](v15, "setSoundPath:", v24);

      -[GKBulletin setTitle:](v15, "setTitle:", v36);
      objc_storeStrong((id *)&v15->_inviteDictionary, a5);
      v25 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
      -[GKBulletinAction setType:](v25, "setType:", 1LL);
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "ACCEPT_INVITE_BUTTON_TITLE"));
      -[GKBulletinAction setTitle:](v25, "setTitle:", v26);

      -[GKBulletinAction setAdamID:](v25, "setAdamID:", v16);
      -[GKBulletinAction setBundleID:](v25, "setBundleID:", v17);
      v27 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
      -[GKBulletinAction setType:](v27, "setType:", 0LL);
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "DECLINE_INVITE_BUTTON_TITLE"));
      -[GKBulletinAction setTitle:](v27, "setTitle:", v28);

      v16 = v21;
      v18 = v37;
      -[GKBulletinAction setInfo:](v27, "setInfo:", &stru_10027B720);
      -[GKBulletin setCategoryIdentifier:]( v15,  "setCategoryIdentifier:",  @"GKNotificationCategoryActionsAcceptDecline");
      -[GKBulletin setDefaultAction:](v15, "setDefaultAction:", v25);
      -[GKBulletin setDeclineAction:](v15, "setDeclineAction:", v27);
      -[GKBulletin setBulletinType:](v15, "setBulletinType:", 600LL);

      v29 = (void *)v38;
    }

    else
    {
      v30 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v31 = (id)GKOSLoggers(v20);
        v30 = (os_log_s *)os_log_GKGeneral;
      }

      BOOL v32 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      v29 = (void *)v38;
      if (v32) {
        sub_1001246B8(v30);
      }
      v33 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v34 = (id)GKOSLoggers(v32);
        v33 = (os_log_s *)os_log_GKGeneral;
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        uint64_t v41 = v38;
        __int16 v42 = 2112;
        id v43 = v9;
        __int16 v44 = 2112;
        v45 = v18;
        __int16 v46 = 2112;
        id v47 = v10;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "no message in nearby invite -- displayName:%@ gameName:%@ message:%@ from dict:%@",  buf,  0x2Au);
      }
    }
  }

  return v15;
}

- (void)handleAction:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinNearbyInvite: handleAction:", buf, 2u);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GKBulletinNearbyInvite;
  id v8 = -[GKBulletin handleAction:](&v18, "handleAction:", v5);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  id v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "bulletin handle nearby invite action: %@",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinNearbyInvite inviteDictionary](self, "inviteDictionary"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"bundleID"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v12));
  if (v13)
  {
    else {
      uint64_t v14 = (uint64_t)[v5 isEqualToString:@"GKDefault"];
    }
    id v15 = [v11 mutableCopy];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
    [v15 setObject:v16 forKey:@"accepted"];

    if ((v14 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
      [v15 setObject:v17 forKey:@"declineReason"];
    }

    [v13 respondedToNearbyInvite:v15];
  }
}

- (NSDictionary)inviteDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setInviteDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end