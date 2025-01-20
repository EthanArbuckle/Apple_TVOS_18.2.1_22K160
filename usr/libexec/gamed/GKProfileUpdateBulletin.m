@interface GKProfileUpdateBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKProfileUpdateBulletin

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
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKProfileUpdateBulletin loadBulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v10 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountProfileUpdate];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"i"]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletin cacheTransactionGroup](&OBJC_CLASS___GKBulletin, "cacheTransactionGroup"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001091F0;
    v15[3] = &unk_10026B608;
    id v16 = v11;
    id v17 = v5;
    [v12 performOnManagedObjectContext:v15];
    if (v7) {
      v7[2](v7, 0LL);
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers(0LL);
    }
    v14 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100109E8C(v14);
    }
  }
}

@end