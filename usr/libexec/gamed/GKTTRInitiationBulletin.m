@interface GKTTRInitiationBulletin
+ (id)packFakeTTRBulletinWithInfo:(id)a3;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (void)assembleBulletin;
@end

@implementation GKTTRInitiationBulletin

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
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTTRInitiationBulletin: packFakeTTRBulletinWithInfo",  buf,  2u);
  }

  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___GKTTRInitiationBulletin;
  id v8 = objc_msgSendSuper2(&v17, "packFakeTTRBulletinWithInfo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 mutableCopy];

  [v10 setObject:&off_100287AD8 forKeyedSubscript:GKPushCommandKey];
  uint64_t v11 = GKTTRBulletinKeySubtitle;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:GKTTRBulletinKeySubtitle]);
  v13 = (void *)v12;
  if (v12) {
    v14 = (const __CFString *)v12;
  }
  else {
    v14 = @"Did you encounter any issues? Tap here to file a radar.";
  }
  [v10 setObject:v14 forKeyedSubscript:v11];

  id v15 = [v10 copy];
  return v15;
}

- (void)assembleBulletin
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKTTRInitiationBulletin;
  -[GKTTRBulletin assembleBulletin](&v3, "assembleBulletin");
  -[GKBulletin setCategoryIdentifier:]( self,  "setCategoryIdentifier:",  @"GKNotificationCategoryActionsTTRInitiation");
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
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKTTRBulletin: loadBulletinsForPushNotification",  v12,  2u);
  }

  id v10 = -[GKTTRBulletin initWithPushNotification:]( objc_alloc(&OBJC_CLASS___GKTTRInitiationBulletin),  "initWithPushNotification:",  v5);
  -[GKTTRInitiationBulletin assembleBulletin](v10, "assembleBulletin");
  v13 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  ((void (**)(void, void *))v7)[2](v7, v11);
}

@end