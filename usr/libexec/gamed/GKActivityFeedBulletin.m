@interface GKActivityFeedBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)isMalformed;
- (GKActivityFeedBulletin)initWithCoder:(id)a3;
- (GKActivityFeedBulletin)initWithPushNotification:(id)a3;
- (NSDictionary)relationships;
- (NSNumber)getRelationshipGameAdamId;
- (NSString)bodyFromPush;
- (NSString)contactHandle;
- (NSString)getRelationshipGameBundleId;
- (NSString)getRelationshipGameImage;
- (NSString)getRelationshipGameName;
- (NSString)getRelationshipLeaderboardIdentifier;
- (NSString)getRelationshipLeaderboardName;
- (NSString)getRelationshipPlayerId;
- (NSString)getRelationshipPlayerImage;
- (NSString)getRelationshipPlayerName;
- (NSString)subtitleFromPush;
- (NSString)titleFromPush;
- (int64_t)activityFeedAction;
- (void)assembleBulletin;
- (void)encodeWithCoder:(id)a3;
- (void)handleAction:(id)a3;
- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4;
- (void)setActivityFeedAction:(int64_t)a3;
- (void)setBodyFromPush:(id)a3;
- (void)setContactHandle:(id)a3;
- (void)setIsMalformed:(BOOL)a3;
- (void)setRelationships:(id)a3;
- (void)setSubtitleFromPush:(id)a3;
- (void)setTitleFromPush:(id)a3;
@end

@implementation GKActivityFeedBulletin

- (GKActivityFeedBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKActivityFeedBulletin initWithPushNotification:",  buf,  2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GKActivityFeedBulletin;
  v8 = -[GKBulletin initWithPushNotification:](&v17, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"action"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([&off_1002885C0 objectForKeyedSubscript:v9]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([&off_1002885C0 objectForKeyedSubscript:v9]);
      -[GKActivityFeedBulletin setActivityFeedAction:](v8, "setActivityFeedAction:", [v11 integerValue]);
    }

    else
    {
      -[GKActivityFeedBulletin setActivityFeedAction:](v8, "setActivityFeedAction:", -1LL);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"title"]);
    -[GKActivityFeedBulletin setTitleFromPush:](v8, "setTitleFromPush:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"body"]);
    -[GKActivityFeedBulletin setBodyFromPush:](v8, "setBodyFromPush:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"subtitle"]);
    -[GKActivityFeedBulletin setSubtitleFromPush:](v8, "setSubtitleFromPush:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"relationships"]);
    -[GKActivityFeedBulletin setRelationships:](v8, "setRelationships:", v15);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKActivityFeedBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___GKActivityFeedBulletin;
  v5 = -[GKGameplayBulletin initWithCoder:](&v22, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"action"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[GKActivityFeedBulletin setActivityFeedAction:](v5, "setActivityFeedAction:", [v7 integerValue]);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"titleFromPush"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[GKActivityFeedBulletin setTitleFromPush:](v5, "setTitleFromPush:", v9);

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bodyFromPush"];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[GKActivityFeedBulletin setBodyFromPush:](v5, "setBodyFromPush:", v11);

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"subtitleFromPush"];
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[GKActivityFeedBulletin setSubtitleFromPush:](v5, "setSubtitleFromPush:", v13);

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
    v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v15,  objc_opt_class(&OBJC_CLASS___NSDictionary),  0LL);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"relationships"]);
    -[GKActivityFeedBulletin setRelationships:](v5, "setRelationships:", v18);

    id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"isMalformed"];
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[GKActivityFeedBulletin setIsMalformed:](v5, "setIsMalformed:", [v20 BOOLValue]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKActivityFeedBulletin;
  id v4 = a3;
  -[GKGameplayBulletin encodeWithCoder:](&v11, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKActivityFeedBulletin activityFeedAction]( self,  "activityFeedAction",  v11.receiver,  v11.super_class)));
  [v4 encodeObject:v5 forKey:@"bulletinAction"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin titleFromPush](self, "titleFromPush"));
  [v4 encodeObject:v6 forKey:@"titleFromPush"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin bodyFromPush](self, "bodyFromPush"));
  [v4 encodeObject:v7 forKey:@"bodyFromPush"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin subtitleFromPush](self, "subtitleFromPush"));
  [v4 encodeObject:v8 forKey:@"subtitleFromPush"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  [v4 encodeObject:v9 forKey:@"relationships"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKActivityFeedBulletin isMalformed](self, "isMalformed")));
  [v4 encodeObject:v10 forKey:@"isMalformed"];
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  v9 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKActivityFeedBulletin loadBulletinsForPushNotification:",  buf,  2u);
  }

  id v10 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKActivityFeedBulletin.m",  133LL,  "+[GKActivityFeedBulletin loadBulletinsForPushNotification:withHandler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v12));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100122C7C;
  v21[3] = &unk_10026B080;
  uint64_t v14 =  -[GKActivityFeedBulletin initWithPushNotification:]( objc_alloc(&OBJC_CLASS___GKActivityFeedBulletin),  "initWithPushNotification:",  v5);
  objc_super v22 = v14;
  uint64_t v15 = v10;
  v23 = v15;
  id v16 = v11;
  id v24 = v16;
  [v13 perform:v21];
  if (v7)
  {
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100123064;
    v18[3] = &unk_10026B030;
    id v20 = v7;
    id v19 = v15;
    [v13 notifyOnQueue:v17 block:v18];
  }
}

- (NSString)getRelationshipGameBundleId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"game"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"id"]);

  return (NSString *)v4;
}

- (NSString)getRelationshipGameImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"game"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"image"]);

  return (NSString *)v4;
}

- (NSNumber)getRelationshipGameAdamId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"game"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"adamId"]);

  return (NSNumber *)v4;
}

- (NSString)getRelationshipGameName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"game"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"name"]);

  return (NSString *)v4;
}

- (NSString)getRelationshipLeaderboardIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"leaderboard"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"id"]);

  return (NSString *)v4;
}

- (NSString)getRelationshipLeaderboardName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"leaderboard"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"name"]);

  return (NSString *)v4;
}

- (NSString)getRelationshipPlayerId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"player"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"id"]);

  return (NSString *)v4;
}

- (NSString)getRelationshipPlayerName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"player"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"name"]);

  return (NSString *)v4;
}

- (NSString)getRelationshipPlayerImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"player"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"avatarUrl"]);

  return (NSString *)v4;
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKActivityFeedBulletin assembleBulletin",  (uint8_t *)&v18,  2u);
  }

  if (-[GKActivityFeedBulletin activityFeedAction](self, "activityFeedAction"))
  {
    BOOL v5 = 1LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipGameBundleId](self, "getRelationshipGameBundleId"));
    BOOL v5 = v6 == 0LL;
    if (v6)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
      -[GKBulletinAction setType:](v7, "setType:", 0LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings BULLETIN_VIEW]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "BULLETIN_VIEW"));
      -[GKBulletinAction setTitle:](v7, "setTitle:", v8);

      -[GKBulletinAction setInfo:](v7, "setInfo:", v6);
      -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v7);
    }
  }

  -[GKActivityFeedBulletin setIsMalformed:](self, "setIsMalformed:", v5);
  BOOL v9 = -[GKActivityFeedBulletin isMalformed](self, "isMalformed");
  if (!v9)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
    -[GKBulletinAction setType:](v12, "setType:", 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings BULLETIN_IGNORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "BULLETIN_IGNORE"));
    -[GKBulletinAction setTitle:](v12, "setTitle:", v14);

    -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_10027B720);
    -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
    -[GKActivityFeedBulletin setContactHandle:](self, "setContactHandle:", 0LL);
    -[GKBulletin setCategoryIdentifier:]( self,  "setCategoryIdentifier:",  @"GKNotificationCategoryActionsViewIgnore");
    -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
    -[GKBulletin setSoundPath:](self, "setSoundPath:", 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin titleFromPush](self, "titleFromPush"));
    -[GKBulletin setTitle:](self, "setTitle:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin bodyFromPush](self, "bodyFromPush"));
    -[GKBulletin setMessage:](self, "setMessage:", v16);

    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[GKBulletin setDate:](self, "setDate:", v17);

    -[GKBulletin setBulletinType:](self, "setBulletinType:", 1000LL);
    goto LABEL_16;
  }

  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers(v9);
  }
  objc_super v11 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin relationships](self, "relationships"));
    int v18 = 138412290;
    id v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_INFO,  "GKActivityFeedBulletin assembleBulletin, malformed bulletin with relationships: %@",  (uint8_t *)&v18,  0xCu);

LABEL_16:
  }

- (void)handleAction:(id)a3
{
  id v4 = a3;
  id v12 = @"pageDetails";
  id v10 = @"activityFeedAction";
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKActivityFeedBulletin activityFeedAction](self, "activityFeedAction")));
  objc_super v11 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  id v8 = [v7 mutableCopy];

  if (([v4 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v4 isEqualToString:@"GKDefault"])
  {
    -[GKActivityFeedBulletin activityFeedAction](self, "activityFeedAction");
  }

  else if (([v4 isEqualToString:@"GKDeclined"] & 1) == 0 {
         && ([v4 isEqualToString:@"GKDismissed"] & 1) == 0
  }
         && [v4 isEqualToString:@"GKExpired"])
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
    [v9 expireBulletin:self];
  }

  -[GKActivityFeedBulletin reportMetricsForActionID:withAdditionalFields:]( self,  "reportMetricsForActionID:withAdditionalFields:",  v4,  v8);
}

- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4
{
  id v6 = a3;
  if (a4) {
    v7 = (NSMutableDictionary *)[a4 mutableCopy];
  }
  else {
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  id v8 = v7;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v9,  0LL));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKActivityFeedBulletin getRelationshipGameBundleId](self, "getRelationshipGameBundleId"));
  id v19 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001239F0;
  v15[3] = &unk_100273540;
  id v16 = v8;
  id v17 = v6;
  int v18 = self;
  id v13 = v6;
  uint64_t v14 = v8;
  [v10 getGameMetadataForBundleIDs:v12 handler:v15];
}

- (int64_t)activityFeedAction
{
  return self->_activityFeedAction;
}

- (void)setActivityFeedAction:(int64_t)a3
{
  self->_activityFeedAction = a3;
}

- (NSString)titleFromPush
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setTitleFromPush:(id)a3
{
}

- (NSString)bodyFromPush
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setBodyFromPush:(id)a3
{
}

- (NSString)subtitleFromPush
{
  return (NSString *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setSubtitleFromPush:(id)a3
{
}

- (NSDictionary)relationships
{
  return (NSDictionary *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setRelationships:(id)a3
{
}

- (NSString)contactHandle
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setContactHandle:(id)a3
{
}

- (BOOL)isMalformed
{
  return self->_isMalformed;
}

- (void)setIsMalformed:(BOOL)a3
{
  self->_isMalformed = a3;
}

- (void).cxx_destruct
{
}

@end