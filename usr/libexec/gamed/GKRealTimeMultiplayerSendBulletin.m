@interface GKRealTimeMultiplayerSendBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKRealTimeMultiplayerSendBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerSendBulletin)initWithPushNotification:(id)a3;
- (NSNumber)sendReason;
- (NSString)bundleIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setSendReason:(id)a3;
@end

@implementation GKRealTimeMultiplayerSendBulletin

- (GKRealTimeMultiplayerSendBulletin)initWithPushNotification:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin initWithPushNotification:",  buf,  2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerSendBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithPushNotification:](&v16, "initWithPushNotification:", v5);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientDictionary](v8, "clientDictionary"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"bundle-id"]);
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"y"]);
    sendReason = v9->_sendReason;
    v9->_sendReason = (NSNumber *)v13;
  }

  return v9;
}

- (GKRealTimeMultiplayerSendBulletin)initWithCoder:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin initWithCoder:",  buf,  2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerSendBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithCoder:](&v16, "initWithCoder:", v5);
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleIdentifier"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v10;

    id v12 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"sendReason"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    sendReason = v8->_sendReason;
    v8->_sendReason = (NSNumber *)v13;
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKRealTimeMultiplayerBulletin encodeWithCoder:",  buf,  2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GKRealTimeMultiplayerSendBulletin;
  -[GKRealTimeMultiplayerBulletin encodeWithCoder:](&v10, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerSendBulletin bundleIdentifier](self, "bundleIdentifier"));
  [v5 encodeObject:v8 forKey:@"bundleIdentifier"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerSendBulletin sendReason](self, "sendReason"));
  [v5 encodeObject:v9 forKey:@"sendReason"];
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRealTimeMultiplayerBulletin.m",  1180LL,  "+[GKRealTimeMultiplayerSendBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10011D4D4;
  v10[3] = &unk_10026B310;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v7, v10);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSNumber)sendReason
{
  return (NSNumber *)objc_getProperty(self, a2, 376LL, 1);
}

- (void)setSendReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end