@interface GKContactsIntegrationBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKContactsIntegrationBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v5 = (void (**)(id, void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:GKPushCommandKey]);
  __int16 v7 = (unsigned __int16)[v6 integerValue];

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  v10 = (os_log_s *)os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
  {
    sub_100128430(v7, v10);
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (v5) {
LABEL_5:
  }
    v5[2](v5, 0LL);
LABEL_6:
}

@end