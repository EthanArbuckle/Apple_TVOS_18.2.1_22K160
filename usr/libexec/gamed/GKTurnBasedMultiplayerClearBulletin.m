@interface GKTurnBasedMultiplayerClearBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKTurnBasedMultiplayerClearBulletin)initWithCoder:(id)a3;
- (GKTurnBasedMultiplayerClearBulletin)initWithPushNotification:(id)a3;
- (int64_t)clearType;
- (void)encodeWithCoder:(id)a3;
- (void)setClearType:(int64_t)a3;
@end

@implementation GKTurnBasedMultiplayerClearBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerClearBulletin loadBulletinsForPushNotification: withHandler:",  v14,  2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v10 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountTurnBasedClear];

  v11 = objc_alloc_init(&OBJC_CLASS___GKTurnBasedMultiplayerClearBulletin);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](v11, "matchID"));
  [v12 clearTurnBasedBulletinsForMatchID:v13];

  if (v7) {
    v7[2](v7, 0LL);
  }
}

- (GKTurnBasedMultiplayerClearBulletin)initWithPushNotification:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerClearBulletin initWithPushNotification:",  buf,  2u);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerClearBulletin;
  id v8 = -[GKTurnBasedMultiplayerBulletin initWithPushNotification:](&v14, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"cc"]);
    id v10 = [v9 integerValue];

    uint64_t v11 = 3LL;
    if (v10 != (id)81) {
      uint64_t v11 = 0LL;
    }
    if (v10 == (id)80) {
      uint64_t v12 = 2LL;
    }
    else {
      uint64_t v12 = v11;
    }
    -[GKTurnBasedMultiplayerClearBulletin setClearType:](v8, "setClearType:", v12);
  }

  return v8;
}

- (GKTurnBasedMultiplayerClearBulletin)initWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerClearBulletin initWithCoder:",  buf,  2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerClearBulletin;
  id v8 = -[GKTurnBasedMultiplayerBulletin initWithCoder:](&v12, "initWithCoder:", v5);
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"clearType"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_clearType = (int64_t)[v10 integerValue];
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerClearBulletin encodeWithCoder:",  buf,  2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKTurnBasedMultiplayerClearBulletin;
  -[GKTurnBasedMultiplayerBulletin encodeWithCoder:](&v9, "encodeWithCoder:", v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKTurnBasedMultiplayerClearBulletin clearType](self, "clearType")));
  [v5 encodeObject:v8 forKey:@"clearType"];
}

- (int64_t)clearType
{
  return self->_clearType;
}

- (void)setClearType:(int64_t)a3
{
  self->_clearType = a3;
}

@end