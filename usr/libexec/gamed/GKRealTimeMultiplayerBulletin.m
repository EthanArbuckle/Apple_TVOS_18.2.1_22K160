@interface GKRealTimeMultiplayerBulletin
+ (BOOL)supportsSecureCoding;
- (BOOL)isMessageBasedInvite;
- (BOOL)isNearbyInvite;
- (BOOL)isSharePlayInvite;
- (BOOL)serverHosted;
- (GKRealTimeMultiplayerBulletin)init;
- (GKRealTimeMultiplayerBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerBulletin)initWithPushNotification:(id)a3;
- (NSData)peerBlob;
- (NSData)peerNatIP;
- (NSData)peerPushToken;
- (NSData)selfTicket;
- (NSData)sessionToken;
- (NSDictionary)clientDictionary;
- (NSNumber)declineReason;
- (NSNumber)inviteVersion;
- (NSNumber)peerNatType;
- (NSNumber)selfNatType;
- (NSNumber)transportVersionToUse;
- (NSString)peerPseudonym;
- (NSString)sessionID;
- (id)clientNotification;
- (id)clientNotificationWithiCloudID:(id)a3;
- (id)customInviteSoundPathForBundleID:(id)a3;
- (id)description;
- (int64_t)inviteVersionFromMessage:(id)a3;
- (unint64_t)inviteApproach;
- (void)declineInviteWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)parseClientData:(id)a3;
- (void)setClientDictionary:(id)a3;
- (void)setDeclineReason:(id)a3;
- (void)setInviteApproach:(unint64_t)a3;
- (void)setInviteVersion:(id)a3;
- (void)setIsMessageBasedInvite:(BOOL)a3;
- (void)setIsNearbyInvite:(BOOL)a3;
- (void)setIsSharePlayInvite:(BOOL)a3;
- (void)setPeerBlob:(id)a3;
- (void)setPeerNatIP:(id)a3;
- (void)setPeerNatType:(id)a3;
- (void)setPeerPseudonym:(id)a3;
- (void)setPeerPushToken:(id)a3;
- (void)setSelfNatType:(id)a3;
- (void)setSelfTicket:(id)a3;
- (void)setServerHosted:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setTransportVersionToUse:(id)a3;
- (void)updateDeclineInviteTrackingForReason:(int64_t)a3;
@end

@implementation GKRealTimeMultiplayerBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKRealTimeMultiplayerBulletin)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerBulletin;
  return -[GKRealTimeMultiplayerBulletin init](&v3, "init");
}

- (int64_t)inviteVersionFromMessage:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin inviteVersionFromMessage:",  v12,  2u);
  }

  uint64_t v7 = (uint64_t)[v4 length];
  id v8 = v4;
  v9 = (char *)[v8 bytes];
  if (v7 < 2 || v9[v7 - 2]) {
    int64_t v10 = 0LL;
  }
  else {
    int64_t v10 = v9[v7 - 1];
  }

  return v10;
}

- (void)parseClientData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int64_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin parseClientData:",  v10,  2u);
  }

  id v8 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[GKRealTimeMultiplayerBulletin inviteVersionFromMessage:]( self,  "inviteVersionFromMessage:",  v5)));
  inviteVersion = self->_inviteVersion;
  self->_inviteVersion = v8;
}

- (GKRealTimeMultiplayerBulletin)initWithPushNotification:(id)a3
{
  id v4 = (NSDictionary *)a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin initWithPushNotification:",  buf,  2u);
  }

  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerBulletin;
  id v8 = -[GKMultiplayerBulletin initWithPushNotification:](&v51, "initWithPushNotification:", v5);
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"x"));
    clientDictionary = v8->_clientDictionary;
    v8->_clientDictionary = (NSDictionary *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"s"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v11));
    sessionToken = v8->_sessionToken;
    v8->_sessionToken = (NSData *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"P"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v14));
    peerPushToken = v8->_peerPushToken;
    v8->_peerPushToken = (NSData *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"N"));
    peerNatType = v8->_peerNatType;
    v8->_peerNatType = (NSNumber *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"A"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v19));
    peerNatIP = v8->_peerNatIP;
    v8->_peerNatIP = (NSData *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"B"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v22));
    peerBlob = v8->_peerBlob;
    v8->_peerBlob = (NSData *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v8->_clientDictionary,  "objectForKeyedSubscript:",  GKInviteSessionIDKey));
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v8->_clientDictionary,  "objectForKeyedSubscript:",  GKTransportPseudonymKey));
    peerPseudonym = v8->_peerPseudonym;
    v8->_peerPseudonym = (NSString *)v27;

    uint64_t v29 = GKSuggestedTransportVersionPushShortKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v5,  "objectForKeyedSubscript:",  GKSuggestedTransportVersionPushShortKey));

    if (v30)
    {
      v31 = v5;
    }

    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8->_clientDictionary, "objectForKeyedSubscript:", v29));

      if (!v32)
      {
        uint64_t v44 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
        transportVersionToUse = v8->_transportVersionToUse;
        v8->_transportVersionToUse = (NSNumber *)v44;

        if (!os_log_GKGeneral) {
          id v47 = (id)GKOSLoggers(v46);
        }
        v48 = (void *)os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v49 = v48;
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
          *(_DWORD *)buf = 138412290;
          v53 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "Default to use (%@) GKDefaultTransportVersionIfNeeded, since this is not included in the push notification.",  buf,  0xCu);
        }

        goto LABEL_11;
      }

      v31 = v8->_clientDictionary;
    }

    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v29));
    v34 = v8->_transportVersionToUse;
    v8->_transportVersionToUse = (NSNumber *)v33;

LABEL_11:
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientDictionary](v8, "clientDictionary"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"s"]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dataFrom64String:](v8, "dataFrom64String:", v36));

    -[GKRealTimeMultiplayerBulletin parseClientData:](v8, "parseClientData:", v37);
    v38 = objc_alloc(&OBJC_CLASS___GKGameDescriptor);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5, "objectForKey:", @"d"));
    v40 = -[GKGameDescriptor initWithPushDictionary:](v38, "initWithPushDictionary:", v39);
    -[GKBulletin setGameDescriptor:](v8, "setGameDescriptor:", v40);

    uint64_t v41 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5, "objectForKey:", GKDeclineReasonKey));
    declineReason = v8->_declineReason;
    v8->_declineReason = (NSNumber *)v41;
  }

  return v8;
}

- (GKRealTimeMultiplayerBulletin)initWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin initWithCoder:",  buf,  2u);
  }

  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerBulletin;
  id v8 = -[GKGameplayBulletin initWithCoder:](&v53, "initWithCoder:", v5);
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"sessionToken"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    sessionToken = v8->_sessionToken;
    v8->_sessionToken = (NSData *)v10;

    id v12 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"selfNatType"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    selfNatType = v8->_selfNatType;
    v8->_selfNatType = (NSNumber *)v13;

    id v15 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"serverHosted"];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v8->_serverHosted = [v16 BOOLValue];

    id v17 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"peerPushToken"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    peerPushToken = v8->_peerPushToken;
    v8->_peerPushToken = (NSData *)v18;

    id v20 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"peerNatType"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    peerNatType = v8->_peerNatType;
    v8->_peerNatType = (NSNumber *)v21;

    id v23 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"peerNatIP"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    peerNatIP = v8->_peerNatIP;
    v8->_peerNatIP = (NSData *)v24;

    id v26 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"peerBlob"];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    peerBlob = v8->_peerBlob;
    v8->_peerBlob = (NSData *)v27;

    id v29 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"selfTicket"];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    selfTicket = v8->_selfTicket;
    v8->_selfTicket = (NSData *)v30;

    id v32 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"declineReason"];
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
    declineReason = v8->_declineReason;
    v8->_declineReason = (NSNumber *)v33;

    uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v36 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v35,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v37 forKey:@"clientDictionary"]);
    clientDictionary = v8->_clientDictionary;
    v8->_clientDictionary = (NSDictionary *)v38;

    id v40 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"inviteVersion"];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    inviteVersion = v8->_inviteVersion;
    v8->_inviteVersion = (NSNumber *)v41;

    id v43 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"sessionID"];
    uint64_t v44 = objc_claimAutoreleasedReturnValue(v43);
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v44;

    id v46 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"pseudonym"];
    uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);
    peerPseudonym = v8->_peerPseudonym;
    v8->_peerPseudonym = (NSString *)v47;

    id v49 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"transportVersionToUse"];
    uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
    transportVersionToUse = v8->_transportVersionToUse;
    v8->_transportVersionToUse = (NSNumber *)v50;
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
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin encodeWithCoder:",  buf,  2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerBulletin;
  -[GKGameplayBulletin encodeWithCoder:](&v22, "encodeWithCoder:", v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  [v5 encodeObject:v8 forKey:@"sessionToken"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfNatType](self, "selfNatType"));
  [v5 encodeObject:v9 forKey:@"selfNatType"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKRealTimeMultiplayerBulletin serverHosted](self, "serverHosted")));
  [v5 encodeObject:v10 forKey:@"serverHosted"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPushToken](self, "peerPushToken"));
  [v5 encodeObject:v11 forKey:@"peerPushToken"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatType](self, "peerNatType"));
  [v5 encodeObject:v12 forKey:@"peerNatType"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatIP](self, "peerNatIP"));
  [v5 encodeObject:v13 forKey:@"peerNatIP"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerBlob](self, "peerBlob"));
  [v5 encodeObject:v14 forKey:@"peerBlob"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfTicket](self, "selfTicket"));
  [v5 encodeObject:v15 forKey:@"selfTicket"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin declineReason](self, "declineReason"));
  [v5 encodeObject:v16 forKey:@"declineReason"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientDictionary](self, "clientDictionary"));
  [v5 encodeObject:v17 forKey:@"clientDictionary"];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
  [v5 encodeObject:v18 forKey:@"inviteVersion"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));
  [v5 encodeObject:v19 forKey:@"sessionID"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPseudonym](self, "peerPseudonym"));
  [v5 encodeObject:v20 forKey:@"pseudonym"];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin transportVersionToUse](self, "transportVersionToUse"));
  [v5 encodeObject:v21 forKey:@"transportVersionToUse"];
}

- (id)clientNotificationWithiCloudID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientNotification](self, "clientNotification"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));

  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:@"iCloudID"];
  }

  return v6;
}

- (id)clientNotification
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin clientNotification",  v35,  2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"session-token");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, @"self-id");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, @"peer-id");
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPushToken](self, "peerPushToken"));

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPushToken](self, "peerPushToken"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v13,  @"peer-push-token");
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatType](self, "peerNatType"));

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatType](self, "peerNatType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, @"peer-nat-type");
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatIP](self, "peerNatIP"));

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerNatIP](self, "peerNatIP"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, @"peer-nat-ip");
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerBlob](self, "peerBlob"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerBlob](self, "peerBlob"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, @"peer-blob");
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));

  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin inviteVersion](self, "inviteVersion"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v21,  @"invite-version");
  }

  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin transportVersionToUse](self, "transportVersionToUse"));

  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin transportVersionToUse](self, "transportVersionToUse"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v23,  GKSuggestedTransportVersionPushShortKey);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfTicket](self, "selfTicket"));

  if (v24)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin selfTicket](self, "selfTicket"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v25, GKInviteCDXTicketIDKey);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));

  if (v26)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v27, GKInviteSessionIDKey);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPseudonym](self, "peerPseudonym"));

  if (v28)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin peerPseudonym](self, "peerPseudonym"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v29, GKInvitePeerPseudonym);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 bundleIdentifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v31, GKBundleIDKey);

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin declineReason](self, "declineReason"));
  if (v32)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin declineReason](self, "declineReason"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v33, GKDeclineReasonKey);
  }

  return v5;
}

- (void)updateDeclineInviteTrackingForReason:(int64_t)a3
{
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(self);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin updateDeclineInviteTrackingForReason:",  v11,  2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[GKRealTimeMultiplayerBulletin setDeclineReason:](self, "setDeclineReason:", v7);

  else {
    id v8 = (id *)*(&off_100273448 + a3);
  }
  id v9 = *v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v10 reportEvent:GKReporterDomainInvite type:v9];
}

- (void)declineInviteWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(self);
  }
  id v6 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin: declineInviteWithReason: %@",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v9 = v3;
  id v10 = -[GKRealTimeMultiplayerBulletin updateDeclineInviteTrackingForReason:]( self,  "updateDeclineInviteTrackingForReason:",  v3);
  if ((_DWORD)v3 == 5)
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers(v10);
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_10011DE80();
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKInviteInternal inviteWithBulletin:](&OBJC_CLASS___GKInviteInternal, "inviteWithBulletin:", self));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceForBundleID:localPlayer:]( &OBJC_CLASS___GKMultiplayerMatchService,  "serviceForBundleID:localPlayer:",  v14,  0LL));
    [v15 declineGameInvite:v12 reason:v9 handler:0];
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
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin: customInviteSoundPathForBundleID:",  v15,  2u);
  }

  uint64_t v7 = GKGetBundlePathForIdentifier(v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v8));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 _gkPathForInviteSound]);
  id v11 = (void *)v10;
  id v12 = &stru_10027B720;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  uint64_t v13 = v12;

  return v13;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerBulletin;
  id v3 = -[GKBulletin description](&v13, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionToken](self, "sessionToken"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin sessionID](self, "sessionID"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingFormat:@"\ngameDescriptor.bundleIdentifier:%@\noriginatorPlayerID:%@\nreceiverPlayerID:%@\nsessionToken:%@\nsessionID:%@\n", v6, v7, v8, v9, v10]);

  return v11;
}

- (NSData)sessionToken
{
  return (NSData *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setSessionToken:(id)a3
{
}

- (NSNumber)selfNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setSelfNatType:(id)a3
{
}

- (BOOL)serverHosted
{
  return self->_serverHosted;
}

- (void)setServerHosted:(BOOL)a3
{
  self->_serverHosted = a3;
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setPeerPushToken:(id)a3
{
}

- (NSNumber)peerNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setPeerNatType:(id)a3
{
}

- (NSData)peerNatIP
{
  return (NSData *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setPeerNatIP:(id)a3
{
}

- (NSData)peerBlob
{
  return (NSData *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setPeerBlob:(id)a3
{
}

- (NSData)selfTicket
{
  return (NSData *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setSelfTicket:(id)a3
{
}

- (NSNumber)declineReason
{
  return (NSNumber *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setDeclineReason:(id)a3
{
}

- (NSDictionary)clientDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setClientDictionary:(id)a3
{
}

- (NSNumber)inviteVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setInviteVersion:(id)a3
{
}

- (BOOL)isMessageBasedInvite
{
  return self->_isMessageBasedInvite;
}

- (void)setIsMessageBasedInvite:(BOOL)a3
{
  self->_isMessageBasedInvite = a3;
}

- (unint64_t)inviteApproach
{
  return self->_inviteApproach;
}

- (void)setInviteApproach:(unint64_t)a3
{
  self->_inviteApproach = a3;
}

- (BOOL)isSharePlayInvite
{
  return self->_isSharePlayInvite;
}

- (void)setIsSharePlayInvite:(BOOL)a3
{
  self->_isSharePlayInvite = a3;
}

- (BOOL)isNearbyInvite
{
  return self->_isNearbyInvite;
}

- (void)setIsNearbyInvite:(BOOL)a3
{
  self->_isNearbyInvite = a3;
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)peerPseudonym
{
  return self->_peerPseudonym;
}

- (void)setPeerPseudonym:(id)a3
{
}

- (void).cxx_destruct
{
}

@end