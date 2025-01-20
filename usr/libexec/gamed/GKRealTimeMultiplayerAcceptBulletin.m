@interface GKRealTimeMultiplayerAcceptBulletin
+ (BOOL)supportsSecureCoding;
- (BOOL)isAccept;
- (GKRealTimeMultiplayerAcceptBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerAcceptBulletin)initWithPushNotification:(id)a3;
- (NSData)peerRelayIP;
- (NSData)relayConnectionID;
- (NSData)relayToken;
- (NSData)relayTranscationID;
- (NSData)selfRelayIP;
- (NSNumber)blobType;
- (NSNumber)peerRelayPort;
- (NSNumber)relayType;
- (NSNumber)selfRelayPort;
- (id)aggregateDictionaryKey;
- (id)debugLine;
- (id)notificationName;
- (void)assembleBulletin;
- (void)encodeWithCoder:(id)a3;
- (void)handleAction:(id)a3;
- (void)setBlobType:(id)a3;
- (void)setPeerRelayIP:(id)a3;
- (void)setPeerRelayPort:(id)a3;
- (void)setRelayConnectionID:(id)a3;
- (void)setRelayToken:(id)a3;
- (void)setRelayTranscationID:(id)a3;
- (void)setRelayType:(id)a3;
- (void)setSelfRelayIP:(id)a3;
- (void)setSelfRelayPort:(id)a3;
@end

@implementation GKRealTimeMultiplayerAcceptBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountInviteAccept;
}

- (id)debugLine
{
  return @"accept push";
}

- (id)notificationName
{
  return GKAcceptGameInviteNotification;
}

- (BOOL)isAccept
{
  return 1;
}

- (GKRealTimeMultiplayerAcceptBulletin)initWithPushNotification:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerAcceptBulletin initWithPushNotification:",  buf,  2u);
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerAcceptBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithPushNotification:](&v32, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"e"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v9));
    -[GKRealTimeMultiplayerBulletin setSelfTicket:](v8, "setSelfTicket:", v10);

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"g"]);
    blobType = v8->_blobType;
    v8->_blobType = (NSNumber *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"t"]);
    relayType = v8->_relayType;
    v8->_relayType = (NSNumber *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"k"]);
    relayConnectionID = v8->_relayConnectionID;
    v8->_relayConnectionID = (NSData *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"q"]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v17));
    relayTranscationID = v8->_relayTranscationID;
    v8->_relayTranscationID = (NSData *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"h"]);
    selfRelayIP = v8->_selfRelayIP;
    v8->_selfRelayIP = (NSData *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"o"]);
    selfRelayPort = v8->_selfRelayPort;
    v8->_selfRelayPort = (NSNumber *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"H"]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v24));
    peerRelayIP = v8->_peerRelayIP;
    v8->_peerRelayIP = (NSData *)v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"O"]);
    peerRelayPort = v8->_peerRelayPort;
    v8->_peerRelayPort = (NSNumber *)v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"r"]);
    relayToken = v8->_relayToken;
    v8->_relayToken = (NSData *)v29;
  }

  return v8;
}

- (GKRealTimeMultiplayerAcceptBulletin)initWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerAcceptBulletin initWithCoder:",  buf,  2u);
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerAcceptBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithCoder:](&v37, "initWithCoder:", v5);
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"blobType"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    blobType = v8->_blobType;
    v8->_blobType = (NSNumber *)v10;

    id v12 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"relayType"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    relayType = v8->_relayType;
    v8->_relayType = (NSNumber *)v13;

    id v15 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"relayConnectionID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    relayConnectionID = v8->_relayConnectionID;
    v8->_relayConnectionID = (NSData *)v16;

    id v18 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"relayTranscationID"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    relayTranscationID = v8->_relayTranscationID;
    v8->_relayTranscationID = (NSData *)v19;

    id v21 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"selfRelayIP"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    selfRelayIP = v8->_selfRelayIP;
    v8->_selfRelayIP = (NSData *)v22;

    id v24 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"selfRelayPort"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    selfRelayPort = v8->_selfRelayPort;
    v8->_selfRelayPort = (NSNumber *)v25;

    id v27 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"peerRelayIP"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    peerRelayIP = v8->_peerRelayIP;
    v8->_peerRelayIP = (NSData *)v28;

    id v30 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"peerRelayPort"];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    peerRelayPort = v8->_peerRelayPort;
    v8->_peerRelayPort = (NSNumber *)v31;

    id v33 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"relayToken"];
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    relayToken = v8->_relayToken;
    v8->_relayToken = (NSData *)v34;
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
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerAcceptBulletin encodeWithCoder:",  buf,  2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerAcceptBulletin;
  -[GKRealTimeMultiplayerBulletin encodeWithCoder:](&v17, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin blobType](self, "blobType"));
  [v5 encodeObject:v8 forKey:@"blobType"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayType](self, "relayType"));
  [v5 encodeObject:v9 forKey:@"relayType"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayConnectionID](self, "relayConnectionID"));
  [v5 encodeObject:v10 forKey:@"relayConnectionID"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayTranscationID](self, "relayTranscationID"));
  [v5 encodeObject:v11 forKey:@"relayTranscationID"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin selfRelayIP](self, "selfRelayIP"));
  [v5 encodeObject:v12 forKey:@"selfRelayIP"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin selfRelayPort](self, "selfRelayPort"));
  [v5 encodeObject:v13 forKey:@"selfRelayPort"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin peerRelayIP](self, "peerRelayIP"));
  [v5 encodeObject:v14 forKey:@"peerRelayIP"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin peerRelayPort](self, "peerRelayPort"));
  [v5 encodeObject:v15 forKey:@"peerRelayPort"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerAcceptBulletin relayToken](self, "relayToken"));
  [v5 encodeObject:v16 forKey:@"relayToken"];
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
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerAcceptBulletin assembleBulletin:",  buf,  2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerAcceptBulletin;
  -[GKRealTimeMultiplayerActionBulletin assembleBulletin](&v17, "assembleBulletin");
  v5 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 adamID]);
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  -[GKBulletinAction setTitle:](v5, "setTitle:", &stru_10027B720);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setBulletinType:](self, "setBulletinType:", 402LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 displayNameWithOptions:0]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE_ALIAS_1_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE_ALIAS_1_FORMAT"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v12,  v11));
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE"));
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_GAME_INVITE_NOTIFICATION_TITLE"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v14, v15));
  -[GKBulletin setTitle:](self, "setTitle:", v16);

  -[GKBulletin setMessage:](self, "setMessage:", v13);
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerAcceptBulletin handleAction:",  buf,  2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerAcceptBulletin;
  id v8 = -[GKBulletin handleAction:](&v15, "handleAction:", v5);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  uint64_t v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "bulletin handle multiplayer action: %@",  buf,  0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientNotification](self, "clientNotification"));
  [v13 acceptInviteWithNotification:v14];
}

- (NSNumber)blobType
{
  return (NSNumber *)objc_getProperty(self, a2, 384LL, 1);
}

- (void)setBlobType:(id)a3
{
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 392LL, 1);
}

- (void)setRelayType:(id)a3
{
}

- (NSData)relayConnectionID
{
  return (NSData *)objc_getProperty(self, a2, 400LL, 1);
}

- (void)setRelayConnectionID:(id)a3
{
}

- (NSData)relayTranscationID
{
  return (NSData *)objc_getProperty(self, a2, 408LL, 1);
}

- (void)setRelayTranscationID:(id)a3
{
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 416LL, 1);
}

- (void)setSelfRelayIP:(id)a3
{
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 424LL, 1);
}

- (void)setSelfRelayPort:(id)a3
{
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 432LL, 1);
}

- (void)setPeerRelayIP:(id)a3
{
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 440LL, 1);
}

- (void)setPeerRelayPort:(id)a3
{
}

- (NSData)relayToken
{
  return (NSData *)objc_getProperty(self, a2, 448LL, 1);
}

- (void)setRelayToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end