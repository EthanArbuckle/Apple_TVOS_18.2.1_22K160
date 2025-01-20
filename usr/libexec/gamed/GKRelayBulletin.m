@interface GKRelayBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKRelayBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKRelayBulletin loadBulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v11 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountRelay];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100108EF8;
  v13[3] = &unk_10026B670;
  id v12 = v6;
  id v14 = v12;
  [a1 performAsync:v13];
  if (v8) {
    v8[2](v8, 0LL);
  }
}

@end