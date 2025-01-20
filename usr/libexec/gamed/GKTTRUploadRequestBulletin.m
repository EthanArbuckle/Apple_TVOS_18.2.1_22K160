@interface GKTTRUploadRequestBulletin
+ (id)packFakeTTRBulletinWithInfo:(id)a3;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKTTRUploadRequestBulletin)initWithPushNotification:(id)a3;
- (NSString)radarID;
- (NSString)requesterPlayerAlias;
- (void)assembleBulletin;
- (void)setRadarID:(id)a3;
- (void)setRequesterPlayerAlias:(id)a3;
@end

@implementation GKTTRUploadRequestBulletin

+ (id)packFakeTTRBulletinWithInfo:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTTRUploadRequestBulletin: packFakeTTRBulletinWithInfo",  buf,  2u);
  }

  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___GKTTRUploadRequestBulletin;
  id v8 = objc_msgSendSuper2(&v24, "packFakeTTRBulletinWithInfo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 mutableCopy];

  [v10 setObject:&off_100287AF0 forKeyedSubscript:GKPushCommandKey];
  uint64_t v11 = GKTTRBulletinKeyRadarID;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeyRadarID]);
  v13 = (void *)v12;
  v14 = @"UnknownID";
  if (v12) {
    v14 = (__CFString *)v12;
  }
  v15 = v14;

  uint64_t v16 = GKTTRBulletinKeyRequesterPlayerAlias;
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeyRequesterPlayerAlias]);
  v18 = (void *)v17;
  v19 = @"UnknownAlias";
  if (v17) {
    v19 = (__CFString *)v17;
  }
  v20 = v19;

  [v10 setObject:v15 forKeyedSubscript:v11];
  [v10 setObject:v20 forKeyedSubscript:v16];
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ has requested your logs. Tap here to upload your sysdiagnose to radar://%@",  v20,  v15));

  [v10 setObject:v21 forKeyedSubscript:GKTTRBulletinKeySubtitle];
  id v22 = [v10 copy];

  return v22;
}

- (GKTTRUploadRequestBulletin)initWithPushNotification:(id)a3
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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTTRUploadRequestBulletin: initWithPushNotification",  buf,  2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKTTRUploadRequestBulletin;
  id v8 = -[GKTTRBulletin initWithPushNotification:](&v12, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeyRadarID]);
    -[GKTTRUploadRequestBulletin setRadarID:](v8, "setRadarID:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeyRequesterPlayerAlias]);
    -[GKTTRUploadRequestBulletin setRequesterPlayerAlias:](v8, "setRequesterPlayerAlias:", v10);
  }

  return v8;
}

- (void)assembleBulletin
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKTTRUploadRequestBulletin;
  -[GKTTRBulletin assembleBulletin](&v3, "assembleBulletin");
  -[GKBulletin setCategoryIdentifier:]( self,  "setCategoryIdentifier:",  @"GKNotificationCategoryActionsTTRUploadRequest");
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
    *(_WORD *)objc_super v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKTTRBulletin: loadBulletinsForPushNotification",  v12,  2u);
  }

  id v10 = -[GKTTRUploadRequestBulletin initWithPushNotification:]( objc_alloc(&OBJC_CLASS___GKTTRUploadRequestBulletin),  "initWithPushNotification:",  v5);
  -[GKTTRUploadRequestBulletin assembleBulletin](v10, "assembleBulletin");
  v13 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  ((void (**)(void, void *))v7)[2](v7, v11);
}

- (NSString)radarID
{
  return self->_radarID;
}

- (void)setRadarID:(id)a3
{
}

- (NSString)requesterPlayerAlias
{
  return self->_requesterPlayerAlias;
}

- (void)setRequesterPlayerAlias:(id)a3
{
}

- (void).cxx_destruct
{
}

@end