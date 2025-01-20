@interface GKChallengeBulletin
+ (BOOL)supportsSecureCoding;
+ (void)expireChallengeList;
- (BOOL)isAppRunning;
- (BOOL)supportsChallenges;
- (GKChallengeBulletin)init;
- (GKChallengeBulletin)initWithCoder:(id)a3;
- (GKChallengeInternal)challenge;
- (NSString)challengeID;
- (id)URLContext;
- (id)customChallengeSoundPathForBundleID:(id)a3;
- (id)gameDescriptor;
- (id)gameName;
- (id)originatorPlayer;
- (id)originatorPlayerID;
- (id)receiverPlayer;
- (id)receiverPlayerID;
- (unint64_t)launchEventType;
- (void)assembleBulletin;
- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleAcceptAction;
- (void)notifyApp;
- (void)notifyClient:(id)a3;
- (void)refreshData;
- (void)setChallenge:(id)a3;
- (void)setChallengeID:(id)a3;
- (void)setGameName:(id)a3;
- (void)setOriginatorPlayer:(id)a3;
- (void)setOriginatorPlayerID:(id)a3;
- (void)setReceiverPlayer:(id)a3;
- (void)setReceiverPlayerID:(id)a3;
@end

@implementation GKChallengeBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKChallengeBulletin)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKChallengeBulletin;
  return -[GKChallengeBulletin init](&v3, "init");
}

- (GKChallengeBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GKChallengeBulletin;
  v5 = -[GKGameplayBulletin initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(GKChallengeInternal) forKey:@"challenge"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    challenge = v5->_challenge;
    v5->_challenge = (GKChallengeInternal *)v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKChallengeBulletin;
  id v4 = a3;
  -[GKGameplayBulletin encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"challenge"];
}

- (id)URLContext
{
  return GKContextChallenge;
}

+ (void)expireChallengeList
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(a1);
  }
  objc_super v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKChallengeBulletin expireChallengeList", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeBulletin.m",  91LL,  "+[GKChallengeBulletin expireChallengeList]"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pushCredentialForEnvironment:", objc_msgSend(v4, "environment")));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerInternal]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerID]);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionGroupWithName:v5 forPlayerID:v9]);

  [v10 performOnManagedObjectContext:&stru_100273478];
}

- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKChallengeBulletin - determineGameLocationOnDeviceOrInStoreWithCompletionHandler:",  buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeBulletin.m",  104LL,  "-[GKChallengeBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 compatibleBundleIDs]);

  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationProxyForBundleID:v17]);
        if ([v18 isInstalled]
          && ([v18 isRestricted] & 1) == 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
          [v19 setBundleIdentifier:v17];

          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleVersion]);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
          [v21 setBundleVersion:v20];

          v22 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleShortVersion]);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
          [v23 setShortBundleVersion:v22];

          -[GKGameplayBulletin setGameLocation:](self, "setGameLocation:", 1LL);
          goto LABEL_16;
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

- (id)gameDescriptor
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin gameDescriptor", buf, 2u);
  }

  gameDescriptor = self->super.super._gameDescriptor;
  if (!gameDescriptor)
  {
    if (self->_challenge)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v18 game]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleVersion]);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 game]);
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 shortBundleVersion]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 game]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 adamID]);
      id v14 = (GKGameDescriptor *)objc_claimAutoreleasedReturnValue( +[GKGameDescriptor gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:]( &OBJC_CLASS___GKGameDescriptor,  "gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:",  v6,  v7,  v10,  v13));
      uint64_t v15 = self->super.super._gameDescriptor;
      self->super.super._gameDescriptor = v14;

      return self->super.super._gameDescriptor;
    }

    gameDescriptor = 0LL;
  }

  return gameDescriptor;
}

- (id)receiverPlayerID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 receivingPlayer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerID]);

  return v4;
}

- (void)setReceiverPlayerID:(id)a3
{
  id v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSObjectInaccessibleException,  @"%@ does not set players manually, they are all derived from the set challenge",  v5);
}

- (id)receiverPlayer
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 receivingPlayer]);

  return v3;
}

- (void)setReceiverPlayer:(id)a3
{
  id v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSObjectInaccessibleException,  @"%@ does not set players manually, they are all derived from the set challenge",  v5);
}

- (id)originatorPlayerID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 issuingPlayer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerID]);

  return v4;
}

- (void)setOriginatorPlayerID:(id)a3
{
  id v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSObjectInaccessibleException,  @"%@ does not set players manually, they are all derived from the set challenge",  v5);
}

- (id)originatorPlayer
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 issuingPlayer]);

  return v3;
}

- (void)setOriginatorPlayer:(id)a3
{
  id v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSObjectInaccessibleException,  @"%@ does not set players manually, they are all derived from the set challenge",  v5);
}

- (id)gameName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 game]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  return v4;
}

- (BOOL)supportsChallenges
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 game]);
  unsigned __int8 v4 = [v3 supportsChallenges];

  return v4;
}

- (void)setGameName:(id)a3
{
  id v3 = (objc_class *)objc_opt_class(self);
  unsigned __int8 v4 = NSStringFromClass(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSObjectInaccessibleException,  @"%@ does not set gameName manually, they are all derived from the set challenge",  v5);
}

- (void)refreshData
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  unsigned __int8 v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin refreshData", v11, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v12 = @"scroll";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v13 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  [v5 refreshContentsForDataType:1 userInfo:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v9));

  [v10 refreshContentsForDataType:1 userInfo:0];
}

- (BOOL)isAppRunning
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  unsigned __int8 v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKChallengeBulletin isAppRunning",  (uint8_t *)v17,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);

  if (!v6) {
    return 0;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
  int v9 = GKGetApplicationStateForBundleID(v8);

  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v10);
  }
  v12 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleID]);
    v17[0] = 67109378;
    v17[1] = v9;
    __int16 v18 = 2112;
    v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "presentChallengeReceived: got appState of %d for %@",  (uint8_t *)v17,  0x12u);
  }

  return v9 == 8;
}

- (void)notifyApp
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  unsigned __int8 v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKChallengeBulletin notifyApp",  (uint8_t *)&v13,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v6));

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  uint64_t v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "telling the client %@ about challenge %@",  (uint8_t *)&v13,  0x16u);
  }

  -[GKChallengeBulletin notifyClient:](self, "notifyClient:", v7);
  [v7 refreshContentsForDataType:1 userInfo:0];
}

- (void)notifyClient:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKChallengeBulletin notifyClient:", buf, 2u);
  }

  uint64_t v8 = (objc_class *)objc_opt_class(self);
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSObjectInaccessibleException,  @"%@ Only to be used by derived classes",  v10);
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin assembleBulletin", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameName](self, "gameName"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v5, v6));
  -[GKBulletin setTitle:](self, "setTitle:", v7);

  -[GKBulletin setHasSound:](self, "setHasSound:", 1LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[GKChallengeBulletin customChallengeSoundPathForBundleID:]( self,  "customChallengeSoundPathForBundleID:",  v9));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v11);
}

- (id)customChallengeSoundPathForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKChallengeBulletin customChallengeSoundPathForBundleID:",  v15,  2u);
  }

  uint64_t v7 = GKGetBundlePathForIdentifier(v4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v8));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 _gkPathForChallengeSound]);
  id v11 = (void *)v10;
  v12 = &stru_10027B720;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  int v13 = v12;

  return v13;
}

- (unint64_t)launchEventType
{
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers(self);
  }
  id v5 = (void *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_10012229C(v5, (uint64_t)self, a2);
  }
  return -1LL;
}

- (void)handleAcceptAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  BOOL v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    LOWORD(v19) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKChallengeBulletin handleAcceptAction",  (uint8_t *)&v19,  2u);
  }

  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v5);
  }
  uint64_t v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKChallenge Notification: challenge received handling accept action %@",  (uint8_t *)&v19,  0xCu);
  }

  uint64_t v8 = -[GKGameplayBulletin gameLocation](self, "gameLocation");
  if ((_DWORD)v8 == 1)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(v8);
    }
    uint64_t v10 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
      int v13 = (GKChallengeBulletin *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
      int v19 = 138412290;
      v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "GKChallenge Notification: set launch event for client %@",  (uint8_t *)&v19,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin gameDescriptor](self, "gameDescriptor"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v15));

    unint64_t v17 = -[GKChallengeBulletin launchEventType](self, "launchEventType");
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeBulletin challenge](self, "challenge"));
    [v16 setLaunchEvent:v17 withContext:v18];
  }

- (GKChallengeInternal)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end