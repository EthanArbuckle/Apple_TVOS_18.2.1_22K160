@interface GKBulletinAction
+ (BOOL)supportsSecureCoding;
- (BOOL)inAlertView;
- (BOOL)inBannerView;
- (BOOL)isDestructive;
- (GKBulletinAction)init;
- (GKBulletinAction)initWithCoder:(id)a3;
- (GKBulletinAction)initWithDictionary:(id)a3;
- (NSDictionary)actionDictionary;
- (NSNumber)adamID;
- (NSString)bundleID;
- (NSString)info;
- (NSString)playerID;
- (NSString)title;
- (id)appLaunchTrampolineURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setInAlertView:(BOOL)a3;
- (void)setInBannerView:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setIsDestructive:(BOOL)a3;
- (void)setPlayerID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation GKBulletinAction

- (GKBulletinAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKBulletinAction;
  result = -[GKBulletinAction init](&v3, "init");
  if (result) {
    *(_WORD *)&result->_inAlertView = 257;
  }
  return result;
}

- (GKBulletinAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[GKBulletinAction init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"type"]);
    v5->_type = (int64_t)[v6 integerValue];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"info"]);
    info = v5->_info;
    v5->_info = (NSString *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"adamID"]);
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"bundleID"]);
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"playerID"]);
    playerID = v5->_playerID;
    v5->_playerID = (NSString *)v13;
  }

  return v5;
}

- (GKBulletinAction)initWithCoder:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinAction initWithCoder:", buf, 2u);
  }

  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___GKBulletinAction;
  v8 = -[GKBulletinAction init](&v33, "init");
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"type"];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_type = (int64_t)[v10 integerValue];

    id v11 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"title"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    title = v8->_title;
    v8->_title = (NSString *)v12;

    id v14 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"info"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    info = v8->_info;
    v8->_info = (NSString *)v15;

    id v17 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"adamID"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    adamID = v8->_adamID;
    v8->_adamID = (NSNumber *)v18;

    id v20 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v21;

    id v23 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"playerID"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    playerID = v8->_playerID;
    v8->_playerID = (NSString *)v24;

    id v26 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"isDestructive"];
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v8->_isDestructive = [v27 BOOLValue];

    id v28 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"inAlertView"];
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v8->_inAlertView = [v29 BOOLValue];

    id v30 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"inBannerView"];
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v8->_inBannerView = [v31 BOOLValue];
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
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinAction encodeWithCoder:", v17, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKBulletinAction type](self, "type")));
  [v5 encodeObject:v8 forKey:@"type"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction title](self, "title"));
  [v5 encodeObject:v9 forKey:@"title"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
  [v5 encodeObject:v10 forKey:@"info"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
  [v5 encodeObject:v11 forKey:@"adamID"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));
  [v5 encodeObject:v12 forKey:@"bundleID"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction playerID](self, "playerID"));
  [v5 encodeObject:v13 forKey:@"playerID"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKBulletinAction isDestructive](self, "isDestructive")));
  [v5 encodeObject:v14 forKey:@"isDestructive"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKBulletinAction inAlertView](self, "inAlertView")));
  [v5 encodeObject:v15 forKey:@"inAlertView"];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKBulletinAction inBannerView](self, "inBannerView")));
  [v5 encodeObject:v16 forKey:@"inBannerView"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[GKBulletinAction init]( +[GKBulletinAction allocWithZone:](&OBJC_CLASS___GKBulletinAction, "allocWithZone:", a3),  "init");
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_info, self->_info);
  objc_storeStrong((id *)&v4->_title, self->_title);
  objc_storeStrong((id *)&v4->_adamID, self->_adamID);
  objc_storeStrong((id *)&v4->_bundleID, self->_bundleID);
  objc_storeStrong((id *)&v4->_playerID, self->_playerID);
  v4->_isDestructive = self->_isDestructive;
  v4->_inBannerView = self->_inBannerView;
  v4->_inAlertView = self->_inAlertView;
  return v4;
}

- (NSDictionary)actionDictionary
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinAction actionDictionary", v16, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[GKBulletinAction type](self, "type")));
  [v5 setObject:v6 forKey:@"type"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
    [v5 setObject:v8 forKey:@"info"];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
    [v5 setObject:v10 forKey:@"adamID"];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));
    [v5 setObject:v12 forKey:@"bundleID"];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction playerID](self, "playerID"));

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction playerID](self, "playerID"));
    [v5 setObject:v14 forKey:@"playerID"];
  }

  return (NSDictionary *)v5;
}

- (id)description
{
  int64_t v3 = -[GKBulletinAction type](self, "type");
  id v4 = @"NO TYPE";
  if (!v3) {
    id v4 = @"NoAction";
  }
  if (v3 == 1) {
    v5 = @"LaunchTrampoline";
  }
  else {
    v5 = v4;
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___GKBulletinAction;
  id v6 = -[GKBulletinAction description](&v15, "description");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction title](self, "title"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
  else {
    v10 = @"NO";
  }
  if (-[GKBulletinAction inBannerView](self, "inBannerView")) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  if (-[GKBulletinAction inAlertView](self, "inAlertView")) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v7 stringByAppendingFormat:@"\n\ttitle:%@\n\ttype:%@\n\tinfo:%@\n\tisDestructive:%@\n\tinBannerView:%@\n\tinAlertView:%@", v8, v5, v9, v10, v11, v12]);

  return v13;
}

- (id)appLaunchTrampolineURL
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
  if (v3
    && (id v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID")),
        v5,
        v4,
        v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[ASCAppLaunchTrampolineURL URLWithAdamId:bundleId:localizedName:sourceApplication:topic:]( &OBJC_CLASS___ASCAppLaunchTrampolineURL,  "URLWithAdamId:bundleId:localizedName:sourceApplication:topic:",  v7,  v8,  0LL,  v10,  0LL));
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v3);
    }
    uint64_t v13 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100106ED4(v13, self);
    }
    id v11 = 0LL;
  }

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)info
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInfo:(id)a3
{
}

- (NSNumber)adamID
{
  return (NSNumber *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAdamID:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)playerID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPlayerID:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (BOOL)inAlertView
{
  return self->_inAlertView;
}

- (void)setInAlertView:(BOOL)a3
{
  self->_inAlertView = a3;
}

- (BOOL)inBannerView
{
  return self->_inBannerView;
}

- (void)setInBannerView:(BOOL)a3
{
  self->_inBannerView = a3;
}

- (void).cxx_destruct
{
}

@end