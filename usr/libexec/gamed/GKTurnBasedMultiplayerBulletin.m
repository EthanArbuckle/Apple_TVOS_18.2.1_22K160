@interface GKTurnBasedMultiplayerBulletin
+ (BOOL)displayNotification;
+ (BOOL)shouldExpirePlayerList;
+ (BOOL)shouldLoadCacheData;
+ (BOOL)shouldLoadCacheDetails;
+ (BOOL)shouldLoadCacheList;
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)userTapped;
- (GKTurnBasedMultiplayerBulletin)initWithCoder:(id)a3;
- (GKTurnBasedMultiplayerBulletin)initWithPushNotification:(id)a3;
- (NSDictionary)localizableMessage;
- (NSNumber)turnCount;
- (NSString)aggregateDictionaryKey;
- (NSString)exchangeID;
- (NSString)guestID;
- (NSString)matchID;
- (id)bulletinMessage;
- (id)description;
- (void)acceptTurnBasedTurn;
- (void)assembleBulletin;
- (void)declineTurnBasedInviteWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)expireAndLoadCaches;
- (void)handleAcceptAction;
- (void)handleAction:(id)a3;
- (void)invalidateTurnCache;
- (void)loadDataWithHandler:(id)a3;
- (void)removePreviousTurnBulletins;
- (void)saveTurnBasedEvent;
- (void)setExchangeID:(id)a3;
- (void)setGuestID:(id)a3;
- (void)setLocalizableMessage:(id)a3;
- (void)setMatchID:(id)a3;
- (void)setTurnCount:(id)a3;
- (void)setUserTapped:(BOOL)a3;
- (void)update;
- (void)updateBadgeCount;
@end

@implementation GKTurnBasedMultiplayerBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedMultiplayerBulletin.m",  46LL,  "+[GKTurnBasedMultiplayerBulletin loadBulletinsForPushNotification:withHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10010FC64;
  v11[3] = &unk_100271938;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v8, v11);
}

+ (BOOL)shouldLoadCacheData
{
  return 1;
}

+ (BOOL)shouldLoadCacheList
{
  return 0;
}

+ (BOOL)shouldLoadCacheDetails
{
  return 1;
}

+ (BOOL)shouldExpirePlayerList
{
  return 0;
}

+ (BOOL)displayNotification
{
  return 1;
}

- (void)update
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin update:", v5, 2u);
  }

  -[GKTurnBasedMultiplayerBulletin updateBadgeCount](self, "updateBadgeCount");
  -[GKTurnBasedMultiplayerBulletin expireAndLoadCaches](self, "expireAndLoadCaches");
}

- (GKTurnBasedMultiplayerBulletin)initWithPushNotification:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin initWithPushNotification:",  buf,  2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerBulletin;
  v8 = -[GKMultiplayerBulletin initWithPushNotification:](&v23, "initWithPushNotification:", v5);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned int v10 = [v9 shouldAllowCustomCommunication];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"m"]);
      -[GKBulletin setMessage:](v8, "setMessage:", v11);
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"s"]);
    matchID = v8->_matchID;
    v8->_matchID = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"lm"]);
    localizableMessage = v8->_localizableMessage;
    v8->_localizableMessage = (NSDictionary *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"x"]);
    exchangeID = v8->_exchangeID;
    v8->_exchangeID = (NSString *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"t"]);
    turnCount = v8->_turnCount;
    v8->_turnCount = (NSNumber *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"g"]);
    guestID = v8->_guestID;
    v8->_guestID = (NSString *)v20;
  }

  return v8;
}

- (GKTurnBasedMultiplayerBulletin)initWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin initWithCoder:",  buf,  2u);
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerBulletin;
  v8 = -[GKGameplayBulletin initWithCoder:](&v27, "initWithCoder:", v5);
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"matchID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    matchID = v8->_matchID;
    v8->_matchID = (NSString *)v10;

    id v12 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"turnCount"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    turnCount = v8->_turnCount;
    v8->_turnCount = (NSNumber *)v13;

    id v15 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"userTapped"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v8->_userTapped = [v16 BOOLValue];

    id v17 = [v5 decodeObjectOfClass:objc_opt_class(NSDictionary) forKey:@"localizableMessage"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    localizableMessage = v8->_localizableMessage;
    v8->_localizableMessage = (NSDictionary *)v18;

    id v20 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"exchangeID"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    exchangeID = v8->_exchangeID;
    v8->_exchangeID = (NSString *)v21;

    id v23 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"guestID"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    guestID = v8->_guestID;
    v8->_guestID = (NSString *)v24;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin encodeWithCoder:",  buf,  2u);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerBulletin;
  -[GKGameplayBulletin encodeWithCoder:](&v14, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
  [v5 encodeObject:v8 forKey:@"matchID"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin turnCount](self, "turnCount"));
  [v5 encodeObject:v9 forKey:@"turnCount"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKTurnBasedMultiplayerBulletin userTapped](self, "userTapped")));
  [v5 encodeObject:v10 forKey:@"userTapped"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin localizableMessage](self, "localizableMessage"));
  [v5 encodeObject:v11 forKey:@"localizableMessage"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin exchangeID](self, "exchangeID"));
  [v5 encodeObject:v12 forKey:@"exchangeID"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin guestID](self, "guestID"));
  [v5 encodeObject:v13 forKey:@"guestID"];
}

- (void)loadDataWithHandler:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin loadDataWithHandler:",  buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedMultiplayerBulletin.m",  200LL,  "-[GKTurnBasedMultiplayerBulletin loadDataWithHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100110CE4;
  v24[3] = &unk_10026B170;
  v24[4] = self;
  id v11 = v9;
  id v25 = v11;
  [v11 perform:v24];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));

  if (v12)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100110E40;
    v22[3] = &unk_10026B170;
    v22[4] = self;
    id v23 = v11;
    [v23 perform:v22];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));

  if (v13)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100110F70;
    v20[3] = &unk_10026B170;
    v20[4] = self;
    id v21 = v11;
    [v21 perform:v20];
  }

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100111270;
  v17[3] = &unk_10026B030;
  id v18 = v11;
  id v19 = v5;
  id v15 = v11;
  id v16 = v5;
  [v15 notifyOnQueue:v14 block:v17];
}

- (void)updateBadgeCount
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin updateBadgeCount",  v10,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin turnCount](self, "turnCount"));
  v8 = (void *)v7;
  if (v6 && v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](&OBJC_CLASS___GKBadgeController, "sharedController"));
    objc_msgSend(v9, "setBadgeCount:forBundleID:badgeType:", objc_msgSend(v8, "unsignedIntegerValue"), v6, 2);
  }
}

- (void)saveTurnBasedEvent
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin saveTurnBasedEvent",  v7,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 acceptedInviteManager]);

  [v6 addTurnBasedEvent:self];
}

- (void)invalidateTurnCache
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin invalidateTurnCache",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedMultiplayerBulletin.m",  279LL,  "-[GKTurnBasedMultiplayerBulletin invalidateTurnCache]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pushCredentialForEnvironment:", objc_msgSend(v7, "environment")));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerInternal]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionGroupWithName:v8 forPlayerID:v12]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100111668;
  v15[3] = &unk_10026B608;
  id v16 = v6;
  id v17 = self;
  id v14 = v6;
  [v13 performOnManagedObjectContext:v15];
}

- (void)acceptTurnBasedTurn
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin acceptTurnBasedTurn",  buf,  2u);
  }

  id v5 = -[GKTurnBasedMultiplayerBulletin invalidateTurnCache](self, "invalidateTurnCache");
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v5);
  }
  uint64_t v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Accept Turn Based Invite", v13, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 acceptedInviteManager]);

  [v9 addTurnBasedEvent:self];
  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 1)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v11));

    [v12 fetchTurnBasedData];
  }
}

- (void)declineTurnBasedInviteWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(self);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  BOOL v7 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v7)
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin declineTurnBasedInviteWithReason:",  v24,  2u);
  }

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v7);
  }
  id v9 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Decline Turn Based Invite", v24, 2u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin guestID](self, "guestID"));
  if (v10)
  {
    v27[0] = @"session-id";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
    v28[0] = v11;
    v27[1] = @"reason";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    v27[2] = @"guest-id";
    v28[1] = v12;
    v28[2] = v10;
    uint64_t v13 = v28;
    id v14 = v27;
    uint64_t v15 = 3LL;
  }

  else
  {
    v25[0] = @"session-id";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
    v25[1] = @"reason";
    v26[0] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    v26[1] = v12;
    uint64_t v13 = v26;
    id v14 = v25;
    uint64_t v15 = 2LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v14,  v15));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v16,  100LL,  0LL,  0LL));

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 storeBag]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pushCredentialForEnvironment:", objc_msgSend(v18, "environment")));
  [v20 writeDataForBagKey:@"gk-tb-decline" postData:v17 client:0 credential:v22 completion:0];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v23 reportEvent:GKReporterDomainTurnBased type:GKReporterTurnBasedDecline];
}

- (void)removePreviousTurnBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin removePreviousTurnBulletins",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v6 = [v5 getBulletinsOfType:objc_opt_class(GKTurnBasedMultiplayerTurnBulletin)];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)v11)]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 matchID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
        unsigned int v15 = [v13 isEqualToString:v14];

        if (v15) {
          [v5 withdrawBulletin:v12];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v9);
  }
}

- (id)bulletinMessage
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin bulletinMessage",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverGuestPlayerID](self, "receiverGuestPlayerID"));
  id v6 = [v5 length];

  if (v6) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_TURN_BASED_YOUR_GUESTS_TURN_NOTIFICATION_MESSAGE_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_TURN_BASED_YOUR_GUESTS_TURN_NOTIFICATION_MESSAGE_FORMAT"));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_TURN_BASED_YOUR_TURN_NOTIFICATION_MESSAGE_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_TURN_BASED_YOUR_TURN_NOTIFICATION_MESSAGE_FORMAT"));
  }
  id v8 = (void *)v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v8, v9));

  return v10;
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
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin assembleBulletin",  buf,  2u);
  }

  -[GKTurnBasedMultiplayerBulletin removePreviousTurnBulletins](self, "removePreviousTurnBulletins");
  id v5 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 adamID]);
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings APP_STORE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "APP_STORE"));
    id v11 = &GKNotificationCategoryActionsAppStoreClose;
  }

  else
  {
    if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1) {
      goto LABEL_10;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings PLAY_TURN_BASED_TURN_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "PLAY_TURN_BASED_TURN_BUTTON_TITLE"));
    id v11 = &GKNotificationCategoryActionsPlayClose;
  }

  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
LABEL_10:
  id v12 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings CLOSE_TURN_BASED_ALERT_BUTTON_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "CLOSE_TURN_BASED_ALERT_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_10027B720);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin localizableMessage](self, "localizableMessage"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _gkLocalizedMessageFromPushDictionary:forBundleID:]( &OBJC_CLASS___NSBundle,  "_gkLocalizedMessageFromPushDictionary:forBundleID:",  v14,  v16));

  if ([v17 length])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v18,  v19,  v17));
LABEL_14:

    goto LABEL_15;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  id v22 = [v21 length];

  if (v22)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v18,  v19,  v23));

    goto LABEL_14;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin bulletinMessage](self, "bulletinMessage"));
LABEL_15:
  -[GKBulletin setMessage:](self, "setMessage:", v20);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
  v26 = (void *)objc_claimAutoreleasedReturnValue( -[GKMultiplayerBulletin customInviteSoundPathForBundleID:]( self,  "customInviteSoundPathForBundleID:",  v25));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v26);

  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  if (!v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  2592000.0));
    -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v29);
  }

  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GENERAL_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GENERAL_NOTIFICATION_TITLE"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v30, v31));
  -[GKBulletin setTitle:](self, "setTitle:", v32);
}

- (void)expireAndLoadCaches
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin expireAndLoadCaches",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedMultiplayerBulletin.m",  410LL,  "-[GKTurnBasedMultiplayerBulletin expireAndLoadCaches]"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pushCredentialForEnvironment:", objc_msgSend(v7, "environment")));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerInternal]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 transactionGroupWithName:v9 forPlayerID:v13]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001125B4;
  v18[3] = &unk_10026C5C8;
  v18[4] = self;
  id v19 = v8;
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKTurnBasedService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v7,  0LL));
  id v21 = (id)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKTurnBasedService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v8,  0LL));
  id v15 = v21;
  id v16 = v20;
  id v17 = v8;
  [v14 performOnManagedObjectContext:v18];
  [v14 wait];
}

- (void)handleAcceptAction
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(self);
  }
  id v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin handleAcceptAction",  v4,  2u);
  }

- (void)handleAction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerBulletin handleAction:",  buf,  2u);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerBulletin;
  id v8 = -[GKBulletin handleAction:](&v11, "handleAction:", v5);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  uint64_t v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle turn based action: %@", buf, 0xCu);
  }

  if (([v5 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v5 isEqualToString:@"GKDefault"])
  {
    -[GKTurnBasedMultiplayerBulletin setUserTapped:](self, "setUserTapped:", 1LL);
    -[GKTurnBasedMultiplayerBulletin handleAcceptAction](self, "handleAcceptAction");
  }
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerBulletin;
  id v3 = -[GKBulletin description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](self, "matchID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@"\nmatchID:%@\n", v5]);

  return v6;
}

- (NSString)matchID
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setMatchID:(id)a3
{
}

- (NSNumber)turnCount
{
  return (NSNumber *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setTurnCount:(id)a3
{
}

- (BOOL)userTapped
{
  return self->_userTapped;
}

- (void)setUserTapped:(BOOL)a3
{
  self->_userTapped = a3;
}

- (NSDictionary)localizableMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setLocalizableMessage:(id)a3
{
}

- (NSString)exchangeID
{
  return (NSString *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setExchangeID:(id)a3
{
}

- (NSString)guestID
{
  return (NSString *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setGuestID:(id)a3
{
}

- (NSString)aggregateDictionaryKey
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void).cxx_destruct
{
}

@end