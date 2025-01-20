@interface GKGameplayBulletin
+ (BOOL)areGameVersionsCompatibleForGame:(id)a3 shortVersion:(id)a4 version:(id)a5;
+ (BOOL)supportsSecureCoding;
- (BOOL)isCompatibleWithGameDescriptor:(id)a3;
- (BOOL)isPushForLocalPlayers;
- (BOOL)isPushFromLocalPlayers;
- (BOOL)setInstalledGameLocationFor:(id)a3 descriptor:(id)a4;
- (GKGameplayBulletin)initWithCoder:(id)a3;
- (GKPlayerInternal)originatorGuestPlayer;
- (GKPlayerInternal)originatorPlayer;
- (GKPlayerInternal)receiverGuestPlayer;
- (GKPlayerInternal)receiverPlayer;
- (NSArray)compatibleShortVersions;
- (NSArray)compatibleVersions;
- (NSString)URLContext;
- (NSString)originatorGuestPlayerID;
- (NSString)originatorPlayerID;
- (NSString)receiverGuestPlayerID;
- (NSString)receiverPlayerID;
- (unsigned)gameLocation;
- (void)checkCompatibleGameWithoutCompatibilityMatrix;
- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3;
- (void)determineGameLocationViaCompatibilityMatrixWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadOriginatorPlayerWithCompletionHandler:(id)a3;
- (void)setCompatibleShortVersions:(id)a3;
- (void)setCompatibleVersions:(id)a3;
- (void)setGameLocation:(unsigned __int8)a3;
- (void)setOriginatorGuestPlayer:(id)a3;
- (void)setOriginatorGuestPlayerID:(id)a3;
- (void)setOriginatorPlayer:(id)a3;
- (void)setOriginatorPlayerID:(id)a3;
- (void)setReceiverGuestPlayer:(id)a3;
- (void)setReceiverGuestPlayerID:(id)a3;
- (void)setReceiverPlayer:(id)a3;
- (void)setReceiverPlayerID:(id)a3;
@end

@implementation GKGameplayBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGameplayBulletin)initWithCoder:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGameplayBulletin initWithCoder:", buf, 2u);
  }

  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___GKGameplayBulletin;
  v8 = -[GKBulletin initWithCoder:](&v48, "initWithCoder:", v5);
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"receiverPlayerID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    receiverPlayerID = v8->_receiverPlayerID;
    v8->_receiverPlayerID = (NSString *)v10;

    id v12 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"originatorPlayerID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    originatorPlayerID = v8->_originatorPlayerID;
    v8->_originatorPlayerID = (NSString *)v13;

    id v15 = [v5 decodeObjectOfClass:objc_opt_class(GKPlayerInternal) forKey:@"receiverPlayer"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    receiverPlayer = v8->_receiverPlayer;
    v8->_receiverPlayer = (GKPlayerInternal *)v16;

    id v18 = [v5 decodeObjectOfClass:objc_opt_class(GKPlayerInternal) forKey:@"originatorPlayer"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    originatorPlayer = v8->_originatorPlayer;
    v8->_originatorPlayer = (GKPlayerInternal *)v19;

    id v21 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"receiverGuestPlayerID"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    receiverGuestPlayerID = v8->_receiverGuestPlayerID;
    v8->_receiverGuestPlayerID = (NSString *)v22;

    id v24 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"originatorGuestPlayerID"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    originatorGuestPlayerID = v8->_originatorGuestPlayerID;
    v8->_originatorGuestPlayerID = (NSString *)v25;

    id v27 = [v5 decodeObjectOfClass:objc_opt_class(GKPlayerInternal) forKey:@"receiverGuestPlayer"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    receiverGuestPlayer = v8->_receiverGuestPlayer;
    v8->_receiverGuestPlayer = (GKPlayerInternal *)v28;

    id v30 = [v5 decodeObjectOfClass:objc_opt_class(GKPlayerInternal) forKey:@"originatorGuestPlayer"];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    originatorGuestPlayer = v8->_originatorGuestPlayer;
    v8->_originatorGuestPlayer = (GKPlayerInternal *)v31;

    uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v35 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v33,  v34,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    uint64_t v37 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v36 forKey:@"compatibleVersions"]);
    compatibleVersions = v8->_compatibleVersions;
    v8->_compatibleVersions = (NSArray *)v37;

    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v41 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v39,  v40,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    uint64_t v43 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v42 forKey:@"compatibleShortVersions"]);
    compatibleShortVersions = v8->_compatibleShortVersions;
    v8->_compatibleShortVersions = (NSArray *)v43;

    id v45 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"gameLocation"];
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v8->_gameLocation = [v46 integerValue];
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGameplayBulletin encodeWithCoder:", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GKGameplayBulletin;
  -[GKBulletin encodeWithCoder:](&v19, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
  [v5 encodeObject:v8 forKey:@"receiverPlayerID"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
  [v5 encodeObject:v9 forKey:@"originatorPlayerID"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayer](self, "receiverPlayer"));
  [v5 encodeObject:v10 forKey:@"receiverPlayer"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  [v5 encodeObject:v11 forKey:@"originatorPlayer"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverGuestPlayerID](self, "receiverGuestPlayerID"));
  [v5 encodeObject:v12 forKey:@"receiverGuestPlayerID"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorGuestPlayerID](self, "originatorGuestPlayerID"));
  [v5 encodeObject:v13 forKey:@"originatorGuestPlayerID"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverGuestPlayer](self, "receiverGuestPlayer"));
  [v5 encodeObject:v14 forKey:@"receiverGuestPlayer"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorGuestPlayer](self, "originatorGuestPlayer"));
  [v5 encodeObject:v15 forKey:@"originatorGuestPlayer"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
  [v5 encodeObject:v16 forKey:@"compatibleVersions"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
  [v5 encodeObject:v17 forKey:@"compatibleShortVersions"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[GKGameplayBulletin gameLocation](self, "gameLocation")));
  [v5 encodeObject:v18 forKey:@"gameLocation"];
}

- (NSString)URLContext
{
  return (NSString *)&stru_10027B720;
}

- (BOOL)isPushForLocalPlayers
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin isPushForLocalPlayers", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin receiverPlayerID](self, "receiverPlayerID"));
  unsigned __int8 v6 = [(id)objc_opt_class(self) playerIsLocal:v5];

  return v6;
}

- (BOOL)isPushFromLocalPlayers
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin isPushFromLocalPlayers", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayerID](self, "originatorPlayerID"));
  unsigned __int8 v6 = [(id)objc_opt_class(self) playerIsLocal:v5];

  return v6;
}

- (BOOL)isCompatibleWithGameDescriptor:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin isCompatibleWithGameDescriptor:",  v23,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleVersion]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 shortBundleVersion]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  unsigned int v15 = [v9 isEqualToString:v14];

  if (!v15) {
    goto LABEL_13;
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 shortBundleVersion]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleVersion]);
  if (![v13 isEqualToString:v16])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
    if (([v18 containsObject:v16] & 1) != 0
      || [v11 isEqualToString:v17])
    {

      goto LABEL_10;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
    unsigned __int8 v21 = [v20 containsObject:v17];

    if ((v21 & 1) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }

- (void)checkCompatibleGameWithoutCompatibilityMatrix
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin checkCompatibleGameWithoutCompatibilityMatrix",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationProxyForBundleID:v7]);
  if ([v8 isInstalled] && (objc_msgSend(v8, "isRestricted") & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleShortVersion]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleVersion]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 shortBundleVersion]);
    if (([v11 isEqualToString:v9] & 1) == 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
      if (([v12 containsObject:v9] & 1) == 0)
      {
        id v30 = v9;
        uint64_t v31 = v12;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleVersion]);
        if (([v14 isEqualToString:v32] & 1) == 0)
        {
          uint64_t v28 = v14;
          v29 = v13;
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
          uint64_t v16 = v32;
          if ((objc_msgSend(v15, "containsObject:") & 1) == 0)
          {
            unsigned __int8 v27 = [v32 isEqualToString:@"-1"];

            id v9 = v30;
            if ((v27 & 1) == 0)
            {
LABEL_25:

              goto LABEL_26;
            }

- (BOOL)setInstalledGameLocationFor:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 platform]
    || (id v8 = +[GKGameDescriptor supportsPlatform:]( GKGameDescriptor,  "supportsPlatform:",  [v6 platform]),  (v8 & 1) != 0))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationProxyForBundleID:v9]);

    if ([v11 isInstalled] && (objc_msgSend(v11, "isRestricted") & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleShortVersion]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleVersion]);
      id v28 = [(id)objc_opt_class(self) areGameVersionsCompatibleForGame:v6 shortVersion:v14 version:v16];
      if ((_DWORD)v28)
      {
        if (!os_log_GKGeneral) {
          id v29 = (id)GKOSLoggers(v28);
        }
        id v30 = (os_log_s *)os_log_GKTrace;
        BOOL v31 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
        if (v31)
        {
          LOWORD(v40) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler - Installed compatible app found",  (uint8_t *)&v40,  2u);
        }

        if (!os_log_GKGeneral) {
          id v32 = (id)GKOSLoggers(v31);
        }
        uint64_t v33 = (os_log_s *)os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          int v40 = 138412802;
          id v41 = v9;
          __int16 v42 = 2112;
          id v43 = v14;
          __int16 v44 = 2112;
          id v45 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin - found installed compatible app: bundleID = %@, short version = %@, version = %@",  (uint8_t *)&v40,  0x20u);
        }

        BOOL v27 = 1;
        -[GKGameplayBulletin setGameLocation:](self, "setGameLocation:", 1LL);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        [v34 setBundleIdentifier:v9];

        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        [v35 setBundleVersion:v16];

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        [v36 setShortBundleVersion:v14];

        id v37 = +[GKGameDescriptor currentPlatform](&OBJC_CLASS___GKGameDescriptor, "currentPlatform");
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
        [v38 setPlatform:v37];

        goto LABEL_32;
      }
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
      unsigned __int8 v13 = [v12 isAppInstallationRestricted];

      if ((v13 & 1) != 0)
      {
LABEL_31:
        BOOL v27 = 0;
LABEL_32:

        goto LABEL_33;
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"short-bundle-version"]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"bundle-version"]);
      uint64_t v16 = (void *)v15;
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers(v15);
      }
      id v18 = (os_log_s *)os_log_GKTrace;
      BOOL v19 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
      if (v19)
      {
        LOWORD(v40) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler - Store Compatible app found",  (uint8_t *)&v40,  2u);
      }

      if (!os_log_GKGeneral) {
        id v20 = (id)GKOSLoggers(v19);
      }
      id v21 = (os_log_s *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        int v40 = 138412802;
        id v41 = v9;
        __int16 v42 = 2112;
        id v43 = v14;
        __int16 v44 = 2112;
        id v45 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin - found store compatible app: bundleID = %@, short version = %@, version = %@",  (uint8_t *)&v40,  0x20u);
      }

      -[GKGameplayBulletin setGameLocation:](self, "setGameLocation:", 2LL);
    }

    goto LABEL_31;
  }

  if (!os_log_GKGeneral) {
    id v22 = (id)GKOSLoggers(v8);
  }
  v23 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    id v24 = v23;
    id v25 = +[GKGameDescriptor currentPlatform](&OBJC_CLASS___GKGameDescriptor, "currentPlatform");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor supportedPlatforms](&OBJC_CLASS___GKGameDescriptor, "supportedPlatforms"));
    int v40 = 134218498;
    id v41 = v25;
    __int16 v42 = 2112;
    id v43 = v6;
    __int16 v44 = 2112;
    id v45 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin - skipping mismatching platform between current = %ld and game = %@. Supported platforms: %@",  (uint8_t *)&v40,  0x20u);
  }

  BOOL v27 = 0;
LABEL_33:

  return v27;
}

- (void)determineGameLocationViaCompatibilityMatrixWithCompletionHandler:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler:",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameplayBulletin.m",  194LL,  "-[GKGameplayBulletin determineGameLocationViaCompatibilityMatrixWithCompletionHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 shortBundleVersion]);
  if (v12)
  {
    unsigned __int8 v13 = (void *)v12;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
    id v15 = [v14 count];

    if (!v15) {
      goto LABEL_10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleShortVersions](self, "compatibleShortVersions"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    [v16 setShortBundleVersion:v13];
  }

LABEL_10:
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 bundleVersion]);
  if (v18)
  {
    BOOL v19 = (void *)v18;
LABEL_14:

    goto LABEL_15;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
  id v21 = [v20 count];

  if (v21)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin compatibleVersions](self, "compatibleVersions"));
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v17 lastObject]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
    [v22 setBundleVersion:v19];

    goto LABEL_14;
  }

+ (BOOL)areGameVersionsCompatibleForGame:(id)a3 shortVersion:(id)a4 version:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 shortVersions]);
  unsigned __int8 v11 = [v10 containsObject:v9];

  if ((v11 & 1) != 0)
  {
    unsigned __int8 v12 = 1;
  }

  else
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 shortVersions]);
    if ([v13 containsObject:@"-1"])
    {
      unsigned __int8 v12 = 1;
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 versions]);
      if ([v14 containsObject:v8])
      {
        unsigned __int8 v12 = 1;
      }

      else
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 versions]);
        unsigned __int8 v12 = [v15 containsObject:@"-1"];
      }
    }
  }

  return v12;
}

- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKGamePlayerBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameplayBulletin.m",  274LL,  "-[GKGameplayBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10010C8B4;
  v16[3] = &unk_10026B170;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  [v11 perform:v16];
  if (v5)
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10010CB60;
    v13[3] = &unk_10026B030;
    id v15 = v5;
    id v14 = v11;
    [v14 notifyOnQueue:v12 block:v13];
  }
}

- (void)loadOriginatorPlayerWithCompletionHandler:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKGameplayBulletin loadOriginatorPlayerWithCompletionHandler:",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameplayBulletin.m",  311LL,  "-[GKGameplayBulletin loadOriginatorPlayerWithCompletionHandler:]"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameplayBulletin originatorPlayer](self, "originatorPlayer"));
  if (!v11)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10010CD8C;
    v16[3] = &unk_10026B170;
    v16[4] = self;
    id v17 = v10;
    [v17 perform:v16];

    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (v5)
  {
LABEL_7:
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10010CF9C;
    v13[3] = &unk_10026B030;
    id v15 = v5;
    id v14 = v10;
    [v14 notifyOnQueue:v12 block:v13];
  }

- (NSString)receiverPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setReceiverPlayerID:(id)a3
{
}

- (NSString)originatorPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setOriginatorPlayerID:(id)a3
{
}

- (GKPlayerInternal)receiverPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setReceiverPlayer:(id)a3
{
}

- (GKPlayerInternal)originatorPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setOriginatorPlayer:(id)a3
{
}

- (NSString)receiverGuestPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setReceiverGuestPlayerID:(id)a3
{
}

- (NSString)originatorGuestPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setOriginatorGuestPlayerID:(id)a3
{
}

- (GKPlayerInternal)receiverGuestPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setReceiverGuestPlayer:(id)a3
{
}

- (GKPlayerInternal)originatorGuestPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setOriginatorGuestPlayer:(id)a3
{
}

- (NSArray)compatibleVersions
{
  return (NSArray *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setCompatibleVersions:(id)a3
{
}

- (NSArray)compatibleShortVersions
{
  return (NSArray *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setCompatibleShortVersions:(id)a3
{
}

- (unsigned)gameLocation
{
  return self->_gameLocation;
}

- (void)setGameLocation:(unsigned __int8)a3
{
  self->_gameLocation = a3;
}

- (void).cxx_destruct
{
}

@end