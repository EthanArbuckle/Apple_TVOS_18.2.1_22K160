@interface TCCUserNotificationDelegate
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation TCCUserNotificationDelegate

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(void))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 content]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"TCCServiceName"]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceByName:v12]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 notificationActionURL]);

  id v16 = tcc_access_log();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v19 = 138543618;
    v20 = v12;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "user responded to notification for %{public}@ with %{public}@",  (uint8_t *)&v19,  0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 actionIdentifier]);
  [v18 isEqual:@"BUTTON_ACTION_ID"];

  v7[2](v7);
}

@end